uint64_t outlined consume of GenericArgument(uint64_t a1, char a2)
{
  uint64_t result;

  if (a2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t destroy for GenericArgument(uint64_t a1)
{
  return outlined consume of GenericArgument(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t *Type.genericArguments2.getter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 <= 0x7FF && (unint64_t)(v2 - 512) >= 3 && v2 != 0) {
    return 0;
  }
  TypeMetadata.descriptor.getter();
  result = (uint64_t *)TypeDescriptor.genericSignature.getter();
  if (result)
  {
    v4 = (char *)(result + 1);
    uint64_t v5 = *(unsigned __int16 *)result;
    if (*(_WORD *)result)
    {
      uint64_t v6 = 0;
      while (1)
      {
        int v7 = *v4++;
        if (v7 < 0 && __OFADD__(v6++, 1)) {
          break;
        }
        if (!--v5) {
          goto LABEL_16;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_16:
      if ((unint64_t)(*a1 - 512) > 2)
      {
        ClassMetadata.descriptor.getter();
        uint64_t v9 = ClassDescriptor.genericArgumentOffset.getter();
      }
      else
      {
        uint64_t v9 = 2;
      }
      return &a1[v9];
    }
  }
  return result;
}

uint64_t PartialType.create2(with:)(uint64_t a1, _DWORD *a2)
{
  if ((*a2 & 0x80) == 0)
  {
    if (!*(void *)(a1 + 16)) {
      goto LABEL_32;
    }
    return 0;
  }
  uint64_t v4 = 11;
  if ((*a2 & 0x1Fu) - 17 < 2) {
    uint64_t v4 = 7;
  }
  uint64_t v5 = &a2[v4];
  uint64_t v6 = *((unsigned __int16 *)v5 + 4);
  if (*((_WORD *)v5 + 4))
  {
    int v7 = (char *)(v5 + 4);
    uint64_t v8 = MEMORY[0x263F8EE78];
    do
    {
      int v12 = *v7++;
      char v11 = v12;
      if (v12 < 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v8 + 16) + 1, 1);
        }
        unint64_t v10 = *(void *)(v8 + 16);
        unint64_t v9 = *(void *)(v8 + 24);
        if (v10 >= v9 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v10 + 1, 1);
        }
        *(void *)(v8 + 16) = v10 + 1;
        *(unsigned char *)(v8 + v10 + 32) = v11;
      }
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  uint64_t v13 = *(void *)(v8 + 16);
  uint64_t v14 = *(void *)(a1 + 16);
  swift_release();
  if (v13 != v14) {
    return 0;
  }
  if (!v13)
  {
LABEL_32:
    swift_getKeyPath();
    uint64_t v24 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_getAtKeyPath();
    swift_release();
    return ((uint64_t (*)(void))((char *)a2 + v24 + v26))(0);
  }
  swift_bridgeObjectRetain();
  v15 = (unsigned char *)(a1 + 40);
  v16 = (char *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v17 = *((void *)v15 - 1);
    if (*v15)
    {
      swift_bridgeObjectRetain();
      uint64_t MetadataPack = swift_allocateMetadataPack();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v16 + 2) + 1, 1, v16);
      }
      unint64_t v20 = *((void *)v16 + 2);
      unint64_t v19 = *((void *)v16 + 3);
      if (v20 >= v19 >> 1) {
        v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v19 > 1), v20 + 1, 1, v16);
      }
      *((void *)v16 + 2) = v20 + 1;
      *(void *)&v16[8 * v20 + 32] = MetadataPack;
      outlined consume of GenericArgument(v17, 1);
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v16 + 2) + 1, 1, v16);
      }
      unint64_t v22 = *((void *)v16 + 2);
      unint64_t v21 = *((void *)v16 + 3);
      if (v22 >= v21 >> 1) {
        v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v21 > 1), v22 + 1, 1, v16);
      }
      *((void *)v16 + 2) = v22 + 1;
      *(void *)&v16[8 * v22 + 32] = v17;
    }
    v15 += 16;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v25 = _swift_instantiateCheckedGenericMetadata();
  swift_bridgeObjectRelease_n();
  return v25;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafeRawPointer?>);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t GenericArguments2.subscript.getter(uint64_t result, uint64_t a2, _WORD *a3, uint64_t a4)
{
  if (result < 0) {
    goto LABEL_48;
  }
  uint64_t v4 = result;
  if (result >= a4) {
    goto LABEL_48;
  }
  uint64_t v6 = (unsigned __int16)*a3;
  if (*a3)
  {
    int64_t v7 = (char *)(a3 + 4);
    uint64_t v8 = MEMORY[0x263F8EE78];
    do
    {
      int v12 = *v7++;
      char v11 = v12;
      if (v12 < 0)
      {
        result = swift_isUniquelyReferenced_nonNull_native();
        v32[0] = v8;
        if ((result & 1) == 0)
        {
          result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v8 + 16) + 1, 1);
          uint64_t v8 = v32[0];
        }
        unint64_t v10 = *(void *)(v8 + 16);
        unint64_t v9 = *(void *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v10 + 1, 1);
          uint64_t v8 = v32[0];
        }
        *(void *)(v8 + 16) = v10 + 1;
        *(unsigned char *)(v8 + v10 + 32) = v11;
      }
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  if (*(void *)(v8 + 16) <= v4) {
    goto LABEL_49;
  }
  char v13 = *(unsigned char *)(v8 + v4 + 32);
  swift_release();
  result = GenericSignature.packShapeHeader.getter();
  if ((result & 0x100000000) != 0 || (unsigned __int16 v14 = WORD1(result), (result = GenericSignature.packShapes.getter()) == 0))
  {
    if ((unint64_t)(v4 - 0x1000000000000000) >> 61 == 7) {
      return *(void *)(a2 + 8 * v4);
    }
    goto LABEL_50;
  }
  if ((v13 & 0x3F) != 1)
  {
    uint64_t v21 = v4 + v14;
    if (!__OFADD__(v4, v14))
    {
      if ((unint64_t)(v21 - 0x1000000000000000) >> 61 == 7) {
        return *(void *)(a2 + 8 * v21);
      }
      goto LABEL_53;
    }
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  if (!v15)
  {
LABEL_37:
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    strcpy((char *)v32, "Couldn't find ");
    HIBYTE(v32[1]) = -18;
    v24._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    unint64_t v17 = (unint64_t)v32;
    v25._countAndFlagsBits = 0x6B636170206E6920;
    v25._object = (void *)0xE900000000000073;
    String.append(_:)(v25);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v16 = v4 + v14;
  if (__OFADD__(v4, v14))
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (v16 != *(unsigned __int16 *)(result + 2))
  {
    uint64_t v22 = v15 - 1;
    if (v15 != 1)
    {
      result += 8;
      uint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
      while (v23)
      {
        if (v16 == *(unsigned __int16 *)(result + 2)) {
          goto LABEL_20;
        }
        --v23;
        result += 8;
        if (!--v22) {
          goto LABEL_37;
        }
      }
      goto LABEL_47;
    }
    goto LABEL_37;
  }
LABEL_20:
  unint64_t v17 = *(void *)(a2 + 8 * *(unsigned __int16 *)(result + 4));
  if ((v17 & 0x8000000000000000) != 0)
  {
LABEL_54:
    __break(1u);
    return result;
  }
  if (v17)
  {
    unint64_t v18 = *(void *)(a2 + 8 * v16) & 0xFFFFFFFFFFFFFFFELL;
    result = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(result + 16) = v17;
    unint64_t v19 = v17 - 1;
    if (v17 - 1 >= 0x1000000000000000) {
      unint64_t v19 = 0x1000000000000000;
    }
    if (v19 >= 4 && result - v18 < 0xFFFFFFFFFFFFFFE0)
    {
      unint64_t v26 = v19 + 1;
      uint64_t v27 = v26 & 3;
      if ((v26 & 3) == 0) {
        uint64_t v27 = 4;
      }
      unint64_t v20 = v26 - v27;
      v28 = (long long *)(v18 + 16);
      v29 = (_OWORD *)(result + 48);
      unint64_t v30 = v20;
      do
      {
        long long v31 = *v28;
        *(v29 - 1) = *(v28 - 1);
        _OWORD *v29 = v31;
        v28 += 2;
        v29 += 2;
        v30 -= 4;
      }
      while (v30);
    }
    else
    {
      unint64_t v20 = 0;
    }
    while (v20 != 0x1000000000000000)
    {
      *(void *)(result + 32 + 8 * v20) = *(void *)(v18 + 8 * v20);
      if (v17 == ++v20) {
        goto LABEL_45;
      }
    }
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
LABEL_38:
  result = MEMORY[0x263F8EE78];
LABEL_45:
  *(void *)(result + 16) = v17;
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<GenericSignature.ParameterDescriptor>);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int v12 = v10 + 32;
  char v13 = a4 + 32;
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
  swift_release();
  return v10;
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

unsigned __int16 *Type.genericArguments.getter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 <= 0x7FF && (unint64_t)(v2 - 512) >= 3 && v2 != 0) {
    return 0;
  }
  TypeMetadata.descriptor.getter();
  uint64_t result = (unsigned __int16 *)TypeDescriptor.genericSignature.getter();
  if (result)
  {
    unsigned int v5 = *result;
    result += 4;
    uint64_t v4 = v5;
    if (v5)
    {
      uint64_t v6 = 0;
      while (1)
      {
        int v7 = *(char *)result;
        uint64_t result = (unsigned __int16 *)((char *)result + 1);
        if (v7 < 0 && __OFADD__(v6++, 1)) {
          break;
        }
        if (!--v4) {
          goto LABEL_16;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_16:
      if ((unint64_t)(*a1 - 512) > 2)
      {
        ClassMetadata.descriptor.getter();
        uint64_t v9 = ClassDescriptor.genericArgumentOffset.getter();
      }
      else
      {
        uint64_t v9 = 2;
      }
      return (unsigned __int16 *)&a1[v9];
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Type()
{
  return &type metadata for Type;
}

ValueMetadata *type metadata accessor for GenericArgument()
{
  return &type metadata for GenericArgument;
}

unint64_t lazy protocol witness table accessor for type Type and conformance Type()
{
  unint64_t result = lazy protocol witness table cache variable for type Type and conformance Type;
  if (!lazy protocol witness table cache variable for type Type and conformance Type)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Type and conformance Type);
  }
  return result;
}

uint64_t Case.tag.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *Case.init(from:)(void *a1)
{
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  DynamicType = (void *)swift_getDynamicType();
  if ((unint64_t)(*DynamicType - 513) > 1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return 0;
  }
  else
  {
    v3 = DynamicType;
    EnumValueWitnessTable.getEnumTag(_:)();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v3;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

BOOL Case.hasPayload.getter()
{
  return *(_DWORD *)(FieldDescriptor.subscript.getter() + 4) != 0;
}

uint64_t Case.isIndirect.getter()
{
  return *(_DWORD *)FieldDescriptor.subscript.getter() & 1;
}

uint64_t Case.name.getter()
{
  return String.init(cString:)();
}

uint64_t Case.payloadType.getter()
{
  if (!Case.hasPayload.getter()) {
    return 0;
  }
  EnumMetadata.descriptor.getter();
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  FieldDescriptor.subscript.getter();
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  uint64_t result = MangledTypeReference.standardSubstitution.getter();
  if (!result) {
    return TypeMetadata._resolve(_:)();
  }
  return result;
}

uint64_t Case.get(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  outlined init with copy of Any(a1, (uint64_t)&v22);
  __swift_project_boxed_opaque_existential_0(&v22, v24);
  uint64_t DynamicType = swift_getDynamicType();
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v22);
  if (DynamicType != a2
    || (uint64_t v10 = *(void *)(a1 + 16),
        uint64_t v11 = *(void *)(a1 + 24),
        long long v22 = *(_OWORD *)a1,
        uint64_t v23 = v10,
        uint64_t v24 = v11,
        uint64_t result = EnumValueWitnessTable.getEnumTag(_:)(),
        result != a3))
  {
    *a4 = 0u;
    a4[1] = 0u;
    return result;
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = a2;
  if ((*(_DWORD *)(*(void *)(v24 - 8) + 80) & 0x20000) == 0)
  {
    if ((*(unsigned char *)(*(void *)(a2 - 8) + 82) & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ((*(unsigned char *)(*(void *)(a2 - 8) + 82) & 2) != 0) {
LABEL_8:
  }
    uint64_t v18 = swift_allocBox();
LABEL_9:
  ValueWitnessTable.initializeWithCopy(_:_:)();
  if ((Case.isIndirect.getter() & 1) == 0)
  {
    uint64_t result = Case.payloadType.getter();
    if (!result) {
      goto LABEL_18;
    }
  }
  swift_allocBox();
  EnumValueWitnessTable.destructiveProjectEnumData(_:)();
  ValueWitnessTable.initializeWithTake(_:_:)();
  if (Case.isIndirect.getter())
  {
    uint64_t result = swift_projectBox();
    if (!result) {
      goto LABEL_19;
    }
  }
  uint64_t result = Case.payloadType.getter();
  if (!result)
  {
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return result;
  }
  long long v15 = 0uLL;
  uint64_t v16 = 0;
  uint64_t v17 = result;
  if ((*(unsigned char *)(*(void *)(result - 8) + 82) & 2) != 0) {
    *(void *)&long long v15 = swift_allocBox();
  }
  ValueWitnessTable.initializeWithCopy(_:_:)();
  swift_deallocBox();
  long long v12 = v15;
  uint64_t v13 = v16;
  uint64_t v14 = v17;
  return outlined init with copy of Any((uint64_t)&v12, (uint64_t)a4);
}

BOOL static Case.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Case(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

void Case.hash(into:)(int a1, Swift::UInt a2, Swift::UInt a3)
{
}

Swift::Int Case.hashValue.getter(Swift::UInt a1, Swift::UInt a2)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Case()
{
  Swift::UInt v1 = *v0;
  Swift::UInt v2 = v0[1];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Case()
{
  Swift::UInt v1 = v0[1];
  Hasher._combine(_:)(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Case()
{
  Swift::UInt v1 = *v0;
  Swift::UInt v2 = v0[1];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t *Case.description.getter()
{
  uint64_t v9 = _typeName(_:qualified:)();
  v0._countAndFlagsBits = 46;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  v1._countAndFlagsBits = Case.name.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  if (!Case.hasPayload.getter()) {
    return (unint64_t *)v9;
  }
  uint64_t result = (unint64_t *)Case.payloadType.getter();
  if (result)
  {
    unint64_t v3 = *result;
    unint64_t v4 = static Metadata.Kind.tuple.getter();
    if (v3 > 0x7FF)
    {
      if (v4 - 2048 < 0xFFFFFFFFFFFFF801) {
        goto LABEL_8;
      }
    }
    else
    {
      if (v4 < 0x800)
      {
        if (v3 != v4) {
          goto LABEL_10;
        }
LABEL_8:
        uint64_t v5 = _typeName(_:qualified:)();
LABEL_11:
        String.append(_:)(*(Swift::String *)&v5);
        swift_bridgeObjectRelease();
        return (unint64_t *)v9;
      }
      if (!v3) {
        goto LABEL_8;
      }
    }
LABEL_10:
    v7._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    v8._countAndFlagsBits = 41;
    v8._object = (void *)0xE100000000000000;
    String.append(_:)(v8);
    uint64_t v5 = 40;
    unint64_t v6 = 0xE100000000000000;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for CustomStringConvertible.description.getter in conformance Case()
{
  return Case.description.getter();
}

uint64_t Cases.startIndex.getter()
{
  return 0;
}

unint64_t Cases.endIndex.getter(void *a1)
{
  if ((unint64_t)(*a1 - 513) > 1) {
    return 0;
  }
  uint64_t v1 = EnumMetadata.descriptor.getter();
  return (*(_DWORD *)(v1 + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(v1 + 24);
}

Swift::Int __swiftcall Cases.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall Cases.index(before:)(Swift::Int before)
{
  BOOL v1 = __OFSUB__(before, 1);
  Swift::Int result = before - 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t Cases.subscript.getter(uint64_t result, void *a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)(*a2 - 513) <= 1)
  {
    unint64_t v3 = result;
    Swift::Int result = EnumMetadata.descriptor.getter();
    if ((*(_DWORD *)(result + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(result + 24) > v3) {
      return (uint64_t)a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized RandomAccessCollection<>.index(_:offsetBy:)(uint64_t result, uint64_t a2, void *a3)
{
  int64_t v3 = result + a2;
  if (__OFADD__(result, a2))
  {
    __break(1u);
  }
  else
  {
    if ((unint64_t)(*a3 - 513) > 1)
    {
      int64_t v4 = 0;
    }
    else
    {
      Swift::Int result = EnumMetadata.descriptor.getter();
      int64_t v4 = (*(_DWORD *)(result + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(result + 24);
    }
    if ((v3 & 0x8000000000000000) == 0 && v4 >= v3) {
      return v3;
    }
  }
  __break(1u);
  return result;
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance Cases@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result - 1;
  }
  return result;
}

void *protocol witness for BidirectionalCollection.formIndex(before:) in conformance Cases(void *result)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    --*result;
  }
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:) in conformance Cases@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = specialized RandomAccessCollection<>.index(_:offsetBy:)(*a1, a2, *v3);
  *a3 = result;
  return result;
}

uint64_t protocol witness for BidirectionalCollection.distance(from:to:) in conformance Cases(uint64_t *a1, int64_t *a2)
{
  return specialized RandomAccessCollection<>.distance(from:to:)(*a1, *a2, *v2);
}

void protocol witness for Collection.startIndex.getter in conformance Cases(void *a1@<X8>)
{
  *a1 = 0;
}

void *protocol witness for Collection.endIndex.getter in conformance Cases@<X0>(unint64_t *a1@<X8>)
{
  uint64_t result = (void *)*v1;
  if ((unint64_t)(*(void *)*v1 - 513) > 1)
  {
    unint64_t v4 = 0;
  }
  else
  {
    uint64_t result = (void *)EnumMetadata.descriptor.getter();
    unint64_t v4 = (*((_DWORD *)result + 5) & 0xFFFFFF) + (unint64_t)*((unsigned int *)result + 6);
  }
  *a1 = v4;
  return result;
}

void (*protocol witness for Collection.subscript.read in conformance Cases(void *a1, unint64_t *a2))(void *a1)
{
  uint64_t v5 = malloc(0x38uLL);
  *a1 = v5;
  unint64_t v6 = Cases.subscript.read((uint64_t)v5, *a2, *v2);
  v5[4] = v7;
  v5 += 4;
  v5[1] = v8;
  v5[2] = v6;
  return protocol witness for Collection.subscript.read in conformance Cases;
}

void protocol witness for Collection.subscript.read in conformance Cases(void *a1)
{
  BOOL v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 48))(*a1);

  free(v1);
}

uint64_t (*Cases.subscript.read(uint64_t a1, unint64_t a2, void *a3))()
{
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_5;
  }
  if ((unint64_t)(*a3 - 513) > 1
    || (uint64_t v4 = EnumMetadata.descriptor.getter(),
        (*(_DWORD *)(v4 + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(v4 + 24) <= a2))
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  return Cases.subscript.read;
}

uint64_t protocol witness for Collection.subscript.getter in conformance Cases@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = specialized Collection<>.subscript.getter(*a1, a1[1], *v2);
  *a2 = result;
  a2[1] = v5;
  a2[2] = v6;
  return result;
}

uint64_t specialized Collection<>.subscript.getter(uint64_t result, int64_t a2, void *a3)
{
  uint64_t v4 = result;
  if ((unint64_t)(*a3 - 513) > 1)
  {
    int64_t v5 = 0;
  }
  else
  {
    uint64_t result = EnumMetadata.descriptor.getter();
    int64_t v5 = (*(_DWORD *)(result + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(result + 24);
  }
  if (v4 < 0)
  {
    __break(1u);
  }
  else if (v5 >= a2)
  {
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance Cases@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = specialized RandomAccessCollection<>.indices.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance Cases()
{
  if ((unint64_t)(**v0 - 513) > 1) {
    return 1;
  }
  uint64_t v1 = EnumMetadata.descriptor.getter();
  return (*(_DWORD *)(v1 + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(v1 + 24) == 0;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance Cases(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance Cases@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, int64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a1;
  uint64_t v8 = *v4;
  uint64_t v9 = specialized RandomAccessCollection<>.distance(from:to:)(*a1, *a3, *v4);
  if (a2 < 1)
  {
    if (v9 <= 0 && v9 > a2) {
      goto LABEL_4;
    }
LABEL_10:
    uint64_t result = specialized RandomAccessCollection<>.index(_:offsetBy:)(v7, a2, v8);
    char v11 = 0;
    goto LABEL_11;
  }
  if (v9 < 0 || v9 >= (unint64_t)a2) {
    goto LABEL_10;
  }
LABEL_4:
  uint64_t result = 0;
  char v11 = 1;
LABEL_11:
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v11;
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance Cases(uint64_t *result, uint64_t *a2)
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

void *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance Cases(void *result, void *a2)
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

void *protocol witness for Collection.index(after:) in conformance Cases@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *protocol witness for Collection.formIndex(after:) in conformance Cases(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance Cases(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t protocol witness for Collection.count.getter in conformance Cases()
{
  uint64_t v1 = *v0;
  if ((unint64_t)(**v0 - 513) > 1)
  {
    int64_t v3 = 0;
  }
  else
  {
    uint64_t v2 = EnumMetadata.descriptor.getter();
    int64_t v3 = (*(_DWORD *)(v2 + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(v2 + 24);
  }

  return specialized RandomAccessCollection<>.distance(from:to:)(0, v3, v1);
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance Cases()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance Cases()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance Cases(uint64_t a1, uint64_t **a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance Cases()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t lazy protocol witness table accessor for type Case and conformance Case()
{
  unint64_t result = lazy protocol witness table cache variable for type Case and conformance Case;
  if (!lazy protocol witness table cache variable for type Case and conformance Case)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Case and conformance Case);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Cases and conformance Cases()
{
  unint64_t result = lazy protocol witness table cache variable for type Cases and conformance Cases;
  if (!lazy protocol witness table cache variable for type Cases and conformance Cases)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Cases and conformance Cases);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Cases and conformance Cases;
  if (!lazy protocol witness table cache variable for type Cases and conformance Cases)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Cases and conformance Cases);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Cases and conformance Cases;
  if (!lazy protocol witness table cache variable for type Cases and conformance Cases)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Cases and conformance Cases);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Cases and conformance Cases;
  if (!lazy protocol witness table cache variable for type Cases and conformance Cases)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Cases and conformance Cases);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in Cases()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
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

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in Cases()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<Cases> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type Cases and conformance Cases);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in Cases()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in Cases()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<Cases> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type Cases and conformance Cases);
}

uint64_t lazy protocol witness table accessor for type Slice<Cases> and conformance <> Slice<A>(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<Cases>);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in Cases()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in Cases()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(unint64_t *a1)
{
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

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in Cases()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<Cases> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<Cases>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in Cases()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<Cases> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<Cases>);
}

uint64_t lazy protocol witness table accessor for type Slice<Cases> and conformance Slice<A>(unint64_t *a1, uint64_t *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Case(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for Case(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Case()
{
  return &type metadata for Case;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Cases(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for Cases(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Cases()
{
  return &type metadata for Cases;
}

uint64_t specialized RandomAccessCollection<>.indices.getter(void *a1)
{
  if ((unint64_t)(*a1 - 513) <= 1) {
    EnumMetadata.descriptor.getter();
  }
  return 0;
}

uint64_t specialized RandomAccessCollection<>.indices.getter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 > 0x7FF) {
    goto LABEL_4;
  }
  if (v2 == 512)
  {
    StructMetadata.descriptor.getter();
    return 0;
  }
  if (!v2)
  {
LABEL_4:
    ClassMetadata.descriptor.getter();
    return 0;
  }
  unint64_t v4 = static Metadata.Kind.tuple.getter();
  if (v4 > 0x7FF || v4 != v2) {
    return 0;
  }
  MEMORY[0x2611556A0](a1);
  uint64_t v5 = TupleMetadata.Elements.endIndex.getter();
  uint64_t result = TupleMetadata.Elements.endIndex.getter();
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t result = TupleMetadata.Elements.endIndex.getter();
    if ((v5 & 0x8000000000000000) == 0 && result >= v5) {
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized Collection.isEmpty.getter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 > 0x7FF) {
    goto LABEL_4;
  }
  if (v2 == 512)
  {
    int v3 = (unsigned int *)(StructMetadata.descriptor.getter() + 20);
    goto LABEL_6;
  }
  if (!v2)
  {
LABEL_4:
    int v3 = (unsigned int *)(ClassMetadata.descriptor.getter() + 36);
LABEL_6:
    uint64_t v4 = *v3;
    return v4 == 0;
  }
  unint64_t v6 = static Metadata.Kind.tuple.getter();
  uint64_t v4 = 0;
  if (v6 > 0x7FF || v6 != v2) {
    return v4 == 0;
  }
  MEMORY[0x2611556A0](a1);
  uint64_t v4 = TupleMetadata.Elements.endIndex.getter();
  uint64_t result = TupleMetadata.Elements.endIndex.getter();
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t result = TupleMetadata.Elements.endIndex.getter();
    if ((v4 & 0x8000000000000000) == 0 && result >= v4) {
      return v4 == 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t Field.parent.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t Field.isVar.getter(uint64_t a1, void *a2)
{
  if (*a2 <= 0x7FFuLL && (*a2 | 0x200) != 0x200) {
    return 0;
  }
  TypeMetadata.descriptor.getter();
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return (*(unsigned __int8 *)FieldDescriptor.subscript.getter() >> 1) & 1;
}

BOOL Field.isWeakOrUnowned.getter(uint64_t a1, unint64_t *a2)
{
  unint64_t v2 = *a2;
  unint64_t v3 = static Metadata.Kind.tuple.getter();
  if (v2 > 0x7FF)
  {
    if (v3 - 2048 >= 0xFFFFFFFFFFFFF801) {
      goto LABEL_8;
    }
    return 0;
  }
  if (v3 >= 0x800)
  {
    if (v2) {
      goto LABEL_8;
    }
    return 0;
  }
  if (v2 == v3) {
    return 0;
  }
LABEL_8:
  TypeMetadata.descriptor.getter();
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  FieldDescriptor.subscript.getter();
  return FieldDescriptor.Element.referenceOwnership.getter() != 0;
}

uint64_t Field.name.getter(uint64_t a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = static Metadata.Kind.tuple.getter();
  if (v3 > 0x7FF)
  {
    if (v4 - 2048 < 0xFFFFFFFFFFFFF801) {
      goto LABEL_6;
    }
LABEL_10:
    TypeMetadata.descriptor.getter();
    swift_getKeyPath();
    dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_getAtKeyPath();
    swift_release();
    FieldDescriptor.subscript.getter();
    swift_getKeyPath();
    dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_getAtKeyPath();
    swift_release();
    return String.init(cString:)();
  }
  if (v4 >= 0x800)
  {
    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  if (v3 != v4) {
    goto LABEL_10;
  }
LABEL_6:
  MEMORY[0x2611556A0](a2);
  uint64_t v5 = TupleMetadata.Elements.subscript.getter();

  return MEMORY[0x270F5BF18](v5);
}

uint64_t Field.offset.getter(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a2 == 512)
  {
    uint64_t v5 = *(unsigned int *)(StructMetadata.descriptor.getter() + 24);
    uint64_t v6 = StructMetadata.descriptor.getter();
    if ((unint64_t)(a1 - 0x2000000000000000) >> 62 == 3) {
      return *((unsigned int *)&a2[v5] + a1);
    }
    __break(1u);
    return MEMORY[0x270F5BF20](v6);
  }
  unint64_t v8 = static Metadata.Kind.tuple.getter();
  if (v8 > 0x7FF)
  {
    if (v4 - 2048 >= 0xFFFFFFFFFFFFF801) {
      return 0;
    }
  }
  else if (v4 <= 0x7FF)
  {
    if (v8 != v4) {
      return 0;
    }
  }
  else if (v8)
  {
    return 0;
  }
  MEMORY[0x2611556A0](a2);
  uint64_t v6 = TupleMetadata.Elements.subscript.getter();

  return MEMORY[0x270F5BF20](v6);
}

uint64_t Field.type.getter(uint64_t a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = static Metadata.Kind.tuple.getter();
  if (v3 > 0x7FF)
  {
    if (v4 - 2048 >= 0xFFFFFFFFFFFFF801) {
      goto LABEL_10;
    }
  }
  else if (v4 >= 0x800)
  {
    if (v3) {
      goto LABEL_10;
    }
  }
  else if (v3 != v4)
  {
LABEL_10:
    TypeMetadata.descriptor.getter();
    swift_getKeyPath();
    dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_getAtKeyPath();
    swift_release();
    FieldDescriptor.subscript.getter();
    swift_getKeyPath();
    dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_getAtKeyPath();
    swift_release();
    uint64_t result = MangledTypeReference.standardSubstitution.getter();
    if (!result) {
      return TypeMetadata._resolve(_:)();
    }
    return result;
  }
  MEMORY[0x2611556A0](a2);
  uint64_t v5 = TupleMetadata.Elements.subscript.getter();

  return MEMORY[0x270F5BF28](v5);
}

unint64_t Field.keyPath.getter(uint64_t a1, unint64_t *a2)
{
  return openedRoot #1 <A>(_:) in Field.keyPath.getter((uint64_t)a2, a1, a2);
}

unint64_t openedRoot #1 <A>(_:) in Field.keyPath.getter(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  return static KeyPath.create(for:)(a2, a3);
}

unint64_t Field._optionalKeyPath.getter(uint64_t a1, unint64_t *a2)
{
  uint64_t v4 = Field.type.getter(a1, a2);

  return openedValue #1 <A><A1>(_:) in openedRoot #1 <A>(_:) in Field._optionalKeyPath.getter(v4, a1, a2);
}

unint64_t openedValue #1 <A><A1>(_:) in openedRoot #1 <A>(_:) in Field._optionalKeyPath.getter(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  char isOptionalType = swift_isOptionalType();
  type metadata accessor for Optional();
  if ((isOptionalType & 1) == 0) {
    type metadata accessor for Optional();
  }
  type metadata accessor for KeyPath();
  return static KeyPath.createOptional(for:wrap:)(a2, a3, isOptionalType ^ 1u);
}

BOOL static Field.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a2 == a4 && a1 == a3;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Field(void *a1, void *a2)
{
  return a1[1] == a2[1] && *a1 == *a2;
}

void Field.hash(into:)(int a1, Swift::UInt a2, Swift::UInt a3)
{
}

Swift::Int Field.hashValue.getter(Swift::UInt a1, Swift::UInt a2)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Field()
{
  Swift::UInt v1 = *v0;
  Swift::UInt v2 = v0[1];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Field()
{
  Swift::UInt v1 = *v0;
  Hasher._combine(_:)(v0[1]);
  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Field()
{
  Swift::UInt v1 = *v0;
  Swift::UInt v2 = v0[1];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t Field.description.getter(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  unint64_t v5 = static Metadata.Kind.tuple.getter();
  if (v4 > 0x7FF)
  {
    if (v5 - 2048 < 0xFFFFFFFFFFFFF801) {
      goto LABEL_15;
    }
  }
  else if (v5 >= 0x800)
  {
    if (!v4) {
      goto LABEL_15;
    }
  }
  else if (v4 == v5)
  {
    goto LABEL_15;
  }
  TypeMetadata.descriptor.getter();
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  FieldDescriptor.subscript.getter();
  int v6 = FieldDescriptor.Element.referenceOwnership.getter();
  switch(v6)
  {
    case 4:
      unint64_t v8 = 0x800000025AD29C90;
      unint64_t v7 = 0xD000000000000010;
      break;
    case 2:
      unint64_t v7 = 0x2064656E776F6E75;
      unint64_t v8 = 0xE800000000000000;
      break;
    case 1:
      unint64_t v7 = 0x206B616577;
      unint64_t v8 = 0xE500000000000000;
      break;
    default:
      goto LABEL_15;
  }
  String.append(_:)(*(Swift::String *)&v7);
LABEL_15:
  if (Field.isVar.getter(a1, a2)) {
    uint64_t v9 = 544366966;
  }
  else {
    uint64_t v9 = 544499052;
  }
  unint64_t v10 = 0xE400000000000000;
  String.append(_:)(*(Swift::String *)&v9);
  v15._countAndFlagsBits = Field.name.getter(a1, a2);
  v15._object = v11;
  v12._countAndFlagsBits = 8250;
  v12._object = (void *)0xE200000000000000;
  String.append(_:)(v12);
  Field.type.getter(a1, a2);
  v13._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Field()
{
  return Field.description.getter(*(void *)v0, *(unint64_t **)(v0 + 8));
}

uint64_t Fields.startIndex.getter()
{
  return 0;
}

uint64_t Fields.endIndex.getter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 > 0x7FF) {
    goto LABEL_4;
  }
  if (v2 == 512)
  {
    unint64_t v3 = (unsigned int *)(StructMetadata.descriptor.getter() + 20);
    return *v3;
  }
  if (!v2)
  {
LABEL_4:
    unint64_t v3 = (unsigned int *)(ClassMetadata.descriptor.getter() + 36);
    return *v3;
  }
  unint64_t v6 = static Metadata.Kind.tuple.getter();
  uint64_t v4 = 0;
  if (v6 > 0x7FF || v6 != v2) {
    return v4;
  }
  MEMORY[0x2611556A0](a1);
  uint64_t v4 = TupleMetadata.Elements.endIndex.getter();
  uint64_t result = TupleMetadata.Elements.endIndex.getter();
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t result = TupleMetadata.Elements.endIndex.getter();
    if ((v4 & 0x8000000000000000) == 0 && result >= v4) {
      return v4;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::Int __swiftcall Fields.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall Fields.index(before:)(Swift::Int before)
{
  BOOL v1 = __OFSUB__(before, 1);
  Swift::Int result = before - 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t Fields.subscript.getter(uint64_t result, uint64_t *a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = result;
    Swift::Int result = Fields.endIndex.getter(a2);
    if (result > v2) {
      return v2;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.endIndex.getter in conformance Fields@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Fields.endIndex.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance Fields(uint64_t (*result)(), uint64_t *a2))()
{
  uint64_t v3 = *a2;
  if (*a2 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = result;
    unint64_t v5 = *v2;
    uint64_t result = (uint64_t (*)())Fields.endIndex.getter(v5);
    if (v3 < (uint64_t)result)
    {
      *(void *)uint64_t v4 = v3;
      *((void *)v4 + 1) = v5;
      return Cases.subscript.read;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.subscript.getter in conformance Fields@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  unint64_t v6 = *v2;
  uint64_t result = Fields.endIndex.getter(v6);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= v4)
  {
    *a2 = v5;
    a2[1] = v4;
    a2[2] = v6;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance Fields@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = specialized RandomAccessCollection<>.indices.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for Collection.isEmpty.getter in conformance Fields()
{
  return specialized Collection.isEmpty.getter(*v0);
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance Fields@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    uint64_t result = (void *)Fields.endIndex.getter(*v3);
    if ((v5 & 0x8000000000000000) == 0 && (uint64_t)result >= v5)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance Fields@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v7 & 1;
  return result;
}

uint64_t protocol witness for RandomAccessCollection.distance(from:to:) in conformance Fields(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = *v2;
  uint64_t result = Fields.endIndex.getter(*v2);
  if (v3 < 0 || result < v3)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = Fields.endIndex.getter(v5);
    if ((v4 & 0x8000000000000000) == 0 && result >= v4) {
      return v4 - v3;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.count.getter in conformance Fields()
{
  BOOL v1 = *v0;
  uint64_t v2 = Fields.endIndex.getter(v1);
  uint64_t result = Fields.endIndex.getter(v1);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = Fields.endIndex.getter(v1);
    if ((v2 & 0x8000000000000000) == 0 && result >= v2) {
      return v2;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance Fields()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance Fields(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

unint64_t lazy protocol witness table accessor for type Field and conformance Field()
{
  unint64_t result = lazy protocol witness table cache variable for type Field and conformance Field;
  if (!lazy protocol witness table cache variable for type Field and conformance Field)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Field and conformance Field);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Fields and conformance Fields()
{
  unint64_t result = lazy protocol witness table cache variable for type Fields and conformance Fields;
  if (!lazy protocol witness table cache variable for type Fields and conformance Fields)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Fields and conformance Fields);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Fields and conformance Fields;
  if (!lazy protocol witness table cache variable for type Fields and conformance Fields)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Fields and conformance Fields);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Fields and conformance Fields;
  if (!lazy protocol witness table cache variable for type Fields and conformance Fields)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Fields and conformance Fields);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Fields and conformance Fields;
  if (!lazy protocol witness table cache variable for type Fields and conformance Fields)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Fields and conformance Fields);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in Fields()
{
  return lazy protocol witness table accessor for type Slice<Fields> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<Fields> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type Fields and conformance Fields);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in Fields()
{
  return lazy protocol witness table accessor for type Slice<Fields> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<Fields> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type Fields and conformance Fields);
}

uint64_t lazy protocol witness table accessor for type Slice<Fields> and conformance <> Slice<A>(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<Fields>);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in Fields()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<Fields> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<Fields>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in Fields()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<Fields> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<Fields>);
}

uint64_t getEnumTagSinglePayload for Field(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 8)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for Field(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Field()
{
  return &type metadata for Field;
}

ValueMetadata *type metadata accessor for Fields()
{
  return &type metadata for Fields;
}

uint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result = Fields.endIndex.getter(a4);
  if (a1 < 0 || result < a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = Fields.endIndex.getter(a4);
  if (a3 < 0 || result < a3) {
    goto LABEL_17;
  }
  uint64_t v9 = a3 - a1;
  if (a2 >= 1)
  {
    if (v9 < 0 || v9 >= a2) {
      goto LABEL_12;
    }
    return 0;
  }
  if (v9 <= 0 && v9 > a2) {
    return 0;
  }
LABEL_12:
  BOOL v11 = __OFADD__(a1, a2);
  uint64_t v10 = a1 + a2;
  if (v11)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t result = Fields.endIndex.getter(a4);
  if ((v10 & 0x8000000000000000) == 0 && result >= v10) {
    return v10;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 < a3 || (a3 | result) < 0 || a5 < result)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v5 = a3 - result;
  if (a2 >= 1)
  {
    if (v5 < 0 || v5 >= a2) {
      goto LABEL_11;
    }
    return 0;
  }
  if (v5 <= 0 && v5 > a2) {
    return 0;
  }
LABEL_11:
  BOOL v6 = __OFADD__(result, a2);
  result += a2;
  if (v6)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (result < 0 || result > a5) {
    goto LABEL_17;
  }
  return result;
}

uint64_t specialized RandomAccessCollection<>.distance(from:to:)(uint64_t result, int64_t a2, void *a3)
{
  int64_t v5 = result;
  if ((unint64_t)(*a3 - 513) > 1)
  {
    int64_t v6 = 0;
  }
  else
  {
    uint64_t result = EnumMetadata.descriptor.getter();
    int64_t v6 = (*(_DWORD *)(result + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(result + 24);
  }
  if (v5 < 0 || v6 < v5)
  {
    __break(1u);
  }
  else
  {
    if ((unint64_t)(*a3 - 513) > 1)
    {
      int64_t v7 = 0;
    }
    else
    {
      uint64_t result = EnumMetadata.descriptor.getter();
      int64_t v7 = (*(_DWORD *)(result + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(result + 24);
    }
    if ((a2 & 0x8000000000000000) == 0 && v7 >= a2) {
      return a2 - v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized Collection.underestimatedCount.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t *specialized Sequence._copyContents(initializing:)(uint64_t *result, uint64_t a2, uint64_t *a3, uint64_t a4, _WORD *a5, uint64_t a6)
{
  uint64_t v9 = result;
  if (!a2)
  {
    uint64_t result = 0;
    goto LABEL_8;
  }
  if (!a3) {
    goto LABEL_6;
  }
  if (((unint64_t)a3 & 0x8000000000000000) == 0)
  {
    uint64_t result = (uint64_t *)a6;
    if (!a6)
    {
LABEL_8:
      *uint64_t v9 = a4;
      v9[1] = (uint64_t)a5;
      v9[2] = a6;
      v9[3] = (uint64_t)result;
      return result;
    }
    *(void *)a2 = GenericArguments2.subscript.getter(0, a4, a5, a6);
    *(unsigned char *)(a2 + 8) = v12 & 1;
    if (a3 != (uint64_t *)1)
    {
      uint64_t result = (uint64_t *)a6;
      if (a6 == 1) {
        goto LABEL_8;
      }
      *(void *)(a2 + 16) = GenericArguments2.subscript.getter(1, a4, a5, a6);
      *(unsigned char *)(a2 + 24) = v13 & 1;
      if (a3 != (uint64_t *)2)
      {
        uint64_t result = (uint64_t *)a6;
        if (a6 == 2) {
          goto LABEL_8;
        }
        uint64_t v14 = 0;
        uint64_t v15 = a2 + 32;
        while (1)
        {
          *(void *)uint64_t v15 = GenericArguments2.subscript.getter((uint64_t)v14 + 2, a4, a5, a6);
          *(unsigned char *)(v15 + 8) = v16 & 1;
          if ((uint64_t *)((char *)a3 - 3) == v14) {
            break;
          }
          v15 += 16;
          uint64_t v14 = (void *)((char *)v14 + 1);
          if ((void *)(a6 - 2) == v14)
          {
            uint64_t result = (uint64_t *)a6;
            goto LABEL_8;
          }
        }
      }
    }
LABEL_6:
    uint64_t result = a3;
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

BOOL static GenericArgument.== infix(_:_:)(void *a1, char a2, void *a3, char a4)
{
  if (a2) {
    return (a4 & 1) != 0 && specialized static Array<A>.== infix(_:_:)(a1, a3);
  }
  else {
    return (a4 & 1) == 0 && a1 == a3;
  }
}

BOOL specialized static Array<A>.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  int64_t v5 = a1 + 5;
  int64_t v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GenericArgument(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  int64_t v5 = *(void **)a2;
  char v6 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8)) {
    return (v6 & 1) != 0 && specialized static Array<A>.== infix(_:_:)(v4, v5);
  }
  else {
    return (v6 & 1) == 0 && v4 == v5;
  }
}

uint64_t GenericArguments2.genericSignature.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t GenericArguments2.numberOfKeyParameters.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t GenericArguments2.startIndex.getter()
{
  return 0;
}

uint64_t GenericArguments2.endIndex.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

Swift::Int __swiftcall GenericArguments2.index(after:)(Swift::Int after)
{
  return after + 1;
}

Swift::Int __swiftcall GenericArguments2.index(before:)(Swift::Int before)
{
  return before - 1;
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance GenericArguments2@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result - 1;
  return result;
}

void *protocol witness for BidirectionalCollection.formIndex(before:) in conformance GenericArguments2(void *result)
{
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:) in conformance GenericArguments2@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = specialized BidirectionalCollection.index(_:offsetBy:)(*a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for BidirectionalCollection.distance(from:to:) in conformance GenericArguments2(uint64_t *a1, uint64_t *a2)
{
  return specialized BidirectionalCollection.distance(from:to:)(*a1, *a2);
}

void protocol witness for Collection.endIndex.getter in conformance GenericArguments2(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance GenericArguments2(uint64_t a1, uint64_t *a2))(uint64_t a1)
{
  uint64_t v4 = GenericArguments2.subscript.getter(*a2, *(void *)v2, *(_WORD **)(v2 + 8), *(void *)(v2 + 16));
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 9) = v5;
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5 & 1;
  return protocol witness for Collection.subscript.read in conformance GenericArguments2;
}

uint64_t protocol witness for Collection.subscript.read in conformance GenericArguments2(uint64_t a1)
{
  return outlined consume of GenericArgument(*(void *)(a1 + 16), *(unsigned char *)(a1 + 9) & 1);
}

void *protocol witness for Collection.subscript.getter in conformance GenericArguments2@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *((void *)v2 + 2);
  if (v3 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = result[1];
  if (v3 >= v4)
  {
    long long v5 = *v2;
    *(void *)a2 = *result;
    *(void *)(a2 + 8) = v4;
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v3;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

__n128 protocol witness for Collection.indices.getter in conformance GenericArguments2@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = v1[1].n128_u64[0];
  __n128 result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = v2;
  return result;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance GenericArguments2()
{
  return *(void *)(v0 + 16) == 0;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:limitedBy:) in conformance GenericArguments2@<X0>(uint64_t *a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized BidirectionalCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

void *protocol witness for Collection.index(after:) in conformance GenericArguments2@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result + 1;
  return result;
}

void *protocol witness for Collection.formIndex(after:) in conformance GenericArguments2(void *result)
{
  return result;
}

__n128 protocol witness for Sequence.makeIterator() in conformance GenericArguments2@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = v1[1].n128_u64[0];
  __n128 result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u64[1] = 0;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance GenericArguments2()
{
  return specialized Collection.underestimatedCount.getter(*v0, v0[1], v0[2]);
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance GenericArguments2()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*(void *)v0, *(_WORD **)(v0 + 8), *(void *)(v0 + 16));
}

uint64_t *protocol witness for Sequence._copyContents(initializing:) in conformance GenericArguments2(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *(void *)v3, *(_WORD **)(v3 + 8), *(void *)(v3 + 16));
}

uint64_t GenericArguments.numberOfArguments.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t GenericArguments.startIndex.getter()
{
  return 0;
}

uint64_t GenericArguments.endIndex.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

Swift::Int __swiftcall GenericArguments.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall GenericArguments.index(before:)(Swift::Int before)
{
  BOOL v1 = __OFSUB__(before, 1);
  Swift::Int result = before - 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t GenericArguments.subscript.getter(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 0 || result >= a3)
  {
    __break(1u);
  }
  else if ((unint64_t)(result - 0x1000000000000000) >> 61 == 7)
  {
    return *(void *)(a2 + 8 * result);
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.endIndex.getter in conformance GenericArguments(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance GenericArguments(uint64_t (*result)(), uint64_t *a2))()
{
  uint64_t v3 = *a2;
  if (*a2 < 0 || v3 >= v2[1])
  {
    __break(1u);
  }
  else if ((unint64_t)(v3 - 0x1000000000000000) >> 61 == 7)
  {
    *(void *)Swift::Int result = *(void *)(*v2 + 8 * v3);
    return Cases.subscript.read;
  }
  __break(1u);
  return result;
}

void *protocol witness for Collection.subscript.getter in conformance GenericArguments@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2[1];
  if (v3 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = result[1];
  if (v3 >= v4)
  {
    uint64_t v5 = *v2;
    *a2 = *result;
    a2[1] = v4;
    a2[2] = v5;
    a2[3] = v3;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance GenericArguments(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = v2;
  }
}

BOOL protocol witness for Collection.isEmpty.getter in conformance GenericArguments()
{
  return *(void *)(v0 + 8) == 0;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance GenericArguments@<X0>(void *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0 && *(void *)(v3 + 8) >= v4)
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance GenericArguments@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4, v4[1]);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v7 & 1;
  return result;
}

uint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance GenericArguments(uint64_t *result, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *(void *)(v2 + 8);
  if (v4 >= *a2)
  {
    uint64_t v5 = *result;
    if (((v3 | *result) & 0x8000000000000000) == 0 && v4 >= v5) {
      return (uint64_t *)(v3 - v5);
    }
  }
  __break(1u);
  return result;
}

__n128 protocol witness for Sequence.makeIterator() in conformance GenericArguments@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = 0;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance GenericArguments()
{
  uint64_t result = *(void *)(v0 + 8);
  if (result < 0) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance GenericArguments()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*(void **)v0, *(void *)(v0 + 8));
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance GenericArguments(void *a1, void *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *(void **)v3, *(void *)(v3 + 8));
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t *a1)
{
  if ((unint64_t)(*a1 - 513) > 1)
  {
    int64_t v3 = 0;
  }
  else
  {
    uint64_t v2 = EnumMetadata.descriptor.getter();
    int64_t v3 = (*(_DWORD *)(v2 + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(v2 + 24);
  }
  uint64_t v4 = specialized RandomAccessCollection<>.distance(from:to:)(0, v3, a1);
  if (!v4) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v5 = v4;
  if (v4 <= 0)
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Case>);
    uint64_t v6 = swift_allocObject();
    int64_t v7 = _swift_stdlib_malloc_size((const void *)v6);
    uint64_t v8 = v7 - 32;
    if (v7 < 32) {
      uint64_t v8 = v7 - 17;
    }
    *(void *)(v6 + 16) = v5;
    *(void *)(v6 + 24) = 2 * (v8 >> 4);
  }
  uint64_t result = specialized Sequence._copySequenceContents(initializing:)((uint64_t)&v10, (uint64_t **)(v6 + 32), v5, a1);
  if (result == v5) {
    return v6;
  }
  __break(1u);
  return result;
}

{
  int64_t v2;
  uint64_t result;
  unint64_t *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;

  uint64_t v2 = Fields.endIndex.getter(a1);
  uint64_t result = Fields.endIndex.getter(a1);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = Fields.endIndex.getter(a1);
    if ((v2 & 0x8000000000000000) == 0 && result >= v2)
    {
      if (v2)
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Field>);
        uint64_t v4 = (unint64_t *)swift_allocObject();
        unint64_t v5 = _swift_stdlib_malloc_size(v4);
        uint64_t v6 = v5 - 32;
        if (v5 < 32) {
          uint64_t v6 = v5 - 17;
        }
        v4[2] = v2;
        v4[3] = 2 * (v6 >> 4);
        if (specialized Sequence._copySequenceContents(initializing:)((uint64_t)&v7, v4 + 4, v2, a1) == v2) {
          return (uint64_t)v4;
        }
        __break(1u);
      }
      return MEMORY[0x263F8EE78];
    }
  }
  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, _WORD *a2, uint64_t a3)
{
  if (a3 <= 0) {
    goto LABEL_7;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<GenericArgument>);
  uint64_t v6 = (void *)swift_allocObject();
  int64_t v7 = _swift_stdlib_malloc_size(v6);
  uint64_t v8 = v7 - 32;
  if (v7 < 32) {
    uint64_t v8 = v7 - 17;
  }
  v6[2] = a3;
  v6[3] = 2 * (v8 >> 4);
  do
  {
    if (specialized Sequence._copyContents(initializing:)(v10, (uint64_t)(v6 + 4), (uint64_t *)a3, a1, a2, a3) == (uint64_t *)a3) {
      break;
    }
    __break(1u);
LABEL_7:
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  while (a3 < 0);
  return v6;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(void *result, uint64_t a2)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    if (a2)
    {
      int64_t v3 = result;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Type>);
      uint64_t v4 = (void *)swift_allocObject();
      int64_t v5 = _swift_stdlib_malloc_size(v4);
      uint64_t v6 = v5 - 32;
      if (v5 < 32) {
        uint64_t v6 = v5 - 25;
      }
      v4[2] = a2;
      v4[3] = 2 * (v6 >> 3);
      if (specialized Sequence._copySequenceContents(initializing:)(v7, v4 + 4, a2, v3, a2) == (void *)a2) {
        return v4;
      }
      __break(1u);
    }
    return (void *)MEMORY[0x263F8EE78];
  }
  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, uint64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v4 = 8 * a2;
    int64_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafeRawPointer?>);
    size_t v4 = 8 * a2;
    int64_t v5 = (void *)swift_allocObject();
    int64_t v6 = _swift_stdlib_malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 - 25;
    }
    v5[2] = a2;
    v5[3] = 2 * (v7 >> 3);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = 0;
    goto LABEL_29;
  }
  if (!a3)
  {
LABEL_28:
    uint64_t v5 = a3;
    goto LABEL_29;
  }
  if (a3 < 0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v5 = a5;
  if (!a5)
  {
LABEL_29:
    void *result = a4;
    result[1] = a5;
    result[2] = v5;
    return (void *)v5;
  }
  unint64_t v6 = a5 - 1;
  if (a5 >= 1)
  {
    *a2 = *a4;
    if (a3 != 1)
    {
      if (v6 >= a3 - 2) {
        unint64_t v6 = a3 - 2;
      }
      if (v6 >= a3 - 1) {
        unint64_t v6 = a3 - 1;
      }
      if (v6 >= 0xFFFFFFFFFFFFFFFLL) {
        unint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
      }
      if (v6 >= 4 && (unint64_t)((char *)a2 - (char *)a4) > 0x1F)
      {
        unint64_t v10 = v6 + 1;
        uint64_t v11 = v10 & 3;
        if ((v10 & 3) == 0) {
          uint64_t v11 = 4;
        }
        unint64_t v12 = v10 - v11;
        uint64_t v8 = v10 - v11 + 1;
        uint64_t v9 = &a2[v12];
        char v13 = (long long *)(a4 + 3);
        uint64_t v14 = a2 + 3;
        do
        {
          long long v15 = *v13;
          *(v14 - 1) = *(v13 - 1);
          *uint64_t v14 = v15;
          v13 += 2;
          v14 += 2;
          v12 -= 4;
        }
        while (v12);
      }
      else
      {
        uint64_t v8 = 1;
        uint64_t v9 = a2;
      }
      char v16 = v9 + 1;
      while (a3 != v8)
      {
        if (a5 == v8)
        {
          uint64_t v5 = a5;
          goto LABEL_29;
        }
        if (v8 == 0x1000000000000000) {
          goto LABEL_32;
        }
        *v16++ = a4[v8];
        if (a3 == ++v8) {
          goto LABEL_28;
        }
      }
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    goto LABEL_28;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, uint64_t **a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v5 = (void *)result;
  if (!a2) {
    goto LABEL_6;
  }
  unint64_t v6 = a3;
  if (!a3)
  {
    unint64_t v9 = 0;
    goto LABEL_8;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  if ((unint64_t)(*a4 - 513) > 1
    || (swift_getKeyPath(),
        uint64_t v8 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter(),
        uint64_t result = swift_release(),
        !((*(_DWORD *)(*(uint64_t *)((char *)a4 + v8) + 20) & 0xFFFFFF)
        + (unint64_t)*(unsigned int *)(*(uint64_t *)((char *)a4 + v8) + 24))))
  {
LABEL_6:
    unint64_t v9 = 0;
    unint64_t v6 = 0;
    goto LABEL_8;
  }
  if ((unint64_t)(*a4 - 513) > 1
    || (swift_getKeyPath(),
        uint64_t v10 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter(),
        uint64_t result = swift_release(),
        !((*(_DWORD *)(*(uint64_t *)((char *)a4 + v10) + 20) & 0xFFFFFF)
        + (unint64_t)*(unsigned int *)(*(uint64_t *)((char *)a4 + v10) + 24))))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  *a2 = a4;
  a2[1] = 0;
  if (v6 == 1)
  {
    unint64_t v9 = 1;
    goto LABEL_8;
  }
  uint64_t v11 = (unint64_t *)(a2 + 3);
  unint64_t v9 = 1;
  while (1)
  {
    uint64_t v12 = *a4;
    if ((unint64_t)(*a4 - 513) <= 1) {
      break;
    }
LABEL_17:
    if ((unint64_t)(v12 - 513) > 1)
    {
      unint64_t v15 = 0;
    }
    else
    {
      swift_getKeyPath();
      uint64_t v14 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      uint64_t result = swift_release();
      unint64_t v15 = (*(_DWORD *)(*(uint64_t *)((char *)a4 + v14) + 20) & 0xFFFFFF)
          + (unint64_t)*(unsigned int *)(*(uint64_t *)((char *)a4 + v14) + 24);
    }
    if (v9 >= v15) {
      goto LABEL_24;
    }
    *(v11 - 1) = (unint64_t)a4;
    *uint64_t v11 = v9;
    v11 += 2;
    if (v6 == ++v9)
    {
      unint64_t v9 = v6;
      goto LABEL_8;
    }
  }
  swift_getKeyPath();
  uint64_t v13 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  uint64_t result = swift_release();
  if (v9 != (*(_DWORD *)(*(uint64_t *)((char *)a4 + v13) + 20) & 0xFFFFFF)
           + (unint64_t)*(unsigned int *)(*(uint64_t *)((char *)a4 + v13) + 24))
  {
    uint64_t v12 = *a4;
    goto LABEL_17;
  }
  unint64_t v6 = v9;
LABEL_8:
  *uint64_t v5 = a4;
  v5[1] = v9;
  return v6;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, unint64_t *a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v5 = (void *)result;
  if (!a2)
  {
    unint64_t v6 = 0;
    goto LABEL_36;
  }
  unint64_t v6 = a3;
  if (!a3)
  {
LABEL_36:
    *uint64_t v5 = a4;
    v5[1] = v6;
    return v6;
  }
  if ((a3 & 0x8000000000000000) != 0) {
    goto LABEL_42;
  }
  uint64_t v7 = a2;
  unint64_t v8 = 0;
  while (1)
  {
    uint64_t v9 = *a4;
    if ((unint64_t)*a4 > 0x7FF)
    {
LABEL_8:
      swift_getKeyPath();
      uint64_t v10 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      swift_release();
      uint64_t v11 = (unsigned int *)(*(uint64_t *)((char *)a4 + v10) + 36);
LABEL_9:
      uint64_t v12 = *v11;
LABEL_10:
      if (v8 == v12) {
        goto LABEL_34;
      }
      goto LABEL_11;
    }
    if (v9 == 512)
    {
      swift_getKeyPath();
      uint64_t v16 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      swift_release();
      uint64_t v11 = (unsigned int *)(*(uint64_t *)((char *)a4 + v16) + 20);
      goto LABEL_9;
    }
    if (!v9) {
      goto LABEL_8;
    }
    unint64_t v17 = static Metadata.Kind.tuple.getter();
    if (v17 <= 0x7FF && v17 == v9)
    {
      MEMORY[0x2611556A0](a4);
      uint64_t v12 = TupleMetadata.Elements.endIndex.getter();
      uint64_t result = TupleMetadata.Elements.endIndex.getter();
      if (result < 0) {
        goto LABEL_38;
      }
      uint64_t result = TupleMetadata.Elements.endIndex.getter();
      if (v12 < 0 || result < v12) {
        goto LABEL_39;
      }
      goto LABEL_10;
    }
    if (!v8)
    {
LABEL_34:
      unint64_t v6 = v8;
      goto LABEL_36;
    }
LABEL_11:
    uint64_t v13 = *a4;
    if ((unint64_t)*a4 > 0x7FF) {
      goto LABEL_14;
    }
    if (v13 == 512)
    {
      swift_getKeyPath();
      uint64_t v18 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      uint64_t result = swift_release();
      unint64_t v15 = (unsigned int *)(*(uint64_t *)((char *)a4 + v18) + 20);
      goto LABEL_23;
    }
    if (!v13)
    {
LABEL_14:
      swift_getKeyPath();
      uint64_t v14 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      uint64_t result = swift_release();
      unint64_t v15 = (unsigned int *)(*(uint64_t *)((char *)a4 + v14) + 36);
LABEL_23:
      uint64_t v19 = *v15;
      goto LABEL_24;
    }
    uint64_t result = static Metadata.Kind.tuple.getter();
    uint64_t v19 = 0;
    if ((unint64_t)result <= 0x7FF && result == v13)
    {
      MEMORY[0x2611556A0](a4);
      uint64_t v19 = TupleMetadata.Elements.endIndex.getter();
      uint64_t result = TupleMetadata.Elements.endIndex.getter();
      if (result < 0) {
        goto LABEL_40;
      }
      uint64_t result = TupleMetadata.Elements.endIndex.getter();
      if (v19 < 0 || result < v19) {
        goto LABEL_41;
      }
    }
LABEL_24:
    if (v8 >= v19) {
      break;
    }
    *uint64_t v7 = v8;
    v7[1] = (unint64_t)a4;
    v7 += 2;
    if (v6 == ++v8) {
      goto LABEL_36;
    }
  }
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
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericArguments2 and conformance GenericArguments2()
{
  unint64_t result = lazy protocol witness table cache variable for type GenericArguments2 and conformance GenericArguments2;
  if (!lazy protocol witness table cache variable for type GenericArguments2 and conformance GenericArguments2)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericArguments2 and conformance GenericArguments2);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GenericArguments2 and conformance GenericArguments2;
  if (!lazy protocol witness table cache variable for type GenericArguments2 and conformance GenericArguments2)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericArguments2 and conformance GenericArguments2);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GenericArguments2 and conformance GenericArguments2;
  if (!lazy protocol witness table cache variable for type GenericArguments2 and conformance GenericArguments2)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericArguments2 and conformance GenericArguments2);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in GenericArguments2()
{
  return lazy protocol witness table accessor for type DefaultIndices<GenericArguments2> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<GenericArguments2> and conformance <> DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<GenericArguments2>, (void (*)(void))lazy protocol witness table accessor for type GenericArguments2 and conformance GenericArguments2);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in GenericArguments2()
{
  return lazy protocol witness table accessor for type DefaultIndices<GenericArguments2> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<GenericArguments2> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<GenericArguments2>, (void (*)(void))lazy protocol witness table accessor for type GenericArguments2 and conformance GenericArguments2);
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in GenericArguments2()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance Slice<A>(&lazy protocol witness table cache variable for type DefaultIndices<GenericArguments2> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<GenericArguments2>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in GenericArguments2()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<GenericArguments2> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<GenericArguments2>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in GenericArguments2()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<GenericArguments2> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<GenericArguments2>);
}

unint64_t lazy protocol witness table accessor for type GenericArguments and conformance GenericArguments()
{
  unint64_t result = lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments;
  if (!lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments;
  if (!lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments;
  if (!lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments;
  if (!lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericArguments and conformance GenericArguments);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in GenericArguments()
{
  return lazy protocol witness table accessor for type DefaultIndices<GenericArguments2> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<GenericArguments> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<GenericArguments>, (void (*)(void))lazy protocol witness table accessor for type GenericArguments and conformance GenericArguments);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in GenericArguments()
{
  return lazy protocol witness table accessor for type DefaultIndices<GenericArguments2> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<GenericArguments> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<GenericArguments>, (void (*)(void))lazy protocol witness table accessor for type GenericArguments and conformance GenericArguments);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<GenericArguments2> and conformance <> DefaultIndices<A>(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in GenericArguments()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<GenericArguments> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<GenericArguments>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in GenericArguments()
{
  return lazy protocol witness table accessor for type Slice<Cases> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<GenericArguments> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<GenericArguments>);
}

uint64_t initializeBufferWithCopyOfBuffer for GenericArgument(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  outlined copy of GenericArgument(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t outlined copy of GenericArgument(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t assignWithCopy for GenericArgument(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  outlined copy of GenericArgument(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  outlined consume of GenericArgument(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for GenericArgument(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  outlined consume of GenericArgument(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for GenericArgument(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for GenericArgument(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for GenericArgument(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t destructiveInjectEnumTag for GenericArgument(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for GenericArguments2(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GenericArguments2(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GenericArguments2()
{
  return &type metadata for GenericArguments2;
}

uint64_t getEnumTagSinglePayload for GenericArguments(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GenericArguments(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GenericArguments()
{
  return &type metadata for GenericArguments;
}

uint64_t specialized BidirectionalCollection.distance(from:to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 - a1;
  BOOL v3 = a2 < a1;
  if (a2 > a1)
  {
    uint64_t result = 0;
    unint64_t v6 = ~a1 + a2;
    while (v6 <= 0x7FFFFFFFFFFFFFFELL)
    {
      if (v4 == ++result) {
        return result;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t result = 0;
  if (v3)
  {
    uint64_t v7 = ~a2 + a1;
    while ((v7 & 0x8000000000000000) == 0)
    {
      if (v4 == --result) {
        return result;
      }
    }
    goto LABEL_13;
  }
  return result;
}

uint64_t specialized BidirectionalCollection.index(_:offsetBy:)(uint64_t a1, uint64_t a2)
{
  return a2 + a1;
}

uint64_t specialized BidirectionalCollection.index(_:offsetBy:limitedBy:)(uint64_t result, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    unint64_t v3 = result - a3;
    if (result - a3 >= ~a2) {
      unint64_t v3 = ~a2;
    }
    unint64_t v4 = v3 + 1;
    if (v4 > 0x20)
    {
      uint64_t v10 = v4 & 0x1F;
      if ((v4 & 0x1F) == 0) {
        uint64_t v10 = 32;
      }
      unint64_t v11 = v4 - v10;
      int64_t v5 = -(uint64_t)v11;
      result -= v11;
      do
        v11 -= 32;
      while (v11);
    }
    else
    {
      int64_t v5 = 0;
    }
    while (a3 != result)
    {
      --v5;
      --result;
      if (v5 <= (uint64_t)a2) {
        return result;
      }
    }
    return 0;
  }
  if (a2)
  {
    if (result == a3) {
      return 0;
    }
    uint64_t v6 = result + 1;
    unint64_t v7 = a2 - 2;
    if (a2 < 2) {
      return ++result;
    }
    if (~result + a3 < v7) {
      unint64_t v7 = ~result + a3;
    }
    unint64_t v8 = v7 + 1;
    if (v8 >= 0x21)
    {
      uint64_t v12 = v8 & 0x1F;
      if ((v8 & 0x1F) == 0) {
        uint64_t v12 = 32;
      }
      unint64_t v13 = v8 - v12;
      uint64_t v9 = v13 + 1;
      v6 += v13;
      do
        v13 -= 32;
      while (v13);
    }
    else
    {
      uint64_t v9 = 1;
    }
    unint64_t v14 = a2 - v9;
    uint64_t result = v6;
    while (a3 != result)
    {
      ++result;
      if (!--v14) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

unint64_t static KeyPath.create(for:)(uint64_t a1, unint64_t *a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  *(_DWORD *)(v4 + 24) = -2147483644;
  LODWORD(result) = Field.offset.getter(a1, a2);
  if (*a2 - 2048 >= 0xFFFFFFFFFFFFF801)
  {
    if (*a2)
    {
LABEL_7:
      int v7 = result | 0x1000000;
LABEL_10:
      *(_DWORD *)(v4 + 32) = v7;
      return v4;
    }
LABEL_9:
    int v7 = result | 0x3000000;
    goto LABEL_10;
  }
  uint64_t v6 = *(unsigned int *)(ClassMetadata.descriptor.getter() + 40);
  unint64_t result = ClassMetadata.descriptor.getter();
  if ((unint64_t)(a1 - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
    goto LABEL_12;
  }
  unint64_t result = a2[v6 + a1];
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!HIDWORD(result))
  {
    if (*a2 <= 0x7FF && *a2) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
LABEL_13:
  __break(1u);
  return result;
}

unint64_t static KeyPath.createOptional(for:wrap:)(uint64_t a1, unint64_t *a2, char a3)
{
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v6;
  *(void *)(v6 + 16) = 0;
  if (a3) {
    int v8 = -2147483612;
  }
  else {
    int v8 = -2147483628;
  }
  *(_DWORD *)(v6 + 24) = v8;
  *(_DWORD *)(v6 + 32) = 0x4000000;
  *(void *)(v6 + 40) = a2;
  LODWORD(result) = Field.offset.getter(a1, a2);
  if (*a2 - 2048 >= 0xFFFFFFFFFFFFF801)
  {
    if (*a2)
    {
LABEL_10:
      int v11 = result | 0x1000000;
LABEL_13:
      *(_DWORD *)(v7 + 48) = v11;
      *(void *)(v7 + 56) = Field.type.getter(a1, a2);
      *(_DWORD *)(v7 + 64) = 67108865;
      return v7;
    }
LABEL_12:
    int v11 = result | 0x3000000;
    goto LABEL_13;
  }
  uint64_t v10 = *(unsigned int *)(ClassMetadata.descriptor.getter() + 40);
  unint64_t result = ClassMetadata.descriptor.getter();
  if ((unint64_t)(a1 - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t result = a2[v10 + a1];
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (!HIDWORD(result))
  {
    if (*a2 <= 0x7FF && *a2) {
      goto LABEL_10;
    }
    goto LABEL_12;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t _typesThatConform(to:)(unint64_t *a1)
{
  unint64_t v1 = *a1;
  unint64_t v2 = static Metadata.Kind.existential.getter();
  if (v1 > 0x7FF)
  {
    if (v2 - 2048 >= 0xFFFFFFFFFFFFF801) {
      return 0;
    }
  }
  else if (v2 >= 0x800)
  {
    if (v1) {
      return 0;
    }
  }
  else if (v1 != v2)
  {
    return 0;
  }
  ExistentialMetadata.init(_:)();
  unint64_t v3 = (void *)ExistentialMetadata.protocols.getter();
  if (v4 == 1)
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
    MEMORY[0x270FA5388](*v3);
    _withConformanceCache(for:do:)();
    return v6;
  }
  return 0;
}

uint64_t partial apply for closure #1 in _typesThatConform(to:)(uint64_t a1)
{
  **(void **)(v1 + 16) = a1;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRelease();
}

uint64_t PartialType.hasParameterPacks.getter(_DWORD *a1)
{
  if ((*a1 & 0x80) == 0) {
    return 0;
  }
  uint64_t v2 = 11;
  if ((*a1 & 0x1Fu) - 17 < 2) {
    uint64_t v2 = 7;
  }
  return HIWORD(a1[v2 + 3]) & 1;
}

uint64_t PartialType.isGeneric.getter(unsigned __int8 *a1)
{
  return *a1 >> 7;
}

uint64_t PartialType.name.getter()
{
  return String.init(cString:)();
}

uint64_t PartialType.create()(_DWORD *a1)
{
  return PartialType._create(with:)(0, 0, a1);
}

uint64_t PartialType._create(with:)(void *a1, uint64_t a2, _DWORD *a3)
{
  if ((*a3 & 0x80) == 0)
  {
    if (!a2)
    {
LABEL_3:
      swift_getKeyPath();
      uint64_t v4 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      swift_getAtKeyPath();
      swift_release();
      return ((uint64_t (*)(void))((char *)a3 + v4 + v13))(0);
    }
    return 0;
  }
  if ((*a3 & 0x1Fu) - 17 >= 2) {
    uint64_t v6 = 11;
  }
  else {
    uint64_t v6 = 7;
  }
  uint64_t v7 = &a3[v6];
  int v8 = (unsigned __int16 *)&a3[v6 + 2];
  uint64_t v9 = LOWORD(a3[v6 + 2]);
  if (!LOWORD(a3[v6 + 2]))
  {
    if (!a2 && (*((_WORD *)v7 + 7) & 1) == 0) {
      goto LABEL_3;
    }
    return 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = v6 * 4 + 16;
  while ((*((char *)a3 + v11) & 0x80000000) == 0 || !__OFADD__(v10++, 1))
  {
    ++v11;
    if (!--v9) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_14:
  if (v10 != a2 || (*((_WORD *)v7 + 7) & 1) != 0) {
    return 0;
  }
  if (a2 < 1) {
    goto LABEL_3;
  }
  if (*((_WORD *)v7 + 5))
  {
    return PartialType._createRequirements(with:_:)(a1, a2, v8, (uint64_t)a3);
  }
  else
  {
    return PartialType._createNoRequirements(with:)(a1, a2, (uint64_t)a3);
  }
}

uint64_t PartialType.create(with:)(uint64_t a1, _DWORD *a2)
{
  return PartialType._create(with:)((void *)(a1 + 32), *(void *)(a1 + 16), a2);
}

uint64_t PartialType._createNoRequirements(with:)(void *a1, uint64_t a2, uint64_t a3)
{
  switch(a2)
  {
    case 3:
      swift_getKeyPath();
      uint64_t v7 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      swift_getAtKeyPath();
      swift_release();
      return ((uint64_t (*)(void, void, void, void))(a3 + v7 + v10))(0, *a1, a1[1], a1[2]);
    case 2:
      swift_getKeyPath();
      uint64_t v8 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      swift_getAtKeyPath();
      swift_release();
      return ((uint64_t (*)(void, void, void))(a3 + v8 + v10))(0, *a1, a1[1]);
    case 1:
      swift_getKeyPath();
      uint64_t v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      swift_getAtKeyPath();
      swift_release();
      return ((uint64_t (*)(void, void))(a3 + v5 + v10))(0, *a1);
    default:
      swift_getKeyPath();
      uint64_t v9 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      swift_getAtKeyPath();
      swift_release();
      return ((uint64_t (*)(void, void *))(a3 + v9 + v10))(0, a1);
  }
}

uint64_t PartialType._createRequirements(with:_:)(const void *a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4)
{
  uint64_t v6 = (char *)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  uint64_t v7 = a3[1];
  if (a3[1])
  {
    uint64_t v8 = (char *)a3 + (-*a3 & 3) + *a3 + 8;
    while (2)
    {
      switch(*(_DWORD *)v8 & 0x1F)
      {
        case 0:
          uint64_t v9 = GenericSignature.RequirementDescriptor.checkProtocolConformance(in:with:)();
          if (!v9) {
            goto LABEL_22;
          }
          if ((*v8 & 0x80) != 0)
          {
            uint64_t v10 = v9;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v6 + 2) + 1, 1, v6);
            }
            unint64_t v12 = *((void *)v6 + 2);
            unint64_t v11 = *((void *)v6 + 3);
            if (v12 >= v11 >> 1) {
              uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1, v6);
            }
            *((void *)v6 + 2) = v12 + 1;
            *(void *)&v6[8 * v12 + 32] = v10;
          }
LABEL_4:
          v8 += 12;
          if (--v7) {
            continue;
          }
          goto LABEL_17;
        case 1:
          if (GenericSignature.RequirementDescriptor.checkSameType(in:with:)()) {
            goto LABEL_4;
          }
          goto LABEL_22;
        case 2:
          if ((GenericSignature.RequirementDescriptor.checkBaseClass(in:with:)() & 1) == 0) {
            goto LABEL_22;
          }
          goto LABEL_4;
        case 3:
          goto LABEL_4;
        case 0x1F:
          if ((GenericSignature.RequirementDescriptor.checkLayout(in:with:)() & 1) == 0) {
            goto LABEL_22;
          }
          goto LABEL_4;
        default:
LABEL_22:
          swift_bridgeObjectRelease();
          return 0;
      }
    }
  }
LABEL_17:
  uint64_t v13 = *((void *)v6 + 2);
  if (v13 == 3)
  {
    swift_getKeyPath();
    uint64_t v17 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_getAtKeyPath();
    swift_release();
    unint64_t v18 = *((void *)v6 + 2);
    if (v18)
    {
      if (v18 != 1)
      {
        if (v18 >= 3)
        {
          uint64_t v15 = ((uint64_t (*)(void, void, void, void))(a4 + v17 + v23))(0, *((void *)v6 + 4), *((void *)v6 + 5), *((void *)v6 + 6));
          goto LABEL_30;
        }
        goto LABEL_36;
      }
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v13 == 2)
  {
    swift_getKeyPath();
    uint64_t v19 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_getAtKeyPath();
    swift_release();
    uint64_t v20 = *((void *)v6 + 2);
    if (v20)
    {
      if (v20 != 1)
      {
        uint64_t v15 = ((uint64_t (*)(void, void, void))(a4 + v19 + v23))(0, *((void *)v6 + 4), *((void *)v6 + 5));
        goto LABEL_30;
      }
LABEL_38:
      __break(1u);
      JUMPOUT(0x25AD27BA0);
    }
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v13 != 1)
  {
    swift_getKeyPath();
    uint64_t v21 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_getAtKeyPath();
    swift_release();
    swift_bridgeObjectRetain();
    uint64_t v16 = ((uint64_t (*)(void, char *))(a4 + v21 + v23))(0, v6 + 32);
    swift_bridgeObjectRelease_n();
    return v16;
  }
  swift_getKeyPath();
  uint64_t v14 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  if (!*((void *)v6 + 2))
  {
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v15 = ((uint64_t (*)(void, void))(a4 + v14 + v23))(0, *((void *)v6 + 4));
LABEL_30:
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  return v16;
}

BOOL static PartialType.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PartialType(void *a1, void *a2)
{
  return *a1 == *a2;
}

void PartialType.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int PartialType.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PartialType()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance PartialType()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PartialType()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t Type.partial.getter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 > 0x7FF) {
    return TypeMetadata.descriptor.getter();
  }
  if ((unint64_t)(v1 - 512) < 3 || v1 == 0) {
    return TypeMetadata.descriptor.getter();
  }
  else {
    return 0;
  }
}

unint64_t lazy protocol witness table accessor for type PartialType and conformance PartialType()
{
  unint64_t result = lazy protocol witness table cache variable for type PartialType and conformance PartialType;
  if (!lazy protocol witness table cache variable for type PartialType and conformance PartialType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PartialType and conformance PartialType);
  }
  return result;
}

ValueMetadata *type metadata accessor for PartialType()
{
  return &type metadata for PartialType;
}

BOOL Type.isEnum.getter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 > 0x7FF)
  {
    uint64_t v1 = 0;
  }
  else if (v1 == 513)
  {
    return 1;
  }
  return v1 == 514;
}

uint64_t Type.init(_:)(void *a1)
{
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  uint64_t DynamicType = swift_getDynamicType();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return DynamicType;
}

BOOL Type.isTuple.getter(unint64_t *a1)
{
  unint64_t v1 = *a1;
  unint64_t v2 = static Metadata.Kind.tuple.getter();
  if (v2 >= 0x800) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = v2;
  }
  if (v1 >= 0x800) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = v1;
  }
  return v4 == v3;
}

BOOL static Type.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL Type.isClass.getter(void *a1)
{
  return (unint64_t)(*a1 - 2048) < 0xFFFFFFFFFFFFF801;
}

BOOL Type.isStruct.getter(void *a1)
{
  return *a1 == 512;
}

BOOL Type.isExistential.getter(unint64_t *a1)
{
  unint64_t v1 = *a1;
  unint64_t v2 = static Metadata.Kind.existential.getter();
  if (v2 >= 0x800) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = v2;
  }
  if (v1 >= 0x800) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = v1;
  }
  return v4 == v3;
}

uint64_t Type.superclass.getter(void *a1)
{
  if ((unint64_t)(*a1 - 2048) > 0xFFFFFFFFFFFFF800) {
    return 0;
  }
  else {
    return MEMORY[0x270F5BF10]();
  }
}

void Type.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int Type.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

uint64_t Type.description.getter()
{
  return _typeName(_:qualified:)();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Type()
{
  return _typeName(_:qualified:)();
}

uint64_t EnumMetadata.descriptor.getter()
{
  return MEMORY[0x270F5BEF0]();
}

uint64_t TypeMetadata.descriptor.getter()
{
  return MEMORY[0x270F5BEF8]();
}

uint64_t TypeMetadata._resolve(_:)()
{
  return MEMORY[0x270F5BF00]();
}

uint64_t ClassMetadata.descriptor.getter()
{
  return MEMORY[0x270F5BF08]();
}

uint64_t TupleMetadata.Elements.endIndex.getter()
{
  return MEMORY[0x270F5BF30]();
}

uint64_t TupleMetadata.Elements.subscript.getter()
{
  return MEMORY[0x270F5BF38]();
}

uint64_t TupleMetadata.init(_:)()
{
  return MEMORY[0x270F5BF40]();
}

uint64_t StructMetadata.descriptor.getter()
{
  return MEMORY[0x270F5BF48]();
}

uint64_t TypeDescriptor.genericSignature.getter()
{
  return MEMORY[0x270F5BF50]();
}

uint64_t ClassDescriptor.genericArgumentOffset.getter()
{
  return MEMORY[0x270F5BF58]();
}

uint64_t FieldDescriptor.Element.referenceOwnership.getter()
{
  return MEMORY[0x270F5BF60]();
}

uint64_t FieldDescriptor.subscript.getter()
{
  return MEMORY[0x270F5BF68]();
}

uint64_t GenericSignature.packShapes.getter()
{
  return MEMORY[0x270F5BF70]();
}

uint64_t GenericSignature.packShapeHeader.getter()
{
  return MEMORY[0x270F5BF78]();
}

uint64_t GenericSignature.RequirementDescriptor.checkLayout(in:with:)()
{
  return MEMORY[0x270F5BF80]();
}

uint64_t GenericSignature.RequirementDescriptor.checkSameType(in:with:)()
{
  return MEMORY[0x270F5BF88]();
}

uint64_t GenericSignature.RequirementDescriptor.checkBaseClass(in:with:)()
{
  return MEMORY[0x270F5BF90]();
}

uint64_t GenericSignature.RequirementDescriptor.checkProtocolConformance(in:with:)()
{
  return MEMORY[0x270F5BF98]();
}

uint64_t ValueWitnessTable.initializeWithCopy(_:_:)()
{
  return MEMORY[0x270F5BFA0]();
}

uint64_t ValueWitnessTable.initializeWithTake(_:_:)()
{
  return MEMORY[0x270F5BFA8]();
}

uint64_t ExistentialMetadata.protocols.getter()
{
  return MEMORY[0x270F5BFB0]();
}

uint64_t ExistentialMetadata.init(_:)()
{
  return MEMORY[0x270F5BFB8]();
}

uint64_t MangledTypeReference.standardSubstitution.getter()
{
  return MEMORY[0x270F5BFC0]();
}

uint64_t EnumValueWitnessTable.destructiveProjectEnumData(_:)()
{
  return MEMORY[0x270F5BFC8]();
}

uint64_t EnumValueWitnessTable.getEnumTag(_:)()
{
  return MEMORY[0x270F5BFD0]();
}

uint64_t _withConformanceCache(for:do:)()
{
  return MEMORY[0x270F5BFD8]();
}

uint64_t static Metadata.Kind.existential.getter()
{
  return MEMORY[0x270F5BFE0]();
}

uint64_t static Metadata.Kind.tuple.getter()
{
  return MEMORY[0x270F5BFE8]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t dispatch thunk of AnyKeyPath._storedInlineOffset.getter()
{
  return MEMORY[0x270F9E698]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
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

uint64_t type metadata accessor for KeyPath()
{
  return MEMORY[0x270F9FDD0]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

uint64_t _swift_instantiateCheckedGenericMetadata()
{
  return MEMORY[0x270FA0148]();
}

void free(void *a1)
{
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateMetadataPack()
{
  return MEMORY[0x270FA01B0]();
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

uint64_t swift_deallocBox()
{
  return MEMORY[0x270FA0220]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_isOptionalType()
{
  return MEMORY[0x270FA04A0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}