uint64_t type metadata accessor for PluginSubtask()
{
  uint64_t result;

  result = type metadata singleton initialization cache for PluginSubtask;
  if (!type metadata singleton initialization cache for PluginSubtask) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t *initializeBufferWithCopyOfBuffer for PluginSubtask(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for SubtaskName();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
    uint64_t v10 = *(int *)(a3 + 24);
    size_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for ComputationState();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  return a1;
}

uint64_t destroy for PluginSubtask(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + *(int *)(a2 + 20));
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = type metadata accessor for ComputationState();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t initializeWithCopy for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  long long v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for ComputationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

uint64_t assignWithCopy for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ComputationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *unint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t initializeWithTake for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = type metadata accessor for ComputationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + v7);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for ComputationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000028E8);
}

uint64_t sub_1000028E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubtaskName();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for ComputationState();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100002A2C);
}

uint64_t sub_100002A2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SubtaskName();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for ComputationState();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata completion function for PluginSubtask()
{
  uint64_t result = type metadata accessor for SubtaskName();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ComputationState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TrialAssetError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TrialAssetError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance TrialAssetError()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TrialAssetError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance TrialAssetError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance TrialAssetError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance TrialAssetError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance TrialAssetError()
{
  return Error._getEmbeddedNSError()();
}

void one-time initialization function for recipeKey()
{
  static TrialAssetManager.recipeKey = 0x657069636572;
  *(void *)algn_10000C9D8 = 0xE600000000000000;
}

void TrialAssetManager.readTrialIdentifier()(void *a1@<X0>, void (*a2)(char *, void (*)(char *, uint64_t, uint64_t))@<X1>, uint64_t a3@<X8>)
{
  uint64_t v63 = a3;
  v67 = a2;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  v61 = (char *)&v60 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v64 = (char *)&v60 - v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v60 - v13;
  uint64_t v15 = Logging.defaultLogger.unsafeMutableAddressor();
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v65 = v15;
  v66 = v16;
  ((void (*)(char *))v16)(v14);
  v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v62 = v5 + 16;
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Reading Trial identifier", v19, 2u);
    swift_slowDealloc();
  }

  v22 = *(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v5 + 8);
  uint64_t v20 = v5 + 8;
  v21 = v22;
  v22(v14, (void (*)(char *, uint64_t, uint64_t))v4);
  NSString v23 = String._bridgeToObjectiveC()();
  id v24 = [a1 backgroundMLTaskIdentifiersWithNamespaceName:v23];

  if (v24)
  {
    id v25 = [v24 treatmentId];
    uint64_t v62 = v20;
    if (v25)
    {
      v26 = v25;
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v29 = v28;
    }
    else
    {
      uint64_t v27 = 0;
      unint64_t v29 = 0;
    }
    id v34 = [v24 factorPackId];
    if (v34)
    {
      v35 = v34;
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v38 = v37;

      if (v29)
      {
        v67 = v21;
LABEL_15:
        swift_bridgeObjectRelease();
LABEL_16:
        id v39 = [v24 bmltTaskId];
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        swift_bridgeObjectRetain();
        LODWORD(v69) = [v24 deploymentId];
        dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v40 = v27;
        TrialIdentifier.init(task:treatment:deployment:)();
        v41 = v64;
        v66(v64, v65, v4);
        id v42 = v24;
        swift_bridgeObjectRetain();
        v43 = (void (*)(char *, uint64_t, uint64_t))v4;
        id v44 = v42;
        v45 = Logger.logObject.getter();
        os_log_type_t v46 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v45, v46))
        {
          uint64_t v47 = swift_slowAlloc();
          uint64_t v65 = swift_slowAlloc();
          uint64_t v69 = v65;
          *(_DWORD *)uint64_t v47 = 136315650;
          id v48 = [v44 bmltTaskId];
          v66 = v43;
          id v49 = v48;
          uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v63 = v40;
          unint64_t v52 = v51;

          uint64_t v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v52, &v69);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          *(_WORD *)(v47 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, v29, &v69);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v47 + 22) = 1024;
          LODWORD(v52) = [v44 deploymentId];

          LODWORD(v68) = v52;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          _os_log_impl((void *)&_mh_execute_header, v45, v46, "Trial info - task: %s treatment: %s deployment: %d", (uint8_t *)v47, 0x1Cu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v53 = v64;
          v54 = v66;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v53 = v41;
          v54 = v43;
        }
        v67(v53, v54);
        return;
      }
      if (v38)
      {
        v67 = v21;
        uint64_t v27 = v36;
        unint64_t v29 = v38;
        goto LABEL_16;
      }
    }
    else if (v29)
    {
      v67 = v21;
      goto LABEL_15;
    }
    v55 = v61;
    v66(v61, v65, v4);
    v56 = Logger.logObject.getter();
    os_log_type_t v57 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v58 = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "Both the treatmentId and factorPackId were nil", v58, 2u);
      swift_slowDealloc();
    }

    v21(v55, (void (*)(char *, uint64_t, uint64_t))v4);
    lazy protocol witness table accessor for type TrialAssetError and conformance TrialAssetError();
    swift_allocError();
    unsigned char *v59 = 8;
    swift_willThrow();
  }
  else
  {
    v66(v8, v65, v4);
    v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Not enrolled in any background ML task for the given namespace", v32, 2u);
      swift_slowDealloc();
    }

    v21(v8, (void (*)(char *, uint64_t, uint64_t))v4);
    lazy protocol witness table accessor for type TrialAssetError and conformance TrialAssetError();
    swift_allocError();
    unsigned char *v33 = 7;
    swift_willThrow();
  }
}

