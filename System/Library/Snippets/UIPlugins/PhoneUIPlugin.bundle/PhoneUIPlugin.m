unint64_t PhoneUIPlugin.view(for:data:mode:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  char v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22[12];
  void __src[9];
  void *v24[12];
  unsigned char __dst[80];
  uint64_t v26;

  v5 = v4;
  v26 = a3;
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once();
  }
  v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriPhoneUI);
  swift_bridgeObjectRetain_n();
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v22[0] = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v22);
    OUTLINED_FUNCTION_1();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v10, v11, "#PhoneUIPlugin creating view for id=%s", v12, 0xCu);
    swift_arrayDestroy();
    v5 = v4;
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v22[0] = (uint64_t)&type metadata for PhoneContactHeader;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PhoneContactHeader.Type);
  if (String.init<A>(describing:)() == a1 && v13 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      lazy protocol witness table accessor for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error();
      v5 = swift_allocError();
      swift_willThrow();
      goto LABEL_14;
    }
  }
  outlined copy of Data._Representation(v26, a4);
  lazy protocol witness table accessor for type PhoneContactHeader and conformance PhoneContactHeader();
  lazy protocol witness table accessor for type PhoneContactHeader and conformance PhoneContactHeader();
  CustomCanvasModel<>.init(serializedData:)();
  if (!v5)
  {
    memcpy(__dst, __src, 0x41uLL);
    PhoneContactHeader.view.getter();
    outlined release of PhoneContactHeader((uint64_t)__dst);
    memcpy(v22, v24, 0x59uLL);
    lazy protocol witness table accessor for type ContactHeaderView and conformance ContactHeaderView();
    a2 = View.eraseToAnyView()();
    outlined release of ContactHeaderView(v24);
    return a2;
  }
LABEL_14:
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  v16 = Logger.logObject.getter();
  v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v22[0] = swift_slowAlloc();
    *(_DWORD *)v18 = 136315394;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v22);
    OUTLINED_FUNCTION_1();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    a2 = v18 + 14;
    __src[0] = v5;
    swift_errorRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v19 = String.init<A>(describing:)();
    __src[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v16, v17, "#PhoneUIPlugin failed to create view component for id=%s: %s.", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_willThrow();
  return a2;
}

uint64_t static PhoneUIPlugin.Error.__derived_enum_equals(_:_:)()
{
  return 1;
}

void PhoneUIPlugin.Error.hash(into:)()
{
}

Swift::Int PhoneUIPlugin.Error.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PhoneUIPlugin.Error()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance PhoneUIPlugin.Error()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance PhoneUIPlugin.Error()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance PhoneUIPlugin.Error()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance PhoneUIPlugin.Error()
{
  return Error._getEmbeddedNSError()();
}

uint64_t PhoneUIPlugin.deinit()
{
  return v0;
}

uint64_t PhoneUIPlugin.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t PhoneUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t protocol witness for SnippetUIPlugin.init() in conformance PhoneUIPlugin@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhoneUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

unint64_t protocol witness for SnippetUIPlugin.view(for:data:mode:) in conformance PhoneUIPlugin(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  return PhoneUIPlugin.view(for:data:mode:)(a1, a2, a3, a4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

unint64_t lazy protocol witness table accessor for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error()
{
  unint64_t result = lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error;
  if (!lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error;
  if (!lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneUIPlugin.Error and conformance PhoneUIPlugin.Error);
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
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)_StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
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

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
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
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

unint64_t lazy protocol witness table accessor for type PhoneContactHeader and conformance PhoneContactHeader()
{
  unint64_t result = lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader;
  if (!lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader;
  if (!lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneContactHeader and conformance PhoneContactHeader);
  }
  return result;
}

uint64_t outlined release of PhoneContactHeader(uint64_t a1)
{
  return a1;
}

unint64_t lazy protocol witness table accessor for type ContactHeaderView and conformance ContactHeaderView()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactHeaderView and conformance ContactHeaderView;
  if (!lazy protocol witness table cache variable for type ContactHeaderView and conformance ContactHeaderView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactHeaderView and conformance ContactHeaderView);
  }
  return result;
}

void **outlined release of ContactHeaderView(void **a1)
{
  uint64_t v2 = *a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t type metadata accessor for PhoneUIPlugin()
{
  return self;
}

uint64_t getEnumTagSinglePayload for PhoneUIPlugin.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for PhoneUIPlugin.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x5308);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for PhoneUIPlugin.Error()
{
  return 0;
}

ValueMetadata *type metadata accessor for PhoneUIPlugin.Error()
{
  return &type metadata for PhoneUIPlugin.Error;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
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

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_slowDealloc();
}

uint64_t Logger.siriPhoneUI.unsafeMutableAddressor()
{
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v0, (uint64_t)static Logger.siriPhoneUI);
}

