uint64_t NLTokenizer.tokenRange(at:)()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t result;

  v1 = [v0 sel_string];
  if (v1)
  {
    v2 = v1;
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0xE000000000000000;
  }
  lazy protocol witness table accessor for type String and conformance String();
  [v0 sel_tokenRangeAtIndex_:String.Index.utf16Offset<A>(in:)(), v3, v5];
  NSNotFound.getter();
  v6 = Range<>.init(_:in:)();
  v8 = v7;
  result = swift_bridgeObjectRelease();
  if ((v8 & 1) == 0) {
    return v6;
  }
  __break(1u);
  return result;
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

uint64_t NLTokenizer.tokenRange(for:)(uint64_t a1, uint64_t a2)
{
  v3 = v2;
  id v6 = [v2 sel_string];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v10 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v11 = _NSRange.init<A, B>(_:in:)();
  id v13 = [v3 sel_tokenRangeForRange:v11, v12, v8, v10, a1, a2];
  if (v13 == (id)NSNotFound.getter()) {
    String.Index.utf16Offset<A>(in:)();
  }
  uint64_t v14 = Range<>.init(_:in:)();
  char v16 = v15;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v16 & 1) == 0) {
    return v14;
  }
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

unint64_t lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>;
  if (!lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<String.Index>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>);
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

id NLTokenizer.enumerateTokens(in:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result = [v4 sel_string];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;

    v19[6] = v9;
    v19[7] = v11;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
    lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
    lazy protocol witness table accessor for type String and conformance String();
    uint64_t v12 = _NSRange.init<A, B>(_:in:)();
    uint64_t v14 = v13;
    char v15 = (void *)swift_allocObject();
    v15[2] = v9;
    v15[3] = v11;
    v15[4] = a3;
    v15[5] = a4;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = partial apply for closure #1 in NLTokenizer.enumerateTokens(in:using:);
    *(void *)(v16 + 24) = v15;
    v19[4] = partial apply for thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    v19[5] = v16;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 1107296256;
    v19[2] = thunk for @escaping @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    v19[3] = &block_descriptor;
    v17 = _Block_copy(v19);
    swift_retain();
    swift_release();
    [v4 enumerateTokensInRange:v12 usingBlock:v14];
    _Block_release(v17);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    id result = (id)swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_21B7BF6A8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21B7BF6E4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4, a5);
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

uint64_t NLTokenizer.tokens(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = MEMORY[0x263F8EE78];
  v18[2] = &v27;
  id v5 = [v2 sel_string];
  if (!v5) {
    return v27;
  }
  id v6 = v5;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  uint64_t aBlock = a1;
  uint64_t v20 = a2;
  uint64_t v25 = v7;
  uint64_t v26 = v9;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v10 = _NSRange.init<A, B>(_:in:)();
  uint64_t v12 = v11;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v7;
  v13[3] = v9;
  v13[4] = partial apply for closure #1 in NLTokenizer.tokens(for:);
  v13[5] = v18;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = partial apply for closure #1 in NLTokenizer.enumerateTokens(in:using:);
  *(void *)(v14 + 24) = v13;
  v23 = thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  uint64_t v24 = v14;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v20 = 1107296256;
  v21 = thunk for @escaping @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v22 = &block_descriptor_14;
  char v15 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v2 enumerateTokensInRange:v10 usingBlock:v12, v15];
  _Block_release(v15);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0) {
    return v27;
  }
  __break(1u);
  return result;
}

uint64_t closure #1 in NLTokenizer.tokens(for:)(uint64_t a1, uint64_t a2, uint64_t a3, char **a4)
{
  uint64_t v7 = *a4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v7 + 2) + 1, 1, v7);
    *a4 = v7;
  }
  unint64_t v10 = *((void *)v7 + 2);
  unint64_t v9 = *((void *)v7 + 3);
  if (v10 >= v9 >> 1) {
    uint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v10 + 1, 1, v7);
  }
  *((void *)v7 + 2) = v10 + 1;
  uint64_t v11 = &v7[16 * v10];
  *((void *)v11 + 4) = a1;
  *((void *)v11 + 5) = a2;
  *a4 = v7;
  return 1;
}

uint64_t partial apply for closure #1 in NLTokenizer.tokens(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in NLTokenizer.tokens(for:)(a1, a2, a3, *(char ***)(v3 + 16));
}