unint64_t lazy protocol witness table accessor for type TrialAssetError and conformance TrialAssetError()
{
  unint64_t result = lazy protocol witness table cache variable for type TrialAssetError and conformance TrialAssetError;
  if (!lazy protocol witness table cache variable for type TrialAssetError and conformance TrialAssetError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialAssetError and conformance TrialAssetError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TrialAssetError and conformance TrialAssetError;
  if (!lazy protocol witness table cache variable for type TrialAssetError and conformance TrialAssetError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialAssetError and conformance TrialAssetError);
  }
  return result;
}

Swift::OpaquePointer_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TrialAssetManager.readTrialPluginRecipe()()
{
  unint64_t v3 = v2;
  uint64_t v94 = v1;
  uint64_t v4 = v0;
  uint64_t v86 = type metadata accessor for URL.DirectoryHint();
  uint64_t v84 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  v82 = (char *)&v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v6 - 8);
  v81 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = type metadata accessor for URL();
  uint64_t v83 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v9 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  v88 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v90 = (char *)&v79 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v80 = (char *)&v79 - v17;
  __chkstk_darwin(v16);
  v19 = (char *)&v79 - v18;
  uint64_t v20 = Logging.defaultLogger.unsafeMutableAddressor();
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v92 = v20;
  v93 = v21;
  uint64_t v95 = v10;
  ((void (*)(char *))v21)(v19);
  v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v22, v23))
  {
    id v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Reading Trial config", v24, 2u);
    swift_slowDealloc();
  }
  v91 = v9;

  uint64_t v27 = *(void (**)(void, void))(v11 + 8);
  id v25 = (char *)(v11 + 8);
  v26 = (void (*)(char *, uint64_t))v27;
  v27(v19, v95);
  if (one-time initialization token for recipeKey != -1) {
    swift_once();
  }
  NSString v28 = String._bridgeToObjectiveC()();
  NSString v29 = String._bridgeToObjectiveC()();
  unint64_t v30 = v3;
  os_log_type_t v31 = (char *)[v4 levelForFactor:v28 withNamespaceName:v29];

  if (v31)
  {
    v32 = v4;
    unint64_t v33 = v30;
    v90 = v31;
    id v34 = [v31 fileValue];
    if (!v34)
    {
      __break(1u);
      goto LABEL_28;
    }
    uint64_t v36 = v34;
    id v37 = [v34 path];

    unint64_t v38 = v91;
    v89 = v26;
    if (v37)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v39 = v83;
      uint64_t v40 = v85;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v83 + 56))(v81, 1, 1, v85);
      (*(void (**)(char *, void, uint64_t))(v84 + 104))(v82, enum case for URL.DirectoryHint.inferFromPath(_:), v86);
      URL.init(filePath:directoryHint:relativeTo:)();
      uint64_t v41 = v87;
      uint64_t v42 = Data.init(contentsOf:options:)();
      if (v41)
      {
        (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v40);
        id v44 = v88;
      }
      else
      {
        uint64_t v70 = v42;
        unint64_t v71 = v43;
        v72 = v25;
        (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v40);
        v73 = self;
        Class isa = Data._bridgeToObjectiveC()().super.isa;
        v97[0] = 0;
        id v75 = [v73 JSONObjectWithData:isa options:0 error:v97];

        id v44 = v88;
        if (v75)
        {
          id v76 = v97[0];
          _bridgeAnyObjectToAny(_:)();
          outlined consume of Data._Representation(v70, v71);

          swift_unknownObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Swift.AnyObject]);
          if (swift_dynamicCast()) {
            id v34 = (id)v96;
          }
          else {
            id v34 = 0;
          }
          goto LABEL_28;
        }
        id v78 = v97[0];
        _convertNSErrorToError(_:)();

        swift_willThrow();
        outlined consume of Data._Representation(v70, v71);
        id v25 = v72;
      }
      v93(v44, v92, v95);
      swift_errorRetain();
      swift_errorRetain();
      v45 = Logger.logObject.getter();
      os_log_type_t v46 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = swift_slowAlloc();
        v91 = v25;
        id v48 = (uint8_t *)v47;
        id v49 = (void *)swift_slowAlloc();
        *(_DWORD *)id v48 = 138412290;
        swift_errorRetain();
        uint64_t v50 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v97[0] = v50;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v49 = v50;
        unint64_t v51 = v89;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "TrialRecipe: Failed to retrieve the recipe. Error: %@.", v48, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        unint64_t v51 = v89;
      }

      v51(v44, v95);
      lazy protocol witness table accessor for type TrialAssetError and conformance TrialAssetError();
      swift_allocError();
      *uint64_t v69 = 6;
      swift_willThrow();

      id v34 = (id)swift_errorRelease();
    }
    else
    {
      v91 = v25;
      uint64_t v62 = v80;
      v93(v80, v92, v95);
      id v63 = v32;
      swift_bridgeObjectRetain_n();
      id v64 = v63;
      uint64_t v65 = Logger.logObject.getter();
      os_log_type_t v66 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v65, v66))
      {
        v67 = (uint8_t *)swift_slowAlloc();
        v97[0] = (id)swift_slowAlloc();
        *(_DWORD *)v67 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v96 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v94, v33, (uint64_t *)v97);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v65, v66, "Config recipe path not found in %s namespace", v67, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v89(v62, v95);
      lazy protocol witness table accessor for type TrialAssetError and conformance TrialAssetError();
      swift_allocError();
      unsigned char *v77 = 4;
      swift_willThrow();
    }
  }
  else
  {
    v91 = v25;
    unint64_t v52 = v90;
    v93(v90, v92, v95);
    id v53 = v4;
    swift_bridgeObjectRetain_n();
    id v54 = v53;
    v55 = Logger.logObject.getter();
    os_log_type_t v56 = static os_log_type_t.error.getter();
    unint64_t v57 = v30;
    if (os_log_type_enabled(v55, v56))
    {
      os_log_type_t v58 = v56;
      uint64_t v59 = swift_slowAlloc();
      v97[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v59 = 136315394;
      v89 = v26;
      uint64_t v60 = static TrialAssetManager.recipeKey;
      unint64_t v61 = *(void *)algn_10000C9D8;
      swift_bridgeObjectRetain();
      uint64_t v96 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v60, v61, (uint64_t *)v97);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v96 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v94, v57, (uint64_t *)v97);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v55, v58, "Trial factor %s not found in %s namespace", (uint8_t *)v59, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v89(v90, v95);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v26(v52, v95);
    }
    lazy protocol witness table accessor for type TrialAssetError and conformance TrialAssetError();
    swift_allocError();
    *uint64_t v68 = 5;
    id v34 = (id)swift_willThrow();
  }