uint64_t one-time initialization function for siriPhoneUI()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.siriPhoneUI);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriPhoneUI);
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

void *LogConst.subsystem.unsafeMutableAddressor()
{
  return &static LogConst.subsystem;
}

uint64_t *LogConst.Category.siriPhoneUI.unsafeMutableAddressor()
{
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once();
  }
  return &static LogConst.Category.siriPhoneUI;
}

uint64_t static Logger.siriPhoneUI.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.siriPhoneUI);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t Logger.logAndCrash(_:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v34 = a6;
  int v35 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Logger?);
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  v14 = &v28[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  v16 = &v28[-v15];
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v18 + 16))(v16, v7, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v17);
  outlined init with copy of Logger?((uint64_t)v16, (uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v17) == 1)
  {
    outlined destroy of Logger?((uint64_t)v14);
  }
  else
  {
    swift_bridgeObjectRetain_n();
    v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    int v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v32 = a3;
      uint64_t v23 = v22;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v37 = v31;
      *(_DWORD *)uint64_t v23 = 136315650;
      uint64_t v33 = a4;
      uint64_t v24 = StaticString.description.getter();
      os_log_t v30 = v19;
      uint64_t v36 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v37);
      int v29 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2048;
      uint64_t v36 = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v23 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v36 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      os_log_t v26 = v30;
      _os_log_impl(&dword_0, v30, (os_log_type_t)v29, "FatalError at %s:%lu - %s", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(unsigned char *, uint64_t))(v18 + 8))(v14, v17);
  }
  static SiriKitLifecycle._logCrashToEventBus(_:)();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t static LogConst.subsystem.getter()
{
  return 0xD000000000000014;
}