uint64_t partial apply for closure #1 in NLTokenizer.enumerateTokens(in:using:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(uint64_t (**)(uint64_t))(v4 + 32);
  uint64_t result = Range<>.init(_:in:)();
  if ((v8 & 1) == 0)
  {
    uint64_t result = v6(result);
    if ((result & 1) == 0) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t sub_21B7BFA94()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void type metadata accessor for NLLanguage(uint64_t a1)
{
}

void type metadata accessor for NLTag(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _NSRange(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for _NSRange(uint64_t result, int a2, int a3)
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

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void type metadata accessor for NLTokenizerAttributes(uint64_t a1)
{
}

void type metadata accessor for NLLanguage(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLTag(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLTag(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance NLTag(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance NLTag(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance NLTag@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = MEMORY[0x21D494320](v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance NLLanguage(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLTag(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLTag(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NLTag()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NLTag()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NLTag()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NLTag(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type NLTag and conformance NLTag((unint64_t *)&lazy protocol witness table cache variable for type NLTag and conformance NLTag, type metadata accessor for NLTag);
  uint64_t v3 = lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, type metadata accessor for NLTag);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t base witness table accessor for RawRepresentable in NLTag()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, type metadata accessor for NLTag);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NLTag()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, type metadata accessor for NLTag);
}

uint64_t lazy protocol witness table accessor for type NLTag and conformance NLTag(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NLTag@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x21D494320](*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NLLanguage@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NLLanguage(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type NLTag and conformance NLTag((unint64_t *)&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, type metadata accessor for NLLanguage);
  uint64_t v3 = lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, type metadata accessor for NLLanguage);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t base witness table accessor for RawRepresentable in NLLanguage()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, type metadata accessor for NLLanguage);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NLLanguage()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, type metadata accessor for NLLanguage);
}

uint64_t base witness table accessor for Equatable in NLLanguage()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, type metadata accessor for NLLanguage);
}

uint64_t base witness table accessor for Equatable in NLTag()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, type metadata accessor for NLTag);
}

uint64_t NLContextualEmbeddingResult.tokenVector(at:)()
{
  [v1 sel_string];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v2 = String.Index.utf16Offset<A>(in:)();
  uint64_t v3 = (void *)swift_slowAlloc();
  void *v3 = 0;
  v3[1] = 0;
  id v4 = [v0 sel_tokenVectorAtIndex_tokenRange_:v2, v3];
  if (!v4)
  {
    swift_bridgeObjectRelease();
    MEMORY[0x21D494800](v3, -1, -1);
    return (uint64_t)v4;
  }
  type metadata accessor for NSNumber();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_4;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    id v4 = (id)MEMORY[0x263F8EE78];
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v6) {
    goto LABEL_15;
  }
LABEL_4:
  v17 = (void *)MEMORY[0x263F8EE78];
  uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6 & ~(v6 >> 63), 0);
  if (v6 < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v8 = 0;
  id v4 = v17;
  do
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x21D4943E0](v8, v5);
    }
    else {
      id v9 = *(id *)(v5 + 8 * v8 + 32);
    }
    unint64_t v10 = v9;
    [v9 doubleValue];
    uint64_t v12 = v11;

    unint64_t v14 = v17[2];
    unint64_t v13 = v17[3];
    if (v14 >= v13 >> 1) {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
    }
    ++v8;
    v17[2] = v14 + 1;
    v17[v14 + 4] = v12;
  }
  while (v6 != v8);
  swift_bridgeObjectRelease();
LABEL_16:
  Range<>.init(_:in:)();
  char v16 = v15;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
    MEMORY[0x21D494800](v3, -1, -1);
    return (uint64_t)v4;
  }
LABEL_20:
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

uint64_t NLContextualEmbeddingResult.enumerateTokenVectors(in:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [v4 sel_string];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  v19[6] = v8;
  v19[7] = v10;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v11 = _NSRange.init<A, B>(_:in:)();
  uint64_t v13 = v12;
  unint64_t v14 = (void *)swift_allocObject();
  v14[2] = v8;
  v14[3] = v10;
  v14[4] = a3;
  v14[5] = a4;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = partial apply for closure #1 in NLContextualEmbeddingResult.enumerateTokenVectors(in:using:);
  *(void *)(v15 + 24) = v14;
  v19[4] = partial apply for thunk for @callee_guaranteed (@guaranteed [NSNumber], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v19[5] = v15;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 1107296256;
  v19[2] = thunk for @escaping @callee_guaranteed (@guaranteed [NSNumber], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v19[3] = &block_descriptor_0;
  char v16 = _Block_copy(v19);
  swift_retain();
  swift_release();
  [v4 enumerateTokenVectorsInRange:v11 usingBlock:v13];
  _Block_release(v16);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in NLContextualEmbeddingResult.enumerateTokenVectors(in:using:)(unint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t))
{
  uint64_t result = Range<>.init(_:in:)();
  if ((v12 & 1) == 0)
  {
    uint64_t v13 = result;
    uint64_t v14 = v11;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v16 = MEMORY[0x263F8EE78];
    if (v15)
    {
      uint64_t v26 = MEMORY[0x263F8EE78];
      uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15 & ~(v15 >> 63), 0);
      if (v15 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v25 = v13;
      uint64_t v17 = 0;
      uint64_t v16 = v26;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v18 = (id)MEMORY[0x21D4943E0](v17, a1);
        }
        else {
          id v18 = *(id *)(a1 + 8 * v17 + 32);
        }
        v19 = v18;
        [v18 doubleValue];
        uint64_t v21 = v20;

        unint64_t v23 = *(void *)(v26 + 16);
        unint64_t v22 = *(void *)(v26 + 24);
        if (v23 >= v22 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v22 > 1), v23 + 1, 1);
        }
        ++v17;
        *(void *)(v26 + 16) = v23 + 1;
        *(void *)(v26 + 8 * v23 + 32) = v21;
      }
      while (v15 != v17);
      uint64_t v13 = v25;
    }
    char v24 = a7(v16, v13, v14);
    uint64_t result = swift_bridgeObjectRelease();
    if ((v24 & 1) == 0) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [NSNumber], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  type metadata accessor for NSNumber();
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v8(v9, a3, a4, a5);

  return swift_bridgeObjectRelease();
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

uint64_t sub_21B7C09C4()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for closure #1 in NLContextualEmbeddingResult.enumerateTokenVectors(in:using:)(unint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  return closure #1 in NLContextualEmbeddingResult.enumerateTokenVectors(in:using:)(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32));
}

uint64_t sub_21B7C0A08()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed [NSNumber], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

void *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(void *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

{
  void **v3;
  void *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  void *v3 = result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Double>);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Double)>);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[3 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Double));
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[String : Double]>);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Double]);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