LABEL_28:
  result.value._rawValue = v34;
  result.is_nil = v35;
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TrialAssetError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TrialAssetError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x100004380);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for TrialAssetError(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for TrialAssetError(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrialAssetError()
{
  return &type metadata for TrialAssetError;
}

uint64_t destroy for TrialAssetManager(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for TrialAssetManager(void *a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TrialAssetManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TrialAssetManager(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialAssetManager(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TrialAssetManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrialAssetManager()
{
  return &type metadata for TrialAssetManager;
}

uint64_t one-time initialization function for defaultLogger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logging.defaultLogger);
  __swift_project_value_buffer(v0, (uint64_t)static Logging.defaultLogger);
  return Logger.init(subsystem:category:)();
}

uint64_t Logging.defaultLogger.unsafeMutableAddressor()
{
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v0, (uint64_t)static Logging.defaultLogger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for Plugin()
{
  uint64_t result = type metadata singleton initialization cache for Plugin;
  if (!type metadata singleton initialization cache for Plugin) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void Plugin.readTrialConfig(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a2;
  uint64_t v5 = type metadata accessor for ConfigManager();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)static Logging.defaultLogger);
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Plugin refreshing Trial assets", v12, 2u);
    swift_slowDealloc();
  }

  uint64_t v13 = self;
  id v14 = objc_msgSend(v13, "mlr_clientWithMLRTask:", a3);
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v13, "mlr_namespaceNameWithMLRTask:", a3);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v26 = a1;
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      id v18 = v15;
      v19 = (void *)TrialAssetManager.init(trialClient:trialNamespace:)();
      v21 = v20;
      TrialAssetManager.readTrialPluginRecipe()();
      if (v22)
      {

        swift_bridgeObjectRelease();
      }
      else
      {
        ConfigManager.init(recipe:)();
        TrialAssetManager.readTrialIdentifier()(v19, v21, v27);
        swift_bridgeObjectRelease();

        (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v26, v8, v5);
      }
    }
    else
    {
      lazy protocol witness table accessor for type PluginError and conformance PluginError();
      swift_allocError();
      *id v24 = 0xD000000000000015;
      v24[1] = 0x8000000100007590;
      swift_willThrow();
    }
  }
  else
  {
    lazy protocol witness table accessor for type PluginError and conformance PluginError();
    swift_allocError();
    *os_log_type_t v23 = 0xD000000000000018;
    v23[1] = 0x8000000100007570;
    swift_willThrow();
  }
}

