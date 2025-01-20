uint64_t one-time initialization function for decoder()
{
  uint64_t result;

  type metadata accessor for JSONDecoder();
  swift_allocObject();
  result = JSONDecoder.init()();
  static PhonemeDataParser.decoder = result;
  return result;
}

uint64_t static PhonemeDataParser.parse(from:)(void *a1)
{
  uint64_t v2 = type metadata accessor for String.Encoding();
  uint64_t v3 = OUTLINED_FUNCTION_0(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_5();
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logger.siriContacts);
  id v5 = a1;
  v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    swift_slowAlloc();
    swift_slowAlloc();
    OUTLINED_FUNCTION_11(4.8149e-34);
    outlined bridged method (pb) of @objc CNContact.phonemeData.getter(v5, (SEL *)&selRef_phonemeData);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    uint64_t v8 = String.init<A>(describing:)();
    uint64_t v10 = OUTLINED_FUNCTION_6(v8, v9);
    OUTLINED_FUNCTION_1(v10);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10(&dword_25C66B000, v11, v12, "[PhonemeDataParser] phonemeData: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {
  }
  outlined bridged method (pb) of @objc CNContact.phonemeData.getter(v5, (SEL *)&selRef_phonemeData);
  if (v13
    && (static String.Encoding.utf8.getter(),
        uint64_t v14 = OUTLINED_FUNCTION_8(),
        unint64_t v16 = v15,
        swift_bridgeObjectRelease(),
        uint64_t v17 = OUTLINED_FUNCTION_4(),
        v18(v17),
        v16 >> 60 != 15))
  {
    v25 = CNContact.formattedFullName.getter();
    OUTLINED_FUNCTION_2(v25, v26);
    swift_bridgeObjectRelease();
    return outlined consume of Data?(v14, v16);
  }
  else
  {
    v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v20))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_7(&dword_25C66B000, v21, v22, "phonemeData string is empty");
      OUTLINED_FUNCTION_3();
    }

    uint64_t v23 = type metadata accessor for PhonemeData();
    return OUTLINED_FUNCTION_9(v23);
  }
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v25;
  void *v26;

  uint64_t v2 = type metadata accessor for String.Encoding();
  uint64_t v3 = OUTLINED_FUNCTION_0(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_5();
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logger.siriContacts);
  id v5 = a1;
  v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    swift_slowAlloc();
    swift_slowAlloc();
    OUTLINED_FUNCTION_11(4.8149e-34);
    outlined bridged method (pb) of @objc CNContact.phonemeData.getter(v5, (SEL *)&selRef_phonemeData);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    uint64_t v8 = String.init<A>(describing:)();
    uint64_t v10 = OUTLINED_FUNCTION_6(v8, v9);
    OUTLINED_FUNCTION_1(v10);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10(&dword_25C66B000, v11, v12, "[PhonemeDataParser] phonemeData: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {
  }
  outlined bridged method (pb) of @objc CNContact.phonemeData.getter(v5, (SEL *)&selRef_phonemeData);
  if (v13
    && (static String.Encoding.utf8.getter(),
        uint64_t v14 = OUTLINED_FUNCTION_8(),
        unint64_t v16 = v15,
        swift_bridgeObjectRelease(),
        uint64_t v17 = OUTLINED_FUNCTION_4(),
        v18(v17),
        v16 >> 60 != 15))
  {
    v25 = outlined bridged method (pb) of @objc CNContact.phonemeData.getter(v5, (SEL *)&selRef_fullName);
    OUTLINED_FUNCTION_2(v25, v26);
    swift_bridgeObjectRelease();
    return outlined consume of Data?(v14, v16);
  }
  else
  {
    v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v20))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_7(&dword_25C66B000, v21, v22, "[PhonemeDataParser] phonemeData string is empty");
      OUTLINED_FUNCTION_3();
    }

    uint64_t v23 = type metadata accessor for PhonemeData();
    return OUTLINED_FUNCTION_9(v23);
  }
}

uint64_t static PhonemeDataParser.decodePhonemeDataString(_:_:)@<X0>(NSObject *a1@<X2>, void *a2@<X3>, uint64_t a3@<X8>)
{
  v48 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PhonemeData?);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PhonemeData();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v47 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v41 - v12;
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v41 - v14;
  if (one-time initialization token for decoder != -1) {
    swift_once();
  }
  lazy protocol witness table accessor for type PhonemeData and conformance PhonemeData();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
  v43 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  uint64_t v44 = v8 + 32;
  v43(v15, v6, v7);
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)static Logger.siriContacts);
  swift_bridgeObjectRetain_n();
  v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  v45 = v13;
  if (v20)
  {
    uint64_t v46 = a3;
    uint64_t v21 = swift_slowAlloc();
    v41 = (uint8_t *)v17;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    v49[1] = (uint64_t)a2;
    uint64_t v50 = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    uint64_t v42 = v8;
    v49[0] = (uint64_t)v48;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    uint64_t v24 = String.init<A>(describing:)();
    v49[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v50);
    uint64_t v8 = v42;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a3 = v46;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C66B000, v18, v19, "[PhonemeDataParser] fullName: %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26118F050](v23, -1, -1);
    MEMORY[0x26118F050](v22, -1, -1);

    if (!a2) {
      goto LABEL_12;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!a2) {
      goto LABEL_12;
    }
  }
  v26._countAndFlagsBits = (uint64_t)v48;
  v26._object = a2;
  if (PhonemeData.validateChecksum(fullName:)(v26))
  {
    v27 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v28 = v45;
    v27(v45, v15, v7);
    v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.debug.getter();
    v48 = v29;
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      v49[0] = v42;
      uint64_t v46 = a3;
      *(_DWORD *)v31 = 136315138;
      v41 = v31 + 4;
      v27(v47, v28, v7);
      uint64_t v32 = String.init<A>(describing:)();
      uint64_t v50 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, v49);
      a3 = v46;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v28, v7);
      v34 = v48;
      _os_log_impl(&dword_25C66B000, v48, v30, "[PhonemeDataParser] after: %s", v31, 0xCu);
      uint64_t v35 = v42;
      swift_arrayDestroy();
      MEMORY[0x26118F050](v35, -1, -1);
      MEMORY[0x26118F050](v31, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v28, v7);
    }
    v43((char *)a3, v15, v7);
    uint64_t v39 = 0;
    return __swift_storeEnumTagSinglePayload(a3, v39, 1, v7);
  }
LABEL_12:
  v36 = Logger.logObject.getter();
  os_log_type_t v37 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_25C66B000, v36, v37, "[PhonemeDataParser] phonemeData checksum is invalid", v38, 2u);
    MEMORY[0x26118F050](v38, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
  uint64_t v39 = 1;
  return __swift_storeEnumTagSinglePayload(a3, v39, 1, v7);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSPersonNameComponentsFormatterOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = specialized OptionSet<>.init()();
  *a1 = result;
  return result;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance NSPropertyListMutabilityOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
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
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
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
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
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
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
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
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
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
    return (void *)MEMORY[0x263F8EE78];
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
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

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<IDSHelper.SearchHandle>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<FaceTimeHandles.FacetimeHandle>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, a4);
  }
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

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
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

uint64_t outlined bridged method (pb) of @objc CNContact.phonemeData.getter(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t lazy protocol witness table accessor for type PhonemeData and conformance PhonemeData()
{
  unint64_t result = lazy protocol witness table cache variable for type PhonemeData and conformance PhonemeData;
  if (!lazy protocol witness table cache variable for type PhonemeData and conformance PhonemeData)
  {
    type metadata accessor for PhonemeData();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhonemeData and conformance PhonemeData);
  }
  return result;
}

uint64_t outlined destroy of PhonemeData?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PhonemeData?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t result)
{
  *(void *)(v1 - 112) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_2(NSObject *a1, void *a2)
{
  return static PhonemeDataParser.decodePhonemeDataString(_:_:)(a1, a2, v2);
}

void OUTLINED_FUNCTION_3()
{
  JUMPOUT(0x26118F050);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, unint64_t a2)
{
  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)(v2 - 88));
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return MEMORY[0x270EF19F8](v0, 0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_11(float a1)
{
  *(void *)(v3 - 128) = v1;
  *uint64_t v2 = a1;
}

uint64_t static SiriHighlightedPropertyType.enumIdentifier.getter()
{
  swift_beginAccess();
  uint64_t v0 = static SiriHighlightedPropertyType.enumIdentifier;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static SiriHighlightedPropertyType.enumIdentifier.setter(uint64_t a1, char *a2)
{
  static SiriHighlightedPropertyType.enumIdentifier = a1;
  off_26A5BE158 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SiriHighlightedPropertyType.enumIdentifier.modify())()
{
  return static SiriHighlightedPropertyType.enumIdentifier.modify;
}

uint64_t static SiriHighlightedPropertyType.enumIdentifier.modify()
{
  return MEMORY[0x270FA02C0]();
}

SiriContactsCommon::SiriHighlightedPropertyType_optional __swiftcall SiriHighlightedPropertyType.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SiriHighlightedPropertyType.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 7;
  if (v5 < 7) {
    char v7 = v5;
  }
  *uint64_t v4 = v7;
  return result;
}

void *static SiriHighlightedPropertyType.allCases.getter()
{
  return &outlined read-only object #0 of static SiriHighlightedPropertyType.allCases.getter;
}

uint64_t SiriHighlightedPropertyType.rawValue.getter()
{
  return *(void *)&aPhonenumemaila[8 * *v0];
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SiriHighlightedPropertyType()
{
  return specialized == infix<A>(_:_:)();
}

unint64_t lazy protocol witness table accessor for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType;
  if (!lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType;
  if (!lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType;
  if (!lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType;
  if (!lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType;
  if (!lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType;
  if (!lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType;
  if (!lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType;
  if (!lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType;
  if (!lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType);
  }
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SiriHighlightedPropertyType()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SiriHighlightedPropertyType()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SiriHighlightedPropertyType(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

SiriContactsCommon::SiriHighlightedPropertyType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance SiriHighlightedPropertyType(Swift::String *a1)
{
  return SiriHighlightedPropertyType.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SiriHighlightedPropertyType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriHighlightedPropertyType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t associated type witness table accessor for RawRepresentable.RawValue : LosslessStringConvertible in SiriHighlightedPropertyType()
{
  return MEMORY[0x263F8D380];
}

unint64_t lazy protocol witness table accessor for type [SiriHighlightedPropertyType] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [SiriHighlightedPropertyType] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SiriHighlightedPropertyType] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SiriHighlightedPropertyType]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SiriHighlightedPropertyType] and conformance [A]);
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

void protocol witness for static CaseIterable.allCases.getter in conformance SiriHighlightedPropertyType(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static SiriHighlightedPropertyType.allCases.getter;
}

uint64_t protocol witness for static IntentValueTypeIdentifiable.lnValueType.getter in conformance SiriHighlightedPropertyType(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType();
  return MEMORY[0x270F0C958](a1, v2);
}

uint64_t protocol witness for IntentValue.lnValue.getter in conformance SiriHighlightedPropertyType(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType();
  return MEMORY[0x270F0C970](a1, v2);
}

uint64_t protocol witness for static IntentValue.canConvert(_:) in conformance SiriHighlightedPropertyType(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = lazy protocol witness table accessor for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType();
  return MEMORY[0x270F0CBA8](a1, a2, v4);
}

uint64_t protocol witness for static IntentValue.from(_:context:) in conformance SiriHighlightedPropertyType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType();
  return MEMORY[0x270F0C968](a1, a2, a3, v6);
}

uint64_t protocol witness for static IntentValueSequenceElement.canConvertFrom(_:) in conformance SiriHighlightedPropertyType(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = lazy protocol witness table accessor for type SiriHighlightedPropertyType and conformance SiriHighlightedPropertyType();
  return MEMORY[0x270F0CBC0](a1, a2, v4);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriHighlightedPropertyType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 6) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriHighlightedPropertyType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x25C66F490);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for SiriHighlightedPropertyType(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for SiriHighlightedPropertyType(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriHighlightedPropertyType()
{
  return &type metadata for SiriHighlightedPropertyType;
}

uint64_t specialized == infix<A>(_:_:)()
{
  OUTLINED_FUNCTION_0_0();
  BOOL v2 = v2 && v0 == v1;
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = OUTLINED_FUNCTION_1_0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  char v3;

  OUTLINED_FUNCTION_0_0();
  BOOL v2 = v2 && v0 == v1;
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = OUTLINED_FUNCTION_1_0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  char v3;

  OUTLINED_FUNCTION_0_0();
  BOOL v2 = v2 && v0 == v1;
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = OUTLINED_FUNCTION_1_0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t SiriContactsActionType.id.getter()
{
  return *(void *)&aMessage_2[8 * *v0];
}

uint64_t SiriContactsActionType.rawValue.getter()
{
  return *(void *)&aMessage_2[8 * *v0];
}

void *static SiriContactsActionType.compactCases.getter()
{
  return &outlined read-only object #0 of static SiriContactsActionType.compactCases.getter;
}

void *static SiriContactsActionType.watchCases.getter()
{
  return &outlined read-only object #0 of static SiriContactsActionType.watchCases.getter;
}

uint64_t SiriContactsActionType.isCallable.getter()
{
  uint64_t v1 = *v0;
  char v2 = 1;
  switch(v1)
  {
    case 1:
      goto LABEL_6;
    default:
      char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v3)
      {
        char v2 = 1;
      }
      else
      {
        char v2 = 1;
        switch((int)v1)
        {
          case 0:
          case 1:
          case 3:
          case 4:
            char v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
            break;
          case 2:
            break;
          default:
            JUMPOUT(0);
        }
LABEL_6:
        swift_bridgeObjectRelease();
      }
      return v2 & 1;
  }
}

SiriContactsCommon::SiriContactsActionType_optional __swiftcall SiriContactsActionType.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  unsigned int v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SiriContactsActionType.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 5;
  if (v5 < 5) {
    char v7 = v5;
  }
  *unsigned int v4 = v7;
  return result;
}

void *static SiriContactsActionType.allCases.getter()
{
  return &outlined read-only object #0 of static SiriContactsActionType.allCases.getter;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SiriContactsActionType()
{
  return specialized == infix<A>(_:_:)();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SiriContactsActionType()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SiriContactsActionType()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SiriContactsActionType(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

SiriContactsCommon::SiriContactsActionType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance SiriContactsActionType(Swift::String *a1)
{
  return SiriContactsActionType.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SiriContactsActionType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriContactsActionType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance SiriContactsActionType(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static SiriContactsActionType.allCases.getter;
}

uint64_t protocol witness for Identifiable.id.getter in conformance SiriContactsActionType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriContactsActionType.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance SiriContactsActionType()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SiriContactsActionType()
{
  return RawRepresentable<>.encode(to:)();
}

unint64_t lazy protocol witness table accessor for type SiriContactsActionType and conformance SiriContactsActionType()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType;
  if (!lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType;
  if (!lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType;
  if (!lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType;
  if (!lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [SiriContactsActionType] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [SiriContactsActionType] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SiriContactsActionType] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SiriContactsActionType]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SiriContactsActionType] and conformance [A]);
  }
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in SiriContactsActionType()
{
  return MEMORY[0x263F8D320];
}

uint64_t getEnumTagSinglePayload for SiriContactsActionType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriContactsActionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C66FC30);
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

ValueMetadata *type metadata accessor for SiriContactsActionType()
{
  return &type metadata for SiriContactsActionType;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t static IDSHelper.format(emailAddresses:phoneNumbers:)(unint64_t a1, unint64_t a2)
{
  unint64_t v3 = a1;
  uint64_t v69 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v4 = result;
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  unint64_t v50 = a2;
  if (v4)
  {
    if (v4 < 1)
    {
      __break(1u);
      goto LABEL_48;
    }
    uint64_t v6 = 0;
    BOOL v7 = (char *)MEMORY[0x263F8EE78];
    unint64_t v51 = v3 & 0xC000000000000001;
    uint64_t v52 = v4;
    unint64_t v8 = 0x2654B5000uLL;
    unint64_t v54 = v3;
    do
    {
      if (v51) {
        id v9 = (id)MEMORY[0x26118E7C0](v6, v3);
      }
      else {
        id v9 = *(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v10 = v9;
      id v11 = [v9 *(SEL *)(v8 + 3800)];
      uint64_t v12 = (void *)MEMORY[0x26118EB40]();

      if (v12)
      {
        uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v15 = v14;
      }
      else
      {
        uint64_t v13 = 0;
        unint64_t v15 = 0;
      }
      id v16 = objc_msgSend(v10, sel_label);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v56 = v19;
        uint64_t v58 = v18;
      }
      else
      {
        unint64_t v56 = 0xE000000000000000;
        uint64_t v58 = 0;
      }
      id v20 = [v10 *(SEL *)(v8 + 3800)];
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v23 = v22;

      id v24 = objc_msgSend(v10, sel_identifier);
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v27 = v26;

      if (v15) {
        uint64_t v28 = v13;
      }
      else {
        uint64_t v28 = 0;
      }
      if (v15) {
        unint64_t v29 = v15;
      }
      else {
        unint64_t v29 = 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        BOOL v7 = OUTLINED_FUNCTION_5_0();
      }
      unint64_t v31 = *((void *)v7 + 2);
      unint64_t v30 = *((void *)v7 + 3);
      if (v31 >= v30 >> 1) {
        BOOL v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v30 > 1), v31 + 1, 1, (uint64_t)v7);
      }
      *((void *)v7 + 2) = v31 + 1;
      uint64_t v32 = &v7[72 * v31];
      v32[32] = 0;
      ++v6;
      *((void *)v32 + 5) = v58;
      *((void *)v32 + 6) = v56;
      *((void *)v32 + 7) = v21;
      *((void *)v32 + 8) = v23;
      *((void *)v32 + 9) = v25;
      *((void *)v32 + 10) = v27;
      *((void *)v32 + 11) = v28;
      *((void *)v32 + 12) = v29;
      unint64_t v3 = v54;
      unint64_t v8 = 0x2654B5000;
    }
    while (v52 != v6);
  }
  else
  {
    BOOL v7 = (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  specialized Array.append<A>(contentsOf:)((uint64_t)v7);
  unint64_t v33 = v50;
  if (!(v50 >> 62))
  {
    uint64_t v34 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v34) {
      goto LABEL_30;
    }
LABEL_45:
    os_log_type_t v37 = (char *)MEMORY[0x263F8EE78];
LABEL_46:
    swift_bridgeObjectRelease();
    specialized Array.append<A>(contentsOf:)((uint64_t)v37);
    return v69;
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v34 = result;
  if (!result) {
    goto LABEL_45;
  }
LABEL_30:
  if (v34 >= 1)
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    os_log_type_t v37 = (char *)MEMORY[0x263F8EE78];
    uint64_t v49 = v34;
    do
    {
      if ((v50 & 0xC000000000000001) != 0) {
        id v38 = (id)MEMORY[0x26118E7C0](v35, v33);
      }
      else {
        id v38 = *(id *)(v33 + 8 * v35 + 32);
      }
      uint64_t v39 = v38;
      id v68 = v38;
      closure #2 in static IDSHelper.format(emailAddresses:phoneNumbers:)(&v68, v60);

      uint64_t v40 = v61;
      if (v61)
      {
        uint64_t v59 = v36;
        char v53 = v60[0];
        uint64_t v42 = v62;
        uint64_t v41 = v63;
        uint64_t v44 = v64;
        uint64_t v43 = v65;
        uint64_t v45 = v66;
        uint64_t v55 = v60[1];
        uint64_t v57 = v67;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          os_log_type_t v37 = OUTLINED_FUNCTION_5_0();
        }
        unint64_t v47 = *((void *)v37 + 2);
        unint64_t v46 = *((void *)v37 + 3);
        if (v47 >= v46 >> 1) {
          os_log_type_t v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v46 > 1), v47 + 1, 1, (uint64_t)v37);
        }
        *((void *)v37 + 2) = v47 + 1;
        v48 = &v37[72 * v47];
        v48[32] = v53 & 1;
        *((void *)v48 + 5) = v55;
        *((void *)v48 + 6) = v40;
        *((void *)v48 + 7) = v42;
        *((void *)v48 + 8) = v41;
        *((void *)v48 + 9) = v44;
        *((void *)v48 + 10) = v43;
        *((void *)v48 + 11) = v45;
        *((void *)v48 + 12) = v57;
        uint64_t v34 = v49;
        unint64_t v33 = v50;
        uint64_t v36 = v59;
      }
      ++v35;
    }
    while (v34 != v35);
    goto LABEL_46;
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return OUTLINED_FUNCTION_2_0((uint64_t)closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:));
}

uint64_t closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)()
{
  uint64_t v1 = swift_task_alloc();
  OUTLINED_FUNCTION_1_1(v1);
  int v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  *int v2 = v0;
  v2[1] = closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x270FA2318]();
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  unint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v23 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[String : Bool], Never>);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = a2[3];
  uint64_t v13 = a2[4];
  uint64_t v22 = __swift_project_boxed_opaque_existential_1(a2, v12);
  uint64_t v14 = specialized _arrayForceCast<A, B>(_:)(a3);
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v18 + v17, (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v13 + 8))(v14, v23, v24, v21, v16, v25, partial apply for closure #1 in closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:), v18, v12, v13);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
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

uint64_t static IDSHelper.makeHandleStatuses(rawResults:)(uint64_t a1)
{
  if (!a1 || (unint64_t v1 = specialized _dictionaryDownCastConditional<A, B, C, D>(_:)(a1)) == 0)
  {
    if (one-time initialization token for siriContacts != -1) {
LABEL_54:
    }
      swift_once();
    uint64_t v52 = type metadata accessor for Logger();
    __swift_project_value_buffer(v52, (uint64_t)static Logger.siriContacts);
    swift_bridgeObjectRetain();
    char v53 = Logger.logObject.getter();
    os_log_type_t v54 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      v63[0] = v56;
      *(_DWORD *)uint64_t v55 = 136315138;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000026, 0x800000025C699010, v63);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C66B000, v53, v54, "#IDSHelper makeHandleStatuses - unrecognized IDS results format: %s", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118F050](v56, -1, -1);
      MEMORY[0x26118F050](v55, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return Dictionary.init(dictionaryLiteral:)();
  }
  uint64_t v2 = v1;
  uint64_t v3 = Dictionary.init(dictionaryLiteral:)();
  specialized _NativeDictionary.makeIterator()(v2, v63);
  uint64_t v4 = v63[0];
  uint64_t v5 = v63[1];
  uint64_t v6 = v63[3];
  unint64_t v7 = v63[4];
  uint64_t v8 = v2;
  int64_t v9 = (unint64_t)(v63[2] + 64) >> 6;
  uint64_t v59 = v8;
  swift_bridgeObjectRetain();
  uint64_t v61 = v5;
  do
  {
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v6 << 6);
      }
      else
      {
        int64_t v12 = v6 + 1;
        if (__OFADD__(v6, 1))
        {
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        if (v12 >= v9) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v12);
        uint64_t v14 = v6 + 1;
        if (!v13)
        {
          uint64_t v14 = v6 + 2;
          if (v6 + 2 >= v9) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v14);
          if (!v13)
          {
            uint64_t v14 = v6 + 3;
            if (v6 + 3 >= v9) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v5 + 8 * v14);
            if (!v13)
            {
              uint64_t v14 = v6 + 4;
              if (v6 + 4 >= v9) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v5 + 8 * v14);
              if (!v13)
              {
                uint64_t v14 = v6 + 5;
                if (v6 + 5 >= v9) {
                  goto LABEL_47;
                }
                unint64_t v13 = *(void *)(v5 + 8 * v14);
                if (!v13)
                {
                  uint64_t v14 = v6 + 6;
                  if (v6 + 6 >= v9) {
                    goto LABEL_47;
                  }
                  unint64_t v13 = *(void *)(v5 + 8 * v14);
                  if (!v13)
                  {
                    int64_t v15 = v6 + 7;
                    while (v15 < v9)
                    {
                      unint64_t v13 = *(void *)(v5 + 8 * v15++);
                      if (v13)
                      {
                        uint64_t v14 = v15 - 1;
                        goto LABEL_23;
                      }
                    }
LABEL_47:
                    swift_release();
                    swift_bridgeObjectRelease();
                    return v3;
                  }
                }
              }
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        uint64_t v6 = v14;
      }
      uint64_t v16 = *(void *)(*(void *)(v4 + 56) + 8 * v11);
      if (v16 != 2) {
        break;
      }
      OUTLINED_FUNCTION_6_0();
      swift_isUniquelyReferenced_nonNull_native();
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_8_0();
      if (v19) {
        goto LABEL_53;
      }
      unint64_t v34 = v32;
      char v35 = v33;
      int v36 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Bool>);
      if (OUTLINED_FUNCTION_7_0(v36, v37, v38, v39, v40, v41, v42, v43, v58, v59, v60, v61, v62))
      {
        unint64_t v44 = specialized __RawDictionaryStorage.find<A>(_:)(v60, v5);
        if ((v35 & 1) != (v45 & 1)) {
          goto LABEL_56;
        }
        unint64_t v34 = v44;
      }
      uint64_t v3 = v62;
      if (v35)
      {
        *(unsigned char *)(*(void *)(v62 + 56) + v34) = 0;
        goto LABEL_43;
      }
      OUTLINED_FUNCTION_0_1(v62 + 8 * (v34 >> 6), v58, v59, v60);
      *(unsigned char *)(v50 + v34) = 0;
      uint64_t v51 = *(void *)(v62 + 16);
      BOOL v19 = __OFADD__(v51, 1);
      uint64_t v49 = v51 + 1;
      if (v19) {
        goto LABEL_55;
      }
LABEL_42:
      *(void *)(v3 + 16) = v49;
      swift_bridgeObjectRetain();
LABEL_43:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = v61;
    }
  }
  while (v16 != 1);
  OUTLINED_FUNCTION_6_0();
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_0();
  if (v19) {
    goto LABEL_52;
  }
  unint64_t v20 = v17;
  char v21 = v18;
  int v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Bool>);
  if (OUTLINED_FUNCTION_7_0(v22, v23, v24, v25, v26, v27, v28, v29, v58, v59, v60, v61, v62))
  {
    unint64_t v30 = specialized __RawDictionaryStorage.find<A>(_:)(v60, v5);
    if ((v21 & 1) != (v31 & 1)) {
      goto LABEL_56;
    }
    unint64_t v20 = v30;
  }
  uint64_t v3 = v62;
  if (v21)
  {
    *(unsigned char *)(*(void *)(v62 + 56) + v20) = 1;
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_0_1(v62 + 8 * (v20 >> 6), v58, v59, v60);
  *(unsigned char *)(v46 + v20) = v47;
  uint64_t v48 = *(void *)(v62 + 16);
  BOOL v19 = __OFADD__(v48, 1);
  uint64_t v49 = v48 + 1;
  if (!v19) {
    goto LABEL_42;
  }
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return OUTLINED_FUNCTION_2_0((uint64_t)closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:));
}

uint64_t closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)()
{
  uint64_t v1 = swift_task_alloc();
  OUTLINED_FUNCTION_1_1(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  *uint64_t v2 = v0;
  v2[1] = closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x270FA2318]();
}

uint64_t closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v23 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[String : Bool], Never>);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = a2[3];
  uint64_t v13 = a2[4];
  int v22 = __swift_project_boxed_opaque_existential_1(a2, v12);
  uint64_t v14 = specialized _arrayForceCast<A, B>(_:)(a3);
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v18 + v17, (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v13 + 16))(v14, v23, v24, v21, v16, v25, partial apply for closure #1 in closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:), v18, v12, v13);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, uint64_t a2, const char *a3)
{
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Logger.siriContacts);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25C66B000, v6, v7, a3, v8, 2u);
    MEMORY[0x26118F050](v8, -1, -1);
  }

  static IDSHelper.makeHandleStatuses(rawResults:)(a1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[String : Bool], Never>);
  return CheckedContinuation.resume(returning:)();
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v7, 1, v3);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = specialized UnsafeMutablePointer.initialize(from:count:)(v6 + 32, v2, v3 + 72 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v9 = *(void *)(v3 + 16);
  BOOL v10 = __OFADD__(v9, v2);
  uint64_t v11 = v9 + v2;
  if (!v10)
  {
    *(void *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void closure #2 in static IDSHelper.format(emailAddresses:phoneNumbers:)(id *a1@<X0>, void *a2@<X8>)
{
  id v3 = *a1;
  id v4 = objc_msgSend(*a1, sel_value);
  id v5 = objc_msgSend(v4, sel_stringValue);

  if (!v5)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v5 = (id)MEMORY[0x26118E540](v6);
    swift_bridgeObjectRelease();
  }
  int64_t v7 = (void *)IDSCopyIDForPhoneNumber();

  if (v7)
  {
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v26 = 0;
    unint64_t v9 = 0;
  }
  id v10 = objc_msgSend(v3, sel_label);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v14 = 0xE000000000000000;
  }
  id v15 = objc_msgSend(v3, sel_value);
  id v16 = objc_msgSend(v15, sel_stringValue);

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;

  id v20 = objc_msgSend(v3, sel_identifier);
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;

  uint64_t v24 = v26;
  if (!v9) {
    uint64_t v24 = 0;
  }
  *a2 = 1;
  a2[1] = v12;
  unint64_t v25 = 0xE000000000000000;
  if (v9) {
    unint64_t v25 = v9;
  }
  a2[2] = v14;
  a2[3] = v17;
  a2[4] = v19;
  a2[5] = v21;
  a2[6] = v23;
  a2[7] = v24;
  a2[8] = v25;
}

unint64_t specialized _dictionaryDownCastConditional<A, B, C, D>(_:)(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Int>);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  specialized _NativeDictionary.makeIterator()(a1, v29);
  uint64_t v3 = v29[0];
  int64_t v4 = v29[3];
  unint64_t v5 = v29[4];
  int64_t v22 = (unint64_t)(v29[2] + 64) >> 6;
  uint64_t v23 = v29[1];
  uint64_t v6 = &__src[40];
  unint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v8 = (v5 - 1) & v5;
  unint64_t v9 = __clz(__rbit64(v5)) | (v4 << 6);
  for (i = v4; ; unint64_t v9 = __clz(__rbit64(v12)) + (i << 6))
  {
    outlined init with copy of AnyHashable(*(void *)(v3 + 48) + 40 * v9, (uint64_t)__src);
    outlined init with copy of Any(*(void *)(v3 + 56) + 32 * v9, (uint64_t)v6);
    memcpy(__dst, __src, sizeof(__dst));
    outlined init with copy of AnyHashable((uint64_t)__dst, (uint64_t)v26);
    if (!swift_dynamicCast())
    {
      outlined destroy of (key: AnyHashable, value: Any)((uint64_t)__dst);
LABEL_32:
      swift_bridgeObjectRelease();
      outlined consume of [AnyHashable : Any].Iterator._Variant();
      swift_release();
      return 0;
    }
    outlined init with copy of Any((uint64_t)&__dst[40], (uint64_t)v26);
    outlined destroy of (key: AnyHashable, value: Any)((uint64_t)__dst);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_32;
    }
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v24, v25);
    unint64_t v14 = result;
    if (v15)
    {
      id v16 = v6;
      uint64_t v17 = (uint64_t *)(v2[6] + 16 * result);
      unint64_t result = swift_bridgeObjectRelease();
      *uint64_t v17 = v24;
      v17[1] = v25;
      uint64_t v6 = v16;
      *(void *)(v2[7] + 8 * v14) = v24;
      goto LABEL_29;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v18 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v18 = v24;
    v18[1] = v25;
    *(void *)(v2[7] + 8 * result) = v24;
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_29:
    int64_t v4 = i;
    unint64_t v5 = v8;
    if (v8) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_37;
    }
    if (v11 >= v22) {
      goto LABEL_33;
    }
    unint64_t v12 = *(void *)(v23 + 8 * v11);
    int64_t i = v4 + 1;
    if (!v12)
    {
      int64_t i = v4 + 2;
      if (v4 + 2 >= v22) {
        goto LABEL_33;
      }
      unint64_t v12 = *(void *)(v23 + 8 * i);
      if (!v12)
      {
        int64_t i = v4 + 3;
        if (v4 + 3 >= v22) {
          goto LABEL_33;
        }
        unint64_t v12 = *(void *)(v23 + 8 * i);
        if (!v12)
        {
          int64_t i = v4 + 4;
          if (v4 + 4 >= v22) {
            goto LABEL_33;
          }
          unint64_t v12 = *(void *)(v23 + 8 * i);
          if (!v12)
          {
            int64_t i = v4 + 5;
            if (v4 + 5 >= v22) {
              goto LABEL_33;
            }
            unint64_t v12 = *(void *)(v23 + 8 * i);
            if (!v12)
            {
              int64_t v13 = v4 + 6;
              while (v13 < v22)
              {
                unint64_t v12 = *(void *)(v23 + 8 * v13++);
                if (v12)
                {
                  int64_t i = v13 - 1;
                  goto LABEL_21;
                }
              }
LABEL_33:
              outlined consume of [AnyHashable : Any].Iterator._Variant();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
LABEL_21:
    uint64_t v8 = (v12 - 1) & v12;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

unint64_t protocol witness for IDSStatusProviding.currentIDStatus(forDestinations:service:listenerID:queue:completionBlock:) in conformance IDSIDQueryController(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8)
{
  return (unint64_t)@nonobjc IDSIDQueryController.currentIDStatus(forDestinations:service:listenerID:queue:completionBlock:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&block_descriptor_3, (SEL *)&selRef_currentIDStatusForDestinations_service_listenerID_queue_completionBlock_) & 1;
}

unint64_t protocol witness for IDSStatusProviding.requiredIDStatus(forDestinations:service:listenerID:queue:completionBlock:) in conformance IDSIDQueryController(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8)
{
  return (unint64_t)@nonobjc IDSIDQueryController.currentIDStatus(forDestinations:service:listenerID:queue:completionBlock:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&block_descriptor, (SEL *)&selRef_requiredIDStatusForDestinations_service_listenerID_queue_completionBlock_) & 1;
}

uint64_t dispatch thunk of IDSStatusProviding.currentIDStatus(forDestinations:service:listenerID:queue:completionBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(void))(a10 + 8))();
}

uint64_t dispatch thunk of IDSStatusProviding.requiredIDStatus(forDestinations:service:listenerID:queue:completionBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(void))(a10 + 16))();
}

id @nonobjc IDSIDQueryController.currentIDStatus(forDestinations:service:listenerID:queue:completionBlock:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  id v16 = a3;
  if (a1)
  {
    v18.super.isa = Array._bridgeToObjectiveC()().super.isa;
    if (!v16) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v18.super.isa = 0;
  if (a3) {
LABEL_3:
  }
    id v16 = (void *)MEMORY[0x26118E540](a2, v16);
LABEL_4:
  if (a5) {
    a5 = (void *)MEMORY[0x26118E540](a4, a5);
  }
  if (a7)
  {
    v21[4] = a7;
    v21[5] = a8;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 1107296256;
    v21[2] = thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?) -> ();
    v21[3] = a9;
    a7 = _Block_copy(v21);
    swift_retain();
    swift_release();
  }
  id v19 = objc_msgSend(v10, *a10, v18.super.isa, v16, a5, a6, a7);
  _Block_release(a7);

  return v19;
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

uint64_t partial apply for closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1)
{
  return partial apply for closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:));
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1)
{
  return partial apply for closure #1 in closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(a1, "#IDSHelper getAvailableHandles in remote completion block");
}

uint64_t specialized _NativeDictionary.makeIterator()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined destroy of (key: AnyHashable, value: Any)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: AnyHashable, value: Any));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t partial apply for closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1)
{
  return partial apply for closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:));
}

uint64_t partial apply for closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[String : Bool], Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1)
{
  return partial apply for closure #1 in closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(a1, "#IDSHelper getAvailableHandles in local completion block");
}

uint64_t partial apply for closure #1 in closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, const char *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[String : Bool], Never>)
                 - 8);
  return closure #1 in closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(a1, v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a2);
}

ValueMetadata *type metadata accessor for IDSHelper()
{
  return &type metadata for IDSHelper;
}

uint64_t initializeBufferWithCopyOfBuffer for IDSHelper.SearchHandle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for IDSHelper.SearchHandle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IDSHelper.SearchHandle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IDSHelper.SearchHandle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for IDSHelper.SearchHandle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IDSHelper.SearchHandle(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for IDSHelper.SearchHandle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IDSHelper.SearchHandle()
{
  return &type metadata for IDSHelper.SearchHandle;
}

void OUTLINED_FUNCTION_0_1(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a1 + 64) |= v4;
  uint64_t v8 = (void *)(*(void *)(v5 + 48) + 16 * v7);
  *uint64_t v8 = a4;
  v8[1] = v6;
}

__n128 OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  *(void *)(v2 + 64) = a1;
  __n128 result = *(__n128 *)(v2 + 24);
  long long v4 = *(_OWORD *)(v2 + 48);
  *(__n128 *)(a1 + 16) = result;
  *(void *)(a1 + 32) = v1;
  *(_OWORD *)(a1 + 40) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

unint64_t OUTLINED_FUNCTION_4_0()
{
  return specialized __RawDictionaryStorage.find<A>(_:)(v1, v0);
}

char *OUTLINED_FUNCTION_5_0()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 1, v0);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_7_0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(v13, v14);
}

uint64_t SiriContactsActionItem.bundleIdentifier.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

uint64_t SiriContactsActionItem.displayHandle.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

uint64_t SiriContactsActionItem.label.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

uint64_t SiriContactsActionItem.sanitizedHandle.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

uint64_t SiriContactsActionItem.shouldGroupByBundleIdentifier.getter()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_shouldGroupByBundleIdentifier);
}

void SiriContactsActionItem.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_type);
}

uint64_t SiriContactsActionItem.url.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of URL?(v1 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_url, a1, &demangling cache variable for type metadata for URL?);
}

uint64_t SiriContactsActionItem.id.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

id SiriContactsActionItem.__allocating_init(bundleIdentifier:displayHandle:label:sanitizedHandle:shouldGroupByBundleIdentifier:type:url:id:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8, char a9, long long a10, uint64_t a11, uint64_t a12)
{
  id v19 = objc_allocWithZone(v12);
  return SiriContactsActionItem.init(bundleIdentifier:displayHandle:label:sanitizedHandle:shouldGroupByBundleIdentifier:type:url:id:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, (char *)a10, *((uint64_t *)&a10 + 1), a11, a12);
}

id SiriContactsActionItem.init(bundleIdentifier:displayHandle:label:sanitizedHandle:shouldGroupByBundleIdentifier:type:url:id:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8, char a9, char *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  Swift::Int v14 = v13;
  uint64_t v21 = a13;
  uint64_t v22 = *a10;
  uint64_t v23 = &v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_bundleIdentifier];
  *uint64_t v23 = a1;
  v23[1] = a2;
  uint64_t v24 = &v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_displayHandle];
  *uint64_t v24 = a3;
  v24[1] = a4;
  uint64_t v25 = (uint64_t *)&v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_label];
  uint64_t *v25 = a5;
  v25[1] = (uint64_t)a6;
  uint64_t v26 = (uint64_t *)&v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_sanitizedHandle];
  uint64_t *v26 = a7;
  v26[1] = (uint64_t)a8;
  v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_shouldGroupByBundleIdentifier] = a9;
  v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_type] = v22;
  outlined init with copy of URL?(a11, (uint64_t)&v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_url], &demangling cache variable for type metadata for URL?);
  if (a13)
  {
    int v28 = v14;
  }
  else
  {
    uint64_t v39 = a1;
    uint64_t v40 = a2;
    swift_bridgeObjectRetain();
    v29._countAndFlagsBits = a5;
    v29._object = a6;
    String.append(_:)(v29);
    swift_bridgeObjectRetain();
    v30._countAndFlagsBits = a7;
    v30._object = a8;
    String.append(_:)(v30);
    char v31 = v14;
    swift_bridgeObjectRelease();
    uint64_t v32 = *(void *)&aMessage_3[8 * v22];
    char v33 = *(void **)&aNavigate_2[8 * v22 + 8];
    uint64_t v39 = a1;
    swift_bridgeObjectRetain();
    v34._countAndFlagsBits = v32;
    v34._object = v33;
    String.append(_:)(v34);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a12 = a1;
    uint64_t v21 = v40;
  }
  char v35 = &v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_id];
  *char v35 = a12;
  v35[1] = v21;

  v38.receiver = v14;
  v38.super_class = (Class)type metadata accessor for SiriContactsActionItem();
  id v36 = objc_msgSendSuper2(&v38, sel_init);
  outlined destroy of URL?(a11, &demangling cache variable for type metadata for URL?);
  return v36;
}

uint64_t type metadata accessor for SiriContactsActionItem()
{
  uint64_t result = type metadata singleton initialization cache for SiriContactsActionItem;
  if (!type metadata singleton initialization cache for SiriContactsActionItem) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SiriContactsActionItem.description.getter()
{
  _StringGuts.grow(_:)(88);
  v1._countAndFlagsBits = 540689481;
  v1._object = (void *)0xE400000000000000;
  String.append(_:)(v1);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_9_0();
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 0x203A65707954202CLL;
  v2._object = (void *)0xE800000000000000;
  String.append(_:)(v2);
  uint64_t v3 = *(char *)(v0 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_type);
  v4._countAndFlagsBits = *(void *)&aMessage_3[8 * v3];
  v4._object = *(void **)&aNavigate_2[8 * v3 + 8];
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x656C646E6148202CLL;
  v5._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v5);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_9_0();
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 0x3A6C6562614C202CLL;
  v6._object = (void *)0xE900000000000020;
  String.append(_:)(v6);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_9_0();
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0xD000000000000019;
  v7._object = (void *)0x800000025C699040;
  String.append(_:)(v7);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_shouldGroupByBundleIdentifier)) {
    uint64_t v8 = 1702195828;
  }
  else {
    uint64_t v8 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_shouldGroupByBundleIdentifier)) {
    unint64_t v9 = 0xE400000000000000;
  }
  else {
    unint64_t v9 = 0xE500000000000000;
  }
  unint64_t v10 = v9;
  String.append(_:)(*(Swift::String *)&v8);
  swift_bridgeObjectRelease();
  v11._object = (void *)0x800000025C699060;
  v11._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v11);
  uint64_t v12 = *(void *)(v0 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_sanitizedHandle);
  Swift::Bool v13 = *(void **)(v0 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_sanitizedHandle + 8);
  swift_bridgeObjectRetain();
  v14._countAndFlagsBits = v12;
  v14._object = v13;
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  return 0;
}

Swift::Int SiriContactsActionItem.hash.getter()
{
  Hasher.init()();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11_0();
  swift_bridgeObjectRelease();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  memcpy(__dst, v1, sizeof(__dst));
  return Hasher.finalize()();
}

uint64_t SiriContactsActionItem.isEqual(_:)(uint64_t a1)
{
  outlined init with copy of URL?(a1, (uint64_t)v13, &demangling cache variable for type metadata for Any?);
  if (!v14)
  {
    outlined destroy of URL?((uint64_t)v13, &demangling cache variable for type metadata for Any?);
    goto LABEL_21;
  }
  type metadata accessor for SiriContactsActionItem();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:
    char v10 = 0;
    return v10 & 1;
  }
  OUTLINED_FUNCTION_5_1(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_bundleIdentifier);
  BOOL v3 = v3 && v1 == v2;
  if (!v3 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
    || ((OUTLINED_FUNCTION_5_1(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_label), v3)
      ? (BOOL v6 = v4 == v5)
      : (BOOL v6 = 0),
        !v6 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
     || ((OUTLINED_FUNCTION_5_1(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_sanitizedHandle), v3)
       ? (BOOL v9 = v7 == v8)
       : (BOOL v9 = 0),
         !v9 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)))
  {

    goto LABEL_21;
  }
  char v10 = specialized == infix<A>(_:_:)();

  return v10 & 1;
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v4 = OUTLINED_FUNCTION_6_1();
  v5(v4);
  return a2;
}

uint64_t outlined destroy of URL?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id SiriContactsActionItem.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SiriContactsActionItem.init()()
{
}

BOOL static SiriContactsActionItem.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void SiriContactsActionItem.CodingKeys.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t SiriContactsActionItem.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000025C699120
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x4879616C70736964 && a2 == 0xED0000656C646E61;
    if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v6 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
      if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v7 = a1 == 0x657A6974696E6173 && a2 == 0xEF656C646E614864;
        if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD00000000000001DLL && a2 == 0x800000025C699160 {
               || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        }
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v8 = a1 == 1701869940 && a2 == 0xE400000000000000;
          if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v9 = a1 == 7107189 && a2 == 0xE300000000000000;
            if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 25705 && a2 == 0xE200000000000000)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if (v11) {
                return 7;
              }
              else {
                return 8;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t SiriContactsActionItem.CodingKeys.init(intValue:)()
{
  return 8;
}

Swift::Int SiriContactsActionItem.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t SiriContactsActionItem.CodingKeys.intValue.getter()
{
  return 0;
}

unint64_t SiriContactsActionItem.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4879616C70736964;
      break;
    case 2:
      unint64_t result = 0x6C6562616CLL;
      break;
    case 3:
      unint64_t result = 0x657A6974696E6173;
      break;
    case 4:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 5:
      unint64_t result = 1701869940;
      break;
    case 6:
      unint64_t result = 7107189;
      break;
    case 7:
      unint64_t result = 25705;
      break;
    default:
      return result;
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SiriContactsActionItem.CodingKeys(char *a1, char *a2)
{
  return static SiriContactsActionItem.CodingKeys.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SiriContactsActionItem.CodingKeys()
{
  return SiriContactsActionItem.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance SiriContactsActionItem.CodingKeys(uint64_t a1)
{
  SiriContactsActionItem.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SiriContactsActionItem.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance SiriContactsActionItem.CodingKeys()
{
  return SiriContactsActionItem.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SiriContactsActionItem.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SiriContactsActionItem.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance SiriContactsActionItem.CodingKeys()
{
  return SiriContactsActionItem.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SiriContactsActionItem.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = SiriContactsActionItem.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SiriContactsActionItem.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SiriContactsActionItem.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

id SiriContactsActionItem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriContactsActionItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t SiriContactsActionItem.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SiriContactsActionItem.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7_1();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  OUTLINED_FUNCTION_10_0(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_bundleIdentifier);
  OUTLINED_FUNCTION_3_1();
  if (!v1)
  {
    OUTLINED_FUNCTION_10_0(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_displayHandle);
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_10_0(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_label);
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_10_0(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_sanitizedHandle);
    OUTLINED_FUNCTION_3_1();
    KeyedEncodingContainer.encode(_:forKey:)();
    lazy protocol witness table accessor for type SiriContactsActionType and conformance SiriContactsActionType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    type metadata accessor for URL();
    lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URL and conformance URL);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    OUTLINED_FUNCTION_10_0(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_id);
    OUTLINED_FUNCTION_3_1();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t lazy protocol witness table accessor for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys);
  }
  return result;
}

id SiriContactsActionItem.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SiriContactsActionItem.init(from:)(a1);
}

id SiriContactsActionItem.init(from:)(void *a1)
{
  id v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_7_1();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SiriContactsActionItem.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys();
  char v10 = v3;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    id v12 = v10;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    type metadata accessor for SiriContactsActionItem();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v14 = (uint64_t *)&v10[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_bundleIdentifier];
    *uint64_t v14 = v11;
    v14[1] = v15;
    uint64_t v16 = OUTLINED_FUNCTION_2_1(1);
    OUTLINED_FUNCTION_14(v16, v17, OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_displayHandle);
    uint64_t v18 = OUTLINED_FUNCTION_2_1(2);
    OUTLINED_FUNCTION_14(v18, v19, OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_label);
    uint64_t v20 = OUTLINED_FUNCTION_2_1(3);
    OUTLINED_FUNCTION_14(v20, v21, OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_sanitizedHandle);
    char v28 = 4;
    v10[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_shouldGroupByBundleIdentifier] = KeyedDecodingContainer.decode(_:forKey:)() & 1;
    char v27 = 5;
    lazy protocol witness table accessor for type SiriContactsActionType and conformance SiriContactsActionType();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v10[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_type] = v28;
    type metadata accessor for URL();
    char v28 = 6;
    lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URL and conformance URL);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    outlined init with take of URL?(v8, (uint64_t)&v10[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_url]);
    uint64_t v22 = OUTLINED_FUNCTION_2_1(7);
    OUTLINED_FUNCTION_14(v22, v23, OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_id);

    v26.receiver = v10;
    v26.super_class = (Class)type metadata accessor for SiriContactsActionItem();
    id v12 = objc_msgSendSuper2(&v26, sel_init);
    uint64_t v24 = OUTLINED_FUNCTION_0_2();
    v25(v24);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v12;
}

uint64_t lazy protocol witness table accessor for type URL and conformance URL(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URL();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with take of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id protocol witness for Decodable.init(from:) in conformance SiriContactsActionItem@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = SiriContactsActionItem.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SiriContactsActionItem(void *a1)
{
  return SiriContactsActionItem.encode(to:)(a1);
}

uint64_t protocol witness for Identifiable.id.getter in conformance SiriContactsActionItem@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriContactsActionItem.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t ObjC metadata update function for SiriContactsActionItem()
{
  return type metadata accessor for SiriContactsActionItem();
}

void type metadata completion function for SiriContactsActionItem()
{
  type metadata accessor for URL?();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SiriContactsActionItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriContactsActionItem);
}

uint64_t dispatch thunk of SiriContactsActionItem.__allocating_init(bundleIdentifier:displayHandle:label:sanitizedHandle:shouldGroupByBundleIdentifier:type:url:id:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SiriContactsActionItem.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SiriContactsActionItem.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

void type metadata accessor for URL?()
{
  if (!lazy cache variable for type metadata for URL?)
  {
    type metadata accessor for URL();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for URL?);
    }
  }
}

uint64_t getEnumTagSinglePayload for SiriContactsActionItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriContactsActionItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x25C673B24);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

void *type metadata accessor for SiriContactsActionItem.CodingKeys()
{
  return &unk_2709C93A0;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_1@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5_1@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_9_0()
{
  uint64_t v3 = v0;
  uint64_t v4 = v1;
  String.append(_:)(*(Swift::String *)&v3);
}

uint64_t OUTLINED_FUNCTION_10_0@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return String.hash(into:)();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (void *)(v3 + a3);
  *uint64_t v4 = result;
  v4[1] = a2;
  return result;
}

uint64_t static DateComponents.startOfToday.getter()
{
  uint64_t v23 = type metadata accessor for Date();
  OUTLINED_FUNCTION_1_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5_2();
  uint64_t v22 = type metadata accessor for TimeZone();
  OUTLINED_FUNCTION_1_2();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_9_1();
  uint64_t v9 = type metadata accessor for Calendar.Identifier();
  OUTLINED_FUNCTION_1_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_7_1();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = type metadata accessor for Calendar();
  OUTLINED_FUNCTION_1_2();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_8_2();
  v20();
  Calendar.init(identifier:)();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
  static TimeZone.current.getter();
  Calendar.timeZone.setter();
  Calendar.timeZone.getter();
  static Date.startOfToday.getter();
  Calendar.dateComponents(in:from:)();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v23);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v22);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v0, v16);
}

uint64_t static Calendar.gregorianCurrent.getter()
{
  uint64_t v0 = type metadata accessor for TimeZone();
  uint64_t v1 = OUTLINED_FUNCTION_10_1(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_6_2();
  uint64_t v2 = type metadata accessor for Calendar.Identifier();
  OUTLINED_FUNCTION_1_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  v8();
  Calendar.init(identifier:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  static TimeZone.current.getter();
  return Calendar.timeZone.setter();
}

uint64_t static Date.startOfToday.getter()
{
  uint64_t v3 = type metadata accessor for Date();
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_2();
  uint64_t v7 = type metadata accessor for TimeZone();
  uint64_t v8 = OUTLINED_FUNCTION_10_1(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7_1();
  uint64_t v9 = type metadata accessor for Calendar.Identifier();
  OUTLINED_FUNCTION_1_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_4_2();
  uint64_t v13 = type metadata accessor for Calendar();
  OUTLINED_FUNCTION_1_2();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_8_2();
  v17();
  Calendar.init(identifier:)();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v9);
  static TimeZone.current.getter();
  Calendar.timeZone.setter();
  static Date.now.getter();
  Calendar.startOfDay(for:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v0, v13);
}

uint64_t static DateComponents.startOfTodayGMT.getter()
{
  type metadata accessor for Date();
  OUTLINED_FUNCTION_1_2();
  uint64_t v28 = v4;
  uint64_t v29 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7_1();
  uint64_t v27 = v6 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimeZone?);
  uint64_t v8 = OUTLINED_FUNCTION_10_1(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_4_2();
  uint64_t v9 = type metadata accessor for TimeZone();
  OUTLINED_FUNCTION_1_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_7_2();
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = type metadata accessor for Calendar.Identifier();
  OUTLINED_FUNCTION_1_2();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_7_1();
  uint64_t v20 = v19 - v18;
  uint64_t v26 = type metadata accessor for Calendar();
  OUTLINED_FUNCTION_1_2();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_8_2();
  v24();
  Calendar.init(identifier:)();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v14);
  static TimeZone.current.getter();
  Calendar.timeZone.setter();
  TimeZone.init(secondsFromGMT:)();
  uint64_t result = __swift_getEnumTagSinglePayload(v2, 1, v9);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v1, v2, v9);
    static Date.startOfTodayGMT.getter();
    Calendar.dateComponents(in:from:)();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v0, v26);
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t static Date.startOfTodayGMT.getter()
{
  uint64_t v2 = type metadata accessor for TimeZone();
  OUTLINED_FUNCTION_1_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5_2();
  uint64_t v6 = type metadata accessor for Date();
  OUTLINED_FUNCTION_1_2();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7_2();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v15 - v11;
  static Date.startOfToday.getter();
  Date.timeIntervalSince1970.getter();
  static TimeZone.current.getter();
  Date.init()();
  TimeZone.secondsFromGMT(for:)();
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
  v13(v1, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v2);
  Date.init(timeIntervalSince1970:)();
  return v13(v12, v6);
}

uint64_t static Calendar.gregorianCurrentGMT.getter()
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimeZone?);
  uint64_t v4 = OUTLINED_FUNCTION_10_1(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_2();
  uint64_t v5 = type metadata accessor for TimeZone();
  OUTLINED_FUNCTION_1_2();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3_2();
  uint64_t v9 = type metadata accessor for Calendar.Identifier();
  OUTLINED_FUNCTION_1_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_8_2();
  v13();
  Calendar.init(identifier:)();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v9);
  TimeZone.init(secondsFromGMT:)();
  uint64_t result = __swift_getEnumTagSinglePayload(v0, 1, v5);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v1, v0, v5);
    return Calendar.timeZone.setter();
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t CNContact.formattedFullName.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  uint64_t v2 = OUTLINED_FUNCTION_10_1(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_7_1();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = type metadata accessor for PersonNameComponents();
  OUTLINED_FUNCTION_1_2();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7_1();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = type metadata accessor for Locale();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v13);
  PersonNameComponents.init(from:for:)(v0, v5);
  uint64_t v14 = self;
  Class isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
  id v16 = objc_msgSend(v14, sel_localizedStringFromPersonNameComponents_style_options_, isa, 2, 0);

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  return v17;
}

uint64_t specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 56) = a3;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 64) = v10;
  *uint64_t v10 = v5;
  v10[1] = specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:);
  return specialized static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(a1, a2, a4, a5, a1, a2);
}

uint64_t specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:)()
{
  OUTLINED_FUNCTION_6_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3();
  *uint64_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_2_2();
  *uint64_t v7 = v6;
  *(void *)(v8 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_9_2();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t))(v6 + 8);
    return v12(v3);
  }
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  void *v16;
  uint64_t v17;

  id v16 = v0;
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[9];
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.siriContacts);
  uint64_t v3 = v1;
  uint64_t v4 = v1;
  uint64_t v5 = Logger.logObject.getter();
  uint64_t v6 = static os_log_type_t.error.getter();
  uint64_t v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[9];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_getErrorValue();
    uint64_t v10 = Error.localizedDescription.getter();
    v0[6] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C66B000, v5, v6, "#SiriContactsTaskUtil runTaskWithSafeTimeout error caught: %s", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {
  }
  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v12 = swift_bridgeObjectRetain();
  return v14(v12);
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 16);
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = result + 40;
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v19 = result + 40;
    do
    {
      uint64_t v20 = v7;
      uint64_t v8 = (uint64_t *)(v6 + 16 * v5);
      unint64_t v9 = v5;
      while (1)
      {
        if (v9 >= *(void *)(v3 + 16))
        {
          __break(1u);
          return result;
        }
        uint64_t v11 = *(v8 - 1);
        uint64_t v10 = *v8;
        unint64_t v5 = v9 + 1;
        uint64_t v12 = *(void *)(a2 + 16);
        swift_bridgeObjectRetain();
        if (!v12) {
          break;
        }
        swift_bridgeObjectRetain();
        specialized __RawDictionaryStorage.find<A>(_:)(v11, v10);
        char v14 = v13;
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0) {
          break;
        }
        uint64_t result = swift_bridgeObjectRelease();
        v8 += 2;
        ++v9;
        if (v4 == v5)
        {
          uint64_t v7 = v20;
          goto LABEL_16;
        }
      }
      uint64_t v7 = v20;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v20 + 16) + 1, 1);
        uint64_t v7 = v20;
      }
      unint64_t v16 = *(void *)(v7 + 16);
      unint64_t v15 = *(void *)(v7 + 24);
      unint64_t v17 = v16 + 1;
      if (v16 >= v15 >> 1)
      {
        uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v15 > 1), v16 + 1, 1);
        unint64_t v17 = v16 + 1;
        uint64_t v7 = v20;
      }
      *(void *)(v7 + 16) = v17;
      uint64_t v18 = v7 + 16 * v16;
      *(void *)(v18 + 32) = v11;
      *(void *)(v18 + 40) = v10;
      uint64_t v6 = v19;
    }
    while (v4 - 1 != v9);
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t specialized Dictionary.merging(_:uniquingKeysWith:)(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(a1, (uint64_t)specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B), 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t specialized Sequence.compactMap<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a1;
    uint64_t v5 = swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    uint64_t v24 = MEMORY[0x263F8EE78];
    uint64_t v25 = v5;
    do
    {
      if (*(void *)(a2 + 16))
      {
        uint64_t v7 = (void *)(v4 + v6);
        char v27 = *(unsigned char *)(v4 + v6 + 32);
        uint64_t v8 = *(void *)(v4 + v6 + 56);
        uint64_t v9 = *(void *)(v4 + v6 + 64);
        uint64_t v28 = v8;
        uint64_t v10 = v7[10];
        uint64_t v26 = v7[9];
        uint64_t v12 = v7[11];
        uint64_t v11 = v7[12];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        unint64_t v13 = specialized __RawDictionaryStorage.find<A>(_:)(v12, v11);
        if (v14)
        {
          char v15 = *(unsigned char *)(*(void *)(a2 + 56) + v13);
          swift_bridgeObjectRelease();
          if (v15)
          {
            swift_bridgeObjectRetain();
            uint64_t v16 = String.sanitizeCNLabel.getter();
            uint64_t v18 = v17;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (swift_isUniquelyReferenced_nonNull_native()) {
              uint64_t v19 = (char *)v24;
            }
            else {
              uint64_t v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v24 + 16) + 1, 1, v24);
            }
            unint64_t v21 = *((void *)v19 + 2);
            unint64_t v20 = *((void *)v19 + 3);
            if (v21 >= v20 >> 1) {
              uint64_t v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v20 > 1), v21 + 1, 1, (uint64_t)v19);
            }
            *((void *)v19 + 2) = v21 + 1;
            uint64_t v24 = (uint64_t)v19;
            uint64_t v22 = &v19[56 * v21];
            v22[32] = v27;
            *((void *)v22 + 5) = v26;
            *((void *)v22 + 6) = v10;
            *((void *)v22 + 7) = v16;
            *((void *)v22 + 8) = v18;
            *((void *)v22 + 9) = v28;
            *((void *)v22 + 10) = v9;
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
        uint64_t v4 = v25;
      }
      v6 += 72;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v24;
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
}

uint64_t FaceTimeHandles.FacetimeHandle.isPhoneNumber.getter()
{
  return *v0;
}

uint64_t FaceTimeHandles.FacetimeHandle.identifier.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

uint64_t FaceTimeHandles.FacetimeHandle.label.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

uint64_t FaceTimeHandles.FacetimeHandle.value.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

uint64_t FaceTimeHandles.audioHandles.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FaceTimeHandles.videoHandles.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CNContact.getEmailIMessageHandles()()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_2_0((uint64_t)CNContact.getEmailIMessageHandles());
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_0_3();
  uint64_t v2 = *(void **)(v1 + 32);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_2_2();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v5 = OUTLINED_FUNCTION_15();
  return v6(v5);
}

id CNContact.getEmailIMessageHandles()()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;
  id v5 = objc_msgSend(v1, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNLabeledValue);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v0[3] = v6;

  id result = objc_msgSend(self, sel_sharedInstance);
  v0[4] = result;
  if (result)
  {
    id v8 = result;
    v0[5] = v4;
    uint64_t v9 = (void *)OUTLINED_FUNCTION_13_0();
    v0[6] = v9;
    *uint64_t v9 = v0;
    v9[1] = CNContact.getEmailIMessageHandles();
    uint64_t v10 = MEMORY[0x263F8EE78];
    return (id)v11(v2, v4, v6, v10, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t CNContact.getFacetimeAudioHandles()()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_2_0((uint64_t)CNContact.getFacetimeAudioHandles());
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v2 = *(void **)(v1 + 40);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_2_2();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v5 = OUTLINED_FUNCTION_15();
  return v6(v5);
}

id CNContact.getFacetimeAudioHandles()()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = (void *)v0[2];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v1, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNLabeledValue);
  v0[3] = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v5 = objc_msgSend(v1, sel_phoneNumbers);
  v0[4] = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id result = objc_msgSend(self, sel_sharedInstance);
  v0[5] = result;
  if (result)
  {
    v0[6] = v3;
    uint64_t v7 = (void *)OUTLINED_FUNCTION_13_0();
    v0[7] = v7;
    *uint64_t v7 = v0;
    v7[1] = CNContact.getFacetimeAudioHandles();
    uint64_t v8 = OUTLINED_FUNCTION_14_0();
    return (id)v9(v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t CNContact.getFacetimeVideoHandles()()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_2_0((uint64_t)CNContact.getFacetimeVideoHandles());
}

id CNContact.getFacetimeVideoHandles()()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = (void *)v0[2];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v1, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNLabeledValue);
  v0[3] = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v5 = objc_msgSend(v1, sel_phoneNumbers);
  v0[4] = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id result = objc_msgSend(self, sel_sharedInstance);
  v0[5] = result;
  if (result)
  {
    v0[6] = v3;
    uint64_t v7 = (void *)OUTLINED_FUNCTION_13_0();
    v0[7] = v7;
    *uint64_t v7 = v0;
    v7[1] = CNContact.getFacetimeVideoHandles();
    uint64_t v8 = OUTLINED_FUNCTION_14_0();
    return (id)v9(v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t CNContact.facetimeURL(forEmail:isVideo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  return CNContact.facetimeURL(for:handleType:isVideo:)(a1, a2, 3, a3, a4);
}

uint64_t CNContact.facetimeURL(for:handleType:isVideo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7E1B0]), sel_init);
  id v13 = objc_msgSend(v12, sel_faceTimeProvider);

  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7E230]), sel_initWithProvider_, v13);
  type metadata accessor for TUHandle(0, &lazy cache variable for type metadata for TUHandle);
  swift_bridgeObjectRetain();
  id v15 = TUHandle.__allocating_init(type:value:)(a3, a1, a2);
  objc_msgSend(v14, sel_setHandle_, v15);

  if (objc_msgSend(v6, sel_hasBeenPersisted))
  {
    id v16 = objc_msgSend(v6, sel_identifier);
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;

    outlined bridged method (mbnn) of @objc TUDialRequest.contactIdentifier.setter(v17, v19, v14);
  }
  objc_msgSend(v14, sel_setVideo_, a4 & 1);
  objc_msgSend(v14, sel_setTtyType_, 0);
  id v20 = objc_msgSend(v14, sel_URL);
  if (v20)
  {
    id v21 = v20;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v22 = 0;
    id v14 = v21;
  }
  else
  {
    uint64_t v22 = 1;
  }

  uint64_t v23 = type metadata accessor for URL();
  return __swift_storeEnumTagSinglePayload(a5, v22, 1, v23);
}

uint64_t CNContact.facetimeURL(forPhone:isVideo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  return CNContact.facetimeURL(for:handleType:isVideo:)(a1, a2, 2, a3, a4);
}

id TUHandle.__allocating_init(type:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v7 = (void *)MEMORY[0x26118E540](a2, a3);
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithType_value_, a1, v7);

  return v8;
}

uint64_t CNContact.familyNamePronunciationString.getter()
{
  return CNContact.familyNamePronunciationString.getter((SEL *)&selRef_pronunciationFamilyName, (SEL *)&selRef_phoneticFamilyName);
}

uint64_t CNContact.givenNamePronunciationString.getter()
{
  return CNContact.familyNamePronunciationString.getter((SEL *)&selRef_pronunciationGivenName, (SEL *)&selRef_phoneticGivenName);
}

uint64_t CNContact.familyNamePronunciationString.getter(SEL *a1, SEL *a2)
{
  uint64_t v5 = outlined bridged method (pb) of @objc CNContact.pronunciationGivenName.getter(v2, a1);
  char v7 = Optional<A>.isNilOrEmpty.getter(v5, v6);
  swift_bridgeObjectRelease();
  if (v7)
  {
    id v8 = [v2 *a2];
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;

    swift_bridgeObjectRelease();
    uint64_t v12 = HIBYTE(v11) & 0xF;
    if ((v11 & 0x2000000000000000) == 0) {
      uint64_t v12 = v9 & 0xFFFFFFFFFFFFLL;
    }
    if (v12)
    {
      id v13 = [v2 *a2];
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
  }
  else
  {
    outlined bridged method (pb) of @objc CNContact.pronunciationGivenName.getter(v2, a1);
  }
  return OUTLINED_FUNCTION_6_1();
}

uint64_t CNContact.middleNamePronunciationString.getter()
{
  id v1 = objc_msgSend(v0, sel_phoneticMiddleName);
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    id v6 = objc_msgSend(v0, sel_phoneticMiddleName);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return OUTLINED_FUNCTION_6_1();
}

uint64_t CNContact.getPhoneticRepresentation(locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PhonemeData?);
  uint64_t v6 = OUTLINED_FUNCTION_10_1(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_19();
  uint64_t v7 = type metadata accessor for PhonemeData();
  OUTLINED_FUNCTION_1_2();
  uint64_t v31 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7_1();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  uint64_t v14 = OUTLINED_FUNCTION_10_1(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_7_1();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = type metadata accessor for Locale();
  OUTLINED_FUNCTION_1_2();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_7_1();
  uint64_t v24 = v23 - v22;
  outlined init with copy of URL?(a1, v17, &demangling cache variable for type metadata for Locale?);
  if (__swift_getEnumTagSinglePayload(v17, 1, v18) == 1)
  {
    outlined destroy of URL?(v17, &demangling cache variable for type metadata for Locale?);
LABEL_5:
    PersonNameComponents.init()();
    CNContact.givenNamePronunciationString.getter();
    PersonNameComponents.givenName.setter();
    CNContact.familyNamePronunciationString.getter();
    PersonNameComponents.familyName.setter();
    CNContact.middleNamePronunciationString.getter();
    PersonNameComponents.middleName.setter();
    uint64_t v27 = type metadata accessor for PersonNameComponents();
    return __swift_storeEnumTagSinglePayload(a2, 0, 1, v27);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v24, v17, v18);
  ((void (*)())static PhonemeDataParser.parse(from:))();
  if (__swift_getEnumTagSinglePayload(v2, 1, v7) == 1)
  {
    uint64_t v25 = OUTLINED_FUNCTION_23();
    v26(v25);
    outlined destroy of URL?(v2, &demangling cache variable for type metadata for PhonemeData?);
    goto LABEL_5;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v12, v2, v7);
  PhonemeData.asNameComponents(locale:)();
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v12, v7);
  uint64_t v29 = OUTLINED_FUNCTION_23();
  return v30(v29);
}

BOOL CNContact.isBirthdayToday.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateComponents?);
  uint64_t v2 = OUTLINED_FUNCTION_10_1(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_19();
  uint64_t v3 = type metadata accessor for DateComponents();
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v44 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v44 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v44 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v44 - v19;
  static DateComponents.startOfToday.getter();
  id v21 = objc_msgSend(v0, sel_birthday);
  if (!v21)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v0, 1, 1, v3);
    goto LABEL_8;
  }
  uint64_t v22 = v21;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v23 = (void (*)(void *, char *, uint64_t))v5[4];
  v23(v0, v15, v3);
  __swift_storeEnumTagSinglePayload((uint64_t)v0, 0, 1, v3);
  if (__swift_getEnumTagSinglePayload((uint64_t)v0, 1, v3) == 1)
  {
LABEL_8:
    OUTLINED_FUNCTION_4_3();
    v31();
    outlined destroy of URL?((uint64_t)v0, &demangling cache variable for type metadata for DateComponents?);
    return 0;
  }
  v23(v18, (char *)v0, v3);
  uint64_t v24 = (void (*)(uint64_t))DateComponents.month.getter();
  char v26 = v25;
  uint64_t v27 = DateComponents.month.getter();
  if ((v26 & 1) == 0)
  {
    if ((v28 & 1) == 0)
    {
      uint64_t v29 = (void (*)(uint64_t))v27;
      Swift::String v30 = (void (*)(char *, char *, uint64_t))v5[2];
      v30(v12, v20, v3);
      v30(v9, v18, v3);
      if (v24 == v29) {
        goto LABEL_15;
      }
LABEL_11:
      Swift::String v34 = (void (*)(void))v5[1];
      OUTLINED_FUNCTION_4_3();
      v34();
      OUTLINED_FUNCTION_4_3();
      v34();
      OUTLINED_FUNCTION_4_3();
      v34();
      ((void (*)(char *, uint64_t))v34)(v20, v3);
      return 0;
    }
LABEL_10:
    uint64_t v32 = OUTLINED_FUNCTION_17();
    v24(v32);
    uint64_t v33 = OUTLINED_FUNCTION_24();
    v24(v33);
    goto LABEL_11;
  }
  if ((v28 & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v36 = OUTLINED_FUNCTION_17();
  v24(v36);
  uint64_t v37 = OUTLINED_FUNCTION_24();
  v24(v37);
LABEL_15:
  uint64_t v45 = DateComponents.day.getter();
  char v39 = v38;
  uint64_t v40 = DateComponents.day.getter();
  char v42 = v41;
  int v43 = (void (*)(void))v5[1];
  OUTLINED_FUNCTION_4_3();
  v43();
  OUTLINED_FUNCTION_4_3();
  v43();
  OUTLINED_FUNCTION_4_3();
  v43();
  OUTLINED_FUNCTION_4_3();
  v43();
  if ((v39 & 1) == 0) {
    return (v42 & 1) == 0 && v45 == v40;
  }
  return (v42 & 1) != 0;
}

uint64_t specialized static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[7] = a3;
  v6[8] = a4;
  v6[5] = a1;
  v6[6] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v6[9] = swift_task_alloc();
  v6[2] = a5;
  v6[3] = a6;
  return MEMORY[0x270FA2498](specialized static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:), 0, 0);
}

uint64_t specialized static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  OUTLINED_FUNCTION_20();
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[5];
  uint64_t v6 = type metadata accessor for TaskPriority();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v4;
  v7[5] = v2;
  swift_retain();
  uint64_t v8 = _sScTss5Error_pRs_rlE8detached8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntFZSDySSSbG_Tgm5(v1, (uint64_t)&async function pointer to partial apply for specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:), (uint64_t)v7);
  v0[10] = v8;
  outlined destroy of URL?(v1, &demangling cache variable for type metadata for TaskPriority?);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[11] = v10;
  v10[2] = v8;
  v10[3] = v5;
  v10[4] = v3;
  v10[5] = v0 + 2;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[12] = v11;
  *uint64_t v11 = v0;
  v11[1] = specialized static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return MEMORY[0x270FA22B8](v0 + 4, v9, v9, 0, 0, &async function pointer to partial apply for specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:), v10, v9);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_3_3();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_2();
  void *v6 = v5;
  *(void *)(v3 + 104) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  OUTLINED_FUNCTION_6_3();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t (*v0)(void);
  uint64_t v2;

  OUTLINED_FUNCTION_6_3();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v0();
}

uint64_t specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v4;
  *uint64_t v4 = v3;
  v4[1] = specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return v6(v3 + 16);
}

uint64_t specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_2();
  *uint64_t v5 = v4;
  *(void *)(v6 + 32) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

{
  uint64_t (*v0)(void);

  OUTLINED_FUNCTION_16();
  return v0();
}

uint64_t _sScTss5Error_pRs_rlE8detached8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntFZSDySSSbG_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL?(a1, (uint64_t)v7, &demangling cache variable for type metadata for TaskPriority?);
  uint64_t v8 = type metadata accessor for TaskPriority();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    outlined destroy of URL?((uint64_t)v7, &demangling cache variable for type metadata for TaskPriority?);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v11 = v10;
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  if (v11 | v9)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v9;
    v13[3] = v11;
  }
  return swift_task_create();
}

uint64_t specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[12] = a5;
  v6[13] = a6;
  v6[10] = a3;
  v6[11] = a4;
  v6[8] = a1;
  v6[9] = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ThrowingTaskGroup<[String : Bool], Error>.Iterator);
  v6[14] = v7;
  v6[15] = *(void *)(v7 - 8);
  v6[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v6[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:), 0, 0);
}

uint64_t specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[13];
  uint64_t v5 = v1[11];
  uint64_t v4 = v1[12];
  uint64_t v7 = v1[9];
  uint64_t v6 = v1[10];
  type metadata accessor for TaskPriority();
  OUTLINED_FUNCTION_25();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v7;
  swift_retain();
  _sScg7addTask8priority9operationyScPSg_xyYaKYAcntFSDySSSbG_s5Error_pTg5(v2, (uint64_t)&async function pointer to partial apply for specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:), (uint64_t)v8);
  outlined destroy of URL?(v2, &demangling cache variable for type metadata for TaskPriority?);
  OUTLINED_FUNCTION_25();
  v1[2] = v4;
  v1[3] = v3;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v6;
  v9[5] = v5;
  outlined init with take of SiriContactsTaskUtil.TimeoutError((uint64_t)(v1 + 2), (uint64_t)(v9 + 6));
  _sScg7addTask8priority9operationyScPSg_xyYaKYAcntFSDySSSbG_s5Error_pTg5(v2, (uint64_t)&async function pointer to partial apply for specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:), (uint64_t)v9);
  outlined destroy of URL?(v2, &demangling cache variable for type metadata for TaskPriority?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  ThrowingTaskGroup.makeAsyncIterator()();
  uint64_t v10 = (void *)swift_task_alloc();
  v1[18] = v10;
  *uint64_t v10 = v1;
  v10[1] = specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2058]();
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

{
  uint64_t v0;
  void (*v1)(void);
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _OWORD *v5;
  uint64_t (*v6)(void);
  uint64_t v7;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_21();
  v1();
  if (*(void *)(v0 + 48))
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = OUTLINED_FUNCTION_15();
    return v3(v2);
  }
  else
  {
    *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 96);
    lazy protocol witness table accessor for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError();
    if (!_getErrorEmbeddedNSError<A>(_:)())
    {
      swift_allocError();
      *uint64_t v5 = *(_OWORD *)(v0 + 32);
    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_16();
    return v6();
  }
}

{
  void (*v0)(void);
  uint64_t (*v1)(void);
  uint64_t v3;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_21();
  v0();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v1();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t (*v9)(void);
  uint64_t v11;

  OUTLINED_FUNCTION_18();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_3_3();
  void *v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_2_2();
  *uint64_t v8 = v7;
  swift_task_dealloc();
  if (!v0) {
    **(void **)(v5 + 16) = v3;
  }
  uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *uint64_t v5 = v3;
  v5[1] = specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  uint64_t v8 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v3 + 16, a3, v6, v7, v8);
}

uint64_t specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_3_3();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_2_2();
  void *v6 = v5;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = *(uint64_t (**)(void))(v5 + 8);
    return v7();
  }
  else
  {
    uint64_t v9 = *(void *)(v3 + 16);
    uint64_t v10 = *(uint64_t (**)(uint64_t))(v5 + 8);
    return v10(v9);
  }
}

uint64_t _sScg7addTask8priority9operationyScPSg_xyYaKYAcntFSDySSSbG_s5Error_pTg5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL?(a1, (uint64_t)v9, &demangling cache variable for type metadata for TaskPriority?);
  uint64_t v10 = type metadata accessor for TaskPriority();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1)
  {
    outlined destroy of URL?((uint64_t)v9, &demangling cache variable for type metadata for TaskPriority?);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v13 = v12;
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v14 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  uint64_t v15 = (void *)(v13 | v11);
  if (v13 | v11)
  {
    v18[0] = 0;
    v18[1] = 0;
    uint64_t v15 = v18;
    v18[2] = v11;
    v18[3] = v13;
  }
  v17[1] = 1;
  v17[2] = v15;
  v17[3] = v14;
  swift_task_create();
  return swift_release();
}

uint64_t specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  uint64_t v7 = type metadata accessor for ContinuousClock();
  v6[8] = v7;
  v6[9] = *(void *)(v7 - 8);
  v6[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:), 0, 0);
}

uint64_t specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  OUTLINED_FUNCTION_6_3();
  ContinuousClock.init()();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&async function pointer to specialized Clock.sleep(for:tolerance:)
                                                                        + async function pointer to specialized Clock.sleep(for:tolerance:));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[11] = v1;
  *uint64_t v1 = v0;
  v1[1] = specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  return v5(v3, v2, 0, 0, 1);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_3_3();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  v4();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

{
  uint64_t v0;
  _OWORD *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  OUTLINED_FUNCTION_18();
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 48);
  lazy protocol witness table accessor for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError();
  if (!_getErrorEmbeddedNSError<A>(_:)())
  {
    swift_allocError();
    *uint64_t v1 = *(_OWORD *)(v0 + 16);
  }
  swift_willThrow();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v2();
}

{
  uint64_t (*v0)(void);
  uint64_t v2;

  OUTLINED_FUNCTION_6_3();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v0();
}

uint64_t specialized OptionSet<>.init()()
{
  return 0;
}

uint64_t specialized Clock.sleep(for:tolerance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = type metadata accessor for ContinuousClock.Instant();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](specialized Clock.sleep(for:tolerance:), 0, 0);
}

uint64_t specialized Clock.sleep(for:tolerance:)()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = type metadata accessor for ContinuousClock();
  uint64_t v5 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type ContinuousClock and conformance ContinuousClock, MEMORY[0x263F8F710]);
  dispatch thunk of Clock.now.getter();
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type ContinuousClock.Instant and conformance ContinuousClock.Instant, MEMORY[0x263F8F6D8]);
  dispatch thunk of InstantProtocol.advanced(by:)();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = specialized Clock.sleep(for:tolerance:);
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v16;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_3_3();
  *uint64_t v4 = v3;
  uint64_t v6 = (void (*)(uint64_t, uint64_t))v5[12];
  uint64_t v7 = v5[11];
  uint64_t v8 = v5[8];
  uint64_t v9 = *v1;
  OUTLINED_FUNCTION_2_2();
  *uint64_t v10 = v9;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();
  v6(v7, v8);
  if (v0)
  {
    OUTLINED_FUNCTION_9_2();
    return MEMORY[0x270FA2498](v11, v12, v13);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_16();
    return v14();
  }
}

{
  uint64_t (*v0)(void);
  uint64_t v2;

  OUTLINED_FUNCTION_6_3();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v0();
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 72 * a1 + 32;
    unint64_t v6 = a3 + 72 * v4;
    if (v5 >= v6 || v5 + 72 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[72 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 72 * a2);
  }
  return __src;
}

{
  uint64_t v3;

  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[56 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 56 * a2);
  }
  return __src;
}

{
  uint64_t v3;

  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

{
  uint64_t v3;

  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t specialized UnsafeMutablePointer.initialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 72 * a2 > a1 ? (BOOL v3 = a1 + 72 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    OUTLINED_FUNCTION_28();
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

{
  BOOL v3;
  uint64_t result;
  uint64_t vars8;

  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

{
  BOOL v3;
  uint64_t result;
  uint64_t vars8;

  if (a2 < 0 || (a3 + 32 * a2 > a1 ? (BOOL v3 = a1 + 32 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t specialized closure #1 in Dictionary.merge(_:uniquingKeysWith:)(unsigned char *a1, uint64_t a2, uint64_t a3, char a4)
{
  *a1 = a4;
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  specialized LazyMapSequence.makeIterator()(a1, a2, a3, &v33);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = specialized LazyMapSequence.Iterator.next()();
  if (v8)
  {
    uint64_t v10 = v7;
    uint64_t v11 = v8;
    char v12 = v9;
    while (1)
    {
      uint64_t v13 = (void *)*a5;
      unint64_t v15 = specialized __RawDictionaryStorage.find<A>(_:)(v10, v11);
      uint64_t v16 = v13[2];
      BOOL v17 = (v14 & 1) == 0;
      uint64_t v18 = v16 + v17;
      if (__OFADD__(v16, v17)) {
        break;
      }
      char v19 = v14;
      if (v13[3] >= v18)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Bool>);
          _NativeDictionary.copy()();
        }
      }
      else
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v18, a4 & 1);
        unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(v10, v11);
        if ((v19 & 1) != (v21 & 1)) {
          goto LABEL_17;
        }
        unint64_t v15 = v20;
      }
      int v22 = v12 & 1;
      uint64_t v23 = (void *)*a5;
      if (v19)
      {
        BOOL v24 = v22 != 0;
        char v25 = *(unsigned char *)(v23[7] + v15);
        swift_bridgeObjectRelease();
        *(unsigned char *)(v23[7] + v15) = (v25 | v24) & 1;
      }
      else
      {
        v23[(v15 >> 6) + 8] |= 1 << v15;
        char v26 = (uint64_t *)(v23[6] + 16 * v15);
        uint64_t *v26 = v10;
        v26[1] = v11;
        *(unsigned char *)(v23[7] + v15) = v22;
        uint64_t v27 = v23[2];
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28) {
          goto LABEL_16;
        }
        v23[2] = v29;
      }
      uint64_t v10 = specialized LazyMapSequence.Iterator.next()();
      uint64_t v11 = v30;
      char v12 = v31;
      a4 = 1;
      if (!v30) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    outlined consume of [AnyHashable : Any].Iterator._Variant();
    return swift_release();
  }
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  BOOL v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Bool>);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  Swift::String v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    unint64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    char v23 = *(unsigned char *)(*(void *)(v5 + 56) + i);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) == 0)
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    uint64_t v32 = (void *)(*(void *)(v7 + 48) + 16 * v27);
    *uint64_t v32 = v22;
    v32[1] = v21;
    *(unsigned char *)(*(void *)(v7 + 56) + v27) = v23;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v35)
    {
      swift_release();
      BOOL v3 = v34;
      BOOL v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    BOOL v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v36 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v35) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v36 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v35)
  {
    unint64_t v18 = *(void *)(v36 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v35) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v36 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  BOOL v3 = v34;
LABEL_34:
  if (v37)
  {
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    if (v33 >= 64) {
      specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v33 + 63) >> 6, v17);
    }
    else {
      *BOOL v17 = -1 << v33;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *BOOL v3 = v7;
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

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

{
  uint64_t *v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  int64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  int64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t outlined bridged method (pb) of @objc CNContact.pronunciationGivenName.getter(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    BOOL v3 = v2;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return OUTLINED_FUNCTION_6_1();
}

void outlined bridged method (mbnn) of @objc TUDialRequest.contactIdentifier.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)MEMORY[0x26118E540]();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setContactIdentifier_, v4);
}

uint64_t specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = specialized closure #1 in Dictionary.merge(_:uniquingKeysWith:)(&v6, *(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  char v4 = v6;
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v4;
  return result;
}

uint64_t specialized LazyMapSequence.makeIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t specialized LazyMapSequence.Iterator.next()()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[2];
  char v21;

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    char v10 = *(unsigned char *)(*(void *)(v1 + 56) + v6);
    v0[3] = v4;
    v0[4] = v5;
    size_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    uint64_t v21 = v10;
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    return v19;
  }
  int64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      unint64_t v15 = v0[1];
      int64_t v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      BOOL v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        int64_t v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          int64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          int64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            int64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            int64_t v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            int64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              int64_t v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              unint64_t v18 = v3 + 6;
              while (v18 < v14)
              {
                int64_t v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  int64_t v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v8;
  *uint64_t v8 = v4;
  v8[1] = specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(a2, a3, a4);
}

uint64_t specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  *(void *)(v6 + 16) = a1;
  uint64_t v11 = *a6;
  uint64_t v12 = a6[1];
  int64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v13;
  *int64_t v13 = v6;
  v13[1] = specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(a2, a3, a4, a5, v11, v12);
}

uint64_t specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v8;
  *uint64_t v8 = v4;
  v8[1] = specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(a2, a3, a4);
}

uint64_t specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  *(void *)(v6 + 16) = a1;
  uint64_t v11 = *a6;
  uint64_t v12 = a6[1];
  int64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v13;
  *int64_t v13 = v6;
  v13[1] = specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(a2, a3, a4, a5, v11, v12);
}

uint64_t specialized static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v5[21] = a3;
  v5[22] = a4;
  v5[19] = a1;
  v5[20] = a2;
  uint64_t v7 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v5[23] = v7;
  v5[24] = *(void *)(v7 - 8);
  v5[25] = swift_task_alloc();
  v5[26] = type metadata accessor for OS_dispatch_queue.Attributes();
  v5[27] = swift_task_alloc();
  type metadata accessor for DispatchQoS();
  v5[28] = swift_task_alloc();
  v5[5] = type metadata accessor for TUHandle(0, &lazy cache variable for type metadata for IDSIDQueryController);
  v5[6] = &protocol witness table for IDSIDQueryController;
  v5[2] = a5;
  id v8 = a5;
  return MEMORY[0x270FA2498](specialized static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:), 0, 0);
}

uint64_t specialized static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)()
{
  uint64_t v1 = v0;
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  v0[29] = __swift_project_value_buffer(v2, (uint64_t)static Logger.siriContacts);
  int64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25C66B000, v3, v4, "#IDSHelper getAvailableHandles", v5, 2u);
    OUTLINED_FUNCTION_3();
  }
  unint64_t v7 = v0[21];
  unint64_t v6 = v0[22];

  uint64_t v8 = static IDSHelper.format(emailAddresses:phoneNumbers:)(v7, v6);
  v0[30] = v8;
  int64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v10 = v8;
    uint64_t v33 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9, 0);
    uint64_t v11 = v33;
    unint64_t v12 = *(void *)(v33 + 16);
    uint64_t v13 = 16 * v12;
    unint64_t v14 = (uint64_t *)(v10 + 96);
    do
    {
      uint64_t v16 = *(v14 - 1);
      uint64_t v15 = *v14;
      int64_t v17 = v12 + 1;
      unint64_t v18 = *(void *)(v33 + 24);
      swift_bridgeObjectRetain();
      if (v12 >= v18 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v18 > 1), v17, 1);
      }
      *(void *)(v33 + 16) = v17;
      uint64_t v19 = v33 + v13;
      *(void *)(v19 + 32) = v16;
      *(void *)(v19 + 40) = v15;
      v13 += 16;
      v14 += 9;
      ++v12;
      --v9;
    }
    while (v9);
    uint64_t v20 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    uint64_t v20 = MEMORY[0x263F8EE78];
  }
  v1[31] = v11;
  uint64_t v21 = v1[25];
  uint64_t v22 = v1[24];
  uint64_t v29 = v1[23];
  uint64_t v30 = v1[19];
  uint64_t v32 = v1[20];
  type metadata accessor for TUHandle(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  static DispatchQoS.userInitiated.getter();
  v1[17] = v20;
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))(v21, *MEMORY[0x263F8F130], v29);
  char v23 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v1[32] = v23;
  uint64_t v24 = Dictionary.init(dictionaryLiteral:)();
  v1[33] = v24;
  outlined init with copy of IDSStatusProviding((uint64_t)(v1 + 2), (uint64_t)(v1 + 7));
  unint64_t v25 = (void *)swift_allocObject();
  v1[34] = v25;
  outlined init with take of IDSStatusProviding((long long *)(v1 + 7), (uint64_t)(v25 + 2));
  v25[7] = v11;
  v25[8] = v30;
  v25[9] = v32;
  v25[10] = v23;
  uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:)
                                                                            + async function pointer to specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v26 = v23;
  unint64_t v27 = (void *)swift_task_alloc();
  v1[35] = v27;
  *unint64_t v27 = v1;
  v27[1] = specialized static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  return v31(50000000000000000, 0, v24, (uint64_t)&async function pointer to partial apply for closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:), (uint64_t)v25);
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3();
  *uint64_t v2 = v1;
  int64_t v3 = *v0;
  OUTLINED_FUNCTION_2_2();
  *os_log_type_t v4 = v3;
  *(void *)(v6 + 288) = v5;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  id v26 = v0;
  uint64_t v1 = v0 + 16;
  uint64_t v2 = *(void *)(v0 + 288);
  int64_t v3 = *(void *)(v0 + 248);
  swift_bridgeObjectRetain();
  os_log_type_t v4 = specialized _ArrayProtocol.filter(_:)(v3, v2);
  *(void *)(v0 + 296) = 0;
  swift_bridgeObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  unint64_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    unint64_t v25 = swift_slowAlloc();
    *(_DWORD *)unint64_t v7 = 136315138;
    uint64_t v8 = swift_bridgeObjectRetain();
    int64_t v9 = MEMORY[0x26118E650](v8, MEMORY[0x263F8D310]);
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 144) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v11, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C66B000, v5, v6, "#IDSHelper getAvailableHandles remainingDestinations: %s", v7, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    uint64_t v1 = v0 + 16;
    OUTLINED_FUNCTION_3();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v12 = *(void **)(v0 + 256);
  if (*(void *)(v4 + 16))
  {
    unint64_t v14 = *(void *)(v0 + 152);
    uint64_t v13 = *(void *)(v0 + 160);
    uint64_t v15 = Dictionary.init(dictionaryLiteral:)();
    *(void *)(v0 + 304) = v15;
    outlined init with copy of IDSStatusProviding(v1, v0 + 96);
    uint64_t v16 = (void *)swift_allocObject();
    *(void *)(v0 + 312) = v16;
    outlined init with take of IDSStatusProviding((long long *)(v0 + 96), (uint64_t)(v16 + 2));
    v16[7] = v4;
    v16[8] = v14;
    v16[9] = v13;
    v16[10] = v12;
    uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:)
                                                                              + async function pointer to specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:));
    swift_bridgeObjectRetain();
    int64_t v17 = v12;
    unint64_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v18;
    char *v18 = v0;
    v18[1] = specialized static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
    return v24(2500000000000000000, 0, v15, (uint64_t)&async function pointer to partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:), (uint64_t)v16);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v20 = OUTLINED_FUNCTION_6_1();
    uint64_t v22 = specialized Sequence.compactMap<A>(_:)(v20, v21);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0(v1);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v23 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v23(v22);
  }
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3();
  *uint64_t v2 = v1;
  int64_t v3 = *v0;
  OUTLINED_FUNCTION_2_2();
  *os_log_type_t v4 = v3;
  *(void *)(v6 + 328) = v5;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;

  OUTLINED_FUNCTION_12_0();
  uint64_t v1 = specialized Dictionary.merging(_:uniquingKeysWith:)(v0[41], v0[36]);
  uint64_t v2 = (void *)v0[32];
  int64_t v3 = v0[30];
  if (*(void *)(v1 + 16))
  {
    swift_bridgeObjectRetain();
    specialized Sequence.compactMap<A>(_:)(v3, v1);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v4 = OUTLINED_FUNCTION_15();
  return v5(v4);
}

uint64_t destroy for FaceTimeHandles()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for FaceTimeHandles(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FaceTimeHandles(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for FaceTimeHandles(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FaceTimeHandles(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for FaceTimeHandles(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FaceTimeHandles()
{
  return &type metadata for FaceTimeHandles;
}

uint64_t destroy for FaceTimeHandles.FacetimeHandle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FaceTimeHandles.FacetimeHandle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FaceTimeHandles.FacetimeHandle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FaceTimeHandles.FacetimeHandle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FaceTimeHandles.FacetimeHandle(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for FaceTimeHandles.FacetimeHandle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FaceTimeHandles.FacetimeHandle()
{
  return &type metadata for FaceTimeHandles.FacetimeHandle;
}

uint64_t type metadata accessor for TUHandle(uint64_t a1, unint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
  }
  return result;
}

uint64_t outlined init with copy of IDSStatusProviding(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined init with take of IDSStatusProviding(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t partial apply for closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_26();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_8_3(v0);
  *uint64_t v1 = v2;
  v1[1] = partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  uint64_t v3 = OUTLINED_FUNCTION_5_3();
  return closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(v3, v4, v5, v6, v7, v8);
}

uint64_t objectdestroyTm_0()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_26();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_8_3(v0);
  *uint64_t v1 = v2;
  v1[1] = partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  uint64_t v3 = OUTLINED_FUNCTION_5_3();
  return closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_25C67A6E0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (int *)v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_8_3(v6);
  *uint64_t v7 = v8;
  v7[1] = partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&async function pointer to specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)
                                                                + async function pointer to specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:));
  return v9(v2, v3, v4, v5);
}

uint64_t partial apply for specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  OUTLINED_FUNCTION_20();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  uint64_t v8 = v0[4];
  uint64_t v7 = (uint64_t *)v0[5];
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)OUTLINED_FUNCTION_8_3(v9);
  *uint64_t v10 = v11;
  v10[1] = partial apply for specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))((char *)&async function pointer to specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)
                                                                                       + async function pointer to specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:));
  return v12(v4, v2, v5, v6, v8, v7);
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v3();
}

uint64_t sub_25C67A970()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_8_3(v6);
  *uint64_t v7 = v8;
  v7[1] = partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)
                                                                  + async function pointer to specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:));
  return v9(v2, v3, v4, v5);
}

uint64_t sub_25C67AA6C()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t outlined init with take of SiriContactsTaskUtil.TimeoutError(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t partial apply for specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  OUTLINED_FUNCTION_20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_8_3(v0);
  *uint64_t v1 = v2;
  v1[1] = partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  uint64_t v3 = OUTLINED_FUNCTION_5_3();
  return v4(v3);
}

unint64_t lazy protocol witness table accessor for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError;
  if (!lazy protocol witness table cache variable for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_5_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_3(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t getEnumTagSinglePayload for SiriContactsTaskUtil.TimeoutError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SiriContactsTaskUtil.TimeoutError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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

uint64_t getEnumTag for SiriContactsTaskUtil.TimeoutError()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriContactsTaskUtil.TimeoutError()
{
  return &type metadata for SiriContactsTaskUtil.TimeoutError;
}

uint64_t SiriContactsTaskUtil.TimeoutError.errorDescription.getter()
{
  _StringGuts.grow(_:)(51);
  v0._object = (void *)0x800000025C6991D0;
  v0._countAndFlagsBits = 0xD000000000000028;
  String.append(_:)(v0);
  v1._countAndFlagsBits = Duration.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 0x6564656563786520;
  v2._object = (void *)0xE900000000000064;
  String.append(_:)(v2);
  return 0;
}

uint64_t protocol witness for LocalizedError.errorDescription.getter in conformance SiriContactsTaskUtil.TimeoutError()
{
  return SiriContactsTaskUtil.TimeoutError.errorDescription.getter();
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance SiriContactsTaskUtil.TimeoutError()
{
  return MEMORY[0x270EEE930]();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance SiriContactsTaskUtil.TimeoutError()
{
  return MEMORY[0x270EEE950]();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance SiriContactsTaskUtil.TimeoutError()
{
  return MEMORY[0x270EEE920]();
}

uint64_t protocol witness for Error._domain.getter in conformance SiriContactsTaskUtil.TimeoutError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance SiriContactsTaskUtil.TimeoutError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance SiriContactsTaskUtil.TimeoutError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance SiriContactsTaskUtil.TimeoutError()
{
  return MEMORY[0x270F9FB30]();
}

unint64_t static SiriContactEntity.bundleIdentifier.getter()
{
  return 0xD00000000000001BLL;
}

void one-time initialization function for typeIdentifier()
{
  unk_26A5BE416 = -4864;
}

uint64_t static SiriContactEntity.typeIdentifier.getter()
{
  if (one-time initialization token for typeIdentifier != -1) {
    swift_once();
  }
  uint64_t v0 = static SiriContactEntity.typeIdentifier;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t SiriContactEntity.__allocating_init(_:)()
{
  type metadata accessor for CustomAppEntityRepresentationBase.InstanceInfo();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_5();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = OUTLINED_FUNCTION_1_4();
  v3(v2);
  CustomAppEntityRepresentationBase.init(_:)();
  uint64_t v4 = OUTLINED_FUNCTION_2_3();
  v5(v4);
  return v1;
}

uint64_t SiriContactEntity.init(_:)()
{
  type metadata accessor for CustomAppEntityRepresentationBase.InstanceInfo();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_5();
  uint64_t v2 = OUTLINED_FUNCTION_1_4();
  v3(v2);
  CustomAppEntityRepresentationBase.init(_:)();
  uint64_t v4 = OUTLINED_FUNCTION_2_3();
  v5(v4);
  return v0;
}

uint64_t SiriContactEntity.__deallocating_deinit()
{
  uint64_t v0 = CustomAppEntityRepresentationBase.deinit();
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t base witness table accessor for AppEntityRepresentation in SiriContactEntity()
{
  return lazy protocol witness table accessor for type SiriContactEntity and conformance SiriContactEntity(&lazy protocol witness table cache variable for type SiriContactEntity and conformance SiriContactEntity);
}

uint64_t type metadata accessor for SiriContactEntity()
{
  uint64_t result = type metadata singleton initialization cache for SiriContactEntity;
  if (!type metadata singleton initialization cache for SiriContactEntity) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t base witness table accessor for AppEntityTypeDescribing in SiriContactEntity()
{
  return lazy protocol witness table accessor for type SiriContactEntity and conformance SiriContactEntity(&lazy protocol witness table cache variable for type SiriContactEntity and conformance SiriContactEntity);
}

uint64_t base witness table accessor for IntentValueOptionalWrappable in SiriContactEntity()
{
  return lazy protocol witness table accessor for type SiriContactEntity and conformance SiriContactEntity(&lazy protocol witness table cache variable for type SiriContactEntity and conformance SiriContactEntity);
}

uint64_t base witness table accessor for IntentValueTypeIdentifiable in SiriContactEntity()
{
  return lazy protocol witness table accessor for type SiriContactEntity and conformance SiriContactEntity(&lazy protocol witness table cache variable for type SiriContactEntity and conformance SiriContactEntity);
}

uint64_t base witness table accessor for IntentValue in SiriContactEntity()
{
  return lazy protocol witness table accessor for type SiriContactEntity and conformance SiriContactEntity(&lazy protocol witness table cache variable for type SiriContactEntity and conformance SiriContactEntity);
}

uint64_t base witness table accessor for OriginIdentifiable in SiriContactEntity()
{
  return lazy protocol witness table accessor for type SiriContactEntity and conformance SiriContactEntity(&lazy protocol witness table cache variable for type SiriContactEntity and conformance SiriContactEntity);
}

uint64_t base witness table accessor for TransferableExportable in SiriContactEntity()
{
  return lazy protocol witness table accessor for type SiriContactEntity and conformance SiriContactEntity(&lazy protocol witness table cache variable for type SiriContactEntity and conformance SiriContactEntity);
}

uint64_t protocol witness for AppEntityRepresentation.displayRepresentation.getter in conformance SiriContactEntity()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.displayRepresentation.getter();
}

uint64_t protocol witness for AppEntityRepresentation.identifier.getter in conformance SiriContactEntity()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.identifier.getter();
}

uint64_t protocol witness for AppEntityRepresentation.isTransient.getter in conformance SiriContactEntity()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.isTransient.getter() & 1;
}

uint64_t protocol witness for AppEntityRepresentation.properties.getter in conformance SiriContactEntity()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.properties.getter();
}

unint64_t protocol witness for static AppEntityTypeDescribing.bundleIdentifier.getter in conformance SiriContactEntity()
{
  return 0xD00000000000001BLL;
}

uint64_t protocol witness for static AppEntityTypeDescribing.typeIdentifier.getter in conformance SiriContactEntity()
{
  return static SiriContactEntity.typeIdentifier.getter();
}

uint64_t protocol witness for static IntentValueSequenceElement.canConvertFrom(_:) in conformance SiriContactEntity(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F0CBC0](a1, a2, WitnessTable);
}

uint64_t base witness table accessor for IntentValueSequenceElement in SiriContactEntity()
{
  return lazy protocol witness table accessor for type SiriContactEntity and conformance SiriContactEntity(&lazy protocol witness table cache variable for type SiriContactEntity and conformance SiriContactEntity);
}

uint64_t protocol witness for static IntentValueTypeIdentifiable.lnValueType.getter in conformance SiriContactEntity(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F0C9E8](a1, WitnessTable);
}

uint64_t base witness table accessor for EntityPropertyWrappable in SiriContactEntity()
{
  return lazy protocol witness table accessor for type SiriContactEntity and conformance SiriContactEntity(&lazy protocol witness table cache variable for type SiriContactEntity and conformance SiriContactEntity);
}

uint64_t lazy protocol witness table accessor for type SiriContactEntity and conformance SiriContactEntity(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SiriContactEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for IntentValue.lnValue.getter in conformance SiriContactEntity()
{
  return CustomAppEntityRepresentationBase.lnValue.getter();
}

uint64_t protocol witness for static IntentValue.canConvert(_:) in conformance SiriContactEntity(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F0CBA8](a1, a2, WitnessTable);
}

uint64_t protocol witness for static IntentValue.from(_:context:) in conformance SiriContactEntity@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static CustomAppEntityRepresentationBase.from(_:context:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for OriginIdentifiable.origin.getter in conformance SiriContactEntity()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.origin.getter();
}

uint64_t protocol witness for TransferableExportable.exportedContent.getter in conformance SiriContactEntity()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.exportedContent.getter();
}

uint64_t type metadata completion function for SiriContactEntity()
{
  return swift_initClassMetadata2();
}

uint64_t ObjC metadata update function for SiriContactEntity()
{
  return type metadata accessor for SiriContactEntity();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return v0;
}

uint64_t Optional<A>.isNilOrEmpty.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  BOOL v3 = v2 == 0;
  return !a2 || v3;
}

uint64_t Optional<A>.emptyToNil.getter(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = a1;
  uint64_t v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3) {
    return 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t String.sanitizeCNLabel.getter()
{
  type metadata accessor for CharacterSet();
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5();
  CharacterSet.init(charactersIn:)();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.trimmingCharacters(in:)();
  uint64_t v5 = String.appleSafeLowercasedLabel.getter();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  return v5;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t static String.EMPTY.getter()
{
  return 0;
}

uint64_t String.appleSafeLowercasedLabel.getter()
{
  uint64_t v0 = 0x656E6F685069;
  Swift::String v1 = String.lowercased()();
  BOOL v2 = v1._countAndFlagsBits == 0x656E6F687069 && v1._object == (void *)0xE600000000000000;
  if (!v2 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v0 = 0x64756F6C4369;
    BOOL v3 = v1._countAndFlagsBits == 0x64756F6C6369 && v1._object == (void *)0xE600000000000000;
    if (!v3 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      return v1._countAndFlagsBits;
    }
  }
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t String.sanitizeCNLabelNonEmpty.getter()
{
  uint64_t v0 = String.sanitizeCNLabel.getter();
  unint64_t v2 = v1;
  swift_bridgeObjectRelease();
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = v0 & 0xFFFFFFFFFFFFLL;
  }
  if (v3) {
    return String.sanitizeCNLabel.getter();
  }
  else {
    return 32;
  }
}

uint64_t String.sanitizePhoneNumber.getter()
{
  type metadata accessor for CharacterSet();
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5();
  static CharacterSet.urlPathAllowed.getter();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
  uint64_t v6 = v5;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  if (v6) {
    return OUTLINED_FUNCTION_6_1();
  }
  __break(1u);
  return result;
}

unint64_t static String.facetimeAppID.getter()
{
  return OUTLINED_FUNCTION_2_4(18);
}

unint64_t static String.messagesAppID.getter()
{
  return OUTLINED_FUNCTION_2_4(19);
}

unint64_t static String.phoneAppID.getter()
{
  return OUTLINED_FUNCTION_2_4(21);
}

void one-time initialization function for phoneURLPrefix()
{
  static String.phoneURLPrefix = 980182388;
  *(void *)algn_26A5BE478 = 0xE400000000000000;
}

uint64_t static String.phoneURLPrefix.getter()
{
  if (one-time initialization token for phoneURLPrefix != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_6_1();
}

uint64_t static String.appName(for:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    objc_allocWithZone(MEMORY[0x263F01878]);
    swift_bridgeObjectRetain();
    uint64_t v2 = OUTLINED_FUNCTION_6_1();
    id v4 = @nonobjc LSApplicationRecord.init(bundleIdentifier:allowPlaceholder:)(v2, v3, 1);
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = objc_msgSend(v4, sel_localizedName);

      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
  }
  return OUTLINED_FUNCTION_6_1();
}

id @nonobjc LSApplicationRecord.init(bundleIdentifier:allowPlaceholder:)(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x26118E540]();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v6;
}

unint64_t OUTLINED_FUNCTION_2_4(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

unint64_t static SiriViewContactCardIntent.bundleIdentifier.getter()
{
  return 0xD00000000000001BLL;
}

unint64_t static SiriViewContactCardIntent.actionIdentifier.getter()
{
  return 0xD000000000000019;
}

uint64_t SiriViewContactCardIntent.init(contactIdentifiers:)@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentParameter<[String]?>);
  uint64_t v2 = swift_allocObject();
  *a1 = OUTLINED_FUNCTION_0_5(v2, v3, v4, v5, v6, v7, v8, v9, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentParameter<String?>);
  uint64_t v10 = swift_allocObject();
  a1[1] = OUTLINED_FUNCTION_0_5(v10, v11, v12, v13, v14, v15, v16, v17, 0);
  uint64_t v18 = swift_allocObject();
  a1[2] = OUTLINED_FUNCTION_0_5(v18, v19, v20, v21, v22, v23, v24, v25, 0);
  LOBYTE(v35) = 7;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentParameter<SiriHighlightedPropertyType?>);
  uint64_t v26 = swift_allocObject();
  a1[3] = OUTLINED_FUNCTION_0_5(v26, v27, v28, v29, v30, v31, v32, v33, v35);
  return IntentParameter.wrappedValue.setter();
}

unint64_t protocol witness for static AppIntentRepresentation.bundleIdentifier.getter in conformance SiriViewContactCardIntent()
{
  return 0xD00000000000001BLL;
}

unint64_t protocol witness for static AppIntentRepresentation.actionIdentifier.getter in conformance SiriViewContactCardIntent()
{
  return 0xD000000000000019;
}

uint64_t protocol witness for AppIntentRepresentation.exportToSpecification() in conformance SiriViewContactCardIntent()
{
  return MEMORY[0x270F0CA30]();
}

unint64_t instantiation function for generic protocol witness table for SiriViewContactCardIntent(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type SiriViewContactCardIntent and conformance SiriViewContactCardIntent();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type SiriViewContactCardIntent and conformance SiriViewContactCardIntent()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriViewContactCardIntent and conformance SiriViewContactCardIntent;
  if (!lazy protocol witness table cache variable for type SiriViewContactCardIntent and conformance SiriViewContactCardIntent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriViewContactCardIntent and conformance SiriViewContactCardIntent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SiriViewContactCardIntent and conformance SiriViewContactCardIntent;
  if (!lazy protocol witness table cache variable for type SiriViewContactCardIntent and conformance SiriViewContactCardIntent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriViewContactCardIntent and conformance SiriViewContactCardIntent);
  }
  return result;
}

uint64_t destroy for SiriViewContactCardIntent()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for SiriViewContactCardIntent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SiriViewContactCardIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for SiriViewContactCardIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriViewContactCardIntent(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for SiriViewContactCardIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriViewContactCardIntent()
{
  return &type metadata for SiriViewContactCardIntent;
}

uint64_t OUTLINED_FUNCTION_0_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return MEMORY[0x270F0CB10](&a9);
}

void static AppIntentTransformer.transformToAppIntent(snippetModel:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void (*v5)(long long *__return_ptr, uint64_t);
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  long long v14;
  long long v15;

  if (one-time initialization token for transformer != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<AppIntentTransformable, SiriContactsAppIntent?>);
  __swift_project_value_buffer(v4, (uint64_t)static Transformer<>.transformer);
  uint64_t v5 = (void (*)(long long *__return_ptr, uint64_t))Transformer.transform.getter();
  v5(&v14, a1);
  swift_release();
  if (*((void *)&v15 + 1))
  {
    outlined init with take of IDSStatusProviding(&v14, a2);
  }
  else
  {
    outlined destroy of SiriContactsAppIntent?((uint64_t)&v14);
    if (one-time initialization token for siriContacts != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Logger.siriContacts);
    outlined init with copy of IDSStatusProviding(a1, (uint64_t)&v14);
    uint64_t v7 = Logger.logObject.getter();
    uint64_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v13 = v10;
      *(_DWORD *)uint64_t v9 = 136315138;
      __swift_project_boxed_opaque_existential_1(&v14, *((uint64_t *)&v15 + 1));
      swift_getDynamicType();
      uint64_t v11 = _typeName(_:qualified:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v14);
      _os_log_impl(&dword_25C66B000, v7, v8, "#AppIntentTransformer transformToAppIntent failed to transform intent of type %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118F050](v10, -1, -1);
      MEMORY[0x26118F050](v9, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v14);
    }

    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
}

uint64_t one-time initialization function for transformer()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<AppIntentTransformable, SiriContactsAppIntent?>);
  __swift_allocate_value_buffer(v0, static Transformer<>.transformer);
  __swift_project_value_buffer(v0, (uint64_t)static Transformer<>.transformer);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AppIntentTransformable);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SiriContactsAppIntent?);
  return Transformer.init(transform:)();
}

uint64_t outlined destroy of SiriContactsAppIntent?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SiriContactsAppIntent?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t closure #1 in closure #1 in variable initialization expression of static Transformer<>.transformer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t ContactAttributeSnippetModel = type metadata accessor for GetContactAttributeSnippetModel(0);
  uint64_t v5 = MEMORY[0x270FA5388](ContactAttributeSnippetModel);
  uint64_t v7 = (void *)((char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v34 - v8;
  uint64_t ContactSnippetModel = type metadata accessor for GetContactSnippetModel(0);
  uint64_t v11 = MEMORY[0x270FA5388](ContactSnippetModel);
  uint64_t v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v34 - v14;
  outlined init with copy of IDSStatusProviding(a1, (uint64_t)v36);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AppIntentTransformable);
  if (swift_dynamicCast())
  {
    outlined init with take of GetContactAttributeSnippetModel((uint64_t)v15, (uint64_t)v13, type metadata accessor for GetContactSnippetModel);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_25C695EA0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    Loggable.wrappedValue.getter();
    id v17 = v35[0];
    id v18 = objc_msgSend(v35[0], sel_identifier);

    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v21 = v20;

    *(void *)(v16 + 32) = v19;
    *(void *)(v16 + 40) = v21;
    *(void *)(a2 + 24) = &type metadata for SiriViewContactCardIntent;
    *(void *)(a2 + 32) = lazy protocol witness table accessor for type SiriViewContactCardIntent and conformance SiriViewContactCardIntent();
    uint64_t v22 = swift_allocObject();
    *(void *)a2 = v22;
    SiriViewContactCardIntent.init(contactIdentifiers:)((uint64_t *)(v22 + 16));
    uint64_t v23 = (uint64_t)v13;
    uint64_t v24 = type metadata accessor for GetContactSnippetModel;
LABEL_5:
    outlined destroy of GetContactAttributeSnippetModel(v23, v24);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
  }
  if (swift_dynamicCast())
  {
    outlined init with take of GetContactAttributeSnippetModel((uint64_t)v9, (uint64_t)v7, type metadata accessor for GetContactAttributeSnippetModel);
    *(void *)(a2 + 24) = &type metadata for SiriViewContactCardIntent;
    *(void *)(a2 + 32) = lazy protocol witness table accessor for type SiriViewContactCardIntent and conformance SiriViewContactCardIntent();
    uint64_t v25 = swift_allocObject();
    *(void *)a2 = v25;
    static Transformer<>.intentFromAttributeModel(attributeModel:)(v7, (void *)(v25 + 16));
    uint64_t v23 = (uint64_t)v7;
    uint64_t v24 = type metadata accessor for GetContactAttributeSnippetModel;
    goto LABEL_5;
  }
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v26 = type metadata accessor for Logger();
  __swift_project_value_buffer(v26, (uint64_t)static Logger.siriContacts);
  outlined init with copy of IDSStatusProviding(a1, (uint64_t)v35);
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v37 = v30;
    *(_DWORD *)uint64_t v29 = 136315138;
    __swift_project_boxed_opaque_existential_1(v35, (uint64_t)v35[3]);
    swift_getDynamicType();
    uint64_t v31 = _typeName(_:qualified:)();
    v34[1] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
    _os_log_impl(&dword_25C66B000, v27, v28, "#AppIntentTransformer received unhandled intent type %s, returning nil", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26118F050](v30, -1, -1);
    MEMORY[0x26118F050](v29, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
  }

  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
}

void static Transformer<>.intentFromAttributeModel(attributeModel:)(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v57 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v51[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v56 = &v51[-v8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_25C695EA0;
  type metadata accessor for GetContactAttributeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  Loggable.wrappedValue.getter();
  id v10 = v59;
  id v11 = objc_msgSend(v59, sel_identifier);

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  *(void *)(v9 + 32) = v12;
  *(void *)(v9 + 40) = v14;
  SiriViewContactCardIntent.init(contactIdentifiers:)((uint64_t *)&v59);
  id v15 = v59;
  unint64_t v16 = v60;
  uint64_t v17 = v61;
  uint64_t v18 = v62;
  uint64_t v19 = *a1;
  uint64_t v20 = *(void *)(*a1 + 16);
  if (v20)
  {
    uint64_t v55 = a2;
    unint64_t v21 = *(void *)(v19 + 56);
    unint64_t v22 = *(void *)(v19 + 72);
    if (v20 == 1)
    {
      uint64_t v23 = *(void **)(v19 + 64);
      id v59 = *(id *)(v19 + 48);
      unint64_t v60 = v21;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      IntentParameter.wrappedValue.setter();
      id v59 = v23;
      unint64_t v60 = v22;
      swift_bridgeObjectRetain();
      IntentParameter.wrappedValue.setter();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (one-time initialization token for siriContacts != -1) {
        swift_once();
      }
      uint64_t v24 = __swift_project_value_buffer(v4, (uint64_t)static Logger.siriContacts);
      uint64_t v26 = v56;
      uint64_t v25 = v57;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v57 + 16))(v56, v24, v4);
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      uint64_t v27 = Logger.logObject.getter();
      os_log_type_t v28 = static os_log_type_t.debug.getter();
      int v29 = v28;
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v30 = swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        uint64_t v58 = v53;
        *(_DWORD *)uint64_t v30 = 136315394;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        os_log_type_t v54 = (void *)v4;
        int v52 = v29;
        IntentParameter.wrappedValue.getter();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        if (v60) {
          uint64_t v31 = (uint64_t)v59;
        }
        else {
          uint64_t v31 = 11565;
        }
        uint64_t v32 = v25;
        if (v60) {
          unint64_t v33 = v60;
        }
        else {
          unint64_t v33 = 0xE200000000000000;
        }
        id v59 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v33, &v58);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v30 + 12) = 2080;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        IntentParameter.wrappedValue.getter();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        if (v60) {
          uint64_t v34 = (uint64_t)v59;
        }
        else {
          uint64_t v34 = 11565;
        }
        if (v60) {
          unint64_t v35 = v60;
        }
        else {
          unint64_t v35 = 0xE200000000000000;
        }
        id v59 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v35, &v58);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C66B000, v27, (os_log_type_t)v52, "#AppIntentTransformer added highlightedValue %s | %s", (uint8_t *)v30, 0x16u);
        uint64_t v36 = v53;
        swift_arrayDestroy();
        MEMORY[0x26118F050](v36, -1, -1);
        MEMORY[0x26118F050](v30, -1, -1);

        (*(void (**)(unsigned char *, void *))(v32 + 8))(v56, v54);
      }
      else
      {

        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        (*(void (**)(unsigned char *, uint64_t))(v25 + 8))(v26, v4);
      }
    }
    else
    {
      unint64_t v40 = *(unsigned __int8 *)(v19 + 80);
      if (v40 >= 8) {
        char v41 = 6;
      }
      else {
        char v41 = 0x200060606010303uLL >> (8 * v40);
      }
      LOBYTE(v59) = v41;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      IntentParameter.wrappedValue.setter();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (one-time initialization token for siriContacts != -1) {
        swift_once();
      }
      uint64_t v42 = v4;
      uint64_t v43 = __swift_project_value_buffer(v4, (uint64_t)static Logger.siriContacts);
      uint64_t v44 = v57;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v57 + 16))(v7, v43, v4);
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      uint64_t v45 = Logger.logObject.getter();
      int v46 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v45, (os_log_type_t)v46))
      {
        LODWORD(v56) = v46;
        char v47 = (uint8_t *)swift_slowAlloc();
        os_log_type_t v54 = (void *)swift_slowAlloc();
        id v59 = v54;
        *(_DWORD *)char v47 = 136315138;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        IntentParameter.wrappedValue.getter();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        unint64_t v48 = 0xEB00000000726562;
        uint64_t v49 = 0x6D754E656E6F6870;
        switch((char)v58)
        {
          case 1:
            unint64_t v48 = 0xEC00000073736572;
            uint64_t v49 = 0x6464416C69616D65;
            break;
          case 2:
            unint64_t v48 = 0xED00007373657264;
            uint64_t v49 = 0x64416C6174736F70;
            break;
          case 3:
            unint64_t v48 = 0xE800000000000000;
            uint64_t v49 = 0x7961646874726962;
            break;
          case 4:
            unint64_t v48 = 0xEF6E6F6974616C65;
            uint64_t v49 = 0x52746361746E6F63;
            break;
          case 5:
            unint64_t v48 = 0xE400000000000000;
            uint64_t v49 = 1702129518;
            break;
          case 6:
            unint64_t v48 = 0xE600000000000000;
            uint64_t v49 = 0x6D6F74737563;
            break;
          case 7:
            unint64_t v48 = 0xE200000000000000;
            uint64_t v49 = 11565;
            break;
          default:
            break;
        }
        uint64_t v58 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v48, (uint64_t *)&v59);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C66B000, v45, (os_log_type_t)v56, "#AppIntentTransformer added highlightPropertyType %s", v47, 0xCu);
        uint64_t v50 = v54;
        swift_arrayDestroy();
        MEMORY[0x26118F050](v50, -1, -1);
        MEMORY[0x26118F050](v47, -1, -1);

        (*(void (**)(unsigned char *, uint64_t))(v57 + 8))(v7, v42);
      }
      else
      {

        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        (*(void (**)(unsigned char *, uint64_t))(v44 + 8))(v7, v42);
      }
    }
    a2 = v55;
  }
  else
  {
    if (one-time initialization token for siriContacts != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v4, (uint64_t)static Logger.siriContacts);
    uint64_t v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      char v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v39 = 0;
      _os_log_impl(&dword_25C66B000, v37, v38, "#AppIntentTransformer error: no attributes found!", v39, 2u);
      MEMORY[0x26118F050](v39, -1, -1);
    }
  }
  *a2 = v15;
  a2[1] = v16;
  a2[2] = v17;
  a2[3] = v18;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(void (*a1)(void))
{
  a1();
  return _typeName(_:qualified:)();
}

ValueMetadata *type metadata accessor for AppIntentTransformer()
{
  return &type metadata for AppIntentTransformer;
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

uint64_t sub_25C67D468()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t outlined init with take of GetContactAttributeSnippetModel(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of GetContactAttributeSnippetModel(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t PersonNameComponents.init(from:for:)(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PersonNameComponents?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  PersonNameComponents.init()();
  id v7 = objc_msgSend(a1, sel_namePrefix);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  PersonNameComponents.namePrefix.setter();
  id v8 = objc_msgSend(a1, sel_givenName);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  PersonNameComponents.givenName.setter();
  id v9 = objc_msgSend(a1, sel_middleName);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  PersonNameComponents.middleName.setter();
  id v10 = objc_msgSend(a1, sel_nickname);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  PersonNameComponents.nickname.setter();
  id v11 = objc_msgSend(a1, sel_familyName);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  PersonNameComponents.familyName.setter();
  id v12 = objc_msgSend(a1, sel_nameSuffix);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  PersonNameComponents.nameSuffix.setter();
  CNContact.getPhoneticRepresentation(locale:)(a2, (uint64_t)v6);
  PersonNameComponents.phoneticRepresentation.setter();

  return outlined destroy of Locale?(a2);
}

uint64_t outlined destroy of Locale?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return v0;
}

void OUTLINED_FUNCTION_1_5()
{
}

uint64_t CNLabeledValue<>.formattedString.getter()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB38]), sel_init);
  id v2 = objc_msgSend(v0, sel_value);
  id v3 = objc_msgSend(v1, sel_stringFromPostalAddress_, v2);

  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v4;
}

uint64_t one-time initialization function for siriContacts()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.siriContacts);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriContacts);
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t static Logger.siriContacts.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.siriContacts);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

void one-time initialization function for siriContacts()
{
  unk_26A5C5C95 = 0;
  unk_26A5C5C96 = -5120;
}

uint64_t static SABaseCommand.from(data:)()
{
  v29[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v29[0] = 0;
  id v2 = objc_msgSend(v0, sel_propertyListWithData_options_format_error_, isa, 0, 0, v29);

  if (!v2)
  {
    id v14 = v29[0];
    id v15 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for siriContacts != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)static Logger.siriContacts);
    id v17 = v15;
    id v18 = v15;
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (_DWORD *)swift_slowAlloc();
      v29[0] = (id)swift_slowAlloc();
      *unint64_t v21 = 136315138;
      swift_getErrorValue();
      uint64_t v22 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, (uint64_t *)v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_3_4(&dword_25C66B000, v24, v25, "#SABaseCommand from(data:) failed to deserialize input, returning nil with error: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {
    }
    return 0;
  }
  id v3 = v29[0];
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
  if (swift_dynamicCast())
  {
    uint64_t v4 = self;
    id v5 = outlined bridged method (mbnn) of @objc static AceObject.aceObject(with:)(v28, v4);
    if (v5)
    {
      uint64_t v6 = v5;
      self;
      uint64_t result = swift_dynamicCastObjCClass();
      if (result) {
        return result;
      }
    }
    if (one-time initialization token for siriContacts != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Logger.siriContacts);
    id v9 = (void *)Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (!OUTLINED_FUNCTION_1_6(v10)) {
      goto LABEL_19;
    }
    *(_WORD *)swift_slowAlloc() = 0;
    uint64_t v13 = "#SABaseCommand from(data:) failed to convert deserialized data to command, returning nil";
  }
  else
  {
    if (one-time initialization token for siriContacts != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)static Logger.siriContacts);
    id v9 = (void *)Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (!OUTLINED_FUNCTION_1_6(v27)) {
      goto LABEL_19;
    }
    *(_WORD *)swift_slowAlloc() = 0;
    uint64_t v13 = "#SABaseCommand from(data:) failed to deserialize input, returning nil";
  }
  OUTLINED_FUNCTION_2_5(&dword_25C66B000, v11, v12, v13);
  OUTLINED_FUNCTION_3();
LABEL_19:

  return 0;
}

uint64_t SAClientBoundCommand.data.getter()
{
  v24[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = objc_msgSend(v0, sel_dictionary);
  if (!v1)
  {
    if (one-time initialization token for siriContacts != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Logger.siriContacts);
    id v7 = (void *)Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_1_6(v8))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_2_5(&dword_25C66B000, v9, v10, "#SAClientBoundCommand data could not obtain necessary info to serialize, returning empty object");
      OUTLINED_FUNCTION_3();
    }

    return 0;
  }
  id v2 = v1;
  v24[0] = 0;
  id v3 = objc_msgSend(self, sel_dataWithPropertyList_format_options_error_, v1, 200, 0, v24);
  id v4 = v24[0];
  if (!v3)
  {
    uint64_t v11 = v4;
    uint64_t v12 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for siriContacts != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)static Logger.siriContacts);
    id v14 = v12;
    id v15 = v12;
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (_DWORD *)swift_slowAlloc();
      v24[0] = (id)swift_slowAlloc();
      _DWORD *v18 = 136315138;
      swift_getErrorValue();
      uint64_t v19 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, (uint64_t *)v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_3_4(&dword_25C66B000, v21, v22, "#SAClientBoundCommand data failed to serialize command, returning empty object with error: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {
    }
    return 0;
  }
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

id outlined bridged method (mbnn) of @objc static AceObject.aceObject(with:)(uint64_t a1, void *a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(a2, sel_aceObjectWithDictionary_, isa);

  return v4;
}

BOOL OUTLINED_FUNCTION_1_6(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_2_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_3_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t specialized SAClientBoundCommand.data.getter()
{
  v22[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = objc_msgSend(v0, sel_dictionary);
  if (!v1)
  {
    if (one-time initialization token for siriContacts != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Logger.siriContacts);
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25C66B000, v7, v8, "#SAClientBoundCommand data could not obtain necessary info to serialize, returning empty object", v9, 2u);
      MEMORY[0x26118F050](v9, -1, -1);
    }

    return 0;
  }
  uint64_t v2 = v1;
  v22[0] = 0;
  id v3 = objc_msgSend(self, sel_dataWithPropertyList_format_options_error_, v1, 200, 0, v22);
  id v4 = v22[0];
  if (!v3)
  {
    uint64_t v10 = v4;
    uint64_t v11 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for siriContacts != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)static Logger.siriContacts);
    id v13 = v11;
    id v14 = v11;
    id v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      id v18 = (void *)swift_slowAlloc();
      v22[0] = v18;
      *(_DWORD *)os_log_type_t v17 = 136315138;
      swift_getErrorValue();
      uint64_t v19 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, (uint64_t *)v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C66B000, v15, v16, "#SAClientBoundCommand data failed to serialize command, returning empty object with error: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118F050](v18, -1, -1);
      MEMORY[0x26118F050](v17, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

uint64_t GetContactDirectInvocationsModel.contactCardPunchout.getter()
{
  uint64_t v1 = *(void *)v0;
  outlined copy of Data?(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined copy of Data._Representation(a1, a2);
  }
  return a1;
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

uint64_t GetContactDirectInvocationsModel.sendEmailPunchouts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GetContactDirectInvocationsModel.sendMessagePunchouts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GetContactDirectInvocationsModel.navigationPunchouts.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 GetContactDirectInvocationsModel.init()@<Q0>(uint64_t a1@<X8>)
{
  type metadata accessor for SAUIAppPunchOut();
  uint64_t v2 = OUTLINED_FUNCTION_9_3();
  uint64_t v3 = OUTLINED_FUNCTION_9_3();
  uint64_t v4 = OUTLINED_FUNCTION_9_3();
  GetContactDirectInvocationsModel.init(contactCardPunchout:sendEmailPunchouts:sendMessagePunchouts:navigationPunchouts:)(0, 0xF000000000000000, v2, v3, v4, (uint64_t *)v7);
  uint64_t v5 = v8;
  __n128 result = (__n128)v7[1];
  *(_OWORD *)a1 = v7[0];
  *(__n128 *)(a1 + 16) = result;
  *(void *)(a1 + 32) = v5;
  return result;
}

unint64_t type metadata accessor for SAUIAppPunchOut()
{
  unint64_t result = lazy cache variable for type metadata for SAUIAppPunchOut;
  if (!lazy cache variable for type metadata for SAUIAppPunchOut)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SAUIAppPunchOut);
  }
  return result;
}

uint64_t GetContactDirectInvocationsModel.init(contactCardPunchout:sendEmailPunchouts:sendMessagePunchouts:navigationPunchouts:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v114 = a5;
  uint64_t v115 = a4;
  uint64_t v109 = a1;
  uint64_t v110 = a2;
  v111 = a6;
  uint64_t v9 = 0;
  uint64_t v117 = a3;
  uint64_t v12 = *(void *)(a3 + 64);
  uint64_t v10 = a3 + 64;
  uint64_t v11 = v12;
  uint64_t v13 = 1 << *(unsigned char *)(v10 - 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  uint64_t v112 = v10;
  unint64_t v113 = (unint64_t)(v13 + 63) >> 6;
  id v15 = (void *)MEMORY[0x263F8EE80];
  if ((v14 & v11) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  OUTLINED_FUNCTION_3_5();
  while (1)
  {
    OUTLINED_FUNCTION_13_1();
    id v23 = v6;
    uint64_t v6 = (void *)specialized SAClientBoundCommand.data.getter();
    uint64_t v25 = v24;
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v26 = specialized __RawDictionaryStorage.find<A>(_:)(v7, v8);
    if (__OFADD__(v15[2], (v27 & 1) == 0))
    {
      __break(1u);
      goto LABEL_98;
    }
    unint64_t v28 = v26;
    char v29 = v27;
    int v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Data>);
    if (OUTLINED_FUNCTION_16_0(v30, v31, v32, v33, v34, v35, v36, v37, v108, v109, v110, (uint64_t)v111, v112, v113, v114, v115, v117, v119, v120,
           (char)v15))
    {
      specialized __RawDictionaryStorage.find<A>(_:)(v7, v8);
      OUTLINED_FUNCTION_12_1();
      if (!v39) {
        goto LABEL_109;
      }
      unint64_t v28 = v38;
    }
    id v15 = v121;
    if (v29)
    {
      uint64_t v40 = v121[7] + 16 * v28;
      outlined consume of Data._Representation(*(void *)v40, *(void *)(v40 + 8));
      *(void *)uint64_t v40 = v6;
      *(void *)(v40 + 8) = v25;
    }
    else
    {
      OUTLINED_FUNCTION_6_4((uint64_t)&v121[v28 >> 6]);
      char v41 = (uint64_t *)(v121[6] + 16 * v28);
      uint64_t *v41 = v7;
      v41[1] = v8;
      uint64_t v42 = (void *)(v121[7] + 16 * v28);
      *uint64_t v42 = v6;
      v42[1] = v25;
      uint64_t v43 = v121[2];
      BOOL v17 = __OFADD__(v43, 1);
      uint64_t v44 = v43 + 1;
      if (v17) {
        goto LABEL_100;
      }
      v121[2] = v44;
      swift_bridgeObjectRetain();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = v120;
    if (v119) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v9, 1)) {
      goto LABEL_103;
    }
    OUTLINED_FUNCTION_11_1();
    if (v16 == v17) {
      goto LABEL_34;
    }
    OUTLINED_FUNCTION_15_0();
    if (!v18)
    {
      OUTLINED_FUNCTION_7_3();
      if (v16 == v17) {
        goto LABEL_34;
      }
      OUTLINED_FUNCTION_10_2();
      if (!v19)
      {
        OUTLINED_FUNCTION_7_3();
        if (v16 == v17) {
          goto LABEL_34;
        }
        OUTLINED_FUNCTION_10_2();
        if (!v20)
        {
          OUTLINED_FUNCTION_11_1();
          if (v16 == v17)
          {
LABEL_34:
            swift_release();
            OUTLINED_FUNCTION_0_7();
            int v46 = (void *)MEMORY[0x263F8EE80];
            uint64_t v118 = (uint64_t)v15;
            if (!v47) {
              goto LABEL_36;
            }
LABEL_35:
            OUTLINED_FUNCTION_3_5();
            while (1)
            {
              OUTLINED_FUNCTION_13_1();
              id v53 = v6;
              uint64_t v6 = (void *)specialized SAClientBoundCommand.data.getter();
              uint64_t v55 = v54;
              swift_isUniquelyReferenced_nonNull_native();
              unint64_t v56 = specialized __RawDictionaryStorage.find<A>(_:)(v7, v8);
              if (__OFADD__(v46[2], (v57 & 1) == 0)) {
                break;
              }
              unint64_t v58 = v56;
              char v59 = v57;
              int v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Data>);
              BOOL v68 = OUTLINED_FUNCTION_16_0(v60, v61, v62, v63, v64, v65, v66, v67, v108, v109, v110, (uint64_t)v111, v112, v113, v114, v115, v118, v119, v120,
                      (char)v46);
              id v15 = (void *)v118;
              if (v68)
              {
                specialized __RawDictionaryStorage.find<A>(_:)(v7, v8);
                OUTLINED_FUNCTION_12_1();
                if (!v39) {
                  goto LABEL_109;
                }
                unint64_t v58 = v69;
              }
              int v46 = v122;
              if (v59)
              {
                uint64_t v70 = v122[7] + 16 * v58;
                outlined consume of Data._Representation(*(void *)v70, *(void *)(v70 + 8));
                *(void *)uint64_t v70 = v6;
                *(void *)(v70 + 8) = v55;
              }
              else
              {
                OUTLINED_FUNCTION_6_4((uint64_t)&v122[v58 >> 6]);
                v71 = (uint64_t *)(v122[6] + 16 * v58);
                uint64_t *v71 = v7;
                v71[1] = v8;
                v72 = (void *)(v122[7] + 16 * v58);
                void *v72 = v6;
                v72[1] = v55;
                uint64_t v73 = v122[2];
                BOOL v17 = __OFADD__(v73, 1);
                uint64_t v74 = v73 + 1;
                if (v17) {
                  goto LABEL_101;
                }
                v122[2] = v74;
                swift_bridgeObjectRetain();
              }

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v45 = v120;
              if (v119) {
                goto LABEL_35;
              }
LABEL_36:
              if (__OFADD__(v45, 1)) {
                goto LABEL_104;
              }
              OUTLINED_FUNCTION_11_1();
              if (v16 == v17)
              {
LABEL_65:
                swift_release();
                OUTLINED_FUNCTION_0_7();
                v76 = (void *)MEMORY[0x263F8EE80];
                v116 = v46;
                if (!v77) {
                  goto LABEL_67;
                }
LABEL_66:
                OUTLINED_FUNCTION_3_5();
                while (1)
                {
                  v84 = (uint64_t *)(*(void *)(v114 + 48) + 16 * v78);
                  uint64_t v85 = *v84;
                  uint64_t v86 = v84[1];
                  v87 = *(void **)(*(void *)(v114 + 56) + 8 * v78);
                  swift_bridgeObjectRetain();
                  id v88 = v87;
                  uint64_t v89 = specialized SAClientBoundCommand.data.getter();
                  uint64_t v91 = v90;
                  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  v123 = v76;
                  unint64_t v93 = specialized __RawDictionaryStorage.find<A>(_:)(v85, v86);
                  uint64_t v95 = v76[2];
                  BOOL v96 = (v94 & 1) == 0;
                  Swift::Int v97 = v95 + v96;
                  if (__OFADD__(v95, v96)) {
                    goto LABEL_99;
                  }
                  unint64_t v98 = v93;
                  char v99 = v94;
                  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Data>);
                  Swift::Bool v100 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v97);
                  id v15 = (void *)v118;
                  if (v100)
                  {
                    specialized __RawDictionaryStorage.find<A>(_:)(v85, v86);
                    OUTLINED_FUNCTION_12_1();
                    if (!v39) {
                      goto LABEL_109;
                    }
                    unint64_t v98 = v101;
                  }
                  v76 = v123;
                  if (v99)
                  {
                    uint64_t v102 = v123[7] + 16 * v98;
                    outlined consume of Data._Representation(*(void *)v102, *(void *)(v102 + 8));
                    *(void *)uint64_t v102 = v89;
                    *(void *)(v102 + 8) = v91;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_6_4((uint64_t)&v123[v98 >> 6]);
                    v103 = (uint64_t *)(v123[6] + 16 * v98);
                    uint64_t *v103 = v85;
                    v103[1] = v86;
                    v104 = (uint64_t *)(v123[7] + 16 * v98);
                    uint64_t *v104 = v89;
                    v104[1] = v91;
                    uint64_t v105 = v123[2];
                    BOOL v17 = __OFADD__(v105, 1);
                    uint64_t v106 = v105 + 1;
                    if (v17) {
                      goto LABEL_102;
                    }
                    v123[2] = v106;
                    swift_bridgeObjectRetain();
                  }

                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  int v46 = v116;
                  uint64_t v75 = v120;
                  if (v119) {
                    goto LABEL_66;
                  }
LABEL_67:
                  if (__OFADD__(v75, 1)) {
                    goto LABEL_105;
                  }
                  OUTLINED_FUNCTION_11_1();
                  if (v16 == v17)
                  {
LABEL_96:
                    uint64_t result = swift_release();
                    uint64_t *v111 = v109;
                    v111[1] = v110;
                    v111[2] = (uint64_t)v15;
                    v111[3] = (uint64_t)v46;
                    v111[4] = (uint64_t)v76;
                    return result;
                  }
                  OUTLINED_FUNCTION_15_0();
                  if (!v79)
                  {
                    OUTLINED_FUNCTION_7_3();
                    if (v16 == v17) {
                      goto LABEL_96;
                    }
                    OUTLINED_FUNCTION_10_2();
                    if (!v80)
                    {
                      OUTLINED_FUNCTION_7_3();
                      if (v16 == v17) {
                        goto LABEL_96;
                      }
                      OUTLINED_FUNCTION_10_2();
                      if (!v81)
                      {
                        OUTLINED_FUNCTION_11_1();
                        if (v16 == v17) {
                          goto LABEL_96;
                        }
                        if (!*(void *)(v112 + 8 * v82))
                        {
                          while (!__OFADD__(v82, 1))
                          {
                            OUTLINED_FUNCTION_7_3();
                            if (v16 == v17) {
                              goto LABEL_96;
                            }
                            OUTLINED_FUNCTION_14_1();
                            if (v83) {
                              goto LABEL_84;
                            }
                          }
                          goto LABEL_108;
                        }
                      }
                    }
                  }
LABEL_84:
                  OUTLINED_FUNCTION_4_4();
                }
              }
              OUTLINED_FUNCTION_15_0();
              if (!v48)
              {
                OUTLINED_FUNCTION_7_3();
                if (v16 == v17) {
                  goto LABEL_65;
                }
                OUTLINED_FUNCTION_10_2();
                if (!v49)
                {
                  OUTLINED_FUNCTION_7_3();
                  if (v16 == v17) {
                    goto LABEL_65;
                  }
                  OUTLINED_FUNCTION_10_2();
                  if (!v50)
                  {
                    OUTLINED_FUNCTION_11_1();
                    if (v16 == v17) {
                      goto LABEL_65;
                    }
                    if (!*(void *)(v112 + 8 * v51))
                    {
                      while (!__OFADD__(v51, 1))
                      {
                        OUTLINED_FUNCTION_7_3();
                        if (v16 == v17) {
                          goto LABEL_65;
                        }
                        OUTLINED_FUNCTION_14_1();
                        if (v52) {
                          goto LABEL_53;
                        }
                      }
                      goto LABEL_107;
                    }
                  }
                }
              }
LABEL_53:
              OUTLINED_FUNCTION_4_4();
            }
LABEL_98:
            __break(1u);
LABEL_99:
            __break(1u);
LABEL_100:
            __break(1u);
LABEL_101:
            __break(1u);
LABEL_102:
            __break(1u);
LABEL_103:
            __break(1u);
LABEL_104:
            __break(1u);
LABEL_105:
            __break(1u);
            goto LABEL_106;
          }
          if (!*(void *)(v112 + 8 * v21)) {
            break;
          }
        }
      }
    }
LABEL_22:
    OUTLINED_FUNCTION_4_4();
  }
  while (!__OFADD__(v21, 1))
  {
    OUTLINED_FUNCTION_7_3();
    if (v16 == v17) {
      goto LABEL_34;
    }
    OUTLINED_FUNCTION_14_1();
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_106:
  __break(1u);
LABEL_107:
  __break(1u);
LABEL_108:
  __break(1u);
LABEL_109:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t GetContactDirectInvocationsModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000025C6992F0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025C699310 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025C699330 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025C699350)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t GetContactDirectInvocationsModel.CodingKeys.init(intValue:)()
{
  return 4;
}

unint64_t GetContactDirectInvocationsModel.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance GetContactDirectInvocationsModel.CodingKeys()
{
  return GetContactDirectInvocationsModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GetContactDirectInvocationsModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = GetContactDirectInvocationsModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GetContactDirectInvocationsModel.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = GetContactDirectInvocationsModel.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GetContactDirectInvocationsModel.CodingKeys(uint64_t a1)
{
  unint64_t ContactDirectInvocations = lazy protocol witness table accessor for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, ContactDirectInvocations);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GetContactDirectInvocationsModel.CodingKeys(uint64_t a1)
{
  unint64_t ContactDirectInvocations = lazy protocol witness table accessor for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, ContactDirectInvocations);
}

uint64_t GetContactDirectInvocationsModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GetContactDirectInvocationsModel.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v1;
  uint64_t v9 = v1[1];
  uint64_t v11 = v1[2];
  uint64_t v17 = v1[3];
  uint64_t v18 = v11;
  uint64_t v16 = v1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v20 = v10;
  uint64_t v21 = v9;
  char v22 = 0;
  lazy protocol witness table accessor for type Data and conformance Data();
  uint64_t v12 = v19;
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (!v12)
  {
    uint64_t v13 = v16;
    uint64_t v14 = v17;
    uint64_t v20 = v18;
    char v22 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Data]);
    lazy protocol witness table accessor for type [String : Data] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : Data] and conformance <> [A : B], (void (*)(void))lazy protocol witness table accessor for type Data and conformance Data);
    OUTLINED_FUNCTION_2_6();
    uint64_t v20 = v14;
    char v22 = 2;
    OUTLINED_FUNCTION_2_6();
    uint64_t v20 = v13;
    char v22 = 3;
    OUTLINED_FUNCTION_2_6();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

uint64_t GetContactDirectInvocationsModel.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GetContactDirectInvocationsModel.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  lazy protocol witness table accessor for type Data and conformance Data();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Data]);
  outlined copy of Data?(v9, v10);
  lazy protocol witness table accessor for type [String : Data] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : Data] and conformance <> [A : B], (void (*)(void))lazy protocol witness table accessor for type Data and conformance Data);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_8_4();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_8_4();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v7 = OUTLINED_FUNCTION_1_7();
  v8(v7);
  outlined copy of Data?(v9, v10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  outlined consume of Data?(v9, v10);
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v9;
  a2[3] = v9;
  a2[4] = v9;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  outlined consume of Data?(v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GetContactDirectInvocationsModel@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return GetContactDirectInvocationsModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GetContactDirectInvocationsModel(void *a1)
{
  return GetContactDirectInvocationsModel.encode(to:)(a1);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
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
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t lazy protocol witness table accessor for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t destroy for GetContactDirectInvocationsModel(uint64_t *a1)
{
  unint64_t v1 = a1[1];
  if (v1 >> 60 != 15) {
    outlined consume of Data._Representation(*a1, v1);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GetContactDirectInvocationsModel(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v5 = *a2;
    outlined copy of Data._Representation(*a2, a2[1]);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
  }
  uint64_t v6 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for GetContactDirectInvocationsModel(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      uint64_t v6 = *a2;
      outlined copy of Data._Representation(*a2, a2[1]);
      uint64_t v7 = *a1;
      unint64_t v8 = a1[1];
      *a1 = v6;
      a1[1] = v4;
      outlined consume of Data._Representation(v7, v8);
      goto LABEL_8;
    }
    outlined destroy of Data((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v5 = *a2;
  outlined copy of Data._Representation(*a2, a2[1]);
  *a1 = v5;
  a1[1] = v4;
LABEL_8:
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t outlined destroy of Data(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *assignWithTake for GetContactDirectInvocationsModel(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    unint64_t v5 = a2[1];
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      outlined consume of Data._Representation(v6, v4);
      goto LABEL_6;
    }
    outlined destroy of Data((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactDirectInvocationsModel(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for GetContactDirectInvocationsModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GetContactDirectInvocationsModel()
{
  return &type metadata for GetContactDirectInvocationsModel;
}

uint64_t getEnumTagSinglePayload for GetContactDirectInvocationsModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for GetContactDirectInvocationsModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x25C67FD00);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

void *type metadata accessor for GetContactDirectInvocationsModel.CodingKeys()
{
  return &unk_2709C9828;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

void OUTLINED_FUNCTION_6_4(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= 1 << v1;
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_16_0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(v20, v21);
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(uint64_t a1)
{
  return specialized RawRepresentable<>.hashValue.getter(a1, (void (*)(unsigned char *, uint64_t))specialized RawRepresentable<>.hash(into:));
}

{
  return specialized RawRepresentable<>.hashValue.getter(a1, (void (*)(unsigned char *, uint64_t))specialized RawRepresentable<>.hash(into:));
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  OUTLINED_FUNCTION_56();
  a2(v5, a1);
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

{
  uint64_t vars8;

  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

{
  uint64_t vars8;

  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, uint64_t a2)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, a2, (void (*)(unsigned char *, uint64_t))specialized RawRepresentable<>.hash(into:));
}

{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, a2, (void (*)(unsigned char *, uint64_t))specialized RawRepresentable<>.hash(into:));
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  Hasher.init(_seed:)();
  a3(v6, a2);
  return Hasher._finalize()();
}

uint64_t GetContactSnippetModel.contactIdentifier.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  Loggable.wrappedValue.getter();
  id v0 = objc_msgSend(v2, sel_identifier);

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  return OUTLINED_FUNCTION_93();
}

uint64_t GetContactAttributeSnippetModel.contactIdentifier.getter()
{
  OUTLINED_FUNCTION_42();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  Loggable.wrappedValue.getter();
  id v0 = objc_msgSend(v2, sel_identifier);

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  return OUTLINED_FUNCTION_93();
}

unint64_t static ContactsSnippetPluginModel.bundleName.getter()
{
  return 0xD000000000000014;
}

uint64_t ContactsSnippetPluginModel.responseViewID.getter()
{
  uint64_t v3 = v1;
  type metadata accessor for ModifyContactAttributeSnippetModel(0);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v4);
  unsigned int v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ContactAttributeSnippetModel = type metadata accessor for GetContactAttributeSnippetModel(0);
  MEMORY[0x270FA5388](ContactAttributeSnippetModel - 8);
  uint64_t v8 = OUTLINED_FUNCTION_6_2();
  type metadata accessor for ContactsSnippetPluginModel(v8);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_22();
  outlined init with copy of ContactsSnippetPluginModel(v3, v2, (void (*)(void))type metadata accessor for ContactsSnippetPluginModel);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      outlined init with take of ModifyContactAttributeSnippetModel(v2, v0, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
      if (*(void *)(*(void *)v0 + 16))
      {
        switch(*(unsigned char *)(*(void *)v0 + 80))
        {
          case 1:
            outlined destroy of ModifyContactAttributeSnippetModel(v0, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
            OUTLINED_FUNCTION_35();
            uint64_t v12 = v29 | 1;
            break;
          case 2:
            outlined destroy of ModifyContactAttributeSnippetModel(v0, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
            OUTLINED_FUNCTION_35();
            uint64_t v12 = v30 - 2;
            break;
          case 3:
          case 4:
            outlined destroy of ModifyContactAttributeSnippetModel(v0, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
            OUTLINED_FUNCTION_35();
            uint64_t v12 = v11 - 3;
            break;
          case 5:
          case 7:
            uint64_t v12 = 0xD00000000000002CLL;
            outlined destroy of ModifyContactAttributeSnippetModel(v0, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
            break;
          case 6:
            outlined destroy of ModifyContactAttributeSnippetModel(v0, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
            OUTLINED_FUNCTION_35();
            uint64_t v12 = v31 + 4;
            break;
          case 8:
            if (one-time initialization token for siriContacts != -1) {
              swift_once();
            }
            uint64_t v32 = type metadata accessor for Logger();
            __swift_project_value_buffer(v32, (uint64_t)static Logger.siriContacts);
            Swift::Int v21 = Logger.logObject.getter();
            os_log_type_t v22 = static os_log_type_t.error.getter();
            if (!os_log_type_enabled(v21, v22)) {
              goto LABEL_21;
            }
            id v23 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v23 = 0;
            uint64_t v24 = "#GetContactAttributeSnippetModel responseViewID unknown configuration, returning nil";
            goto LABEL_20;
          default:
            outlined destroy of ModifyContactAttributeSnippetModel(v0, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
            OUTLINED_FUNCTION_35();
            uint64_t v12 = v28 - 4;
            break;
        }
      }
      else
      {
        if (one-time initialization token for siriContacts != -1) {
          swift_once();
        }
        uint64_t v20 = type metadata accessor for Logger();
        __swift_project_value_buffer(v20, (uint64_t)static Logger.siriContacts);
        Swift::Int v21 = Logger.logObject.getter();
        os_log_type_t v22 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v21, v22))
        {
          id v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v23 = 0;
          uint64_t v24 = "#GetContactAttributeSnippetModel responseViewID unexpected configuration, returning nil";
LABEL_20:
          _os_log_impl(&dword_25C66B000, v21, v22, v24, v23, 2u);
          MEMORY[0x26118F050](v23, -1, -1);
        }
LABEL_21:

        outlined destroy of ModifyContactAttributeSnippetModel(v0, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
        return 0;
      }
    }
    else
    {
      outlined init with take of ModifyContactAttributeSnippetModel(v2, (uint64_t)v6, (void (*)(void))type metadata accessor for ModifyContactAttributeSnippetModel);
      OUTLINED_FUNCTION_83();
      BOOL v15 = v15 || v14 == 0x7000000000000000;
      if (v15)
      {
        int v16 = v6[16];
        outlined destroy of ModifyContactAttributeSnippetModel((uint64_t)v6, (void (*)(void))type metadata accessor for ModifyContactAttributeSnippetModel);
        OUTLINED_FUNCTION_35();
        uint64_t v18 = v17 + 6;
        uint64_t v19 = v17 + 10;
        if (v16) {
          return v19;
        }
        else {
          return v18;
        }
      }
      else
      {
        int v25 = v6[16];
        outlined destroy of ModifyContactAttributeSnippetModel((uint64_t)v6, (void (*)(void))type metadata accessor for ModifyContactAttributeSnippetModel);
        OUTLINED_FUNCTION_35();
        if (v25) {
          return v26 + 4;
        }
        else {
          return v26;
        }
      }
    }
  }
  else
  {
    outlined destroy of ModifyContactAttributeSnippetModel(v2, (void (*)(void))type metadata accessor for GetContactSnippetModel);
    OUTLINED_FUNCTION_35();
    return v13 - 12;
  }
  return v12;
}

uint64_t ContactsSnippetPluginModel.snippetHidden(for:idiom:)(uint64_t a1, char a2)
{
  uint64_t v5 = v2;
  type metadata accessor for DeviceIdiom();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v7);
  type metadata accessor for ModifyContactAttributeSnippetModel(0);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5();
  type metadata accessor for ContactsSnippetPluginModel(0);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_12_2();
  outlined init with copy of ContactsSnippetPluginModel(v5, v4, (void (*)(void))type metadata accessor for ContactsSnippetPluginModel);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    outlined init with take of ModifyContactAttributeSnippetModel(v4, v3, (void (*)(void))type metadata accessor for ModifyContactAttributeSnippetModel);
    uint64_t v10 = OUTLINED_FUNCTION_45();
    v11(v10);
    static DeviceIdiom.== infix(_:_:)();
    uint64_t v12 = OUTLINED_FUNCTION_57();
    v13(v12);
    if (a2)
    {
      OUTLINED_FUNCTION_83();
      BOOL v15 = v15 || v14 == 0x7000000000000000;
      a2 = v15;
    }
    else
    {
      a2 = 0;
    }
    uint64_t v20 = type metadata accessor for ModifyContactAttributeSnippetModel;
    uint64_t v21 = v3;
  }
  else
  {
    uint64_t v16 = OUTLINED_FUNCTION_45();
    v17(v16);
    static DeviceIdiom.== infix(_:_:)();
    uint64_t v18 = OUTLINED_FUNCTION_57();
    v19(v18);
    uint64_t v20 = type metadata accessor for ContactsSnippetPluginModel;
    uint64_t v21 = v4;
  }
  outlined destroy of ModifyContactAttributeSnippetModel(v21, (void (*)(void))v20);
  return a2 & 1;
}

uint64_t ContactsSnippetPluginModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x61746E6F43746567 && a2 == 0xEA00000000007463;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025C699640 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000025C699660)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t ContactsSnippetPluginModel.CodingKeys.stringValue.getter(char a1)
{
  if (!a1) {
    return 0x61746E6F43746567;
  }
  if (a1 == 1) {
    return 0xD000000000000013;
  }
  return 0xD000000000000016;
}

uint64_t static ContactsSnippetPluginModel.GetContactCodingKeys.== infix(_:_:)()
{
  return 1;
}

void ContactsSnippetPluginModel.GetContactCodingKeys.hash(into:)()
{
}

uint64_t ContactsSnippetPluginModel.GetContactCodingKeys.stringValue.getter()
{
  return 0x6C65646F6DLL;
}

uint64_t ContactsSnippetPluginModel.GetContactAttributeCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ContactsSnippetPluginModel.CodingKeys()
{
  return ContactsSnippetPluginModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsSnippetPluginModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ContactsSnippetPluginModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetPluginModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetPluginModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys()
{
  return ContactsSnippetPluginModel.GetContactAttributeCodingKeys.hashValue.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys(uint64_t a1)
{
  unint64_t ContactAttributeCodingKeys = lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys();
  return MEMORY[0x270FA00B0](a1, ContactAttributeCodingKeys);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys(uint64_t a1)
{
  unint64_t ContactAttributeCodingKeys = lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys();
  return MEMORY[0x270FA00B8](a1, ContactAttributeCodingKeys);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsSnippetPluginModel.GetContactCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ContactsSnippetPluginModel.GetContactAttributeCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetPluginModel.GetContactCodingKeys(uint64_t a1)
{
  unint64_t ContactCodingKeys = lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys();
  return MEMORY[0x270FA00B0](a1, ContactCodingKeys);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetPluginModel.GetContactCodingKeys(uint64_t a1)
{
  unint64_t ContactCodingKeys = lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys();
  return MEMORY[0x270FA00B8](a1, ContactCodingKeys);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ContactsSnippetPluginModel.encode(to:)()
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v31 = v1;
  char v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_5(v6, v26);
  type metadata accessor for ModifyContactAttributeSnippetModel(0);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_51(v8, v27);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetPluginModel.GetContactAttributeCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_52(v10, v28);
  type metadata accessor for GetContactAttributeSnippetModel(0);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5_4();
  uint64_t v29 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetPluginModel.GetContactCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = OUTLINED_FUNCTION_5_2();
  type metadata accessor for GetContactSnippetModel(v14);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_12_2();
  type metadata accessor for ContactsSnippetPluginModel(0);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_15_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetPluginModel.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v32 = v17;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_9_1();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  outlined init with copy of ContactsSnippetPluginModel(v31, v0, (void (*)(void))type metadata accessor for ContactsSnippetPluginModel);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v19 = type metadata accessor for GetContactAttributeSnippetModel;
      uint64_t v20 = v29;
      outlined init with take of ModifyContactAttributeSnippetModel(v0, v29, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
      lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys();
      OUTLINED_FUNCTION_18_0();
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel and conformance GetContactAttributeSnippetModel);
    }
    else
    {
      uint64_t v19 = type metadata accessor for ModifyContactAttributeSnippetModel;
      uint64_t v20 = v30;
      outlined init with take of ModifyContactAttributeSnippetModel(v0, v30, (void (*)(void))type metadata accessor for ModifyContactAttributeSnippetModel);
      lazy protocol witness table accessor for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys();
      OUTLINED_FUNCTION_18_0();
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel);
    }
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    OUTLINED_FUNCTION_88();
    OUTLINED_FUNCTION_1_8();
    v25();
    outlined destroy of ModifyContactAttributeSnippetModel(v20, (void (*)(void))v19);
    uint64_t v22 = OUTLINED_FUNCTION_87();
  }
  else
  {
    outlined init with take of ModifyContactAttributeSnippetModel(v0, v2, (void (*)(void))type metadata accessor for GetContactSnippetModel);
    lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys();
    OUTLINED_FUNCTION_18_0();
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactSnippetModel and conformance GetContactSnippetModel);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    OUTLINED_FUNCTION_1_8();
    v21();
    outlined destroy of ModifyContactAttributeSnippetModel(v2, (void (*)(void))type metadata accessor for GetContactSnippetModel);
    uint64_t v22 = OUTLINED_FUNCTION_90();
    uint64_t v24 = v32;
  }
  v23(v22, v24);
  OUTLINED_FUNCTION_3_6();
}

void ContactsSnippetPluginModel.init(from:)()
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v78 = v0;
  char v3 = v2;
  uint64_t v74 = v4;
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v70 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_50(v7, v62);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetPluginModel.GetContactAttributeCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v69 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_53(v10, v62);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetPluginModel.GetContactCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v68 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_6_5(v13, v62);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetPluginModel.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v75 = v15;
  uint64_t v76 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = OUTLINED_FUNCTION_54();
  uint64_t v17 = type metadata accessor for ContactsSnippetPluginModel(v16);
  OUTLINED_FUNCTION_8_5();
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v62 - v23;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v62 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v62 - v28;
  uint64_t v77 = v3;
  OUTLINED_FUNCTION_84(v3);
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys();
  uint64_t v30 = v78;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v30)
  {
    int v63 = v24;
    int v64 = v29;
    int v65 = v27;
    int v66 = v21;
    uint64_t v32 = v76;
    uint64_t v67 = v17;
    uint64_t v78 = v1;
    uint64_t v33 = KeyedDecodingContainer.allKeys.getter();
    uint64_t v34 = *(void *)(v33 + 16);
    if (v34)
    {
      uint64_t v35 = v32;
      int v36 = *(unsigned __int8 *)(v33 + 32);
      specialized ArraySlice.subscript.getter(1, v34, v33, v33 + 32, 0, (2 * v34) | 1);
      uint64_t v38 = v37;
      unint64_t v40 = v39;
      swift_bridgeObjectRelease();
      if (v38 == v40 >> 1)
      {
        if (v36)
        {
          if (v36 == 1)
          {
            lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys();
            OUTLINED_FUNCTION_23_0();
            type metadata accessor for GetContactAttributeSnippetModel(0);
            lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel and conformance GetContactAttributeSnippetModel);
            uint64_t v41 = (uint64_t)v63;
            OUTLINED_FUNCTION_81();
            uint64_t v31 = (uint64_t)v77;
            OUTLINED_FUNCTION_1_8();
            v51();
            swift_unknownObjectRelease();
            uint64_t v52 = OUTLINED_FUNCTION_62();
            v53(v52);
            swift_storeEnumTagMultiPayload();
            uint64_t v54 = v41;
LABEL_15:
            uint64_t v61 = (uint64_t)v64;
            outlined init with take of ModifyContactAttributeSnippetModel(v54, (uint64_t)v64, (void (*)(void))type metadata accessor for ContactsSnippetPluginModel);
            outlined init with take of ModifyContactAttributeSnippetModel(v61, v74, (void (*)(void))type metadata accessor for ContactsSnippetPluginModel);
            goto LABEL_11;
          }
          lazy protocol witness table accessor for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys();
          OUTLINED_FUNCTION_23_0();
          type metadata accessor for ModifyContactAttributeSnippetModel(0);
          lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel);
          OUTLINED_FUNCTION_81();
          uint64_t v31 = (uint64_t)v77;
          OUTLINED_FUNCTION_1_8();
          v58();
          swift_unknownObjectRelease();
          uint64_t v59 = OUTLINED_FUNCTION_61();
          v60(v59);
          uint64_t v57 = (uint64_t)v66;
        }
        else
        {
          lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys();
          OUTLINED_FUNCTION_23_0();
          type metadata accessor for GetContactSnippetModel(0);
          lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactSnippetModel and conformance GetContactSnippetModel);
          OUTLINED_FUNCTION_81();
          uint64_t v31 = (uint64_t)v77;
          OUTLINED_FUNCTION_1_8();
          v55();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_1_8();
          v56();
          uint64_t v57 = (uint64_t)v65;
        }
        swift_storeEnumTagMultiPayload();
        uint64_t v54 = v57;
        goto LABEL_15;
      }
      uint64_t v31 = (uint64_t)v77;
      uint64_t v42 = v75;
      uint64_t v32 = v35;
    }
    else
    {
      uint64_t v31 = (uint64_t)v77;
      uint64_t v42 = v75;
    }
    uint64_t v43 = v67;
    type metadata accessor for DecodingError();
    OUTLINED_FUNCTION_46();
    uint64_t v45 = v44;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    uint64_t *v45 = v43;
    uint64_t v46 = v78;
    uint64_t v47 = KeyedDecodingContainer.codingPath.getter();
    OUTLINED_FUNCTION_31(v47, v48, 0x800000025C699610);
    OUTLINED_FUNCTION_13_2();
    uint64_t v49 = OUTLINED_FUNCTION_39();
    v50(v49);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v46, v32);
    goto LABEL_11;
  }
  uint64_t v31 = (uint64_t)v77;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_0(v31);
  OUTLINED_FUNCTION_3_6();
}

unint64_t protocol witness for static SnippetPluginModel.bundleName.getter in conformance ContactsSnippetPluginModel()
{
  return 0xD000000000000014;
}

void protocol witness for Decodable.init(from:) in conformance ContactsSnippetPluginModel()
{
}

void protocol witness for Encodable.encode(to:) in conformance ContactsSnippetPluginModel()
{
}

void *static ContactsSnippetFlowState.allCases.getter()
{
  return &outlined read-only object #0 of static ContactsSnippetFlowState.allCases.getter;
}

uint64_t ContactsSnippetFlowState.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6D7269666E6F63 && a2 == 0xE700000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6148746E65746E69 && a2 == 0xED000064656C646ELL;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x726F707075736E75 && a2 == 0xEB00000000646574)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t ContactsSnippetFlowState.CodingKeys.init(intValue:)()
{
  return 3;
}

uint64_t ContactsSnippetFlowState.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aConfirm_0[8 * a1];
}

BOOL static ContactsSnippetFlowState.ConfirmCodingKeys.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void ContactsSnippetFlowState.ConfirmCodingKeys.hash(into:)(uint64_t a1, char a2)
{
}

uint64_t ContactsSnippetFlowState.ConfirmCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000025C699680
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025C6996A0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t ContactsSnippetFlowState.ConfirmCodingKeys.init(intValue:)()
{
  return 2;
}

unint64_t ContactsSnippetFlowState.ConfirmCodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t ContactsSnippetFlowState.UnsupportedCodingKeys.init(stringValue:)()
{
  return 1;
}

uint64_t ContactsSnippetFlowState.UnsupportedCodingKeys.stringValue.getter()
{
  return 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ContactsSnippetFlowState.CodingKeys()
{
  return ContactsSnippetPluginModel.CodingKeys.hashValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ContactsSnippetFlowState.CodingKeys()
{
  return ContactsSnippetFlowState.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsSnippetFlowState.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ContactsSnippetFlowState.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ContactsSnippetFlowState.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = ContactsSnippetFlowState.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetFlowState.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetFlowState.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ContactsSnippetFlowState.ConfirmCodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static ContactsSnippetFlowState.ConfirmCodingKeys.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ContactsSnippetFlowState.ConfirmCodingKeys()
{
  return ContactsSnippetFlowState.ConfirmCodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance ContactsSnippetFlowState.ConfirmCodingKeys(uint64_t a1)
{
  ContactsSnippetFlowState.ConfirmCodingKeys.hash(into:)(a1, *v1);
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance ContactsSnippetFlowState.ConfirmCodingKeys()
{
  return ContactsSnippetFlowState.ConfirmCodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsSnippetFlowState.ConfirmCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ContactsSnippetFlowState.ConfirmCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ContactsSnippetFlowState.ConfirmCodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = ContactsSnippetFlowState.ConfirmCodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetFlowState.ConfirmCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetFlowState.ConfirmCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetFlowState.IntentHandledCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetFlowState.IntentHandledCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsSnippetFlowState.UnsupportedCodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = ContactsSnippetFlowState.UnsupportedCodingKeys.init(stringValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance ContactsSnippetFlowState.UnsupportedCodingKeys()
{
  return SiriContactsActionItem.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ContactsSnippetFlowState.UnsupportedCodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = static ContactsSnippetPluginModel.GetContactCodingKeys.== infix(_:_:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetFlowState.UnsupportedCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetFlowState.UnsupportedCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ContactsSnippetFlowState.encode(to:)()
{
  OUTLINED_FUNCTION_2_7();
  BOOL v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetFlowState.UnsupportedCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_17_0(v5, v20);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetFlowState.IntentHandledCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_15_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetFlowState.ConfirmCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v21 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_6_5(v9, v21);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetFlowState.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_22();
  unint64_t v11 = v0[1];
  uint64_t v22 = *v0;
  uint64_t v23 = v0[2];
  unint64_t v24 = v0[3];
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  lazy protocol witness table accessor for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((v11 & 0xF000000000000000) == 0xB000000000000000)
  {
    lazy protocol witness table accessor for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys();
    OUTLINED_FUNCTION_74();
    goto LABEL_5;
  }
  if ((v11 & 0xF000000000000000) == 0x7000000000000000)
  {
    lazy protocol witness table accessor for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys();
    OUTLINED_FUNCTION_74();
LABEL_5:
    OUTLINED_FUNCTION_1_8();
    v12();
    OUTLINED_FUNCTION_59();
    v13();
    goto LABEL_10;
  }
  outlined copy of Data?(v22, v11);
  outlined copy of Data?(v23, v24);
  lazy protocol witness table accessor for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys();
  OUTLINED_FUNCTION_74();
  lazy protocol witness table accessor for type Data and conformance Data();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (v1)
  {
    outlined consume of Data?(v23, v24);
    OUTLINED_FUNCTION_1_8();
    v14();
    OUTLINED_FUNCTION_59();
    v15();
    uint64_t v16 = v22;
    unint64_t v17 = v11;
  }
  else
  {
    OUTLINED_FUNCTION_77();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    outlined consume of Data?(v22, v11);
    OUTLINED_FUNCTION_1_8();
    v18();
    OUTLINED_FUNCTION_59();
    v19();
    uint64_t v16 = v23;
    unint64_t v17 = v24;
  }
  outlined consume of Data?(v16, v17);
LABEL_10:
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_3_6();
}

void ContactsSnippetFlowState.init(from:)()
{
  OUTLINED_FUNCTION_2_7();
  unint64_t v2 = v1;
  uint64_t v38 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetFlowState.UnsupportedCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_5(v5, v37);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetFlowState.IntentHandledCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_15_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetFlowState.ConfirmCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetFlowState.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9_1();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0) {
    goto LABEL_9;
  }
  uint64_t v10 = KeyedDecodingContainer.allKeys.getter();
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11)
  {
LABEL_8:
    type metadata accessor for DecodingError();
    OUTLINED_FUNCTION_46();
    unint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *unint64_t v24 = &type metadata for ContactsSnippetFlowState;
    uint64_t v25 = KeyedDecodingContainer.codingPath.getter();
    OUTLINED_FUNCTION_31(v25, v26, 0x800000025C699610);
    OUTLINED_FUNCTION_13_2();
    (*(void (**)(void *))(v27 + 104))(v24);
    swift_willThrow();
    swift_unknownObjectRelease();
    uint64_t v28 = OUTLINED_FUNCTION_90();
    v29(v28, v8);
LABEL_9:
    uint64_t v30 = (uint64_t)v2;
    goto LABEL_10;
  }
  uint64_t v12 = v8;
  int v13 = *(unsigned __int8 *)(v10 + 32);
  specialized ArraySlice.subscript.getter(1, v11, v10, v10 + 32, 0, (2 * v11) | 1);
  uint64_t v15 = v14;
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  if (v15 != v17 >> 1)
  {
    uint64_t v8 = v12;
    goto LABEL_8;
  }
  if (v13)
  {
    if (v13 == 1)
    {
      lazy protocol witness table accessor for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys();
      OUTLINED_FUNCTION_91();
      OUTLINED_FUNCTION_1_8();
      v18();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_1_8();
      v19();
      uint64_t v20 = 0;
      long long v21 = 0uLL;
      unint64_t v22 = 0xB000000000000000;
    }
    else
    {
      lazy protocol witness table accessor for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys();
      OUTLINED_FUNCTION_91();
      OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_1_8();
      v31();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_1_8();
      v32();
      uint64_t v20 = 0;
      long long v21 = 0uLL;
      unint64_t v22 = 0x7000000000000000;
    }
    uint64_t v30 = (uint64_t)v2;
    uint64_t v36 = v38;
  }
  else
  {
    LOBYTE(v40) = 0;
    lazy protocol witness table accessor for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    LOBYTE(v39) = 0;
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    uint64_t v20 = v40;
    unint64_t v22 = v41;
    OUTLINED_FUNCTION_77();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    OUTLINED_FUNCTION_1_8();
    v33();
    swift_unknownObjectRelease();
    uint64_t v34 = OUTLINED_FUNCTION_80();
    v35(v34);
    long long v21 = v39;
    uint64_t v30 = (uint64_t)v2;
    uint64_t v36 = v38;
  }
  *(void *)uint64_t v36 = v20;
  *(void *)(v36 + 8) = v22;
  *(_OWORD *)(v36 + 16) = v21;
LABEL_10:
  __swift_destroy_boxed_opaque_existential_0(v30);
  OUTLINED_FUNCTION_3_6();
}

void protocol witness for static CaseIterable.allCases.getter in conformance ContactsSnippetFlowState(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static ContactsSnippetFlowState.allCases.getter;
}

void protocol witness for Decodable.init(from:) in conformance ContactsSnippetFlowState()
{
}

void protocol witness for Encodable.encode(to:) in conformance ContactsSnippetFlowState()
{
}

uint64_t GetContactSnippetModel.contact.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  return Loggable.wrappedValue.getter();
}

uint64_t key path getter for GetContactSnippetModel.contact : GetContactSnippetModel@<X0>(void *a1@<X8>)
{
  uint64_t result = GetContactSnippetModel.contact.getter();
  *a1 = v3;
  return result;
}

uint64_t key path setter for GetContactSnippetModel.contact : GetContactSnippetModel(id *a1)
{
  id v1 = *a1;
  return GetContactSnippetModel.contact.setter();
}

uint64_t GetContactSnippetModel.contact.setter()
{
  return Loggable.wrappedValue.setter();
}

uint64_t (*GetContactSnippetModel.contact.modify())()
{
  id v1 = OUTLINED_FUNCTION_73();
  *uint64_t v0 = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  v1[4] = OUTLINED_FUNCTION_78(v2);
  return GetContactSnippetModel.contact.modify;
}

uint64_t GetContactSnippetModel.directInvocationsModel.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_38(*(int *)(v0 + 20));
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t GetContactSnippetModel.flowState.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_86();
  uint64_t v1 = OUTLINED_FUNCTION_63(*(int *)(v0 + 24));
  return outlined copy of ContactsSnippetFlowState(v1, v2, v3, v4);
}

uint64_t GetContactSnippetModel.labelCATs.getter()
{
  return Loggable.wrappedValue.getter();
}

double key path getter for GetContactSnippetModel.labelCATs : GetContactSnippetModel@<D0>(_OWORD *a1@<X8>)
{
  GetContactSnippetModel.labelCATs.getter();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t GetContactSnippetModel.labelCATs.setter()
{
  return Loggable.wrappedValue.setter();
}

uint64_t (*GetContactSnippetModel.labelCATs.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_73();
  *uint64_t v0 = v1;
  type metadata accessor for GetContactSnippetModel(0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  v1[4] = OUTLINED_FUNCTION_78(v2);
  return GetContactSnippetModel.contact.modify;
}

uint64_t GetContactSnippetModel.shouldDisplayLightText.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GetContactSnippetModel(0) + 32));
}

uint64_t GetContactSnippetModel.shouldDisplayLightText.setter(char a1)
{
  uint64_t result = type metadata accessor for GetContactSnippetModel(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*GetContactSnippetModel.shouldDisplayLightText.modify())()
{
  return destructiveProjectEnumData for SiriHighlightedPropertyType;
}

uint64_t GetContactSnippetModel.init(contact:directInvocationsModel:flowState:labelCATs:)@<X0>(uint64_t *a1@<X1>, long long *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[4];
  long long v14 = *a2;
  uint64_t v8 = *((void *)a2 + 2);
  uint64_t v9 = *((void *)a2 + 3);
  uint64_t ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
  *(unsigned char *)(a3 + ContactSnippetModel[8]) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableContact<CNContact>);
  Loggable.init(wrappedValue:)();
  uint64_t v11 = a3 + ContactSnippetModel[5];
  *(void *)uint64_t v11 = v5;
  *(void *)(v11 + 8) = v6;
  *(_OWORD *)(v11 + 16) = *((_OWORD *)a1 + 1);
  *(void *)(v11 + 32) = v7;
  uint64_t v12 = a3 + ContactSnippetModel[6];
  *(_OWORD *)uint64_t v12 = v14;
  *(void *)(v12 + 16) = v8;
  *(void *)(v12 + 24) = v9;
  return Loggable.init(wrappedValue:)();
}

uint64_t GetContactSnippetModel.init(from:)(uint64_t a1)
{
  long long v3 = (int *)OUTLINED_FUNCTION_86();
  uint64_t v21 = v3[8];
  *(unsigned char *)(v1 + v21) = 0;
  uint64_t ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  Loggable.wrappedValue.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableContact<CNContact>);
  Loggable.init(wrappedValue:)();
  uint64_t v5 = (uint64_t *)(a1 + ContactAttributeSnippetModel[6]);
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  uint64_t v8 = v5[2];
  uint64_t v9 = v5[3];
  uint64_t v10 = v5[4];
  uint64_t v20 = v1;
  uint64_t v11 = (uint64_t *)(v1 + v3[5]);
  *uint64_t v11 = v6;
  v11[1] = v7;
  v11[2] = v8;
  v11[3] = v9;
  v11[4] = v10;
  uint64_t v12 = (uint64_t *)(a1 + ContactAttributeSnippetModel[7]);
  uint64_t v13 = *v12;
  unint64_t v14 = v12[1];
  uint64_t v16 = v12[2];
  unint64_t v15 = v12[3];
  unint64_t v17 = (uint64_t *)(v1 + v3[6]);
  *unint64_t v17 = v13;
  v17[1] = v14;
  v17[2] = v16;
  v17[3] = v15;
  outlined copy of Data?(v6, v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of ContactsSnippetFlowState(v13, v14, v16, v15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Loggable.init(wrappedValue:)();
  char v18 = *(unsigned char *)(a1 + ContactAttributeSnippetModel[9]);
  uint64_t result = outlined destroy of ModifyContactAttributeSnippetModel(a1, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
  *(unsigned char *)(v20 + v21) = v18;
  return result;
}

uint64_t GetContactAttributeSnippetModel.contact.getter()
{
  return Loggable.wrappedValue.getter();
}

uint64_t type metadata accessor for GetContactAttributeSnippetModel(uint64_t a1)
{
  return type metadata accessor for GetContactAttributeSnippetModel(a1, (uint64_t *)&type metadata singleton initialization cache for GetContactAttributeSnippetModel);
}

uint64_t type metadata accessor for ModifyContactAttributeSnippetModel(uint64_t a1)
{
  return type metadata accessor for GetContactAttributeSnippetModel(a1, (uint64_t *)&type metadata singleton initialization cache for ModifyContactAttributeSnippetModel);
}

uint64_t type metadata accessor for ContactsSnippetPluginModel(uint64_t a1)
{
  return type metadata accessor for GetContactAttributeSnippetModel(a1, (uint64_t *)&type metadata singleton initialization cache for ContactsSnippetPluginModel);
}

uint64_t outlined init with take of ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_8_5();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t outlined destroy of ModifyContactAttributeSnippetModel(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_1_8();
  v3();
  return a1;
}

uint64_t GetContactSnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746361746E6F63 && a2 == 0xE700000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000025C6996C0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x74617453776F6C66 && a2 == 0xE900000000000065;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x5441436C6562616CLL && a2 == 0xE900000000000073;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000016 && a2 == 0x800000025C6996E0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v8) {
          return 4;
        }
        else {
          return 5;
        }
      }
    }
  }
}

uint64_t GetContactSnippetModel.CodingKeys.init(intValue:)()
{
  return 5;
}

unint64_t GetContactSnippetModel.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
    case 4:
      return result;
    case 2:
      unint64_t result = 0x74617453776F6C66;
      break;
    case 3:
      unint64_t result = 0x5441436C6562616CLL;
      break;
    default:
      unint64_t result = 0x746361746E6F63;
      break;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance GetContactSnippetModel.CodingKeys()
{
  return GetContactSnippetModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GetContactSnippetModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = GetContactSnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GetContactSnippetModel.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = GetContactSnippetModel.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GetContactSnippetModel.CodingKeys(uint64_t a1)
{
  unint64_t ContactSnippet = lazy protocol witness table accessor for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, ContactSnippet);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GetContactSnippetModel.CodingKeys(uint64_t a1)
{
  unint64_t ContactSnippet = lazy protocol witness table accessor for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, ContactSnippet);
}

uint64_t GetContactSnippetModel.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GetContactSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_44();
  lazy protocol witness table accessor for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys();
  OUTLINED_FUNCTION_26_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
  OUTLINED_FUNCTION_29();
  if (!v0)
  {
    uint64_t ContactSnippetModel = type metadata accessor for GetContactSnippetModel(0);
    OUTLINED_FUNCTION_60(*(int *)(ContactSnippetModel + 20));
    lazy protocol witness table accessor for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel();
    OUTLINED_FUNCTION_29();
    lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState();
    OUTLINED_FUNCTION_29();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    lazy protocol witness table accessor for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_58(4);
  }
  uint64_t v3 = OUTLINED_FUNCTION_19_0();
  return v4(v3);
}

void GetContactSnippetModel.init(from:)()
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v3 = v2;
  uint64_t v23 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_17_0(v6, v21);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_24_0(v8, v22);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GetContactSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = OUTLINED_FUNCTION_6_2();
  uint64_t ContactSnippetModel = type metadata accessor for GetContactSnippetModel(v10);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_9_1();
  uint64_t v14 = *(int *)(v13 + 32);
  *(unsigned char *)(v1 + v14) = 0;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  lazy protocol witness table accessor for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  }
  else
  {
    LOBYTE(v24) = 0;
    lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    OUTLINED_FUNCTION_65();
    v15();
    OUTLINED_FUNCTION_77();
    lazy protocol witness table accessor for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v16 = v1 + *(int *)(ContactSnippetModel + 20);
    *(_OWORD *)uint64_t v16 = v24;
    *(_OWORD *)(v16 + 16) = v25;
    *(void *)(v16 + 32) = v26;
    lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    unint64_t v17 = (_OWORD *)(v1 + *(int *)(ContactSnippetModel + 24));
    *unint64_t v17 = v24;
    v17[1] = v25;
    lazy protocol witness table accessor for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    OUTLINED_FUNCTION_65();
    v18();
    char v19 = KeyedDecodingContainer.decode(_:forKey:)();
    OUTLINED_FUNCTION_1_8();
    v20();
    *(unsigned char *)(v1 + v14) = v19 & 1;
    outlined init with copy of ContactsSnippetPluginModel(v1, v23, (void (*)(void))type metadata accessor for GetContactSnippetModel);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
    outlined destroy of ModifyContactAttributeSnippetModel(v1, (void (*)(void))type metadata accessor for GetContactSnippetModel);
  }
  OUTLINED_FUNCTION_3_6();
}

void protocol witness for Decodable.init(from:) in conformance GetContactSnippetModel()
{
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GetContactSnippetModel()
{
  return GetContactSnippetModel.encode(to:)();
}

void GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.redacted.getter(unsigned char *a1@<X8>)
{
}

SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute::AttributeType_optional __swiftcall GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 9;
  if (v5 < 9) {
    char v7 = v5;
  }
  *uint64_t v4 = v7;
  return result;
}

void *static GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.allCases.getter()
{
  return &outlined read-only object #0 of static GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.allCases.getter;
}

uint64_t GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.rawValue.getter()
{
  return qword_25C698A58[*v0];
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  return specialized == infix<A>(_:_:)();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0, (void (*)(unsigned char *, uint64_t))specialized RawRepresentable<>.hash(into:));
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1, (void (*)(unsigned char *, uint64_t))specialized RawRepresentable<>.hash(into:));
}

SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute::AttributeType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType(Swift::String *a1)
{
  return GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.allCases.getter;
}

uint64_t protocol witness for Decodable.init(from:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t GetContactAttributeSnippetModel.DisplayAttribute.id.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

uint64_t GetContactAttributeSnippetModel.DisplayAttribute.displayLabel.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

uint64_t GetContactAttributeSnippetModel.DisplayAttribute.displayValue.getter()
{
  return OUTLINED_FUNCTION_6_1();
}

void GetContactAttributeSnippetModel.DisplayAttribute.type.getter(unsigned char *a1@<X8>)
{
}

void __swiftcall GetContactAttributeSnippetModel.DisplayAttribute.init(id:displayLabel:displayValue:type:)(SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute *__return_ptr retstr, Swift::String id, Swift::String_optional displayLabel, Swift::String_optional displayValue, SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute::AttributeType type)
{
  SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute::AttributeType v5 = *(unsigned char *)type;
  retstr->id = id;
  retstr->displayLabel = displayLabel;
  retstr->displayValue = displayValue;
  retstr->type = v5;
}

uint64_t GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4C79616C70736964 && a2 == 0xEC0000006C656261;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x5679616C70736964 && a2 == 0xEC00000065756C61;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 1701869940 && a2 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys.stringValue.getter(char a1)
{
  return qword_25C698AE8[a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys()
{
  return GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys(uint64_t a1)
{
  unint64_t ContactAttributeSnippet = lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys();
  return MEMORY[0x270FA00B0](a1, ContactAttributeSnippet);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys(uint64_t a1)
{
  unint64_t ContactAttributeSnippet = lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys();
  return MEMORY[0x270FA00B8](a1, ContactAttributeSnippet);
}

void GetContactAttributeSnippetModel.DisplayAttribute.encode(to:)()
{
  OUTLINED_FUNCTION_2_7();
  BOOL v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v0)
  {
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType();
    OUTLINED_FUNCTION_33();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_3_6();
}

void GetContactAttributeSnippetModel.DisplayAttribute.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_11_2();
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v11)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  else
  {
    uint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v19 = v18;
    uint64_t v28 = v17;
    swift_bridgeObjectRetain();
    uint64_t v20 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v29 = v21;
    uint64_t v27 = v20;
    swift_bridgeObjectRetain();
    uint64_t v26 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v23 = v22;
    lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType();
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v24 = OUTLINED_FUNCTION_21_0();
    v25(v24);
    *(void *)uint64_t v15 = v28;
    *(void *)(v15 + 8) = v19;
    *(void *)(v15 + 16) = v27;
    *(void *)(v15 + 24) = v29;
    *(void *)(v15 + 32) = v26;
    *(void *)(v15 + 40) = v23;
    *(unsigned char *)(v15 + 48) = a11;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_3_6();
}

void protocol witness for Decodable.init(from:) in conformance GetContactAttributeSnippetModel.DisplayAttribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  GetContactAttributeSnippetModel.DisplayAttribute.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, *(int *)vars8, vars8[4]);
}

void protocol witness for Encodable.encode(to:) in conformance GetContactAttributeSnippetModel.DisplayAttribute()
{
}

uint64_t protocol witness for Identifiable.id.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = GetContactAttributeSnippetModel.DisplayAttribute.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t key path getter for GetContactAttributeSnippetModel.contact : GetContactAttributeSnippetModel@<X0>(void *a1@<X8>)
{
  uint64_t result = GetContactAttributeSnippetModel.contact.getter();
  *a1 = v3;
  return result;
}

uint64_t key path setter for GetContactAttributeSnippetModel.contact : GetContactAttributeSnippetModel(id *a1)
{
  id v1 = *a1;
  return GetContactAttributeSnippetModel.contact.setter();
}

uint64_t GetContactAttributeSnippetModel.contact.setter()
{
  return Loggable.wrappedValue.setter();
}

uint64_t (*GetContactAttributeSnippetModel.contact.modify())()
{
  id v1 = OUTLINED_FUNCTION_73();
  *uint64_t v0 = v1;
  OUTLINED_FUNCTION_42();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  v1[4] = OUTLINED_FUNCTION_78(v2);
  return GetContactSnippetModel.contact.modify;
}

uint64_t GetContactAttributeSnippetModel.directInvocationsModel.getter()
{
  uint64_t ContactAttributeSnippetModel = type metadata accessor for GetContactAttributeSnippetModel(0);
  OUTLINED_FUNCTION_38(*(int *)(ContactAttributeSnippetModel + 24));
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t GetContactAttributeSnippetModel.flowState.getter()
{
  return GetContactAttributeSnippetModel.flowState.getter(type metadata accessor for GetContactAttributeSnippetModel);
}

uint64_t GetContactAttributeSnippetModel.labelCATs.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for GetContactAttributeSnippetModel(0) + 32));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

BOOL GetContactAttributeSnippetModel.hasSingleResult.getter()
{
  return *(void *)(*(void *)v0 + 16) == 1;
}

uint64_t GetContactAttributeSnippetModel.shouldDisplayLightText.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GetContactAttributeSnippetModel(0) + 36));
}

uint64_t GetContactAttributeSnippetModel.shouldDisplayLightText.setter(char a1)
{
  uint64_t result = type metadata accessor for GetContactAttributeSnippetModel(0);
  *(unsigned char *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*GetContactAttributeSnippetModel.shouldDisplayLightText.modify())()
{
  return destructiveProjectEnumData for SiriHighlightedPropertyType;
}

uint64_t GetContactAttributeSnippetModel.shouldRenderAsContactCard.getter()
{
  uint64_t ContactAttributeSnippetModel = type metadata accessor for GetContactAttributeSnippetModel(0);
  MEMORY[0x270FA5388](ContactAttributeSnippetModel - 8);
  OUTLINED_FUNCTION_15_1();
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 16);
  if (v4 == 1 && (result = specialized == infix<A>(_:_:)(), uint64_t v4 = v3[2], (result & 1) != 0))
  {
    if (v4)
    {
      uint64_t v6 = v3[8];
      unint64_t v7 = v3[9];
      return Optional<A>.isNilOrEmpty.getter(v6, v7);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    outlined init with copy of ContactsSnippetPluginModel(v1, v0, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
    BOOL v8 = v4 == 1 && *(void *)(*(void *)v0 + 16) && ((*(unsigned __int8 *)(*(void *)v0 + 80) - 3) & 0xFD) == 0;
    outlined destroy of ModifyContactAttributeSnippetModel(v0, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
    return v8;
  }
  return result;
}

uint64_t static ContactsLabelCATContainer.empty.getter@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for empty != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_26A5BE568;
  *a1 = static ContactsLabelCATContainer.empty;
  a1[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 GetContactAttributeSnippetModel.init(attributes:contact:flowState:directInvocationsModel:labelCATs:)@<Q0>(uint64_t a1@<X0>, long long *a2@<X2>, uint64_t *a3@<X3>, __n128 *a4@<X4>, void *a5@<X8>)
{
  long long v17 = *a2;
  uint64_t v8 = *((void *)a2 + 2);
  uint64_t v9 = *((void *)a2 + 3);
  uint64_t v10 = *a3;
  uint64_t v11 = a3[1];
  uint64_t v12 = a3[4];
  uint64_t ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
  *((unsigned char *)a5 + ContactAttributeSnippetModel[9]) = 0;
  *a5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableContact<CNContact>);
  Loggable.init(wrappedValue:)();
  uint64_t v14 = (char *)a5 + ContactAttributeSnippetModel[7];
  *(_OWORD *)uint64_t v14 = v17;
  *((void *)v14 + 2) = v8;
  *((void *)v14 + 3) = v9;
  uint64_t v15 = (char *)a5 + ContactAttributeSnippetModel[6];
  *(void *)uint64_t v15 = v10;
  *((void *)v15 + 1) = v11;
  *((_OWORD *)v15 + 1) = *((_OWORD *)a3 + 1);
  *((void *)v15 + 4) = v12;
  __n128 result = *a4;
  *(__n128 *)((char *)a5 + ContactAttributeSnippetModel[8]) = *a4;
  return result;
}

uint64_t GetContactAttributeSnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7475626972747461 && a2 == 0xEA00000000007365;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x746361746E6F63 && a2 == 0xE700000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000016 && a2 == 0x800000025C6996C0 {
           || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    }
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x74617453776F6C66 && a2 == 0xE900000000000065;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x5441436C6562616CLL && a2 == 0xE900000000000073;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0xD000000000000016 && a2 == 0x800000025C6996E0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v9) {
            return 5;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
}

uint64_t GetContactAttributeSnippetModel.CodingKeys.init(intValue:)()
{
  return 6;
}

unint64_t GetContactAttributeSnippetModel.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x746361746E6F63;
      break;
    case 2:
    case 5:
      return result;
    case 3:
      unint64_t result = 0x74617453776F6C66;
      break;
    case 4:
      unint64_t result = 0x5441436C6562616CLL;
      break;
    default:
      unint64_t result = 0x7475626972747461;
      break;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance GetContactAttributeSnippetModel.CodingKeys()
{
  return GetContactAttributeSnippetModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GetContactAttributeSnippetModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = GetContactAttributeSnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GetContactAttributeSnippetModel.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = GetContactAttributeSnippetModel.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GetContactAttributeSnippetModel.CodingKeys(uint64_t a1)
{
  unint64_t ContactAttributeSnippet = lazy protocol witness table accessor for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, ContactAttributeSnippet);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GetContactAttributeSnippetModel.CodingKeys(uint64_t a1)
{
  unint64_t ContactAttributeSnippet = lazy protocol witness table accessor for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, ContactAttributeSnippet);
}

uint64_t GetContactAttributeSnippetModel.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GetContactAttributeSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_44();
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys();
  OUTLINED_FUNCTION_26_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GetContactAttributeSnippetModel.DisplayAttribute]);
  lazy protocol witness table accessor for type [GetContactAttributeSnippetModel.DisplayAttribute] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [GetContactAttributeSnippetModel.DisplayAttribute] and conformance <A> [A]);
  OUTLINED_FUNCTION_29();
  if (!v1)
  {
    uint64_t ContactAttributeSnippetModel = type metadata accessor for GetContactAttributeSnippetModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_60(*(int *)(ContactAttributeSnippetModel + 24));
    lazy protocol witness table accessor for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_79((_OWORD *)(v0 + *(int *)(ContactAttributeSnippetModel + 28)));
    OUTLINED_FUNCTION_27();
    lazy protocol witness table accessor for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_58(5);
  }
  uint64_t v4 = OUTLINED_FUNCTION_19_0();
  return v5(v4);
}

void GetContactAttributeSnippetModel.init(from:)()
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v2 = v1;
  uint64_t v17 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_64();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GetContactAttributeSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_54();
  type metadata accessor for GetContactAttributeSnippetModel(v6);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5_4();
  uint64_t v18 = v8;
  uint64_t v19 = v9;
  uint64_t v10 = v8[9];
  *((unsigned char *)v9 + v10) = 0;
  OUTLINED_FUNCTION_84(v2);
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GetContactAttributeSnippetModel.DisplayAttribute]);
    lazy protocol witness table accessor for type [GetContactAttributeSnippetModel.DisplayAttribute] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [GetContactAttributeSnippetModel.DisplayAttribute] and conformance <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    void *v19 = v20;
    LOBYTE(v20) = 1;
    lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    OUTLINED_FUNCTION_65();
    v11();
    lazy protocol witness table accessor for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel();
    OUTLINED_FUNCTION_25_0();
    uint64_t v12 = (char *)v19 + v18[6];
    *(_OWORD *)uint64_t v12 = v20;
    *((_OWORD *)v12 + 1) = v21;
    *((void *)v12 + 4) = v22;
    lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState();
    OUTLINED_FUNCTION_25_0();
    uint64_t v13 = (_OWORD *)((char *)v19 + v18[7]);
    *uint64_t v13 = v20;
    v13[1] = v21;
    lazy protocol witness table accessor for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer();
    OUTLINED_FUNCTION_25_0();
    *(_OWORD *)((char *)v19 + v18[8]) = v20;
    char v14 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v15 = OUTLINED_FUNCTION_14_2();
    v16(v15);
    *((unsigned char *)v19 + v10) = v14 & 1;
    outlined init with copy of ContactsSnippetPluginModel((uint64_t)v19, v17, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
    outlined destroy of ModifyContactAttributeSnippetModel((uint64_t)v19, (void (*)(void))type metadata accessor for GetContactAttributeSnippetModel);
  }
  OUTLINED_FUNCTION_3_6();
}

uint64_t ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D616E6B63696ELL && a2 == 0xE800000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6974616C6572 && a2 == 0xEC00000070696873)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x6E6F6974616C6572;
  }
  else {
    return 0x656D616E6B63696ELL;
  }
}

uint64_t ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys.stringValue.getter()
{
  return 12383;
}

uint64_t ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

Swift::Int ContactsSnippetPluginModel.GetContactAttributeCodingKeys.hashValue.getter()
{
  return Hasher._finalize()();
}

void protocol witness for Decodable.init(from:) in conformance GetContactAttributeSnippetModel()
{
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GetContactAttributeSnippetModel()
{
  return GetContactAttributeSnippetModel.encode(to:)();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys()
{
  return ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ModifyContactAttributeSnippetModel.ContactAttributeToModify.encode(to:)()
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v17 = v7;
  uint64_t v18 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_12_2();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v15 = v9;
  uint64_t v16 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_11_2();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_9_1();
  char v13 = *(unsigned char *)(v0 + 16);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v13)
  {
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys();
    uint64_t v14 = v19;
    OUTLINED_FUNCTION_18_0();
    KeyedEncodingContainer.encode(_:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v2, v18);
  }
  else
  {
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys();
    uint64_t v14 = v19;
    OUTLINED_FUNCTION_18_0();
    KeyedEncodingContainer.encode(_:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v3, v16);
  }
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v14);
  OUTLINED_FUNCTION_3_6();
}

void ModifyContactAttributeSnippetModel.ContactAttributeToModify.init(from:)()
{
  OUTLINED_FUNCTION_2_7();
  char v4 = v3;
  uint64_t v34 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_9_1();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v35 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_22();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v36 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_5();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0) {
    goto LABEL_8;
  }
  uint64_t v33 = v2;
  uint64_t v13 = KeyedDecodingContainer.allKeys.getter();
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = v10;
  if (!v14)
  {
    uint64_t v16 = v1;
    goto LABEL_7;
  }
  uint64_t v16 = v1;
  char v17 = *(unsigned char *)(v13 + 32);
  specialized ArraySlice.subscript.getter(1, v14, v13, v13 + 32, 0, (2 * v14) | 1);
  uint64_t v19 = v18;
  unint64_t v21 = v20;
  swift_bridgeObjectRelease();
  if (v19 != v21 >> 1)
  {
LABEL_7:
    type metadata accessor for DecodingError();
    OUTLINED_FUNCTION_46();
    uint64_t v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v23 = &type metadata for ModifyContactAttributeSnippetModel.ContactAttributeToModify;
    uint64_t v24 = KeyedDecodingContainer.codingPath.getter();
    OUTLINED_FUNCTION_31(v24, v25, 0x800000025C699610);
    OUTLINED_FUNCTION_13_2();
    (*(void (**)(void *))(v26 + 104))(v23);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v16, v15);
LABEL_8:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
    goto LABEL_9;
  }
  if (v17)
  {
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys();
    OUTLINED_FUNCTION_75();
    uint64_t v27 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v29 = v28;
    OUTLINED_FUNCTION_1_8();
    v30();
  }
  else
  {
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys();
    OUTLINED_FUNCTION_75();
    uint64_t v27 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v29 = v31;
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v7);
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_59();
  v32();
  *(void *)uint64_t v34 = v27;
  *(void *)(v34 + 8) = v29;
  *(unsigned char *)(v34 + 16) = v17;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
LABEL_9:
  OUTLINED_FUNCTION_3_6();
}

void protocol witness for Decodable.init(from:) in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
}

void protocol witness for Encodable.encode(to:) in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
}

uint64_t ModifyContactAttributeSnippetModel.ModificationType.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 6579297 && a2 == 0xE300000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6563616C706572 && a2 == 0xE700000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6574656C6564 && a2 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t ModifyContactAttributeSnippetModel.ModificationType.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aUnknown_1[8 * a1];
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys()
{
  return ModifyContactAttributeSnippetModel.ModificationType.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ModifyContactAttributeSnippetModel.ModificationType.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ModifyContactAttributeSnippetModel.ModificationType.encode(to:)()
{
  OUTLINED_FUNCTION_2_7();
  BOOL v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_4();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_5(v6, v16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_24_0(v8, v17);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9_1();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ModificationType.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_12_2();
  uint64_t v14 = *v0;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  switch(v14)
  {
    case 1:
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys();
      OUTLINED_FUNCTION_37();
      break;
    case 2:
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys();
      OUTLINED_FUNCTION_37();
      break;
    case 3:
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys();
      OUTLINED_FUNCTION_37();
      break;
    default:
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      OUTLINED_FUNCTION_90();
      break;
  }
  OUTLINED_FUNCTION_1_8();
  v15();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v10);
  OUTLINED_FUNCTION_3_6();
}

void ModifyContactAttributeSnippetModel.ModificationType.init(from:)()
{
  OUTLINED_FUNCTION_2_7();
  BOOL v3 = v2;
  uint64_t v37 = v4;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v38 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_50(v7, v34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_6_5(v9, v35);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_9_1();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ModificationType.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v39 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_11_2();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0) {
    goto LABEL_7;
  }
  uint64_t v42 = v3;
  uint64_t v15 = KeyedDecodingContainer.allKeys.getter();
  uint64_t v16 = *(void *)(v15 + 16);
  if (!v16
    || (uint64_t v36 = *(unsigned __int8 *)(v15 + 32),
        specialized ArraySlice.subscript.getter(1, v16, v15, v15 + 32, 0, (2 * v16) | 1),
        uint64_t v18 = v17,
        unint64_t v20 = v19,
        swift_bridgeObjectRelease(),
        v18 != v20 >> 1))
  {
    type metadata accessor for DecodingError();
    OUTLINED_FUNCTION_46();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v22 = &type metadata for ModifyContactAttributeSnippetModel.ModificationType;
    uint64_t v23 = KeyedDecodingContainer.codingPath.getter();
    OUTLINED_FUNCTION_31(v23, v24, 0x800000025C699610);
    OUTLINED_FUNCTION_13_2();
    uint64_t v25 = OUTLINED_FUNCTION_39();
    v26(v25);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v1, v12);
    BOOL v3 = v42;
LABEL_7:
    uint64_t v27 = (uint64_t)v3;
    goto LABEL_8;
  }
  switch(v36)
  {
    case 1:
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys();
      OUTLINED_FUNCTION_36();
      goto LABEL_12;
    case 2:
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys();
      OUTLINED_FUNCTION_36();
      goto LABEL_12;
    case 3:
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v40, v41);
      swift_unknownObjectRelease();
      uint64_t v31 = OUTLINED_FUNCTION_20_0();
      v32(v31);
      uint64_t v27 = (uint64_t)v42;
      uint64_t v33 = v37;
      goto LABEL_13;
    default:
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys();
      OUTLINED_FUNCTION_36();
LABEL_12:
      OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_1_8();
      v28();
      swift_unknownObjectRelease();
      uint64_t v29 = OUTLINED_FUNCTION_20_0();
      v30(v29);
      uint64_t v27 = (uint64_t)v42;
      uint64_t v33 = v37;
LABEL_13:
      *uint64_t v33 = v36;
      break;
  }
LABEL_8:
  __swift_destroy_boxed_opaque_existential_0(v27);
  OUTLINED_FUNCTION_3_6();
}

void protocol witness for Decodable.init(from:) in conformance ModifyContactAttributeSnippetModel.ModificationType()
{
}

void protocol witness for Encodable.encode(to:) in conformance ModifyContactAttributeSnippetModel.ModificationType()
{
}

uint64_t ModifyContactAttributeSnippetModel.attributeToModify.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  char v3 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  return outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
}

void ModifyContactAttributeSnippetModel.modificationType.getter(unsigned char *a1@<X8>)
{
}

uint64_t ModifyContactAttributeSnippetModel.contact.getter()
{
  return Loggable.wrappedValue.getter();
}

uint64_t key path getter for ModifyContactAttributeSnippetModel.contact : ModifyContactAttributeSnippetModel@<X0>(void *a1@<X8>)
{
  uint64_t result = ModifyContactAttributeSnippetModel.contact.getter();
  *a1 = v3;
  return result;
}

uint64_t key path setter for ModifyContactAttributeSnippetModel.contact : ModifyContactAttributeSnippetModel(id *a1)
{
  id v1 = *a1;
  return ModifyContactAttributeSnippetModel.contact.setter();
}

uint64_t ModifyContactAttributeSnippetModel.contact.setter()
{
  return Loggable.wrappedValue.setter();
}

uint64_t (*ModifyContactAttributeSnippetModel.contact.modify())()
{
  id v1 = OUTLINED_FUNCTION_73();
  *uint64_t v0 = v1;
  OUTLINED_FUNCTION_95();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  v1[4] = OUTLINED_FUNCTION_78(v2);
  return GetContactSnippetModel.contact.modify;
}

uint64_t ModifyContactAttributeSnippetModel.flowState.getter()
{
  return GetContactAttributeSnippetModel.flowState.getter(type metadata accessor for ModifyContactAttributeSnippetModel);
}

uint64_t GetContactAttributeSnippetModel.flowState.getter(uint64_t (*a1)(void))
{
  uint64_t v1 = a1(0);
  uint64_t v2 = OUTLINED_FUNCTION_63(*(int *)(v1 + 28));
  return outlined copy of ContactsSnippetFlowState(v2, v3, v4, v5);
}

uint64_t ModifyContactAttributeSnippetModel.labelCATs.getter()
{
  return Loggable.wrappedValue.getter();
}

double key path getter for ModifyContactAttributeSnippetModel.labelCATs : ModifyContactAttributeSnippetModel@<D0>(_OWORD *a1@<X8>)
{
  ModifyContactAttributeSnippetModel.labelCATs.getter();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t key path setter for GetContactSnippetModel.labelCATs : GetContactSnippetModel(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void *))
{
  uint64_t v6 = a1[1];
  v8[0] = *a1;
  v8[1] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a5(v8);
}

uint64_t ModifyContactAttributeSnippetModel.labelCATs.setter()
{
  return Loggable.wrappedValue.setter();
}

uint64_t (*ModifyContactAttributeSnippetModel.labelCATs.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_73();
  *uint64_t v0 = v1;
  OUTLINED_FUNCTION_96();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  v1[4] = OUTLINED_FUNCTION_78(v2);
  return GetContactSnippetModel.contact.modify;
}

void GetContactSnippetModel.contact.modify(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t ModifyContactAttributeSnippetModel.meCardPunchout.getter()
{
  uint64_t v1 = type metadata accessor for ModifyContactAttributeSnippetModel(0);
  outlined copy of Data?(*(void *)(v0 + *(int *)(v1 + 36)), *(void *)(v0 + *(int *)(v1 + 36) + 8));
  return OUTLINED_FUNCTION_6_1();
}

uint64_t ModifyContactAttributeSnippetModel.targetPunchout.getter()
{
  uint64_t v1 = type metadata accessor for ModifyContactAttributeSnippetModel(0);
  outlined copy of Data?(*(void *)(v0 + *(int *)(v1 + 40)), *(void *)(v0 + *(int *)(v1 + 40) + 8));
  return OUTLINED_FUNCTION_6_1();
}

uint64_t ModifyContactAttributeSnippetModel.modificationDisplayString.getter()
{
  return OUTLINED_FUNCTION_93();
}

uint64_t ModifyContactAttributeSnippetModel.init(attributeToModify:modificationType:contact:flowState:labelCATs:meCardPunchout:targetPunchout:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, long long *a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8)
{
  char v11 = *(unsigned char *)(a1 + 16);
  char v12 = *a2;
  long long v20 = *a3;
  uint64_t v14 = *((void *)a3 + 2);
  uint64_t v13 = *((void *)a3 + 3);
  *(_OWORD *)a7 = *(_OWORD *)a1;
  *(unsigned char *)(a7 + 16) = v11;
  *(unsigned char *)(a7 + 17) = v12;
  uint64_t v15 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableContact<CNContact>);
  Loggable.init(wrappedValue:)();
  uint64_t v16 = a7 + v15[7];
  *(_OWORD *)uint64_t v16 = v20;
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v13;
  uint64_t result = Loggable.init(wrappedValue:)();
  uint64_t v18 = (void *)(a7 + v15[9]);
  void *v18 = a4;
  v18[1] = a5;
  unint64_t v19 = (void *)(a7 + v15[10]);
  void *v19 = a6;
  v19[1] = a8;
  return result;
}

uint64_t ModifyContactAttributeSnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000025C699700
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025C699720 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v5 = a1 == 0x746361746E6F63 && a2 == 0xE700000000000000;
    if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v6 = a1 == 0x74617453776F6C66 && a2 == 0xE900000000000065;
      if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v7 = a1 == 0x5441436C6562616CLL && a2 == 0xE900000000000073;
        if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v8 = a1 == 0x755064726143656DLL && a2 == 0xEE0074756F68636ELL;
          if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0x7550746567726174 && a2 == 0xEE0074756F68636ELL)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if (v10) {
              return 6;
            }
            else {
              return 7;
            }
          }
        }
      }
    }
  }
}

uint64_t ModifyContactAttributeSnippetModel.CodingKeys.init(intValue:)()
{
  return 7;
}

uint64_t ModifyContactAttributeSnippetModel.CodingKeys.stringValue.getter(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      uint64_t result = 0xD000000000000010;
      break;
    case 2:
      uint64_t result = 0x746361746E6F63;
      break;
    case 3:
      uint64_t result = 0x74617453776F6C66;
      break;
    case 4:
      uint64_t result = 0x5441436C6562616CLL;
      break;
    case 5:
      uint64_t v3 = 0x64726143656DLL;
      goto LABEL_8;
    case 6:
      uint64_t v3 = 0x746567726174;
LABEL_8:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x7550000000000000;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ModifyContactAttributeSnippetModel.CodingKeys()
{
  return ModifyContactAttributeSnippetModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ModifyContactAttributeSnippetModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ModifyContactAttributeSnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ModifyContactAttributeSnippetModel.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = ModifyContactAttributeSnippetModel.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ModifyContactAttributeSnippetModel.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_44();
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys();
  OUTLINED_FUNCTION_26_0();
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  OUTLINED_FUNCTION_28_0();
  if (!v1)
  {
    OUTLINED_FUNCTION_77();
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType();
    OUTLINED_FUNCTION_28_0();
    uint64_t v3 = type metadata accessor for ModifyContactAttributeSnippetModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_79((_OWORD *)(v0 + *(int *)(v3 + 28)));
    OUTLINED_FUNCTION_28_0();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    lazy protocol witness table accessor for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_33();
    lazy protocol witness table accessor for type Data and conformance Data();
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_43();
  }
  uint64_t v4 = OUTLINED_FUNCTION_19_0();
  return v5(v4);
}

void ModifyContactAttributeSnippetModel.init(from:)()
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v2 = v1;
  uint64_t v16 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_12_2();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_11_2();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_5_2();
  uint64_t v17 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(v7);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5_4();
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_84(v2);
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  }
  else
  {
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    *(_OWORD *)uint64_t v10 = v18;
    *(unsigned char *)(v10 + 16) = v19;
    OUTLINED_FUNCTION_77();
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType();
    OUTLINED_FUNCTION_71();
    *(unsigned char *)(v10 + 17) = v18;
    LOBYTE(v18) = 2;
    lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_92();
    OUTLINED_FUNCTION_65();
    v11();
    lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState();
    OUTLINED_FUNCTION_71();
    char v12 = (_OWORD *)(v10 + v17[7]);
    *char v12 = v18;
    v12[1] = v19;
    LOBYTE(v18) = 4;
    lazy protocol witness table accessor for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_92();
    OUTLINED_FUNCTION_65();
    v13();
    lazy protocol witness table accessor for type Data and conformance Data();
    OUTLINED_FUNCTION_55();
    *(_OWORD *)(v10 + v17[9]) = v18;
    OUTLINED_FUNCTION_55();
    uint64_t v14 = OUTLINED_FUNCTION_30();
    v15(v14);
    *(_OWORD *)(v10 + v17[10]) = v18;
    outlined init with copy of ContactsSnippetPluginModel(v10, v16, (void (*)(void))type metadata accessor for ModifyContactAttributeSnippetModel);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
    outlined destroy of ModifyContactAttributeSnippetModel(v10, (void (*)(void))type metadata accessor for ModifyContactAttributeSnippetModel);
  }
  OUTLINED_FUNCTION_3_6();
}

void protocol witness for Decodable.init(from:) in conformance ModifyContactAttributeSnippetModel()
{
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ModifyContactAttributeSnippetModel()
{
  return ModifyContactAttributeSnippetModel.encode(to:)();
}

uint64_t one-time initialization function for empty()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType();
  uint64_t v0 = Dictionary.init(dictionaryLiteral:)();
  uint64_t result = Dictionary.init(dictionaryLiteral:)();
  static ContactsLabelCATContainer.empty = v0;
  *(void *)algn_26A5BE568 = result;
  return result;
}

SiriContactsCommon::ContactsLabelCATContainer __swiftcall ContactsLabelCATContainer.init(labels:localizedAttributeLabels:)(Swift::OpaquePointer labels, Swift::OpaquePointer localizedAttributeLabels)
{
  v2->_rawValue = labels._rawValue;
  v2[1]._rawValue = localizedAttributeLabels._rawValue;
  result.localizedAttributeLabels = localizedAttributeLabels;
  result.labels = labels;
  return result;
}

BOOL static ContactsLabelCATContainer.LabelType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ContactsLabelCATContainer.LabelType.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

uint64_t ContactsLabelCATContainer.LabelType.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7374696E55656761 && a2 == 0xE800000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1819042147 && a2 == 0xE400000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6C65636E6163 && a2 == 0xE600000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 28519 && a2 == 0xE200000000000000;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 1818845549 && a2 == 0xE400000000000000;
          if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x6567617373656DLL && a2 == 0xE700000000000000;
            if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 1702257011 && a2 == 0xE400000000000000;
              if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x6465766173 && a2 == 0xE500000000000000;
                if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else if (a1 == 0x6F65646976 && a2 == 0xE500000000000000)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
                  swift_bridgeObjectRelease();
                  if (v14) {
                    return 8;
                  }
                  else {
                    return 9;
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

uint64_t ContactsLabelCATContainer.LabelType.CodingKeys.init(intValue:)()
{
  return 9;
}

Swift::Int ContactsSnippetPluginModel.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t ContactsLabelCATContainer.LabelType.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aAgeunitscall[8 * a1];
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.CallCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.CallCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ContactsLabelCATContainer.LabelType.CodingKeys()
{
  return ContactsLabelCATContainer.LabelType.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsLabelCATContainer.LabelType.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ContactsLabelCATContainer.LabelType.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ContactsLabelCATContainer.LabelType.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = ContactsLabelCATContainer.LabelType.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.GoCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.GoCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.MailCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.MailCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *static ContactsLabelCATContainer.LabelType.allCases.getter()
{
  return &outlined read-only object #0 of static ContactsLabelCATContainer.LabelType.allCases.getter;
}

void ContactsLabelCATContainer.LabelType.encode(to:)()
{
  OUTLINED_FUNCTION_2_7();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.VideoCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_51(v6, v26);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.SavedCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_17_0(v8, v27);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.SaveCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5_4();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.MessageCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5_4();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.MailCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5_4();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.GoCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_5_4();
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.CancelCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5_4();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.CallCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_11_2();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_15_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v29 = v17;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_9_1();
  uint64_t v18 = *v2;
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  switch(v18)
  {
    case 1:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys();
      uint64_t v0 = v29;
      OUTLINED_FUNCTION_18_0();
      uint64_t v23 = OUTLINED_FUNCTION_89();
      uint64_t v25 = v14;
      goto LABEL_12;
    case 2:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys();
      OUTLINED_FUNCTION_10_3();
      uint64_t v23 = OUTLINED_FUNCTION_40();
      uint64_t v25 = v28;
      goto LABEL_12;
    case 3:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys();
      OUTLINED_FUNCTION_10_3();
      goto LABEL_11;
    case 4:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys();
      OUTLINED_FUNCTION_10_3();
      goto LABEL_11;
    case 5:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys();
      OUTLINED_FUNCTION_10_3();
      goto LABEL_11;
    case 6:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys();
      OUTLINED_FUNCTION_10_3();
      goto LABEL_11;
    case 7:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys();
      OUTLINED_FUNCTION_10_3();
      goto LABEL_11;
    case 8:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys();
      OUTLINED_FUNCTION_10_3();
LABEL_11:
      uint64_t v23 = OUTLINED_FUNCTION_40();
LABEL_12:
      v24(v23, v25);
      uint64_t v20 = OUTLINED_FUNCTION_90();
      uint64_t v21 = v0;
      break;
    default:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys();
      OUTLINED_FUNCTION_18_0();
      OUTLINED_FUNCTION_1_8();
      v19();
      uint64_t v20 = OUTLINED_FUNCTION_87();
      break;
  }
  v22(v20, v21);
  OUTLINED_FUNCTION_3_6();
}

Swift::Int ModifyContactAttributeSnippetModel.ModificationType.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  OUTLINED_FUNCTION_56();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void ContactsLabelCATContainer.LabelType.init(from:)()
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v81 = v0;
  uint64_t v4 = v3;
  uint64_t v78 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.VideoCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v75 = v7;
  uint64_t v76 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5_4();
  uint64_t v77 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.SavedCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v73 = v10;
  uint64_t v74 = v9;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_52(v11, v58[0]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.SaveCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v71 = v13;
  uint64_t v72 = v12;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_5_4();
  uint64_t v79 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.MessageCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v69 = v16;
  uint64_t v70 = v15;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_53(v17, v58[0]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.MailCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v67 = v19;
  uint64_t v68 = v18;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_24_0(v20, v58[0]);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.GoCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v65 = v21;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_17_0(v23, v58[0]);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.CancelCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v63 = v24;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_6_5(v26, v58[0]);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.CallCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v61 = v27;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_64();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v60 = v30;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_11_2();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v34 = v33;
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)v58 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = v4;
  OUTLINED_FUNCTION_84(v4);
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys();
  uint64_t v38 = v81;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v38) {
    goto LABEL_19;
  }
  v58[2] = v2;
  v58[1] = v29;
  v58[3] = v1;
  uint64_t v81 = v34;
  uint64_t v39 = KeyedDecodingContainer.allKeys.getter();
  uint64_t v40 = *(void *)(v39 + 16);
  if (!v40)
  {
    uint64_t v48 = v32;
    uint64_t v49 = v81;
LABEL_8:
    type metadata accessor for DecodingError();
    OUTLINED_FUNCTION_46();
    uint64_t v51 = v50;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v51 = &type metadata for ContactsLabelCATContainer.LabelType;
    uint64_t v52 = KeyedDecodingContainer.codingPath.getter();
    OUTLINED_FUNCTION_31(v52, v53, 0x800000025C699610);
    OUTLINED_FUNCTION_13_2();
    uint64_t v54 = OUTLINED_FUNCTION_39();
    v55(v54);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v37, v48);
    goto LABEL_19;
  }
  uint64_t v59 = v37;
  uint64_t v41 = v32;
  v58[0] = 0;
  uint64_t v42 = *(unsigned __int8 *)(v39 + 32);
  specialized ArraySlice.subscript.getter(1, v40, v39, v39 + 32, 0, (2 * v40) | 1);
  uint64_t v44 = v43;
  unint64_t v46 = v45;
  swift_bridgeObjectRelease();
  if (v44 != v46 >> 1)
  {
    uint64_t v48 = v41;
    uint64_t v49 = v81;
    uint64_t v37 = v59;
    goto LABEL_8;
  }
  uint64_t v47 = v78;
  switch(v42)
  {
    case 1:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys();
      OUTLINED_FUNCTION_4_5();
      OUTLINED_FUNCTION_88();
      break;
    case 2:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys();
      OUTLINED_FUNCTION_4_5();
      OUTLINED_FUNCTION_89();
      break;
    case 3:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys();
      OUTLINED_FUNCTION_4_5();
      OUTLINED_FUNCTION_88();
      break;
    case 4:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys();
      OUTLINED_FUNCTION_4_5();
      goto LABEL_17;
    case 5:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys();
      OUTLINED_FUNCTION_4_5();
      OUTLINED_FUNCTION_40();
      break;
    case 6:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys();
      OUTLINED_FUNCTION_4_5();
      goto LABEL_17;
    case 7:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys();
      OUTLINED_FUNCTION_4_5();
      goto LABEL_17;
    case 8:
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys();
      OUTLINED_FUNCTION_4_5();
LABEL_17:
      OUTLINED_FUNCTION_88();
      break;
    default:
      char v82 = 0;
      lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys();
      OUTLINED_FUNCTION_4_5();
      OUTLINED_FUNCTION_40();
      break;
  }
  OUTLINED_FUNCTION_1_8();
  v56();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_1_8();
  v57();
  unsigned char *v47 = v42;
LABEL_19:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v80);
  OUTLINED_FUNCTION_3_6();
}

void protocol witness for static CaseIterable.allCases.getter in conformance ContactsLabelCATContainer.LabelType(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static ContactsLabelCATContainer.LabelType.allCases.getter;
}

void protocol witness for Decodable.init(from:) in conformance ContactsLabelCATContainer.LabelType()
{
}

void protocol witness for Encodable.encode(to:) in conformance ContactsLabelCATContainer.LabelType()
{
}

uint64_t ContactsLabelCATContainer.localizedAttributeLabels.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ContactsLabelCATContainer.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x736C6562616CLL && a2 == 0xE600000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000025C699740)
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

Swift::Int ContactsSnippetFlowState.ConfirmCodingKeys.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

uint64_t ContactsLabelCATContainer.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000018;
  }
  else {
    return 0x736C6562616CLL;
  }
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ContactsLabelCATContainer.CodingKeys()
{
  return ContactsLabelCATContainer.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsLabelCATContainer.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = ContactsLabelCATContainer.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ContactsLabelCATContainer.encode(to:)()
{
  OUTLINED_FUNCTION_2_7();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_5();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys();
  OUTLINED_FUNCTION_26_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ContactsLabelCATContainer.LabelType : String]);
  lazy protocol witness table accessor for type [ContactsLabelCATContainer.LabelType : String] and conformance <> [A : B]((uint64_t)&lazy protocol witness table cache variable for type [ContactsLabelCATContainer.LabelType : String] and conformance <> [A : B]);
  OUTLINED_FUNCTION_33();
  if (!v0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    lazy protocol witness table accessor for type [String : String] and conformance <> [A : B]((uint64_t)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
    OUTLINED_FUNCTION_33();
  }
  uint64_t v4 = OUTLINED_FUNCTION_19_0();
  v5(v4);
  OUTLINED_FUNCTION_3_6();
}

void ContactsLabelCATContainer.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_7();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.CodingKeys>);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_12_2();
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  lazy protocol witness table accessor for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v10)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ContactsLabelCATContainer.LabelType : String]);
    lazy protocol witness table accessor for type [ContactsLabelCATContainer.LabelType : String] and conformance <> [A : B]((uint64_t)&lazy protocol witness table cache variable for type [ContactsLabelCATContainer.LabelType : String] and conformance <> [A : B]);
    OUTLINED_FUNCTION_72();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    lazy protocol witness table accessor for type [String : String] and conformance <> [A : B]((uint64_t)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_72();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v16 = OUTLINED_FUNCTION_82();
    v17(v16);
    *uint64_t v14 = a10;
    v14[1] = a10;
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_3_6();
}

BOOL CodableContact.CodingKeys.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of CodableContact.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

uint64_t CodableContact.CodingKeys.stringValue.getter()
{
  return 1635017060;
}

void protocol witness for Decodable.init(from:) in conformance ContactsLabelCATContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ContactsLabelCATContainer.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void protocol witness for Encodable.encode(to:) in conformance ContactsLabelCATContainer()
{
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CodableContact<A>.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D338];
  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CodableContact<A>.CodingKeys(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CodableContact<A>.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance CodableContact<A>.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

BOOL protocol witness for RawRepresentable.init(rawValue:) in conformance CodableContact<A>.CodingKeys@<W0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = CodableContact.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance CodableContact<A>.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CodableContact.CodingKeys.stringValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance CodableContact<A>.CodingKeys@<X0>(BOOL *a1@<X8>)
{
  uint64_t result = CodableContact.CodingKeys.init(stringValue:)();
  *a1 = result != 0;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance CodableContact<A>.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CodableContact<A>.CodingKeys(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CodableContact<A>.CodingKeys(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t static CodableContact.Error.== infix(_:_:)()
{
  return 1;
}

void CodableContact.Error.hash(into:)()
{
}

Swift::Int CodableContact.Error.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CodableContact<A>.Error()
{
  return CodableContact.Error.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance CodableContact<A>.Error()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CodableContact<A>.Error()
{
  return Hasher._finalize()();
}

id CodableContact.wrappedValue.getter()
{
  return *v0;
}

void CodableContact.wrappedValue.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*CodableContact.wrappedValue.modify())()
{
  return destructiveProjectEnumData for SiriHighlightedPropertyType;
}

uint64_t CodableContact.init(wrappedValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void CodableContact.init(from:)()
{
  OUTLINED_FUNCTION_2_7();
  Swift::String v2 = v1;
  uint64_t v21 = v3;
  type metadata accessor for CodableContact.CodingKeys();
  swift_getWitnessTable();
  type metadata accessor for KeyedDecodingContainer();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  uint64_t v5 = v0;
  if (!v0)
  {
    lazy protocol witness table accessor for type Data and conformance Data();
    OUTLINED_FUNCTION_81();
    type metadata accessor for NSKeyedUnarchiver();
    uint64_t v8 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
    id v18 = (id)v8;
    if (v8)
    {
      uint64_t v19 = OUTLINED_FUNCTION_32();
      v20(v19);
      outlined consume of Data._Representation(v22, v23);
      goto LABEL_9;
    }
    type metadata accessor for CodableContact.Error();
    swift_getWitnessTable();
    uint64_t v5 = (void *)OUTLINED_FUNCTION_46();
    swift_willThrow();
    outlined consume of Data._Representation(v22, v23);
    uint64_t v6 = OUTLINED_FUNCTION_32();
    v7(v6);
  }
  if (one-time initialization token for siriContacts != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriContacts);
  id v10 = v5;
  id v11 = v5;
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v22 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_getErrorValue();
    uint64_t v16 = Error.localizedDescription.getter();
    uint64_t v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C66B000, v12, v13, "Failed to decode, will make an empty CNContact instead. Error: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26118F050](v15, -1, -1);
    MEMORY[0x26118F050](v14, -1, -1);
  }
  else
  {
  }
  id v18 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

LABEL_9:
  *uint64_t v21 = v18;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_3_6();
}

void CodableContact.encode(to:)()
{
  OUTLINED_FUNCTION_2_7();
  Swift::String v2 = v1;
  v13[2] = *(id *)MEMORY[0x263EF8340];
  type metadata accessor for CodableContact.CodingKeys();
  swift_getWitnessTable();
  type metadata accessor for KeyedEncodingContainer();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = *v0;
  uint64_t v5 = self;
  v13[0] = 0;
  id v6 = objc_msgSend(v5, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v4, 1, v13);
  id v7 = v13[0];
  if (v6)
  {
    uint64_t v8 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    id v10 = v9;

    __swift_project_boxed_opaque_existential_1(v2, v2[3]);
    dispatch thunk of Encoder.container<A>(keyedBy:)();
    v13[0] = v8;
    v13[1] = v10;
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    OUTLINED_FUNCTION_1_8();
    v11();
    outlined consume of Data._Representation((uint64_t)v8, (unint64_t)v10);
  }
  else
  {
    uint64_t v12 = v7;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  OUTLINED_FUNCTION_3_6();
}

void protocol witness for Decodable.init(from:) in conformance CodableContact<A>()
{
}

void protocol witness for Encodable.encode(to:) in conformance CodableContact<A>()
{
}

uint64_t type metadata accessor for GetContactSnippetModel(uint64_t a1)
{
  return type metadata accessor for GetContactAttributeSnippetModel(a1, (uint64_t *)&type metadata singleton initialization cache for GetContactSnippetModel);
}

uint64_t type metadata accessor for GetContactAttributeSnippetModel(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_41(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys);
  }
  return result;
}

uint64_t outlined copy of ContactsSnippetFlowState(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a2 & 0xF000000000000000) != 0xB000000000000000 && (a2 & 0xF000000000000000) != 0x7000000000000000)
  {
    outlined copy of Data?(result, a2);
    return outlined copy of Data?(a3, a4);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel()
{
  unint64_t result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_41(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    lazy protocol witness table accessor for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer();
    lazy protocol witness table accessor for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_41(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>((uint64_t)&lazy protocol witness table cache variable for type CodableContact<CNContact> and conformance CodableContact<A>);
    lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>((uint64_t)&lazy protocol witness table cache variable for type CodableContact<CNContact> and conformance CodableContact<A>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t outlined consume of ContactsSnippetFlowState(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a2 & 0xF000000000000000) != 0xB000000000000000 && (a2 & 0xF000000000000000) != 0x7000000000000000)
  {
    outlined consume of Data?(result, a2);
    return outlined consume of Data?(a3, a4);
  }
  return result;
}

uint64_t outlined init with copy of ContactsSnippetPluginModel(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_8_5();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute()
{
  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [GetContactAttributeSnippetModel.DisplayAttribute] and conformance <A> [A](uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_41(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GetContactAttributeSnippetModel.DisplayAttribute]);
    v4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys);
  }
  return result;
}

uint64_t outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  return swift_bridgeObjectRetain();
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType);
  }
  return result;
}

uint64_t outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  return swift_bridgeObjectRelease();
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys);
  }
  return result;
}

uint64_t specialized ArraySlice.subscript.getter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType()
{
  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType);
  }
  return result;
}

uint64_t type metadata accessor for CodableContact.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t type metadata accessor for NSKeyedUnarchiver()
{
  unint64_t result = lazy cache variable for type metadata for NSKeyedUnarchiver;
  if (!lazy cache variable for type metadata for NSKeyedUnarchiver)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSKeyedUnarchiver);
  }
  return result;
}

uint64_t type metadata accessor for CodableContact.Error()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t base witness table accessor for Decodable in ContactsSnippetPluginModel()
{
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel);
}

unint64_t base witness table accessor for Encodable in ContactsSnippetPluginModel()
{
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel);
}

unint64_t associated type witness table accessor for CaseIterable.AllCases : Collection in ContactsSnippetFlowState()
{
  return lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>((uint64_t)&lazy protocol witness table cache variable for type [ContactsSnippetFlowState] and conformance [A]);
}

unint64_t base witness table accessor for Decodable in GetContactSnippetModel()
{
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactSnippetModel and conformance GetContactSnippetModel);
}

unint64_t base witness table accessor for Encodable in GetContactSnippetModel()
{
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactSnippetModel and conformance GetContactSnippetModel);
}

unint64_t associated type witness table accessor for CaseIterable.AllCases : Collection in GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  return lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>((uint64_t)&lazy protocol witness table cache variable for type [GetContactAttributeSnippetModel.DisplayAttribute.AttributeType] and conformance [A]);
}

unint64_t base witness table accessor for Decodable in GetContactAttributeSnippetModel()
{
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel and conformance GetContactAttributeSnippetModel);
}

unint64_t base witness table accessor for Encodable in GetContactAttributeSnippetModel()
{
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel and conformance GetContactAttributeSnippetModel);
}

unint64_t base witness table accessor for Decodable in ModifyContactAttributeSnippetModel()
{
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel);
}

unint64_t base witness table accessor for Encodable in ModifyContactAttributeSnippetModel()
{
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel);
}

unint64_t associated type witness table accessor for CaseIterable.AllCases : Collection in ContactsLabelCATContainer.LabelType()
{
  return lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>((uint64_t)&lazy protocol witness table cache variable for type [ContactsLabelCATContainer.LabelType] and conformance [A]);
}

unint64_t lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_41(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in CodableContact<A>.Error()
{
  return swift_getWitnessTable();
}

uint64_t sub_25C68BE08(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for GetContactSnippetModel.labelCATs : GetContactSnippetModel(a1, a2, a3, a4, (uint64_t (*)(void *))GetContactSnippetModel.labelCATs.setter);
}

uint64_t sub_25C68BE48(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for GetContactSnippetModel.labelCATs : GetContactSnippetModel(a1, a2, a3, a4, (uint64_t (*)(void *))ModifyContactAttributeSnippetModel.labelCATs.setter);
}

uint64_t initializeBufferWithCopyOfBuffer for ContactsSnippetPluginModel(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)a1 = *a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v17 = *a2;
      uint64_t v18 = a2[1];
      char v19 = *((unsigned char *)a2 + 16);
      outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
      *(void *)a1 = v17;
      *(void *)(a1 + 8) = v18;
      *(unsigned char *)(a1 + 16) = v19;
      *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
      uint64_t v20 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
      uint64_t v21 = v20[6];
      uint64_t v22 = a1 + v21;
      uint64_t v23 = (uint64_t)a2 + v21;
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
      uint64_t v25 = v20[7];
      uint64_t v26 = a1 + v25;
      uint64_t v27 = (uint64_t *)((char *)a2 + v25);
      unint64_t v28 = *(uint64_t *)((char *)a2 + v25 + 8);
      if ((v28 & 0xF000000000000000) == 0xB000000000000000 || (v28 & 0xF000000000000000) == 0x7000000000000000)
      {
        long long v30 = *((_OWORD *)v27 + 1);
        *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
        *(_OWORD *)(v26 + 16) = v30;
      }
      else
      {
        if (v28 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
        }
        else
        {
          uint64_t v53 = *v27;
          outlined copy of Data._Representation(*v27, v28);
          *(void *)uint64_t v26 = v53;
          *(void *)(v26 + 8) = v28;
        }
        uint64_t v54 = v27 + 2;
        unint64_t v55 = v27[3];
        if (v55 >> 60 == 15)
        {
          *(_OWORD *)(v26 + 16) = *(_OWORD *)v54;
        }
        else
        {
          uint64_t v62 = *v54;
          outlined copy of Data._Representation(*v54, v27[3]);
          *(void *)(v26 + 16) = v62;
          *(void *)(v26 + 24) = v55;
        }
      }
      uint64_t v63 = v20[8];
      uint64_t v64 = a1 + v63;
      uint64_t v65 = (uint64_t)a2 + v63;
      uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 16))(v64, v65, v66);
      uint64_t v67 = v20[9];
      uint64_t v68 = a1 + v67;
      uint64_t v69 = (uint64_t *)((char *)a2 + v67);
      unint64_t v70 = v69[1];
      if (v70 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v68 = *(_OWORD *)v69;
      }
      else
      {
        uint64_t v71 = *v69;
        outlined copy of Data._Representation(*v69, v69[1]);
        *(void *)uint64_t v68 = v71;
        *(void *)(v68 + 8) = v70;
      }
      uint64_t v72 = v20[10];
      uint64_t v73 = a1 + v72;
      uint64_t v74 = (uint64_t *)((char *)a2 + v72);
      unint64_t v75 = v74[1];
      if (v75 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v73 = *(_OWORD *)v74;
      }
      else
      {
        uint64_t v76 = *v74;
        outlined copy of Data._Representation(*v74, v74[1]);
        *(void *)uint64_t v73 = v76;
        *(void *)(v73 + 8) = v75;
      }
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *(void *)a1 = *a2;
      uint64_t ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
      uint64_t v8 = ContactAttributeSnippetModel[5];
      uint64_t v9 = a1 + v8;
      uint64_t v10 = (uint64_t)a2 + v8;
      swift_bridgeObjectRetain();
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      uint64_t v12 = ContactAttributeSnippetModel[6];
      uint64_t v13 = a1 + v12;
      uint64_t v14 = (uint64_t *)((char *)a2 + v12);
      unint64_t v15 = *(uint64_t *)((char *)a2 + v12 + 8);
      if (v15 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
      }
      else
      {
        uint64_t v37 = *v14;
        outlined copy of Data._Representation(*v14, v15);
        *(void *)uint64_t v13 = v37;
        *(void *)(v13 + 8) = v15;
      }
      uint64_t v38 = v14[3];
      *(void *)(v13 + 16) = v14[2];
      *(void *)(v13 + 24) = v38;
      *(void *)(v13 + 32) = v14[4];
      uint64_t v39 = ContactAttributeSnippetModel[7];
      uint64_t v40 = a1 + v39;
      uint64_t v41 = (uint64_t *)((char *)a2 + v39);
      unint64_t v42 = *(uint64_t *)((char *)a2 + v39 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v42 & 0xF000000000000000) == 0xB000000000000000 || (v42 & 0xF000000000000000) == 0x7000000000000000)
      {
        long long v44 = *((_OWORD *)v41 + 1);
        *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
        *(_OWORD *)(v40 + 16) = v44;
      }
      else
      {
        if (v42 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
        }
        else
        {
          uint64_t v56 = *v41;
          outlined copy of Data._Representation(*v41, v42);
          *(void *)uint64_t v40 = v56;
          *(void *)(v40 + 8) = v42;
        }
        uint64_t v57 = v41 + 2;
        unint64_t v58 = v41[3];
        if (v58 >> 60 == 15)
        {
          *(_OWORD *)(v40 + 16) = *(_OWORD *)v57;
        }
        else
        {
          uint64_t v77 = *v57;
          outlined copy of Data._Representation(*v57, v41[3]);
          *(void *)(v40 + 16) = v77;
          *(void *)(v40 + 24) = v58;
        }
      }
      uint64_t v78 = ContactAttributeSnippetModel[8];
      uint64_t v79 = (void *)(a1 + v78);
      uint64_t v80 = (uint64_t *)((char *)a2 + v78);
      uint64_t v81 = v80[1];
      *uint64_t v79 = *v80;
      v79[1] = v81;
      *(unsigned char *)(a1 + ContactAttributeSnippetModel[9]) = *((unsigned char *)a2 + ContactAttributeSnippetModel[9]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v31 - 8) + 16))(a1, a2, v31);
      uint64_t ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
      uint64_t v33 = ContactSnippetModel[5];
      uint64_t v34 = a1 + v33;
      uint64_t v35 = (uint64_t *)((char *)a2 + v33);
      unint64_t v36 = *(uint64_t *)((char *)a2 + v33 + 8);
      if (v36 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
      }
      else
      {
        uint64_t v45 = *v35;
        outlined copy of Data._Representation(*v35, v36);
        *(void *)uint64_t v34 = v45;
        *(void *)(v34 + 8) = v36;
      }
      uint64_t v46 = v35[3];
      *(void *)(v34 + 16) = v35[2];
      *(void *)(v34 + 24) = v46;
      *(void *)(v34 + 32) = v35[4];
      uint64_t v47 = ContactSnippetModel[6];
      uint64_t v48 = a1 + v47;
      uint64_t v49 = (uint64_t *)((char *)a2 + v47);
      unint64_t v50 = *(uint64_t *)((char *)a2 + v47 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v50 & 0xF000000000000000) == 0xB000000000000000 || (v50 & 0xF000000000000000) == 0x7000000000000000)
      {
        long long v52 = *((_OWORD *)v49 + 1);
        *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
        *(_OWORD *)(v48 + 16) = v52;
      }
      else
      {
        if (v50 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
        }
        else
        {
          uint64_t v59 = *v49;
          outlined copy of Data._Representation(*v49, v50);
          *(void *)uint64_t v48 = v59;
          *(void *)(v48 + 8) = v50;
        }
        uint64_t v60 = v49 + 2;
        unint64_t v61 = v49[3];
        if (v61 >> 60 == 15)
        {
          *(_OWORD *)(v48 + 16) = *(_OWORD *)v60;
        }
        else
        {
          uint64_t v82 = *v60;
          outlined copy of Data._Representation(*v60, v49[3]);
          *(void *)(v48 + 16) = v82;
          *(void *)(v48 + 24) = v61;
        }
      }
      uint64_t v83 = ContactSnippetModel[7];
      uint64_t v84 = a1 + v83;
      uint64_t v85 = (uint64_t)a2 + v83;
      uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v86 - 8) + 16))(v84, v85, v86);
      *(unsigned char *)(a1 + ContactSnippetModel[8]) = *((unsigned char *)a2 + ContactSnippetModel[8]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ContactsSnippetPluginModel(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch(result)
  {
    case 2:
      outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
      uint64_t v14 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
      uint64_t v15 = a1 + v14[6];
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
      uint64_t v17 = (uint64_t *)(a1 + v14[7]);
      unint64_t v18 = v17[1];
      if ((v18 & 0xF000000000000000) != 0xB000000000000000 && (v18 & 0xF000000000000000) != 0x7000000000000000)
      {
        if (v18 >> 60 != 15) {
          outlined consume of Data._Representation(*v17, v18);
        }
        unint64_t v20 = v17[3];
        if (v20 >> 60 != 15) {
          outlined consume of Data._Representation(v17[2], v20);
        }
      }
      uint64_t v21 = a1 + v14[8];
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
      uint64_t v23 = (uint64_t *)(a1 + v14[9]);
      unint64_t v24 = v23[1];
      if (v24 >> 60 != 15) {
        uint64_t result = outlined consume of Data._Representation(*v23, v24);
      }
      uint64_t v25 = (uint64_t *)(a1 + v14[10]);
      unint64_t v26 = v25[1];
      if (v26 >> 60 != 15)
      {
        uint64_t v36 = *v25;
        return outlined consume of Data._Representation(v36, v26);
      }
      break;
    case 1:
      swift_bridgeObjectRelease();
      uint64_t ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
      uint64_t v28 = a1 + ContactAttributeSnippetModel[5];
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
      long long v30 = (uint64_t *)(a1 + ContactAttributeSnippetModel[6]);
      unint64_t v31 = v30[1];
      if (v31 >> 60 != 15) {
        outlined consume of Data._Representation(*v30, v31);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v32 = (uint64_t *)(a1 + ContactAttributeSnippetModel[7]);
      unint64_t v33 = v32[1];
      if ((v33 & 0xF000000000000000) != 0xB000000000000000 && (v33 & 0xF000000000000000) != 0x7000000000000000)
      {
        if (v33 >> 60 != 15) {
          outlined consume of Data._Representation(*v32, v33);
        }
        unint64_t v35 = v32[3];
        if (v35 >> 60 != 15) {
          outlined consume of Data._Representation(v32[2], v35);
        }
      }
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 0:
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
      uint64_t ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
      int v5 = (uint64_t *)(a1 + ContactSnippetModel[5]);
      unint64_t v6 = v5[1];
      if (v6 >> 60 != 15) {
        outlined consume of Data._Representation(*v5, v6);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v7 = (uint64_t *)(a1 + ContactSnippetModel[6]);
      unint64_t v8 = v7[1];
      if ((v8 & 0xF000000000000000) != 0xB000000000000000 && (v8 & 0xF000000000000000) != 0x7000000000000000)
      {
        if (v8 >> 60 != 15) {
          outlined consume of Data._Representation(*v7, v8);
        }
        unint64_t v10 = v7[3];
        if (v10 >> 60 != 15) {
          outlined consume of Data._Representation(v7[2], v10);
        }
      }
      uint64_t v11 = a1 + ContactSnippetModel[7];
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
      return v13(v11, v12);
  }
  return result;
}

uint64_t initializeWithCopy for ContactsSnippetPluginModel(uint64_t a1, uint64_t *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v14 = *a2;
    uint64_t v15 = a2[1];
    char v16 = *((unsigned char *)a2 + 16);
    outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v15;
    *(unsigned char *)(a1 + 16) = v16;
    *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
    uint64_t v17 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
    uint64_t v18 = v17[6];
    uint64_t v19 = a1 + v18;
    uint64_t v20 = (uint64_t)a2 + v18;
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = v17[7];
    uint64_t v23 = a1 + v22;
    unint64_t v24 = (uint64_t *)((char *)a2 + v22);
    unint64_t v25 = *(uint64_t *)((char *)a2 + v22 + 8);
    if ((v25 & 0xF000000000000000) == 0xB000000000000000 || (v25 & 0xF000000000000000) == 0x7000000000000000)
    {
      long long v27 = *((_OWORD *)v24 + 1);
      *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
      *(_OWORD *)(v23 + 16) = v27;
    }
    else
    {
      if (v25 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
      }
      else
      {
        uint64_t v50 = *v24;
        outlined copy of Data._Representation(*v24, v25);
        *(void *)uint64_t v23 = v50;
        *(void *)(v23 + 8) = v25;
      }
      uint64_t v51 = v24 + 2;
      unint64_t v52 = v24[3];
      if (v52 >> 60 == 15)
      {
        *(_OWORD *)(v23 + 16) = *(_OWORD *)v51;
      }
      else
      {
        uint64_t v59 = *v51;
        outlined copy of Data._Representation(*v51, v24[3]);
        *(void *)(v23 + 16) = v59;
        *(void *)(v23 + 24) = v52;
      }
    }
    uint64_t v60 = v17[8];
    uint64_t v61 = a1 + v60;
    uint64_t v62 = (uint64_t)a2 + v60;
    uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 16))(v61, v62, v63);
    uint64_t v64 = v17[9];
    uint64_t v65 = a1 + v64;
    uint64_t v66 = (uint64_t *)((char *)a2 + v64);
    unint64_t v67 = v66[1];
    if (v67 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v65 = *(_OWORD *)v66;
    }
    else
    {
      uint64_t v68 = *v66;
      outlined copy of Data._Representation(*v66, v66[1]);
      *(void *)uint64_t v65 = v68;
      *(void *)(v65 + 8) = v67;
    }
    uint64_t v69 = v17[10];
    uint64_t v70 = a1 + v69;
    uint64_t v71 = (uint64_t *)((char *)a2 + v69);
    unint64_t v72 = v71[1];
    if (v72 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v70 = *(_OWORD *)v71;
    }
    else
    {
      uint64_t v73 = *v71;
      outlined copy of Data._Representation(*v71, v71[1]);
      *(void *)uint64_t v70 = v73;
      *(void *)(v70 + 8) = v72;
    }
  }
  else if (EnumCaseMultiPayload == 1)
  {
    *(void *)a1 = *a2;
    uint64_t ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
    uint64_t v6 = ContactAttributeSnippetModel[5];
    uint64_t v7 = a1 + v6;
    uint64_t v8 = (uint64_t)a2 + v6;
    swift_bridgeObjectRetain();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    uint64_t v10 = ContactAttributeSnippetModel[6];
    uint64_t v11 = a1 + v10;
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    unint64_t v13 = *(uint64_t *)((char *)a2 + v10 + 8);
    if (v13 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    }
    else
    {
      uint64_t v34 = *v12;
      outlined copy of Data._Representation(*v12, v13);
      *(void *)uint64_t v11 = v34;
      *(void *)(v11 + 8) = v13;
    }
    uint64_t v35 = v12[3];
    *(void *)(v11 + 16) = v12[2];
    *(void *)(v11 + 24) = v35;
    *(void *)(v11 + 32) = v12[4];
    uint64_t v36 = ContactAttributeSnippetModel[7];
    uint64_t v37 = a1 + v36;
    uint64_t v38 = (uint64_t *)((char *)a2 + v36);
    unint64_t v39 = *(uint64_t *)((char *)a2 + v36 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v39 & 0xF000000000000000) == 0xB000000000000000 || (v39 & 0xF000000000000000) == 0x7000000000000000)
    {
      long long v41 = *((_OWORD *)v38 + 1);
      *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
      *(_OWORD *)(v37 + 16) = v41;
    }
    else
    {
      if (v39 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
      }
      else
      {
        uint64_t v53 = *v38;
        outlined copy of Data._Representation(*v38, v39);
        *(void *)uint64_t v37 = v53;
        *(void *)(v37 + 8) = v39;
      }
      uint64_t v54 = v38 + 2;
      unint64_t v55 = v38[3];
      if (v55 >> 60 == 15)
      {
        *(_OWORD *)(v37 + 16) = *(_OWORD *)v54;
      }
      else
      {
        uint64_t v74 = *v54;
        outlined copy of Data._Representation(*v54, v38[3]);
        *(void *)(v37 + 16) = v74;
        *(void *)(v37 + 24) = v55;
      }
    }
    uint64_t v75 = ContactAttributeSnippetModel[8];
    uint64_t v76 = (void *)(a1 + v75);
    uint64_t v77 = (uint64_t *)((char *)a2 + v75);
    uint64_t v78 = v77[1];
    void *v76 = *v77;
    v76[1] = v78;
    *(unsigned char *)(a1 + ContactAttributeSnippetModel[9]) = *((unsigned char *)a2 + ContactAttributeSnippetModel[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v28 - 8) + 16))(a1, a2, v28);
    uint64_t ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
    uint64_t v30 = ContactSnippetModel[5];
    uint64_t v31 = a1 + v30;
    uint64_t v32 = (uint64_t *)((char *)a2 + v30);
    unint64_t v33 = *(uint64_t *)((char *)a2 + v30 + 8);
    if (v33 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
    }
    else
    {
      uint64_t v42 = *v32;
      outlined copy of Data._Representation(*v32, v33);
      *(void *)uint64_t v31 = v42;
      *(void *)(v31 + 8) = v33;
    }
    uint64_t v43 = v32[3];
    *(void *)(v31 + 16) = v32[2];
    *(void *)(v31 + 24) = v43;
    *(void *)(v31 + 32) = v32[4];
    uint64_t v44 = ContactSnippetModel[6];
    uint64_t v45 = a1 + v44;
    uint64_t v46 = (uint64_t *)((char *)a2 + v44);
    unint64_t v47 = *(uint64_t *)((char *)a2 + v44 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v47 & 0xF000000000000000) == 0xB000000000000000 || (v47 & 0xF000000000000000) == 0x7000000000000000)
    {
      long long v49 = *((_OWORD *)v46 + 1);
      *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
      *(_OWORD *)(v45 + 16) = v49;
    }
    else
    {
      if (v47 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
      }
      else
      {
        uint64_t v56 = *v46;
        outlined copy of Data._Representation(*v46, v47);
        *(void *)uint64_t v45 = v56;
        *(void *)(v45 + 8) = v47;
      }
      uint64_t v57 = v46 + 2;
      unint64_t v58 = v46[3];
      if (v58 >> 60 == 15)
      {
        *(_OWORD *)(v45 + 16) = *(_OWORD *)v57;
      }
      else
      {
        uint64_t v79 = *v57;
        outlined copy of Data._Representation(*v57, v46[3]);
        *(void *)(v45 + 16) = v79;
        *(void *)(v45 + 24) = v58;
      }
    }
    uint64_t v80 = ContactSnippetModel[7];
    uint64_t v81 = a1 + v80;
    uint64_t v82 = (uint64_t)a2 + v80;
    uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v83 - 8) + 16))(v81, v82, v83);
    *(unsigned char *)(a1 + ContactSnippetModel[8]) = *((unsigned char *)a2 + ContactSnippetModel[8]);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ContactsSnippetPluginModel(uint64_t a1, uint64_t *a2)
{
  if ((uint64_t *)a1 != a2)
  {
    outlined destroy of ModifyContactAttributeSnippetModel(a1, (void (*)(void))type metadata accessor for ContactsSnippetPluginModel);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v14 = *a2;
      uint64_t v15 = a2[1];
      char v16 = *((unsigned char *)a2 + 16);
      outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v15;
      *(unsigned char *)(a1 + 16) = v16;
      *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
      uint64_t v17 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
      uint64_t v18 = v17[6];
      uint64_t v19 = a1 + v18;
      uint64_t v20 = (uint64_t)a2 + v18;
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
      uint64_t v22 = v17[7];
      uint64_t v23 = a1 + v22;
      unint64_t v24 = (uint64_t *)((char *)a2 + v22);
      unint64_t v25 = *(uint64_t *)((char *)a2 + v22 + 8);
      if ((v25 & 0xF000000000000000) == 0xB000000000000000 || (v25 & 0xF000000000000000) == 0x7000000000000000)
      {
        long long v27 = *((_OWORD *)v24 + 1);
        *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
        *(_OWORD *)(v23 + 16) = v27;
      }
      else
      {
        if (v25 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
        }
        else
        {
          uint64_t v52 = *v24;
          outlined copy of Data._Representation(*v24, v25);
          *(void *)uint64_t v23 = v52;
          *(void *)(v23 + 8) = v25;
        }
        uint64_t v53 = v24 + 2;
        unint64_t v54 = v24[3];
        if (v54 >> 60 == 15)
        {
          *(_OWORD *)(v23 + 16) = *(_OWORD *)v53;
        }
        else
        {
          uint64_t v58 = *v53;
          outlined copy of Data._Representation(*v53, v24[3]);
          *(void *)(v23 + 16) = v58;
          *(void *)(v23 + 24) = v54;
        }
      }
      uint64_t v59 = v17[8];
      uint64_t v60 = a1 + v59;
      uint64_t v61 = (uint64_t)a2 + v59;
      uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 16))(v60, v61, v62);
      uint64_t v63 = v17[9];
      uint64_t v64 = a1 + v63;
      uint64_t v65 = (uint64_t *)((char *)a2 + v63);
      unint64_t v66 = v65[1];
      if (v66 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v64 = *(_OWORD *)v65;
      }
      else
      {
        uint64_t v67 = *v65;
        outlined copy of Data._Representation(*v65, v65[1]);
        *(void *)uint64_t v64 = v67;
        *(void *)(v64 + 8) = v66;
      }
      uint64_t v68 = v17[10];
      uint64_t v69 = a1 + v68;
      uint64_t v70 = (uint64_t *)((char *)a2 + v68);
      unint64_t v71 = v70[1];
      if (v71 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v69 = *(_OWORD *)v70;
      }
      else
      {
        uint64_t v72 = *v70;
        outlined copy of Data._Representation(*v70, v70[1]);
        *(void *)uint64_t v69 = v72;
        *(void *)(v69 + 8) = v71;
      }
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *(void *)a1 = *a2;
      uint64_t ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
      uint64_t v6 = ContactAttributeSnippetModel[5];
      uint64_t v7 = a1 + v6;
      uint64_t v8 = (uint64_t)a2 + v6;
      swift_bridgeObjectRetain();
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      uint64_t v10 = ContactAttributeSnippetModel[6];
      uint64_t v11 = a1 + v10;
      uint64_t v12 = (uint64_t *)((char *)a2 + v10);
      unint64_t v13 = *(uint64_t *)((char *)a2 + v10 + 8);
      if (v13 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
      }
      else
      {
        uint64_t v34 = *v12;
        outlined copy of Data._Representation(*v12, v13);
        *(void *)uint64_t v11 = v34;
        *(void *)(v11 + 8) = v13;
      }
      *(void *)(v11 + 16) = v12[2];
      *(void *)(v11 + 24) = v12[3];
      *(void *)(v11 + 32) = v12[4];
      uint64_t v35 = ContactAttributeSnippetModel[7];
      uint64_t v36 = a1 + v35;
      uint64_t v37 = (uint64_t *)((char *)a2 + v35);
      unint64_t v38 = *(uint64_t *)((char *)a2 + v35 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v38 & 0xF000000000000000) == 0xB000000000000000 || (v38 & 0xF000000000000000) == 0x7000000000000000)
      {
        long long v40 = *((_OWORD *)v37 + 1);
        *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
        *(_OWORD *)(v36 + 16) = v40;
      }
      else
      {
        if (v38 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
        }
        else
        {
          uint64_t v55 = *v37;
          outlined copy of Data._Representation(*v37, v38);
          *(void *)uint64_t v36 = v55;
          *(void *)(v36 + 8) = v38;
        }
        uint64_t v56 = v37 + 2;
        unint64_t v57 = v37[3];
        if (v57 >> 60 == 15)
        {
          *(_OWORD *)(v36 + 16) = *(_OWORD *)v56;
        }
        else
        {
          uint64_t v73 = *v56;
          outlined copy of Data._Representation(*v56, v37[3]);
          *(void *)(v36 + 16) = v73;
          *(void *)(v36 + 24) = v57;
        }
      }
      uint64_t v74 = ContactAttributeSnippetModel[8];
      uint64_t v75 = (void *)(a1 + v74);
      uint64_t v76 = (uint64_t *)((char *)a2 + v74);
      *uint64_t v75 = *v76;
      v75[1] = v76[1];
      *(unsigned char *)(a1 + ContactAttributeSnippetModel[9]) = *((unsigned char *)a2 + ContactAttributeSnippetModel[9]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v28 - 8) + 16))(a1, a2, v28);
      uint64_t ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
      uint64_t v30 = ContactSnippetModel[5];
      uint64_t v31 = a1 + v30;
      uint64_t v32 = (uint64_t *)((char *)a2 + v30);
      unint64_t v33 = *(uint64_t *)((char *)a2 + v30 + 8);
      if (v33 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
      }
      else
      {
        uint64_t v41 = *v32;
        outlined copy of Data._Representation(*v32, v33);
        *(void *)uint64_t v31 = v41;
        *(void *)(v31 + 8) = v33;
      }
      *(void *)(v31 + 16) = v32[2];
      *(void *)(v31 + 24) = v32[3];
      *(void *)(v31 + 32) = v32[4];
      uint64_t v42 = ContactSnippetModel[6];
      uint64_t v43 = a1 + v42;
      uint64_t v44 = (uint64_t *)((char *)a2 + v42);
      unint64_t v45 = *(uint64_t *)((char *)a2 + v42 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v45 & 0xF000000000000000) == 0xB000000000000000 || (v45 & 0xF000000000000000) == 0x7000000000000000)
      {
        long long v47 = *((_OWORD *)v44 + 1);
        *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
        *(_OWORD *)(v43 + 16) = v47;
      }
      else
      {
        if (v45 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
        }
        else
        {
          uint64_t v78 = *v44;
          outlined copy of Data._Representation(*v44, v45);
          *(void *)uint64_t v43 = v78;
          *(void *)(v43 + 8) = v45;
        }
        uint64_t v79 = v44 + 2;
        unint64_t v80 = v44[3];
        if (v80 >> 60 == 15)
        {
          *(_OWORD *)(v43 + 16) = *(_OWORD *)v79;
        }
        else
        {
          uint64_t v81 = *v79;
          outlined copy of Data._Representation(*v79, v44[3]);
          *(void *)(v43 + 16) = v81;
          *(void *)(v43 + 24) = v80;
        }
      }
      uint64_t v48 = ContactSnippetModel[7];
      uint64_t v49 = a1 + v48;
      uint64_t v50 = (uint64_t)a2 + v48;
      uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
      *(unsigned char *)(a1 + ContactSnippetModel[8]) = *((unsigned char *)a2 + ContactSnippetModel[8]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for ContactsSnippetPluginModel(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
    uint64_t v19 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
    uint64_t v20 = v19[6];
    uint64_t v21 = a1 + v20;
    uint64_t v22 = a2 + v20;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
    uint64_t v24 = v19[7];
    unint64_t v25 = (_OWORD *)(a1 + v24);
    unint64_t v26 = (_OWORD *)(a2 + v24);
    long long v27 = v26[1];
    _OWORD *v25 = *v26;
    v25[1] = v27;
    uint64_t v28 = v19[8];
    uint64_t v29 = a1 + v28;
    uint64_t v30 = a2 + v28;
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
    *(_OWORD *)(a1 + v19[9]) = *(_OWORD *)(a2 + v19[9]);
    *(_OWORD *)(a1 + v19[10]) = *(_OWORD *)(a2 + v19[10]);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      *(void *)a1 = *(void *)a2;
      uint64_t ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
      uint64_t v6 = ContactAttributeSnippetModel[5];
      uint64_t v7 = a1 + v6;
      uint64_t v8 = a2 + v6;
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
      uint64_t v10 = ContactAttributeSnippetModel[6];
      uint64_t v11 = a1 + v10;
      uint64_t v12 = a2 + v10;
      long long v13 = *(_OWORD *)(v12 + 16);
      *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
      *(_OWORD *)(v11 + 16) = v13;
      *(void *)(v11 + 32) = *(void *)(v12 + 32);
      uint64_t v14 = ContactAttributeSnippetModel[7];
      uint64_t v15 = (_OWORD *)(a1 + v14);
      char v16 = (_OWORD *)(a2 + v14);
      long long v17 = v16[1];
      *uint64_t v15 = *v16;
      v15[1] = v17;
      *(_OWORD *)(a1 + ContactAttributeSnippetModel[8]) = *(_OWORD *)(a2 + ContactAttributeSnippetModel[8]);
      uint64_t v18 = ContactAttributeSnippetModel[9];
    }
    else
    {
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 32))(a1, a2, v32);
      uint64_t ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
      uint64_t v34 = ContactSnippetModel[5];
      uint64_t v35 = a1 + v34;
      uint64_t v36 = a2 + v34;
      long long v37 = *(_OWORD *)(v36 + 16);
      *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
      *(_OWORD *)(v35 + 16) = v37;
      *(void *)(v35 + 32) = *(void *)(v36 + 32);
      uint64_t v38 = ContactSnippetModel[6];
      unint64_t v39 = (_OWORD *)(a1 + v38);
      long long v40 = (_OWORD *)(a2 + v38);
      long long v41 = v40[1];
      *unint64_t v39 = *v40;
      v39[1] = v41;
      uint64_t v42 = ContactSnippetModel[7];
      uint64_t v43 = a1 + v42;
      uint64_t v44 = a2 + v42;
      uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 32))(v43, v44, v45);
      uint64_t v18 = ContactSnippetModel[8];
    }
    *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for ContactsSnippetPluginModel(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of ModifyContactAttributeSnippetModel(a1, (void (*)(void))type metadata accessor for ContactsSnippetPluginModel);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
      uint64_t v19 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
      uint64_t v20 = v19[6];
      uint64_t v21 = a1 + v20;
      uint64_t v22 = a2 + v20;
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
      uint64_t v24 = v19[7];
      unint64_t v25 = (_OWORD *)(a1 + v24);
      unint64_t v26 = (_OWORD *)(a2 + v24);
      long long v27 = v26[1];
      _OWORD *v25 = *v26;
      v25[1] = v27;
      uint64_t v28 = v19[8];
      uint64_t v29 = a1 + v28;
      uint64_t v30 = a2 + v28;
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
      *(_OWORD *)(a1 + v19[9]) = *(_OWORD *)(a2 + v19[9]);
      *(_OWORD *)(a1 + v19[10]) = *(_OWORD *)(a2 + v19[10]);
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        *(void *)a1 = *(void *)a2;
        uint64_t ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
        uint64_t v6 = ContactAttributeSnippetModel[5];
        uint64_t v7 = a1 + v6;
        uint64_t v8 = a2 + v6;
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
        uint64_t v10 = ContactAttributeSnippetModel[6];
        uint64_t v11 = a1 + v10;
        uint64_t v12 = a2 + v10;
        long long v13 = *(_OWORD *)(v12 + 16);
        *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
        *(_OWORD *)(v11 + 16) = v13;
        *(void *)(v11 + 32) = *(void *)(v12 + 32);
        uint64_t v14 = ContactAttributeSnippetModel[7];
        uint64_t v15 = (_OWORD *)(a1 + v14);
        char v16 = (_OWORD *)(a2 + v14);
        long long v17 = v16[1];
        *uint64_t v15 = *v16;
        v15[1] = v17;
        *(_OWORD *)(a1 + ContactAttributeSnippetModel[8]) = *(_OWORD *)(a2 + ContactAttributeSnippetModel[8]);
        uint64_t v18 = ContactAttributeSnippetModel[9];
      }
      else
      {
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 32))(a1, a2, v32);
        uint64_t ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
        uint64_t v34 = ContactSnippetModel[5];
        uint64_t v35 = a1 + v34;
        uint64_t v36 = a2 + v34;
        long long v37 = *(_OWORD *)(v36 + 16);
        *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
        *(_OWORD *)(v35 + 16) = v37;
        *(void *)(v35 + 32) = *(void *)(v36 + 32);
        uint64_t v38 = ContactSnippetModel[6];
        unint64_t v39 = (_OWORD *)(a1 + v38);
        long long v40 = (_OWORD *)(a2 + v38);
        long long v41 = v40[1];
        *unint64_t v39 = *v40;
        v39[1] = v41;
        uint64_t v42 = ContactSnippetModel[7];
        uint64_t v43 = a1 + v42;
        uint64_t v44 = a2 + v42;
        uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 32))(v43, v44, v45);
        uint64_t v18 = ContactSnippetModel[8];
      }
      *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destructiveInjectEnumTag for ContactsSnippetPluginModel()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for ContactsSnippetPluginModel()
{
  uint64_t result = type metadata accessor for GetContactSnippetModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for GetContactAttributeSnippetModel(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for ModifyContactAttributeSnippetModel(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *destroy for ContactsSnippetFlowState(uint64_t *result)
{
  unint64_t v1 = result[1];
  if (4 * ((v1 >> 60) & 3)) {
    BOOL v2 = (((v1 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v1 >> 60) & 3))) == 15;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    unint64_t v3 = result;
    if (v1 >> 60 != 15) {
      uint64_t result = (uint64_t *)outlined consume of Data._Representation(*result, v1);
    }
    unint64_t v4 = v3[3];
    if (v4 >> 60 != 15)
    {
      uint64_t v5 = v3[2];
      return (uint64_t *)outlined consume of Data._Representation(v5, v4);
    }
  }
  return result;
}

uint64_t initializeWithCopy for ContactsSnippetFlowState(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (4 * ((v4 >> 60) & 3)) {
    BOOL v5 = (((v4 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v4 >> 60) & 3))) == 15;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (v4 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      uint64_t v7 = *a2;
      outlined copy of Data._Representation(*a2, a2[1]);
      *(void *)a1 = v7;
      *(void *)(a1 + 8) = v4;
    }
    uint64_t v8 = a2 + 2;
    unint64_t v9 = a2[3];
    if (v9 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 16) = *(_OWORD *)v8;
    }
    else
    {
      uint64_t v10 = *v8;
      outlined copy of Data._Representation(*v8, v9);
      *(void *)(a1 + 16) = v10;
      *(void *)(a1 + 24) = v9;
    }
  }
  else
  {
    long long v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
  }
  return a1;
}

uint64_t *assignWithCopy for ContactsSnippetFlowState(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = a1[1];
  unint64_t v5 = *(void *)(a2 + 8);
  BOOL v6 = ((4 * (v5 >> 60)) & 0xC | ((v5 >> 60) >> 2)) == 0xF || ((4 * (v5 >> 60)) & 0xC) == 0;
  if (4 * ((v4 >> 60) & 3)) {
    BOOL v7 = (((v4 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v4 >> 60) & 3))) == 15;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (!v6)
    {
      if (v4 >> 60 != 15) {
        outlined consume of Data._Representation(*a1, v4);
      }
      unint64_t v9 = a1[3];
      if (v9 >> 60 != 15) {
        outlined consume of Data._Representation(a1[2], v9);
      }
      goto LABEL_20;
    }
    if (v4 >> 60 == 15)
    {
      if (v5 >> 60 != 15)
      {
        uint64_t v8 = *(void *)a2;
        outlined copy of Data._Representation(*(void *)a2, *(void *)(a2 + 8));
        *a1 = v8;
        a1[1] = v5;
        goto LABEL_29;
      }
    }
    else
    {
      if (v5 >> 60 != 15)
      {
        uint64_t v15 = *(void *)a2;
        outlined copy of Data._Representation(*(void *)a2, *(void *)(a2 + 8));
        uint64_t v16 = *a1;
        unint64_t v17 = a1[1];
        *a1 = v15;
        a1[1] = v5;
        outlined consume of Data._Representation(v16, v17);
LABEL_29:
        uint64_t v18 = (uint64_t *)(a2 + 16);
        unint64_t v13 = *(void *)(a2 + 24);
        if ((unint64_t)a1[3] >> 60 == 15)
        {
          if (v13 >> 60 != 15)
          {
            uint64_t v14 = *v18;
            goto LABEL_32;
          }
        }
        else
        {
          if (v13 >> 60 != 15)
          {
            uint64_t v19 = *v18;
            outlined copy of Data._Representation(*v18, v13);
            uint64_t v20 = a1[2];
            unint64_t v21 = a1[3];
            a1[2] = v19;
            a1[3] = v13;
            outlined consume of Data._Representation(v20, v21);
            return a1;
          }
          outlined destroy of Data((uint64_t)(a1 + 2));
        }
        *((_OWORD *)a1 + 1) = *(_OWORD *)v18;
        return a1;
      }
      outlined destroy of Data((uint64_t)a1);
    }
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_29;
  }
  if (v6)
  {
    if (v5 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      uint64_t v11 = *(void *)a2;
      outlined copy of Data._Representation(*(void *)a2, *(void *)(a2 + 8));
      *a1 = v11;
      a1[1] = v5;
    }
    uint64_t v12 = (_OWORD *)(a2 + 16);
    unint64_t v13 = *(void *)(a2 + 24);
    if (v13 >> 60 == 15)
    {
      *((_OWORD *)a1 + 1) = *v12;
      return a1;
    }
    uint64_t v14 = *(void *)v12;
LABEL_32:
    outlined copy of Data._Representation(v14, v13);
    a1[2] = v14;
    a1[3] = v13;
    return a1;
  }
LABEL_20:
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v10;
  return a1;
}

uint64_t *assignWithTake for ContactsSnippetFlowState(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  if (4 * ((v4 >> 60) & 3)) {
    BOOL v5 = (((v4 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v4 >> 60) & 3))) == 15;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
LABEL_19:
    long long v9 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v9;
    return a1;
  }
  unint64_t v6 = a2[1];
  if (4 * ((v6 >> 60) & 3)) {
    BOOL v7 = (((v6 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v6 >> 60) & 3))) == 15;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (v4 >> 60 != 15) {
      outlined consume of Data._Representation(*a1, v4);
    }
    unint64_t v8 = a1[3];
    if (v8 >> 60 != 15) {
      outlined consume of Data._Representation(a1[2], v8);
    }
    goto LABEL_19;
  }
  if (v4 >> 60 != 15)
  {
    if (v6 >> 60 != 15)
    {
      uint64_t v11 = *a1;
      *a1 = *a2;
      a1[1] = v6;
      outlined consume of Data._Representation(v11, v4);
      goto LABEL_22;
    }
    outlined destroy of Data((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_22:
  uint64_t v12 = a2 + 2;
  unint64_t v13 = a1[3];
  if (v13 >> 60 != 15)
  {
    unint64_t v14 = a2[3];
    if (v14 >> 60 != 15)
    {
      uint64_t v15 = a1[2];
      a1[2] = *v12;
      a1[3] = v14;
      outlined consume of Data._Representation(v15, v13);
      return a1;
    }
    outlined destroy of Data((uint64_t)(a1 + 2));
  }
  *((_OWORD *)a1 + 1) = *(_OWORD *)v12;
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactsSnippetFlowState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xA && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 10);
  }
  uint64_t v3 = *(void *)(a1 + 8) >> 60;
  BOOL v4 = ((4 * v3) & 0xC) == 0;
  unsigned int v5 = ((4 * v3) & 0xC | (v3 >> 2)) ^ 0xF;
  if (v4) {
    unsigned int v5 = 0;
  }
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ContactsSnippetFlowState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 9)
  {
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 10;
    if (a3 >= 0xA) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xA) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)((4 * (13 - a2)) | ((13 - a2) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t getEnumTag for ContactsSnippetFlowState(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8) >> 60;
  BOOL v2 = ((4 * v1) & 0xC) == 0;
  unsigned int v3 = ((4 * v1) & 0xC | (v1 >> 2)) ^ 0xF;
  if (v2) {
    return 0;
  }
  else {
    return v3;
  }
}

void *destructiveInjectEnumTag for ContactsSnippetFlowState(void *result, unsigned int a2)
{
  if (a2 > 0xB)
  {
    result[2] = 0;
    result[3] = 0;
    *uint64_t result = a2 - 12;
    result[1] = 0;
  }
  else if (a2)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
  }
  return result;
}

void type metadata accessor for ContactsSnippetFlowState()
{
}

void *initializeBufferWithCopyOfBuffer for GetContactSnippetModel(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    long long v9 = (char *)a1 + v8;
    long long v10 = (void *)((char *)a2 + v8);
    unint64_t v11 = *(void *)((char *)a2 + v8 + 8);
    if (v11 >> 60 == 15)
    {
      *(_OWORD *)long long v9 = *(_OWORD *)v10;
    }
    else
    {
      uint64_t v13 = *v10;
      outlined copy of Data._Representation(*v10, v11);
      *(void *)long long v9 = v13;
      *((void *)v9 + 1) = v11;
    }
    uint64_t v14 = v10[3];
    *((void *)v9 + 2) = v10[2];
    *((void *)v9 + 3) = v14;
    *((void *)v9 + 4) = v10[4];
    uint64_t v15 = a3[6];
    uint64_t v16 = (char *)a1 + v15;
    unint64_t v17 = (char *)a2 + v15;
    unint64_t v18 = *(void *)((char *)a2 + v15 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v18 & 0xF000000000000000) == 0xB000000000000000 || (v18 & 0xF000000000000000) == 0x7000000000000000)
    {
      long long v20 = *((_OWORD *)v17 + 1);
      *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
      *((_OWORD *)v16 + 1) = v20;
    }
    else
    {
      if (v18 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
      }
      else
      {
        uint64_t v21 = *(void *)v17;
        outlined copy of Data._Representation(*(void *)v17, v18);
        *(void *)uint64_t v16 = v21;
        *((void *)v16 + 1) = v18;
      }
      uint64_t v22 = (uint64_t *)(v17 + 16);
      unint64_t v23 = *((void *)v17 + 3);
      if (v23 >> 60 == 15)
      {
        *((_OWORD *)v16 + 1) = *(_OWORD *)v22;
      }
      else
      {
        uint64_t v24 = *v22;
        outlined copy of Data._Representation(*v22, *((void *)v17 + 3));
        *((void *)v16 + 2) = v24;
        *((void *)v16 + 3) = v23;
      }
    }
    uint64_t v25 = a3[7];
    unint64_t v26 = (char *)a1 + v25;
    long long v27 = (char *)a2 + v25;
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  }
  return a1;
}

uint64_t destroy for GetContactSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (uint64_t *)(a1 + a2[5]);
  unint64_t v6 = v5[1];
  if (v6 >> 60 != 15) {
    outlined consume of Data._Representation(*v5, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t *)(a1 + a2[6]);
  unint64_t v8 = v7[1];
  if ((v8 & 0xF000000000000000) != 0xB000000000000000 && (v8 & 0xF000000000000000) != 0x7000000000000000)
  {
    if (v8 >> 60 != 15) {
      outlined consume of Data._Representation(*v7, v8);
    }
    unint64_t v10 = v7[3];
    if (v10 >> 60 != 15) {
      outlined consume of Data._Representation(v7[2], v10);
    }
  }
  uint64_t v11 = a1 + a2[7];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
  return v13(v11, v12);
}

uint64_t initializeWithCopy for GetContactSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  long long v9 = (uint64_t *)(a2 + v7);
  unint64_t v10 = *(void *)(a2 + v7 + 8);
  if (v10 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  }
  else
  {
    uint64_t v11 = *v9;
    outlined copy of Data._Representation(*v9, v10);
    *(void *)uint64_t v8 = v11;
    *(void *)(v8 + 8) = v10;
  }
  uint64_t v12 = v9[3];
  *(void *)(v8 + 16) = v9[2];
  *(void *)(v8 + 24) = v12;
  *(void *)(v8 + 32) = v9[4];
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = (uint64_t *)(a2 + v13);
  unint64_t v16 = *(void *)(a2 + v13 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((v16 & 0xF000000000000000) == 0xB000000000000000 || (v16 & 0xF000000000000000) == 0x7000000000000000)
  {
    long long v18 = *((_OWORD *)v15 + 1);
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    *(_OWORD *)(v14 + 16) = v18;
  }
  else
  {
    if (v16 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    }
    else
    {
      uint64_t v19 = *v15;
      outlined copy of Data._Representation(*v15, v16);
      *(void *)uint64_t v14 = v19;
      *(void *)(v14 + 8) = v16;
    }
    long long v20 = v15 + 2;
    unint64_t v21 = v15[3];
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)(v14 + 16) = *(_OWORD *)v20;
    }
    else
    {
      uint64_t v22 = *v20;
      outlined copy of Data._Representation(*v20, v15[3]);
      *(void *)(v14 + 16) = v22;
      *(void *)(v14 + 24) = v21;
    }
  }
  uint64_t v23 = a3[7];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithCopy for GetContactSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  long long v9 = (uint64_t *)(a2 + v7);
  unint64_t v10 = *(void *)(a2 + v7 + 8);
  if (*(void *)(a1 + v7 + 8) >> 60 == 15)
  {
    if (v10 >> 60 != 15)
    {
      uint64_t v11 = *v9;
      outlined copy of Data._Representation(*v9, v10);
      *uint64_t v8 = v11;
      v8[1] = v10;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v10 >> 60 == 15)
  {
    outlined destroy of Data((uint64_t)v8);
LABEL_6:
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    goto LABEL_8;
  }
  uint64_t v12 = *v9;
  outlined copy of Data._Representation(*v9, v10);
  uint64_t v13 = *v8;
  unint64_t v14 = v8[1];
  *uint64_t v8 = v12;
  v8[1] = v10;
  outlined consume of Data._Representation(v13, v14);
LABEL_8:
  void v8[2] = v9[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[6];
  uint64_t v16 = a1 + v15;
  unint64_t v17 = (uint64_t *)(a2 + v15);
  unint64_t v18 = *(void *)(a1 + v15 + 8);
  if ((v18 & 0xF000000000000000) == 0xB000000000000000 || (v18 & 0xF000000000000000) == 0x7000000000000000)
  {
    unint64_t v20 = v17[1];
    if ((v20 & 0xF000000000000000) == 0xB000000000000000 || (v20 & 0xF000000000000000) == 0x7000000000000000)
    {
      long long v22 = *((_OWORD *)v17 + 1);
      *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
      *(_OWORD *)(v16 + 16) = v22;
    }
    else
    {
      if (v20 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
      }
      else
      {
        uint64_t v27 = *v17;
        outlined copy of Data._Representation(*v17, v17[1]);
        *(void *)uint64_t v16 = v27;
        *(void *)(v16 + 8) = v20;
      }
      uint64_t v28 = v17 + 2;
      unint64_t v29 = v17[3];
      if (v29 >> 60 != 15)
      {
        uint64_t v30 = *v28;
LABEL_41:
        outlined copy of Data._Representation(v30, v29);
        *(void *)(v16 + 16) = v30;
        *(void *)(v16 + 24) = v29;
        goto LABEL_46;
      }
      *(_OWORD *)(v16 + 16) = *(_OWORD *)v28;
    }
  }
  else
  {
    unint64_t v23 = v17[1];
    if ((v23 & 0xF000000000000000) != 0xB000000000000000 && (v23 & 0xF000000000000000) != 0x7000000000000000)
    {
      if (v18 >> 60 == 15)
      {
        if (v23 >> 60 != 15)
        {
          uint64_t v26 = *v17;
          outlined copy of Data._Representation(*v17, v17[1]);
          *(void *)uint64_t v16 = v26;
          *(void *)(v16 + 8) = v23;
          goto LABEL_38;
        }
      }
      else
      {
        if (v23 >> 60 != 15)
        {
          uint64_t v31 = *v17;
          outlined copy of Data._Representation(*v17, v17[1]);
          uint64_t v32 = *(void *)v16;
          unint64_t v33 = *(void *)(v16 + 8);
          *(void *)uint64_t v16 = v31;
          *(void *)(v16 + 8) = v23;
          outlined consume of Data._Representation(v32, v33);
LABEL_38:
          uint64_t v34 = v17 + 2;
          unint64_t v29 = v17[3];
          if (*(void *)(v16 + 24) >> 60 == 15)
          {
            if (v29 >> 60 != 15)
            {
              uint64_t v30 = *v34;
              goto LABEL_41;
            }
          }
          else
          {
            if (v29 >> 60 != 15)
            {
              uint64_t v35 = *v34;
              outlined copy of Data._Representation(*v34, v17[3]);
              uint64_t v36 = *(void *)(v16 + 16);
              unint64_t v37 = *(void *)(v16 + 24);
              *(void *)(v16 + 16) = v35;
              *(void *)(v16 + 24) = v29;
              outlined consume of Data._Representation(v36, v37);
              goto LABEL_46;
            }
            outlined destroy of Data(v16 + 16);
          }
          *(_OWORD *)(v16 + 16) = *(_OWORD *)v34;
          goto LABEL_46;
        }
        outlined destroy of Data(v16);
      }
      *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
      goto LABEL_38;
    }
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v16);
    long long v25 = *((_OWORD *)v17 + 1);
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    *(_OWORD *)(v16 + 16) = v25;
  }
LABEL_46:
  uint64_t v38 = a3[7];
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 24))(v39, v40, v41);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (confirmActionData: Data?, cancelActionData: Data?));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for GetContactSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  unint64_t v10 = (long long *)(a2 + v7);
  long long v11 = *v10;
  long long v12 = v10[1];
  *(void *)(v9 + 32) = *((void *)v10 + 4);
  *(_OWORD *)uint64_t v9 = v11;
  *(_OWORD *)(v9 + 16) = v12;
  uint64_t v13 = (_OWORD *)(a1 + v8);
  unint64_t v14 = (_OWORD *)(a2 + v8);
  long long v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithTake for GetContactSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  unint64_t v10 = *(void *)(a1 + v7 + 8);
  if (v10 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v11 = *(void *)(v9 + 8);
  if (v11 >> 60 == 15)
  {
    outlined destroy of Data(v8);
LABEL_4:
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)v8;
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = v11;
  outlined consume of Data._Representation(v12, v10);
LABEL_6:
  *(void *)(v8 + 16) = *(void *)(v9 + 16);
  swift_bridgeObjectRelease();
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  swift_bridgeObjectRelease();
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  unint64_t v16 = *(void *)(a1 + v13 + 8);
  if ((v16 & 0xF000000000000000) == 0xB000000000000000 || (v16 & 0xF000000000000000) == 0x7000000000000000) {
    goto LABEL_18;
  }
  unint64_t v18 = *(void *)(v15 + 8);
  if ((v18 & 0xF000000000000000) == 0xB000000000000000 || (v18 & 0xF000000000000000) == 0x7000000000000000)
  {
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v14);
LABEL_18:
    long long v20 = *(_OWORD *)(v15 + 16);
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    *(_OWORD *)(v14 + 16) = v20;
    goto LABEL_19;
  }
  if (v16 >> 60 != 15)
  {
    if (v18 >> 60 != 15)
    {
      uint64_t v26 = *(void *)v14;
      *(void *)uint64_t v14 = *(void *)v15;
      *(void *)(v14 + 8) = v18;
      outlined consume of Data._Representation(v26, v16);
      goto LABEL_25;
    }
    outlined destroy of Data(v14);
  }
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
LABEL_25:
  uint64_t v27 = (void *)(v15 + 16);
  unint64_t v28 = *(void *)(v14 + 24);
  if (v28 >> 60 != 15)
  {
    unint64_t v29 = *(void *)(v15 + 24);
    if (v29 >> 60 != 15)
    {
      uint64_t v30 = *(void *)(v14 + 16);
      *(void *)(v14 + 16) = *v27;
      *(void *)(v14 + 24) = v29;
      outlined consume of Data._Representation(v30, v28);
      goto LABEL_19;
    }
    outlined destroy of Data(v14 + 16);
  }
  *(_OWORD *)(v14 + 16) = *(_OWORD *)v27;
LABEL_19:
  uint64_t v21 = a3[7];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C68EC58);
}

uint64_t sub_25C68EC58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_98();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  OUTLINED_FUNCTION_9_4();
  if (*(_DWORD *)(v7 + 84) == v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
  }
  else
  {
    if (v3 == 0x7FFFFFFF) {
      return OUTLINED_FUNCTION_94(*(void *)(v4 + *(int *)(a3 + 20) + 16));
    }
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    uint64_t v9 = v4 + *(int *)(a3 + 28);
  }
  return __swift_getEnumTagSinglePayload(v9, v3, v8);
}

uint64_t storeEnumTagSinglePayload for GetContactSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C68ED18);
}

void sub_25C68ED18(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  OUTLINED_FUNCTION_98();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  OUTLINED_FUNCTION_9_4();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v5;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(v5 + *(int *)(a4 + 20) + 16) = (v4 - 1);
      return;
    }
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    uint64_t v11 = v5 + *(int *)(a4 + 28);
  }
  __swift_storeEnumTagSinglePayload(v11, v4, v4, v10);
}

void type metadata completion function for GetContactSnippetModel()
{
  type metadata accessor for Loggable<CodableContact<CNContact>>();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Loggable<ContactsLabelCATContainer>();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void type metadata accessor for Loggable<CodableContact<CNContact>>()
{
  if (!lazy cache variable for type metadata for Loggable<CodableContact<CNContact>>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for CodableContact<CNContact>);
    unint64_t v0 = type metadata accessor for Loggable();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    }
  }
}

void type metadata accessor for Loggable<ContactsLabelCATContainer>()
{
  if (!lazy cache variable for type metadata for Loggable<ContactsLabelCATContainer>)
  {
    unint64_t v0 = type metadata accessor for Loggable();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for GetContactAttributeSnippetModel(void *a1, void *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    swift_bridgeObjectRetain();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (void *)((char *)a2 + v12);
    unint64_t v15 = *(void *)((char *)a2 + v12 + 8);
    if (v15 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
    }
    else
    {
      uint64_t v16 = *v14;
      outlined copy of Data._Representation(*v14, v15);
      *(void *)uint64_t v13 = v16;
      *((void *)v13 + 1) = v15;
    }
    uint64_t v17 = v14[3];
    *((void *)v13 + 2) = v14[2];
    *((void *)v13 + 3) = v17;
    *((void *)v13 + 4) = v14[4];
    uint64_t v18 = a3[7];
    uint64_t v19 = (char *)a1 + v18;
    long long v20 = (char *)a2 + v18;
    unint64_t v21 = *(void *)((char *)a2 + v18 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v21 & 0xF000000000000000) == 0xB000000000000000 || (v21 & 0xF000000000000000) == 0x7000000000000000)
    {
      long long v23 = *((_OWORD *)v20 + 1);
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
      *((_OWORD *)v19 + 1) = v23;
    }
    else
    {
      if (v21 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
      }
      else
      {
        uint64_t v24 = *(void *)v20;
        outlined copy of Data._Representation(*(void *)v20, v21);
        *(void *)uint64_t v19 = v24;
        *((void *)v19 + 1) = v21;
      }
      long long v25 = (uint64_t *)(v20 + 16);
      unint64_t v26 = *((void *)v20 + 3);
      if (v26 >> 60 == 15)
      {
        *((_OWORD *)v19 + 1) = *(_OWORD *)v25;
      }
      else
      {
        uint64_t v27 = *v25;
        outlined copy of Data._Representation(*v25, *((void *)v20 + 3));
        *((void *)v19 + 2) = v27;
        *((void *)v19 + 3) = v26;
      }
    }
    uint64_t v28 = a3[8];
    uint64_t v29 = a3[9];
    uint64_t v30 = (void *)((char *)a1 + v28);
    uint64_t v31 = (void *)((char *)a2 + v28);
    uint64_t v32 = v31[1];
    *uint64_t v30 = *v31;
    v30[1] = v32;
    *((unsigned char *)a1 + v29) = *((unsigned char *)a2 + v29);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for GetContactAttributeSnippetModel(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (uint64_t *)(a1 + a2[6]);
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    outlined consume of Data._Representation(*v6, v7);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t *)(a1 + a2[7]);
  unint64_t v9 = v8[1];
  if ((v9 & 0xF000000000000000) != 0xB000000000000000 && (v9 & 0xF000000000000000) != 0x7000000000000000)
  {
    if (v9 >> 60 != 15) {
      outlined consume of Data._Representation(*v8, v9);
    }
    unint64_t v11 = v8[3];
    if (v11 >> 60 != 15) {
      outlined consume of Data._Representation(v8[2], v11);
    }
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for GetContactAttributeSnippetModel(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  unint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (void *)((char *)a2 + v10);
  unint64_t v13 = *(void *)((char *)a2 + v10 + 8);
  if (v13 >> 60 == 15)
  {
    *(_OWORD *)unint64_t v11 = *(_OWORD *)v12;
  }
  else
  {
    uint64_t v14 = *v12;
    outlined copy of Data._Representation(*v12, v13);
    *(void *)unint64_t v11 = v14;
    *((void *)v11 + 1) = v13;
  }
  uint64_t v15 = v12[3];
  *((void *)v11 + 2) = v12[2];
  *((void *)v11 + 3) = v15;
  *((void *)v11 + 4) = v12[4];
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  unint64_t v19 = *(void *)((char *)a2 + v16 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((v19 & 0xF000000000000000) == 0xB000000000000000 || (v19 & 0xF000000000000000) == 0x7000000000000000)
  {
    long long v21 = *((_OWORD *)v18 + 1);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    *((_OWORD *)v17 + 1) = v21;
  }
  else
  {
    if (v19 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    }
    else
    {
      uint64_t v22 = *(void *)v18;
      outlined copy of Data._Representation(*(void *)v18, v19);
      *(void *)uint64_t v17 = v22;
      *((void *)v17 + 1) = v19;
    }
    long long v23 = (uint64_t *)(v18 + 16);
    unint64_t v24 = *((void *)v18 + 3);
    if (v24 >> 60 == 15)
    {
      *((_OWORD *)v17 + 1) = *(_OWORD *)v23;
    }
    else
    {
      uint64_t v25 = *v23;
      outlined copy of Data._Representation(*v23, *((void *)v18 + 3));
      *((void *)v17 + 2) = v25;
      *((void *)v17 + 3) = v24;
    }
  }
  uint64_t v26 = a3[8];
  uint64_t v27 = a3[9];
  uint64_t v28 = (void *)((char *)a1 + v26);
  uint64_t v29 = (void *)((char *)a2 + v26);
  uint64_t v30 = v29[1];
  void *v28 = *v29;
  v28[1] = v30;
  *((unsigned char *)a1 + v27) = *((unsigned char *)a2 + v27);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GetContactAttributeSnippetModel(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  unint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  unint64_t v13 = *(void *)((char *)a2 + v10 + 8);
  if (*(void *)((char *)a1 + v10 + 8) >> 60 == 15)
  {
    if (v13 >> 60 != 15)
    {
      uint64_t v14 = *v12;
      outlined copy of Data._Representation(*v12, v13);
      *unint64_t v11 = v14;
      v11[1] = v13;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
    outlined destroy of Data((uint64_t)v11);
LABEL_6:
    *(_OWORD *)unint64_t v11 = *(_OWORD *)v12;
    goto LABEL_8;
  }
  uint64_t v15 = *v12;
  outlined copy of Data._Representation(*v12, v13);
  uint64_t v16 = *v11;
  unint64_t v17 = v11[1];
  *unint64_t v11 = v15;
  v11[1] = v13;
  outlined consume of Data._Representation(v16, v17);
LABEL_8:
  v11[2] = v12[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[3] = v12[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[4] = v12[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  uint64_t v19 = (uint64_t)a1 + v18;
  long long v20 = (char *)a2 + v18;
  unint64_t v21 = *(void *)((char *)a1 + v18 + 8);
  if ((v21 & 0xF000000000000000) == 0xB000000000000000 || (v21 & 0xF000000000000000) == 0x7000000000000000)
  {
    unint64_t v23 = *((void *)v20 + 1);
    if ((v23 & 0xF000000000000000) == 0xB000000000000000 || (v23 & 0xF000000000000000) == 0x7000000000000000)
    {
      long long v25 = *((_OWORD *)v20 + 1);
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
      *(_OWORD *)(v19 + 16) = v25;
    }
    else
    {
      if (v23 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
      }
      else
      {
        uint64_t v30 = *(void *)v20;
        outlined copy of Data._Representation(*(void *)v20, *((void *)v20 + 1));
        *(void *)uint64_t v19 = v30;
        *(void *)(v19 + 8) = v23;
      }
      uint64_t v31 = (uint64_t *)(v20 + 16);
      unint64_t v32 = *((void *)v20 + 3);
      if (v32 >> 60 != 15)
      {
        uint64_t v33 = *v31;
LABEL_41:
        outlined copy of Data._Representation(v33, v32);
        *(void *)(v19 + 16) = v33;
        *(void *)(v19 + 24) = v32;
        goto LABEL_46;
      }
      *(_OWORD *)(v19 + 16) = *(_OWORD *)v31;
    }
  }
  else
  {
    unint64_t v26 = *((void *)v20 + 1);
    if ((v26 & 0xF000000000000000) != 0xB000000000000000 && (v26 & 0xF000000000000000) != 0x7000000000000000)
    {
      if (v21 >> 60 == 15)
      {
        if (v26 >> 60 != 15)
        {
          uint64_t v29 = *(void *)v20;
          outlined copy of Data._Representation(*(void *)v20, *((void *)v20 + 1));
          *(void *)uint64_t v19 = v29;
          *(void *)(v19 + 8) = v26;
          goto LABEL_38;
        }
      }
      else
      {
        if (v26 >> 60 != 15)
        {
          uint64_t v34 = *(void *)v20;
          outlined copy of Data._Representation(*(void *)v20, *((void *)v20 + 1));
          uint64_t v35 = *(void *)v19;
          unint64_t v36 = *(void *)(v19 + 8);
          *(void *)uint64_t v19 = v34;
          *(void *)(v19 + 8) = v26;
          outlined consume of Data._Representation(v35, v36);
LABEL_38:
          unint64_t v37 = (uint64_t *)(v20 + 16);
          unint64_t v32 = *((void *)v20 + 3);
          if (*(void *)(v19 + 24) >> 60 == 15)
          {
            if (v32 >> 60 != 15)
            {
              uint64_t v33 = *v37;
              goto LABEL_41;
            }
          }
          else
          {
            if (v32 >> 60 != 15)
            {
              uint64_t v38 = *v37;
              outlined copy of Data._Representation(*v37, *((void *)v20 + 3));
              uint64_t v39 = *(void *)(v19 + 16);
              unint64_t v40 = *(void *)(v19 + 24);
              *(void *)(v19 + 16) = v38;
              *(void *)(v19 + 24) = v32;
              outlined consume of Data._Representation(v39, v40);
              goto LABEL_46;
            }
            outlined destroy of Data(v19 + 16);
          }
          *(_OWORD *)(v19 + 16) = *(_OWORD *)v37;
          goto LABEL_46;
        }
        outlined destroy of Data(v19);
      }
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
      goto LABEL_38;
    }
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v19);
    long long v28 = *((_OWORD *)v20 + 1);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v28;
  }
LABEL_46:
  uint64_t v41 = a3[8];
  uint64_t v42 = (char *)a1 + v41;
  uint64_t v43 = (char *)a2 + v41;
  *(void *)((char *)a1 + v41) = *(void *)((char *)a2 + v41);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v42 + 1) = *((void *)v43 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  return a1;
}

void *initializeWithTake for GetContactAttributeSnippetModel(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  unint64_t v13 = (char *)a2 + v10;
  long long v14 = *(_OWORD *)v13;
  long long v15 = *((_OWORD *)v13 + 1);
  *((void *)v12 + 4) = *((void *)v13 + 4);
  *(_OWORD *)uint64_t v12 = v14;
  *((_OWORD *)v12 + 1) = v15;
  uint64_t v16 = (_OWORD *)((char *)a1 + v11);
  unint64_t v17 = (_OWORD *)((char *)a2 + v11);
  long long v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *((unsigned char *)a1 + v19) = *((unsigned char *)a2 + v19);
  return a1;
}

void *assignWithTake for GetContactAttributeSnippetModel(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (uint64_t)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  unint64_t v13 = *(void *)((char *)a1 + v10 + 8);
  if (v13 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v14 = *((void *)v12 + 1);
  if (v14 >> 60 == 15)
  {
    outlined destroy of Data(v11);
LABEL_4:
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    goto LABEL_6;
  }
  uint64_t v15 = *(void *)v11;
  *(void *)uint64_t v11 = *(void *)v12;
  *(void *)(v11 + 8) = v14;
  outlined consume of Data._Representation(v15, v13);
LABEL_6:
  *(void *)(v11 + 16) = *((void *)v12 + 2);
  swift_bridgeObjectRelease();
  *(void *)(v11 + 24) = *((void *)v12 + 3);
  swift_bridgeObjectRelease();
  *(void *)(v11 + 32) = *((void *)v12 + 4);
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = (uint64_t)a1 + v16;
  long long v18 = (char *)a2 + v16;
  unint64_t v19 = *(void *)((char *)a1 + v16 + 8);
  if ((v19 & 0xF000000000000000) == 0xB000000000000000 || (v19 & 0xF000000000000000) == 0x7000000000000000) {
    goto LABEL_18;
  }
  unint64_t v21 = *((void *)v18 + 1);
  if ((v21 & 0xF000000000000000) == 0xB000000000000000 || (v21 & 0xF000000000000000) == 0x7000000000000000)
  {
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v17);
LABEL_18:
    long long v23 = *((_OWORD *)v18 + 1);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    *(_OWORD *)(v17 + 16) = v23;
    goto LABEL_19;
  }
  if (v19 >> 60 != 15)
  {
    if (v21 >> 60 != 15)
    {
      uint64_t v28 = *(void *)v17;
      *(void *)uint64_t v17 = *(void *)v18;
      *(void *)(v17 + 8) = v21;
      outlined consume of Data._Representation(v28, v19);
      goto LABEL_25;
    }
    outlined destroy of Data(v17);
  }
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
LABEL_25:
  uint64_t v29 = v18 + 16;
  unint64_t v30 = *(void *)(v17 + 24);
  if (v30 >> 60 != 15)
  {
    unint64_t v31 = *((void *)v18 + 3);
    if (v31 >> 60 != 15)
    {
      uint64_t v32 = *(void *)(v17 + 16);
      *(void *)(v17 + 16) = *v29;
      *(void *)(v17 + 24) = v31;
      outlined consume of Data._Representation(v32, v30);
      goto LABEL_19;
    }
    outlined destroy of Data(v17 + 16);
  }
  *(_OWORD *)(v17 + 16) = *(_OWORD *)v29;
LABEL_19:
  uint64_t v24 = a3[8];
  long long v25 = (char *)a1 + v24;
  unint64_t v26 = (char *)a2 + v24;
  *(void *)((char *)a1 + v24) = *(void *)((char *)a2 + v24);
  swift_bridgeObjectRelease();
  *((void *)v25 + 1) = *((void *)v26 + 1);
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C68FADC);
}

uint64_t sub_25C68FADC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_94(*a1);
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  uint64_t v8 = (uint64_t)a1 + *(int *)(a3 + 20);
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for GetContactAttributeSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C68FB70);
}

void sub_25C68FB70()
{
  OUTLINED_FUNCTION_98();
  if (v3 == 0x7FFFFFFF)
  {
    *uint64_t v1 = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    uint64_t v6 = (uint64_t)v1 + *(int *)(v4 + 20);
    __swift_storeEnumTagSinglePayload(v6, v0, v0, v5);
  }
}

void type metadata completion function for GetContactAttributeSnippetModel()
{
  type metadata accessor for Loggable<CodableContact<CNContact>>();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t destroy for GetContactAttributeSnippetModel.DisplayAttribute()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GetContactAttributeSnippetModel.DisplayAttribute(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GetContactAttributeSnippetModel.DisplayAttribute(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for GetContactAttributeSnippetModel.DisplayAttribute(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeSnippetModel.DisplayAttribute(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 49))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for GetContactAttributeSnippetModel.DisplayAttribute(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for GetContactAttributeSnippetModel.DisplayAttribute()
{
}

void type metadata accessor for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
}

uint64_t initializeBufferWithCopyOfBuffer for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *(void *)a1 = *a2;
    a1 = v20 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    uint64_t v8 = a2[1];
    char v9 = *((unsigned char *)a2 + 16);
    outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 16) = v9;
    *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
    uint64_t v10 = a3[6];
    uint64_t v11 = a1 + v10;
    uint64_t v12 = (uint64_t)a2 + v10;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    uint64_t v14 = a3[7];
    uint64_t v15 = a1 + v14;
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    unint64_t v17 = *(uint64_t *)((char *)a2 + v14 + 8);
    if ((v17 & 0xF000000000000000) == 0xB000000000000000 || (v17 & 0xF000000000000000) == 0x7000000000000000)
    {
      long long v19 = *((_OWORD *)v16 + 1);
      *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
      *(_OWORD *)(v15 + 16) = v19;
    }
    else
    {
      if (v17 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
      }
      else
      {
        uint64_t v21 = *v16;
        outlined copy of Data._Representation(*v16, v17);
        *(void *)uint64_t v15 = v21;
        *(void *)(v15 + 8) = v17;
      }
      uint64_t v22 = v16 + 2;
      unint64_t v23 = v16[3];
      if (v23 >> 60 == 15)
      {
        *(_OWORD *)(v15 + 16) = *(_OWORD *)v22;
      }
      else
      {
        uint64_t v24 = *v22;
        outlined copy of Data._Representation(*v22, v16[3]);
        *(void *)(v15 + 16) = v24;
        *(void *)(v15 + 24) = v23;
      }
    }
    uint64_t v25 = a3[8];
    uint64_t v26 = a1 + v25;
    uint64_t v27 = (uint64_t)a2 + v25;
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    uint64_t v29 = a3[9];
    uint64_t v30 = a1 + v29;
    unint64_t v31 = (uint64_t *)((char *)a2 + v29);
    unint64_t v32 = v31[1];
    if (v32 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
    }
    else
    {
      uint64_t v33 = *v31;
      outlined copy of Data._Representation(*v31, v31[1]);
      *(void *)uint64_t v30 = v33;
      *(void *)(v30 + 8) = v32;
    }
    uint64_t v34 = a3[10];
    uint64_t v35 = a1 + v34;
    unint64_t v36 = (uint64_t *)((char *)a2 + v34);
    unint64_t v37 = v36[1];
    if (v37 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
    }
    else
    {
      uint64_t v38 = *v36;
      outlined copy of Data._Representation(*v36, v36[1]);
      *(void *)uint64_t v35 = v38;
      *(void *)(v35 + 8) = v37;
    }
  }
  return a1;
}

uint64_t destroy for ModifyContactAttributeSnippetModel(uint64_t a1, int *a2)
{
  outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (uint64_t *)(a1 + a2[7]);
  unint64_t v7 = v6[1];
  if ((v7 & 0xF000000000000000) != 0xB000000000000000 && (v7 & 0xF000000000000000) != 0x7000000000000000)
  {
    if (v7 >> 60 != 15) {
      outlined consume of Data._Representation(*v6, v7);
    }
    unint64_t v9 = v6[3];
    if (v9 >> 60 != 15) {
      outlined consume of Data._Representation(v6[2], v9);
    }
  }
  uint64_t v10 = a1 + a2[8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v13 = (uint64_t *)(a1 + a2[9]);
  unint64_t v14 = v13[1];
  if (v14 >> 60 != 15) {
    uint64_t result = outlined consume of Data._Representation(*v13, v14);
  }
  uint64_t v15 = (uint64_t *)(a1 + a2[10]);
  unint64_t v16 = v15[1];
  if (v16 >> 60 != 15)
  {
    uint64_t v17 = *v15;
    return outlined consume of Data._Representation(v17, v16);
  }
  return result;
}

uint64_t initializeWithCopy for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = (uint64_t)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  unint64_t v16 = *(uint64_t *)((char *)a2 + v13 + 8);
  if ((v16 & 0xF000000000000000) == 0xB000000000000000 || (v16 & 0xF000000000000000) == 0x7000000000000000)
  {
    long long v18 = *((_OWORD *)v15 + 1);
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    *(_OWORD *)(v14 + 16) = v18;
  }
  else
  {
    if (v16 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    }
    else
    {
      uint64_t v19 = *v15;
      outlined copy of Data._Representation(*v15, v16);
      *(void *)uint64_t v14 = v19;
      *(void *)(v14 + 8) = v16;
    }
    uint64_t v20 = v15 + 2;
    unint64_t v21 = v15[3];
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)(v14 + 16) = *(_OWORD *)v20;
    }
    else
    {
      uint64_t v22 = *v20;
      outlined copy of Data._Representation(*v20, v15[3]);
      *(void *)(v14 + 16) = v22;
      *(void *)(v14 + 24) = v21;
    }
  }
  uint64_t v23 = a3[8];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = (uint64_t)a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  uint64_t v27 = a3[9];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = (uint64_t *)((char *)a2 + v27);
  unint64_t v30 = v29[1];
  if (v30 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
  }
  else
  {
    uint64_t v31 = *v29;
    outlined copy of Data._Representation(*v29, v29[1]);
    *(void *)uint64_t v28 = v31;
    *(void *)(v28 + 8) = v30;
  }
  uint64_t v32 = a3[10];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = (uint64_t *)((char *)a2 + v32);
  unint64_t v35 = v34[1];
  if (v35 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
  }
  else
  {
    uint64_t v36 = *v34;
    outlined copy of Data._Representation(*v34, v34[1]);
    *(void *)uint64_t v33 = v36;
    *(void *)(v33 + 8) = v35;
  }
  return a1;
}

uint64_t assignWithCopy for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = (uint64_t)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  unint64_t v16 = *(void *)(a1 + v13 + 8);
  if ((v16 & 0xF000000000000000) == 0xB000000000000000 || (v16 & 0xF000000000000000) == 0x7000000000000000)
  {
    unint64_t v18 = v15[1];
    if ((v18 & 0xF000000000000000) == 0xB000000000000000 || (v18 & 0xF000000000000000) == 0x7000000000000000)
    {
      long long v20 = *((_OWORD *)v15 + 1);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
      *(_OWORD *)(v14 + 16) = v20;
      goto LABEL_39;
    }
    if (v18 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    }
    else
    {
      uint64_t v25 = *v15;
      outlined copy of Data._Representation(*v15, v15[1]);
      *(void *)uint64_t v14 = v25;
      *(void *)(v14 + 8) = v18;
    }
    uint64_t v26 = v15 + 2;
    unint64_t v27 = v15[3];
    if (v27 >> 60 == 15)
    {
      *(_OWORD *)(v14 + 16) = *v26;
      goto LABEL_39;
    }
    uint64_t v28 = *(void *)v26;
    goto LABEL_34;
  }
  unint64_t v21 = v15[1];
  if ((v21 & 0xF000000000000000) == 0xB000000000000000 || (v21 & 0xF000000000000000) == 0x7000000000000000)
  {
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v14);
    long long v23 = *((_OWORD *)v15 + 1);
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    *(_OWORD *)(v14 + 16) = v23;
    goto LABEL_39;
  }
  if (v16 >> 60 == 15)
  {
    if (v21 >> 60 != 15)
    {
      uint64_t v24 = *v15;
      outlined copy of Data._Representation(*v15, v15[1]);
      *(void *)uint64_t v14 = v24;
      *(void *)(v14 + 8) = v21;
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  if (v21 >> 60 == 15)
  {
    outlined destroy of Data(v14);
LABEL_29:
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    goto LABEL_31;
  }
  uint64_t v29 = *v15;
  outlined copy of Data._Representation(*v15, v15[1]);
  uint64_t v30 = *(void *)v14;
  unint64_t v31 = *(void *)(v14 + 8);
  *(void *)uint64_t v14 = v29;
  *(void *)(v14 + 8) = v21;
  outlined consume of Data._Representation(v30, v31);
LABEL_31:
  uint64_t v32 = v15 + 2;
  unint64_t v27 = v15[3];
  if (*(void *)(v14 + 24) >> 60 == 15)
  {
    if (v27 >> 60 != 15)
    {
      uint64_t v28 = *v32;
LABEL_34:
      outlined copy of Data._Representation(v28, v27);
      *(void *)(v14 + 16) = v28;
      *(void *)(v14 + 24) = v27;
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  if (v27 >> 60 == 15)
  {
    outlined destroy of Data(v14 + 16);
LABEL_37:
    *(_OWORD *)(v14 + 16) = *(_OWORD *)v32;
    goto LABEL_39;
  }
  uint64_t v33 = *v32;
  outlined copy of Data._Representation(*v32, v15[3]);
  uint64_t v34 = *(void *)(v14 + 16);
  unint64_t v35 = *(void *)(v14 + 24);
  *(void *)(v14 + 16) = v33;
  *(void *)(v14 + 24) = v27;
  outlined consume of Data._Representation(v34, v35);
LABEL_39:
  uint64_t v36 = a3[8];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = (uint64_t)a2 + v36;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 24))(v37, v38, v39);
  uint64_t v40 = a3[9];
  uint64_t v41 = (uint64_t *)(a1 + v40);
  uint64_t v42 = (uint64_t *)((char *)a2 + v40);
  unint64_t v43 = *(uint64_t *)((char *)a2 + v40 + 8);
  if (*(void *)(a1 + v40 + 8) >> 60 == 15)
  {
    if (v43 >> 60 != 15)
    {
      uint64_t v44 = *v42;
      outlined copy of Data._Representation(v44, v43);
      uint64_t *v41 = v44;
      v41[1] = v43;
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  if (v43 >> 60 == 15)
  {
    outlined destroy of Data((uint64_t)v41);
LABEL_44:
    *(_OWORD *)uint64_t v41 = *(_OWORD *)v42;
    goto LABEL_46;
  }
  uint64_t v45 = *v42;
  outlined copy of Data._Representation(v45, v43);
  uint64_t v46 = *v41;
  unint64_t v47 = v41[1];
  uint64_t *v41 = v45;
  v41[1] = v43;
  outlined consume of Data._Representation(v46, v47);
LABEL_46:
  uint64_t v48 = a3[10];
  uint64_t v49 = (uint64_t *)(a1 + v48);
  uint64_t v50 = (uint64_t *)((char *)a2 + v48);
  unint64_t v51 = *(uint64_t *)((char *)a2 + v48 + 8);
  if (*(void *)(a1 + v48 + 8) >> 60 != 15)
  {
    if (v51 >> 60 != 15)
    {
      uint64_t v53 = *v50;
      outlined copy of Data._Representation(v53, v51);
      uint64_t v54 = *v49;
      unint64_t v55 = v49[1];
      *uint64_t v49 = v53;
      v49[1] = v51;
      outlined consume of Data._Representation(v54, v55);
      return a1;
    }
    outlined destroy of Data((uint64_t)v49);
    goto LABEL_51;
  }
  if (v51 >> 60 == 15)
  {
LABEL_51:
    *(_OWORD *)uint64_t v49 = *(_OWORD *)v50;
    return a1;
  }
  uint64_t v52 = *v50;
  outlined copy of Data._Representation(v52, v51);
  *uint64_t v49 = v52;
  v49[1] = v51;
  return a1;
}

uint64_t initializeWithTake for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a3[8];
  uint64_t v12 = (_OWORD *)(a1 + v10);
  uint64_t v13 = (_OWORD *)(a2 + v10);
  long long v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a1 + v11;
  uint64_t v16 = a2 + v11;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  uint64_t v18 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v18) = *(_OWORD *)(a2 + v18);
  return a1;
}

uint64_t assignWithTake for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  unint64_t v14 = *(void *)(a1 + v11 + 8);
  if ((v14 & 0xF000000000000000) == 0xB000000000000000 || (v14 & 0xF000000000000000) == 0x7000000000000000) {
    goto LABEL_13;
  }
  unint64_t v16 = *(void *)(v13 + 8);
  if ((v16 & 0xF000000000000000) == 0xB000000000000000 || (v16 & 0xF000000000000000) == 0x7000000000000000)
  {
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v12);
LABEL_13:
    long long v18 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    *(_OWORD *)(v12 + 16) = v18;
    goto LABEL_14;
  }
  if (v14 >> 60 == 15)
  {
LABEL_28:
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    goto LABEL_30;
  }
  if (v16 >> 60 == 15)
  {
    outlined destroy of Data(v12);
    goto LABEL_28;
  }
  uint64_t v36 = *(void *)v12;
  *(void *)uint64_t v12 = *(void *)v13;
  *(void *)(v12 + 8) = v16;
  outlined consume of Data._Representation(v36, v14);
LABEL_30:
  uint64_t v37 = (_OWORD *)(v13 + 16);
  unint64_t v38 = *(void *)(v12 + 24);
  if (v38 >> 60 == 15)
  {
LABEL_33:
    *(_OWORD *)(v12 + 16) = *v37;
    goto LABEL_14;
  }
  unint64_t v39 = *(void *)(v13 + 24);
  if (v39 >> 60 == 15)
  {
    outlined destroy of Data(v12 + 16);
    goto LABEL_33;
  }
  uint64_t v40 = *(void *)(v12 + 16);
  *(void *)(v12 + 16) = *(void *)v37;
  *(void *)(v12 + 24) = v39;
  outlined consume of Data._Representation(v40, v38);
LABEL_14:
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  unint64_t v26 = *(void *)(a1 + v23 + 8);
  if (v26 >> 60 == 15)
  {
LABEL_17:
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    goto LABEL_19;
  }
  unint64_t v27 = *(void *)(v25 + 8);
  if (v27 >> 60 == 15)
  {
    outlined destroy of Data(v24);
    goto LABEL_17;
  }
  uint64_t v28 = *(void *)v24;
  *(void *)uint64_t v24 = *(void *)v25;
  *(void *)(v24 + 8) = v27;
  outlined consume of Data._Representation(v28, v26);
LABEL_19:
  uint64_t v29 = a3[10];
  uint64_t v30 = (uint64_t *)(a1 + v29);
  unint64_t v31 = (uint64_t *)(a2 + v29);
  unint64_t v32 = *(void *)(a1 + v29 + 8);
  if (v32 >> 60 != 15)
  {
    unint64_t v33 = v31[1];
    if (v33 >> 60 != 15)
    {
      uint64_t v34 = *v30;
      *uint64_t v30 = *v31;
      v30[1] = v33;
      outlined consume of Data._Representation(v34, v32);
      return a1;
    }
    outlined destroy of Data((uint64_t)v30);
  }
  *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
  return a1;
}

uint64_t getEnumTagSinglePayload for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C690C70);
}

uint64_t sub_25C690C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 > 1) {
      return (v4 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    OUTLINED_FUNCTION_9_4();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 24);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      uint64_t v11 = *(int *)(a3 + 32);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C690D30);
}

void sub_25C690D30()
{
  OUTLINED_FUNCTION_98();
  if (v2 == 254)
  {
    *(unsigned char *)(v1 + 16) = -(char)v0;
  }
  else
  {
    uint64_t v4 = v3;
    int v5 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    OUTLINED_FUNCTION_9_4();
    if (*(_DWORD *)(v7 + 84) == v5)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(int *)(v4 + 24);
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      uint64_t v9 = *(int *)(v4 + 32);
    }
    __swift_storeEnumTagSinglePayload(v1 + v9, v0, v0, v8);
  }
}

void type metadata completion function for ModifyContactAttributeSnippetModel()
{
  type metadata accessor for Loggable<CodableContact<CNContact>>();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Loggable<ContactsLabelCATContainer>();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t destroy for ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  return outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
}

uint64_t initializeBufferWithCopyOfBuffer for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  return a1;
}

uint64_t getEnumTagSinglePayload for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

void type metadata accessor for ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
}

void type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType()
{
}

void type metadata accessor for ContactsLabelCATContainer()
{
}

void type metadata accessor for ContactsLabelCATContainer.LabelType()
{
}

uint64_t type metadata instantiation function for CodableContact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for CodableContact()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata instantiation function for CodableContact.Error(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

void *type metadata accessor for ContactsLabelCATContainer.CodingKeys()
{
  return &unk_2709C9D70;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_70(-1);
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
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 9);
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
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 9);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 9);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_70(v8);
}

unsigned char *storeEnumTagSinglePayload for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 8;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_69((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_66((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25C691238);
      case 4:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
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
          __n128 result = OUTLINED_FUNCTION_68(result, a2 + 8);
        break;
    }
  }
  return result;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.CodingKeys()
{
  return &unk_2709C9E00;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys()
{
  return &unk_2709C9E20;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.CallCodingKeys()
{
  return &unk_2709C9E40;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.CancelCodingKeys()
{
  return &unk_2709C9E60;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.GoCodingKeys()
{
  return &unk_2709C9E80;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.MailCodingKeys()
{
  return &unk_2709C9EA0;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.MessageCodingKeys()
{
  return &unk_2709C9EC0;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.SaveCodingKeys()
{
  return &unk_2709C9EE0;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.SavedCodingKeys()
{
  return &unk_2709C9F00;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.VideoCodingKeys()
{
  return &unk_2709C9F20;
}

unsigned char *storeEnumTagSinglePayload for ModifyContactAttributeSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x25C6913CCLL);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.CodingKeys()
{
  return &unk_2709C9FB0;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType.CodingKeys()
{
  return &unk_2709CA040;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys()
{
  return &unk_2709CA060;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys()
{
  return &unk_2709CA080;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys()
{
  return &unk_2709CA0A0;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys()
{
  return &unk_2709CA0C0;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys()
{
  return &unk_2709CA150;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys()
{
  return &unk_2709CA1E0;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys()
{
  return &unk_2709CA270;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for GetContactAttributeSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x25C6915D8);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

void *type metadata accessor for GetContactAttributeSnippetModel.CodingKeys()
{
  return &unk_2709CA300;
}

uint64_t getEnumTagSinglePayload for ModifyContactAttributeSnippetModel.ModificationType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_70(-1);
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
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 4);
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
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 4);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 4);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_70(v8);
}

unsigned char *storeEnumTagSinglePayload for ModifyContactAttributeSnippetModel.ModificationType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_69((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_66((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25C691750);
      case 4:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
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
          __n128 result = OUTLINED_FUNCTION_68(result, a2 + 3);
        break;
    }
  }
  return result;
}

void *type metadata accessor for GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys()
{
  return &unk_2709CA390;
}

unsigned char *storeEnumTagSinglePayload for GetContactSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x25C691854);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

void *type metadata accessor for GetContactSnippetModel.CodingKeys()
{
  return &unk_2709CA420;
}

void *type metadata accessor for ContactsSnippetFlowState.CodingKeys()
{
  return &unk_2709CA4B0;
}

uint64_t getEnumTagSinglePayload for ContactsLabelCATContainer.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_70(-1);
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
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 2);
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
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_70(v8);
}

unsigned char *storeEnumTagSinglePayload for ContactsLabelCATContainer.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_69((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_66((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25C6919E4);
      case 4:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
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
          __n128 result = OUTLINED_FUNCTION_68(result, a2 + 1);
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for ContactsSnippetFlowState.ConfirmCodingKeys(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

void *type metadata accessor for ContactsSnippetFlowState.ConfirmCodingKeys()
{
  return &unk_2709CA540;
}

void *type metadata accessor for ContactsSnippetFlowState.IntentHandledCodingKeys()
{
  return &unk_2709CA560;
}

void *type metadata accessor for ContactsSnippetFlowState.UnsupportedCodingKeys()
{
  return &unk_2709CA580;
}

uint64_t getEnumTagSinglePayload for ContactsSnippetFlowState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_70(-1);
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
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 3);
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
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 3);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_70((*a1 | (v4 << 8)) - 3);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_70(v8);
}

unsigned char *storeEnumTagSinglePayload for ContactsSnippetFlowState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_69((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_66((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25C691B88);
      case 4:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
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
          __n128 result = OUTLINED_FUNCTION_68(result, a2 + 2);
        break;
    }
  }
  return result;
}

void *type metadata accessor for ContactsSnippetPluginModel.CodingKeys()
{
  return &unk_2709CA610;
}

void *type metadata accessor for ContactsSnippetPluginModel.GetContactCodingKeys()
{
  return &unk_2709CA6A0;
}

void *type metadata accessor for ContactsSnippetPluginModel.GetContactAttributeCodingKeys()
{
  return &unk_2709CA730;
}

uint64_t getEnumTagSinglePayload for CodableContact.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for CodableContact.Error(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25C691CCCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys()
{
  return &unk_2709CA7C0;
}

uint64_t base witness table accessor for Equatable in CodableContact<A>.CodingKeys()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for CustomDebugStringConvertible in CodableContact<A>.CodingKeys()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for CustomStringConvertible in CodableContact<A>.CodingKeys()
{
  return swift_getWitnessTable();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

void OUTLINED_FUNCTION_6_5(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return v0;
}

void OUTLINED_FUNCTION_17_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

void OUTLINED_FUNCTION_24_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9EA78](a1, 0xD00000000000002BLL, a3, 0);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v2 + a1);
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  *unint64_t v1 = *v3;
  v1[1] = v5;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v8;
  outlined copy of Data?(v4, v5);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return type metadata accessor for GetContactAttributeSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

void *OUTLINED_FUNCTION_44()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_50(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_51(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_52(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_53(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_55()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_58@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 112) = a1;
  return KeyedEncodingContainer.encode(_:forKey:)();
}

__n128 OUTLINED_FUNCTION_60@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + a1;
  uint64_t v4 = *(void *)(v3 + 32);
  __n128 result = *(__n128 *)v3;
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v2 - 112) = *(_OWORD *)v3;
  *(_OWORD *)(v2 - 96) = v6;
  *(void *)(v2 - 80) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_61()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_62()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v2 + a1);
  uint64_t result = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  *uint64_t v1 = *v3;
  v1[1] = v5;
  v1[2] = v6;
  v1[3] = v7;
  return result;
}

uint64_t OUTLINED_FUNCTION_66@<X0>(uint64_t result@<X0>, __int16 a2@<W8>)
{
  *(_WORD *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_67@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 1) = a2;
  return result;
}

unsigned char *OUTLINED_FUNCTION_68@<X0>(unsigned char *result@<X0>, char a2@<W8>)
{
  *uint64_t result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_69@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_70@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_71()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return v0;
}

void *OUTLINED_FUNCTION_73()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_74()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_75()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

void OUTLINED_FUNCTION_77()
{
  *(unsigned char *)(v0 - 65) = 1;
}

uint64_t OUTLINED_FUNCTION_78(uint64_t a1)
{
  return MEMORY[0x270F756A8](v1, a1);
}

unint64_t OUTLINED_FUNCTION_79@<X0>(_OWORD *a1@<X8>)
{
  long long v3 = a1[1];
  *(_OWORD *)(v1 - 112) = *a1;
  *(_OWORD *)(v1 - 96) = v3;
  *(unsigned char *)(v1 - 65) = 3;
  return lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState();
}

uint64_t OUTLINED_FUNCTION_80()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_81()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return v0;
}

void *OUTLINED_FUNCTION_84(void *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

void OUTLINED_FUNCTION_85(unsigned char *a1@<X8>)
{
  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_86()
{
  return type metadata accessor for GetContactSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_88()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_89()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_90()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_91()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_92()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_93()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_94@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_95()
{
  return type metadata accessor for ModifyContactAttributeSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_96()
{
  return type metadata accessor for ModifyContactAttributeSnippetModel(0);
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t static CharacterSet.urlPathAllowed.getter()
{
  return MEMORY[0x270EEE0F0]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x270EEE258]();
}

uint64_t static DateComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEE760]();
}

uint64_t DateComponents.day.getter()
{
  return MEMORY[0x270EEE768]();
}

uint64_t DateComponents.month.getter()
{
  return MEMORY[0x270EEE800]();
}

uint64_t type metadata accessor for DateComponents()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t PersonNameComponents.givenName.setter()
{
  return MEMORY[0x270EEF330]();
}

uint64_t PersonNameComponents.familyName.setter()
{
  return MEMORY[0x270EEF358]();
}

uint64_t PersonNameComponents.middleName.setter()
{
  return MEMORY[0x270EEF378]();
}

uint64_t PersonNameComponents.namePrefix.setter()
{
  return MEMORY[0x270EEF3A8]();
}

uint64_t PersonNameComponents.nameSuffix.setter()
{
  return MEMORY[0x270EEF3C0]();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)MEMORY[0x270EEF3F0]();
  result._private = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t PersonNameComponents.phoneticRepresentation.setter()
{
  return MEMORY[0x270EEF400]();
}

uint64_t PersonNameComponents.nickname.setter()
{
  return MEMORY[0x270EEF428]();
}

uint64_t PersonNameComponents.init()()
{
  return MEMORY[0x270EEF450]();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return MEMORY[0x270EEF460]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t type metadata accessor for Calendar.Identifier()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t Calendar.init(identifier:)()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t Calendar.startOfDay(for:)()
{
  return MEMORY[0x270EF1100]();
}

uint64_t Calendar.dateComponents(in:from:)()
{
  return MEMORY[0x270EF1220]();
}

uint64_t Calendar.timeZone.getter()
{
  return MEMORY[0x270EF1400]();
}

uint64_t Calendar.timeZone.setter()
{
  return MEMORY[0x270EF1410]();
}

uint64_t type metadata accessor for Calendar()
{
  return MEMORY[0x270EF1440]();
}

uint64_t TimeZone.secondsFromGMT(for:)()
{
  return MEMORY[0x270EF15A0]();
}

uint64_t TimeZone.init(secondsFromGMT:)()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t static TimeZone.current.getter()
{
  return MEMORY[0x270EF1600]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x270EF1608]();
}

uint64_t Loggable.init(wrappedValue:)()
{
  return MEMORY[0x270F756A0]();
}

uint64_t Loggable.wrappedValue.getter()
{
  return MEMORY[0x270F756B0]();
}

uint64_t Loggable.wrappedValue.setter()
{
  return MEMORY[0x270F756B8]();
}

uint64_t type metadata accessor for Loggable()
{
  return MEMORY[0x270F756C8]();
}

uint64_t static DeviceIdiom.== infix(_:_:)()
{
  return MEMORY[0x270F729D8]();
}

uint64_t type metadata accessor for DeviceIdiom()
{
  return MEMORY[0x270F729E8]();
}

uint64_t Transformer.init(transform:)()
{
  return MEMORY[0x270F72A20]();
}

uint64_t Transformer.transform.getter()
{
  return MEMORY[0x270F72A28]();
}

uint64_t PhonemeData.asNameComponents(locale:)()
{
  return MEMORY[0x270F64F68]();
}

Swift::Bool __swiftcall PhonemeData.validateChecksum(fullName:)(Swift::String fullName)
{
  return MEMORY[0x270F64F70](fullName._countAndFlagsBits, fullName._object);
}

uint64_t type metadata accessor for PhonemeData()
{
  return MEMORY[0x270F64F78]();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.displayRepresentation.getter()
{
  return MEMORY[0x270F0C820]();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.identifier.getter()
{
  return MEMORY[0x270F0C830]();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.properties.getter()
{
  return MEMORY[0x270F0C840]();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.isTransient.getter()
{
  return MEMORY[0x270F0C858]();
}

uint64_t type metadata accessor for CustomAppEntityRepresentationBase.InstanceInfo()
{
  return MEMORY[0x270F0C868]();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.exportedContent.getter()
{
  return MEMORY[0x270F0C870]();
}

uint64_t static CustomAppEntityRepresentationBase.from(_:context:)()
{
  return MEMORY[0x270F0C888]();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.origin.getter()
{
  return MEMORY[0x270F0C898]();
}

uint64_t CustomAppEntityRepresentationBase.lnValue.getter()
{
  return MEMORY[0x270F0C8A8]();
}

uint64_t CustomAppEntityRepresentationBase.deinit()
{
  return MEMORY[0x270F0C8B0]();
}

uint64_t CustomAppEntityRepresentationBase.init(_:)()
{
  return MEMORY[0x270F0C8C0]();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return MEMORY[0x270F0CB38]();
}

uint64_t IntentParameter.wrappedValue.setter()
{
  return MEMORY[0x270F0CB48]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
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
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x270F9DB00]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t ThrowingTaskGroup.makeAsyncIterator()()
{
  return MEMORY[0x270FA2040]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
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

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return MEMORY[0x270EF2478]();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
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

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t ContinuousClock.init()()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return MEMORY[0x270F9ECD8]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x270F9EF08](isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
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

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F2F0]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x270F9F360]();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return MEMORY[0x270F9F378]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F430]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return MEMORY[0x270F9F730]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return MEMORY[0x270FA2378]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return MEMORY[0x270F9FC88]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t Hasher.init()()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t Duration.description.getter()
{
  return MEMORY[0x270F9FF78]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x270F3C980]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x270F3C988]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}