id _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySo5NLTagaSo8NSNumberCG_SS_Sdts5NeverOTg5014_sSo5NLTagaSo8e36CSSSdIgggod_AB3key_AD5valuetSS_Sdts5f17OIegnrzr_TR0122_sJ164NLTaggerC15NaturalLanguageE13tagHypotheses2at4unit6scheme12maximumCountSDySSSdG_SnySS5IndexVGtAK_So11NLTokenUnitVSo11a24SchemeaSitFSS_SdtSo0N0a_gB7CtXEfU_Tf3nnnpf_nTf1cn_n(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return (id)v2;
  }
  uint64_t v3 = a1;
  uint64_t v31 = MEMORY[0x263F8EE78];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
  uint64_t v2 = v31;
  id result = (id)specialized Dictionary.startIndex.getter(v3);
  uint64_t v6 = (uint64_t)result;
  uint64_t v7 = 0;
  uint64_t v8 = v3 + 64;
  uint64_t v26 = v3 + 80;
  int64_t v27 = v1;
  int v28 = v5;
  uint64_t v29 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(v3 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(v3 + 36) != v5) {
      goto LABEL_24;
    }
    uint64_t v12 = *(void **)(*(void *)(v3 + 56) + 8 * v6);
    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v13;
    id result = [v12 doubleValue];
    uint64_t v16 = v15;
    uint64_t v17 = v3;
    unint64_t v19 = *(void *)(v31 + 16);
    unint64_t v18 = *(void *)(v31 + 24);
    if (v19 >= v18 >> 1) {
      id result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v18 > 1), v19 + 1, 1);
    }
    *(void *)(v31 + 16) = v19 + 1;
    uint64_t v20 = (void *)(v31 + 24 * v19);
    v20[4] = v30;
    v20[5] = v14;
    v20[6] = v16;
    int64_t v9 = 1 << *(unsigned char *)(v17 + 32);
    if (v6 >= v9) {
      goto LABEL_25;
    }
    uint64_t v8 = v29;
    uint64_t v21 = *(void *)(v29 + 8 * v11);
    if ((v21 & (1 << v6)) == 0) {
      goto LABEL_26;
    }
    uint64_t v3 = v17;
    int v5 = v28;
    if (*(_DWORD *)(v17 + 36) != v28) {
      goto LABEL_27;
    }
    unint64_t v22 = v21 & (-2 << (v6 & 0x3F));
    if (v22)
    {
      int64_t v9 = __clz(__rbit64(v22)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v27;
    }
    else
    {
      unint64_t v23 = v11 + 1;
      unint64_t v24 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v27;
      if (v11 + 1 < v24)
      {
        unint64_t v25 = *(void *)(v29 + 8 * v23);
        if (v25)
        {
LABEL_20:
          int64_t v9 = __clz(__rbit64(v25)) + (v23 << 6);
        }
        else
        {
          while (v24 - 2 != v11)
          {
            unint64_t v25 = *(void *)(v26 + 8 * v11++);
            if (v25)
            {
              unint64_t v23 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    uint64_t v6 = v9;
    if (v7 == v10) {
      return (id)v2;
    }
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
  return result;
}

uint64_t NLTagger.tokenRange(at:unit:)(uint64_t a1, uint64_t a2)
{
  id v4 = [v2 sel_string];
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v8 = 0xE000000000000000;
  }
  lazy protocol witness table accessor for type String and conformance String();
  [v2 sel_tokenRangeAtIndex_unit_:String.Index.utf16Offset<A>(in:)(), a2, v6, v8];
  NSNotFound.getter();
  uint64_t v9 = Range<>.init(_:in:)();
  char v11 = v10;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v11 & 1) == 0) {
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t NLTagger.tokenRange(for:unit:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  id v8 = [v3 sel_string];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v12 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v13 = _NSRange.init<A, B>(_:in:)();
  id v15 = [v4 sel_tokenRangeForRange_unit_:v13, v14, a3, v10, v12, a1, a2];
  if (v15 == (id)NSNotFound.getter()) {
    String.Index.utf16Offset<A>(in:)();
  }
  uint64_t v16 = Range<>.init(_:in:)();
  char v18 = v17;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v18 & 1) == 0) {
    return v16;
  }
  __break(1u);
  return result;
}

uint64_t NLTagger.tag(at:unit:scheme:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  id v7 = [v4 sel_string];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v11 = 0xE000000000000000;
  }
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v12 = String.Index.utf16Offset<A>(in:)();
  uint64_t v13 = (void *)swift_slowAlloc();
  *uint64_t v13 = 0;
  v13[1] = 0;
  id v14 = [v4 sel_tagAtIndex_unit_scheme_tokenRange_:v12 a2:a3 a3:v13 a4:v9 a5:v11];
  Range<>.init(_:in:)();
  char v16 = v15;
  uint64_t result = swift_bridgeObjectRelease();
  if (v16)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x21D494800](v13, -1, -1);
    return (uint64_t)v14;
  }
  return result;
}

uint64_t NLTagger.tagHypotheses(at:unit:scheme:maximumCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5 = v4;
  id v9 = [v5 sel_string];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v13 = 0xE000000000000000;
  }
  v25[0] = v11;
  v25[1] = v13;
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v14 = String.Index.utf16Offset<A>(in:)();
  char v15 = (void *)swift_slowAlloc();
  *char v15 = 0;
  v15[1] = 0;
  id v16 = [v5 sel_tagHypothesesAtIndex_unit_scheme_maximumCount_tokenRange_:v14 a2:a3 a4:a4 v15];
  type metadata accessor for NLTag(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLTag and conformance NLTag();
  uint64_t v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  char v18 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySo5NLTagaSo8NSNumberCG_SS_Sdts5NeverOTg5014_sSo5NLTagaSo8e36CSSSdIgggod_AB3key_AD5valuetSS_Sdts5f17OIegnrzr_TR0122_sJ164NLTaggerC15NaturalLanguageE13tagHypotheses2at4unit6scheme12maximumCountSDySSSdG_SnySS5IndexVGtAK_So11NLTokenUnitVSo11a24SchemeaSitFSS_SdtSo0N0a_gB7CtXEfU_Tf3nnnpf_nTf1cn_n(v17);
  swift_bridgeObjectRelease();
  if (v18[2])
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Double>);
    uint64_t v19 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v19 = MEMORY[0x263F8EE80];
  }
  v25[0] = v19;
  uint64_t v20 = (void *)swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v20, 1, v25);
  swift_bridgeObjectRelease();
  uint64_t v21 = v25[0];
  Range<>.init(_:in:)();
  char v23 = v22;
  swift_bridgeObjectRelease();
  if (v23)
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    MEMORY[0x21D494800](v15, -1, -1);
    return v21;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type NLTag and conformance NLTag()
{
  unint64_t result = lazy protocol witness table cache variable for type NLTag and conformance NLTag;
  if (!lazy protocol witness table cache variable for type NLTag and conformance NLTag)
  {
    type metadata accessor for NLTag(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NLTag and conformance NLTag);
  }
  return result;
}