void one-time initialization function for siriPhoneUI()
{
  static LogConst.Category.siriPhoneUI = 0x6E6F685069726953;
  unk_C490 = 0xEB00000000495565;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t outlined init with copy of Logger?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Logger?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t outlined destroy of Logger?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Logger?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static LogConst.Category.siriPhoneUI.getter()
{
  if (one-time initialization token for siriPhoneUI != -1) {
    swift_once();
  }
  uint64_t v0 = static LogConst.Category.siriPhoneUI;
  swift_bridgeObjectRetain();
  return v0;
}

ValueMetadata *type metadata accessor for LogConst()
{
  return &type metadata for LogConst;
}

ValueMetadata *type metadata accessor for LogConst.Category()
{
  return &type metadata for LogConst.Category;
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

uint64_t PhoneUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SingleResultCallHistoryView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v110 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SingleResultCallHistoryModel();
  uint64_t v8 = OUTLINED_FUNCTION_7(v7);
  __chkstk_darwin(v8);
  OUTLINED_FUNCTION_2();
  uint64_t v137 = v9;
  OUTLINED_FUNCTION_5();
  __chkstk_darwin(v10);
  OUTLINED_FUNCTION_6();
  uint64_t v138 = v11;
  OUTLINED_FUNCTION_4();
  uint64_t v123 = type metadata accessor for SingleResultVoicemailView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v12);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(v13);
  uint64_t v14 = type metadata accessor for SingleResultVoicemailModel();
  uint64_t v15 = OUTLINED_FUNCTION_7(v14);
  __chkstk_darwin(v15);
  OUTLINED_FUNCTION_2();
  uint64_t v122 = v16;
  OUTLINED_FUNCTION_5();
  __chkstk_darwin(v17);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(v18);
  uint64_t v136 = type metadata accessor for ShowPlayVoicemailListView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v19);
  OUTLINED_FUNCTION_1_0();
  uint64_t v135 = v20;
  OUTLINED_FUNCTION_4();
  uint64_t v21 = type metadata accessor for PlayVoicemailModel();
  uint64_t v22 = OUTLINED_FUNCTION_7(v21);
  __chkstk_darwin(v22);
  OUTLINED_FUNCTION_2();
  uint64_t v133 = v23;
  OUTLINED_FUNCTION_5();
  __chkstk_darwin(v24);
  OUTLINED_FUNCTION_6();
  uint64_t v134 = v25;
  OUTLINED_FUNCTION_4();
  uint64_t v121 = type metadata accessor for ShowCallHistoryListView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v26);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(v27);
  uint64_t v28 = type metadata accessor for SearchCallHistoryModel();
  uint64_t v29 = OUTLINED_FUNCTION_7(v28);
  __chkstk_darwin(v29);
  OUTLINED_FUNCTION_2();
  uint64_t v120 = v30;
  OUTLINED_FUNCTION_5();
  __chkstk_darwin(v31);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(v32);
  uint64_t v132 = type metadata accessor for ContactConfirmationView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v33);
  OUTLINED_FUNCTION_1_0();
  uint64_t v131 = v34;
  OUTLINED_FUNCTION_4();
  uint64_t v35 = type metadata accessor for ContactConfirmationModel();
  uint64_t v36 = OUTLINED_FUNCTION_7(v35);
  __chkstk_darwin(v36);
  OUTLINED_FUNCTION_2();
  uint64_t v129 = v37;
  OUTLINED_FUNCTION_5();
  __chkstk_darwin(v38);
  OUTLINED_FUNCTION_6();
  uint64_t v130 = v39;
  OUTLINED_FUNCTION_4();
  uint64_t v119 = type metadata accessor for StackedButtonsView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v40);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(v41);
  uint64_t v128 = type metadata accessor for LocalEmergencyCallDisambiguationView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v42);
  OUTLINED_FUNCTION_1_0();
  uint64_t v127 = v43;
  OUTLINED_FUNCTION_4();
  uint64_t v44 = type metadata accessor for LocalEmergencyCallDisambiguationModel();
  uint64_t v45 = OUTLINED_FUNCTION_7(v44);
  __chkstk_darwin(v45);
  OUTLINED_FUNCTION_2();
  uint64_t v125 = v46;
  OUTLINED_FUNCTION_5();
  __chkstk_darwin(v47);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(v48);
  uint64_t v126 = type metadata accessor for ForeignEmergencyCallDisambiguationView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v49);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(v50);
  uint64_t v51 = type metadata accessor for ForeignEmergencyCallDisambiguationModel();
  uint64_t v52 = OUTLINED_FUNCTION_7(v51);
  __chkstk_darwin(v52);
  OUTLINED_FUNCTION_2();
  uint64_t v124 = v53;
  OUTLINED_FUNCTION_5();
  __chkstk_darwin(v54);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(v55);
  uint64_t v117 = type metadata accessor for EmergencyCountdownView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v56);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(v57);
  uint64_t v58 = type metadata accessor for EmergencyCountdownModel();
  uint64_t v59 = OUTLINED_FUNCTION_7(v58);
  __chkstk_darwin(v59);
  OUTLINED_FUNCTION_2();
  uint64_t v116 = v60;
  OUTLINED_FUNCTION_5();
  __chkstk_darwin(v61);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(v62);
  uint64_t v114 = type metadata accessor for AppDisambiguationView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v63);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(v64);
  uint64_t v115 = type metadata accessor for AppDisambiguationViewSMART();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v65);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(v66);
  uint64_t v142 = type metadata accessor for YesNoConfirmationView();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v67);
  OUTLINED_FUNCTION_1_0();
  uint64_t v141 = v68;
  OUTLINED_FUNCTION_4();
  uint64_t v69 = type metadata accessor for YesNoConfirmationModel();
  uint64_t v70 = OUTLINED_FUNCTION_7(v69);
  __chkstk_darwin(v70);
  OUTLINED_FUNCTION_2();
  uint64_t v140 = v71;
  OUTLINED_FUNCTION_5();
  __chkstk_darwin(v72);
  OUTLINED_FUNCTION_6();
  uint64_t v139 = v73;
  OUTLINED_FUNCTION_4();
  v146[0] = type metadata accessor for PhoneSnippetDataModels();
  OUTLINED_FUNCTION_0_0();
  __chkstk_darwin(v74);
  OUTLINED_FUNCTION_2();
  uint64_t v144 = v75;
  OUTLINED_FUNCTION_5();
  uint64_t v77 = __chkstk_darwin(v76);
  v79 = (char *)&v110 - v78;
  __chkstk_darwin(v77);
  v81 = (char *)&v110 - v80;
  uint64_t v82 = type metadata accessor for Logger();
  uint64_t v83 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  v85 = (char *)&v110 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = Logger.phoneSnippetUI.unsafeMutableAddressor();
  v87 = *(void (**)(char *, uint64_t, uint64_t))(v83 + 16);
  uint64_t v143 = v82;
  v87(v85, v86, v82);
  uint64_t v145 = a1;
  outlined init with copy of PhoneSnippetDataModels(a1, (uint64_t)v81, (void (*)(void))&type metadata accessor for PhoneSnippetDataModels);
  v88 = Logger.logObject.getter();
  os_log_type_t v89 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v88, v89))
  {
    uint64_t v90 = swift_slowAlloc();
    v111 = v6;
    v91 = (uint8_t *)v90;
    uint64_t v92 = swift_slowAlloc();
    uint64_t v112 = v3;
    uint64_t v148 = v92;
    uint64_t v113 = v1;
    *(_DWORD *)v91 = 136315138;
    v110 = v91 + 4;
    outlined init with copy of PhoneSnippetDataModels((uint64_t)v81, (uint64_t)v79, (void (*)(void))&type metadata accessor for PhoneSnippetDataModels);
    uint64_t v93 = String.init<A>(describing:)();
    v146[1] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v93, v94, &v148);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of PhoneSnippetDataModels((uint64_t)v81, (void (*)(void))&type metadata accessor for PhoneSnippetDataModels);
    _os_log_impl(&dword_0, v88, v89, "#PhoneUIPlugin getting snippet for %s", v91, 0xCu);
    swift_arrayDestroy();
    uint64_t v3 = v112;
    swift_slowDealloc();
    uint64_t v6 = v111;
    swift_slowDealloc();
  }
  else
  {
    outlined destroy of PhoneSnippetDataModels((uint64_t)v81, (void (*)(void))&type metadata accessor for PhoneSnippetDataModels);
  }

  (*(void (**)(char *, uint64_t))(v83 + 8))(v85, v143);
  uint64_t v95 = v144;
  outlined init with copy of PhoneSnippetDataModels(v145, v144, (void (*)(void))&type metadata accessor for PhoneSnippetDataModels);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      if (static RFFeatureFlags.ResponseFramework.SMART.getter())
      {
        OUTLINED_FUNCTION_10();
        AppDisambiguationViewSMART.init(model:)();
        lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type AppDisambiguationViewSMART and conformance AppDisambiguationViewSMART, (void (*)(uint64_t))&type metadata accessor for AppDisambiguationViewSMART);
        uint64_t v98 = View.eraseToAnyView()();
        v108 = &type metadata accessor for AppDisambiguationViewSMART;
      }
      else
      {
        OUTLINED_FUNCTION_10();
        AppDisambiguationView.init(model:)();
        lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type AppDisambiguationView and conformance AppDisambiguationView, (void (*)(uint64_t))&type metadata accessor for AppDisambiguationView);
        uint64_t v98 = View.eraseToAnyView()();
        v108 = &type metadata accessor for AppDisambiguationView;
      }
      v106 = v108;
      uint64_t v107 = (uint64_t)v6;
      break;
    case 2u:
      uint64_t v3 = v130;
      outlined init with take of SingleResultCallHistoryModel(v95, v130, (void (*)(void))&type metadata accessor for ContactConfirmationModel);
      outlined init with copy of PhoneSnippetDataModels(v3, v129, (void (*)(void))&type metadata accessor for ContactConfirmationModel);
      uint64_t v100 = v131;
      ContactConfirmationView.init(confirmationModel:)();
      lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type ContactConfirmationView and conformance ContactConfirmationView, (void (*)(uint64_t))&type metadata accessor for ContactConfirmationView);
      uint64_t v98 = View.eraseToAnyView()();
      outlined destroy of PhoneSnippetDataModels(v100, (void (*)(void))&type metadata accessor for ContactConfirmationView);
      v101 = &type metadata accessor for ContactConfirmationModel;
      goto LABEL_18;
    case 3u:
      OUTLINED_FUNCTION_11(v95, (void (*)(void))&type metadata accessor for EmergencyCountdownModel, (uint64_t)&v140);
      OUTLINED_FUNCTION_9(v3, (void (*)(void))&type metadata accessor for EmergencyCountdownModel, (uint64_t)&v139);
      OUTLINED_FUNCTION_8();
      EmergencyCountdownView.init(model:)();
      lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type EmergencyCountdownView and conformance EmergencyCountdownView, (void (*)(uint64_t))&type metadata accessor for EmergencyCountdownView);
      uint64_t v98 = View.eraseToAnyView()();
      outlined destroy of PhoneSnippetDataModels((uint64_t)v85, (void (*)(void))&type metadata accessor for EmergencyCountdownView);
      v101 = &type metadata accessor for EmergencyCountdownModel;
      goto LABEL_18;
    case 4u:
      OUTLINED_FUNCTION_11(v95, (void (*)(void))&type metadata accessor for ForeignEmergencyCallDisambiguationModel, (uint64_t)&v150);
      OUTLINED_FUNCTION_9(v3, (void (*)(void))&type metadata accessor for ForeignEmergencyCallDisambiguationModel, (uint64_t)&v149);
      OUTLINED_FUNCTION_8();
      ForeignEmergencyCallDisambiguationView.init(model:)();
      lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type ForeignEmergencyCallDisambiguationView and conformance ForeignEmergencyCallDisambiguationView, (void (*)(uint64_t))&type metadata accessor for ForeignEmergencyCallDisambiguationView);
      uint64_t v98 = View.eraseToAnyView()();
      outlined destroy of PhoneSnippetDataModels((uint64_t)v85, (void (*)(void))&type metadata accessor for ForeignEmergencyCallDisambiguationView);
      v101 = &type metadata accessor for ForeignEmergencyCallDisambiguationModel;
      goto LABEL_18;
    case 5u:
      OUTLINED_FUNCTION_11(v95, (void (*)(void))&type metadata accessor for LocalEmergencyCallDisambiguationModel, (uint64_t)&v152);
      OUTLINED_FUNCTION_9(v3, (void (*)(void))&type metadata accessor for LocalEmergencyCallDisambiguationModel, (uint64_t)&v151);
      uint64_t v102 = v127;
      LocalEmergencyCallDisambiguationView.init(model:)();
      lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type LocalEmergencyCallDisambiguationView and conformance LocalEmergencyCallDisambiguationView, (void (*)(uint64_t))&type metadata accessor for LocalEmergencyCallDisambiguationView);
      uint64_t v98 = View.eraseToAnyView()();
      outlined destroy of PhoneSnippetDataModels(v102, (void (*)(void))&type metadata accessor for LocalEmergencyCallDisambiguationView);
      v101 = &type metadata accessor for LocalEmergencyCallDisambiguationModel;
      goto LABEL_18;
    case 6u:
      uint64_t v97 = v118;
      StackedButtonsView.init(model:)();
      lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type StackedButtonsView and conformance StackedButtonsView, (void (*)(uint64_t))&type metadata accessor for StackedButtonsView);
      uint64_t v98 = View.eraseToAnyView()();
      v99 = &type metadata accessor for StackedButtonsView;
      goto LABEL_15;
    case 8u:
      OUTLINED_FUNCTION_11(v95, (void (*)(void))&type metadata accessor for SearchCallHistoryModel, (uint64_t)v146);
      OUTLINED_FUNCTION_9(v3, (void (*)(void))&type metadata accessor for SearchCallHistoryModel, (uint64_t)&v145);
      OUTLINED_FUNCTION_8();
      ShowCallHistoryListView.init(model:)();
      lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type ShowCallHistoryListView and conformance ShowCallHistoryListView, (void (*)(uint64_t))&type metadata accessor for ShowCallHistoryListView);
      uint64_t v98 = View.eraseToAnyView()();
      outlined destroy of PhoneSnippetDataModels((uint64_t)v85, (void (*)(void))&type metadata accessor for ShowCallHistoryListView);
      v101 = &type metadata accessor for SearchCallHistoryModel;
      goto LABEL_18;
    case 9u:
      uint64_t v3 = v134;
      outlined init with take of SingleResultCallHistoryModel(v95, v134, (void (*)(void))&type metadata accessor for PlayVoicemailModel);
      outlined init with copy of PhoneSnippetDataModels(v3, v133, (void (*)(void))&type metadata accessor for PlayVoicemailModel);
      uint64_t v103 = v135;
      ShowPlayVoicemailListView.init(model:)();
      lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type ShowPlayVoicemailListView and conformance ShowPlayVoicemailListView, (void (*)(uint64_t))&type metadata accessor for ShowPlayVoicemailListView);
      uint64_t v98 = View.eraseToAnyView()();
      outlined destroy of PhoneSnippetDataModels(v103, (void (*)(void))&type metadata accessor for ShowPlayVoicemailListView);
      v101 = &type metadata accessor for PlayVoicemailModel;
      goto LABEL_18;
    case 0xAu:
      OUTLINED_FUNCTION_11(v95, (void (*)(void))&type metadata accessor for SingleResultVoicemailModel, (uint64_t)&v148);
      OUTLINED_FUNCTION_9(v3, (void (*)(void))&type metadata accessor for SingleResultVoicemailModel, (uint64_t)&v147);
      OUTLINED_FUNCTION_8();
      SingleResultVoicemailView.init(singleVoicemailModel:)();
      lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type SingleResultVoicemailView and conformance SingleResultVoicemailView, (void (*)(uint64_t))&type metadata accessor for SingleResultVoicemailView);
      uint64_t v98 = View.eraseToAnyView()();
      outlined destroy of PhoneSnippetDataModels((uint64_t)v85, (void (*)(void))&type metadata accessor for SingleResultVoicemailView);
      v101 = &type metadata accessor for SingleResultVoicemailModel;
