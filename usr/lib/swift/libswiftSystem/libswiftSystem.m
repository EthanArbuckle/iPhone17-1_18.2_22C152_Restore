uint64_t destroy for FilePath.Root()
{
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void protocol witness for Collection.endIndex.getter in conformance FilePath.ComponentView(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)v1 + 16) - 1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.ComponentView.Index(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t getEnumTagSinglePayload for FilePath.Component(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

ValueMetadata *type metadata accessor for FilePath.Component()
{
  return &type metadata for FilePath.Component;
}

ValueMetadata *type metadata accessor for FilePath()
{
  return &type metadata for FilePath;
}

ValueMetadata *type metadata accessor for FilePath.ComponentView()
{
  return &type metadata for FilePath.ComponentView;
}

ValueMetadata *type metadata accessor for FilePath.ComponentView.Index()
{
  return &type metadata for FilePath.ComponentView.Index;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance FilePath.ComponentView(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v2;
}

ValueMetadata *type metadata accessor for FilePath.Root()
{
  return &type metadata for FilePath.Root;
}

uint64_t FilePath.string.getter()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = String.init(cString:)();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t (*FilePath.components.modify(uint64_t (*result)(uint64_t a1)))(uint64_t a1)
{
  uint64_t v2 = (size_t *)result;
  *((void *)result + 2) = v1;
  size_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (v4 == 1) {
    goto LABEL_6;
  }
  if (!v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned char *)(v3 + 32) != 47)
  {
LABEL_6:
    BOOL v5 = 0;
    __n128 result = (uint64_t (*)(uint64_t))&outlined read-only object #0 of FilePath.components.modify;
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  __n128 result = (uint64_t (*)(uint64_t))specialized SystemString.init<A>(_:)(0, 1uLL, v3);
  if (*(void *)(v3 + 16))
  {
    BOOL v5 = *(unsigned __int8 *)(v3 + 32) == 47;
LABEL_7:
    v2[3] = (size_t)result;
    *uint64_t v2 = v3;
    v2[1] = v5;
    *uint64_t v1 = (size_t)&outlined read-only object #1 of FilePath.components.modify;
    return FilePath.components.modify;
  }
LABEL_9:
  __break(1u);
  return result;
}

void *initializeBufferWithCopyOfBuffer for FilePath.Root(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for FilePath.Component(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t protocol witness for RangeReplaceableCollection.replaceSubrange<A>(_:with:) in conformance FilePath.ComponentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  FilePath.ComponentView.replaceSubrange<A>(_:with:)(a1, a2, a3, a4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8);

  return v6(a2, a3);
}

uint64_t FilePath.ComponentView.replaceSubrange<A>(_:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v5 = v4;
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t result = MEMORY[0x270FA5388](a1);
  v12 = (char *)&v23[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t v13 = *v5;
  if (v5[1] == *(void *)(*v5 + 16) - 1)
  {
    if ((unint64_t)SystemString._parseRoot()().relativeBegin)
    {
      Swift::Int relativeBegin = SystemString._parseRoot()().relativeBegin;
      swift_bridgeObjectRetain();
      size_t v15 = v13;
    }
    else
    {
      size_t v15 = 0;
      Swift::Int relativeBegin = 0;
    }
    v23[0] = v15;
    v23[1] = relativeBegin;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a2, a3);
    FilePath.init<A>(root:_:)(v23, (uint64_t)v12, a3, a4, &v24);
    uint64_t result = swift_bridgeObjectRelease();
    *BOOL v5 = v24;
    return result;
  }
  unint64_t v17 = *(void *)result;
  int64_t v16 = *(void *)(result + 8);
  if (v16 < *(void *)result)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if ((dispatch thunk of Collection.isEmpty.getter() & 1) == 0)
  {
    v23[0] = (size_t)&outlined read-only object #0 of FilePath.ComponentView.replaceSubrange<A>(_:with:);
    if (v17 == *(void *)(v13 + 16) - 1)
    {
      specialized Array.replaceSubrange<A>(_:with:)(0, 0, 47);
      SystemString.appendComponents<A>(components:)(a2, a3, a4);
    }
    else
    {
      SystemString.appendComponents<A>(components:)(a2, a3, a4);
      specialized Array.replaceSubrange<A>(_:with:)(*(void *)(v23[0] + 16) - 1, *(void *)(v23[0] + 16) - 1, 47);
    }
    specialized Array.replaceSubrange<A>(_:with:)(v17, v16, v23[0]);
    return swift_bridgeObjectRelease();
  }
  uint64_t v18 = *(void *)(v13 + 16) - 1;
  uint64_t result = specialized Array.replaceSubrange<A>(_:with:)(v17, v16);
  if (v16 != v18) {
    return result;
  }
  uint64_t v19 = *v5;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v20 = SystemString._parseRoot()();
  uint64_t result = v20.rootEnd;
  if (v20.relativeBegin == *(void *)(v19 + 16) - 1) {
    return result;
  }
  uint64_t result = specialized BidirectionalCollection.last.getter(v19);
  if ((result & 0x100) != 0)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  if (result != 47) {
    return result;
  }
  uint64_t v21 = *(void *)(v19 + 16);
  if (v21 == 1) {
    goto LABEL_23;
  }
  if (!v21)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  return specialized RangeReplaceableCollection.remove(at:)(v21 - 2);
}

unint64_t FilePath.append(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (char *)a1[2];
  if ((char *)v3 != v4)
  {
    unint64_t v5 = *(void *)(*(void *)v1 + 16);
    unint64_t result = v5 - 1;
    if (v5 != 1)
    {
      if (v5 < 2)
      {
        __break(1u);
        return result;
      }
      if (*(unsigned char *)(v5 + *(void *)v1 + 30) != 47) {
        specialized Array.replaceSubrange<A>(_:with:)(result, v5 - 1, 47);
      }
    }
    specialized RangeReplaceableCollection.append<A>(contentsOf:)(v3, v4, v2);
  }

  return swift_bridgeObjectRelease();
}

unint64_t specialized Array.replaceSubrange<A>(_:with:)(unint64_t result, int64_t a2, char a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  unint64_t v5 = *v3;
  int64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v7 = result;
  unint64_t v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v10 > *(void *)(v5 + 24) >> 1)
  {
    if (v6 <= v10) {
      int64_t v12 = v6 + v9;
    }
    else {
      int64_t v12 = v6;
    }
    unint64_t result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v12, 1, (char *)v5);
    unint64_t v5 = result;
  }
  unint64_t v13 = v5 + 32;
  v14 = (unsigned char *)(v5 + 32 + v7);
  if (!v9) {
    goto LABEL_19;
  }
  uint64_t v15 = *(void *)(v5 + 16);
  size_t v16 = v15 - a2;
  if (__OFSUB__(v15, a2)) {
    goto LABEL_25;
  }
  unint64_t result = (unint64_t)(v14 + 1);
  unint64_t v17 = (const void *)(v13 + a2);
  if (v14 + 1 != (unsigned char *)(v13 + a2) || result >= (unint64_t)v17 + v16) {
    unint64_t result = (unint64_t)memmove((void *)result, v17, v16);
  }
  uint64_t v18 = *(void *)(v5 + 16);
  BOOL v19 = __OFADD__(v18, v9);
  uint64_t v20 = v18 + v9;
  if (!v19)
  {
    *(void *)(v5 + 16) = v20;
LABEL_19:
    unsigned char *v14 = a3;
    *uint64_t v3 = v5;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

unint64_t specialized Array.replaceSubrange<A>(_:with:)(unint64_t result, int64_t a2, uint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v5 = *v3;
  int64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v7 = result;
  unint64_t v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v10 = *(void *)(a3 + 16);
  if (!v10)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v11 = v10 - 1;
  unint64_t v12 = v10 - 1 - v8;
  if (__OFSUB__(v10 - 1, v8))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  int64_t v13 = v6 + v12;
  if (__OFADD__(v6, v12))
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    return result;
  }
  unint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v13 > *(void *)(v5 + 24) >> 1)
  {
    if (v6 <= v13) {
      int64_t v14 = v6 + v12;
    }
    else {
      int64_t v14 = v6;
    }
    unint64_t result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v14, 1, (char *)v5);
    unint64_t v5 = result;
  }
  unint64_t v15 = v5 + 32;
  size_t v16 = (char *)(v5 + 32 + v7);
  if (!v12) {
    goto LABEL_20;
  }
  uint64_t v17 = *(void *)(v5 + 16);
  size_t v18 = v17 - a2;
  if (__OFSUB__(v17, a2)) {
    goto LABEL_29;
  }
  unint64_t result = (unint64_t)&v16[v11];
  BOOL v19 = (const void *)(v15 + a2);
  if (&v16[v11] != (char *)(v15 + a2) || result >= (unint64_t)v19 + v18) {
    unint64_t result = (unint64_t)memmove((void *)result, v19, v18);
  }
  uint64_t v20 = *(void *)(v5 + 16);
  BOOL v21 = __OFADD__(v20, v12);
  uint64_t v22 = v20 + v12;
  if (v21) {
    goto LABEL_30;
  }
  *(void *)(v5 + 16) = v22;
LABEL_20:
  if (v10 >= 2) {
    unint64_t result = (unint64_t)memcpy(v16, (const void *)(a3 + 32), v10 - 1);
  }
  *uint64_t v3 = v5;
  return result;
}

size_t FilePath.init(root:components:)@<X0>(size_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  size_t result = specialized FilePath.init<A>(root:_:)(*a1, a1[1], a2, &v5);
  *a3 = v5;
  return result;
}

uint64_t $defer #1 <A>() in SystemString.appendComponents<A>(components:)(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (SystemString._parseRoot()().relativeBegin != *(void *)(v1 + 16) - 1)
  {
    uint64_t result = specialized BidirectionalCollection.last.getter(v1);
    if ((result & 0x100) != 0) {
      goto LABEL_12;
    }
    if (result == 47)
    {
      uint64_t v3 = *(void *)(v1 + 16);
      if (v3 == 1)
      {
        __break(1u);
      }
      else if (v3)
      {
        specialized RangeReplaceableCollection.remove(at:)(v3 - 2);
        goto LABEL_7;
      }
      __break(1u);
LABEL_12:
      __break(1u);
      return result;
    }
  }
LABEL_7:
  swift_bridgeObjectRetain();
  SystemString._normalizeSeparators()();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Collection.index(after:) in conformance FilePath.ComponentView@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::tuple_componentEnd_Int_nextStart_Int v4 = FilePath._parseComponent(startingAt:)(*a1);
  Swift::Int result = v4.componentEnd;
  *a2 = v4.nextStart;
  return result;
}

size_t FilePath.Component.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void *)__s;
    goto LABEL_9;
  }
  MEMORY[0x270FA5388](a1);
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((v5 & 0x1000000000000000) != 0)
    {
      uint64_t v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v7 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v6 = _StringObject.sharedUTF8.getter();
    }
    uint64_t v8 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v6, v7, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  *(void *)__s = v5;
  *(void *)&__s[8] = a2 & 0xFFFFFFFFFFFFFFLL;
  size_t result = strlen(__s);
  if (!__OFADD__(result, 1))
  {
    uint64_t v8 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, result + 1);
    swift_bridgeObjectRelease();
LABEL_9:
    size_t result = FilePath.Component.init(_:)(v8, (uint64_t *)__s);
    uint64_t v10 = v12;
    *(_OWORD *)a3 = *(_OWORD *)__s;
    *(void *)(a3 + 16) = v10;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t FilePath.Component.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  SystemString._normalizeSeparators()();
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = v3 - 1;
  if (v3 != 1)
  {
    if (!v3)
    {
      __break(1u);
      goto LABEL_16;
    }
    if (*(unsigned char *)(a1 + 32) == 47) {
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = specialized BidirectionalCollection._distance(from:to:)(0, v3 - 1, a1);
  swift_bridgeObjectRelease();
  if (v5 != 1)
  {
LABEL_10:
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    return result;
  }
  if (!v4) {
    goto LABEL_19;
  }
  if (!*(void *)(a1 + 16))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (*(unsigned char *)(a1 + 32) != 47)
  {
    Swift::Int v6 = 0;
LABEL_12:
    uint64_t result = FilePath._parseComponent(startingAt:)(v6).componentEnd;
    if (result >= v6)
    {
      if (v6 != result)
      {
        *a2 = a1;
        a2[1] = v6;
        a2[2] = result;
        return result;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v4 != 1)
  {
    Swift::Int v6 = 1;
    goto LABEL_12;
  }
LABEL_19:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance FilePath.ComponentView(void *a1, Swift::Int *a2))()
{
  Swift::Int v4 = *a2;
  uint64_t v5 = *v2;
  uint64_t result = (uint64_t (*)())FilePath._parseComponent(startingAt:)(*a2).componentEnd;
  if ((uint64_t)result < v4)
  {
    __break(1u);
  }
  else if ((uint64_t (*)())v4 != result)
  {
    *a1 = v5;
    a1[1] = v4;
    a1[2] = result;
    swift_bridgeObjectRetain();
    return destroy for FilePath.Root;
  }
  __break(1u);
  return result;
}

Swift::Int protocol witness for Collection.formIndex(after:) in conformance FilePath.ComponentView(Swift::Int *a1)
{
  Swift::tuple_componentEnd_Int_nextStart_Int v3 = FilePath._parseComponent(startingAt:)(*a1);
  Swift::Int result = v3.componentEnd;
  *a1 = v3.nextStart;
  return result;
}

Swift::tuple_componentEnd_Int_nextStart_Int __swiftcall FilePath._parseComponent(startingAt:)(Swift::Int startingAt)
{
  Swift::Int v2 = startingAt;
  uint64_t v3 = *v1;
  Swift::Int v4 = *(void *)(*v1 + 16);
  if (startingAt || v4 == 1) {
    goto LABEL_6;
  }
  if (!v4)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (*(unsigned char *)(v3 + 32) != 47)
  {
LABEL_6:
    if (v4 > startingAt && v4 != 0)
    {
      if (startingAt < 0)
      {
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      Swift::Int v6 = v4 - 1;
      if (v6 == startingAt) {
        goto LABEL_23;
      }
      uint64_t v7 = v3 + 32;
      while (startingAt >= v2 && startingAt < v6)
      {
        Swift::Int v8 = startingAt + 1;
        if (*(unsigned char *)(v7 + startingAt) == 47)
        {
          Swift::Int v2 = startingAt + 1;
          goto LABEL_23;
        }
        ++startingAt;
        if (v6 == v8)
        {
          startingAt = v6;
          Swift::Int v2 = v6;
          goto LABEL_23;
        }
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }
  startingAt = 1;
  Swift::Int v2 = 1;
LABEL_23:
  result.nextStart = v2;
  result.componentEnd = startingAt;
  return result;
}

uint64_t specialized BidirectionalCollection._distance(from:to:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < a2)
  {
    Swift::Int v4 = (unsigned char *)(a3 + 32);
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = v5 - 1;
    uint64_t v7 = 1;
    while (1)
    {
      if (!result && v5 != 1)
      {
        if (!v5) {
          goto LABEL_46;
        }
        if (*v4 == 47)
        {
          if (a2 == 1) {
            return v7;
          }
          uint64_t v8 = 1;
          goto LABEL_5;
        }
      }
      if (v5 <= result || !v5) {
        goto LABEL_40;
      }
      if (result < 0) {
        goto LABEL_41;
      }
      if (result == v6)
      {
        uint64_t v8 = result;
      }
      else
      {
        if (result >= (unint64_t)v6) {
          goto LABEL_43;
        }
        if (result >= (unint64_t)v5) {
          goto LABEL_44;
        }
        if (v4[result] == 47) {
          goto LABEL_30;
        }
        uint64_t v8 = v5 - 1;
        if (result + 1 != v6)
        {
          uint64_t v10 = result;
          while (1)
          {
            if (v10 + 1 < result || v10 + 1 >= v6)
            {
              __break(1u);
              goto LABEL_39;
            }
            if (*(unsigned char *)(a3 + 33 + v10) == 47) {
              break;
            }
            if (v5 - 2 == ++v10)
            {
              uint64_t v8 = v5 - 1;
              goto LABEL_4;
            }
          }
          Swift::tuple_componentEnd_Int_nextStart_Int result = v10 + 1;
LABEL_30:
          if (result >= v6) {
            goto LABEL_45;
          }
          uint64_t v8 = result + 1;
        }
      }
LABEL_4:
      if (v8 == a2) {
        return v7;
      }
LABEL_5:
      Swift::tuple_componentEnd_Int_nextStart_Int result = v8;
      BOOL v9 = __OFADD__(v7++, 1);
      if (v9)
      {
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        return result;
      }
    }
  }
  if (a2 >= result) {
    return 0;
  }
  uint64_t v7 = 0;
  do
  {
    BOOL v9 = __OFSUB__(v7--, 1);
    if (v9) {
      goto LABEL_42;
    }
    Swift::tuple_componentEnd_Int_nextStart_Int result = FilePath._parseComponent(priorTo:)(result);
  }
  while (result != a2);
  return v7;
}

size_t specialized FilePath.init<A>(root:_:)@<X0>(size_t result@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  if (result)
  {
    if ((a2 & 0x8000000000000000) != 0)
    {
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      __break(1u);
      __break(1u);
      goto LABEL_38;
    }
    Swift::tuple_componentEnd_Int_nextStart_Int result = specialized SystemString.init<A>(_:)(0, a2, result);
    uint64_t v6 = (char *)result;
  }
  else
  {
    uint64_t v6 = (char *)&outlined read-only object #0 of specialized FilePath.init<A>(root:_:);
  }
  v25 = v6;
  uint64_t v7 = *(void *)(a3 + 16);
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v24 = a4;
    do
    {
      if (v8 >= *(void *)(a3 + 16)) {
        goto LABEL_34;
      }
      unint64_t v11 = (uint64_t *)(a3 + 32 + 24 * v8);
      uint64_t v13 = *v11;
      uint64_t v12 = v11[1];
      uint64_t v14 = v11[2];
      uint64_t v15 = v14 - v12;
      if (v14 != v12)
      {
        size_t v18 = (char *)(v13 + 32 + v12);
        unint64_t v19 = *((void *)v6 + 2);
        Swift::tuple_componentEnd_Int_nextStart_Int result = swift_bridgeObjectRetain();
        while (v19)
        {
          char v21 = *v18;
          isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
          if (!isUniquelyReferenced_nonNull_native || v19 >= *((void *)v6 + 3) >> 1) {
            uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v19 + 1, 1, v6);
          }
          uint64_t v20 = &v6[v19 + 31];
          Swift::tuple_componentEnd_Int_nextStart_Int result = (size_t)memmove(&v6[v19 + 32], v20, *((void *)v6 + 2) - (v19 - 1));
          unint64_t v19 = *((void *)v6 + 2) + 1;
          *((void *)v6 + 2) = v19;
          *uint64_t v20 = v21;
          ++v18;
          if (!--v15) {
            goto LABEL_12;
          }
        }
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      swift_bridgeObjectRetain();
LABEL_12:
      Swift::tuple_componentEnd_Int_nextStart_Int result = swift_bridgeObjectRelease();
      unint64_t v16 = *((void *)v6 + 2);
      if (!v16) {
        goto LABEL_35;
      }
      uint64_t v17 = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!v17 || v16 >= *((void *)v6 + 3) >> 1) {
        uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v17, v16 + 1, 1, v6);
      }
      ++v8;
      BOOL v9 = &v6[v16 + 31];
      Swift::tuple_componentEnd_Int_nextStart_Int result = (size_t)memmove(&v6[v16 + 32], v9, *((void *)v6 + 2) - (v16 - 1));
      uint64_t v10 = *((void *)v6 + 2) + 1;
      *((void *)v6 + 2) = v10;
      *BOOL v9 = 47;
    }
    while (v8 != v7);
    v25 = v6;
    a4 = v24;
    uint64_t v23 = v10 - 1;
    if (v10 != 1) {
      goto LABEL_26;
    }
    goto LABEL_32;
  }
  uint64_t v10 = *((void *)v6 + 2);
  uint64_t v23 = v10 - 1;
  if (v10 == 1)
  {
LABEL_32:
    swift_bridgeObjectRetain();
    SystemString._normalizeSeparators()();
    swift_bridgeObjectRelease();
    SystemString._normalizeSeparators()();
    Swift::tuple_componentEnd_Int_nextStart_Int result = swift_bridgeObjectRelease();
    *a4 = v6;
    return result;
  }
LABEL_26:
  if (!v10) {
    goto LABEL_37;
  }
  if (v6[32] == 47 && v23 == 1) {
    goto LABEL_32;
  }
  Swift::tuple_componentEnd_Int_nextStart_Int result = specialized BidirectionalCollection.last.getter((uint64_t)v6);
  if ((result & 0x100) == 0)
  {
    if (result == 47)
    {
      specialized RangeReplaceableCollection.remove(at:)(v10 - 2);
      uint64_t v6 = v25;
    }
    goto LABEL_32;
  }
LABEL_38:
  __break(1u);
  return result;
}

Swift::Void __swiftcall SystemString._normalizeSeparators()()
{
  uint64_t v1 = *v0;
  unint64_t v2 = *((void *)*v0 + 2);
  if (v2 == 1) {
    return;
  }
  if (!v2) {
    goto LABEL_55;
  }
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  while (1)
  {
    if (v2 <= v3)
    {
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    int v5 = v1[v3 + 32];
    if (v4 != v3)
    {
      if (v2 <= v4) {
        goto LABEL_46;
      }
      char v6 = v1[v4 + 32];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v1 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v1);
      }
      unint64_t v7 = *((void *)v1 + 2);
      if (v4 >= v7) {
        goto LABEL_47;
      }
      v1[v4 + 32] = v5;
      *uint64_t v0 = v1;
      if (v7 <= v3) {
        goto LABEL_48;
      }
      v1[v3 + 32] = v6;
      *uint64_t v0 = v1;
      unint64_t v2 = *((void *)v1 + 2);
    }
    int64_t v8 = v2 - 1;
    if ((uint64_t)v3 >= (uint64_t)(v2 - 1) || (uint64_t)v4 >= v8) {
      goto LABEL_45;
    }
    ++v4;
    unint64_t v9 = v3 + 1;
    if (v5 == 47 && (uint64_t)v9 < v8)
    {
      if (v9 >= v2) {
        goto LABEL_49;
      }
      if (v1[v9 + 32] == 47) {
        break;
      }
    }
LABEL_4:
    unint64_t v3 = v9;
    if ((uint64_t)v9 >= v8) {
      goto LABEL_26;
    }
  }
  while (v2 - 3 != v3)
  {
    int v11 = v1[v3++ + 34];
    if (v11 != 47)
    {
      unint64_t v9 = v3 + 1;
      goto LABEL_4;
    }
  }
  unint64_t v9 = v2 - 1;
LABEL_26:
  if (v4 >= v2 || v9 >= v2)
  {
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
    return;
  }
  unint64_t v12 = v9 - v4;
  if (!v12) {
    goto LABEL_33;
  }
  if ((v12 & 0x8000000000000000) != 0) {
    goto LABEL_50;
  }
  int64_t v13 = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(v2 - 1, -(uint64_t)v12, 0, (uint64_t)v1);
  if (v14) {
    goto LABEL_56;
  }
  if ((uint64_t)v2 <= v13) {
    goto LABEL_51;
  }
  specialized Array.replaceSubrange<A>(_:with:)(v13, v2 - 1);
  uint64_t v1 = *v0;
  unint64_t v2 = *((void *)*v0 + 2);
LABEL_33:
  if (v2 == 1) {
    return;
  }
  if (!v2) {
    goto LABEL_52;
  }
  if ((v1[32] == 47) == v2 - 1) {
    return;
  }
  __int16 v15 = specialized BidirectionalCollection.last.getter((uint64_t)v1);
  if ((v15 & 0x100) != 0) {
    goto LABEL_57;
  }
  if (v15 != 47) {
    return;
  }
  uint64_t v16 = *((void *)v1 + 2);
  if (v16 == 1) {
    goto LABEL_53;
  }
  if (!v16)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }

  specialized RangeReplaceableCollection.remove(at:)(v16 - 2);
}

uint64_t specialized BidirectionalCollection.last.getter(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1 == 1)
  {
    int v2 = 0;
    return v2 | ((v1 == 1) << 8);
  }
  if (v1)
  {
    int v2 = *(unsigned __int8 *)(v1 + result + 30);
    return v2 | ((v1 == 1) << 8);
  }
  __break(1u);
  return result;
}

unint64_t specialized RangeReplaceableCollection.remove(at:)(unint64_t result)
{
  unint64_t v2 = *(void *)(*(void *)v1 + 16);
  if (v2 == 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 - 1 > result)
  {
    uint64_t v3 = *(unsigned __int8 *)(*(void *)v1 + result + 32);
    specialized Array.replaceSubrange<A>(_:with:)(result, result + 1);
    return v3;
  }
LABEL_9:
  __break(1u);
  return result;
}

unint64_t specialized Array.replaceSubrange<A>(_:with:)(unint64_t result, int64_t a2)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v6 = result;
  unint64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  Swift::tuple_componentEnd_Int_nextStart_Int result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *(void *)(v4 + 24) >> 1)
  {
    if (!v8) {
      goto LABEL_20;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v10 = v5 + v8;
    }
    else {
      int64_t v10 = v5;
    }
    Swift::tuple_componentEnd_Int_nextStart_Int result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v10, 1, (char *)v4);
    unint64_t v4 = result;
    if (!v8) {
      goto LABEL_20;
    }
  }
  uint64_t v11 = *(void *)(v4 + 16);
  size_t v12 = v11 - a2;
  if (__OFSUB__(v11, a2)) {
    goto LABEL_26;
  }
  Swift::tuple_componentEnd_Int_nextStart_Int result = v4 + 32 + v6;
  int64_t v13 = (const void *)(v4 + 32 + a2);
  if (v6 != a2 || result >= (unint64_t)v13 + v12) {
    Swift::tuple_componentEnd_Int_nextStart_Int result = (unint64_t)memmove((void *)result, v13, v12);
  }
  uint64_t v14 = *(void *)(v4 + 16);
  BOOL v15 = __OFADD__(v14, v8);
  uint64_t v16 = v14 + v8;
  if (!v15)
  {
    *(void *)(v4 + 16) = v16;
LABEL_20:
    *unint64_t v2 = v4;
    return result;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)@<X0>(void *a1@<X8>)
{
  return partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)(a1);
}

{
  uint64_t v1;
  uint64_t v2;
  void *result;
  uint64_t v5;

  Swift::tuple_componentEnd_Int_nextStart_Int result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

void *closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply@<X0>(void *a1@<X8>)
{
  return _ss11_StringGutsV11withCStringyxxSPys4Int8VGKXEKlFxSRyAEGKXEfU_6System0fA0V_TG5TA_0(a1);
}

System::FilePath __swiftcall FilePath.init(_:)(Swift::String a1)
{
  unint64_t object = (unint64_t)a1._object;
  uint64_t v3 = v1;
  if (((uint64_t)a1._object & 0x1000000000000000) != 0
    || !((uint64_t)a1._object & 0x2000000000000000 | a1._countAndFlagsBits & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)__s;
    goto LABEL_9;
  }
  MEMORY[0x270FA5388](a1._countAndFlagsBits);
  if ((object & 0x2000000000000000) == 0)
  {
    if ((v4 & 0x1000000000000000) != 0)
    {
      uint64_t v5 = (object & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = v4 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v5 = _StringObject.sharedUTF8.getter();
    }
    uint64_t v7 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v5, v6, (uint64_t (*)(void))_ss11_StringGutsV11withCStringyxxSPys4Int8VGKXEKlFxSRyAEGKXEfU_6System0fA0V_TG5TA_0);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  *(void *)__s = v4;
  uint64_t v10 = object & 0xFFFFFFFFFFFFFFLL;
  result._storage.nullTerminatedStorage._rawValue = (void *)strlen(__s);
  if (!__OFADD__(result._storage.nullTerminatedStorage._rawValue, 1))
  {
    uint64_t v7 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, (int64_t)result._storage.nullTerminatedStorage._rawValue + 1);
    swift_bridgeObjectRelease();
LABEL_9:
    *(void *)__s = v7;
    SystemString._normalizeSeparators()();
    *uint64_t v3 = *(void *)__s;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

void *_ss11_StringGutsV11withCStringyxxSPys4Int8VGKXEKlFxSRyAEGKXEfU_6System0fA0V_TG5TA_0@<X0>(void *a1@<X8>)
{
  return specialized closure #1 in _StringGuts.withCString<A>(_:)(*(void *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

void *specialized closure #1 in _StringGuts.withCString<A>(_:)@<X0>(void *(*a1)(uint64_t *__return_ptr)@<X2>, void *a2@<X8>)
{
  uint64_t result = a1(&v5);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t SystemString.appendComponents<A>(components:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v46 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v42 = (char *)&v34 - v8;
  uint64_t v9 = type metadata accessor for Optional();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v34 - v10;
  uint64_t v12 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v12);
  swift_getAssociatedConformanceWitness();
  uint64_t v13 = swift_getAssociatedTypeWitness();
  uint64_t v35 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  BOOL v15 = (char *)&v34 - v14;
  uint64_t v43 = a1;
  dispatch thunk of Collection.indices.getter();
  dispatch thunk of Sequence.makeIterator()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v44 = v15;
  uint64_t v45 = v13;
  uint64_t v41 = AssociatedConformanceWitness;
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v17 = v47;
  v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48);
  uint64_t v40 = v47 + 48;
  if (v39(v11, 1, AssociatedTypeWitness) == 1)
  {
LABEL_2:
    (*(void (**)(char *, uint64_t))(v35 + 8))(v44, v45);
    return $defer #1 <A>() in SystemString.appendComponents<A>(components:)(v4);
  }
  else
  {
    unint64_t v19 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v37 = v4;
    v38 = v19;
    uint64_t v47 = v17 + 32;
    uint64_t v20 = (void (**)(char *, uint64_t))(v17 + 8);
    uint64_t v36 = a3;
    while (1)
    {
      char v21 = v42;
      v38(v42, v11, AssociatedTypeWitness);
      uint64_t v22 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v25 = *v23;
      uint64_t v24 = v23[1];
      uint64_t v26 = v23[2];
      swift_bridgeObjectRetain();
      v22(v48, 0);
      (*v20)(v21, AssociatedTypeWitness);
      uint64_t v27 = v26 - v24;
      if (v26 != v24) {
        break;
      }
      swift_bridgeObjectRetain();
LABEL_5:
      swift_bridgeObjectRelease_n();
      specialized Array.replaceSubrange<A>(_:with:)(*(void *)(*v4 + 16) - 1, *(void *)(*v4 + 16) - 1, 47);
      dispatch thunk of IteratorProtocol.next()();
      if (v39(v11, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_2;
      }
    }
    v28 = (char *)(v25 + 32 + v24);
    uint64_t v29 = *v4;
    unint64_t v30 = *(void *)(*v4 + 16);
    uint64_t result = swift_bridgeObjectRetain();
    while (v30)
    {
      char v32 = *v28;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v30 >= *(void *)(v29 + 24) >> 1) {
        uint64_t v29 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v30 + 1, 1, (char *)v29);
      }
      v31 = (unsigned char *)(v29 + 32 + v30 - 1);
      uint64_t result = (uint64_t)memmove((void *)(v29 + 32 + v30), v31, *(void *)(v29 + 16) - (v30 - 1));
      unint64_t v30 = *(void *)(v29 + 16) + 1;
      *(void *)(v29 + 16) = v30;
      unsigned char *v31 = v32;
      ++v28;
      if (!--v27)
      {
        uint64_t v4 = v37;
        uint64_t *v37 = v29;
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized RangeReplaceableCollection.append<A>(contentsOf:)(uint64_t result, char *a2, uint64_t a3)
{
  uint64_t v4 = &a2[-result];
  if (a2 != (char *)result)
  {
    if ((uint64_t)a2 > result)
    {
      if (result < 0)
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      unint64_t v5 = *(void *)(a3 + 16);
      if (v5 <= result)
      {
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      if ((unint64_t)(a2 - 1) >= v5)
      {
LABEL_21:
        __break(1u);
        return result;
      }
      uint64_t v6 = *v3;
      unint64_t v7 = ~result + v5;
      uint64_t v8 = (char *)(result + a3 + 32);
      while (v7)
      {
        unint64_t v9 = *((void *)v6 + 2);
        if (!v9) {
          goto LABEL_17;
        }
        char v11 = *v8++;
        char v10 = v11;
        isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
        if (!isUniquelyReferenced_nonNull_native || v9 >= *((void *)v6 + 3) >> 1) {
          uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v9 + 1, 1, v6);
        }
        uint64_t result = (uint64_t)memmove(&v6[v9 + 32], &v6[v9 + 31], *((void *)v6 + 2) - (v9 - 1));
        ++*((void *)v6 + 2);
        v6[v9 + 31] = v10;
        --v7;
        if (!--v4)
        {
          *uint64_t v3 = v6;
          return result;
        }
      }
      __break(1u);
LABEL_17:
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

size_t closure #1 in SystemString.init(_:)@<X0>(const char *a1@<X0>, size_t *a2@<X8>)
{
  size_t result = strlen(a1);
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    size_t result = (size_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, result + 1);
    *a2 = result;
  }
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, int64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SystemChar>);
    uint64_t v4 = (void *)swift_allocObject();
    size_t v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a2;
    v4[3] = 2 * v5 - 64;
  }
  memcpy(v4 + 4, a1, a2);
  return v4;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SystemChar>);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t FilePath.Component.string.getter()
{
  size_t v1 = *v0;
  unint64_t v2 = v0[1];
  size_t v3 = v0[2];
  swift_bridgeObjectRetain_n();
  specialized SystemString.init<A>(_:)(v2, v3, v1);
  uint64_t v4 = String.init(cString:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t specialized SystemString.init<A>(_:)(unint64_t a1, size_t a2, size_t a3)
{
  unint64_t v3 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2, a3);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4 || *(unsigned char *)(v4 + v3 + 31))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v3 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 + 1, 1, (char *)v3);
    }
    unint64_t v6 = *(void *)(v3 + 16);
    unint64_t v5 = *(void *)(v3 + 24);
    if (v6 >= v5 >> 1) {
      unint64_t v3 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    }
    *(void *)(v3 + 16) = v6 + 1;
    *(unsigned char *)(v3 + v6 + 32) = 0;
  }
  return v3;
}

unint64_t specialized _copyCollectionToContiguousArray<A>(_:)(unint64_t result, size_t a2, size_t a3)
{
  unint64_t v3 = *(void *)(a3 + 16);
  if (v3 > result && v3 > a2)
  {
    size_t v6 = result;
    int64_t v7 = a2 - result;
    if (a2 == result) {
      return MEMORY[0x263F8EE78];
    }
    if (v7 <= 0)
    {
      int64_t v8 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SystemChar>);
      int64_t v8 = (void *)swift_allocObject();
      size_t v10 = _swift_stdlib_malloc_size(v8);
      v8[2] = v7;
      v8[3] = 2 * v10 - 64;
    }
    size_t v11 = specialized Slice._copyContents(initializing:)(v12, v8 + 4, v7, v6, a2, a3);
    swift_bridgeObjectRetain();
    size_t result = swift_bridgeObjectRelease();
    if (v11 != (size_t *)v7) {
      goto LABEL_13;
    }
    return (unint64_t)v8;
  }
  __break(1u);
LABEL_13:
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

size_t *specialized Slice._copyContents(initializing:)(size_t *result, void *__dst, int64_t a3, size_t a4, size_t a5, size_t a6)
{
  size_t v6 = *(void *)(a6 + 16);
  if (v6 <= a4 || v6 <= a5)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(a4, a5 - a4)) {
    goto LABEL_17;
  }
  if ((uint64_t)a5 < (uint64_t)a4)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  size_t v11 = result;
  size_t v12 = 0;
  if (a5 != a4 && a3)
  {
    if ((uint64_t)(a5 - a4) >= a3) {
      size_t v12 = a3;
    }
    else {
      size_t v12 = a5 - a4;
    }
    uint64_t result = (size_t *)memcpy(__dst, (const void *)(a6 + a4 + 32), v12);
  }
  size_t v13 = a4 + v12;
  if (__OFADD__(a4, v12)) {
    goto LABEL_19;
  }
  if (v13 < v6)
  {
    *size_t v11 = a4;
    v11[1] = a5;
    v11[2] = a6;
    v11[3] = v13;
    return (size_t *)v12;
  }
LABEL_20:
  __break(1u);
  return result;
}

Swift::tuple_rootEnd_Int_relativeBegin_Int __swiftcall SystemString._parseRoot()()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1 == 1)
  {
    Swift::Int v0 = 0;
    Swift::Int v2 = 0;
  }
  else if (v1)
  {
    Swift::Int v0 = *(unsigned __int8 *)(v0 + 32) == 47;
    Swift::Int v2 = v0;
  }
  else
  {
    __break(1u);
  }
  result.Swift::Int relativeBegin = v2;
  result.rootEnd = v0;
  return result;
}