id NLTagger.enumerateTags(in:unit:scheme:options:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v8 = v7;
  id result = [v8 sel_string];
  if (result)
  {
    char v15 = result;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = a5;
    uint64_t v18 = v17;

    aBlock[6] = v16;
    aBlock[7] = v18;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
    lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
    lazy protocol witness table accessor for type String and conformance String();
    uint64_t v19 = _NSRange.init<A, B>(_:in:)();
    uint64_t v21 = v20;
    char v22 = (void *)swift_allocObject();
    v22[2] = v16;
    v22[3] = v18;
    v22[4] = a6;
    v22[5] = a7;
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = partial apply for closure #1 in NLTagger.enumerateTags(in:unit:scheme:options:using:);
    *(void *)(v23 + 24) = v22;
    aBlock[4] = partial apply for thunk for @callee_guaranteed (@guaranteed NLTag?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed NLTag?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    aBlock[3] = &block_descriptor_1;
    unint64_t v24 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v8 enumerateTagsInRange:v19 unit:a3 scheme:a4 options:v25 usingBlock:v24];
    _Block_release(v24);
    LOBYTE(v24) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    id result = (id)swift_release();
    if (v24) {
      __break(1u);
    }
  }
  return result;
}

void thunk for @escaping @callee_guaranteed (@guaranteed NLTag?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  id v10 = a2;
  v9(a2, a3, a4, a5);
}

uint64_t NLTagger.tags(in:unit:scheme:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v35 = MEMORY[0x263F8EE78];
  uint64_t v26 = &v35;
  id v12 = [v6 sel_string];
  if (!v12) {
    return v35;
  }
  unint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  uint64_t aBlock = a1;
  uint64_t v28 = a2;
  uint64_t v33 = v14;
  uint64_t v34 = v16;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v17 = _NSRange.init<A, B>(_:in:)();
  uint64_t v19 = v18;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v14;
  v20[3] = v16;
  v20[4] = partial apply for closure #1 in NLTagger.tags(in:unit:scheme:options:);
  v20[5] = &v25;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = partial apply for closure #1 in NLTagger.enumerateTags(in:unit:scheme:options:using:);
  *(void *)(v21 + 24) = v20;
  uint64_t v31 = thunk for @callee_guaranteed (@guaranteed NLTag?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  uint64_t v32 = v21;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v28 = 1107296256;
  uint64_t v29 = thunk for @escaping @callee_guaranteed (@guaranteed NLTag?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  uint64_t v30 = &block_descriptor_14_0;
  char v22 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v6 enumerateTagsInRange:v17 unit:v19 scheme:a3 options:a4 usingBlock:a5];
  _Block_release(v22);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0) {
    return v35;
  }
  __break(1u);
  return result;
}

uint64_t closure #1 in NLTagger.tags(in:unit:scheme:options:)(void *a1, uint64_t a2, uint64_t a3, void **a4)
{
  id v8 = *a4;
  id v9 = a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    id v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v8[2] + 1, 1, v8);
    *a4 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1) {
    id v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v11 > 1), v12 + 1, 1, v8);
  }
  v8[2] = v12 + 1;
  unint64_t v13 = &v8[3 * v12];
  v13[4] = a1;
  v13[5] = a2;
  v13[6] = a3;
  *a4 = v8;
  return 1;
}

id NLTagger.setLanguage(_:range:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NLTagger.setLanguage(_:range:)(a1, a2, a3, (SEL *)&selRef_setLanguage_range_);
}

id NLTagger.setOrthography(_:range:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NLTagger.setLanguage(_:range:)(a1, a2, a3, (SEL *)&selRef_setOrthography_range_);
}

id NLTagger.setLanguage(_:range:)(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id result = [v4 sel_string];
  if (result)
  {
    id v10 = result;
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;

    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
    lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
    lazy protocol witness table accessor for type String and conformance String();
    uint64_t v14 = _NSRange.init<A, B>(_:in:)();
    return [v4 *a4:a1:v14:v15:v11:v13:a2:a3];
  }
  return result;
}

void specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(void *a1, char a2, void *a3)
{
  uint64_t v4 = a1[2];
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v8 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v9 = a1[6];
  swift_bridgeObjectRetain();
  id v10 = (void *)*a3;
  swift_bridgeObjectRetain();
  unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(v8, v7);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14)) {
    goto LABEL_23;
  }
  char v16 = v11;
  if (v10[3] >= v15)
  {
    if (a2)
    {
      if (v11) {
        goto LABEL_10;
      }
    }
    else
    {
      specialized _NativeDictionary.copy()();
      if (v16) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    uint64_t v21 = (uint64_t *)(v20[6] + 16 * v12);
    *uint64_t v21 = v8;
    v21[1] = v7;
    *(void *)(v20[7] + 8 * v12) = v9;
    uint64_t v22 = v20[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    uint64_t v25 = v4 - 1;
    if (v4 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v26 = a1 + 9;
    while (1)
    {
      uint64_t v28 = *(v26 - 2);
      uint64_t v27 = *(v26 - 1);
      uint64_t v29 = *v26;
      uint64_t v30 = (void *)*a3;
      swift_bridgeObjectRetain();
      unint64_t v31 = specialized __RawDictionaryStorage.find<A>(_:)(v28, v27);
      uint64_t v33 = v30[2];
      BOOL v34 = (v32 & 1) == 0;
      BOOL v23 = __OFADD__(v33, v34);
      uint64_t v35 = v33 + v34;
      if (v23) {
        break;
      }
      char v36 = v32;
      if (v30[3] < v35)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v35, 1);
        unint64_t v31 = specialized __RawDictionaryStorage.find<A>(_:)(v28, v27);
        if ((v36 & 1) != (v37 & 1)) {
          goto LABEL_25;
        }
      }
      if (v36) {
        goto LABEL_10;
      }
      v38 = (void *)*a3;
      *(void *)(*a3 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      v39 = (uint64_t *)(v38[6] + 16 * v31);
      uint64_t *v39 = v28;
      v39[1] = v27;
      *(void *)(v38[7] + 8 * v31) = v29;
      uint64_t v40 = v38[2];
      BOOL v23 = __OFADD__(v40, 1);
      uint64_t v41 = v40 + 1;
      if (v23) {
        goto LABEL_24;
      }
      v38[2] = v41;
      v26 += 3;
      if (!--v25) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a2 & 1);
  unint64_t v17 = specialized __RawDictionaryStorage.find<A>(_:)(v8, v7);
  if ((v16 & 1) == (v18 & 1))
  {
    unint64_t v12 = v17;
    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v19 = (void *)swift_allocError();
    swift_willThrow();
    MEMORY[0x21D494740](v19);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v42._object = (void *)0x800000021B7C5620;
  v42._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v42);
  _print_unlocked<A, B>(_:_:)();
  v43._countAndFlagsBits = 39;
  v43._object = (void *)0xE100000000000000;
  String.append(_:)(v43);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_21B7C206C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21B7C20A8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed NLTag?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in NLTagger.tags(in:unit:scheme:options:)(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in NLTagger.tags(in:unit:scheme:options:)(a1, a2, a3, *(void ***)(v3 + 16));
}

uint64_t partial apply for closure #1 in NLTagger.enumerateTags(in:unit:scheme:options:using:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  uint64_t result = Range<>.init(_:in:)();
  if ((v10 & 1) == 0)
  {
    uint64_t result = v7(a1, result, v9);
    if ((result & 1) == 0) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t sub_21B7C2170()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
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
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Double>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Double>);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
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

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void *NLModel.predictedLabelHypotheses(for:maximumCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = (void *)MEMORY[0x21D494320]();
  id v6 = [v3 predictedLabelHypothesesForString:v5 maximumCount:a3];

  type metadata accessor for NSNumber();
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v8 = specialized _NativeDictionary.mapValues<A>(_:)(v7);
  swift_bridgeObjectRelease();
  return v8;
}

id NLModel.predictedLabelHypotheses(forTokens:maximumCount:)(uint64_t a1, uint64_t a2)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v5 = [v2 predictedLabelHypothesesForTokens:a2 maximumCount:];

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : NSNumber]);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v7 = *(void *)(v6 + 16);
  if (!v7)
  {
    swift_bridgeObjectRelease();
    return (id)MEMORY[0x263F8EE78];
  }
  uint64_t v42 = MEMORY[0x263F8EE78];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7, 0);
  uint64_t v8 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Double>);
  uint64_t v9 = 0;
  int64_t v35 = v7;
  uint64_t v36 = v6 + 32;
  while (2)
  {
    uint64_t v10 = *(void *)(v36 + 8 * v9);
    uint64_t v37 = v9 + 1;
    uint64_t v38 = v8;
    uint64_t v11 = static _DictionaryStorage.copy(original:)();
    uint64_t v12 = (void *)v11;
    uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
    uint64_t v39 = v10 + 64;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & *(void *)(v10 + 64);
    int64_t v40 = (unint64_t)(v13 + 63) >> 6;
    uint64_t v41 = v10;
    uint64_t v16 = v11 + 64;
    id result = (id)swift_bridgeObjectRetain();
    int64_t v18 = 0;
    if (v15)
    {
LABEL_7:
      unint64_t v19 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v20 = v19 | (v18 << 6);
      goto LABEL_24;
    }
    while (1)
    {
      int64_t v21 = v18 + 1;
      if (__OFADD__(v18, 1)) {
        goto LABEL_34;
      }
      if (v21 >= v40) {
        goto LABEL_27;
      }
      unint64_t v22 = *(void *)(v39 + 8 * v21);
      ++v18;
      if (!v22)
      {
        int64_t v18 = v21 + 1;
        if (v21 + 1 >= v40) {
          goto LABEL_27;
        }
        unint64_t v22 = *(void *)(v39 + 8 * v18);
        if (!v22)
        {
          int64_t v18 = v21 + 2;
          if (v21 + 2 >= v40) {
            goto LABEL_27;
          }
          unint64_t v22 = *(void *)(v39 + 8 * v18);
          if (!v22)
          {
            int64_t v18 = v21 + 3;
            if (v21 + 3 >= v40) {
              goto LABEL_27;
            }
            unint64_t v22 = *(void *)(v39 + 8 * v18);
            if (!v22) {
              break;
            }
          }
        }
      }
LABEL_23:
      unint64_t v15 = (v22 - 1) & v22;
      unint64_t v20 = __clz(__rbit64(v22)) + (v18 << 6);
LABEL_24:
      unint64_t v24 = (uint64_t *)(*(void *)(v41 + 48) + 16 * v20);
      uint64_t v26 = *v24;
      uint64_t v25 = v24[1];
      unint64_t v27 = *(void **)(*(void *)(v41 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
      id result = [v27 doubleValue];
      *(void *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      BOOL v28 = (void *)(v12[6] + 16 * v20);
      *BOOL v28 = v26;
      v28[1] = v25;
      *(void *)(v12[7] + 8 * v20) = v29;
      uint64_t v30 = v12[2];
      BOOL v31 = __OFADD__(v30, 1);
      uint64_t v32 = v30 + 1;
      if (v31)
      {
        __break(1u);
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      v12[2] = v32;
      if (v15) {
        goto LABEL_7;
      }
    }
    int64_t v23 = v21 + 4;
    if (v23 >= v40)
    {
LABEL_27:
      swift_bridgeObjectRelease();
      uint64_t v8 = v38;
      unint64_t v34 = *(void *)(v38 + 16);
      unint64_t v33 = *(void *)(v38 + 24);
      if (v34 >= v33 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v33 > 1), v34 + 1, 1);
        uint64_t v8 = v38;
      }
      *(void *)(v8 + 16) = v34 + 1;
      *(void *)(v8 + 8 * v34 + 32) = v12;
      uint64_t v9 = v37;
      if (v37 == v35)
      {
        swift_bridgeObjectRelease();
        return (id)v8;
      }
      continue;
    }
    break;
  }
  unint64_t v22 = *(void *)(v39 + 8 * v23);
  if (v22)
  {
    int64_t v18 = v23;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v18 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v18 >= v40) {
      goto LABEL_27;
    }
    unint64_t v22 = *(void *)(v39 + 8 * v18);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

void *specialized _NativeDictionary.mapValues<A>(_:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Double>);
  id result = (void *)static _DictionaryStorage.copy(original:)();
  uint64_t v3 = result;
  int64_t v4 = 0;
  uint64_t v27 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = a1 + 64;
  uint64_t v5 = v7;
  uint64_t v8 = 1 << *(unsigned char *)(v6 - 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v5;
  int64_t v26 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = (char *)(result + 8);
  if ((v9 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v12 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v4 << 6))
  {
    unint64_t v17 = (uint64_t *)(*(void *)(v27 + 48) + 16 * i);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = *(void **)(*(void *)(v27 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    id result = [v20 doubleValue];
    *(void *)&v11[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    int64_t v21 = (void *)(v3[6] + 16 * i);
    *int64_t v21 = v19;
    v21[1] = v18;
    *(void *)(v3[7] + 8 * i) = v22;
    uint64_t v23 = v3[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v25;
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v14 >= v26) {
      return v3;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v4;
    if (!v15)
    {
      int64_t v4 = v14 + 1;
      if (v14 + 1 >= v26) {
        return v3;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v4);
      if (!v15)
      {
        int64_t v4 = v14 + 2;
        if (v14 + 2 >= v26) {
          return v3;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v4);
        if (!v15) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v26) {
    return v3;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v4 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v4 >= v26) {
      return v3;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v4);
    ++v16;
    if (v15) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

{
  void *result;
  void *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<NLLanguage, Double>);
  id result = (void *)static _DictionaryStorage.copy(original:)();
  uint64_t v3 = result;
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 64);
  int64_t v21 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  uint64_t v8 = v7 & v5;
  uint64_t v22 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = (char *)(result + 8);
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    unint64_t v15 = *(void **)(*(void *)(a1 + 56) + 8 * i);
    int64_t v16 = *(id *)(*(void *)(a1 + 48) + 8 * i);
    id result = [v15 doubleValue];
    *(void *)&v9[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    *(void *)(v3[6] + 8 * i) = v16;
    *(void *)(v3[7] + 8 * i) = v17;
    uint64_t v18 = v3[2];
    uint64_t v19 = __OFADD__(v18, 1);
    unint64_t v20 = v18 + 1;
    if (v19)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v20;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    unint64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v12 >= v22) {
      return v3;
    }
    uint64_t v13 = *(void *)(v21 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v22) {
        return v3;
      }
      uint64_t v13 = *(void *)(v21 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v22) {
          return v3;
        }
        uint64_t v13 = *(void *)(v21 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v8 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v22) {
    return v3;
  }
  uint64_t v13 = *(void *)(v21 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v22) {
      return v3;
    }
    uint64_t v13 = *(void *)(v21 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

{
  void *result;
  void *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _DictionaryStorage<NLLanguage, NSNumber>);
  id result = (void *)static _DictionaryStorage.copy(original:)();
  uint64_t v3 = result;
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v22 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  uint64_t v8 = v7 & v5;
  uint64_t v23 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = (char *)(result + 8);
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    unint64_t v15 = *(void **)(*(void *)(a1 + 48) + 8 * i);
    int64_t v16 = *(double *)(*(void *)(a1 + 56) + 8 * i);
    unint64_t v17 = objc_allocWithZone(NSNumber);
    uint64_t v18 = v15;
    id result = [v17 initWithDouble:v16];
    *(void *)&v9[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    *(void *)(v3[6] + 8 * i) = v18;
    *(void *)(v3[7] + 8 * i) = result;
    uint64_t v19 = v3[2];
    unint64_t v20 = __OFADD__(v19, 1);
    int64_t v21 = v19 + 1;
    if (v20)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v21;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    unint64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v12 >= v23) {
      return v3;
    }
    uint64_t v13 = *(void *)(v22 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v23) {
        return v3;
      }
      uint64_t v13 = *(void *)(v22 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v23) {
          return v3;
        }
        uint64_t v13 = *(void *)(v22 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v8 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v23) {
    return v3;
  }
  uint64_t v13 = *(void *)(v22 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v23) {
      return v3;
    }
    uint64_t v13 = *(void *)(v22 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

Swift::Double __swiftcall NLEmbedding.distance(between:and:distanceType:)(Swift::String between, Swift::String and, NLDistanceType distanceType)
{
  object = and._object;
  uint64_t countAndFlagsBits = and._countAndFlagsBits;
  uint64_t v7 = (void *)MEMORY[0x21D494320](between._countAndFlagsBits, between._object);
  uint64_t v8 = (void *)MEMORY[0x21D494320](countAndFlagsBits, object);
  [v3 distanceBetweenString:v7 andString:v8 distanceType:distanceType];
  double v10 = v9;

  return v10;
}

uint64_t NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  unint64_t v12 = (void *)MEMORY[0x21D494320]();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a5;
  *(void *)(v13 + 24) = a6;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = partial apply for closure #1 in NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:);
  *(void *)(v14 + 24) = v13;
  v17[4] = partial apply for thunk for @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v17[5] = v14;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v17[3] = &block_descriptor_2;
  unint64_t v15 = _Block_copy(v17);
  swift_retain();
  swift_release();
  [v7 enumerateNeighborsForString:v12 maximumCount:a3 distanceType:a4 usingBlock:v15];

  _Block_release(v15);
  LOBYTE(a4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a4) {
    __break(1u);
  }
  return result;
}

uint64_t sub_21B7C302C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21B7C3040()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, double a2)
{
  uint64_t v3 = *(void (**)(uint64_t, double))(a1 + 32);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3(v4, a2);

  return swift_bridgeObjectRelease();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t NLEmbedding.neighbors(for:maximumCount:distanceType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v15 = MEMORY[0x263F8EE78];
  v13[2] = &v15;
  uint64_t v8 = (void *)MEMORY[0x21D494320]();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = partial apply for closure #1 in NLEmbedding.neighbors(for:maximumCount:distanceType:);
  *(void *)(v9 + 24) = v13;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = partial apply for closure #1 in NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:);
  *(void *)(v10 + 24) = v9;
  aBlock[4] = thunk for @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_14_1;
  uint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v5 enumerateNeighborsForString:v8 maximumCount:a3 distanceType:a4 usingBlock:v11];

  _Block_release(v11);
  LOBYTE(a4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((a4 & 1) == 0) {
    return v15;
  }
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in NLEmbedding.neighbors(for:maximumCount:distanceType:)(uint64_t a1, uint64_t a2, double a3)
{
  return closure #1 in NLEmbedding.neighbors(for:maximumCount:distanceType:)(a1, a2, *(void ***)(v3 + 16), a3) & 1;
}

uint64_t sub_21B7C32BC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21B7C32CC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v9 = a3;
  uint64_t v10 = a2;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    aBlock[0] = MEMORY[0x263F8EE78];
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v14 = (double *)(a1 + 32);
    do
    {
      double v15 = *v14++;
      [objc_allocWithZone(NSNumber) initWithDouble:v15];
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v11;
    }
    while (v11);
    uint64_t v9 = a3;
    uint64_t v10 = a2;
  }
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a4;
  *(void *)(v17 + 24) = a5;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = partial apply for closure #1 in NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:);
  *(void *)(v18 + 24) = v17;
  aBlock[4] = thunk for @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_24;
  uint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v6 enumerateNeighborsForVector:v10 maximumCount:v9 distanceType:v19 usingBlock:isa];

  _Block_release(v19);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_21B7C3520()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:)(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(v3 + 16))();
  if ((result & 1) == 0) {
    *a3 = 1;
  }
  return result;
}

uint64_t sub_21B7C3568()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t NLEmbedding.neighbors(for:maximumCount:distanceType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = MEMORY[0x263F8EE78];
  v4[2] = &v5;
  NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:)(a1, a2, a3, (uint64_t)partial apply for closure #1 in NLEmbedding.neighbors(for:maximumCount:distanceType:), (uint64_t)v4);
  return v5;
}

uint64_t closure #1 in NLEmbedding.neighbors(for:maximumCount:distanceType:)(uint64_t a1, uint64_t a2, void **a3, double a4)
{
  uint64_t v8 = *a3;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v8[2] + 1, 1, v8);
    *a3 = v8;
  }
  unint64_t v11 = v8[2];
  unint64_t v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    uint64_t v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v10 > 1), v11 + 1, 1, v8);
    *a3 = v8;
  }
  v8[2] = v11 + 1;
  unint64_t v12 = (double *)&v8[3 * v11];
  *((void *)v12 + 4) = a1;
  *((void *)v12 + 5) = a2;
  v12[6] = a4;
  return 1;
}

Swift::OpaquePointer_optional __swiftcall NLEmbedding.vector(for:)(Swift::String a1)
{
  uint64_t v2 = (void *)MEMORY[0x21D494320](a1._countAndFlagsBits, a1._object);
  id v3 = [v1 sel_vectorForString:v2];

  if (!v3) {
    goto LABEL_15;
  }
  type metadata accessor for NSNumber();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_4;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    id v3 = (id)MEMORY[0x263F8EE78];
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v6) {
    goto LABEL_14;
  }
LABEL_4:
  double v15 = (void *)MEMORY[0x263F8EE78];
  uint64_t v7 = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6 & ~(v6 >> 63), 0);
  if (v6 < 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v8 = 0;
  id v3 = v15;
  do
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x21D4943E0](v8, v5);
    }
    else {
      id v9 = *(id *)(v5 + 8 * v8 + 32);
    }
    unint64_t v10 = v9;
    [v9 doubleValue];
    uint64_t v12 = v11;

    unint64_t v14 = v15[2];
    unint64_t v13 = v15[3];
    if (v14 >= v13 >> 1) {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
    }
    ++v8;
    v15[2] = v14 + 1;
    v15[v14 + 4] = v12;
  }
  while (v6 != v8);
  swift_bridgeObjectRelease();