id Plugin.perform(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for TrialIdentifier();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v43 = (uint64_t)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ConfigManager();
  uint64_t v39 = *(void *)(v7 - 8);
  uint64_t v40 = v7;
  __chkstk_darwin(v7);
  uint64_t v42 = (uint64_t)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [a1 parameters];
  id v10 = [v9 dictionaryRepresentation];

  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)static Logging.defaultLogger);
  swift_bridgeObjectRetain();
  uint64_t v41 = v12;
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    Swift::Bool v35 = a1;
    id v16 = (uint8_t *)v15;
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v37 = v5;
    v45 = v17;
    uint64_t v36 = v1;
    *(_DWORD *)id v16 = 136315138;
    v34[1] = v16 + 4;
    swift_bridgeObjectRetain();
    uint64_t v38 = v4;
    uint64_t v18 = Dictionary.description.getter();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v44 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v20, (uint64_t *)&v45);
    uint64_t v2 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Parameters: %s", v16, 0xCu);
    uint64_t v4 = v38;
    swift_arrayDestroy();
    uint64_t v5 = v37;
    swift_slowDealloc();
    a1 = v35;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v22 = v42;
  uint64_t v21 = v43;
  Plugin.readTrialConfig(_:)(v42, v43, (uint64_t)a1);
  if (v2)
  {
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 138412290;
      swift_errorRetain();
      uint64_t v27 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v45 = v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v26 = v27;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Unable to read trial config %@", v25, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    v45 = &_swiftEmptyDictionarySingleton;
    specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(&_swiftEmptyArrayStorage, 1, &v45);
    specialized _dictionaryUpCast<A, B, C, D>(_:)((uint64_t)v45);
    swift_release();
    id v31 = objc_allocWithZone((Class)MLRTaskResult);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v30 = [v31 initWithJSONResult:isa unprivatizedVector:0];

    swift_errorRelease();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v21, v4);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v22, v40);
    v45 = &_swiftEmptyDictionarySingleton;
    specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(&_swiftEmptyArrayStorage, 1, &v45);
    specialized _dictionaryUpCast<A, B, C, D>(_:)((uint64_t)v45);
    swift_release();
    id v28 = objc_allocWithZone((Class)MLRTaskResult);
    Class v29 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v30 = [v28 initWithJSONResult:v29 unprivatizedVector:0];
  }
  return v30;
}

unint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  id v10 = (char *)&type metadata for Any + 8;
  uint64_t v11 = &type metadata for String;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          outlined consume of [String : String].Iterator._Variant();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    os_log_type_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    outlined init with take of Any(v6, v7);
    outlined init with take of Any(v7, v40);
    outlined init with take of Any(v40, &v38);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      id v16 = v10;
      uint64_t v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v17 = v35;
      v17[1] = v36;
      id v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
      unint64_t result = (unint64_t)outlined init with take of Any(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)outlined init with take of Any(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

Swift::Void __swiftcall Plugin.stop()()
{
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logging.defaultLogger);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "ProactiveShareSheetDataHarvestingLighthousePlugin was signaled to Stop", v3, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  SynchronizedExecutionManager.stop()();
  swift_endAccess();
}

id Plugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(void *a1, char a2, void *a3)
{
  uint64_t v3 = a1[2];
  if (!v3) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = a1[7];
  uint64_t v46 = a1[6];
  swift_bridgeObjectRetain();
  id v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(v7, v6);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      specialized _NativeDictionary.copy()();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    unint64_t v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    int64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    *int64_t v20 = v7;
    v20[1] = v6;
    unint64_t v21 = (void *)(v19[7] + 16 * v11);
    *unint64_t v21 = v46;
    v21[1] = v8;
    uint64_t v22 = v19[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v24;
    uint64_t v25 = v3 - 1;
    if (v3 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (int64_t i = a1 + 11; ; i += 4)
    {
      uint64_t v28 = *(i - 3);
      uint64_t v27 = *(i - 2);
      uint64_t v29 = *(i - 1);
      uint64_t v30 = *i;
      int64_t v31 = (void *)*a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v32 = specialized __RawDictionaryStorage.find<A>(_:)(v28, v27);
      uint64_t v34 = v31[2];
      BOOL v35 = (v33 & 1) == 0;
      BOOL v23 = __OFADD__(v34, v35);
      uint64_t v36 = v34 + v35;
      if (v23) {
        break;
      }
      char v37 = v33;
      if (v31[3] < v36)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v36, 1);
        unint64_t v32 = specialized __RawDictionaryStorage.find<A>(_:)(v28, v27);
        if ((v37 & 1) != (v38 & 1)) {
          goto LABEL_25;
        }
      }
      if (v37) {
        goto LABEL_10;
      }
      uint64_t v39 = (void *)*a3;
      *(void *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      uint64_t v40 = (uint64_t *)(v39[6] + 16 * v32);
      *uint64_t v40 = v28;
      v40[1] = v27;
      uint64_t v41 = (void *)(v39[7] + 16 * v32);
      void *v41 = v29;
      v41[1] = v30;
      uint64_t v42 = v39[2];
      BOOL v23 = __OFADD__(v42, 1);
      uint64_t v43 = v42 + 1;
      if (v23) {
        goto LABEL_24;
      }
      v39[2] = v43;
      if (!--v25) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v14, a2 & 1);
  unint64_t v16 = specialized __RawDictionaryStorage.find<A>(_:)(v7, v6);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    swift_allocError();
    swift_willThrow();
    swift_errorRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v44._object = (void *)0x8000000100007530;
  v44._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v44);
  _print_unlocked<A, B>(_:_:)();
  v45._countAndFlagsBits = 39;
  v45._object = (void *)0xE100000000000000;
  String.append(_:)(v45);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

uint64_t ObjC metadata update function for Plugin()
{
  return type metadata accessor for Plugin();
}

uint64_t type metadata completion function for Plugin()
{
  uint64_t result = type metadata accessor for SynchronizedExecutionManager();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for PluginError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PluginError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PluginError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for PluginError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PluginError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PluginError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t getEnumTag for PluginError()
{
  return 0;
}

ValueMetadata *type metadata accessor for PluginError()
{
  return &type metadata for PluginError;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

void *specialized _NativeDictionary.copy()()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    __n128 result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  __n128 result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    __n128 result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    int64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    BOOL v23 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    __n128 result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  char v42 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    BOOL v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    void *v19 = v34;
    v19[1] = v33;
    int64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *int64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
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
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t lazy protocol witness table accessor for type PluginError and conformance PluginError()
{
  unint64_t result = lazy protocol witness table cache variable for type PluginError and conformance PluginError;
  if (!lazy protocol witness table cache variable for type PluginError and conformance PluginError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PluginError and conformance PluginError);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for SubtaskName()
{
  return type metadata accessor for SubtaskName();
}

uint64_t ConfigManager.init(recipe:)()
{
  return ConfigManager.init(recipe:)();
}

uint64_t type metadata accessor for ConfigManager()
{
  return type metadata accessor for ConfigManager();
}

uint64_t TrialIdentifier.init(task:treatment:deployment:)()
{
  return TrialIdentifier.init(task:treatment:deployment:)();
}

uint64_t type metadata accessor for TrialIdentifier()
{
  return type metadata accessor for TrialIdentifier();
}

uint64_t type metadata accessor for ComputationState()
{
  return type metadata accessor for ComputationState();
}

Swift::Void __swiftcall SynchronizedExecutionManager.stop()()
{
}

uint64_t SynchronizedExecutionManager.init()()
{
  return SynchronizedExecutionManager.init()();
}

uint64_t type metadata accessor for SynchronizedExecutionManager()
{
  return type metadata accessor for SynchronizedExecutionManager();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}