void FilePath.components.getter(void *a1@<X8>)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 16);
  if (v3 == 1)
  {
    *a1 = v2;
    a1[1] = 0;
  }
  else if (v3)
  {
    BOOL v4 = *(unsigned __int8 *)(v2 + 32) == 47;
    *a1 = v2;
    a1[1] = v4;
  }
  else
  {
    __break(1u);
  }
}

void FilePath.ComponentView.startIndex.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8);
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance FilePath.ComponentView.Index(void *a1, void *a2)
{
  return *a2 >= *a1;
}

uint64_t storeEnumTagSinglePayload for FilePath.Root(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)Swift::tuple_rootEnd_Int_relativeBegin_Int result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)Swift::tuple_rootEnd_Int_relativeBegin_Int result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemChar()
{
  return &type metadata for SystemChar;
}

uint64_t FilePath.components.modify(uint64_t a1)
{
  $defer #1 () in FilePath.components.modify(*(uint64_t **)(a1 + 16), (uint64_t *)a1, *(void *)(a1 + 24));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t $defer #1 () in FilePath.components.modify(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v6 = *a1;
  uint64_t v7 = *(void *)(*a1 + 16);
  if (v7 == 1) {
    goto LABEL_5;
  }
  if (!v7)
  {
    __break(1u);
    return result;
  }
  if (*(unsigned char *)(v6 + 32) != 47
    || (uint64_t result = specialized Sequence<>.elementsEqual<A>(_:)(a3, 0, 1, v6), (result & 1) == 0))
  {
LABEL_5:
    uint64_t v8 = swift_bridgeObjectRetain();
    FilePath.Root.init(_:)(v8, (uint64_t *)&v10);
    long long v9 = v10;
    return (uint64_t)FilePath.root.setter((uint64_t *)&v9);
  }
  return result;
}

uint64_t specialized Sequence<>.elementsEqual<A>(_:)(uint64_t result, int64_t a2, int64_t a3, uint64_t a4)
{
  unint64_t v4 = 0;
  unint64_t v5 = *(void *)(result + 16);
  unint64_t v6 = v5 - 1;
  uint64_t v7 = result + 32;
  unint64_t v8 = a2;
  while (1)
  {
    if (v8 == a3)
    {
      int v9 = 0;
      unint64_t v10 = a3;
      goto LABEL_10;
    }
    if ((uint64_t)v8 < a2 || (uint64_t)v8 >= a3) {
      break;
    }
    if ((v8 & 0x8000000000000000) != 0) {
      goto LABEL_19;
    }
    unint64_t v11 = *(void *)(a4 + 16);
    if (v11 <= v8) {
      goto LABEL_20;
    }
    if (v8 >= v11 - 1) {
      goto LABEL_21;
    }
    int v9 = *(unsigned __int8 *)(a4 + 32 + v8);
    unint64_t v10 = v8 + 1;
LABEL_10:
    uint64_t result = v4 == v6;
    if (v4 == v6)
    {
      int v12 = 0;
      unint64_t v13 = v5 - 1;
      if (v8 == a3) {
        return result;
      }
    }
    else
    {
      if (v4 >= v5) {
        goto LABEL_22;
      }
      int v12 = *(unsigned __int8 *)(v7 + v4);
      unint64_t v13 = v4 + 1;
      if (v8 == a3) {
        return result;
      }
    }
    uint64_t result = 0;
    if (v4 != v6)
    {
      unint64_t v4 = v13;
      unint64_t v8 = v10;
      if (v9 == v12) {
        continue;
      }
    }
    return result;
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;

  unint64_t v4 = 0;
  unint64_t v5 = *(void *)(result + 16);
  unint64_t v6 = result + 32;
  uint64_t v7 = a2;
  while (1)
  {
    if (v7 == a3)
    {
      unint64_t v8 = 0;
      int v9 = a3;
      goto LABEL_10;
    }
    if ((uint64_t)v7 < a2 || (uint64_t)v7 >= a3) {
      break;
    }
    if ((v7 & 0x8000000000000000) != 0) {
      goto LABEL_19;
    }
    unint64_t v10 = *(void *)(a4 + 16);
    if (v10 <= v7) {
      goto LABEL_20;
    }
    if (v7 >= v10 - 1) {
      goto LABEL_21;
    }
    unint64_t v8 = *(unsigned __int8 *)(a4 + 32 + v7);
    int v9 = v7 + 1;
LABEL_10:
    uint64_t result = v4 == v5;
    if (v4 == v5)
    {
      unint64_t v11 = 0;
      int v12 = v5;
      if (v7 == a3) {
        return result;
      }
    }
    else
    {
      if (v4 >= v5) {
        goto LABEL_22;
      }
      unint64_t v11 = *(unsigned __int8 *)(v6 + v4);
      int v12 = v4 + 1;
      if (v7 == a3) {
        return result;
      }
    }
    uint64_t result = 0;
    if (v4 != v5)
    {
      unint64_t v4 = v12;
      uint64_t v7 = v9;
      if (v8 == v11) {
        continue;
      }
    }
    return result;
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

uint64_t _machPrecondition(file:line:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5();
  if (result) {
    __break(1u);
  }
  return result;
}

uint64_t Mach.Port._name.getter()
{
  return *v0;
}

uint64_t Mach.Port._name.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*Mach.Port._name.modify())()
{
  return Mach.Port._name.modify;
}

uint64_t Mach.Port._context.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t Mach.Port._context.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*Mach.Port._context.modify())()
{
  return Mach.Port._name.modify;
}

uint64_t Mach.Port.init(name:)@<X0>(uint64_t result@<X0>, ValueMetadata *a2@<X1>, uint64_t a3@<X8>)
{
  if (!result)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  mach_port_name_t v3 = result;
  if (a2 != &type metadata for Mach.ReceiveRight)
  {
    mach_port_context_t v5 = 0;
LABEL_6:
    *(_DWORD *)a3 = v3;
    *(void *)(a3 + 8) = v5;
    return result;
  }
  if (result == -1) {
    goto LABEL_8;
  }
  mach_port_context_t v5 = arc4random();
  uint64_t result = mach_port_guard(*MEMORY[0x263EF8960], v3, v5, 0);
  if (!result) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t Mach.Port.withBorrowedName<A>(body:)(uint64_t (*a1)(void))
{
  return a1(*v1);
}

uint64_t Mach.Port.deinit(uint64_t result)
{
  mach_port_name_t v2 = *(_DWORD *)v1;
  if (*(ValueMetadata **)(result + 16) != &type metadata for Mach.ReceiveRight)
  {
    uint64_t result = mach_port_deallocate(*MEMORY[0x263EF8960], v2);
    if (!result) {
      return result;
    }
    __break(1u);
  }
  if (v2 == -1)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t result = mach_port_destruct(*MEMORY[0x263EF8960], v2, 0, *(void *)(v1 + 8));
  if (result) {
LABEL_8:
  }
    __break(1u);
  return result;
}

uint64_t static Mach.PortRightError.== infix(_:_:)()
{
  return 1;
}

void Mach.PortRightError.hash(into:)()
{
}

Swift::Int Mach.PortRightError.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Mach.PortRightError()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Mach.PortRightError()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Mach.PortRightError()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Mach.PortRightError()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance Mach.PortRightError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance Mach.PortRightError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance Mach.PortRightError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance Mach.PortRightError()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t Mach.Port<>.init(name:context:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (result)
  {
    *(_DWORD *)a3 = result;
    *(void *)(a3 + 8) = a2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t Mach.Port<>.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  mach_port_name_t name = 0;
  mach_port_name_t v2 = (ipc_space_t *)MEMORY[0x263EF8960];
  if (mach_port_allocate(*MEMORY[0x263EF8960], 1u, &name))
  {
    __break(1u);
    goto LABEL_6;
  }
  mach_port_name_t v3 = name;
  if (name + 1 < 2) {
    goto LABEL_7;
  }
  mach_port_context_t v4 = arc4random();
  uint64_t result = mach_port_guard(*v2, v3, v4, 0);
  if (result)
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
  }
  *(_DWORD *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  return result;
}

uint64_t Mach.Port<>.relinquish()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mach.Port<Mach.ReceiveRight>);
  Mach.Port.deinit(v2);
  return v1;
}

{
  return Mach.Port<>.relinquish()(&demangling cache variable for type metadata for Mach.Port<Mach.SendRight>);
}

{
  return Mach.Port<>.relinquish()(&demangling cache variable for type metadata for Mach.Port<Mach.SendOnceRight>);
}

uint64_t Mach.Port<>.unguardAndRelinquish()()
{
  uint64_t v1 = *v0;
  mach_port_context_t v2 = *((void *)v0 + 1);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mach.Port<Mach.ReceiveRight>);
  Mach.Port.deinit(v3);
  uint64_t result = mach_port_unguard(*MEMORY[0x263EF8960], v1, v2);
  if (!result) {
    return v1;
  }
  __break(1u);
  return result;
}

uint64_t Mach.Port<>.withBorrowedName<A>(body:)(uint64_t (*a1)(void, void))
{
  return a1(*v1, *((void *)v1 + 1));
}

uint64_t Mach.Port<>.makeSendOnceRight()@<X0>(uint64_t a1@<X8>)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0;
  uint64_t result = MEMORY[0x2166C09F0](*MEMORY[0x263EF8960], *v1, 21, (char *)v4 + 4, v4);
  if (result)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (LODWORD(v4[0]) != 18)
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
  }
  if (!HIDWORD(v4[0])) {
    goto LABEL_7;
  }
  *(_DWORD *)a1 = HIDWORD(v4[0]);
  *(void *)(a1 + 8) = 0;
  return result;
}