LABEL_18:
      v106 = v101;
      uint64_t v107 = v3;
      break;
    case 0xBu:
      uint64_t v104 = v95;
      uint64_t v105 = v138;
      outlined init with take of SingleResultCallHistoryModel(v104, v138, (void (*)(void))&type metadata accessor for SingleResultCallHistoryModel);
      outlined init with copy of PhoneSnippetDataModels(v105, v137, (void (*)(void))&type metadata accessor for SingleResultCallHistoryModel);
      SingleResultCallHistoryView.init(singleResultCallHistoryModel:)();
      lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView, (void (*)(uint64_t))&type metadata accessor for SingleResultCallHistoryView);
      uint64_t v98 = View.eraseToAnyView()();
      outlined destroy of PhoneSnippetDataModels((uint64_t)v6, (void (*)(void))&type metadata accessor for SingleResultCallHistoryView);
      v106 = &type metadata accessor for SingleResultCallHistoryModel;
      uint64_t v107 = v105;
      break;
    default:
      uint64_t v96 = v139;
      outlined init with take of SingleResultCallHistoryModel(v95, v139, (void (*)(void))&type metadata accessor for YesNoConfirmationModel);
      outlined init with take of SingleResultCallHistoryModel(v96, v140, (void (*)(void))&type metadata accessor for YesNoConfirmationModel);
      uint64_t v97 = v141;
      YesNoConfirmationView.init(model:)();
      lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(&lazy protocol witness table cache variable for type YesNoConfirmationView and conformance YesNoConfirmationView, (void (*)(uint64_t))&type metadata accessor for YesNoConfirmationView);
      uint64_t v98 = View.eraseToAnyView()();
      v99 = &type metadata accessor for YesNoConfirmationView;