LABEL_15:
  uint64_t v7 = (char *)v3;
LABEL_17:
  result.value._rawValue = v7;
  result.is_nil = v4;
  return result;
}

id static NLEmbedding.write(_:language:revision:to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  specialized _NativeDictionary.mapValues<A>(_:)(a1);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSNumber]);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_release();
  URL._bridgeToObjectiveC()(v7);
  id v9 = v8;
  v13[0] = 0;
  unsigned int v10 = [ObjCClassFromMetadata writeEmbeddingForDictionary:isa language:a2 revision:v8 toURL:v13 error:&v13];

  if (v10) {
    return v13[0];
  }
  id v12 = v13[0];
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<String.Index>>);
    unsigned int v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unsigned int v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NLTag?, Range<String.Index>)>);
    unsigned int v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unsigned int v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[3 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (NLTag?, Range<String.Index>));
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  size_t v11;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Double)>);
    unsigned int v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unsigned int v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[3 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Double));
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized _NativeDictionary.mapValues<A>(_:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [NSNumber]>);
  uint64_t result = static _DictionaryStorage.copy(original:)();
  id v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v30 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = a1 + 64;
  uint64_t v5 = v7;
  uint64_t v8 = 1 << *(unsigned char *)(v6 - 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v5;
  int64_t v28 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v29 = result + 64;
  uint64_t v27 = (void *)result;
  if ((v9 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v11 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    int64_t v16 = (uint64_t *)(*(void *)(v30 + 48) + 16 * i);
    uint64_t v17 = *v16;
    uint64_t v18 = *(void *)(*(void *)(v30 + 56) + 8 * i);
    uint64_t v19 = *(void *)(v18 + 16);
    if (v19)
    {
      uint64_t v31 = *v16;
      int64_t v33 = v4;
      uint64_t v34 = MEMORY[0x263F8EE78];
      uint64_t v32 = v16[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      specialized ContiguousArray.reserveCapacity(_:)();
      uint64_t v20 = 0;
      do
      {
        uint64_t v21 = v20 + 1;
        [objc_allocWithZone(NSNumber) initWithDouble:*(double *)(v18 + 8 * v20 + 32)];
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        uint64_t v20 = v21;
      }
      while (v19 != v21);
      uint64_t v22 = v34;
      swift_bridgeObjectRelease();
      id v3 = v27;
      int64_t v4 = v33;
      uint64_t v17 = v31;
      uint64_t result = v32;
    }
    else
    {
      uint64_t result = swift_bridgeObjectRetain();
      uint64_t v22 = MEMORY[0x263F8EE78];
    }
    *(void *)(v29 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v23 = (void *)(v3[6] + 16 * i);
    *uint64_t v23 = v17;
    v23[1] = result;
    *(void *)(v3[7] + 8 * i) = v22;
    uint64_t v24 = v3[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v3[2] = v26;
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_29;
    }
    if (v13 >= v28) {
      return (uint64_t)v3;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v4;
    if (!v14)
    {
      int64_t v4 = v13 + 1;
      if (v13 + 1 >= v28) {
        return (uint64_t)v3;
      }
      unint64_t v14 = *(void *)(v6 + 8 * v4);
      if (!v14)
      {
        int64_t v4 = v13 + 2;
        if (v13 + 2 >= v28) {
          return (uint64_t)v3;
        }
        unint64_t v14 = *(void *)(v6 + 8 * v4);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v28) {
    return (uint64_t)v3;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v4 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v4 >= v28) {
      return (uint64_t)v3;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v4);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *NLLanguageRecognizer.languageHints.getter()
{
  id v1 = [v0 sel_languageHints];
  type metadata accessor for NLLanguage(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  id v3 = specialized _NativeDictionary.mapValues<A>(_:)(v2);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage()
{
  unint64_t result = lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage;
  if (!lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage)
  {
    type metadata accessor for NLLanguage(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage);
  }
  return result;
}

uint64_t key path getter for NLLanguageRecognizer.languageHints : NLLanguageRecognizer@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id v3 = [*a1 sel_languageHints];
  type metadata accessor for NLLanguage(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v5 = specialized _NativeDictionary.mapValues<A>(_:)(v4);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5;
  return result;
}

void key path setter for NLLanguageRecognizer.languageHints : NLLanguageRecognizer(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.mapValues<A>(_:)(v3);
  swift_bridgeObjectRelease();
  type metadata accessor for NLLanguage(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_release();
  [v2 setLanguageHints:isa];
}

void NLLanguageRecognizer.languageHints.setter(uint64_t a1)
{
  specialized _NativeDictionary.mapValues<A>(_:)(a1);
  swift_bridgeObjectRelease();
  type metadata accessor for NLLanguage(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_release();
  [v1 setLanguageHints:isa];
}

void (*NLLanguageRecognizer.languageHints.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[1] = v2;
  id v5 = [v2 sel_languageHints];
  type metadata accessor for NLLanguage(0);
  v4[2] = v6;
  void v4[3] = type metadata accessor for NSNumber();
  v4[4] = lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v8 = specialized _NativeDictionary.mapValues<A>(_:)(v7);
  v4[5] = 0;
  swift_bridgeObjectRelease();
  void *v4 = v8;
  return NLLanguageRecognizer.languageHints.modify;
}

void NLLanguageRecognizer.languageHints.modify(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[1];
  uint64_t v4 = **a1;
  if (a2)
  {
    uint64_t v5 = swift_bridgeObjectRetain();
    specialized _NativeDictionary.mapValues<A>(_:)(v5);
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_release();
    [v3 setLanguageHints:isa];

    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _NativeDictionary.mapValues<A>(_:)(v4);
    swift_bridgeObjectRelease();
    Class v7 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_release();
    [v3 setLanguageHints:v7];
  }

  free(v2);
}

void *NLLanguageRecognizer.languageHypotheses(withMaximum:)(uint64_t a1)
{
  id v2 = [v1 languageHypothesesWithMaximum:a1];
  type metadata accessor for NLLanguage(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v4 = specialized _NativeDictionary.mapValues<A>(_:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t NSNotFound.getter()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.Index.utf16Offset<A>(in:)()
{
  return MEMORY[0x270F9D720]();
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

uint64_t Range<>.init(_:in:)()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t _NSRange.init<A, B>(_:in:)()
{
  return MEMORY[0x270EF2210]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
{
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}