uint64_t Mach.Port<>.makeSendRight()@<X0>(uint64_t a1@<X8>)
{
  mach_port_name_t v3 = *v1;
  uint64_t result = mach_port_insert_right(*MEMORY[0x263EF8960], v3, v3, 0x14u);
  if (v3) {
    BOOL v5 = result == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    *(_DWORD *)a1 = v3;
    *(void *)(a1 + 8) = 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t Mach.Port<>.makeSendCount.getter()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  *(_OWORD *)port_info_out = 0u;
  long long v4 = 0u;
  mach_msg_type_number_t port_info_outCnt = 10;
  if (mach_port_get_attributes(*MEMORY[0x263EF8960], *v0, 2, port_info_out, &port_info_outCnt)) {
    __break(1u);
  }
  return port_info_out[2];
}

uint64_t Mach.Port<>.makeSendCount.setter(uint64_t a1)
{
  uint64_t result = MEMORY[0x2166C0A30](*MEMORY[0x263EF8960], *v1, a1);
  if (result) {
    __break(1u);
  }
  return result;
}

void (*Mach.Port<>.makeSendCount.modify(void *a1))(void **a1, char a2)
{
  mach_port_name_t v3 = (char *)malloc(0x38uLL);
  *(_OWORD *)(v3 + 8) = 0u;
  *a1 = v3;
  *((_DWORD *)v3 + 13) = 10;
  *(void *)mach_port_name_t v3 = v1;
  *(_OWORD *)(v3 + 24) = 0u;
  *((void *)v3 + 5) = 0;
  if (mach_port_get_attributes(*MEMORY[0x263EF8960], *v1, 2, (mach_port_info_t)v3 + 2, (mach_msg_type_number_t *)v3 + 13))
  {
    __break(1u);
  }
  *((_DWORD *)v3 + 12) = *((_DWORD *)v3 + 4);
  return Mach.Port<>.makeSendCount.modify;
}

void Mach.Port<>.makeSendCount.modify(void **a1, char a2)
{
  mach_port_name_t v3 = *a1;
  int v4 = MEMORY[0x2166C0A30](*MEMORY[0x263EF8960], **(unsigned int **)*a1, *((unsigned int *)*a1 + 12));
  if (a2)
  {
    if (!v4) {
      goto LABEL_5;
    }
    __break(1u);
  }
  if (v4)
  {
    __break(1u);
    return;
  }
LABEL_5:

  free(v3);
}

uint64_t Mach.Port<>.copySendRight()@<X0>(uint64_t a1@<X8>)
{
  mach_port_name_t v3 = *v1;
  uint64_t result = mach_port_insert_right(*MEMORY[0x263EF8960], *v1, *v1, 0x13u);
  if (result == 15 || result == 20)
  {
    lazy protocol witness table accessor for type Mach.PortRightError and conformance Mach.PortRightError();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    if (v3) {
      BOOL v6 = result == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      *(_DWORD *)a1 = v3;
      *(void *)(a1 + 8) = 0;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Mach.PortRightError and conformance Mach.PortRightError()
{
  unint64_t result = lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError;
  if (!lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError;
  if (!lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError);
  }
  return result;
}

uint64_t Mach.Port<>.relinquish()(uint64_t *a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a1);
  Mach.Port.deinit(v3);
  return v2;
}

ValueMetadata *type metadata accessor for Mach()
{
  return &type metadata for Mach;
}

uint64_t type metadata instantiation function for Mach.Port(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t destroy for Mach.Port(uint64_t a1, uint64_t a2)
{
  return Mach.Port.deinit(a2);
}

uint64_t assignWithTake for Mach.Port(uint64_t result, uint64_t a2)
{
  *(_DWORD *)unint64_t result = *(_DWORD *)a2;
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t getEnumTagSinglePayload for Mach.Port(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Mach.Port(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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

uint64_t type metadata accessor for Mach.Port()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for Mach.PortRightError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for Mach.PortRightError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x215681570);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for Mach.PortRightError()
{
  return 0;
}

ValueMetadata *type metadata accessor for Mach.PortRightError()
{
  return &type metadata for Mach.PortRightError;
}

ValueMetadata *type metadata accessor for Mach.ReceiveRight()
{
  return &type metadata for Mach.ReceiveRight;
}

ValueMetadata *type metadata accessor for Mach.SendRight()
{
  return &type metadata for Mach.SendRight;
}

ValueMetadata *type metadata accessor for Mach.SendOnceRight()
{
  return &type metadata for Mach.SendOnceRight;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t protocol witness for Decodable.init(from:) in conformance FileDescriptor()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FileDescriptor()
{
  return RawRepresentable<>.encode(to:)();
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance FileDescriptor.AccessMode@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance FileDescriptor.AccessMode(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void protocol witness for Hashable.hash(into:) in conformance FileDescriptor.AccessMode()
{
  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FileDescriptor.AccessMode()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FileDescriptor.AccessMode()
{
  return RawRepresentable<>.encode(to:)();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FileDescriptor.AccessMode(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *protocol witness for OptionSet.init(rawValue:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance FileDescriptor.OpenOptions()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FileDescriptor.OpenOptions()
{
  return RawRepresentable<>.encode(to:)();
}

void protocol witness for SetAlgebra.init() in conformance FileDescriptor.OpenOptions(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *protocol witness for SetAlgebra.union(_:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.intersection(_:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance FileDescriptor.OpenOptions(_DWORD *a1, int *a2)
{
  int v3 = *a2;
  int v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

_DWORD *protocol witness for SetAlgebra.remove(_:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(_DWORD *)a2 = v3;
  *(unsigned char *)(a2 + 4) = v3 == 0;
  return result;
}

int *protocol witness for SetAlgebra.update(with:) in conformance FileDescriptor.OpenOptions@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = *v2;
  *v2 |= *result;
  int v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance FileDescriptor.OpenOptions(_DWORD *result)
{
  *v1 |= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance FileDescriptor.OpenOptions(_DWORD *result)
{
  *v1 &= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance FileDescriptor.OpenOptions(_DWORD *result)
{
  *v1 ^= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance FileDescriptor.OpenOptions(_DWORD *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance FileDescriptor.OpenOptions(_DWORD *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance FileDescriptor.OpenOptions(_DWORD *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance FileDescriptor.OpenOptions()
{
  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance FileDescriptor.OpenOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

_DWORD *protocol witness for SetAlgebra.subtract(_:) in conformance FileDescriptor.OpenOptions(_DWORD *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance FileDescriptor.OpenOptions@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  int v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FileDescriptor()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FileDescriptor()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance FileDescriptor.SeekOrigin()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FileDescriptor.SeekOrigin()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t FileDescriptor.AccessMode.description.getter(int a1)
{
  switch(a1)
  {
    case 0:
      return 0x796C6E4F64616572;
    case 2:
      return 0x7469725764616572;
    case 1:
      return 0x6C6E4F6574697277;
  }
  _StringGuts.grow(_:)(16);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41;
  v3._unint64_t object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0xD000000000000015;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FileDescriptor.AccessMode()
{
  return FileDescriptor.AccessMode.description.getter(*v0);
}

unint64_t FileDescriptor.SeekOrigin.description.getter(int a1)
{
  unint64_t result = 0x7472617473;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x746E6572727563;
      break;
    case 2:
      unint64_t result = 6581861;
      break;
    case 3:
      unint64_t result = 0x656C6F487478656ELL;
      break;
    case 4:
      unint64_t result = 0x617461447478656ELL;
      break;
    default:
      _StringGuts.grow(_:)(16);
      swift_bridgeObjectRelease();
      v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v3);
      swift_bridgeObjectRelease();
      v4._countAndFlagsBits = 41;
      v4._unint64_t object = (void *)0xE100000000000000;
      String.append(_:)(v4);
      unint64_t result = 0xD000000000000015;
      break;
  }
  return result;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance FileDescriptor.SeekOrigin()
{
  return FileDescriptor.SeekOrigin.description.getter(*v0);
}

uint64_t FileDescriptor.OpenOptions.description.getter(int a1)
{
  return specialized OptionSet._buildDescription(_:)((uint64_t)&outlined read-only object #0 of FileDescriptor.OpenOptions.description.getter, a1);
}

uint64_t specialized OptionSet._buildDescription(_:)(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = swift_bridgeObjectRetain() + 56;
    do
    {
      int v5 = *(_DWORD *)(v4 - 24);
      if ((v5 & ~a2) == 0)
      {
        v6._countAndFlagsBits = StaticString.description.getter();
        String.append(_:)(v6);
        swift_bridgeObjectRelease();
        a2 &= ~v5;
        if (a2)
        {
          v7._countAndFlagsBits = 8236;
          v7._unint64_t object = (void *)0xE200000000000000;
          String.append(_:)(v7);
        }
      }
      v4 += 32;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  if (a2)
  {
    _StringGuts.grow(_:)(16);
    v10._countAndFlagsBits = 0x6974704F6E65704FLL;
    v10._unint64_t object = (void *)0xEB00000000736E6FLL;
    String.append(_:)(v10);
    v11._countAndFlagsBits = 0x756C615677617228;
    v11._unint64_t object = (void *)0xEB00000000203A65;
    String.append(_:)(v11);
    _print_unlocked<A, B>(_:_:)();
    v12._countAndFlagsBits = 41;
    v12._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v12);
    v13._countAndFlagsBits = 0;
    v13._unint64_t object = (void *)0xE000000000000000;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
  }
  v8._countAndFlagsBits = 93;
  v8._unint64_t object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  return 91;
}

uint64_t specialized OptionSet._buildDescription(_:)(uint64_t a1, unsigned __int16 a2)
{
  int v2 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = swift_bridgeObjectRetain() + 56;
    do
    {
      int v5 = *(unsigned __int16 *)(v4 - 24);
      if ((v5 & ~v2) == 0)
      {
        v6._countAndFlagsBits = StaticString.description.getter();
        String.append(_:)(v6);
        swift_bridgeObjectRelease();
        v2 &= v5 ^ 0xFFFF;
        if (v2)
        {
          v7._countAndFlagsBits = 8236;
          v7._unint64_t object = (void *)0xE200000000000000;
          String.append(_:)(v7);
        }
      }
      v4 += 32;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  if (v2)
  {
    _StringGuts.grow(_:)(16);
    v10._countAndFlagsBits = 0x6D726550656C6946;
    v10._unint64_t object = (void *)0xEF736E6F69737369;
    String.append(_:)(v10);
    v11._countAndFlagsBits = 0x756C615677617228;
    v11._unint64_t object = (void *)0xEB00000000203A65;
    String.append(_:)(v11);
    _print_unlocked<A, B>(_:_:)();
    v12._countAndFlagsBits = 41;
    v12._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v12);
    v13._countAndFlagsBits = 0;
    v13._unint64_t object = (void *)0xE000000000000000;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
  }
  v8._countAndFlagsBits = 93;
  v8._unint64_t object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  return 91;
}

unint64_t lazy protocol witness table accessor for type FileDescriptor and conformance FileDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor;
  if (!lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor;
  if (!lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode()
{
  unint64_t result = lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode;
  if (!lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode;
  if (!lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions()
{
  unint64_t result = lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions;
  if (!lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions;
  if (!lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions;
  if (!lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions;
  if (!lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin()
{
  unint64_t result = lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin;
  if (!lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin;
  if (!lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FileDescriptor.OpenOptions()
{
  return FileDescriptor.OpenOptions.description.getter(*v0);
}

ValueMetadata *type metadata accessor for FileDescriptor()
{
  return &type metadata for FileDescriptor;
}

ValueMetadata *type metadata accessor for FileDescriptor.AccessMode()
{
  return &type metadata for FileDescriptor.AccessMode;
}

ValueMetadata *type metadata accessor for FileDescriptor.OpenOptions()
{
  return &type metadata for FileDescriptor.OpenOptions;
}

ValueMetadata *type metadata accessor for FileDescriptor.SeekOrigin()
{
  return &type metadata for FileDescriptor.SeekOrigin;
}

Swift::Int specialized Sequence<>.starts<A>(with:)(Swift::Int result, Swift::Int startingAt, uint64_t a3, int64_t a4)
{
  int64_t v4 = startingAt;
  uint64_t v5 = result;
  int64_t v6 = *(void *)(a3 + 16);
  int64_t v7 = v6 - 1;
  if (v6 - 1 != a4)
  {
    uint64_t v9 = a3;
    int64_t v10 = *(void *)(result + 16);
    Swift::Int v11 = v10 - 1;
    uint64_t v35 = (unsigned char *)(a3 + 32);
    Swift::String v12 = (unsigned char *)(result + 32);
    int64_t v13 = v6 - 2;
    uint64_t v14 = a3 + 33;
    int64_t v15 = v10 - 2;
    Swift::Int v16 = result + 33;
    Swift::Int v33 = result + 33;
    while (1)
    {
      if (v6 == 1 || a4)
      {
        if (!v6 || v6 <= a4) {
          goto LABEL_114;
        }
        if (a4 < 0) {
          goto LABEL_106;
        }
      }
      else
      {
        if (!v6) {
          goto LABEL_113;
        }
        if (*v35 == 47)
        {
          int64_t v17 = 1;
          goto LABEL_15;
        }
      }
      int64_t v17 = v6 - 1;
      if (a4 != v7)
      {
        if (a4 >= v7) {
          goto LABEL_120;
        }
        int64_t v17 = a4;
        if (v35[a4] == 47) {
          goto LABEL_16;
        }
        int64_t v17 = v6 - 1;
        if (a4 + 1 != v7)
        {
          int64_t v20 = a4;
          while (v20 + 1 >= a4 && v20 + 1 < v7)
          {
            if (*(unsigned char *)(v14 + v20) == 47)
            {
              int64_t v17 = v20 + 1;
              goto LABEL_15;
            }
            if (v13 == ++v20)
            {
              int64_t v17 = v6 - 1;
              goto LABEL_15;
            }
          }
          goto LABEL_101;
        }
      }
LABEL_15:
      if (v17 < a4) {
        goto LABEL_104;
      }
LABEL_16:
      if (a4 == v17) {
        goto LABEL_103;
      }
      if (v6 == 1 || a4)
      {
        if (v6 <= a4) {
          goto LABEL_115;
        }
        if (a4 < 0) {
          goto LABEL_111;
        }
      }
      else if (*v35 == 47)
      {
        uint64_t v18 = 1;
        goto LABEL_49;
      }
      uint64_t v18 = v6 - 1;
      if (a4 != v7)
      {
        if (a4 >= v7) {
          goto LABEL_119;
        }
        int64_t v19 = a4;
        if (v35[a4] == 47)
        {
LABEL_26:
          uint64_t v18 = v19 + 1;
        }
        else
        {
          uint64_t v18 = v6 - 1;
          if (a4 + 1 != v7)
          {
            int64_t v19 = a4;
            while (v19 + 1 >= a4 && v19 + 1 < v7)
            {
              int v23 = *(unsigned __int8 *)(v14 + v19++);
              if (v23 == 47) {
                goto LABEL_26;
              }
              if (v13 == v19)
              {
                uint64_t v18 = v6 - 1;
                goto LABEL_49;
              }
            }
LABEL_102:
            __break(1u);
LABEL_103:
            __break(1u);
LABEL_104:
            __break(1u);
LABEL_105:
            __break(1u);
LABEL_106:
            __break(1u);
LABEL_107:
            __break(1u);
LABEL_108:
            __break(1u);
LABEL_109:
            __break(1u);
LABEL_110:
            __break(1u);
LABEL_111:
            __break(1u);
LABEL_112:
            __break(1u);
LABEL_113:
            __break(1u);
LABEL_114:
            __break(1u);
            __break(1u);
LABEL_115:
            __break(1u);
LABEL_116:
            __break(1u);
LABEL_117:
            __break(1u);
            __break(1u);
LABEL_118:
            __break(1u);
LABEL_119:
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
            return result;
          }
        }
      }
LABEL_49:
      BOOL v34 = v4 == v11;
      if (v4 == v11) {
        return v34;
      }
      if (v4 || !v11)
      {
        if (!v10 || v10 <= v4) {
          goto LABEL_117;
        }
        if (v4 < 0) {
          goto LABEL_109;
        }
      }
      else
      {
        if (!v10) {
          goto LABEL_116;
        }
        if (*v12 == 47)
        {
          int64_t v24 = 1;
          goto LABEL_71;
        }
      }
      if (v4 >= v11) {
        goto LABEL_108;
      }
      int64_t v24 = v4;
      if (v12[v4] == 47) {
        goto LABEL_72;
      }
      int64_t v24 = v11;
      if (v4 + 1 != v11)
      {
        int64_t v25 = v4;
        while (1)
        {
          if (v25 + 1 < v4 || v25 + 1 >= v11)
          {
            __break(1u);
            goto LABEL_100;
          }
          if (*(unsigned char *)(v16 + v25) == 47) {
            break;
          }
          if (v15 == ++v25)
          {
            int64_t v24 = v11;
            goto LABEL_71;
          }
        }
        int64_t v24 = v25 + 1;
      }
LABEL_71:
      if (v24 < v4) {
        goto LABEL_107;
      }
LABEL_72:
      if (v4 == v24) {
        goto LABEL_105;
      }
      if (v4 || v10 == 1)
      {
        if (v10 <= v4) {
          goto LABEL_118;
        }
        if (v4 < 0) {
          goto LABEL_112;
        }
      }
      else if (*v12 == 47)
      {
        Swift::Int v8 = 1;
        goto LABEL_92;
      }
      if (v4 >= v11) {
        goto LABEL_110;
      }
      int64_t v27 = v4;
      if (v12[v4] == 47)
      {
LABEL_81:
        Swift::Int v8 = v27 + 1;
      }
      else
      {
        Swift::Int v8 = v11;
        if (v4 + 1 != v11)
        {
          int64_t v27 = v4;
          while (v27 + 1 >= v4 && v27 + 1 < v11)
          {
            int v29 = *(unsigned __int8 *)(v16 + v27++);
            if (v29 == 47) {
              goto LABEL_81;
            }
            if (v15 == v27)
            {
              Swift::Int v8 = v11;
              goto LABEL_92;
            }
          }
LABEL_100:
          __break(1u);
LABEL_101:
          __break(1u);
          goto LABEL_102;
        }
      }
LABEL_92:
      uint64_t v30 = v14;
      uint64_t v31 = v5;
      uint64_t v32 = v9;
      unint64_t result = specialized Sequence<>.elementsEqual<A>(_:)(v4, v24, v5, a4, v17, v9);
      if ((result & 1) == 0) {
        return v34;
      }
      int64_t v4 = v8;
      a4 = v18;
      uint64_t v5 = v31;
      uint64_t v9 = v32;
      uint64_t v14 = v30;
      int64_t v15 = v10 - 2;
      Swift::Int v11 = v10 - 1;
      Swift::Int v16 = v33;
      if (v18 == v7) {
        goto LABEL_3;
      }
    }
  }
  Swift::Int v8 = startingAt;
LABEL_3:
  if (v8 == *(void *)(v5 + 16) - 1)
  {
    return 1;
  }
  else
  {
    unint64_t result = FilePath._parseComponent(startingAt:)(v8).componentEnd;
    if (result < v8) {
      goto LABEL_121;
    }
    if (v8 == result) {
      goto LABEL_122;
    }
    FilePath._parseComponent(startingAt:)(v8);
    return 0;
  }
}

int64_t specialized Sequence<>.starts<A>(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = v5 - 1;
  int64_t v7 = *(void *)(a3 + 16);
  int64_t v8 = v7 - 1;
  if (v7 - 1 != a4)
  {
    v28 = (unsigned char *)(a1 + 32);
    int v29 = (unsigned char *)(a3 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int64_t v10 = v7 - 2;
    int64_t v30 = v5;
    uint64_t v33 = a1;
    uint64_t v26 = a1 + 33;
    int64_t v27 = v5 - 2;
    uint64_t v11 = v5 - 1;
    uint64_t v12 = v7 - 1;
    while (1)
    {
      int64_t result = FilePath._parseComponent(priorTo:)(v12);
      uint64_t v12 = result;
      if (v7 == 1 || result)
      {
        uint64_t v14 = a3 + 33;
        if (!v7 || v7 <= result) {
          goto LABEL_70;
        }
        if (result < 0) {
          goto LABEL_67;
        }
      }
      else
      {
        uint64_t v14 = a3 + 33;
        if (!v7) {
          goto LABEL_69;
        }
        if (*v29 == 47)
        {
          int64_t v15 = 1;
          goto LABEL_28;
        }
      }
      int64_t v15 = v7 - 1;
      if (result != v8)
      {
        if (result >= v8) {
          goto LABEL_73;
        }
        if (v29[result] == 47) {
          goto LABEL_77;
        }
        int64_t v15 = v7 - 1;
        if (result + 1 != v8)
        {
          int64_t v16 = result;
          while (1)
          {
            if (v16 + 1 < result || v16 + 1 >= v8)
            {
              __break(1u);
              goto LABEL_64;
            }
            if (*(unsigned char *)(v14 + v16) == 47) {
              break;
            }
            if (v10 == ++v16)
            {
              int64_t v15 = v7 - 1;
              goto LABEL_26;
            }
          }
          int64_t v15 = v16 + 1;
        }
      }
LABEL_26:
      if (v15 < result) {
        goto LABEL_65;
      }
      if (result == v15) {
        goto LABEL_77;
      }
LABEL_28:
      int64_t v18 = v10;
      BOOL v19 = v11 == a2;
      if (v11 == a2) {
        goto LABEL_61;
      }
      swift_bridgeObjectRetain();
      int64_t result = FilePath._parseComponent(priorTo:)(v11);
      uint64_t v11 = result;
      if (result || !v6)
      {
        if (!v30 || v30 <= result) {
          goto LABEL_72;
        }
        if (result < 0) {
          goto LABEL_68;
        }
      }
      else
      {
        if (!v30) {
          goto LABEL_71;
        }
        if (*v28 == 47)
        {
          int64_t v20 = 1;
          goto LABEL_53;
        }
      }
      int64_t v20 = v6;
      if (result != v6)
      {
        if (result >= v6) {
          goto LABEL_74;
        }
        if (v28[result] == 47) {
          goto LABEL_78;
        }
        int64_t v20 = v6;
        if (result + 1 != v6)
        {
          int64_t v21 = result;
          while (v21 + 1 >= result && v21 + 1 < v6)
          {
            if (*(unsigned char *)(v26 + v21) == 47)
            {
              int64_t v20 = v21 + 1;
              goto LABEL_51;
            }
            if (v27 == ++v21)
            {
              int64_t v20 = v6;
              goto LABEL_51;
            }
          }
LABEL_64:
          __break(1u);
LABEL_65:
          __break(1u);
LABEL_66:
          __break(1u);
LABEL_67:
          __break(1u);
LABEL_68:
          __break(1u);
LABEL_69:
          __break(1u);
LABEL_70:
          __break(1u);
LABEL_71:
          __break(1u);
LABEL_72:
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
          return result;
        }
      }
LABEL_51:
      if (v20 < result) {
        goto LABEL_66;
      }
      if (result == v20) {
        goto LABEL_78;
      }
LABEL_53:
      char v23 = specialized Sequence<>.elementsEqual<A>(_:)(result, v20, v33, v12, v15, a3);
      swift_bridgeObjectRelease();
      if ((v23 & 1) == 0)
      {
LABEL_61:
        swift_bridgeObjectRelease();
        goto LABEL_62;
      }
      int64_t v10 = v18;
      if (v12 == a4)
      {
        swift_bridgeObjectRelease();
        uint64_t v6 = v11;
        goto LABEL_56;
      }
    }
  }
  swift_bridgeObjectRetain();
LABEL_56:
  if (v6 == a2)
  {
    BOOL v19 = 1;
LABEL_62:
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::Int v24 = FilePath._parseComponent(priorTo:)(v6);
    Swift::Int componentEnd = FilePath._parseComponent(startingAt:)(v24).componentEnd;
    int64_t result = swift_bridgeObjectRelease();
    if (componentEnd < v24) {
      goto LABEL_75;
    }
    if (v24 == componentEnd) {
      goto LABEL_76;
    }
    return 0;
  }
  return v19;
}

BOOL FilePath.isAbsolute.getter()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  if (v1 == 1) {
    return 0;
  }
  if (v1) {
    return *(unsigned char *)(*(void *)v0 + 32) == 47;
  }
  __break(1u);
  return result;
}

uint64_t FilePath.root.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4 == 1) {
    goto LABEL_7;
  }
  if (!v4)
  {
    __break(1u);
    return result;
  }
  if (*(unsigned char *)(v3 + 32) != 47)
  {
LABEL_7:
    *a1 = 0;
    a1[1] = 0;
    return result;
  }
  Swift::tuple_rootEnd_Int_relativeBegin_Int v5 = SystemString._parseRoot()();
  *a1 = v3;
  a1[1] = v5.relativeBegin;

  return swift_bridgeObjectRetain();
}

BOOL FilePath.isRelative.getter()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  if (v1 == 1) {
    return 1;
  }
  if (v1) {
    return *(unsigned char *)(*(void *)v0 + 32) != 47;
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall FilePath.starts(with:)(System::FilePath with)
{
  uint64_t v2 = *(void *)with._storage.nullTerminatedStorage._rawValue;
  uint64_t v3 = *(void *)(*(void *)with._storage.nullTerminatedStorage._rawValue + 16);
  if (v3 == 1)
  {
    LOBYTE(with._storage.nullTerminatedStorage._rawValue) = 1;
    return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
  }
  uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5 == 1) {
    goto LABEL_7;
  }
  if (!v5)
  {
LABEL_25:
    __break(1u);
    __break(1u);
    goto LABEL_26;
  }
  if (*(unsigned char *)(v4 + 32) != 47)
  {
LABEL_7:
    uint64_t v7 = 0;
    int64_t v6 = 0;
  }
  else
  {
    LOBYTE(with._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRetain();
    int64_t v6 = 1;
    uint64_t v7 = v4;
  }
  if (!v3)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (*(unsigned char *)(v2 + 32) != 47)
  {
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  if (!v7)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v8 = specialized Sequence<>.elementsEqual<A>(_:)(0, 1, v2, 0, v6, v7);
  swift_bridgeObjectRelease();
  LOBYTE(with._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRelease();
  if ((v8 & 1) == 0)
  {
LABEL_15:
    LOBYTE(with._storage.nullTerminatedStorage._rawValue) = 0;
    return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
  }
LABEL_16:
  if (v5 == 1)
  {
    int64_t v9 = 0;
  }
  else
  {
    if (!*(void *)(v4 + 16))
    {
LABEL_27:
      __break(1u);
      __break(1u);
      return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
    }
    int64_t v9 = *(unsigned __int8 *)(v4 + 32) == 47;
  }
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    __break(1u);
    __break(1u);
    goto LABEL_27;
  }
  Swift::Int v10 = *(unsigned __int8 *)(v2 + 32) == 47;

  LOBYTE(with._storage.nullTerminatedStorage._rawValue) = specialized Sequence<>.starts<A>(with:)(v2, v10, v4, v9);
  return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
}

BOOL FilePath.isEmpty.getter()
{
  return *(void *)(*(void *)v0 + 16) == 1;
}

Swift::Bool __swiftcall FilePath.ends(with:)(System::FilePath with)
{
  uint64_t v2 = *(void *)with._storage.nullTerminatedStorage._rawValue;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*(void *)with._storage.nullTerminatedStorage._rawValue + 16);
  if (v4 == 1) {
    goto LABEL_7;
  }
  if (!v4)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (*(unsigned char *)(v2 + 32) != 47)
  {
LABEL_7:
    uint64_t v5 = *(void *)(v3 + 16);
    if (v5 == 1)
    {
      BOOL v6 = 0;
      BOOL v7 = 0;
      if (v4 == 1) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    if (v5)
    {
      BOOL v6 = *(unsigned __int8 *)(v3 + 32) == 47;
      if (v4 == 1)
      {
        BOOL v7 = 0;
LABEL_14:
        swift_bridgeObjectRetain();
        uint64_t v8 = swift_bridgeObjectRetain();
        char v9 = specialized Sequence<>.starts<A>(with:)(v8, v7, v3, v6);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        LOBYTE(with._storage.nullTerminatedStorage._rawValue) = v9 & 1;
        return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
      }
LABEL_13:
      BOOL v7 = *(unsigned __int8 *)(v2 + 32) == 47;
      goto LABEL_14;
    }
LABEL_16:
    __break(1u);
    __break(1u);
    return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
  }

  LOBYTE(with._storage.nullTerminatedStorage._rawValue) = specialized static Array<A>.== infix(_:_:)(v3, v2);
  return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
}

Swift::Int key path getter for FilePath.root : FilePath@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v5 = SystemString._parseRoot()();
  Swift::Int result = v5.rootEnd;
  if (v5.relativeBegin)
  {
    Swift::Int relativeBegin = SystemString._parseRoot()().relativeBegin;
    Swift::Int result = swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v3 = 0;
    Swift::Int relativeBegin = 0;
  }
  *a2 = v3;
  a2[1] = relativeBegin;
  return result;
}

uint64_t *FilePath.root.setter(uint64_t *result)
{
  if (*result)
  {
    unint64_t v2 = result[1];
    uint64_t v3 = *(void *)(*(void *)v1 + 16);
    if (v3 == 1)
    {
      int64_t v4 = 0;
    }
    else
    {
      if (!v3)
      {
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
      int64_t v4 = *(unsigned __int8 *)(*(void *)v1 + 32) == 47;
    }
    if ((v2 & 0x8000000000000000) == 0)
    {
      specialized Array.replaceSubrange<A>(_:with:)(0, v4, 0, v2, *result);
      return (uint64_t *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v5 = *(void *)(*(void *)v1 + 16);
  if (v5 == 1)
  {
    int64_t v6 = 0;
  }
  else
  {
    if (!v5)
    {
LABEL_19:
      __break(1u);
      return result;
    }
    int64_t v6 = *(unsigned __int8 *)(*(void *)v1 + 32) == 47;
  }

  return (uint64_t *)specialized Array.replaceSubrange<A>(_:with:)(0, v6);
}

uint64_t *(*FilePath.root.modify(uint64_t *(**a1)(uint64_t *a1, char a2)))(uint64_t *a1, char a2)
{
  a1[2] = (uint64_t *(*)(uint64_t *, char))v1;
  Swift::Int result = *v1;
  uint64_t v4 = *((void *)*v1 + 2);
  if (v4 == 1) {
    goto LABEL_5;
  }
  if (v4)
  {
    if (*((unsigned char *)result + 32) == 47)
    {
      *a1 = result;
      a1[1] = (uint64_t *(*)(uint64_t *, char))1;
      swift_bridgeObjectRetain();
      return FilePath.root.modify;
    }
LABEL_5:
    *a1 = 0;
    a1[1] = 0;
    return FilePath.root.modify;
  }
  __break(1u);
  return result;
}

uint64_t *FilePath.root.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  if (a2)
  {
    uint64_t v4 = *a1;
    uint64_t v5 = v2;
    swift_bridgeObjectRetain();
    FilePath.root.setter(&v4);
    return (uint64_t *)swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *a1;
    uint64_t v5 = v2;
    return FilePath.root.setter(&v4);
  }
}

System::FilePath __swiftcall FilePath.removingRoot()()
{
  uint64_t v2 = *v1;
  *uint64_t v0 = *v1;
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3 == 1)
  {
    int64_t v4 = 0;
    return (System::FilePath)specialized Array.replaceSubrange<A>(_:with:)(0, v4);
  }
  if (v3)
  {
    int64_t v4 = *(unsigned __int8 *)(v2 + 32) == 47;
    return (System::FilePath)specialized Array.replaceSubrange<A>(_:with:)(0, v4);
  }
  __break(1u);
  return result;
}

void FilePath.lastComponent.getter(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 - 1;
  if (v4 == 1) {
    goto LABEL_5;
  }
  if (!v4)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*(unsigned char *)(v3 + 32) == 47 && v4 == 2)
  {
LABEL_5:
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    return;
  }
  swift_bridgeObjectRetain();
  Swift::Int v6 = FilePath._parseComponent(priorTo:)(v5);
  Swift::Int componentEnd = FilePath._parseComponent(startingAt:)(v6).componentEnd;
  if (componentEnd < v6) {
    goto LABEL_10;
  }
  if (v6 != componentEnd)
  {
    *a1 = v3;
    a1[1] = v6;
    a1[2] = componentEnd;
    return;
  }
LABEL_11:
  __break(1u);
  __break(1u);
}

System::FilePath __swiftcall FilePath.removingLastComponent()()
{
  *uint64_t v0 = *v1;
  return (System::FilePath)FilePath.removeLastComponent()();
}

Swift::Bool __swiftcall FilePath.removeLastComponent()()
{
  unint64_t v7 = *v0;
  FilePath.lastComponent.getter(v9);
  uint64_t v1 = *(void *)v9;
  if (!*(void *)v9) {
    return v1 != 0;
  }
  *(_OWORD *)char v9 = *(_OWORD *)&v9[8];
  *(void *)&v9[16] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
  Slice.indices.getter();
  swift_bridgeObjectRelease();
  Swift::Bool result = specialized Array.replaceSubrange<A>(_:with:)(v7, v8);
  unint64_t v3 = *v0;
  uint64_t v4 = *(void *)(*v0 + 16);
  if (v4 == 1) {
    return v1 != 0;
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v3 + 32);
    unint64_t v5 = v3 + 32;
    if ((v6 != 47 || v4 != 2) && *(unsigned char *)(v5 + v4 - 2) == 47) {
      specialized RangeReplaceableCollection.remove(at:)(v4 - 2);
    }
    return v1 != 0;
  }
  __break(1u);
  __break(1u);
  __break(1u);
  return result;
}

int64_t FilePath.Component.extension.getter()
{
  int64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 16);
  int64_t result = FilePath.Component._extensionRange()();
  if (v5) {
    return 0;
  }
  if (result >= v1 && v2 >= v4)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
    Slice.indices.getter();
    uint64_t v7 = static String._fromUTF8Repairing(_:)();
    swift_bridgeObjectRelease();
    return v7;
  }
  __break(1u);
  return result;
}

void FilePath.Component.stem.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  int64_t v3 = v0[2];
  swift_bridgeObjectRetain();
  FilePath.Component.kind.getter();
  if (v4 == 2)
  {
    int64_t v5 = specialized BidirectionalCollection<>.lastIndex(of:)(0x2Eu, v2, v3, v1);
    if (v5 == v2) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v5;
    }
    if (v6) {
      uint64_t v7 = v3;
    }
  }
  else
  {
    uint64_t v7 = v3;
  }
  if (v7 < v2)
  {
    __break(1u);
  }
  else if (v3 >= v7)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
    Slice.indices.getter();
    static String._fromUTF8Repairing(_:)();
    swift_bridgeObjectRelease_n();
    return;
  }
  __break(1u);
}

int64_t FilePath.extension.getter()
{
  FilePath.lastComponent.getter(v7);
  if (!v7[0]) {
    return 0;
  }
  int64_t v0 = v7[1];
  uint64_t v1 = v7[2];
  int64_t result = FilePath.Component._extensionRange()();
  if (v4)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if (result >= v0 && v1 >= v3)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
    Slice.indices.getter();
    uint64_t v6 = static String._fromUTF8Repairing(_:)();
    swift_bridgeObjectRelease_n();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t FilePath.extension.setter(uint64_t a1, void *a2)
{
  FilePath.lastComponent.getter(&v16);
  uint64_t v4 = v16;
  if (v16)
  {
    uint64_t v6 = v17;
    int64_t v5 = v18;
    FilePath.Component.kind.getter();
    if (v7 == 2)
    {
      if (a2)
      {
        v8._countAndFlagsBits = a1;
        v8._unint64_t object = a2;
        v9.nullTerminatedStorage._rawValue = _makeExtension(_:)(v8).nullTerminatedStorage._rawValue;
        swift_bridgeObjectRelease();
      }
      else
      {
        v9.nullTerminatedStorage._rawValue = &outlined read-only object #0 of FilePath.extension.setter;
      }
      uint64_t v16 = v4;
      uint64_t v17 = v6;
      int64_t v18 = v5;
      FilePath.Component.kind.getter();
      if (v10 == 2)
      {
        int64_t v11 = specialized BidirectionalCollection<>.lastIndex(of:)(0x2Eu, v6, v5, v4);
        char v13 = v12;
        swift_bridgeObjectRelease();
        unint64_t v14 = v5;
        if (v13) {
          goto LABEL_14;
        }
        unint64_t v14 = v5;
        if (v11 == v6) {
          goto LABEL_14;
        }
        unint64_t v14 = v11;
        if (v5 >= v11) {
          goto LABEL_14;
        }
        __break(1u);
      }
      swift_bridgeObjectRelease();
      unint64_t v14 = v5;
LABEL_14:
      specialized Array.replaceSubrange<A>(_:with:)(v14, v5, (uint64_t)v9.nullTerminatedStorage._rawValue);
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
  }
LABEL_15:

  return swift_bridgeObjectRelease();
}

void (*FilePath.extension.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  FilePath.lastComponent.getter(v13);
  uint64_t v4 = v13[0];
  if (!v13[0]) {
    goto LABEL_7;
  }
  uint64_t v6 = v13[1];
  uint64_t v5 = v13[2];
  int64_t result = (void (*)(uint64_t, char))FilePath.Component._extensionRange()();
  if (v9)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  if ((uint64_t)result >= v6 && v5 >= v8)
  {
    *uint64_t v3 = result;
    v3[1] = v8;
    v3[2] = v4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
    Slice.indices.getter();
    uint64_t v10 = static String._fromUTF8Repairing(_:)();
    uint64_t v12 = v11;
    swift_bridgeObjectRelease_n();
LABEL_8:
    v3[3] = v10;
    v3[4] = v12;
    return FilePath.extension.modify;
  }
  __break(1u);
  return result;
}

void FilePath.extension.modify(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    swift_bridgeObjectRetain();
    FilePath.extension.setter(v3, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    FilePath.extension.setter(*(void *)(*(void *)a1 + 24), v4);
  }

  free(v2);
}

void FilePath.stem.getter()
{
  FilePath.lastComponent.getter(v7);
  uint64_t v0 = v7[0];
  if (v7[0])
  {
    uint64_t v1 = v7[1];
    int64_t v2 = v7[2];
    swift_bridgeObjectRetain();
    FilePath.Component.kind.getter();
    if (v3 == 2)
    {
      int64_t v4 = specialized BidirectionalCollection<>.lastIndex(of:)(0x2Eu, v1, v2, v0);
      if (v4 == v1) {
        uint64_t v6 = v2;
      }
      else {
        uint64_t v6 = v4;
      }
      if (v5) {
        uint64_t v6 = v2;
      }
    }
    else
    {
      uint64_t v6 = v2;
    }
    if (v6 < v1)
    {
      __break(1u);
    }
    else if (v2 >= v6)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
      Slice.indices.getter();
      static String._fromUTF8Repairing(_:)();
      swift_bridgeObjectRelease_n();
      return;
    }
    __break(1u);
  }
}

void FilePath.isLexicallyNormal.getter()
{
  int64_t v1 = 0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 16);
  if (v3 == 1) {
    goto LABEL_4;
  }
  if (v3)
  {
    int64_t v1 = *(unsigned __int8 *)(v2 + 32) == 47;
LABEL_4:
    swift_bridgeObjectRetain_n();
    specialized Collection.drop(while:)(v2, v1, v2, v4);
    specialized Sequence.allSatisfy(_:)(v4[0], v4[1], v4[2]);
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

uint64_t specialized Collection.drop(while:)@<X0>(uint64_t result@<X0>, int64_t a2@<X1>, uint64_t a3@<X2>, int64_t *a4@<X8>)
{
  int64_t v4 = a2;
  uint64_t v5 = result;
  uint64_t v6 = a4;
  int64_t v7 = *(void *)(result + 16);
  int64_t v8 = v7 - 1;
  int64_t v9 = a2;
  if (v7 - 1 != a2)
  {
    int64_t v9 = a2;
    uint64_t v10 = (unsigned char *)(result + 32);
    uint64_t v25 = *(void *)(a3 + 16);
    int64_t v11 = v7 - 2;
    uint64_t v12 = result + 33;
    unint64_t v13 = *(void *)(result + 16);
    while (1)
    {
      BOOL v14 = v7 != 1 && v9 == 0;
      char v15 = !v14;
      if (v14)
      {
        if (!v7) {
          goto LABEL_88;
        }
        if (!v13) {
          goto LABEL_89;
        }
        if (*v10 == 47)
        {
          int64_t v16 = 1;
LABEL_19:
          if (v16 < v9) {
            goto LABEL_79;
          }
          goto LABEL_20;
        }
      }
      else
      {
        if (!v7 || v7 <= v9) {
          goto LABEL_87;
        }
        if (v9 < 0) {
          goto LABEL_84;
        }
      }
      int64_t v16 = v7 - 1;
      if (v9 == v8) {
        goto LABEL_19;
      }
      if (v9 >= v8) {
        goto LABEL_92;
      }
      if (v9 >= v13) {
        goto LABEL_93;
      }
      int64_t v16 = v9;
      if (v10[v9] != 47)
      {
        int64_t v16 = v7 - 1;
        if (v9 + 1 != v8)
        {
          int64_t v19 = v9;
          while (v19 + 1 >= v9 && v19 + 1 < v8)
          {
            if (v13 - 1 == v19) {
              goto LABEL_78;
            }
            if (*(unsigned char *)(v12 + v19) == 47)
            {
              int64_t v16 = v19 + 1;
              goto LABEL_19;
            }
            if (v11 == ++v19)
            {
              int64_t v16 = v7 - 1;
              goto LABEL_19;
            }
          }
          goto LABEL_77;
        }
        goto LABEL_19;
      }
LABEL_20:
      if (v9 == v16) {
        goto LABEL_80;
      }
      if (v25 != 1)
      {
        if (!v25) {
          goto LABEL_90;
        }
        if (*(unsigned char *)(a3 + 32) == 47) {
          goto LABEL_72;
        }
      }
      if (!v13) {
        goto LABEL_81;
      }
      if (v9 < 0) {
        goto LABEL_82;
      }
      if ((uint64_t)v13 <= v16) {
        goto LABEL_83;
      }
      int64_t result = specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #0 of FilePath.Component.kind.getter, v9, v16, v5);
      if ((result & 1) != 0
        || (int64_t result = specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #1 of FilePath.Component.kind.getter, v9, v16, v5), (result & 1) == 0))
      {
LABEL_72:
        uint64_t v6 = a4;
        int64_t v4 = a2;
        break;
      }
      if (v15) {
        goto LABEL_33;
      }
      unint64_t v13 = *(void *)(v5 + 16);
      if (!v13) {
        goto LABEL_91;
      }
      if (*v10 != 47)
      {
LABEL_33:
        if (v7 <= v9) {
          goto LABEL_85;
        }
        if (v9 == v8) {
          goto LABEL_67;
        }
        unint64_t v13 = *(void *)(v5 + 16);
        if (v9 >= v13) {
          goto LABEL_86;
        }
        if (v10[v9] != 47)
        {
          if (v9 + 1 == v8)
          {
LABEL_67:
            int64_t v9 = v7 - 1;
            uint64_t v6 = a4;
            int64_t v4 = a2;
            goto LABEL_68;
          }
          int64_t v17 = v9;
          while (v17 + 1 >= v9 && v17 + 1 < v8)
          {
            if (v13 - 1 == v17) {
              goto LABEL_76;
            }
            if (*(unsigned char *)(v12 + v17) == 47)
            {
              int64_t v9 = v17 + 1;
              goto LABEL_63;
            }
            if (v11 == ++v17) {
              goto LABEL_67;
            }
          }
          goto LABEL_75;
        }
LABEL_63:
        ++v9;
      }
      else
      {
        int64_t v9 = 1;
      }
      if (v9 == v8) {
        goto LABEL_67;
      }
    }
  }
  if (v7 <= v9)
  {
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
LABEL_81:
    __break(1u);
LABEL_82:
    __break(1u);
LABEL_83:
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
LABEL_90:
    __break(1u);
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
LABEL_68:
  int64_t v21 = *(void *)(v5 + 16);
  int64_t result = swift_bridgeObjectRelease();
  if (v21 <= v4)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  if (v9 < v4)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  if (v21 >= (unint64_t)v7)
  {
    v6[2] = v5;
    v6[3] = v4;
    *uint64_t v6 = v9;
    v6[1] = v8;
    return result;
  }
LABEL_96:
  __break(1u);
  return result;
}

uint64_t specialized Sequence.allSatisfy(_:)(uint64_t result, int64_t a2, uint64_t a3)
{
  if (result == a2) {
    return 1;
  }
  int64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    goto LABEL_80;
  }
  int64_t v6 = result;
  int64_t v7 = (unsigned char *)(a3 + 32);
  uint64_t v8 = a3 + 33;
  int64_t v9 = result;
  while (v9 >= v6 && v9 < a2)
  {
    int64_t v10 = *(void *)(a3 + 16);
    if (v9 || v10 == 1) {
      goto LABEL_12;
    }
    if (!v10) {
      goto LABEL_78;
    }
    if (*v7 != 47)
    {
LABEL_12:
      if (v10 <= v9 || v10 == 0) {
        goto LABEL_70;
      }
      if (v9 < 0) {
        goto LABEL_71;
      }
      uint64_t v11 = v10 - 1;
      int64_t v13 = v9;
      if (v9 == v10 - 1) {
        goto LABEL_33;
      }
      if (v9 >= (unint64_t)(v10 - 1)) {
        goto LABEL_74;
      }
      if (v9 >= (unint64_t)v10) {
        goto LABEL_75;
      }
      int64_t v13 = v9;
      if (v7[v9] == 47) {
        goto LABEL_33;
      }
      if (v9 + 1 != v11)
      {
        int64_t v14 = v9;
        while (1)
        {
          if (v14 + 1 < v9 || v14 + 1 >= v11)
          {
            __break(1u);
            goto LABEL_65;
          }
          if (*(unsigned char *)(v8 + v14) == 47) {
            break;
          }
          if (v10 - 2 == ++v14) {
            goto LABEL_32;
          }
        }
        uint64_t v11 = v14 + 1;
      }
    }
    else
    {
      uint64_t v11 = 1;
    }
LABEL_32:
    int64_t v13 = v11;
    if (v11 < v9) {
      goto LABEL_68;
    }
LABEL_33:
    if (v9 == v13) {
      goto LABEL_67;
    }
    if (v9 || v10 == 1) {
      goto LABEL_40;
    }
    if (!v10) {
      goto LABEL_79;
    }
    if (*v7 != 47)
    {
LABEL_40:
      if (v10 <= v9 || !v10) {
        goto LABEL_72;
      }
      if (v9 < 0) {
        goto LABEL_73;
      }
      uint64_t v17 = v10 - 1;
      uint64_t v16 = v9;
      if (v9 != v10 - 1)
      {
        if (v9 >= (unint64_t)(v10 - 1)) {
          goto LABEL_76;
        }
        if (v9 >= (unint64_t)v10) {
          goto LABEL_77;
        }
        int64_t v18 = v9;
        if (v7[v9] == 47)
        {
LABEL_57:
          uint64_t v16 = v18 + 1;
        }
        else
        {
          if (v9 + 1 != v17)
          {
            int64_t v19 = v10 - 2;
            int64_t v20 = v9;
            while (v20 + 1 >= v9 && v20 + 1 < v17)
            {
              if (*(unsigned char *)(v8 + v20) == 47)
              {
                int64_t v18 = v20 + 1;
                goto LABEL_57;
              }
              if (v19 == ++v20) {
                goto LABEL_55;
              }
            }
LABEL_65:
            __break(1u);
            break;
          }
LABEL_55:
          uint64_t v16 = v17;
        }
      }
    }
    else
    {
      uint64_t v16 = 1;
    }
    if (v9 < 0 || v4 <= v13) {
      goto LABEL_69;
    }
    if (specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #0 of FilePath.Component.kind.getter, v9, v13, a3))return 0; {
    int64_t result = specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #1 of FilePath.Component.kind.getter, v9, v13, a3);
    }
    if (result) {
      return 0;
    }
    int64_t v9 = v16;
    if (v16 == a2) {
      return 1;
    }
  }
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  __break(1u);
  return result;
}

System::FilePath __swiftcall FilePath.lexicallyNormalized()()
{
  *uint64_t v0 = *v1;
  FilePath._normalizeSpecialDirectories()();
  return result;
}

void FilePath.lexicallyResolving(_:)(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *v2;
  uint64_t v11 = *a1;
  uint64_t v5 = *(void *)(*a1 + 16);
  if (v5 == 1)
  {
    int64_t v6 = 0;
  }
  else
  {
    if (!v5)
    {
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
      __break(1u);
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    int64_t v6 = *(unsigned __int8 *)(*a1 + 32) == 47;
  }
  specialized Array.replaceSubrange<A>(_:with:)(0, v6);
  FilePath._normalizeSpecialDirectories()();
  uint64_t v7 = *(void *)(v11 + 16);
  if (v7 == 1)
  {
    swift_bridgeObjectRelease();
    *a2 = v4;
    return;
  }
  if (!v7)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (*(unsigned char *)(v11 + 32) == 47)
  {
    Swift::Int v8 = 1;
    if (v7 == 2)
    {
LABEL_17:
      specialized FilePath.append<A>(_:)(v11, *(unsigned __int8 *)(v11 + 32) == 47);
      swift_bridgeObjectRelease();
      *a2 = v4;
      return;
    }
  }
  else
  {
    Swift::Int v8 = 0;
  }
  Swift::Int componentEnd = FilePath._parseComponent(startingAt:)(v8).componentEnd;
  if (componentEnd < v8) {
    goto LABEL_21;
  }
  if (v8 != componentEnd)
  {
    FilePath.Component.kind.getter();
    if (v10 == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *a2 = 0;
      return;
    }
    if (*(void *)(v11 + 16)) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
  __break(1u);
}

uint64_t FilePath.appending<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = *v3;
  specialized FilePath.append<A>(_:)(a1, a2);
  int64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8);

  return v6(a1, a2);
}

Swift::Bool __swiftcall FilePath.removePrefix(_:)(System::FilePath a1)
{
  uint64_t v2 = *(void *)a1._storage.nullTerminatedStorage._rawValue;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (v4 == 1) {
    goto LABEL_5;
  }
  if (!v4)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (*(unsigned char *)(v3 + 32) != 47)
  {
LABEL_5:
    uint64_t v6 = 0;
    int64_t v5 = 0;
  }
  else
  {
    LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRetain();
    int64_t v5 = 1;
    uint64_t v6 = v3;
  }
  uint64_t v7 = *(void *)(v2 + 16);
  if (v7 == 1) {
    goto LABEL_12;
  }
  if (!v7)
  {
LABEL_29:
    __break(1u);
    __break(1u);
    __break(1u);
    goto LABEL_30;
  }
  if (*(unsigned char *)(v2 + 32) == 47)
  {
    LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRetain();
    int64_t v8 = 1;
    uint64_t v9 = v2;
    if (!v6) {
      goto LABEL_10;
    }
LABEL_13:
    if (v9)
    {
      char v10 = specialized Sequence<>.elementsEqual<A>(_:)(0, v8, v9, 0, v5, v6);
      swift_bridgeObjectRelease();
      LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRelease();
      if (v10) {
        goto LABEL_15;
      }
LABEL_27:
      LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = 0;
      return (Swift::Bool)a1._storage.nullTerminatedStorage._rawValue;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
LABEL_12:
  uint64_t v9 = 0;
  int64_t v8 = 0;
  if (v6) {
    goto LABEL_13;
  }
LABEL_10:
  if (v9) {
    goto LABEL_18;
  }
LABEL_15:
  if (v4 == 1)
  {
    int64_t v11 = 0;
    int64_t v12 = 0;
    if (v7 == 1) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  if (!*(void *)(v3 + 16))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  int64_t v11 = *(unsigned __int8 *)(v3 + 32) == 47;
  if (v7 == 1)
  {
    int64_t v12 = 0;
    goto LABEL_24;
  }
LABEL_22:
  if (!*(void *)(v2 + 16))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  int64_t v12 = *(unsigned __int8 *)(v2 + 32) == 47;
LABEL_24:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized _dropCommonPrefix<A>(_:_:)((uint64_t)&v18, v17, v3, v11, v2, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v13 = v18;
  int64_t v14 = v17[0];
  int64_t v15 = v17[1];
  swift_bridgeObjectRelease();
  LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRelease();
  if (v14 != v15) {
    goto LABEL_27;
  }
  if (v13 < 0)
  {
LABEL_32:
    __break(1u);
    return (Swift::Bool)a1._storage.nullTerminatedStorage._rawValue;
  }
  specialized Array.replaceSubrange<A>(_:with:)(0, v13);
  LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = 1;
  return (Swift::Bool)a1._storage.nullTerminatedStorage._rawValue;
}

uint64_t specialized _dropCommonPrefix<A>(_:_:)(uint64_t result, int64_t *a2, uint64_t a3, int64_t a4, uint64_t a5, int64_t a6)
{
  int64_t v6 = *(void *)(a3 + 16);
  if (v6 <= a4) {
    goto LABEL_206;
  }
  int64_t v7 = a6;
  int64_t v9 = *(void *)(a5 + 16);
  if (v9 <= a6)
  {
LABEL_207:
    __break(1u);
    __break(1u);
    __break(1u);
LABEL_208:
    __break(1u);
LABEL_209:
    __break(1u);
LABEL_210:
    __break(1u);
    __break(1u);
LABEL_211:
    __break(1u);
    return result;
  }
  int64_t v10 = a4;
  uint64_t v11 = a3;
  int64_t v12 = a2;
  int64_t v13 = (void *)result;
  int64_t v55 = v9 - 1;
  int64_t v54 = v6 - 1;
  if (v6 - 1 != a4)
  {
    uint64_t v46 = (void *)result;
    int64_t v14 = a6;
    uint64_t v16 = (unsigned char *)(a3 + 32);
    int64_t v15 = a4;
    uint64_t v17 = (unsigned char *)(a5 + 32);
    swift_bridgeObjectRetain();
    System::FilePath result = swift_bridgeObjectRetain();
    uint64_t v18 = v11 + 33;
    uint64_t v51 = v11;
    unint64_t v52 = v9;
    int64_t v19 = v6;
    int64_t v47 = v15;
    int64_t v49 = v14;
    uint64_t v50 = v11 + 33;
    int64_t v20 = v6 - 1;
    int64_t v53 = v6;
    while (1)
    {
      if (v15 >= v20) {
        goto LABEL_169;
      }
      if (v15 || v19 == 1) {
        goto LABEL_26;
      }
      if (!v19) {
        goto LABEL_208;
      }
      if (*v16 != 47)
      {
LABEL_26:
        if (v19 <= v15 || !v19) {
          goto LABEL_175;
        }
        if (v15 < 0) {
          goto LABEL_176;
        }
        int64_t v21 = v19 - 1;
        int64_t v22 = v15;
        if (v15 != v19 - 1)
        {
          int64_t v22 = v15;
          while (1)
          {
            if (v22 < v15 || v22 >= v21)
            {
              __break(1u);
              goto LABEL_163;
            }
            if (v16[v22] == 47) {
              break;
            }
            if (v21 == ++v22)
            {
              int64_t v22 = v19 - 1;
              break;
            }
          }
          if (v22 < v15) {
            goto LABEL_180;
          }
        }
        if (v15 == v22) {
          goto LABEL_170;
        }
        if (v15 == v20)
        {
          if (v14 == v55) {
            goto LABEL_201;
          }
          int64_t v23 = 0;
          int64_t v24 = 0;
          uint64_t v11 = 0;
          char v25 = 1;
LABEL_46:
          if (v14 >= v55) {
            goto LABEL_192;
          }
          if (v14 || v9 == 1) {
            goto LABEL_53;
          }
          if (!v9) {
            goto LABEL_211;
          }
          if (*v17 != 47)
          {
LABEL_53:
            if (v9 <= v14 || !v9) {
              goto LABEL_194;
            }
            if (v14 < 0) {
              goto LABEL_195;
            }
            int64_t v30 = v9 - 1;
            int64_t v29 = v14;
            if (v14 != v30)
            {
              int64_t v29 = v14;
              while (v29 >= v14 && v29 < v30)
              {
                if (v17[v29] == 47) {
                  goto LABEL_62;
                }
                if (v30 == ++v29)
                {
                  int64_t v29 = v30;
LABEL_62:
                  if (v29 < v14) {
                    goto LABEL_196;
                  }
                  goto LABEL_63;
                }
              }
              goto LABEL_165;
            }
LABEL_63:
            if (v14 == v29) {
              goto LABEL_193;
            }
          }
          else
          {
            int64_t v29 = 1;
          }
          swift_bridgeObjectRetain();
          if (!v11)
          {
            uint64_t v11 = v51;
            goto LABEL_158;
          }
          char v31 = specialized Sequence<>.elementsEqual<A>(_:)(v14, v29, a5, v24, v23, v11);
          swift_bridgeObjectRelease();
          System::FilePath result = swift_bridgeObjectRelease();
          if ((v31 & 1) == 0)
          {
            int64_t v12 = a2;
            int64_t v7 = v49;
            int64_t v10 = v47;
            uint64_t v11 = v51;
LABEL_160:
            int64_t v13 = v46;
            goto LABEL_161;
          }
          uint64_t v11 = v51;
          int64_t v28 = v53;
          int64_t v20 = v54;
          if (v25) {
            goto LABEL_201;
          }
          char v27 = 0;
          uint64_t v18 = v50;
          int64_t v19 = *(void *)(v51 + 16);
          if (!v15) {
            goto LABEL_68;
          }
          goto LABEL_71;
        }
        if (v15) {
          goto LABEL_30;
        }
      }
      if (v19 == 1 || *v16 != 47)
      {
LABEL_30:
        if (v19 <= v15) {
          goto LABEL_198;
        }
        if (v15 < 0) {
          goto LABEL_199;
        }
        int64_t v26 = v19 - 1;
        int64_t v23 = v15;
        if (v15 != v26)
        {
          int64_t v23 = v15;
          while (v23 >= v15 && v23 < v26)
          {
            if (v16[v23] == 47) {
              goto LABEL_39;
            }
            if (v26 == ++v23)
            {
              int64_t v23 = v26;
LABEL_39:
              if (v23 < v15) {
                goto LABEL_200;
              }
              goto LABEL_40;
            }
          }
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
LABEL_186:
          __break(1u);
LABEL_187:
          __break(1u);
LABEL_188:
          __break(1u);
LABEL_189:
          __break(1u);
LABEL_190:
          __break(1u);
LABEL_191:
          __break(1u);
LABEL_192:
          __break(1u);
LABEL_193:
          __break(1u);
LABEL_194:
          __break(1u);
LABEL_195:
          __break(1u);
LABEL_196:
          __break(1u);
LABEL_197:
          __break(1u);
LABEL_198:
          __break(1u);
LABEL_199:
          __break(1u);
LABEL_200:
          __break(1u);
LABEL_201:
          __break(1u);
LABEL_202:
          __break(1u);
LABEL_203:
          __break(1u);
LABEL_204:
          __break(1u);
LABEL_205:
          __break(1u);
LABEL_206:
          __break(1u);
          goto LABEL_207;
        }
LABEL_40:
        if (v15 == v23) {
          goto LABEL_197;
        }
      }
      else
      {
        int64_t v23 = 1;
      }
      System::FilePath result = swift_bridgeObjectRetain();
      if (v14 != v55)
      {
        char v25 = 0;
        int64_t v24 = v15;
        goto LABEL_46;
      }
      if (v11)
      {
        int64_t v14 = v55;
LABEL_158:
        swift_bridgeObjectRelease();
        System::FilePath result = swift_bridgeObjectRelease();
        goto LABEL_159;
      }
      char v27 = 1;
      int64_t v28 = v53;
      int64_t v19 = MEMORY[0x10];
      if (!v15)
      {
LABEL_68:
        if (v19 != 1)
        {
          if (!v19) {
            goto LABEL_209;
          }
          if (*v16 == 47) {
            goto LABEL_84;
          }
        }
      }
LABEL_71:
      if (v19 <= v15 || !v19) {
        goto LABEL_182;
      }
      if (v15 < 0) {
        goto LABEL_183;
      }
      int64_t v32 = v19 - 1;
      int64_t v33 = v15;
      if (v15 != v19 - 1)
      {
        int64_t v33 = v15;
        while (v33 >= v15 && v33 < v32)
        {
          if (v16[v33] == 47) {
            goto LABEL_81;
          }
          if (v32 == ++v33)
          {
            int64_t v33 = v19 - 1;
LABEL_81:
            if (v33 < v15) {
              goto LABEL_186;
            }
            goto LABEL_82;
          }
        }
LABEL_163:
        __break(1u);
        goto LABEL_164;
      }
LABEL_82:
      if (v15 == v33) {
        goto LABEL_171;
      }
      if (v15)
      {
LABEL_88:
        if (v19 <= v15) {
          goto LABEL_187;
        }
        if (v15 < 0) {
          goto LABEL_188;
        }
        int64_t v34 = v19 - 1;
        int64_t v35 = v15;
        if (v15 == v19 - 1)
        {
          if (v28 <= v15) {
            goto LABEL_172;
          }
        }
        else
        {
          if (v15 >= (unint64_t)(v19 - 1)) {
            goto LABEL_202;
          }
          if (v15 >= (unint64_t)v19) {
            goto LABEL_203;
          }
          int64_t v36 = v15;
          if (v16[v15] == 47)
          {
LABEL_96:
            int64_t v35 = v36 + 1;
            if (v28 <= v35) {
              goto LABEL_172;
            }
          }
          else
          {
            if (v15 + 1 != v34)
            {
              int64_t v36 = v15;
              while (1)
              {
                BOOL v37 = v36 + 1 >= v15 && v36 + 1 < v34;
                if (!v37) {
                  goto LABEL_167;
                }
                int v38 = *(unsigned __int8 *)(v18 + v36++);
                if (v38 == 47) {
                  goto LABEL_96;
                }
                if (v19 - 2 == v36)
                {
                  int64_t v35 = v19 - 1;
                  if (v28 <= v34) {
                    goto LABEL_172;
                  }
                  goto LABEL_110;
                }
              }
            }
            int64_t v35 = v19 - 1;
            if (v28 <= v34) {
              goto LABEL_172;
            }
          }
        }
LABEL_110:
        BOOL v37 = v35 < v15;
        int64_t v15 = v35;
        if (v37) {
          goto LABEL_177;
        }
        goto LABEL_111;
      }
LABEL_84:
      if (v19 == 1 || *v16 != 47) {
        goto LABEL_88;
      }
      if ((unint64_t)v28 <= 1) {
        goto LABEL_172;
      }
      int64_t v15 = 1;
LABEL_111:
      if (v27) {
        goto LABEL_173;
      }
      if (v14 >= v55) {
        goto LABEL_174;
      }
      int64_t v9 = *(void *)(a5 + 16);
      if (v14 || v9 == 1) {
        goto LABEL_129;
      }
      if (!v9) {
        goto LABEL_210;
      }
      if (*v17 != 47)
      {
LABEL_129:
        if (v9 <= v14 || !v9) {
          goto LABEL_184;
        }
        if (v14 < 0) {
          goto LABEL_185;
        }
        int64_t v39 = v9 - 1;
        int64_t v40 = v14;
        if (v14 != v9 - 1)
        {
          int64_t v40 = v14;
          while (v40 >= v14 && v40 < v39)
          {
            if (v17[v40] == 47) {
              goto LABEL_127;
            }
            if (v39 == ++v40)
            {
              int64_t v40 = v9 - 1;
LABEL_127:
              if (v40 < v14) {
                goto LABEL_189;
              }
              goto LABEL_128;
            }
          }
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
          goto LABEL_166;
        }
LABEL_128:
        if (v14 == v40) {
          goto LABEL_178;
        }
        if (v14) {
          goto LABEL_134;
        }
      }
      if (v9 == 1 || *v17 != 47)
      {
LABEL_134:
        if (v9 <= v14) {
          goto LABEL_190;
        }
        if (v14 < 0) {
          goto LABEL_191;
        }
        int64_t v41 = v9 - 1;
        int64_t v42 = v14;
        if (v14 != v9 - 1)
        {
          if (v14 >= (unint64_t)(v9 - 1)) {
            goto LABEL_204;
          }
          if (v14 >= (unint64_t)v9) {
            goto LABEL_205;
          }
          int64_t v43 = v14;
          if (v17[v14] == 47)
          {
LABEL_140:
            int64_t v42 = v43 + 1;
          }
          else
          {
            if (v14 + 1 != v41)
            {
              int64_t v43 = v14;
              while (v43 + 1 >= v14 && v43 + 1 < v41)
              {
                int v45 = *(unsigned __int8 *)(a5 + 33 + v43++);
                if (v45 == 47) {
                  goto LABEL_140;
                }
                if (v9 - 2 == v43) {
                  goto LABEL_150;
                }
              }
              goto LABEL_168;
            }
LABEL_150:
            int64_t v42 = v9 - 1;
          }
        }
        if ((uint64_t)v52 <= v42) {
          goto LABEL_179;
        }
        BOOL v37 = v42 < v14;
        int64_t v14 = v42;
        if (v37) {
          goto LABEL_181;
        }
      }
      else
      {
        if (v52 <= 1) {
          goto LABEL_179;
        }
        int64_t v14 = 1;
      }
      if (v15 == v20)
      {
        int64_t v15 = v20;
LABEL_159:
        int64_t v12 = a2;
        int64_t v7 = v49;
        int64_t v10 = v47;
        goto LABEL_160;
      }
    }
  }
  swift_bridgeObjectRetain();
  System::FilePath result = swift_bridgeObjectRetain();
  int64_t v14 = v7;
  int64_t v15 = v10;
LABEL_161:
  *int64_t v13 = v15;
  v13[1] = v54;
  v13[2] = v11;
  void v13[3] = v10;
  int64_t *v12 = v14;
  v12[1] = v55;
  size_t v12[2] = a5;
  v12[3] = v7;
  return result;
}

uint64_t FilePath.append<A>(_:)(uint64_t a1, uint64_t a2)
{
  specialized FilePath.append<A>(_:)(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8);

  return v4(a1, a2);
}

void FilePath.append(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = HIBYTE(a2) & 0xF;
  uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v8 = *v3;
    if (*(void *)(*v3 + 16) == 1)
    {
      uint64_t v9 = swift_bridgeObjectRelease();
      if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
      {
        _StringGuts._slowWithCString<A>(_:)();
        swift_bridgeObjectRelease();
        uint64_t v11 = *(void *)__s;
        goto LABEL_22;
      }
      MEMORY[0x270FA5388](v9);
      if ((a2 & 0x2000000000000000) == 0)
      {
        if ((a1 & 0x1000000000000000) != 0)
        {
          uint64_t v10 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_10:
          uint64_t v11 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v10, v6, (uint64_t (*)(void))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
          swift_bridgeObjectRelease();
LABEL_22:
          *(void *)__s = v11;
          SystemString._normalizeSeparators()();
          *uint64_t v3 = *(void *)__s;
          return;
        }
LABEL_43:
        uint64_t v10 = _StringObject.sharedUTF8.getter();
        uint64_t v6 = v22;
        goto LABEL_10;
      }
      *(void *)__s = a1;
      uint64_t v25 = a2 & 0xFFFFFFFFFFFFFFLL;
      size_t v14 = strlen(__s);
      if (!__OFADD__(v14, 1))
      {
        uint64_t v11 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, v14 + 1);
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      __break(1u);
      goto LABEL_46;
    }
    if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
    {
      _StringGuts._slowWithCString<A>(_:)();
      swift_bridgeObjectRelease();
      uint64_t v13 = *(void *)__s;
    }
    else
    {
      MEMORY[0x270FA5388](a1);
      if ((a2 & 0x2000000000000000) != 0)
      {
        *(void *)__s = a1;
        uint64_t v25 = a2 & 0xFFFFFFFFFFFFFFLL;
        size_t v15 = strlen(__s);
        if (__OFADD__(v15, 1))
        {
LABEL_46:
          __break(1u);
          __break(1u);
          goto LABEL_47;
        }
        uint64_t v13 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, v15 + 1);
        swift_bridgeObjectRelease();
      }
      else
      {
        if ((a1 & 0x1000000000000000) != 0)
        {
          uint64_t v12 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        }
        else
        {
          uint64_t v12 = _StringObject.sharedUTF8.getter();
          uint64_t v6 = v23;
        }
        uint64_t v13 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v12, v6, (uint64_t (*)(void))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
        swift_bridgeObjectRelease();
      }
    }
    *(void *)__s = v13;
    SystemString._normalizeSeparators()();
    uint64_t v16 = *(void *)__s;
    uint64_t v17 = *(void *)(*(void *)__s + 16);
    uint64_t v18 = (char *)(v17 - 1);
    if (v17 == 1) {
      goto LABEL_30;
    }
    if (!v17)
    {
      __break(1u);
      goto LABEL_43;
    }
    if (*(unsigned char *)(*(void *)__s + 32) != 47)
    {
LABEL_30:
      uint64_t v19 = 0;
      if (v17 == 1) {
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v19 = 1;
      if (v17 == 2) {
        goto LABEL_39;
      }
    }
    uint64_t v20 = *(void *)(v8 + 16);
    if (v20 == 1)
    {
      BOOL v21 = 0;
    }
    else
    {
      if (!v20)
      {
LABEL_47:
        __break(1u);
        return;
      }
      BOOL v21 = *(unsigned char *)(v20 + v8 + 30) == 47;
    }
    if (v20 != 1 && !v21) {
      specialized Array.replaceSubrange<A>(_:with:)(v20 - 1, v20 - 1, 47);
    }
    specialized RangeReplaceableCollection.append<A>(contentsOf:)(v19, v18, v16);
LABEL_39:
    swift_bridgeObjectRelease();
    return;
  }

  swift_bridgeObjectRelease();
}

uint64_t *FilePath.appending(_:)@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = result[1];
  uint64_t v5 = (char *)result[2];
  uint64_t v6 = *v2;
  *a2 = *v2;
  if ((char *)v4 != v5)
  {
    uint64_t v7 = *(void *)(v6 + 16);
    if (v7 != 1)
    {
      if (!v7)
      {
        __break(1u);
        return result;
      }
      if (*(unsigned char *)(v7 + v6 + 30) != 47) {
        specialized Array.replaceSubrange<A>(_:with:)(v7 - 1, v7 - 1, 47);
      }
    }
    specialized RangeReplaceableCollection.append<A>(contentsOf:)(v4, v5, v3);
  }

  return (uint64_t *)swift_bridgeObjectRelease();
}

void FilePath.appending(_:)(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = *v3;
  FilePath.append(_:)(a1, a2);
}

uint64_t FilePath.push(_:)(uint64_t result)
{
  uint64_t v2 = *(void *)result;
  uint64_t v3 = *(void *)(*(void *)result + 16);
  uint64_t v4 = (char *)(v3 - 1);
  if (v3 != 1)
  {
    if (v3)
    {
      if (*(unsigned char *)(v2 + 32) == 47)
      {
        System::FilePath result = swift_bridgeObjectRelease();
        *(void *)uint64_t v1 = v2;
        return result;
      }
      uint64_t v5 = *(void *)(*(void *)v1 + 16);
      if (v5 == 1) {
        goto LABEL_9;
      }
      if (v5)
      {
        if (*(unsigned char *)(v5 + *(void *)v1 + 30) != 47) {
          specialized Array.replaceSubrange<A>(_:with:)(v5 - 1, v5 - 1, 47);
        }
LABEL_9:
        specialized RangeReplaceableCollection.append<A>(contentsOf:)(0, v4, v2);
        goto LABEL_10;
      }
    }
    else
    {
      __break(1u);
      __break(1u);
    }
    __break(1u);
    return result;
  }
LABEL_10:

  return swift_bridgeObjectRelease();
}

uint64_t FilePath.pushing(_:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  *a2 = *v2;
  uint64_t v5 = v3;
  return FilePath.push(_:)((uint64_t)&v5);
}

Swift::Void __swiftcall FilePath.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
  if (keepingCapacity)
  {
    uint64_t v2 = *(void *)(*(void *)v1 + 16);
    if (v2)
    {
      specialized Array.replaceSubrange<A>(_:with:)(0, v2 - 1);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = &outlined read-only object #0 of FilePath.removeAll(keepingCapacity:);
  }
}

unint64_t specialized RangeReplaceableCollection.removeAll(keepingCapacity:)(char a1)
{
  unint64_t result = *v1;
  if (a1)
  {
    uint64_t v4 = *(void *)(result + 16);
    if (v4)
    {
      return specialized Array.replaceSubrange<A>(_:with:)(0, v4 - 1);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    unint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = (unint64_t)&outlined read-only object #0 of specialized RangeReplaceableCollection.removeAll(keepingCapacity:);
  }
  return result;
}

uint64_t specialized RangeReplaceableCollection.removeAll(keepingCapacity:)(char a1)
{
  if (a1)
  {
    uint64_t result = v1[1];
    uint64_t v3 = *(void *)(*v1 + 16);
    if (v3 <= result)
    {
      __break(1u);
    }
    else
    {
      return specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(result, v3 - 1);
    }
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = &outlined read-only object #0 of specialized RangeReplaceableCollection.removeAll(keepingCapacity:);
    v1[1] = 0;
  }
  return result;
}

Swift::Void __swiftcall FilePath.reserveCapacity(_:)(Swift::Int a1)
{
  Swift::Int v2 = a1 + 1;
  if (__OFADD__(a1, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = *v1;
    isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v2 > *((void *)v3 + 3) >> 1)
    {
      if (*((void *)v3 + 2) <= v2) {
        int64_t v5 = v2;
      }
      else {
        int64_t v5 = *((void *)v3 + 2);
      }
      uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v5, 0, v3);
    }
    *uint64_t v1 = v3;
  }
}

BOOL FilePath.dirname.getter@<W0>(void *a1@<X8>)
{
  *a1 = *v1;
  swift_bridgeObjectRetain();
  return FilePath.removeLastComponent()();
}

void FilePath.basename.getter(void *a1@<X8>)
{
}

int64_t specialized Sequence<>.elementsEqual<A>(_:)(int64_t result, int64_t a2, uint64_t a3, int64_t a4, int64_t a5, uint64_t a6)
{
  unint64_t v6 = result;
  unint64_t v7 = a4;
  while (1)
  {
    if (v7 == a5)
    {
      int v8 = 0;
      unint64_t v9 = a5;
      goto LABEL_10;
    }
    if ((uint64_t)v7 < a4 || (uint64_t)v7 >= a5) {
      break;
    }
    if ((v7 & 0x8000000000000000) != 0) {
      goto LABEL_23;
    }
    unint64_t v10 = *(void *)(a6 + 16);
    if (v10 <= v7) {
      goto LABEL_24;
    }
    if (v7 >= v10 - 1) {
      goto LABEL_25;
    }
    int v8 = *(unsigned __int8 *)(a6 + 32 + v7);
    unint64_t v9 = v7 + 1;
LABEL_10:
    BOOL v11 = v6 == a2;
    if (v6 == a2)
    {
      int v12 = 0;
      unint64_t v13 = a2;
      if (v7 == a5) {
        return v11;
      }
    }
    else
    {
      if ((uint64_t)v6 < result || (uint64_t)v6 >= a2) {
        goto LABEL_26;
      }
      if ((v6 & 0x8000000000000000) != 0) {
        goto LABEL_27;
      }
      unint64_t v14 = *(void *)(a3 + 16);
      if (v14 <= v6) {
        goto LABEL_28;
      }
      if (v6 >= v14 - 1) {
        goto LABEL_29;
      }
      int v12 = *(unsigned __int8 *)(a3 + 32 + v6);
      unint64_t v13 = v6 + 1;
      if (v7 == a5) {
        return v11;
      }
    }
    BOOL v11 = 0;
    if (v6 != a2)
    {
      unint64_t v6 = v13;
      unint64_t v7 = v9;
      if (v8 == v12) {
        continue;
      }
    }
    return v11;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

int64_t specialized BidirectionalCollection<>.lastIndex(of:)(unsigned __int8 a1, uint64_t a2, int64_t a3, uint64_t a4)
{
  if (a3 == a2) {
    return 0;
  }
  int64_t result = a3 - 1;
  if (__OFSUB__(a3, 1))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (result >= a3) {
    goto LABEL_28;
  }
  if (result < a2) {
    goto LABEL_28;
  }
  if (result < 0) {
    goto LABEL_28;
  }
  unint64_t v6 = *(void *)(a4 + 16);
  if (result >= (uint64_t)(v6 - 1)) {
    goto LABEL_28;
  }
  if (result >= v6)
  {
LABEL_29:
    __break(1u);
    return result;
  }
  if (*(unsigned __int8 *)(a4 + result + 32) != a1)
  {
    if (result == a2) {
      return 0;
    }
    for (int64_t i = a3; ; --i)
    {
      uint64_t v8 = i - 1;
      if (a3 < (uint64_t)0x8000000000000002 || v8 <= a2 || v8 < 1 || a3 - 2 >= (uint64_t)(v6 - 1))
      {
        __break(1u);
        goto LABEL_27;
      }
      if (*(unsigned __int8 *)(a4 + 30 + i) == a1) {
        break;
      }
      if (a2 + 1 == v8) {
        return 0;
      }
    }
    return i - 2;
  }
  return result;
}

Swift::Int specialized RangeReplaceableCollection.remove(at:)@<X0>(Swift::Int result@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *v2;
  if (v2[1] == *(void *)(*v2 + 16) - 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  Swift::Int v5 = result;
  int64_t result = FilePath._parseComponent(startingAt:)(result).componentEnd;
  if (result < v5)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (result == v5)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  Swift::Int v6 = result;
  Swift::tuple_componentEnd_Int_nextStart_Int v7 = FilePath._parseComponent(startingAt:)(v5);
  int64_t result = v7.componentEnd;
  if (v7.nextStart >= v5)
  {
    swift_bridgeObjectRetain();
    int64_t result = specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(v5, v7.nextStart);
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

void *specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *(*v7)(uint64_t *__return_ptr, void *);
  uint64_t v8;
  uint64_t v9;
  void *result;
  uint64_t v11;
  void v12[4];

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    int64_t result = (void *)_StringGuts._slowWithCString<A>(_:)();
    if (!v4) {
      return (void *)v12[3];
    }
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((v6 & 0x2000000000000000) != 0)
    {
      v12[0] = v5;
      v12[1] = v6 & 0xFFFFFFFFFFFFFFLL;
      int64_t result = v7(&v11, v12);
      if (!v4) {
        return (void *)v11;
      }
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFFLL) + 32;
        unint64_t v9 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v8 = _StringObject.sharedUTF8.getter();
      }
      return (void *)_sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v8, v9, (uint64_t (*)(void))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
    }
  }
  return result;
}

BOOL specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32)) {
    return 0;
  }
  uint64_t v3 = (unsigned __int8 *)(a1 + 33);
  uint64_t v4 = (unsigned __int8 *)(a2 + 33);
  uint64_t v5 = v2 - 1;
  do
  {
    BOOL result = v5 == 0;
    if (!v5) {
      break;
    }
    int v8 = *v3++;
    int v7 = v8;
    int v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = specialized BidirectionalCollection._distance(from:to:)(a2, *(void *)(a1 + 16) - 1, a1);
  if (!v4) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v5 = v4;
  if (v4 <= 0)
  {
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<FilePath.Component>);
    uint64_t v6 = (void *)swift_allocObject();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    v6[2] = v5;
    v6[3] = 2 * ((uint64_t)(v7 - 32) / 24);
  }
  uint64_t v8 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)v10, v6 + 4, v5, a1, a2);
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  if (v8 == v5) {
    return (uint64_t)v6;
  }
  __break(1u);
  return result;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    unint64_t v2 = v1 - 1;
    if (v1 != 1)
    {
      uint64_t v3 = result;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SystemChar>);
      uint64_t v4 = swift_allocObject();
      size_t v5 = _swift_stdlib_malloc_size((const void *)v4);
      *(void *)(v4 + 16) = v2;
      *(void *)(v4 + 24) = 2 * v5 - 64;
      uint64_t v6 = specialized Sequence._copySequenceContents(initializing:)(&v7, (unsigned char *)(v4 + 32), v2, v3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v6 == (void *)v2) {
        return v4;
      }
      __break(1u);
    }
    return MEMORY[0x263F8EE78];
  }
  __break(1u);
  return result;
}

unint64_t specialized Array.replaceSubrange<A>(_:with:)(unint64_t result, int64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  unint64_t v7 = *v5;
  int64_t v8 = *(void *)(*v5 + 16);
  if (v8 < a2)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  unint64_t v9 = result;
  unint64_t v10 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  unint64_t v13 = *(void *)(a5 + 16);
  if (v13 <= a3 || v13 <= a4) {
    goto LABEL_32;
  }
  uint64_t v15 = a4 - a3;
  unint64_t v16 = a4 - a3 - v10;
  if (__OFSUB__(a4 - a3, v10))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  int64_t v17 = v8 + v16;
  if (__OFADD__(v8, v16))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v17 > *(void *)(v7 + 24) >> 1)
  {
    if (v8 <= v17) {
      int64_t v18 = v8 + v16;
    }
    else {
      int64_t v18 = v8;
    }
    uint64_t result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v18, 1, (char *)v7);
    unint64_t v7 = result;
  }
  unint64_t v19 = v7 + 32;
  uint64_t v20 = (char *)(v7 + 32 + v9);
  if (v16)
  {
    uint64_t v21 = *(void *)(v7 + 16);
    size_t v22 = v21 - a2;
    if (__OFSUB__(v21, a2))
    {
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    uint64_t result = (unint64_t)&v20[v15];
    uint64_t v23 = (const void *)(v19 + a2);
    if (&v20[v15] != (char *)(v19 + a2) || result >= (unint64_t)v23 + v22) {
      uint64_t result = (unint64_t)memmove((void *)result, v23, v22);
    }
    uint64_t v24 = *(void *)(v7 + 16);
    BOOL v25 = __OFADD__(v24, v16);
    uint64_t v26 = v24 + v16;
    if (v25) {
      goto LABEL_36;
    }
    *(void *)(v7 + 16) = v26;
  }
  if (v15 < 1)
  {
LABEL_28:
    *size_t v5 = v7;
    return result;
  }
  if (__OFADD__(a3, v15))
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if ((uint64_t)a4 >= (uint64_t)a3)
  {
    uint64_t result = (unint64_t)memcpy(v20, (const void *)(a5 + 32 + a3), a4 - a3);
    goto LABEL_28;
  }
LABEL_38:
  __break(1u);
  __break(1u);
  return result;
}

uint64_t specialized FilePath.append<A>(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(result + 16);
  uint64_t v4 = v3 - 1;
  if (v3 - 1 == a2) {
    return result;
  }
  uint64_t v5 = a2;
  uint64_t v6 = result;
  BOOL v25 = (unsigned char *)(result + 32);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v7 = v3 - 2;
  uint64_t v8 = result + 33;
  uint64_t v23 = result + 33;
  uint64_t v24 = v3 - 2;
  uint64_t v26 = v3;
  while (2)
  {
    if (!v4 || v5)
    {
      if (!v3 || v3 <= v5) {
        goto LABEL_82;
      }
      if (v5 < 0) {
        goto LABEL_78;
      }
    }
    else
    {
      if (!v3)
      {
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
        __break(1u);
        goto LABEL_83;
      }
      if (*v25 == 47)
      {
        uint64_t v9 = 1;
        goto LABEL_13;
      }
    }
    uint64_t v9 = v4;
    if (v5 != v4)
    {
      if (v5 >= v4)
      {
LABEL_85:
        __break(1u);
        return result;
      }
      uint64_t v9 = v5;
      if (v25[v5] == 47) {
        goto LABEL_14;
      }
      uint64_t v9 = v4;
      if (v5 + 1 != v4)
      {
        uint64_t v12 = v5;
        while (v12 + 1 >= v5 && v12 + 1 < v4)
        {
          if (*(unsigned char *)(v8 + v12) == 47)
          {
            uint64_t v9 = v12 + 1;
            goto LABEL_13;
          }
          if (v7 == ++v12)
          {
            uint64_t v9 = v4;
            goto LABEL_13;
          }
        }
LABEL_70:
        __break(1u);
        goto LABEL_71;
      }
    }
LABEL_13:
    if (v9 < v5)
    {
LABEL_72:
      __break(1u);
      goto LABEL_73;
    }
LABEL_14:
    if (v5 == v9)
    {
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
      goto LABEL_75;
    }
    if (v3 == 1 || v5)
    {
      if (v3 <= v5)
      {
LABEL_83:
        __break(1u);
        goto LABEL_84;
      }
      if (v5 < 0) {
        goto LABEL_79;
      }
    }
    else if (*v25 == 47)
    {
      uint64_t v10 = 1;
      goto LABEL_47;
    }
    uint64_t v10 = v4;
    if (v5 != v4)
    {
      if (v5 >= v4)
      {
LABEL_84:
        __break(1u);
        goto LABEL_85;
      }
      uint64_t v11 = v5;
      if (v25[v5] == 47)
      {
LABEL_24:
        uint64_t v10 = v11 + 1;
        goto LABEL_47;
      }
      uint64_t v10 = v4;
      if (v5 + 1 != v4)
      {
        uint64_t v11 = v5;
        while (v11 + 1 >= v5 && v11 + 1 < v4)
        {
          int v15 = *(unsigned __int8 *)(v8 + v11++);
          if (v15 == 47) {
            goto LABEL_24;
          }
          if (v7 == v11)
          {
            uint64_t v10 = v4;
            goto LABEL_47;
          }
        }
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
    }
LABEL_47:
    unint64_t v16 = *((void *)*v2 + 2);
    unint64_t v17 = v16 - 1;
    if (v16 == 1)
    {
      uint64_t result = swift_bridgeObjectRetain();
    }
    else
    {
      if (v16 < 2)
      {
LABEL_80:
        __break(1u);
        goto LABEL_81;
      }
      int v18 = (*v2)[v16 + 30];
      uint64_t result = swift_bridgeObjectRetain();
      if (v18 != 47) {
        uint64_t result = specialized Array.replaceSubrange<A>(_:with:)(v17, v17, 47);
      }
    }
    if (v5 >= v9) {
      goto LABEL_74;
    }
    if (v5 < 0)
    {
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    if (v5 >= v26)
    {
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    if (v9 > v26)
    {
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
      goto LABEL_80;
    }
    unint64_t v19 = *v2;
    uint64_t result = swift_bridgeObjectRetain();
    do
    {
      if (v4 == v5)
      {
        __break(1u);
LABEL_69:
        __break(1u);
        goto LABEL_70;
      }
      unint64_t v20 = *((void *)v19 + 2);
      if (!v20) {
        goto LABEL_69;
      }
      char v21 = *(unsigned char *)(v6 + v5 + 32);
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v20 >= *((void *)v19 + 3) >> 1) {
        unint64_t v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v20 + 1, 1, v19);
      }
      uint64_t result = (uint64_t)memmove(&v19[v20 + 32], &v19[v20 + 31], *((void *)v19 + 2) - (v20 - 1));
      ++*((void *)v19 + 2);
      v19[v20 + 31] = v21;
      ++v5;
    }
    while (v9 != v5);
    uint64_t result = swift_bridgeObjectRelease_n();
    *unint64_t v2 = v19;
    uint64_t v5 = v10;
    uint64_t v3 = v26;
    uint64_t v8 = v23;
    uint64_t v7 = v24;
    if (v10 != v4) {
      continue;
    }
    break;
  }

  return swift_bridgeObjectRelease();
}

unint64_t specialized FilePath.append<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v24[0] = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)v24 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  dispatch thunk of Sequence.makeIterator()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v11 = v26;
  if (!v26) {
    return (*(uint64_t (**)(char *, uint64_t))(v24[0] + 8))(v9, AssociatedTypeWitness);
  }
  unint64_t v12 = v27;
  int64_t v13 = v28;
  v24[1] = AssociatedConformanceWitness;
  while (v12 == v13)
  {
    swift_bridgeObjectRelease();
LABEL_4:
    dispatch thunk of IteratorProtocol.next()();
    uint64_t v11 = v26;
    unint64_t v12 = v27;
    int64_t v13 = v28;
    if (!v26) {
      return (*(uint64_t (**)(char *, uint64_t))(v24[0] + 8))(v9, AssociatedTypeWitness);
    }
  }
  unint64_t v14 = *((void *)*v25 + 2);
  unint64_t result = v14 - 1;
  if (v14 == 1)
  {
LABEL_10:
    if ((uint64_t)v12 < v13)
    {
      if ((v12 & 0x8000000000000000) != 0)
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      unint64_t v16 = *(void *)(v11 + 16);
      if (v12 >= v16)
      {
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      if (v13 - 1 >= v16)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      unint64_t v17 = v9;
      uint64_t v18 = AssociatedTypeWitness;
      unint64_t v19 = v16 - 1;
      unint64_t v20 = *v25;
      unint64_t result = swift_bridgeObjectRetain();
      while (v19 != v12)
      {
        unint64_t v21 = *((void *)v20 + 2);
        if (!v21) {
          goto LABEL_25;
        }
        char v22 = *(unsigned char *)(v11 + v12 + 32);
        isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
        if (!isUniquelyReferenced_nonNull_native || v21 >= *((void *)v20 + 3) >> 1) {
          unint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v21 + 1, 1, v20);
        }
        unint64_t result = (unint64_t)memmove(&v20[v21 + 32], &v20[v21 + 31], *((void *)v20 + 2) - (v21 - 1));
        ++*((void *)v20 + 2);
        v20[v21 + 31] = v22;
        if (v13 == ++v12)
        {
          swift_bridgeObjectRelease_n();
          unsigned char *v25 = v20;
          uint64_t AssociatedTypeWitness = v18;
          uint64_t v9 = v17;
          goto LABEL_4;
        }
      }
      __break(1u);
LABEL_25:
      __break(1u);
    }
    __break(1u);
    goto LABEL_27;
  }
  if (v14 >= 2)
  {
    if ((*v25)[v14 + 30] != 47) {
      unint64_t result = specialized Array.replaceSubrange<A>(_:with:)(result, v14 - 1, 47);
    }
    goto LABEL_10;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t *sub_2156863E0(long long *a1)
{
  long long v2 = *a1;
  swift_bridgeObjectRetain();
  return FilePath.root.setter((uint64_t *)&v2);
}

int64_t sub_215686420@<X0>(int64_t *a1@<X8>)
{
  int64_t result = FilePath.extension.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21568645C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  long long v2 = (void *)a1[1];
  swift_bridgeObjectRetain();
  return FilePath.extension.setter(v1, v2);
}

uint64_t String.withPlatformString<A>(_:)()
{
  return String._withPlatformString<A>(_:)();
}

uint64_t type metadata accessor for _RawBuffer.Storage()
{
  uint64_t result = type metadata singleton initialization cache for _RawBuffer.Storage;
  if (!type metadata singleton initialization cache for _RawBuffer.Storage) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for _RawBuffer.Storage()
{
  return swift_initClassMetadata2();
}

uint64_t _RawBuffer.Storage.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t ObjC metadata update function for _RawBuffer.Storage()
{
  return type metadata accessor for _RawBuffer.Storage();
}

void *initializeBufferWithCopyOfBuffer for _RawBuffer(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for _RawBuffer()
{
  return swift_release();
}

void *assignWithCopy for _RawBuffer(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for _RawBuffer(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _RawBuffer(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for _RawBuffer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _RawBuffer()
{
  return &type metadata for _RawBuffer;
}

int64_t FilePath.Component._extensionRange()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  int64_t v3 = v0[2];
  FilePath.Component.kind.getter();
  if (v4 != 2) {
    return 0;
  }
  int64_t v5 = specialized BidirectionalCollection<>.lastIndex(of:)(0x2Eu, v2, v3, v1);
  int64_t result = 0;
  if ((v7 & 1) == 0 && v5 != v2)
  {
    if (v5 < 0 || v5 >= *(void *)(v1 + 16) - 1)
    {
      __break(1u);
    }
    else if (v3 > v5)
    {
      return v5 + 1;
    }
    __break(1u);
  }
  return result;
}

void FilePath.Component.kind.getter()
{
  uint64_t v1 = *v0;
  int64_t v2 = *(void *)(*v0 + 16);
  if (!v2)
  {
    __break(1u);
    goto LABEL_8;
  }
  int64_t v3 = v0[1];
  if (v3 < 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  int64_t v4 = v0[2];
  if (v2 <= v4)
  {
LABEL_9:
    __break(1u);
    return;
  }
  if ((specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #0 of FilePath.Component.kind.getter, v0[1], v0[2], *v0) & 1) == 0)specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #1 of FilePath.Component.kind.getter, v3, v4, v1); {
}
  }

BOOL static FilePath.Component.Kind.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

System::SystemString __swiftcall _makeExtension(_:)(Swift::String a1)
{
  unint64_t object = (unint64_t)a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  specialized Array.replaceSubrange<A>(_:with:)(0, 0, 46);
  if ((object & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(object) & 0xF;
  }
  else {
    uint64_t v3 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  if (!v3) {
    return (System::SystemString)&outlined read-only object #0 of _makeExtension(_:);
  }
  int64_t v4 = (char *)&outlined read-only object #0 of _makeExtension(_:);
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (1)
  {
    if ((object & 0x1000000000000000) != 0)
    {
      unsigned int v6 = _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
    }
    else
    {
      if ((object & 0x2000000000000000) == 0 && (countAndFlagsBits & 0x1000000000000000) == 0) {
        _StringObject.sharedUTF8.getter();
      }
      unsigned int v6 = _decodeScalar(_:startingAt:)();
    }
    char v8 = v6;
    uint64_t v9 = v7;
    if (v6 > 0x7F) {
      break;
    }
    unint64_t v10 = *((void *)v4 + 2);
    if (!v10) {
      goto LABEL_20;
    }
    isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v10 >= *((void *)v4 + 3) >> 1) {
      int64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v10 + 1, 1, v4);
    }
    memmove(&v4[v10 + 32], &v4[v10 + 31], *((void *)v4 + 2) - (v10 - 1));
    ++*((void *)v4 + 2);
    v4[v10 + 31] = v8;
    v5 += v9;
    if (v5 >= v3) {
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  swift_bridgeObjectRelease();
  return (System::SystemString)v4;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.Root.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void protocol witness for Hashable.hash(into:) in conformance FilePath.Root.CodingKeys()
{
  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FilePath.Root.CodingKeys()
{
  if (*v0) {
    return 0x646E45746F6F725FLL;
  }
  else {
    return 0x687461705FLL;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance FilePath.Root.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized FilePath.Root.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance FilePath.Root.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance FilePath.Root.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FilePath.Root.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.Root.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FilePath.Root.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FilePath.Root.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FilePath.Component.CodingKeys()
{
  if (*v0) {
    return 0x65676E61725FLL;
  }
  else {
    return 0x687461705FLL;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance FilePath.Component.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized FilePath.Component.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FilePath.Component.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.Component.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void FilePath.Component.Kind.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int FilePath.Component.Kind.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.Component.Kind(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _StrSlice._withPlatformString<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  size_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 40))(a1, a3);
  unint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a1, a3);
  Slice<>.withPlatformString<A>(_:)(v9, v10, v8, a2, a4);
  return swift_bridgeObjectRelease();
}

void specialized _StrSlice.hash(into:)(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16);
  if (v4 <= a3 || v4 <= a4) {
    goto LABEL_14;
  }
  Hasher._combine(_:)(a4 - a3);
  unint64_t v9 = a4 - a3;
  if (a4 != a3)
  {
    if (a4 <= a3)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    if (a4 - 1 >= v4)
    {
LABEL_16:
      __break(1u);
      return;
    }
    unint64_t v10 = ~a3 + v4;
    uint64_t v11 = (Swift::UInt8 *)(a3 + a2 + 32);
    while (v10)
    {
      Swift::UInt8 v12 = *v11++;
      Hasher._combine(_:)(v12);
      --v10;
      if (!--v9) {
        return;
      }
    }
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
}

void specialized _StrSlice.hash(into:)(int a1, uint64_t a2, Swift::UInt a3)
{
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  Swift::UInt v3 = a3;
  unint64_t v5 = *(void *)(a2 + 16);
  if (v5 <= a3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  Hasher._combine(_:)(a3);
  if (v3)
  {
    if (v3 - 1 >= v5)
    {
LABEL_12:
      __break(1u);
      return;
    }
    unsigned int v6 = (Swift::UInt8 *)(a2 + 32);
    for (unint64_t i = v5 - 1; i; --i)
    {
      Swift::UInt8 v8 = *v6++;
      Hasher._combine(_:)(v8);
      if (!--v3) {
        return;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
}

void specialized _StrSlice.hash(into:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v3 = *(void *)(a2 + 16);
  if (v3 <= (uint64_t)a3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!v3)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  Hasher._combine(_:)(v3 - 1 - a3);
  if (v3 - 1 != a3)
  {
    if (v3 - 1 <= a3)
    {
LABEL_14:
      __break(1u);
      return;
    }
    unint64_t v6 = ~a3 + v3;
    uint64_t v7 = (Swift::UInt8 *)(a3 + a2 + 32);
    while (v6)
    {
      Swift::UInt8 v8 = *v7++;
      Hasher._combine(_:)(v8);
      if (!--v6) {
        return;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

uint64_t FilePath.Component.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<FilePath.Component.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v11 = v1[2];
  uint64_t v12 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v13 = v9;
  char v15 = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    uint64_t v13 = v12;
    uint64_t v14 = v11;
    char v15 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
    lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int FilePath.Component.hashValue.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  unint64_t v3 = v0[2];
  Hasher.init(_seed:)();
  specialized _StrSlice.hash(into:)((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

uint64_t FilePath.Component.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FilePath.Component.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v13 = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v9 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
  char v13 = 1;
  lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  long long v10 = v12;
  *(void *)a2 = v9;
  *(_OWORD *)(a2 + 8) = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for _StrSlice._storage.getter in conformance FilePath.Component()
{
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for _StrSlice._range.getter in conformance FilePath.Component()
{
  return *(void *)(v0 + 8);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FilePath.Component()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  unint64_t v3 = v0[2];
  Hasher.init(_seed:)();
  specialized _StrSlice.hash(into:)((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance FilePath.Component(uint64_t a1)
{
  specialized _StrSlice.hash(into:)(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16));
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FilePath.Component()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  unint64_t v3 = v0[2];
  Hasher.init(_seed:)();
  specialized _StrSlice.hash(into:)((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance FilePath.Component@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return FilePath.Component.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FilePath.Component(void *a1)
{
  return FilePath.Component.encode(to:)(a1);
}

int64_t protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.Component(uint64_t *a1, uint64_t *a2)
{
  return specialized Sequence<>.elementsEqual<A>(_:)(a2[1], a2[2], *a2, a1[1], a1[2], *a1);
}

uint64_t FilePath.Root.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<FilePath.Root.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v13 = v8;
  char v12 = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    char v11 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void FilePath.Root.hashValue.getter()
{
  uint64_t v2 = *v0;
  Swift::UInt v1 = v0[1];
  Hasher.init(_seed:)();
  if ((v1 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  Swift::UInt v3 = *(void *)(v2 + 16);
  if (v3 <= v1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  Hasher._combine(_:)(v1);
  if (!v1)
  {
LABEL_8:
    Hasher._finalize()();
    return;
  }
  if (v1 - 1 < *(void *)(v2 + 16))
  {
    uint64_t v4 = (Swift::UInt8 *)(v2 + 32);
    Swift::UInt v5 = v3 - 1;
    while (v5)
    {
      Swift::UInt8 v6 = *v4++;
      Hasher._combine(_:)(v6);
      --v5;
      if (!--v1) {
        goto LABEL_8;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  __break(1u);
}

uint64_t FilePath.Root.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FilePath.Root.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v12[15] = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v9 = v13;
  v12[14] = 1;
  swift_bridgeObjectRetain();
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for _StrSlice._range.getter in conformance FilePath.Root()
{
  if ((*(void *)(v0 + 8) & 0x8000000000000000) == 0) {
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t FilePath.Root.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  SystemString._normalizeSeparators()();
  uint64_t result = a1;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4 == 1)
  {
LABEL_6:
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = 0;
    a2[1] = 0;
    return result;
  }
  if (v4)
  {
    if (*(unsigned char *)(a1 + 32) == 47 && v4 == 2)
    {
      *a2 = a1;
      a2[1] = 1;
      return result;
    }
    goto LABEL_6;
  }
  __break(1u);
  __break(1u);
  return result;
}

void protocol witness for Hashable.hash(into:) in conformance FilePath.Root(int a1)
{
  specialized _StrSlice.hash(into:)(a1, *(void *)v1, *(void *)(v1 + 8));
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance FilePath.Root()
{
  uint64_t v2 = *v0;
  Swift::UInt v1 = v0[1];
  Hasher.init(_seed:)();
  if ((v1 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v3 = *(void *)(v2 + 16);
  if (v3 <= v1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  Hasher._combine(_:)(v1);
  if (!v1)
  {
LABEL_8:
    Hasher._finalize()();
    return;
  }
  if (v1 - 1 < v3)
  {
    uint64_t v4 = (Swift::UInt8 *)(v2 + 32);
    unint64_t v5 = v3 - 1;
    while (v5)
    {
      Swift::UInt8 v6 = *v4++;
      Hasher._combine(_:)(v6);
      --v5;
      if (!--v1) {
        goto LABEL_8;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  __break(1u);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FilePath.Root@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return FilePath.Root.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FilePath.Root(void *a1)
{
  return FilePath.Root.encode(to:)(a1);
}

uint64_t *protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.Root(uint64_t *result, uint64_t *a2)
{
  int64_t v3 = result[1];
  int64_t v4 = a2[1];
  if (((v4 | v3) & 0x8000000000000000) == 0) {
    return (uint64_t *)specialized Sequence<>.elementsEqual<A>(_:)(0, v4, *a2, 0, v3, *result);
  }
  __break(1u);
  return result;
}

uint64_t FilePath._withPlatformString<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return SystemString.withPlatformString<A>(_:)(a1, a2);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath and conformance FilePath()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePath and conformance FilePath;
  if (!lazy protocol witness table cache variable for type FilePath and conformance FilePath)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath and conformance FilePath);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath and conformance FilePath;
  if (!lazy protocol witness table cache variable for type FilePath and conformance FilePath)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath and conformance FilePath);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath and conformance FilePath;
  if (!lazy protocol witness table cache variable for type FilePath and conformance FilePath)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath and conformance FilePath);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath and conformance FilePath;
  if (!lazy protocol witness table cache variable for type FilePath and conformance FilePath)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath and conformance FilePath);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath and conformance FilePath;
  if (!lazy protocol witness table cache variable for type FilePath and conformance FilePath)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath and conformance FilePath);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<Int>);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

{
  uint64_t result;

  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<Int>);
    lazy protocol witness table accessor for type Int and conformance Int();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.Component.Kind and conformance FilePath.Component.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component.Kind and conformance FilePath.Component.Kind;
  if (!lazy protocol witness table cache variable for type FilePath.Component.Kind and conformance FilePath.Component.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component.Kind and conformance FilePath.Component.Kind);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for FilePath.Component(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for FilePath.Component(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for FilePath.Component(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component);
}

unint64_t instantiation function for generic protocol witness table for FilePath.Root(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for FilePath.Root(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for FilePath.Component(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root);
}

uint64_t instantiation function for generic protocol witness table for FilePath.Component(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  a1[1] = a4();
  a1[2] = a5();
  uint64_t result = a6();
  a1[3] = result;
  return result;
}

void *assignWithCopy for FilePath.Root(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for FilePath.Root(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for FilePath.Root(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

void *assignWithCopy for FilePath.Component(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for FilePath.Component(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t storeEnumTagSinglePayload for FilePath.Component(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FilePath.Component.Kind(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FilePath.Component.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x215688570);
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

uint64_t getEnumTag for FilePath.Component.Kind(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for FilePath.Component.Kind(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FilePath.Component.Kind()
{
  return &type metadata for FilePath.Component.Kind;
}

unsigned char *destructiveInjectEnumTag for FilePath.Root.CodingKeys(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for FilePath.Root.CodingKeys()
{
  return &unk_26C63D328;
}

uint64_t getEnumTagSinglePayload for FilePath.Root.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FilePath.Root.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x215688738);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

void *type metadata accessor for FilePath.Component.CodingKeys()
{
  return &unk_26C63D4B0;
}

uint64_t specialized FilePath.Root.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x687461705FLL && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646E45746F6F725FLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized FilePath.Component.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x687461705FLL && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65676E61725FLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FilePath.ComponentView.CodingKeys()
{
  if (*v0) {
    return 0x74726174735FLL;
  }
  else {
    return 0x687461705FLL;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance FilePath.ComponentView.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized FilePath.ComponentView.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FilePath.ComponentView.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.ComponentView.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t key path setter for FilePath.components : FilePath(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  int v3 = FilePath.components.modify((uint64_t (*)(uint64_t))v6);
  *unsigned int v4 = v1;
  v4[1] = v2;
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(unsigned char *, void))v3)(v6, 0);
}

uint64_t *FilePath.components.setter(uint64_t *result)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  size_t v4 = *v1;
  uint64_t v5 = *(void *)(*v1 + 16);
  if (v5 == 1) {
    goto LABEL_6;
  }
  if (!v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (*(unsigned char *)(v4 + 32) != 47)
  {
LABEL_6:
    char v6 = (uint64_t *)&outlined read-only object #0 of FilePath.components.setter;
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  uint64_t result = (uint64_t *)specialized SystemString.init<A>(_:)(0, 1uLL, v4);
  if (!*(void *)(v4 + 16))
  {
LABEL_11:
    __break(1u);
    return result;
  }
  char v6 = result;
LABEL_7:
  swift_bridgeObjectRelease();
  *uint64_t v1 = (uint64_t)&outlined read-only object #1 of FilePath.components.setter;
  v7[0] = v2;
  v7[1] = v3;
  $defer #1 () in FilePath.components.modify(v1, v7, (uint64_t)v6);
  swift_bridgeObjectRelease();

  return (uint64_t *)swift_bridgeObjectRelease();
}

BOOL static FilePath.ComponentView.Index.< infix(_:_:)(void *a1, void *a2)
{
  return *a1 < *a2;
}

void FilePath.ComponentView.Index.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

BOOL static FilePath.ComponentView.Index.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int FilePath.ComponentView.Index.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance FilePath.ComponentView.Index(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance FilePath.ComponentView.Index(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance FilePath.ComponentView.Index(void *a1, void *a2)
{
  return *a2 < *a1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FilePath.ComponentView.Index()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance FilePath.ComponentView.Index()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FilePath.ComponentView.Index()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void FilePath.ComponentView.endIndex.getter(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)v1 + 16) - 1;
}

Swift::Int FilePath.ComponentView.index(after:)@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::tuple_componentEnd_Int_nextStart_Int v4 = FilePath._parseComponent(startingAt:)(*a1);
  Swift::Int result = v4.componentEnd;
  *a2 = v4.nextStart;
  return result;
}

uint64_t FilePath.ComponentView.index(before:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = FilePath._parseComponent(priorTo:)(*a1);
  *a2 = result;
  return result;
}

Swift::Int FilePath.ComponentView.subscript.getter@<X0>(Swift::Int *a1@<X0>, void *a2@<X8>)
{
  Swift::Int v4 = *a1;
  uint64_t v5 = *v2;
  Swift::Int result = FilePath._parseComponent(startingAt:)(*a1).componentEnd;
  if (result < v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v4 == result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  *a2 = v5;
  a2[1] = v4;
  a2[2] = result;

  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for BidirectionalCollection.index(before:) in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = FilePath._parseComponent(priorTo:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for BidirectionalCollection.formIndex(before:) in conformance FilePath.ComponentView(uint64_t *a1)
{
  uint64_t result = FilePath._parseComponent(priorTo:)(*a1);
  *a1 = result;
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:) in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return specialized BidirectionalCollection.index(_:offsetBy:)(*a1, a2, *v3, a3);
}

uint64_t specialized BidirectionalCollection.index(_:offsetBy:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  if (a2 < 0)
  {
    uint64_t v13 = 0;
    do
    {
      --v13;
      uint64_t result = FilePath._parseComponent(priorTo:)(result);
    }
    while (v13 > a2);
    goto LABEL_32;
  }
  if (!a2)
  {
LABEL_32:
    *a4 = result;
    return result;
  }
  uint64_t v6 = 0;
  BOOL v7 = (unsigned char *)(a3 + 32);
  uint64_t v8 = *(void *)(a3 + 16);
  unint64_t v9 = v8 - 1;
  uint64_t v10 = result;
  while (1)
  {
    if (!v10 && v8 != 1)
    {
      if (!v8) {
        goto LABEL_37;
      }
      if (*v7 == 47)
      {
        uint64_t result = 1;
        goto LABEL_5;
      }
    }
    if (v8 <= v10 || !v8) {
      break;
    }
    if (v10 < 0) {
      goto LABEL_34;
    }
    if (v10 == v9)
    {
      uint64_t result = v10;
    }
    else
    {
      if (v10 >= v9) {
        goto LABEL_35;
      }
      if (v10 >= (unint64_t)v8) {
        goto LABEL_36;
      }
      if (v7[v10] == 47) {
        goto LABEL_29;
      }
      uint64_t result = v8 - 1;
      if (v10 + 1 != v9)
      {
        uint64_t v11 = v10;
        while (1)
        {
          if (v11 + 1 < v10 || v11 + 1 >= (uint64_t)v9)
          {
            __break(1u);
            goto LABEL_33;
          }
          if (*(unsigned char *)(a3 + 33 + v11) == 47) {
            break;
          }
          if (v8 - 2 == ++v11)
          {
            uint64_t result = v8 - 1;
            goto LABEL_5;
          }
        }
        uint64_t v10 = v11 + 1;
LABEL_29:
        uint64_t result = v10 + 1;
      }
    }
LABEL_5:
    ++v6;
    uint64_t v10 = result;
    if (v6 == a2) {
      goto LABEL_32;
    }
  }
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:limitedBy:) in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return specialized BidirectionalCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4, a4);
}

uint64_t specialized BidirectionalCollection.index(_:offsetBy:limitedBy:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  if (a2 < 0)
  {
    uint64_t v16 = 0;
    while (1)
    {
      BOOL v15 = result == a3;
      if (result == a3) {
        break;
      }
      --v16;
      uint64_t result = FilePath._parseComponent(priorTo:)(result);
      if (v16 <= a2) {
        goto LABEL_42;
      }
    }
    uint64_t result = 0;
LABEL_42:
    *(void *)a5 = result;
    *(unsigned char *)(a5 + 8) = v15;
    return result;
  }
  if (!a2)
  {
    BOOL v15 = 0;
    goto LABEL_42;
  }
  if (result == a3)
  {
LABEL_34:
    uint64_t result = 0;
    BOOL v15 = 1;
    goto LABEL_42;
  }
  uint64_t v8 = (unsigned char *)(a4 + 32);
  uint64_t v9 = *(void *)(a4 + 16);
  uint64_t v10 = v9 - 1;
  uint64_t v11 = 1;
  while (!result && v9 != 1)
  {
    if (!v9) {
      goto LABEL_49;
    }
    if (*v8 != 47) {
      break;
    }
    if (v11 >= a2)
    {
      BOOL v15 = 0;
      uint64_t result = 1;
      goto LABEL_42;
    }
    uint64_t v12 = 1;
LABEL_33:
    ++v11;
    uint64_t result = v12;
    if (v12 == a3) {
      goto LABEL_34;
    }
  }
  if (v9 > result && v9)
  {
    if (result < 0) {
      goto LABEL_45;
    }
    if (result == v10)
    {
      uint64_t v12 = result;
      goto LABEL_32;
    }
    if (result >= (unint64_t)v10) {
      goto LABEL_46;
    }
    if (result >= (unint64_t)v9) {
      goto LABEL_47;
    }
    if (v8[result] != 47)
    {
      uint64_t v12 = v9 - 1;
      if (result + 1 == v10)
      {
LABEL_32:
        if (v11 >= a2)
        {
          BOOL v15 = 0;
          uint64_t result = v12;
          goto LABEL_42;
        }
        goto LABEL_33;
      }
      uint64_t v13 = result;
      while (1)
      {
        if (v13 + 1 < result || v13 + 1 >= v10)
        {
          __break(1u);
          goto LABEL_44;
        }
        if (*(unsigned char *)(a4 + 33 + v13) == 47) {
          break;
        }
        if (v9 - 2 == ++v13)
        {
          uint64_t v12 = v9 - 1;
          goto LABEL_32;
        }
      }
      uint64_t result = v13 + 1;
    }
    if (result >= v10) {
      goto LABEL_48;
    }
    uint64_t v12 = result + 1;
    goto LABEL_32;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

uint64_t protocol witness for BidirectionalCollection.distance(from:to:) in conformance FilePath.ComponentView(uint64_t *a1, uint64_t *a2)
{
  return specialized BidirectionalCollection._distance(from:to:)(*a1, *a2, *v2);
}

void protocol witness for Collection.startIndex.getter in conformance FilePath.ComponentView(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8);
}

uint64_t protocol witness for Collection.subscript.getter in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = *v2;
  uint64_t v5 = v2[1];
  uint64_t v6 = *(void *)(*v2 + 16);
  if (v6 <= v5)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v7 = *a1;
  if (*a1 < v5)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v8 = a1[1];
  if (v6 > v8)
  {
    a2[2] = result;
    a2[3] = v5;
    *a2 = v7;
    a2[1] = v8;
    return swift_bridgeObjectRetain();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  uint64_t v4 = *(void *)(v2 + 16) - 1;
  a1[2] = v3;
  a1[3] = v4;
  return swift_bridgeObjectRetain();
}

BOOL protocol witness for Collection.isEmpty.getter in conformance FilePath.ComponentView()
{
  return v0[1] == *(void *)(*v0 + 16) - 1;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance FilePath.ComponentView(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance FilePath.ComponentView(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance FilePath.ComponentView(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance FilePath.ComponentView()
{
  return specialized BidirectionalCollection._distance(from:to:)(v0[1], *(void *)(*v0 + 16) - 1, *v0);
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance FilePath.ComponentView()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance FilePath.ComponentView()
{
  uint64_t v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0, v0[1]);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance FilePath.ComponentView(uint64_t a1, void *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3, v3[1]);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance FilePath.ComponentView()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

void FilePath.ComponentView.init()(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of FilePath.ComponentView.init();
  a1[1] = 0;
}

int64_t specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(int64_t result, int64_t a2)
{
  uint64_t v3 = *(void *)(*v2 + 16) - 1;
  if (v2[1] == v3)
  {
    if ((unint64_t)SystemString._parseRoot()().relativeBegin)
    {
      size_t relativeBegin = SystemString._parseRoot()().relativeBegin;
      int64_t v5 = swift_bridgeObjectRetain();
    }
    else
    {
      int64_t v5 = 0;
      size_t relativeBegin = 0;
    }
    specialized FilePath.init<A>(root:_:)(v5, relativeBegin, &v10);
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v2 = v10;
    return result;
  }
  if (a2 < result)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t result = specialized Array.replaceSubrange<A>(_:with:)(result, a2);
  if (v3 != a2) {
    return result;
  }
  uint64_t v7 = *v2;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v8 = SystemString._parseRoot()();
  uint64_t result = v8.rootEnd;
  if (v8.relativeBegin == *(void *)(v7 + 16) - 1) {
    return result;
  }
  uint64_t result = specialized BidirectionalCollection.last.getter(v7);
  if ((result & 0x100) != 0)
  {
LABEL_20:
    __break(1u);
    return result;
  }
  if (result != 47) {
    return result;
  }
  uint64_t v9 = *(void *)(v7 + 16);
  if (v9 == 1) {
    goto LABEL_18;
  }
  if (!v9)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  return specialized RangeReplaceableCollection.remove(at:)(v9 - 2);
}

int64_t specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(int64_t result, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  size_t v10 = *v5;
  uint64_t v11 = *(void *)(v10 + 16) - 1;
  if (v6[1] == v11)
  {
    if ((unint64_t)SystemString._parseRoot()().relativeBegin)
    {
      size_t relativeBegin = SystemString._parseRoot()().relativeBegin;
      swift_bridgeObjectRetain();
      size_t v13 = v10;
    }
    else
    {
      size_t v13 = 0;
      size_t relativeBegin = 0;
    }
    swift_bridgeObjectRetain();
    specialized FilePath.init<A>(root:_:)(v13, relativeBegin, a3, a4, a5, &v28);
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v6 = v28;
    return result;
  }
  unint64_t v14 = result;
  if (a2 < result) {
    goto LABEL_33;
  }
  BOOL v15 = (char *)&outlined read-only object #0 of specialized FilePath.ComponentView.replaceSubrange<A>(_:with:);
  int64_t v28 = (char *)&outlined read-only object #0 of specialized FilePath.ComponentView.replaceSubrange<A>(_:with:);
  if (v11 == result)
  {
    specialized Array.replaceSubrange<A>(_:with:)(0, 0, 47);
    BOOL v15 = v28;
  }
  uint64_t v16 = a5 - a4;
  if (v16)
  {
    char v22 = (char *)(a3 + 32 + a4);
    unint64_t v23 = *((void *)v15 + 2);
    uint64_t result = swift_bridgeObjectRetain();
    while (v23)
    {
      char v25 = *v22;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v23 >= *((void *)v15 + 3) >> 1) {
        BOOL v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v23 + 1, 1, v15);
      }
      uint64_t v24 = &v15[v23 + 31];
      uint64_t result = (int64_t)memmove(&v15[v23 + 32], v24, *((void *)v15 + 2) - (v23 - 1));
      unint64_t v23 = *((void *)v15 + 2) + 1;
      *((void *)v15 + 2) = v23;
      *uint64_t v24 = v25;
      ++v22;
      if (!--v16) {
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  swift_bridgeObjectRetain();
LABEL_9:
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v17 = *((void *)v15 + 2);
  if (!v17) {
    goto LABEL_34;
  }
  unint64_t v18 = v17 - 1;
  unint64_t v19 = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!v19 || v17 >= *((void *)v15 + 3) >> 1) {
    BOOL v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v19, v17 + 1, 1, v15);
  }
  memmove(&v15[v17 + 32], &v15[v18 + 32], *((void *)v15 + 2) - v18);
  ++*((void *)v15 + 2);
  v15[v18 + 32] = 47;
  int64_t v28 = v15;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v20 = SystemString._parseRoot()();
  unint64_t v21 = *((void *)v15 + 2);
  if (v20.relativeBegin == v21 - 1) {
    goto LABEL_19;
  }
  uint64_t result = specialized BidirectionalCollection.last.getter((uint64_t)v15);
  if ((result & 0x100) != 0)
  {
LABEL_37:
    __break(1u);
    return result;
  }
  if (result == 47)
  {
    if (v21 != 1)
    {
      uint64_t result = v21 - 2;
      if (v21 >= 2)
      {
        specialized RangeReplaceableCollection.remove(at:)(result);
        BOOL v15 = v28;
        goto LABEL_19;
      }
      goto LABEL_36;
    }
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  SystemString._normalizeSeparators()();
  swift_bridgeObjectRelease();
  if (v11 != v14)
  {
    specialized Array.replaceSubrange<A>(_:with:)(*((void *)v15 + 2) - 1, *((void *)v15 + 2) - 1, 47);
    BOOL v15 = v28;
  }
  specialized Array.replaceSubrange<A>(_:with:)(v14, a2, (uint64_t)v15);
  return swift_bridgeObjectRelease();
}

int64_t specialized FilePath.init<A>(root:_:)@<X0>(int64_t result@<X0>, size_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (result)
  {
    if ((a2 & 0x8000000000000000) != 0)
    {
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    BOOL v4 = (void *)specialized SystemString.init<A>(_:)(0, a2, result);
  }
  else
  {
    BOOL v4 = &outlined read-only object #0 of specialized FilePath.init<A>(root:_:);
  }
  unint64_t v21 = v4;
  uint64_t result = specialized SystemString.appendComponents<A>(components:)();
  uint64_t v5 = (uint64_t)v21;
  uint64_t v20 = (uint64_t)v21;
  unint64_t v6 = v21[2];
  if (v6 == 1)
  {
LABEL_43:
    *a3 = v5;
    return result;
  }
  if (!v6) {
    goto LABEL_55;
  }
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  while (1)
  {
    if (v6 <= v7)
    {
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    int v9 = *(unsigned __int8 *)(v5 + 32 + v7);
    if (v8 != v7)
    {
      if (v6 <= v8) {
        goto LABEL_46;
      }
      char v10 = *(unsigned char *)(v5 + 32 + v8);
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (int64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v5);
        uint64_t v5 = result;
      }
      unint64_t v11 = *(void *)(v5 + 16);
      if (v8 >= v11) {
        goto LABEL_47;
      }
      *(unsigned char *)(v5 + 32 + v8) = v9;
      if (v11 <= v7) {
        goto LABEL_48;
      }
      *(unsigned char *)(v5 + 32 + v7) = v10;
      uint64_t v20 = v5;
      unint64_t v6 = *(void *)(v5 + 16);
    }
    int64_t v12 = v6 - 1;
    if ((uint64_t)v7 >= (uint64_t)(v6 - 1) || (uint64_t)v8 >= v12) {
      goto LABEL_45;
    }
    ++v8;
    unint64_t v13 = v7 + 1;
    if (v9 == 47 && (uint64_t)v13 < v12)
    {
      if (v13 >= v6) {
        goto LABEL_49;
      }
      if (*(unsigned char *)(v5 + v13 + 32) == 47) {
        break;
      }
    }
LABEL_8:
    unint64_t v7 = v13;
    if ((uint64_t)v13 >= v12) {
      goto LABEL_30;
    }
  }
  while (v6 - 3 != v7)
  {
    int v15 = *(unsigned __int8 *)(v5 + 34 + v7++);
    if (v15 != 47)
    {
      unint64_t v13 = v7 + 1;
      goto LABEL_8;
    }
  }
  unint64_t v13 = v6 - 1;
LABEL_30:
  if (v8 >= v6 || v13 >= v6) {
    goto LABEL_55;
  }
  unint64_t v16 = v13 - v8;
  if (v16)
  {
    if ((v16 & 0x8000000000000000) != 0) {
      goto LABEL_51;
    }
    uint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(v6 - 1, -(uint64_t)v16, 0, v5);
    if (v17) {
      goto LABEL_56;
    }
    if ((uint64_t)v6 <= result) {
      goto LABEL_52;
    }
    specialized Array.replaceSubrange<A>(_:with:)(result, v6 - 1);
    uint64_t v5 = v20;
  }
  Swift::tuple_rootEnd_Int_relativeBegin_Int v18 = SystemString._parseRoot()();
  uint64_t result = v18.rootEnd;
  unint64_t v19 = *(void *)(v5 + 16);
  if (v18.relativeBegin == v19 - 1) {
    goto LABEL_43;
  }
  uint64_t result = specialized BidirectionalCollection.last.getter(v5);
  if ((result & 0x100) != 0) {
    goto LABEL_57;
  }
  if (result != 47) {
    goto LABEL_43;
  }
  if (v19 != 1)
  {
    uint64_t result = v19 - 2;
    if (v19 < 2) {
      goto LABEL_54;
    }
    uint64_t result = specialized RangeReplaceableCollection.remove(at:)(result);
    uint64_t v5 = v20;
    goto LABEL_43;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

void specialized FilePath.init<A>(root:_:)(size_t a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char **a6@<X8>)
{
  if (!a1)
  {
    char v10 = (char *)&outlined read-only object #0 of specialized FilePath.init<A>(root:_:);
    uint64_t v11 = a5 - a4;
    if (a5 == a4) {
      goto LABEL_4;
    }
LABEL_17:
    Swift::tuple_rootEnd_Int_relativeBegin_Int v18 = (char *)(a3 + 32 + a4);
    unint64_t v19 = *((void *)v10 + 2);
    swift_bridgeObjectRetain();
    while (v19)
    {
      char v21 = *v18;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v19 >= *((void *)v10 + 3) >> 1) {
        char v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v19 + 1, 1, v10);
      }
      uint64_t v20 = &v10[v19 + 31];
      memmove(&v10[v19 + 32], v20, *((void *)v10 + 2) - (v19 - 1));
      unint64_t v19 = *((void *)v10 + 2) + 1;
      *((void *)v10 + 2) = v19;
      *uint64_t v20 = v21;
      ++v18;
      if (!--v11) {
        goto LABEL_5;
      }
    }
    __break(1u);
    goto LABEL_25;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  char v10 = (char *)specialized SystemString.init<A>(_:)(0, a2, a1);
  uint64_t v11 = a5 - a4;
  if (v11) {
    goto LABEL_17;
  }
LABEL_4:
  swift_bridgeObjectRetain();
LABEL_5:
  swift_bridgeObjectRelease();
  unint64_t v12 = *((void *)v10 + 2);
  if (!v12)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v13 = v12 - 1;
  unint64_t v14 = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!v14 || v12 >= *((void *)v10 + 3) >> 1) {
    char v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v14, v12 + 1, 1, v10);
  }
  memmove(&v10[v12 + 32], &v10[v13 + 32], *((void *)v10 + 2) - v13);
  ++*((void *)v10 + 2);
  v10[v13 + 32] = 47;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v15 = SystemString._parseRoot()();
  unint64_t v16 = *((void *)v10 + 2);
  if (v15.relativeBegin == v16 - 1) {
    goto LABEL_15;
  }
  __int16 v17 = specialized BidirectionalCollection.last.getter((uint64_t)v10);
  if ((v17 & 0x100) == 0)
  {
    if (v17 != 47)
    {
LABEL_15:
      swift_bridgeObjectRetain();
      SystemString._normalizeSeparators()();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      SystemString._normalizeSeparators()();
      *a6 = v10;
      return;
    }
    if (v16 != 1)
    {
      if (v16 >= 2)
      {
        specialized RangeReplaceableCollection.remove(at:)(v16 - 2);
        goto LABEL_15;
      }
      goto LABEL_28;
    }
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
  }
  __break(1u);
}

size_t *FilePath.init<A>(root:_:)@<X0>(size_t *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  if (!*result)
  {
    char v10 = &outlined read-only object #0 of FilePath.init<A>(root:_:);
    goto LABEL_5;
  }
  size_t v9 = result[1];
  if ((v9 & 0x8000000000000000) == 0)
  {
    char v10 = (void *)specialized SystemString.init<A>(_:)(0, v9, *result);
LABEL_5:
    uint64_t v11 = v10;
    SystemString.appendComponents<A>(components:)(a2, a3, a4);
    SystemString._normalizeSeparators()();
    uint64_t result = (size_t *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a2, a3);
    *a5 = v11;
    return result;
  }
  __break(1u);
  return result;
}

void protocol witness for RangeReplaceableCollection.init() in conformance FilePath.ComponentView(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for RangeReplaceableCollection.init() in conformance FilePath.ComponentView;
  a1[1] = 0;
}

uint64_t protocol witness for RangeReplaceableCollection.init(repeating:count:) in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return specialized RangeReplaceableCollection.init(repeating:count:)(*a1, a1[1], a1[2], a2, a3);
}

uint64_t protocol witness for RangeReplaceableCollection.init<A>(_:) in conformance FilePath.ComponentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E2D0](a1, a4, a2, a5, a3);
}

uint64_t protocol witness for RangeReplaceableCollection.append(_:) in conformance FilePath.ComponentView(uint64_t *a1)
{
  specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(*(void *)(*(void *)v1 + 16) - 1, *(void *)(*(void *)v1 + 16) - 1, *a1, a1[1], a1[2]);

  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for RangeReplaceableCollection.append<A>(contentsOf:) in conformance FilePath.ComponentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E288](a1, a4, a2, a5, a3);
}

uint64_t protocol witness for RangeReplaceableCollection.insert(_:at:) in conformance FilePath.ComponentView(uint64_t *a1, int64_t *a2)
{
  specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(*a2, *a2, *a1, a1[1], a1[2]);

  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for RangeReplaceableCollection.insert<A>(contentsOf:at:) in conformance FilePath.ComponentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9E2A0](a1, a2, a5, a3, a6, a4);
}

Swift::Int protocol witness for RangeReplaceableCollection.remove(at:) in conformance FilePath.ComponentView@<X0>(Swift::Int *a1@<X0>, void *a2@<X8>)
{
  return specialized RangeReplaceableCollection.remove(at:)(*a1, a2);
}

int64_t protocol witness for RangeReplaceableCollection.removeSubrange(_:) in conformance FilePath.ComponentView(int64_t *a1)
{
  return specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(*a1, a1[1]);
}

void protocol witness for RangeReplaceableCollection._customRemoveLast() in conformance FilePath.ComponentView(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

int64_t specialized RangeReplaceableCollection.removeFirst(_:)(int64_t result)
{
  if (!result) {
    return result;
  }
  if (result < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v2 = v1[1];
  uint64_t result = specialized BidirectionalCollection.index(_:offsetBy:limitedBy:)(v2, result, *(void *)(*v1 + 16) - 1, *v1, (uint64_t)&v4);
  if (v5)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  int64_t v3 = v4;
  if (v4 < v2)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  return specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(v2, v3);
}

uint64_t protocol witness for RangeReplaceableCollection.removeAll(where:) in conformance FilePath.ComponentView(uint64_t (*a1)(void *), uint64_t a2)
{
  return specialized RangeReplaceableCollection.removeAll(where:)(a1, a2);
}

uint64_t specialized RangeReplaceableCollection.removeAll(where:)(uint64_t (*a1)(void *), uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = *v2;
  uint64_t v6 = v2[1];
  unint64_t v23 = &outlined read-only object #0 of specialized RangeReplaceableCollection.removeAll(where:);
  uint64_t v7 = *(void *)(v5 + 16);
  if (v6 == v7 - 1)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v9 = 0;
    char v10 = &outlined read-only object #0 of specialized RangeReplaceableCollection.removeAll(where:);
LABEL_58:
    *uint64_t v2 = (uint64_t)v10;
    v2[1] = v9;
    return result;
  }
  uint64_t v25 = a2;
  unint64_t v12 = (unsigned char *)(v5 + 32);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v13 = v5 + 33;
  while (1)
  {
    if (v6 || v7 == 1) {
      goto LABEL_72;
    }
    if (!v7) {
      goto LABEL_69;
    }
    if (*v12 != 47)
    {
LABEL_72:
      if (v7 <= v6 || !v7) {
        goto LABEL_62;
      }
      if (v6 < 0) {
        goto LABEL_63;
      }
      uint64_t v14 = v7 - 1;
      if (v6 == v7 - 1) {
        goto LABEL_17;
      }
      if (v6 >= (unint64_t)(v7 - 1)) {
        goto LABEL_66;
      }
      if (v6 >= (unint64_t)v7) {
        goto LABEL_67;
      }
      if (v12[v6] == 47)
      {
LABEL_17:
        uint64_t v14 = v6;
        goto LABEL_30;
      }
      if (v6 + 1 != v14)
      {
        uint64_t v15 = v6;
        while (1)
        {
          if (v15 + 1 < v6 || v15 + 1 >= v14)
          {
            __break(1u);
            goto LABEL_59;
          }
          if (*(unsigned char *)(v13 + v15) == 47) {
            break;
          }
          if (v7 - 2 == ++v15) {
            goto LABEL_29;
          }
        }
        uint64_t v14 = v15 + 1;
      }
    }
    else
    {
      uint64_t v14 = 1;
    }
LABEL_29:
    if (v14 < v6) {
      goto LABEL_60;
    }
LABEL_30:
    if (v6 == v14) {
      goto LABEL_61;
    }
    if (v6)
    {
      if (v7 <= v6) {
        goto LABEL_65;
      }
      if (v6 < 0) {
        goto LABEL_64;
      }
    }
    else if (v7 != 1 && *v12 == 47)
    {
      uint64_t v17 = 1;
      goto LABEL_53;
    }
    uint64_t v17 = v7 - 1;
    if (v6 == v7 - 1)
    {
      uint64_t v17 = v6;
      goto LABEL_53;
    }
    if (v6 >= v7 - 1) {
      goto LABEL_68;
    }
    if (v12[v6] == 47)
    {
      uint64_t v18 = v6;
LABEL_43:
      uint64_t v17 = v18 + 1;
      goto LABEL_53;
    }
    if (v6 + 1 != v17) {
      break;
    }
LABEL_53:
    v22[0] = v5;
    v22[1] = v6;
    v22[2] = v14;
    swift_bridgeObjectRetain();
    char v21 = a1(v22);
    if (v4)
    {
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
    if ((v21 & 1) == 0) {
      specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(v23[2] - 1, v23[2] - 1, v5, v6, v14);
    }
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)(v5 + 16);
    uint64_t v6 = v17;
    if (v17 == v7 - 1)
    {
      uint64_t result = swift_bridgeObjectRelease_n();
      char v10 = v23;
      uint64_t v9 = v24;
      goto LABEL_58;
    }
  }
  uint64_t v18 = v6;
  while (v18 + 1 >= v6 && v18 + 1 < v17)
  {
    int v20 = *(unsigned __int8 *)(v13 + v18++);
    if (v20 == 47) {
      goto LABEL_43;
    }
    if (v7 - 2 == v18) {
      goto LABEL_53;
    }
  }
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
  __break(1u);
  return result;
}

void FilePath.init(root:_:)(size_t *a1@<X0>, int64_t *a2@<X1>, char **a3@<X8>)
{
  int64_t v4 = *a2;
  int64_t v5 = a2[1];
  int64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  if (*a1)
  {
    size_t v8 = a1[1];
    if ((v8 & 0x8000000000000000) != 0)
    {
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    uint64_t v9 = (char *)specialized SystemString.init<A>(_:)(0, v8, *a1);
  }
  else
  {
    uint64_t v9 = (char *)&outlined read-only object #0 of FilePath.init(root:_:);
  }
  unint64_t v10 = *(void *)(v6 + 16);
  if (v5 < v4 || (uint64_t)v10 <= v7) {
    goto LABEL_27;
  }
  if (v4 < v7)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if ((uint64_t)v10 <= v5)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v12 = v5 - v4;
  if (v5 == v4)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    SystemString._normalizeSeparators()();
    *a3 = v9;
    return;
  }
  if (v5 <= v4) {
    goto LABEL_31;
  }
  if (v4 < 0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v4 >= v10)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v5 - 1 < v10)
  {
    unint64_t v13 = ~v4 + v10;
    uint64_t v14 = (char *)(v4 + v6 + 32);
    while (v13)
    {
      unint64_t v15 = *((void *)v9 + 2);
      if (!v15) {
        goto LABEL_26;
      }
      char v17 = *v14++;
      char v16 = v17;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v15 >= *((void *)v9 + 3) >> 1) {
        uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v15 + 1, 1, v9);
      }
      memmove(&v9[v15 + 32], &v9[v15 + 31], *((void *)v9 + 2) - (v15 - 1));
      ++*((void *)v9 + 2);
      v9[v15 + 31] = v16;
      --v13;
      if (!--v12) {
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
LABEL_34:
  __break(1u);
}

uint64_t FilePath.ComponentView.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<FilePath.ComponentView.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v13 = v8;
  char v12 = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    char v11 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void FilePath.ComponentView.hashValue.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  Hasher.init(_seed:)();
  int64_t v3 = *(void *)(v1 + 16);
  if (v3 <= (uint64_t)v2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v3)
  {
    Hasher._combine(_:)(v3 - 1 - v2);
    if (v3 - 1 == v2)
    {
LABEL_13:
      Hasher._finalize()();
      return;
    }
    if (v3 - 1 <= v2) {
      goto LABEL_18;
    }
    unint64_t v4 = *(void *)(v1 + 16);
    if (v2 >= v4 || v3 - 2 >= v4) {
      goto LABEL_19;
    }
    unint64_t v6 = ~v2 + v3;
    uint64_t v7 = (Swift::UInt8 *)(v2 + v1 + 32);
    while (v6)
    {
      Swift::UInt8 v8 = *v7++;
      Hasher._combine(_:)(v8);
      if (!--v6) {
        goto LABEL_13;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
}

uint64_t FilePath.ComponentView.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FilePath.ComponentView.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  Swift::UInt8 v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v12[15] = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v9 = v13;
  v12[14] = 1;
  swift_bridgeObjectRetain();
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for _StrSlice._range.getter in conformance FilePath.ComponentView()
{
  uint64_t result = v0[1];
  if (*(void *)(*v0 + 16) <= result) {
    __break(1u);
  }
  return result;
}

void protocol witness for Hashable.hash(into:) in conformance FilePath.ComponentView(uint64_t a1)
{
  specialized _StrSlice.hash(into:)(a1, *(void *)v1, *(void *)(v1 + 8));
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance FilePath.ComponentView()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  Hasher.init(_seed:)();
  int64_t v3 = *(void *)(v1 + 16);
  if (v3 <= (uint64_t)v2)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!v3)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  Hasher._combine(_:)(v3 - 1 - v2);
  if (v3 - 1 == v2)
  {
LABEL_9:
    Hasher._finalize()();
    return;
  }
  if (v3 - 1 > v2)
  {
    unint64_t v4 = ~v2 + v3;
    uint64_t v5 = (Swift::UInt8 *)(v2 + v1 + 32);
    while (v4)
    {
      Swift::UInt8 v6 = *v5++;
      Hasher._combine(_:)(v6);
      if (!--v4) {
        goto LABEL_9;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
LABEL_14:
  __break(1u);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FilePath.ComponentView@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return FilePath.ComponentView.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FilePath.ComponentView(void *a1)
{
  return FilePath.ComponentView.encode(to:)(a1);
}

uint64_t *protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.ComponentView(uint64_t *result, uint64_t *a2)
{
  uint64_t v3 = *result;
  int64_t v2 = result[1];
  int64_t v4 = *(void *)(*result + 16);
  if (v4 <= v2)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = (uint64_t *)a2[1];
    uint64_t v5 = *(void *)(*a2 + 16);
    if (v5 > (uint64_t)result) {
      return (uint64_t *)specialized Sequence<>.elementsEqual<A>(_:)((int64_t)result, v5 - 1, *a2, v2, v4 - 1, v3);
    }
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<FilePath.ComponentView>, (void (*)(void))lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<FilePath.ComponentView> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<FilePath.ComponentView>, (void (*)(void))lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView);
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<FilePath.ComponentView>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<FilePath.ComponentView> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<FilePath.ComponentView>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type IndexingIterator<FilePath.ComponentView> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<FilePath.ComponentView>);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(unint64_t *a1, uint64_t *a2)
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

uint64_t associated type witness table accessor for Collection.SubSequence : RangeReplaceableCollection in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<FilePath.ComponentView> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<FilePath.ComponentView>, (void (*)(void))lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for FilePath.ComponentView(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t instantiation function for generic protocol witness table for FilePath.ComponentView(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView();
  a1[2] = lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView();
  unint64_t result = lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView();
  a1[3] = result;
  return result;
}

void sub_21568B0DC(void *a1@<X8>)
{
  swift_bridgeObjectRetain();
  FilePath.components.getter(v3);
  uint64_t v2 = v3[1];
  *a1 = v3[0];
  a1[1] = v2;
}

unsigned char *storeEnumTagSinglePayload for FilePath.ComponentView.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x21568B1F4);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

void *type metadata accessor for FilePath.ComponentView.CodingKeys()
{
  return &unk_26C63D178;
}

uint64_t specialized SystemString.appendComponents<A>(components:)()
{
  uint64_t v1 = *v0;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v2 = SystemString._parseRoot()();
  unint64_t v3 = *(void *)(v1 + 16);
  if (v2.relativeBegin != v3 - 1)
  {
    __int16 v4 = specialized BidirectionalCollection.last.getter(v1);
    if ((v4 & 0x100) != 0)
    {
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    if (v4 == 47)
    {
      if (v3 == 1)
      {
LABEL_55:
        __break(1u);
      }
      else if (v3 >= 2)
      {
        specialized RangeReplaceableCollection.remove(at:)(v3 - 2);
        goto LABEL_7;
      }
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
  }
LABEL_7:
  uint64_t v5 = *v0;
  uint64_t v21 = *v0;
  unint64_t v6 = *(void *)(*v0 + 16);
  if (v6 != 1)
  {
    if (!v6)
    {
LABEL_62:
      uint64_t result = swift_bridgeObjectRetain();
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
      return result;
    }
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      if (v6 <= v8)
      {
        __break(1u);
LABEL_50:
        __break(1u);
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
LABEL_53:
        __break(1u);
LABEL_54:
        __break(1u);
        goto LABEL_55;
      }
      int v10 = *(unsigned __int8 *)(v5 + 32 + v8);
      if (v9 != v8)
      {
        if (v9 >= v6) {
          goto LABEL_51;
        }
        char v11 = *(unsigned char *)(v5 + 32 + v9);
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v5);
          uint64_t v5 = result;
        }
        unint64_t v12 = *(void *)(v5 + 16);
        if (v9 >= v12) {
          goto LABEL_52;
        }
        *(unsigned char *)(v5 + 32 + v9) = v10;
        if (v12 <= v8) {
          goto LABEL_53;
        }
        *(unsigned char *)(v5 + 32 + v8) = v11;
        uint64_t v21 = v5;
        unint64_t v6 = *(void *)(v5 + 16);
      }
      int64_t v13 = v6 - 1;
      if ((uint64_t)v8 >= (uint64_t)(v6 - 1) || (uint64_t)v9 >= v13) {
        goto LABEL_50;
      }
      ++v9;
      unint64_t v14 = v8 + 1;
      if (v10 == 47 && (uint64_t)v14 < v13)
      {
        if (v14 >= v6) {
          goto LABEL_54;
        }
        if (*(unsigned char *)(v5 + v14 + 32) == 47) {
          break;
        }
      }
LABEL_10:
      unint64_t v8 = v14;
      if ((uint64_t)v14 >= v13) {
        goto LABEL_33;
      }
    }
    while (v6 - 3 != v8)
    {
      int v16 = *(unsigned __int8 *)(v5 + 34 + v8++);
      if (v16 != 47)
      {
        unint64_t v14 = v8 + 1;
        goto LABEL_10;
      }
    }
    unint64_t v14 = v6 - 1;
LABEL_33:
    if (v9 >= v6 || v14 >= v6) {
      goto LABEL_63;
    }
    unint64_t v17 = v14 - v9;
    if (v17)
    {
      if ((v17 & 0x8000000000000000) != 0) {
        goto LABEL_57;
      }
      uint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(v6 - 1, -(uint64_t)v17, 0, v5);
      if (v18) {
        goto LABEL_64;
      }
      if ((uint64_t)v6 <= result) {
        goto LABEL_58;
      }
      specialized Array.replaceSubrange<A>(_:with:)(result, v6 - 1);
      uint64_t v5 = v21;
    }
    Swift::tuple_rootEnd_Int_relativeBegin_Int v19 = SystemString._parseRoot()();
    unint64_t v20 = *(void *)(v5 + 16);
    if (v19.relativeBegin == v20 - 1) {
      goto LABEL_46;
    }
    uint64_t result = specialized BidirectionalCollection.last.getter(v5);
    if ((result & 0x100) != 0) {
      goto LABEL_65;
    }
    if (result != 47) {
      goto LABEL_46;
    }
    if (v20 != 1)
    {
      if (v20 < 2) {
        goto LABEL_60;
      }
      specialized RangeReplaceableCollection.remove(at:)(v20 - 2);
      goto LABEL_46;
    }
    goto LABEL_59;
  }
  swift_bridgeObjectRetain();
LABEL_46:

  return swift_bridgeObjectRelease();
}

uint64_t specialized FilePath.ComponentView.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x687461705FLL && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74726174735FLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t Sequence._withRawBufferPointer<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v28 = a6;
  uint64_t v25 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v24 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Optional();
  uint64_t v23 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  int v16 = (char *)&v23 - v15;
  uint64_t v27 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v14);
  char v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v32 = a1;
  uint64_t v26 = a1;
  uint64_t v33 = a2;
  uint64_t v19 = v34;
  uint64_t result = dispatch thunk of Sequence.withContiguousStorageIfAvailable<A>(_:)();
  if (!v19)
  {
    uint64_t v34 = a2;
    uint64_t v21 = v27;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v16, 1, a4) == 1)
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v13);
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v24, v6, a3);
      swift_getAssociatedTypeWitness();
      Array.init<A>(_:)();
      Array.withUnsafeBytes<A>(_:)();
      return swift_bridgeObjectRelease();
    }
    else
    {
      char v22 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
      v22(v18, v16, a4);
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v22)(v28, v18, a4);
    }
  }
  return result;
}

uint64_t partial apply for closure #1 in Sequence._withRawBufferPointer<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v2 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = MEMORY[0x2166C0600](a1, a2, AssociatedTypeWitness);
  return v5(v7);
}

_WORD *protocol witness for OptionSet.init(rawValue:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FilePermissions()
{
  Swift::UInt16 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance FilePermissions()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FilePermissions()
{
  Swift::UInt16 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance FilePermissions()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FilePermissions()
{
  return RawRepresentable<>.encode(to:)();
}

void protocol witness for SetAlgebra.init() in conformance FilePermissions(_WORD *a1@<X8>)
{
  *a1 = 0;
}

_WORD *protocol witness for SetAlgebra.union(_:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

_WORD *protocol witness for SetAlgebra.intersection(_:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

_WORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance FilePermissions(_WORD *a1, unsigned __int16 *a2)
{
  int v3 = *a2;
  int v4 = (unsigned __int16)*v2;
  if ((v4 & v3) != v3) {
    *uint64_t v2 = v4 | v3;
  }
  *a1 = v3;
  return (v4 & v3) != v3;
}

unsigned __int16 *protocol witness for SetAlgebra.remove(_:) in conformance FilePermissions@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = (unsigned __int16)*v2;
  int v5 = v4 & v3;
  if ((v4 & v3) != 0) {
    *uint64_t v2 = v4 & ~(_WORD)v3;
  }
  *(_WORD *)a2 = v5;
  *(unsigned char *)(a2 + 2) = v5 == 0;
  return result;
}

unsigned __int16 *protocol witness for SetAlgebra.update(with:) in conformance FilePermissions@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = (unsigned __int16)*v2;
  *uint64_t v2 = v4 | v3;
  int v5 = v4 & v3;
  *(_WORD *)a2 = v5;
  *(unsigned char *)(a2 + 2) = v5 == 0;
  return result;
}

_WORD *protocol witness for SetAlgebra.formUnion(_:) in conformance FilePermissions(_WORD *result)
{
  *v1 |= *result;
  return result;
}

_WORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance FilePermissions(_WORD *result)
{
  *v1 &= *result;
  return result;
}

_WORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance FilePermissions(_WORD *result)
{
  *v1 ^= *result;
  return result;
}

_WORD *protocol witness for SetAlgebra.subtracting(_:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance FilePermissions(unsigned __int16 *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance FilePermissions(_WORD *a1)
{
  return (unsigned __int16)(*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance FilePermissions(unsigned __int16 *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance FilePermissions()
{
  return *v0 == 0;
}

_WORD *protocol witness for SetAlgebra.subtract(_:) in conformance FilePermissions(_WORD *result)
{
  *v1 &= ~*result;
  return result;
}

_WORD *protocol witness for RawRepresentable.init(rawValue:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(unsigned char *)(a2 + 2) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance FilePermissions(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilePermissions(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance FilePermissions@<X0>(uint64_t a1@<X0>, _WORD *a2@<X8>)
{
  __int16 v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t FilePermissions.description.getter(unsigned __int16 a1)
{
  return specialized OptionSet._buildDescription(_:)((uint64_t)&outlined read-only object #0 of FilePermissions.description.getter, a1);
}

unint64_t lazy protocol witness table accessor for type FilePermissions and conformance FilePermissions()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions;
  if (!lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions;
  if (!lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions;
  if (!lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions;
  if (!lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FilePermissions()
{
  return FilePermissions.description.getter(*v0);
}

ValueMetadata *type metadata accessor for FilePermissions()
{
  return &type metadata for FilePermissions;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = result;
  LODWORD(result) = 0;
  __int16 v3 = (int *)(v2 + 32);
  do
  {
    int v5 = *v3++;
    int v4 = v5;
    if ((v5 & ~result) == 0) {
      int v4 = 0;
    }
    unint64_t result = v4 | result;
    --v1;
  }
  while (v1);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  unsigned __int16 *v3;
  int v4;
  int v5;

  uint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = result;
  LODWORD(result) = 0;
  __int16 v3 = (unsigned __int16 *)(v2 + 32);
  do
  {
    int v5 = *v3++;
    int v4 = v5;
    if ((v5 & ~result) == 0) {
      int v4 = 0;
    }
    unint64_t result = v4 | result;
    --v1;
  }
  while (v1);
  return result;
}

ValueMetadata *type metadata accessor for CInterop()
{
  return &type metadata for CInterop;
}

uint64_t FileDescriptor.closeAfter<A>(_:)@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = *(void *)(a3 - 8);
  unint64_t v9 = (void (*)(void))MEMORY[0x270FA5388](a1);
  char v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9();
  if (v4)
  {
    if (close(a2) == -1)
    {
      v15[3] = MEMORY[0x2166C0510]();
      lazy protocol witness table accessor for type Errno and conformance Errno();
      swift_willThrowTypedImpl();
    }
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a4, v11, a3);
    uint64_t result = close(a2);
    if (result == -1)
    {
      int v13 = MEMORY[0x2166C0510]();
      v15[2] = v13;
      lazy protocol witness table accessor for type Errno and conformance Errno();
      swift_willThrowTypedImpl();
      swift_allocError();
      _DWORD *v14 = v13;
      return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a4, a3);
    }
  }
  return result;
}

uint64_t FileDescriptor._writeAll<A>(_:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  v8[4] = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<Int, Errno>);
  Sequence._withRawBufferPointer<A>(_:)((uint64_t)partial apply for closure #1 in FileDescriptor._writeAll<A>(_:), (uint64_t)v8, a3, v6, a4, (uint64_t)&v9);
  return v9;
}

ssize_t closure #1 in FileDescriptor._writeAll<A>(_:)@<X0>(int __fd@<W2>, ssize_t result@<X0>, uint64_t a3@<X1>, uint64_t a4@<X8>)
{
  ssize_t v5 = result;
  uint64_t v7 = 0;
  ssize_t v8 = a3 - result;
  while (2)
  {
    if (v5)
    {
      size_t v9 = v8 - v7;
      if (v8 > v7)
      {
        uint64_t v10 = (const void *)(v5 + v7);
        goto LABEL_7;
      }
      char v12 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      if (v7 < 0)
      {
        size_t v9 = 0;
LABEL_7:
        while (1)
        {
          uint64_t result = write(__fd, v10, v9);
          if (result != -1) {
            break;
          }
          uint64_t result = MEMORY[0x2166C0510]();
          if (result != 4) {
            goto LABEL_13;
          }
        }
        BOOL v11 = __OFADD__(v7, result);
        v7 += result;
        if (!v11) {
          continue;
        }
        __break(1u);
LABEL_13:
        ssize_t v8 = result;
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        ssize_t v8 = 0;
      }
    }
    break;
  }
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 8) = v12;
  return result;
}

uint64_t FileDescriptor._writeAll<A>(toAbsoluteOffset:_:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  v9[4] = a3;
  uint64_t v10 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<Int, Errno>);
  Sequence._withRawBufferPointer<A>(_:)((uint64_t)partial apply for closure #1 in FileDescriptor._writeAll<A>(toAbsoluteOffset:_:), (uint64_t)v9, a4, v7, a5, (uint64_t)&v11);
  return v11;
}

ssize_t closure #1 in FileDescriptor._writeAll<A>(toAbsoluteOffset:_:)@<X0>(int __fd@<W2>, ssize_t result@<X0>, uint64_t a3@<X1>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  ssize_t v7 = result;
  uint64_t v9 = 0;
  ssize_t v10 = a3 - result;
  while (2)
  {
    if (v7)
    {
      size_t v11 = v10 - v9;
      if (v10 > v9)
      {
        off_t v12 = a4 + v9;
        if (!__OFADD__(a4, v9))
        {
          int v13 = (const void *)(v7 + v9);
          goto LABEL_9;
        }
        __break(1u);
        break;
      }
      char v15 = 0;
LABEL_16:
      *(void *)a5 = v10;
      *(unsigned char *)(a5 + 8) = v15;
      return result;
    }
    if ((v9 & 0x8000000000000000) == 0)
    {
      ssize_t v10 = 0;
      char v15 = 0;
      goto LABEL_16;
    }
    off_t v12 = a4 + v9;
    if (!__OFADD__(a4, v9))
    {
      int v13 = 0;
      size_t v11 = 0;
LABEL_9:
      while (1)
      {
        uint64_t result = pwrite(__fd, v13, v11, v12);
        if (result != -1) {
          break;
        }
        uint64_t result = MEMORY[0x2166C0510]();
        if (result != 4) {
          goto LABEL_15;
        }
      }
      BOOL v14 = __OFADD__(v9, result);
      v9 += result;
      if (!v14) {
        continue;
      }
      __break(1u);
LABEL_15:
      ssize_t v10 = result;
      char v15 = 1;
      goto LABEL_16;
    }
    break;
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type Errno and conformance Errno()
{
  unint64_t result = lazy protocol witness table cache variable for type Errno and conformance Errno;
  if (!lazy protocol witness table cache variable for type Errno and conformance Errno)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Errno and conformance Errno);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Errno and conformance Errno;
  if (!lazy protocol witness table cache variable for type Errno and conformance Errno)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Errno and conformance Errno);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Errno and conformance Errno;
  if (!lazy protocol witness table cache variable for type Errno and conformance Errno)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Errno and conformance Errno);
  }
  return result;
}

ssize_t partial apply for closure #1 in FileDescriptor._writeAll<A>(_:)@<X0>(ssize_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return closure #1 in FileDescriptor._writeAll<A>(_:)(*(_DWORD *)(v3 + 16), a1, a2, a3);
}

ssize_t partial apply for closure #1 in FileDescriptor._writeAll<A>(toAbsoluteOffset:_:)@<X0>(ssize_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return closure #1 in FileDescriptor._writeAll<A>(toAbsoluteOffset:_:)(*(_DWORD *)(v3 + 16), a1, a2, *(void *)(v3 + 24), a3);
}

unint64_t specialized Collection<>.firstIndex(of:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (String.subscript.getter() != a1 || v9 != a2)
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = String.index(after:)();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t specialized Collection<>.firstIndex(of:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = a1;
  if (*(unsigned __int8 *)(a2 + 32) == a1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v5 = v2 - 1;
  while (v5 != result)
  {
    int v6 = *(unsigned __int8 *)(a2 + 33 + result++);
    if (v6 == v3) {
      return result;
    }
  }
  return 0;
}

void FilePath.init(platformString:)(const char *a1@<X0>, void *a2@<X8>)
{
  size_t v4 = strlen(a1);
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, v4 + 1);
    SystemString._normalizeSeparators()();
    *a2 = v5;
  }
}

uint64_t FilePath.withCString<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return FilePath._withPlatformString<A>(_:)(a1, a2);
}

size_t FilePath.Component.init(platformString:)@<X0>(const char *a1@<X0>, uint64_t a2@<X8>)
{
  size_t result = strlen(a1);
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, result + 1);
    size_t result = FilePath.Component.init(_:)((uint64_t)v5, (uint64_t *)&v7);
    uint64_t v6 = v8;
    *(_OWORD *)a2 = v7;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t FilePath.Component.withPlatformString<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  unint64_t v4 = lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component();
  return _StrSlice._withPlatformString<A>(_:)((uint64_t)&type metadata for FilePath.Component, a1, v4, a2);
}

size_t FilePath.Root.init(platformString:)@<X0>(const char *a1@<X0>, _OWORD *a2@<X8>)
{
  size_t result = strlen(a1);
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, result + 1);
    size_t result = FilePath.Root.init(_:)((uint64_t)v5, (uint64_t *)&v6);
    *a2 = v6;
  }
  return result;
}

size_t FilePath.Root.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void *)__s;
    goto LABEL_9;
  }
  MEMORY[0x270FA5388](a1);
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((v5 & 0x1000000000000000) != 0)
    {
      uint64_t v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v7 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v6 = _StringObject.sharedUTF8.getter();
    }
    uint64_t v8 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v6, v7, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  *(void *)__s = v5;
  *(void *)&char __s[8] = a2 & 0xFFFFFFFFFFFFFFLL;
  size_t result = strlen(__s);
  if (!__OFADD__(result, 1))
  {
    uint64_t v8 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, result + 1);
    swift_bridgeObjectRelease();
LABEL_9:
    size_t result = FilePath.Root.init(_:)(v8, (uint64_t *)__s);
    *a3 = *(_OWORD *)__s;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t FilePath.Root.withPlatformString<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  unint64_t v4 = lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root();
  return _StrSlice._withPlatformString<A>(_:)((uint64_t)&type metadata for FilePath.Root, a1, v4, a2);
}

System::FilePath __swiftcall FilePath.init(stringLiteral:)(Swift::String stringLiteral)
{
  unint64_t object = (unint64_t)stringLiteral._object;
  int v3 = v1;
  if (((uint64_t)stringLiteral._object & 0x1000000000000000) != 0
    || !((uint64_t)stringLiteral._object & 0x2000000000000000 | stringLiteral._countAndFlagsBits & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)__s;
    goto LABEL_9;
  }
  MEMORY[0x270FA5388](stringLiteral._countAndFlagsBits);
  if ((object & 0x2000000000000000) == 0)
  {
    if ((v4 & 0x1000000000000000) != 0)
    {
      uint64_t v5 = (object & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = v4 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v5 = _StringObject.sharedUTF8.getter();
    }
    uint64_t v7 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v5, v6, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  *(void *)__s = v4;
  uint64_t v10 = object & 0xFFFFFFFFFFFFFFLL;
  result._storage.nullTerminatedStorage._rawValue = (void *)strlen(__s);
  if (!__OFADD__(result._storage.nullTerminatedStorage._rawValue, 1))
  {
    uint64_t v7 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, (int64_t)result._storage.nullTerminatedStorage._rawValue + 1);
    swift_bridgeObjectRelease();
LABEL_9:
    *(void *)__s = v7;
    SystemString._normalizeSeparators()();
    *int v3 = *(void *)__s;
    return result;
  }
  __break(1u);
  return result;
}

void protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance FilePath(uint64_t *a1@<X0>, void *a2@<X8>)
{
  int v3 = specialized String.withCString<A>(_:)((uint64_t)closure #1 in SystemString.init(_:), 0, *a1, a1[1]);
  swift_bridgeObjectRelease();
  SystemString._normalizeSeparators()();
  *a2 = v3;
}

uint64_t FilePath.Component.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void *)__s;
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(void *)__s = v5;
      uint64_t v13 = a2 & 0xFFFFFFFFFFFFFFLL;
      size_t v9 = strlen(__s);
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_14;
      }
      uint64_t v8 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, v9 + 1);
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v7 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v6 = _StringObject.sharedUTF8.getter();
      }
      uint64_t v8 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v6, v7, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
      swift_bridgeObjectRelease();
    }
  }
  uint64_t result = FilePath.Component.init(_:)(v8, &v14);
  if (v14)
  {
    long long v11 = v15;
    *(void *)a3 = v14;
    *(_OWORD *)(a3 + 8) = v11;
    return result;
  }
LABEL_14:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance FilePath.Component@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  int v3 = specialized String.withCString<A>(_:)((uint64_t)closure #1 in SystemString.init(_:), 0, *a1, a1[1]);
  swift_bridgeObjectRelease();
  uint64_t result = FilePath.Component.init(_:)((uint64_t)v3, &v6);
  if (v6)
  {
    long long v5 = v7;
    *(void *)a2 = v6;
    *(_OWORD *)(a2 + 8) = v5;
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t FilePath.Root.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void *)__s;
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(void *)__s = v5;
      uint64_t v13 = a2 & 0xFFFFFFFFFFFFFFLL;
      size_t v9 = strlen(__s);
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_14;
      }
      uint64_t v8 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, v9 + 1);
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v7 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v6 = _StringObject.sharedUTF8.getter();
      }
      uint64_t v8 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v6, v7, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
      swift_bridgeObjectRelease();
    }
  }
  uint64_t result = FilePath.Root.init(_:)(v8, v14);
  if (v14[0])
  {
    uint64_t v11 = v14[1];
    *a3 = v14[0];
    a3[1] = v11;
    return result;
  }
LABEL_14:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance FilePath.Root@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  int v3 = specialized String.withCString<A>(_:)((uint64_t)closure #1 in SystemString.init(_:), 0, *a1, a1[1]);
  swift_bridgeObjectRelease();
  uint64_t result = FilePath.Root.init(_:)((uint64_t)v3, v6);
  if (v6[0])
  {
    uint64_t v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t FilePath.description.getter()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = String.init(cString:)();
  swift_bridgeObjectRelease();
  return v0;
}

Swift::String __swiftcall String.init(decoding:)(System::FilePath decoding)
{
  uint64_t v1 = String.init(decoding:)(decoding._storage.nullTerminatedStorage._rawValue, MEMORY[0x263F8D2D0]);
  result._unint64_t object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t FilePath.debugDescription.getter()
{
  FilePath.description.getter();
  uint64_t v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath()
{
  FilePath.description.getter();
  uint64_t v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FilePath.Component.description.getter()
{
  size_t v1 = *v0;
  unint64_t v2 = v0[1];
  size_t v3 = v0[2];
  swift_bridgeObjectRetain_n();
  specialized SystemString.init<A>(_:)(v2, v3, v1);
  uint64_t v4 = String.init(cString:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t String.init(decoding:)(size_t *a1)
{
  return String.init(decoding:)(a1, MEMORY[0x263F8D2D0]);
}

uint64_t FilePath.Component.debugDescription.getter()
{
  FilePath.Component.description.getter();
  uint64_t v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.Component()
{
  FilePath.Component.description.getter();
  uint64_t v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

void FilePath.Root.description.getter()
{
  size_t v1 = v0[1];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    size_t v2 = *v0;
    swift_bridgeObjectRetain_n();
    specialized SystemString.init<A>(_:)(0, v1, v2);
    String.init(cString:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
}

size_t *String.init(decoding:)(size_t *a1)
{
  return String.init(decoding:)(a1, MEMORY[0x263F8D2D0]);
}

uint64_t FilePath.Root.debugDescription.getter()
{
  FilePath.Root.description.getter();
  uint64_t v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.Root()
{
  FilePath.Root.description.getter();
  uint64_t v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

void FilePath.Root.string.getter()
{
  size_t v1 = v0[1];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    size_t v2 = *v0;
    swift_bridgeObjectRetain_n();
    specialized SystemString.init<A>(_:)(0, v1, v2);
    String.init(cString:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
}

Swift::String_optional __swiftcall String.init(validating:)(System::FilePath validating)
{
  uint64_t v1 = String.init(decoding:)(validating._storage.nullTerminatedStorage._rawValue, MEMORY[0x263F8D288]);
  result.value._unint64_t object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t String.init(decoding:)(void *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2 = a2(*a1 + 32);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t String.init(validating:)(size_t *a1)
{
  return String.init(decoding:)(a1, MEMORY[0x263F8D288]);
}

uint64_t String.init(decoding:)(size_t *a1, uint64_t (*a2)(unint64_t))
{
  size_t v3 = *a1;
  unint64_t v4 = a1[1];
  size_t v5 = a1[2];
  swift_bridgeObjectRetain_n();
  unint64_t v6 = specialized SystemString.init<A>(_:)(v4, v5, v3);
  uint64_t v7 = a2(v6 + 32);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  return v7;
}

size_t *String.init(validating:)(size_t *a1)
{
  return String.init(decoding:)(a1, MEMORY[0x263F8D288]);
}

size_t *String.init(decoding:)(size_t *result, uint64_t (*a2)(unint64_t))
{
  size_t v2 = result[1];
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    size_t v4 = *result;
    swift_bridgeObjectRetain_n();
    unint64_t v5 = specialized SystemString.init<A>(_:)(0, v2, v4);
    uint64_t v6 = a2(v5 + 32);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    return (size_t *)v6;
  }
  return result;
}

Swift::String __swiftcall String.init(_:)(System::FilePath a1)
{
  uint64_t v1 = String.init(decoding:)(a1._storage.nullTerminatedStorage._rawValue, MEMORY[0x263F8D2D0]);
  result._unint64_t object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

Swift::String_optional __swiftcall String.init(validatingUTF8:)(System::FilePath validatingUTF8)
{
  uint64_t v1 = String.init(decoding:)(validatingUTF8._storage.nullTerminatedStorage._rawValue, MEMORY[0x263F8D288]);
  result.value._unint64_t object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

void FilePath.init(cString:)(const char *a1@<X0>, void *a2@<X8>)
{
  size_t v4 = strlen(a1);
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, v4 + 1);
    SystemString._normalizeSeparators()();
    *a2 = v5;
  }
}

System::FilePath __swiftcall FilePath.init(cString:)(Swift::OpaquePointer cString)
{
  uint64_t v2 = *((void *)cString._rawValue + 2);
  if (v2)
  {
    size_t v3 = v1;
    size_t v4 = (char *)cString._rawValue + 32;
    if (*((unsigned char *)cString._rawValue + 32))
    {
      unint64_t v5 = (unsigned __int8 *)cString._rawValue + 33;
      uint64_t v6 = v2 - 1;
      while (v6)
      {
        int v7 = *v5++;
        --v6;
        if (!v7) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      size_t v8 = strlen((const char *)cString._rawValue + 32);
      if (!__OFADD__(v8, 1))
      {
        uint64_t v10 = specialized _copyCollectionToContiguousArray<A>(_:)(v4, v8 + 1);
        SystemString._normalizeSeparators()();
        result._storage.nullTerminatedStorage._rawValue = (void *)swift_bridgeObjectRelease();
        *size_t v3 = v10;
        return result;
      }
      __break(1u);
    }
  }
  result._storage.nullTerminatedStorage._rawValue = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

System::FilePath __swiftcall FilePath.init(cString:)(System::FilePath cString)
{
  if (*(unsigned char *)cString._storage.nullTerminatedStorage._rawValue)
  {
    cString._storage.nullTerminatedStorage._rawValue = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *uint64_t v1 = &outlined read-only object #0 of FilePath.init(cString:);
  }
  return cString;
}

System::FilePath __swiftcall FilePath.init(cString:)(Swift::String cString)
{
  unint64_t object = (unint64_t)cString._object;
  uint64_t countAndFlagsBits = cString._countAndFlagsBits;
  size_t v4 = v1;
  unint64_t v5 = specialized Collection<>.firstIndex(of:)(0, 0xE100000000000000, cString._countAndFlagsBits, (unint64_t)cString._object);
  if (v6)
  {
    if ((object & 0x1000000000000000) != 0
      || !(object & 0x2000000000000000 | countAndFlagsBits & 0x1000000000000000))
    {
      _StringGuts._slowWithCString<A>(_:)();
      swift_bridgeObjectRelease();
      uint64_t v22 = *(void *)__s;
    }
    else
    {
      MEMORY[0x270FA5388](v5);
      if ((object & 0x2000000000000000) != 0)
      {
        *(void *)__s = countAndFlagsBits;
        uint64_t v26 = object & 0xFFFFFFFFFFFFFFLL;
        result._storage.nullTerminatedStorage._rawValue = (void *)strlen(__s);
        if (__OFADD__(result._storage.nullTerminatedStorage._rawValue, 1)) {
          goto LABEL_27;
        }
        uint64_t v22 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, (int64_t)result._storage.nullTerminatedStorage._rawValue + 1);
        swift_bridgeObjectRelease();
      }
      else
      {
        if ((countAndFlagsBits & 0x1000000000000000) != 0)
        {
          uint64_t v20 = (object & 0xFFFFFFFFFFFFFFFLL) + 32;
          uint64_t v21 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          uint64_t v20 = _StringObject.sharedUTF8.getter();
        }
        uint64_t v22 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v20, v21, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
        swift_bridgeObjectRelease();
      }
    }
    *(void *)__s = v22;
    goto LABEL_21;
  }
  uint64_t v7 = String.subscript.getter();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  uint64_t v14 = MEMORY[0x2166C0540](v7, v9, v11, v13);
  uint64_t v16 = v15;
  uint64_t v17 = swift_bridgeObjectRelease();
  if ((v16 & 0x1000000000000000) != 0 || !(v16 & 0x2000000000000000 | v14 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
LABEL_8:
    swift_bridgeObjectRelease();
LABEL_17:
    *(void *)__s = v24;
LABEL_21:
    SystemString._normalizeSeparators()();
    *size_t v4 = *(void *)__s;
    return result;
  }
  MEMORY[0x270FA5388](v17);
  if ((v16 & 0x2000000000000000) == 0)
  {
    if ((v14 & 0x1000000000000000) != 0)
    {
      uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v19 = v14 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v18 = _StringObject.sharedUTF8.getter();
    }
    uint64_t v24 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v18, v19, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
    goto LABEL_8;
  }
  *(void *)__s = v14;
  uint64_t v26 = v16 & 0xFFFFFFFFFFFFFFLL;
  result._storage.nullTerminatedStorage._rawValue = (void *)strlen(__s);
  if (!__OFADD__(result._storage.nullTerminatedStorage._rawValue, 1))
  {
    uint64_t v24 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, (int64_t)result._storage.nullTerminatedStorage._rawValue + 1);
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t associated type witness table accessor for ExpressibleByStringLiteral.StringLiteralType : _ExpressibleByBuiltinStringLiteral in FilePath()
{
  return MEMORY[0x263F8D388];
}

uint64_t associated type witness table accessor for ExpressibleByExtendedGraphemeClusterLiteral.ExtendedGraphemeClusterLiteralType : _ExpressibleByBuiltinExtendedGraphemeClusterLiteral in FilePath()
{
  return MEMORY[0x263F8D398];
}

uint64_t associated type witness table accessor for ExpressibleByUnicodeScalarLiteral.UnicodeScalarLiteralType : _ExpressibleByBuiltinUnicodeScalarLiteral in FilePath()
{
  return MEMORY[0x263F8D390];
}

ValueMetadata *type metadata accessor for SystemString()
{
  return &type metadata for SystemString;
}

uint64_t SystemString.replaceSubrange<A>(_:with:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))((char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), v3, v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SystemChar]);
  return Array.replaceSubrange<A>(_:with:)();
}

uint64_t SystemString.withSystemChars<A>(_:)@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for Optional();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v10 - v6;
  uint64_t result = Array.withContiguousStorageIfAvailable<A>(_:)();
  if (!v2)
  {
    uint64_t v9 = *(void *)(a1 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, a1);
    if (result == 1) {
      __break(1u);
    }
    else {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v7, a1);
    }
  }
  return result;
}

uint64_t Slice<>.withPlatformString<A>(_:)@<X0>(unint64_t a1@<X2>, size_t a2@<X3>, size_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  return swift_bridgeObjectRelease();
}

uint64_t SystemString.withPlatformString<A>(_:)@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return SystemString.withSystemChars<A>(_:)(a1, a2);
}

uint64_t specialized RangeReplaceableCollection.init(repeating:count:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v5 = result;
  if (!a4) {
    goto LABEL_4;
  }
  uint64_t v7 = a4;
  if ((a4 & 0x8000000000000000) == 0)
  {
    do
    {
      int64_t v10 = unk_26C63CE50 - 1;
      swift_bridgeObjectRetain();
      specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(v10, v10, v5, a2, a3);
      swift_bridgeObjectRelease();
      --v7;
    }
    while (v7);
LABEL_4:
    uint64_t result = swift_bridgeObjectRelease();
    *a5 = &outlined read-only object #0 of specialized RangeReplaceableCollection.init(repeating:count:);
    a5[1] = 0;
    return result;
  }
  __break(1u);
  return result;
}

void specialized RangeReplaceableCollection.removeFirst()(uint64_t *a1@<X8>)
{
  uint64_t v4 = *v1;
  Swift::Int v3 = v1[1];
  uint64_t v5 = *(void *)(*v1 + 16) - 1;
  if (v3 == v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  Swift::Int v8 = *v1;
  Swift::Int componentEnd = FilePath._parseComponent(startingAt:)(v3).componentEnd;
  if (componentEnd < v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v3 == componentEnd)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  *a1 = v4;
  a1[1] = v3;
  a1[2] = componentEnd;
  swift_bridgeObjectRetain();
  specialized BidirectionalCollection.index(_:offsetBy:limitedBy:)(v3, 1, v5, v4, (uint64_t)&v8);
  if (v9)
  {
LABEL_13:
    __break(1u);
    return;
  }
  int64_t v7 = v8;
  if (v8 < v3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(v3, v7);
}

uint64_t specialized RangeReplaceableCollection.removeFirst()()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  if (v1 == 1)
  {
    __break(1u);
  }
  else if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(*(void *)v0 + 32);
    specialized Array.replaceSubrange<A>(_:with:)(0, 1);
    return v2;
  }
  __break(1u);
  return result;
}

unsigned __int8 *protocol witness for RawRepresentable.init(rawValue:) in conformance SystemChar@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SystemChar(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance SystemChar(char *a1, char *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance SystemChar(char *a1, char *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance SystemChar(char *a1, char *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance SystemChar(char *a1, char *a2)
{
  return *a2 < *a1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SystemChar()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SystemChar()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SystemChar()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance SystemChar()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SystemChar()
{
  return RawRepresentable<>.encode(to:)();
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance SystemString.CodingKeys()
{
  return 0xD000000000000015;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SystemString.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized SystemString.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance SystemString.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SystemString.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SystemString.CodingKeys and conformance SystemString.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SystemString.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SystemString.CodingKeys and conformance SystemString.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SystemString.subscript.setter(char a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v5 = *v3;
    if (*(void *)(*v3 + 16) > a2)
    {
      char v4 = a1;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if (result) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  __break(1u);
LABEL_8:
  uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v5);
  uint64_t v5 = result;
LABEL_4:
  if (*(void *)(v5 + 16) <= v2)
  {
    __break(1u);
  }
  else
  {
    *(unsigned char *)(v5 + v2 + 32) = v4;
    *Swift::Int v3 = v5;
  }
  return result;
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a4 + 16);
  if (v4 > result)
  {
    BOOL v5 = v4 >= a3;
    BOOL v6 = v4 == a3;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v6 = 0;
  }
  if (v6 || !v5)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v7 = a3 - result;
  if (a2 >= 1)
  {
    if (v7 < 0 || v7 >= (unint64_t)a2) {
      goto LABEL_13;
    }
    return 0;
  }
  if (v7 <= 0 && v7 > a2) {
    return 0;
  }
LABEL_13:
  BOOL v8 = __OFADD__(result, a2);
  result += a2;
  if (v8) {
    goto LABEL_16;
  }
  if (result >= v4) {
LABEL_17:
  }
    __break(1u);
  return result;
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance SystemString(char *a1, unint64_t *a2)
{
  return SystemString.subscript.setter(*a1, *a2);
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance SystemString(uint64_t (*result)(uint64_t a1), unint64_t *a2))(uint64_t a1)
{
  unint64_t v3 = *a2;
  *(void *)uint64_t result = v2;
  *((void *)result + 1) = v3;
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)v2 + 16) > v3)
  {
    *((unsigned char *)result + 16) = *(unsigned char *)(*(void *)v2 + v3 + 32);
    return protocol witness for MutableCollection.subscript.modify in conformance SystemString;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for MutableCollection.subscript.modify in conformance SystemString(uint64_t a1)
{
  return SystemString.subscript.setter(*(unsigned char *)(a1 + 16), *(void *)(a1 + 8));
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance SystemString(uint64_t *a1, uint64_t *a2)
{
  specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *a2, a2[1], *a1, a1[1], a1[2]);

  return swift_bridgeObjectRelease();
}

void (*protocol witness for MutableCollection.subscript.modify in conformance SystemString(void *a1, uint64_t *a2))(void *a1)
{
  unint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance SystemString;
}

void protocol witness for MutableCollection.subscript.modify in conformance SystemString(void *a1)
{
  Swift::UInt8 v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*specialized MutableCollection<>.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  void v7[3] = a2;
  uint64_t result = *v3;
  uint64_t v9 = *((void *)*v3 + 2);
  if (!v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v9 > a3)
  {
    *uint64_t v7 = a2;
    v7[1] = a3;
    uint64_t v7[2] = result;
    swift_bridgeObjectRetain();
    return MutableCollection<>.subscript.modifyspecialized ;
  }
LABEL_7:
  __break(1u);
  return result;
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  uint64_t v4 = (*a1)[1];
  uint64_t v5 = (*a1)[4];
  uint64_t v6 = (*a1)[5];
  uint64_t v7 = (*a1)[2];
  uint64_t v8 = (*a1)[3];
  if (a2)
  {
    swift_bridgeObjectRetain();
    specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v6, v8, v5, v3, v4, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)((*a1)[5], v8, v5, v3, v4, v7);
  }
  swift_bridgeObjectRelease();

  free(v2);
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance SystemString@<X0>(uint64_t (*a1)(char *)@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = specialized MutableCollection<>.partition(by:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

unint64_t specialized MutableCollection<>.partition(by:)(uint64_t (*a1)(char *))
{
  uint64_t v4 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v4);
  }
  unint64_t result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  *Swift::UInt8 v1 = v4;
  if (!v2 && result >= *((void *)v4 + 2)) {
    __break(1u);
  }
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance SystemString(unint64_t *a1, unint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

unint64_t specialized MutableCollection.swapAt(_:_:)(unint64_t result, unint64_t a2)
{
  if (result != a2)
  {
    unint64_t v7 = result;
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v4 = *v3;
      unint64_t v8 = *(void *)(*v3 + 16);
      if (v8 > result)
      {
        unint64_t v2 = a2;
        if (v8 > a2)
        {
          char v5 = *(unsigned char *)(v4 + 32 + result);
          char v6 = *(unsigned char *)(v4 + 32 + a2);
          unint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if (result) {
            goto LABEL_6;
          }
          goto LABEL_13;
        }
LABEL_12:
        __break(1u);
LABEL_13:
        unint64_t result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v4);
        uint64_t v4 = result;
LABEL_6:
        unint64_t v9 = *(void *)(v4 + 16);
        if (v9 <= v7)
        {
          __break(1u);
        }
        else
        {
          *(unsigned char *)(v4 + 32 + v7) = v6;
          *uint64_t v3 = v4;
          if (v9 > v2)
          {
            *(unsigned char *)(v4 + 32 + v2) = v5;
            *uint64_t v3 = v4;
            return result;
          }
        }
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_12;
  }
  return result;
}

uint64_t protocol witness for MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:) in conformance SystemString()
{
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)();
}

uint64_t protocol witness for MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:) in conformance SystemString()
{
  return SystemString.withContiguousMutableStorageIfAvailable<A>(_:)();
}

uint64_t SystemString.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return Array.withContiguousMutableStorageIfAvailable<A>(_:)();
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance SystemString@<X0>(void *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < *(void *)(*(void *)v2 + 16) - 1)
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance SystemString(uint64_t *result)
{
  uint64_t v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if ((v2 & 0x8000000000000000) == 0 && v2 < *(void *)(*(void *)v1 + 16) - 1)
  {
    *unint64_t result = v2;
    return result;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance SystemString(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance SystemString(uint64_t (*result)(), unint64_t *a2))()
{
  unint64_t v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)v2 + 16) > v3)
  {
    *(unsigned char *)unint64_t result = *(unsigned char *)(*(void *)v2 + v3 + 32);
    return Mach.Port._name.modify;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.subscript.getter in conformance SystemString@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = *v2;
  uint64_t v5 = *(void *)(*v2 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v6 = *a1;
  if (*a1 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v7 = a1[1];
  if (v5 > v7)
  {
    *a2 = v6;
    a2[1] = v7;
    a2[2] = result;
    return swift_bridgeObjectRetain();
  }
LABEL_7:
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance SystemString(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  if (v2)
  {
    *a1 = 0;
    a1[1] = v2 - 1;
  }
  else
  {
    __break(1u);
  }
}

BOOL protocol witness for Collection.isEmpty.getter in conformance SystemString()
{
  return *(void *)(*(void *)v0 + 16) == 1;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance SystemString@<X0>(void *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 < *(void *)(*(void *)v3 + 16))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance SystemString@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v7 & 1;
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance SystemString(unint64_t *result, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *(void *)(*(void *)v2 + 16);
  if (*result < v4 && v3 < v4) {
    return (unint64_t *)(v3 - *result);
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.index(after:) in conformance SystemString@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *result;
  if (*result < 0 || v3 >= *(void *)(*(void *)v2 + 16) - 1) {
    __break(1u);
  }
  else {
    *a2 = v3 + 1;
  }
  return result;
}

uint64_t *protocol witness for Collection.formIndex(after:) in conformance SystemString(uint64_t *result)
{
  uint64_t v2 = *result;
  if (*result < 0 || v2 >= *(void *)(*(void *)v1 + 16) - 1) {
    __break(1u);
  }
  else {
    *unint64_t result = v2 + 1;
  }
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance SystemString(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance SystemString()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  if (v1) {
    return v1 - 1;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance SystemString()
{
  uint64_t v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance SystemString(void *a1, unsigned char *a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance SystemString()
{
  return SystemString.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t SystemString.withContiguousStorageIfAvailable<A>(_:)()
{
  return Array.withContiguousStorageIfAvailable<A>(_:)();
}

void protocol witness for RangeReplaceableCollection.init() in conformance SystemString(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for RangeReplaceableCollection.init() in conformance SystemString;
}

uint64_t protocol witness for RangeReplaceableCollection.replaceSubrange<A>(_:with:) in conformance SystemString(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  SystemString.replaceSubrange<A>(_:with:)(*a1);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8);

  return v5(a2, a3);
}

char *protocol witness for RangeReplaceableCollection.reserveCapacity(_:) in conformance SystemString(char *result)
{
  uint64_t v2 = result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = *v1;
    uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (!result || (uint64_t)v2 > *((void *)v3 + 3) >> 1)
    {
      if (*((void *)v3 + 2) <= (uint64_t)v2) {
        int64_t v4 = (int64_t)v2;
      }
      else {
        int64_t v4 = *((void *)v3 + 2);
      }
      uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(result, v4, 0, v3);
      uint64_t v3 = result;
    }
    *uint64_t v1 = v3;
  }
  return result;
}

uint64_t protocol witness for RangeReplaceableCollection.init(repeating:count:) in conformance SystemString@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = specialized RangeReplaceableCollection.init(repeating:count:)(*a1, a2);
  *a3 = result;
  return result;
}

unint64_t protocol witness for RangeReplaceableCollection.append(_:) in conformance SystemString(char *a1)
{
  return specialized Array.replaceSubrange<A>(_:with:)(*(void *)(*(void *)v1 + 16) - 1, *(void *)(*(void *)v1 + 16) - 1, *a1);
}

unint64_t protocol witness for RangeReplaceableCollection.insert(_:at:) in conformance SystemString(char *a1, unint64_t *a2)
{
  return specialized Array.replaceSubrange<A>(_:with:)(*a2, *a2, *a1);
}

unint64_t protocol witness for RangeReplaceableCollection.remove(at:) in conformance SystemString@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized RangeReplaceableCollection.remove(at:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RangeReplaceableCollection.removeSubrange(_:) in conformance SystemString(uint64_t a1)
{
  return specialized Array.replaceSubrange<A>(_:with:)(*(void *)a1, *(void *)(a1 + 8));
}

void protocol witness for RangeReplaceableCollection._customRemoveLast() in conformance SystemString(_WORD *a1@<X8>)
{
  *a1 = 256;
}

uint64_t protocol witness for RangeReplaceableCollection.removeFirst() in conformance SystemString@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = specialized RangeReplaceableCollection.removeFirst()();
  *a1 = result;
  return result;
}

uint64_t protocol witness for RangeReplaceableCollection.removeFirst(_:) in conformance SystemString(uint64_t result)
{
  if (!result) {
    return result;
  }
  if (result < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(0, result, *(void *)(*v1 + 16) - 1, *v1);
  if (v2)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if (result < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  return specialized Array.replaceSubrange<A>(_:with:)(0, result);
}

uint64_t protocol witness for RangeReplaceableCollection.removeAll(where:) in conformance SystemString(uint64_t (*a1)(char *))
{
  uint64_t result = specialized MutableCollection._halfStablePartition(isSuffixElement:)(a1);
  if (!v2)
  {
    uint64_t v4 = *(void *)(*(void *)v1 + 16);
    if (v4 <= result) {
      __break(1u);
    }
    else {
      return specialized Array.replaceSubrange<A>(_:with:)(result, v4 - 1);
    }
  }
  return result;
}

uint64_t SystemString.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SystemString.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SystemString.CodingKeys and conformance SystemString.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SystemChar]);
  lazy protocol witness table accessor for type Slice<SystemString> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type [SystemChar] and conformance <A> [A], &demangling cache variable for type metadata for [SystemChar], (void (*)(void))lazy protocol witness table accessor for type SystemChar and conformance SystemChar);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int SystemString.hashValue.getter(uint64_t a1)
{
  Hasher.init(_seed:)();
  Swift::UInt v2 = *(void *)(a1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    uint64_t v3 = (Swift::UInt8 *)(a1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SystemString()
{
  return SystemString.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance SystemString()
{
  uint64_t v1 = *v0;
  Swift::UInt v2 = *(void *)(*v0 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    uint64_t v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SystemString()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Swift::UInt v2 = *(void *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    uint64_t v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
  return Hasher._finalize()();
}

void *protocol witness for Decodable.init(from:) in conformance SystemString@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = specialized SystemString.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SystemString(void *a1)
{
  return SystemString.encode(to:)(a1, *v1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SystemString(uint64_t *a1, uint64_t *a2)
{
  return specialized static Array<A>.== infix(_:_:)(*a1, *a2);
}

uint64_t _sSPsRi_zrlE17withMemoryRebound2to8capacity_qd_1_qd__m_Siqd_1_SPyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v13 = *(void *)(a8 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](a5);
  uint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v17(v14, v16);
  if (v11) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a11, v16, a8);
  }
  return result;
}

uint64_t protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance SystemString@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = specialized String.withCString<A>(_:)((uint64_t)closure #1 in SystemString.init(_:), 0, *a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SystemString()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = String.init(cString:)();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SystemString()
{
  swift_bridgeObjectRetain();
  String.init(cString:)();
  swift_bridgeObjectRelease();
  uint64_t v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t lazy protocol witness table accessor for type SystemString and conformance SystemString()
{
  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RangeReplaceableCollection in SystemString()
{
  return lazy protocol witness table accessor for type Slice<SystemString> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<SystemString> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<SystemString>, (void (*)(void))lazy protocol witness table accessor for type SystemString and conformance SystemString);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in SystemString()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type IndexingIterator<SystemString> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<SystemString>);
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in SystemString()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in SystemString()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in SystemString()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<SystemString> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<SystemString>);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in SystemString()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in SystemString()
{
  return lazy protocol witness table accessor for type Slice<SystemString> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<SystemString> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<SystemString>, (void (*)(void))lazy protocol witness table accessor for type SystemString and conformance SystemString);
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in SystemString()
{
  return lazy protocol witness table accessor for type Slice<SystemString> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<SystemString> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<SystemString>, (void (*)(void))lazy protocol witness table accessor for type SystemString and conformance SystemString);
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in SystemString()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in SystemString()
{
  return lazy protocol witness table accessor for type Slice<SystemString> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<SystemString> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<SystemString>, (void (*)(void))lazy protocol witness table accessor for type SystemString and conformance SystemString);
}

uint64_t closure #1 in SystemString.withPlatformString<A>(_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (result)
  {
    uint64_t v8 = result;
    MEMORY[0x270FA5388](result);
    uint64_t v14[2] = v10;
    v14[3] = v9;
    v14[4] = v11;
    v14[5] = v12;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    return _sSPsRi_zrlE17withMemoryRebound2to8capacity_qd_1_qd__m_Siqd_1_SPyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lF(MEMORY[0x263F8E498], a2, (uint64_t)partial apply for closure #1 in closure #1 in SystemString.withPlatformString<A>(_:), (uint64_t)v14, v8, (uint64_t)&type metadata for SystemChar, MEMORY[0x263F8E498], v13, a6, MEMORY[0x263F8E4E0], (uint64_t)&v15);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = *(void *)result;
  uint64_t v15 = *(void *)(*(void *)result + 16);
  if (!v15)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v9 = a2;
  if (a2 < 0)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v10 = a3;
  if (v15 <= a3)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v6 = a5;
  uint64_t v7 = a4;
  if (a2 == a3) {
    goto LABEL_22;
  }
  uint64_t v12 = a4 - a5;
  if (a4 == a5) {
    goto LABEL_33;
  }
  if (a2 >= a3) {
    goto LABEL_34;
  }
  uint64_t v11 = a6;
  uint64_t v8 = (void *)result;
  uint64_t v13 = *(void *)(a6 + 16);
  unint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_35;
  }
  while (1)
  {
    uint64_t v16 = 0;
    uint64_t v17 = v13 <= v7 ? v7 : v13;
    uint64_t v18 = v17 - v7;
    do
    {
      if (v7 + v16 >= v6)
      {
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      if (v7 < 0) {
        goto LABEL_25;
      }
      if (v18 == v16) {
        goto LABEL_26;
      }
      uint64_t v19 = *(void *)(v14 + 16);
      if (v19 <= v9 + v16) {
        goto LABEL_27;
      }
      *(unsigned char *)(v9 + v14 + 32 + v16) = *(unsigned char *)(v7 + v11 + 32 + v16);
      if (v7 + v16 >= v13 - 1 || v9 + v16 >= v19 - 1) {
        goto LABEL_28;
      }
      if (~v9 + v10 == v16) {
        goto LABEL_21;
      }
      ++v16;
    }
    while (v12 + v16);
    __break(1u);
LABEL_21:
    *uint64_t v8 = v14;
    v7 += v16 + 1;
LABEL_22:
    if (v7 == v6) {
      return result;
    }
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    unint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v14);
    uint64_t v14 = result;
  }
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, unsigned char *a2, unint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    a3 = 0;
    goto LABEL_28;
  }
  if (!a3)
  {
LABEL_28:
    *unint64_t result = a4;
    result[1] = a3;
    return (void *)a3;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v4 = *(void *)(a4 + 16);
  unint64_t v5 = v4 - 1;
  if (v4 == 1)
  {
LABEL_27:
    a3 = v5;
    goto LABEL_28;
  }
  if (v4)
  {
    *a2 = *(unsigned char *)(a4 + 32);
    unint64_t v6 = a3 - 1;
    if (a3 != 1)
    {
      if (v5 < v6) {
        unint64_t v6 = v4 - 1;
      }
      if (v6 >= v4 - 2) {
        unint64_t v6 = v4 - 2;
      }
      if (v6 >= a3 - 2) {
        unint64_t v6 = a3 - 2;
      }
      unint64_t v7 = v6 + 1;
      if (v7 <= 0x10 || ((unint64_t)&a2[-a4] & 0xFFFFFFFFFFFFFFF0) == 0x20)
      {
        uint64_t v8 = 1;
        uint64_t v9 = a2;
      }
      else
      {
        uint64_t v10 = v7 & 0xF;
        if ((v7 & 0xF) == 0) {
          uint64_t v10 = 16;
        }
        unint64_t v11 = v7 - v10;
        uint64_t v8 = v7 - v10 + 1;
        uint64_t v9 = &a2[v11];
        uint64_t v12 = a2 + 1;
        uint64_t v13 = (long long *)(a4 + 33);
        do
        {
          long long v14 = *v13++;
          *v12++ = v14;
          v11 -= 16;
        }
        while (v11);
      }
      uint64_t v15 = 0;
      uint64_t v16 = v4 - v8;
      unint64_t v17 = a3 - v8;
      uint64_t v18 = v8 + a4 + 32;
      uint64_t v19 = v9 + 1;
      while (v17 != v15)
      {
        if (v16 - 1 == v15) {
          goto LABEL_27;
        }
        if (v16 == v15) {
          goto LABEL_30;
        }
        v19[v15] = *(unsigned char *)(v18 + v15);
        if (v17 == ++v15) {
          goto LABEL_28;
        }
      }
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    goto LABEL_28;
  }
LABEL_32:
  __break(1u);
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v7 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  uint64_t v8 = a3;
  if (!a3) {
    goto LABEL_6;
  }
  if (a3 < 0) {
    goto LABEL_63;
  }
  int64_t v9 = *(void *)(a4 + 16);
  if (v9 - 1 == a5)
  {
LABEL_5:
    uint64_t v8 = 0;
LABEL_6:
    uint64_t v10 = a5;
LABEL_7:
    *unint64_t v7 = a4;
    v7[1] = a5;
    uint64_t v7[2] = v10;
    return v8;
  }
  unint64_t v11 = a2;
  uint64_t v12 = (unsigned char *)(a4 + 32);
  uint64_t v13 = 1;
  for (int64_t i = a5; ; int64_t i = v10)
  {
    BOOL v15 = i || v9 == 1;
    BOOL v16 = v15;
    if (v15) {
      break;
    }
    if (!v9) {
      goto LABEL_61;
    }
    if (*v12 != 47) {
      goto LABEL_25;
    }
    if ((unint64_t)v9 < 2) {
      goto LABEL_62;
    }
    uint64_t v17 = 1;
    uint64_t v10 = 1;
LABEL_48:
    *unint64_t v11 = a4;
    v11[1] = i;
    v11[2] = v17;
    if (v13 == v8)
    {
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    int64_t v9 = *(void *)(a4 + 16);
    if (v10 == v9 - 1)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = v13;
      goto LABEL_7;
    }
    ++v13;
    v11 += 3;
    unint64_t result = swift_bridgeObjectRetain();
  }
  if (v9 <= i || !v9) {
    goto LABEL_60;
  }
  if (i < 0) {
    goto LABEL_56;
  }
LABEL_25:
  uint64_t v10 = v9 - 1;
  uint64_t v17 = i;
  if (i != v9 - 1)
  {
    uint64_t v17 = i;
    while (1)
    {
      if (v17 >= v10)
      {
        __break(1u);
        goto LABEL_54;
      }
      if (v12[v17] == 47) {
        break;
      }
      if (v10 == ++v17)
      {
        uint64_t v17 = v9 - 1;
        break;
      }
    }
    if (v17 < i) {
      goto LABEL_57;
    }
  }
  if (i == v17) {
    goto LABEL_55;
  }
  if (v16)
  {
    if (v9 <= i) {
      goto LABEL_58;
    }
    if (i < 0) {
      goto LABEL_59;
    }
  }
  else
  {
    if (*v12 == 47)
    {
      uint64_t v10 = 1;
      goto LABEL_48;
    }
    if (v9 <= i) {
      goto LABEL_58;
    }
  }
  if (i == v10)
  {
    uint64_t v10 = i;
    goto LABEL_48;
  }
  uint64_t v18 = i;
  while (v18 < v10)
  {
    int v19 = v12[v18++];
    if (v19 == 47)
    {
      uint64_t v10 = v18;
      goto LABEL_48;
    }
    if (v10 == v18) {
      goto LABEL_48;
    }
  }
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized MutableCollection<>._partitionImpl(by:)(uint64_t (*a1)(char *))
{
  uint64_t v3 = v1[1];
  if (v3 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  uint64_t v6 = *v1;
  do
  {
    char v12 = *(unsigned char *)(v6 + v5);
    char v8 = a1(&v12);
    if (v2) {
      break;
    }
    if (v8)
    {
      while (v5 < --v3)
      {
        char v11 = *(unsigned char *)(v6 + v3);
        char v9 = a1(&v11);
        if ((v9 & 1) == 0)
        {
          if (v6)
          {
            char v7 = *(unsigned char *)(v6 + v5);
            *(unsigned char *)(v6 + v5) = *(unsigned char *)(v6 + v3);
            *(unsigned char *)(v6 + v3) = v7;
            goto LABEL_5;
          }
          __break(1u);
          return v5;
        }
      }
      return v5;
    }
LABEL_5:
    ++v5;
  }
  while (v5 < v3);
  return v5;
}

uint64_t specialized MutableCollection._halfStablePartition(isSuffixElement:)(uint64_t (*a1)(char *))
{
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(*v1 + 16);
  if (v5 == 1)
  {
    return 0;
  }
  else
  {
    unint64_t v7 = v4 + 32;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v9 = 33;
    while (1)
    {
      if (v9 - v5 == 33)
      {
        __break(1u);
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      char v19 = *(unsigned char *)(v7 + v9 - 33);
      uint64_t result = a1(&v19);
      if (v3)
      {
        swift_bridgeObjectRelease();
        return v7;
      }
      if (result) {
        break;
      }
      if (v9 - ((v5 - 1) & ~((v5 - 1) >> 63)) == 33) {
        goto LABEL_33;
      }
      if (++v9 - v5 == 32)
      {
        swift_bridgeObjectRelease();
        return *(void *)(v4 + 16) - 1;
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v10 = *(void *)(v4 + 16);
    unint64_t v7 = v9 - 33;
    if (v9 - 33 >= (uint64_t)(v10 - 1)) {
      goto LABEL_42;
    }
    if (v9 - v10 == 31) {
      return v7;
    }
    while (1)
    {
      unint64_t v11 = v9 - 32;
      if (v10 <= v9 - 32) {
        break;
      }
      char v18 = *(unsigned char *)(v4 + v9);
      uint64_t result = a1(&v18);
      if (result)
      {
        unint64_t v10 = *(void *)(v4 + 16);
        int64_t v12 = v10 - 1;
      }
      else
      {
        if (v11 != v7)
        {
          if ((v7 & 0x8000000000000000) != 0) {
            goto LABEL_37;
          }
          unint64_t v13 = *(void *)(v4 + 16);
          if (v13 <= v7) {
            goto LABEL_38;
          }
          if (v13 <= v11) {
            goto LABEL_39;
          }
          char v14 = *(unsigned char *)(v4 + 32 + v7);
          char v15 = *(unsigned char *)(v4 + v9);
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v4);
            uint64_t v4 = result;
          }
          unint64_t v16 = *(void *)(v4 + 16);
          if (v7 >= v16) {
            goto LABEL_40;
          }
          *(unsigned char *)(v4 + v7 + 32) = v15;
          *uint64_t v1 = v4;
          if (v16 <= v11) {
            goto LABEL_41;
          }
          *(unsigned char *)(v4 + v9) = v14;
          *uint64_t v1 = v4;
        }
        if ((v7 & 0x8000000000000000) != 0) {
          goto LABEL_36;
        }
        unint64_t v10 = *(void *)(v4 + 16);
        int64_t v12 = v10 - 1;
        if ((uint64_t)v7 >= (uint64_t)(v10 - 1)) {
          goto LABEL_36;
        }
        ++v7;
      }
      if ((uint64_t)v11 >= v12) {
        goto LABEL_35;
      }
      uint64_t v17 = v9 - 31;
      ++v9;
      if (v17 == v12) {
        return v7;
      }
    }
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
  }
  return result;
}

uint64_t specialized RangeReplaceableCollection.init(repeating:count:)(char a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SystemChar>);
  uint64_t result = swift_allocObject();
  uint64_t v5 = (char *)result;
  *(_OWORD *)(result + 16) = xmmword_215694EE0;
  *(unsigned char *)(result + 32) = 0;
  if (!a2) {
    return (uint64_t)v5;
  }
  if ((a2 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = 1;
    do
    {
      if (v6 >= *((void *)v5 + 3) >> 1)
      {
        uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)1, v6 + 1, 1, v5);
        unint64_t v7 = *((void *)v5 + 2);
      }
      else
      {
        unint64_t v7 = v6;
      }
      char v8 = &v5[v6 + 31];
      memmove(&v5[v6 + 32], v8, v7 - (v6 - 1));
      unint64_t v6 = *((void *)v5 + 2) + 1;
      *((void *)v5 + 2) = v6;
      *char v8 = a1;
      --a2;
    }
    while (a2);
    return (uint64_t)v5;
  }
  __break(1u);
  return result;
}

uint64_t specialized SystemString.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x8000000215693090)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

void *specialized SystemString.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SystemString.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SystemString.CodingKeys and conformance SystemString.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SystemChar]);
    lazy protocol witness table accessor for type Slice<SystemString> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type [SystemChar] and conformance <A> [A], &demangling cache variable for type metadata for [SystemChar], (void (*)(void))lazy protocol witness table accessor for type SystemChar and conformance SystemChar);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    unint64_t v7 = v15;
    uint64_t v9 = v15[2];
    if (!v9
      || (uint64_t v10 = v9 - 1, *((unsigned char *)v15 + v9 + 31))
      || (uint64_t v11 = specialized Collection<>.firstIndex(of:)(0, (uint64_t)v15), (v12 & 1) != 0)
      || v11 != v10)
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type KeyedDecodingContainer<SystemString.CodingKeys> and conformance KeyedDecodingContainer<A>, &demangling cache variable for type metadata for KeyedDecodingContainer<SystemString.CodingKeys>);
      static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v13 = *(void (**)(char *, uint64_t))(v4 + 8);
      swift_bridgeObjectRetain();
      v13(v6, v3);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      swift_bridgeObjectRelease();
    }
  }
  return v7;
}

unint64_t lazy protocol witness table accessor for type SystemString.CodingKeys and conformance SystemString.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SystemChar and conformance SystemChar()
{
  unint64_t result = lazy protocol witness table cache variable for type SystemChar and conformance SystemChar;
  if (!lazy protocol witness table cache variable for type SystemChar and conformance SystemChar)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemChar and conformance SystemChar);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemChar and conformance SystemChar;
  if (!lazy protocol witness table cache variable for type SystemChar and conformance SystemChar)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemChar and conformance SystemChar);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemChar and conformance SystemChar;
  if (!lazy protocol witness table cache variable for type SystemChar and conformance SystemChar)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemChar and conformance SystemChar);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemChar and conformance SystemChar;
  if (!lazy protocol witness table cache variable for type SystemChar and conformance SystemChar)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemChar and conformance SystemChar);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type Slice<SystemString> and conformance <> Slice<A>(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *partial apply for closure #1 in SystemString.withContiguousMutableStorageIfAvailable<A>(_:)(void *result)
{
  uint64_t v2 = result[1];
  BOOL v3 = __OFSUB__(v2, 1);
  uint64_t v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void *))(v1 + 24);
    v6[0] = *result;
    v6[1] = v4;
    return (void *)v5(v6);
  }
  return result;
}

uint64_t partial apply for closure #1 in SystemString.withContiguousStorageIfAvailable<A>(_:)(uint64_t result, uint64_t a2)
{
  BOOL v3 = __OFSUB__(a2, 1);
  uint64_t v4 = a2 - 1;
  if (!v3) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24))(result, v4);
  }
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in SystemString.withPlatformString<A>(_:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in SystemString.withPlatformString<A>(_:)(a1, a2, v2[3], v2[4], v2[5], v2[2]);
}

uint64_t partial apply for closure #1 in closure #1 in SystemString.withPlatformString<A>(_:)(uint64_t a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 32))();
  if (v3) {
    *a2 = v3;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SystemString.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x215690BBCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for SystemString.CodingKeys()
{
  return &unk_26C63CEA0;
}

BOOL static FilePath.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return specialized static Array<A>.== infix(_:_:)(*a1, *a2);
}

System::FilePath __swiftcall FilePath.init()()
{
  *uint64_t v0 = &outlined read-only object #0 of FilePath.init();
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FilePath.CodingKeys()
{
  return 0x656761726F74735FLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance FilePath.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x656761726F74735FLL && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FilePath.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FilePath.CodingKeys and conformance FilePath.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type FilePath.CodingKeys and conformance FilePath.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FilePath.length.getter()
{
  return *(void *)(*(void *)v0 + 16) - 1;
}

uint64_t FilePath.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FilePath.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.CodingKeys and conformance FilePath.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  lazy protocol witness table accessor for type SystemString and conformance SystemString();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v10 = v11[1];
  swift_bridgeObjectRetain();
  if (FilePath._invariantsSatisfied()())
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DecodingError();
    swift_allocError();
    lazy protocol witness table accessor for type KeyedDecodingContainer<FilePath.CodingKeys> and conformance KeyedDecodingContainer<A>();
    static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

void FilePath.hash(into:)()
{
  uint64_t v1 = *v0;
  Hasher._combine(_:)(*(void *)(*v0 + 16));
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    int v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
}

uint64_t FilePath.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<FilePath.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.CodingKeys and conformance FilePath.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v9[1] = v7;
  lazy protocol witness table accessor for type SystemString and conformance SystemString();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int FilePath.hashValue.getter()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(*(void *)(v1 + 16));
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance FilePath@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return FilePath.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FilePath(void *a1)
{
  return FilePath.encode(to:)(a1);
}

unint64_t lazy protocol witness table accessor for type FilePath.CodingKeys and conformance FilePath.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type KeyedDecodingContainer<FilePath.CodingKeys> and conformance KeyedDecodingContainer<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type KeyedDecodingContainer<FilePath.CodingKeys> and conformance KeyedDecodingContainer<A>;
  if (!lazy protocol witness table cache variable for type KeyedDecodingContainer<FilePath.CodingKeys> and conformance KeyedDecodingContainer<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for KeyedDecodingContainer<FilePath.CodingKeys>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyedDecodingContainer<FilePath.CodingKeys> and conformance KeyedDecodingContainer<A>);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for FilePath.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2156915BCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for FilePath.CodingKeys()
{
  return &unk_26C63D0E8;
}

uint64_t String._withPlatformString<A>(_:)()
{
  return String.withCString<A>(_:)();
}

ssize_t FileDescriptor._write(_:retryOnInterrupt:)(void *__buf, uint64_t a2, char a3, int __fd)
{
  if (__buf) {
    size_t v7 = a2 - (void)__buf;
  }
  else {
    size_t v7 = 0;
  }
  while (1)
  {
    ssize_t result = write(__fd, __buf, v7);
    if (result != -1) {
      break;
    }
    LODWORD(result) = MEMORY[0x2166C0510]();
    if ((a3 & 1) == 0 || result != 4) {
      return result;
    }
  }
  return result;
}

uint64_t FileDescriptor._write(toAbsoluteOffset:_:retryOnInterrupt:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return FileDescriptor._write(toAbsoluteOffset:_:retryOnInterrupt:)(a1, a2, a3, a4, a5, MEMORY[0x263EF8A38]);
}

void static FileDescriptor._open(_:_:options:permissions:retryOnInterrupt:)(uint64_t a1, uint64_t a2, __int16 a3, int a4, char a5)
{
  while (1)
  {
    if ((a4 & 0x10000) == 0)
    {
      int v8 = open(_:_:_:)();
      goto LABEL_5;
    }
    if ((a3 & 0x200) != 0) {
      break;
    }
    int v8 = open(_:_:)();
LABEL_5:
    if (v8 == -1)
    {
      int v9 = MEMORY[0x2166C0510]();
      if ((a5 & 1) != 0 && v9 == 4) {
        continue;
      }
    }
    return;
  }
  __break(1u);
}

unint64_t FileDescriptor._close()(int a1)
{
  unsigned int v1 = close(a1);
  unsigned int v2 = v1;
  if (v1 == -1) {
    unsigned int v1 = MEMORY[0x2166C0510]();
  }
  return v1 | ((unint64_t)(v2 == -1) << 32);
}

off_t FileDescriptor._seek(offset:from:)(off_t a1, int a2, int a3)
{
  off_t result = lseek(a3, a1, a2);
  if (result == -1) {
    return MEMORY[0x2166C0510]();
  }
  return result;
}

ssize_t FileDescriptor._read(into:retryOnInterrupt:)(void *a1, uint64_t a2, char a3, int a4)
{
  if (a1) {
    size_t v7 = a2 - (void)a1;
  }
  else {
    size_t v7 = 0;
  }
  while (1)
  {
    ssize_t result = read(a4, a1, v7);
    if (result != -1) {
      break;
    }
    LODWORD(result) = MEMORY[0x2166C0510]();
    if ((a3 & 1) == 0 || result != 4) {
      return result;
    }
  }
  return result;
}

uint64_t FileDescriptor._read(fromAbsoluteOffset:into:retryOnInterrupt:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return FileDescriptor._write(toAbsoluteOffset:_:retryOnInterrupt:)(a1, a2, a3, a4, a5, MEMORY[0x263EF8A18]);
}

uint64_t FileDescriptor._write(toAbsoluteOffset:_:retryOnInterrupt:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a2) {
    uint64_t v11 = a3 - a2;
  }
  else {
    uint64_t v11 = 0;
  }
  while (1)
  {
    uint64_t result = a6(a5, a2, v11, a1);
    if (result != -1) {
      break;
    }
    LODWORD(result) = MEMORY[0x2166C0510]();
    if ((a4 & 1) == 0 || result != 4) {
      return result;
    }
  }
  return result;
}

unint64_t FileDescriptor._duplicate(as:retryOnInterrupt:)(uint64_t a1, char a2, int a3)
{
  do
  {
    if ((a1 & 0x100000000) != 0) {
      unsigned int v6 = dup(a3);
    }
    else {
      unsigned int v6 = dup2(a3, a1);
    }
    unsigned int v7 = v6;
    if (v6 != -1) {
      break;
    }
    unsigned int v6 = MEMORY[0x2166C0510]();
    if ((a2 & 1) == 0) {
      break;
    }
  }
  while (v6 == 4);
  return v6 | ((unint64_t)(v7 == -1) << 32);
}

uint64_t static FileDescriptor._pipe()()
{
  v1[1] = *MEMORY[0x263EF8340];
  v1[0] = -1;
  if (pipe((int *)v1) == -1) {
    return MEMORY[0x2166C0510]();
  }
  else {
    return v1[0];
  }
}

unint64_t FileDescriptor._resize(to:retryOnInterrupt:)(off_t a1, char a2, int a3)
{
  do
  {
    unsigned int v6 = ftruncate(a3, a1);
    unsigned int v7 = v6;
    if (v6 != -1) {
      break;
    }
    unsigned int v6 = MEMORY[0x2166C0510]();
    if ((a2 & 1) == 0) {
      break;
    }
  }
  while (v6 == 4);
  return v6 | ((unint64_t)(v7 == -1) << 32);
}

unint64_t protocol witness for Error._domain.getter in conformance Errno()
{
  return 0xD000000000000012;
}

unint64_t Errno._domain.getter()
{
  return 0xD000000000000012;
}

uint64_t protocol witness for Error._code.getter in conformance Errno()
{
  return *v0;
}

uint64_t Errno._code.getter(uint64_t result)
{
  return (int)result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance Errno()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance Errno()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t Errno.description.getter(int a1)
{
  if (strerror(a1)) {
    return String.init(cString:)();
  }
  else {
    return 0x206E776F6E6B6E75;
  }
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Errno()
{
  return Errno.description.getter(*v0);
}

ValueMetadata *type metadata accessor for Errno()
{
  return &type metadata for Errno;
}

Swift::Void __swiftcall FilePath._normalizeSpecialDirectories()()
{
  unsigned int v1 = v0;
  uint64_t v2 = *v0;
  FilePath.isLexicallyNormal.getter();
  if (v3) {
    return;
  }
  int64_t v4 = *(void *)(v2 + 16);
  if (v4 == 1) {
    return;
  }
  if (!v4)
  {
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  int v32 = *(unsigned __int8 *)(v2 + 32);
  if (v32 == 47)
  {
    if (v4 == 2) {
      return;
    }
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  int64_t v6 = v5;
  int64_t v7 = v5;
  do
  {
    if (v6 || v4 == 1) {
      goto LABEL_17;
    }
    if (!v4) {
      goto LABEL_94;
    }
    if (*(unsigned char *)(v2 + 32) != 47)
    {
LABEL_17:
      if (v4 <= v6 || !v4) {
        goto LABEL_89;
      }
      if (v6 < 0) {
        goto LABEL_90;
      }
      int64_t v10 = v4 - 1;
      uint64_t v8 = v6;
      int64_t v9 = v6;
      if (v6 != v4 - 1)
      {
        if (v6 >= (unint64_t)(v4 - 1)) {
          goto LABEL_92;
        }
        if (v6 >= (unint64_t)v4) {
          goto LABEL_93;
        }
        int64_t v11 = v6;
        if (*(unsigned char *)(v2 + v6 + 32) == 47)
        {
LABEL_34:
          uint64_t v8 = v11 + 1;
          int64_t v10 = v11;
        }
        else
        {
          if (v6 + 1 != v10)
          {
            int64_t v12 = v6;
            while (v12 + 1 >= v6 && v12 + 1 < v10)
            {
              if (*(unsigned char *)(v2 + 33 + v12) == 47)
              {
                int64_t v11 = v12 + 1;
                goto LABEL_34;
              }
              if (v4 - 2 == ++v12) {
                goto LABEL_32;
              }
            }
            goto LABEL_82;
          }
LABEL_32:
          uint64_t v8 = v4 - 1;
        }
        int64_t v9 = v10;
        if (v10 < v6) {
          goto LABEL_91;
        }
      }
      if (v4 <= v9) {
        goto LABEL_88;
      }
    }
    else
    {
      uint64_t v8 = 1;
      int64_t v9 = 1;
    }
    if (specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #0 of FilePath._normalizeSpecialDirectories(), v6, v9, v2))
    {
LABEL_9:
      int64_t v6 = v8;
      goto LABEL_10;
    }
    if ((specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #1 of FilePath._normalizeSpecialDirectories(), v6, v9, v2) & 1) == 0)goto LABEL_46; {
    if (v32 == 47 && v7 == v5)
    }
    {
      int64_t v6 = v8;
      int64_t v7 = v5;
      goto LABEL_10;
    }
    if (v7 == v5) {
      goto LABEL_46;
    }
    int64_t v14 = FilePath._parseComponent(priorTo:)(v7);
    if (v14 < 0 || v4 <= v15) {
      goto LABEL_95;
    }
    int64_t v16 = v14;
    if (specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #2 of FilePath._normalizeSpecialDirectories(), v14, v15, v2))
    {
LABEL_46:
      if (v6 == v7)
      {
        int64_t v6 = v8;
        int64_t v7 = v8;
      }
      else if (v6 != v8)
      {
        int64_t v17 = v6 + 32;
        int64_t v18 = v7 + 32;
        while (1)
        {
          unint64_t v19 = v17 - 32;
          unint64_t v20 = v18 - 32;
          if (v18 != v17)
          {
            if ((v19 & 0x8000000000000000) != 0) {
              goto LABEL_83;
            }
            uint64_t v21 = (char *)*v1;
            unint64_t v22 = *(void *)(*v1 + 16);
            if (v22 <= v19) {
              goto LABEL_84;
            }
            if (v20 >= v22) {
              goto LABEL_85;
            }
            char v23 = v21[v17];
            char v24 = v21[v18];
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v21 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v21);
            }
            unint64_t v25 = *((void *)v21 + 2);
            if (v19 >= v25) {
              goto LABEL_86;
            }
            v21[v17] = v24;
            *unsigned int v1 = (uint64_t)v21;
            if (v25 <= v20) {
              goto LABEL_87;
            }
            v21[v18] = v23;
            *unsigned int v1 = (uint64_t)v21;
          }
          int64_t v26 = v17 - 31;
          if (__OFADD__(v19, 1)) {
            break;
          }
          uint64_t v27 = *(void *)(*v1 + 16) - 1;
          if ((uint64_t)v20 >= v27 || ((v20 | v19) & 0x8000000000000000) != 0 || (uint64_t)v19 >= v27) {
            goto LABEL_81;
          }
          ++v17;
          ++v18;
          if (v26 == v8)
          {
            int64_t v7 = v18 - 32;
            goto LABEL_9;
          }
        }
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
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
LABEL_90:
        __break(1u);
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
        goto LABEL_96;
      }
    }
    else
    {
      int64_t v6 = v8;
      int64_t v7 = v16;
    }
LABEL_10:
    uint64_t v2 = *v1;
    int64_t v4 = *(void *)(*v1 + 16);
  }
  while (v6 < v4 - 1);
  if (v6 == v7) {
    return;
  }
  if (v4 <= v7) {
    goto LABEL_97;
  }
  specialized Array.replaceSubrange<A>(_:with:)(v7, v4 - 1);
  uint64_t v28 = *v1;
  uint64_t v29 = *(void *)(*v1 + 16);
  if (v29 == 1) {
    return;
  }
  if (!v29)
  {
LABEL_98:
    __break(1u);
    __break(1u);
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  if (*(unsigned char *)(v28 + 32) != 47 || v29 != 2)
  {
    __int16 v30 = specialized BidirectionalCollection.last.getter(*v1);
    if ((v30 & 0x100) != 0) {
      goto LABEL_101;
    }
    if (v30 == 47)
    {
      uint64_t v31 = *(void *)(v28 + 16);
      if (v31 == 1) {
        goto LABEL_99;
      }
      if (v31)
      {
        specialized RangeReplaceableCollection.remove(at:)(v31 - 2);
        return;
      }
LABEL_100:
      __break(1u);
LABEL_101:
      __break(1u);
    }
  }
}

uint64_t FilePath._parseComponent(priorTo:)(uint64_t result)
{
  unint64_t v3 = result - 1;
  if (result < 1)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v4 = result;
  uint64_t result = *v2;
  unint64_t v5 = *(void *)(*v2 + 16);
  unint64_t v6 = v5 - 1;
  if (v5 == 1) {
    goto LABEL_7;
  }
  if (!v5)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (*(unsigned char *)(result + 32) != 47)
  {
LABEL_7:
    uint64_t v8 = 0;
    if (v5 <= v4)
    {
LABEL_29:
      __break(1u);
LABEL_30:
      unint64_t v7 = v6;
LABEL_31:
      uint64_t result = swift_bridgeObjectRelease();
      if (v1 >= (uint64_t)v7) {
        return v7;
      }
      goto LABEL_40;
    }
  }
  else
  {
    uint64_t v1 = 1;
    if (v4 == 1) {
      return 0;
    }
    uint64_t v8 = 1;
    if (v5 <= v4) {
      goto LABEL_29;
    }
  }
  uint64_t v12 = *v2;
  if (v6 == v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v1 = v4;
    if (v4 == v8)
    {
LABEL_10:
      swift_bridgeObjectRelease();
      return v1;
    }
    goto LABEL_13;
  }
  if (v3 < v6)
  {
    swift_bridgeObjectRetain();
    specialized Slice<>.remove(at:)(v3);
    uint64_t v1 = v4;
    if (v4 == v8) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t result = v12;
    unint64_t v6 = v1;
    while (1)
    {
      uint64_t v9 = v6 - 1;
      if (__OFSUB__(v6, 1)) {
        break;
      }
      if (v9 >= (uint64_t)v6) {
        goto LABEL_34;
      }
      if (v9 < 0) {
        goto LABEL_34;
      }
      unint64_t v10 = *(void *)(result + 16);
      if (v9 >= (uint64_t)(v10 - 1)) {
        goto LABEL_34;
      }
      if (v9 >= v10) {
        goto LABEL_35;
      }
      if (*(unsigned char *)(result + v9 + 32) == 47) {
        goto LABEL_30;
      }
      if (!v10 || v6 >= v10) {
        goto LABEL_36;
      }
      if (v10 == 1) {
        goto LABEL_37;
      }
      unint64_t v7 = v6 - 1;
      specialized Array.replaceSubrange<A>(_:with:)(v6 - 1, v6);
      uint64_t result = v12;
      unint64_t v11 = *(void *)(v12 + 16);
      if (!v11 || v7 >= v11) {
        goto LABEL_38;
      }
      if (v7 != v8)
      {
        unint64_t v6 = v9;
        if (v7) {
          continue;
        }
      }
      goto LABEL_31;
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
LABEL_42:
  __break(1u);
  __break(1u);
  return result;
}

Swift::Bool __swiftcall FilePath._invariantsSatisfied()()
{
  uint64_t v1 = *v0;
  uint64_t v8 = *v0;
  swift_bridgeObjectRetain();
  SystemString._normalizeSeparators()();
  BOOL v2 = specialized static Array<A>.== infix(_:_:)(v1, v8);
  LOBYTE(v3) = swift_bridgeObjectRelease();
  if (!v2)
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  uint64_t v4 = *(void *)(v1 + 16);
  if (v4 == 1) {
    goto LABEL_9;
  }
  if (!v4)
  {
    __break(1u);
    __break(1u);
    __break(1u);
    goto LABEL_13;
  }
  int v5 = *(unsigned __int8 *)(v1 + 32);
  if (v5 == 47 && v4 == 2) {
    goto LABEL_9;
  }
  __int16 v3 = specialized BidirectionalCollection.last.getter(v1);
  if ((v3 & 0x100) != 0)
  {
LABEL_13:
    __break(1u);
    return v3;
  }
  char v6 = v3;
  LOBYTE(v3) = v3 != 47;
  if (v5 == 47 && v6 != 47) {
LABEL_9:
  }
    LOBYTE(v3) = 1;
  return v3;
}

unint64_t specialized Slice<>.remove(at:)(unint64_t a1)
{
  BOOL v2 = v1;
  unint64_t v4 = v1[2];
  __int16 v3 = v1 + 2;
  unint64_t v5 = *v2;
  unint64_t v6 = *(void *)(v4 + 16);
  if (*v2 >= v6)
  {
    __break(1u);
    goto LABEL_8;
  }
  unint64_t v7 = v2[1];
  if (v7 >= v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unint64_t result = specialized RangeReplaceableCollection.remove(at:)(a1);
  unint64_t v9 = *(void *)(*v3 + 16);
  if (v9 <= v5)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v10 = v7 + ~v5;
  *BOOL v2 = v5;
  BOOL v11 = __OFADD__(v5, v10);
  unint64_t v12 = v5 + v10;
  if (v11)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v12 < v9)
  {
    v2[1] = v12;
    return result;
  }
LABEL_11:
  __break(1u);
  return open(_:_:_:)();
}

uint64_t open(_:_:_:)()
{
  return MEMORY[0x270FA08B8]();
}

uint64_t open(_:_:)()
{
  return MEMORY[0x270FA08C0]();
}

uint64_t errno.getter()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x270F9D4D0]();
}

uint64_t String.withCString<A>(_:)()
{
  return MEMORY[0x270F9D628]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

uint64_t String.init(validatingUTF8:)()
{
  return MEMORY[0x270F9D658]();
}

uint64_t String.debugDescription.getter()
{
  return MEMORY[0x270F9D670]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x270F9D748]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8B0]();
}

{
  return MEMORY[0x270F9D8F0]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t dispatch thunk of Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D920]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

uint64_t UnsafeRawBufferPointer.init<A>(_:)()
{
  return MEMORY[0x270F9DA50]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x270F9DAA8]();
}

{
  return MEMORY[0x270F9DAB8]();
}

{
  return MEMORY[0x270F9DAD0]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x270F9DB28]();
}

{
  return MEMORY[0x270F9DB38]();
}

{
  return MEMORY[0x270F9DB50]();
}

uint64_t Array.replaceSubrange<A>(_:with:)()
{
  return MEMORY[0x270F9DBD8]();
}

uint64_t Array.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270F9DBE8]();
}

uint64_t Array.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9DC48]();
}

uint64_t Array.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9DC58]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t dispatch thunk of Collection.indices.getter()
{
  return MEMORY[0x270F9E0C0]();
}

uint64_t dispatch thunk of Collection.isEmpty.getter()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x270F9E988]();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return MEMORY[0x270F9E9A0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)()
{
  return MEMORY[0x270F9EA70]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F308]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F448]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t Slice.indices.getter()
{
  return MEMORY[0x270F9FBC0]();
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

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x270ED9680](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x270EDA1D8](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

kern_return_t mach_port_extract_right(ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x270EDA1E0](*(void *)&task, *(void *)&name, *(void *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x270EDA1E8](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_guard(ipc_space_t task, mach_port_name_t name, mach_port_context_t guard, BOOLean_t strict)
{
  return MEMORY[0x270EDA1F8](*(void *)&task, *(void *)&name, guard, *(void *)&strict);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_set_mscount(ipc_space_t task, mach_port_name_t name, mach_port_mscount_t mscount)
{
  return MEMORY[0x270EDA230](*(void *)&task, *(void *)&name, *(void *)&mscount);
}

kern_return_t mach_port_unguard(ipc_space_t task, mach_port_name_t name, mach_port_context_t guard)
{
  return MEMORY[0x270EDA248](*(void *)&task, *(void *)&name, guard);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

int pipe(int a1[2])
{
  return MEMORY[0x270EDAC38](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}