LABEL_15:
      v106 = v99;
      uint64_t v107 = v97;
      break;
  }
  outlined destroy of PhoneSnippetDataModels(v107, (void (*)(void))v106);
  return v98;
}

uint64_t protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance PhoneUIPlugin(uint64_t a1)
{
  return PhoneUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t outlined init with copy of PhoneSnippetDataModels(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t outlined init with take of SingleResultCallHistoryModel(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t outlined destroy of PhoneSnippetDataModels(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t associated type witness table accessor for SnippetProviding.SnippetPluginModelType : SnippetPluginModel in PhoneUIPlugin()
{
  return lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView((unint64_t *)&lazy protocol witness table cache variable for type PhoneSnippetDataModels and conformance PhoneSnippetDataModels, (void (*)(uint64_t))&type metadata accessor for PhoneSnippetDataModels);
}

uint64_t lazy protocol witness table accessor for type SingleResultCallHistoryView and conformance SingleResultCallHistoryView(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_3@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a3 - 256);
  return outlined init with copy of PhoneSnippetDataModels(a1, v4, a2);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a3 - 256);
  return outlined init with take of SingleResultCallHistoryModel(a1, v4, a2);
}

uint64_t static RFFeatureFlags.ResponseFramework.SMART.getter()
{
  return static RFFeatureFlags.ResponseFramework.SMART.getter();
}

uint64_t static SiriKitLifecycle._logCrashToEventBus(_:)()
{
  return static SiriKitLifecycle._logCrashToEventBus(_:)();
}

uint64_t PhoneContactHeader.view.getter()
{
  return PhoneContactHeader.view.getter();
}

uint64_t type metadata accessor for PhoneSnippetDataModels()
{
  return type metadata accessor for PhoneSnippetDataModels();
}

uint64_t CustomCanvasModel<>.init(serializedData:)()
{
  return CustomCanvasModel<>.init(serializedData:)();
}

uint64_t type metadata accessor for PlayVoicemailModel()
{
  return type metadata accessor for PlayVoicemailModel();
}

uint64_t StackedButtonsView.init(model:)()
{
  return StackedButtonsView.init(model:)();
}

uint64_t type metadata accessor for StackedButtonsView()
{
  return type metadata accessor for StackedButtonsView();
}

uint64_t AppDisambiguationView.init(model:)()
{
  return AppDisambiguationView.init(model:)();
}

uint64_t type metadata accessor for AppDisambiguationView()
{
  return type metadata accessor for AppDisambiguationView();
}

uint64_t YesNoConfirmationView.init(model:)()
{
  return YesNoConfirmationView.init(model:)();
}

uint64_t type metadata accessor for YesNoConfirmationView()
{
  return type metadata accessor for YesNoConfirmationView();
}

uint64_t EmergencyCountdownView.init(model:)()
{
  return EmergencyCountdownView.init(model:)();
}

uint64_t type metadata accessor for EmergencyCountdownView()
{
  return type metadata accessor for EmergencyCountdownView();
}

uint64_t type metadata accessor for SearchCallHistoryModel()
{
  return type metadata accessor for SearchCallHistoryModel();
}

uint64_t type metadata accessor for YesNoConfirmationModel()
{
  return type metadata accessor for YesNoConfirmationModel();
}

uint64_t ContactConfirmationView.init(confirmationModel:)()
{
  return ContactConfirmationView.init(confirmationModel:)();
}

uint64_t type metadata accessor for ContactConfirmationView()
{
  return type metadata accessor for ContactConfirmationView();
}

uint64_t type metadata accessor for EmergencyCountdownModel()
{
  return type metadata accessor for EmergencyCountdownModel();
}

uint64_t ShowCallHistoryListView.init(model:)()
{
  return ShowCallHistoryListView.init(model:)();
}

uint64_t type metadata accessor for ShowCallHistoryListView()
{
  return type metadata accessor for ShowCallHistoryListView();
}

uint64_t type metadata accessor for ContactConfirmationModel()
{
  return type metadata accessor for ContactConfirmationModel();
}

uint64_t ShowPlayVoicemailListView.init(model:)()
{
  return ShowPlayVoicemailListView.init(model:)();
}

uint64_t type metadata accessor for ShowPlayVoicemailListView()
{
  return type metadata accessor for ShowPlayVoicemailListView();
}

uint64_t SingleResultVoicemailView.init(singleVoicemailModel:)()
{
  return SingleResultVoicemailView.init(singleVoicemailModel:)();
}

uint64_t type metadata accessor for SingleResultVoicemailView()
{
  return type metadata accessor for SingleResultVoicemailView();
}

uint64_t AppDisambiguationViewSMART.init(model:)()
{
  return AppDisambiguationViewSMART.init(model:)();
}

uint64_t type metadata accessor for AppDisambiguationViewSMART()
{
  return type metadata accessor for AppDisambiguationViewSMART();
}

uint64_t type metadata accessor for SingleResultVoicemailModel()
{
  return type metadata accessor for SingleResultVoicemailModel();
}

uint64_t SingleResultCallHistoryView.init(singleResultCallHistoryModel:)()
{
  return SingleResultCallHistoryView.init(singleResultCallHistoryModel:)();
}

uint64_t type metadata accessor for SingleResultCallHistoryView()
{
  return type metadata accessor for SingleResultCallHistoryView();
}

uint64_t type metadata accessor for SingleResultCallHistoryModel()
{
  return type metadata accessor for SingleResultCallHistoryModel();
}

uint64_t LocalEmergencyCallDisambiguationView.init(model:)()
{
  return LocalEmergencyCallDisambiguationView.init(model:)();
}

uint64_t type metadata accessor for LocalEmergencyCallDisambiguationView()
{
  return type metadata accessor for LocalEmergencyCallDisambiguationView();
}

uint64_t type metadata accessor for LocalEmergencyCallDisambiguationModel()
{
  return type metadata accessor for LocalEmergencyCallDisambiguationModel();
}

uint64_t ForeignEmergencyCallDisambiguationView.init(model:)()
{
  return ForeignEmergencyCallDisambiguationView.init(model:)();
}

uint64_t type metadata accessor for ForeignEmergencyCallDisambiguationView()
{
  return type metadata accessor for ForeignEmergencyCallDisambiguationView();
}

uint64_t type metadata accessor for ForeignEmergencyCallDisambiguationModel()
{
  return type metadata accessor for ForeignEmergencyCallDisambiguationModel();
}

uint64_t Logger.phoneSnippetUI.unsafeMutableAddressor()
{
  return Logger.phoneSnippetUI.unsafeMutableAddressor();
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

uint64_t View.eraseToAnyView()()
{
  return View.eraseToAnyView()();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t self
{
  return _self;
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}