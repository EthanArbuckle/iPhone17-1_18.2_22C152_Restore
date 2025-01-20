uint64_t static EntityProperty<>.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char v9;
  void (*v10)(char *, uint64_t);
  uint64_t v12;

  v1 = *(void *)(v0 + *MEMORY[0x263EFB8C8]);
  OUTLINED_FUNCTION_0();
  v3 = v2;
  v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)&v12 - v7;
  EntityProperty.wrappedValue.getter();
  EntityProperty.wrappedValue.getter();
  v9 = dispatch thunk of static Equatable.== infix(_:_:)();
  v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v1);
  v10(v8, v1);
  return v9 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> EntityProperty<A>()
{
  return static EntityProperty<>.== infix(_:_:)();
}

BOOL static EntityProperty<>.CodingKeys.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void EntityProperty<>.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
}

uint64_t EntityProperty<>.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x5664657070617277 && a2 == 0xEC00000065756C61;
  if (v2 || (OUTLINED_FUNCTION_2() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = OUTLINED_FUNCTION_2();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t EntityProperty<>.CodingKeys.init(intValue:)()
{
  return 2;
}

Swift::Int EntityProperty<>.CodingKeys.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

uint64_t EntityProperty<>.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x656C746974;
  }
  else {
    return 0x5664657070617277;
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance EntityProperty<A><>.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static EntityProperty<>.CodingKeys.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance EntityProperty<A><>.CodingKeys()
{
  return EntityProperty<>.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance EntityProperty<A><>.CodingKeys(uint64_t a1)
{
  EntityProperty<>.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance EntityProperty<A><>.CodingKeys()
{
  Hasher.init(_seed:)();
  EntityProperty<>.CodingKeys.hash(into:)((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance EntityProperty<A><>.CodingKeys()
{
  return EntityProperty<>.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance EntityProperty<A><>.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = EntityProperty<>.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance EntityProperty<A><>.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance EntityProperty<A><>.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance EntityProperty<A><>.CodingKeys(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance EntityProperty<A><>.CodingKeys(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t EntityProperty<>.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v26 = a2;
  uint64_t v25 = type metadata accessor for LocalizedStringResource();
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1();
  uint64_t v24 = v6 - v5;
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v7;
  MEMORY[0x270FA5388](v8);
  type metadata accessor for EntityProperty<>.CodingKeys();
  swift_getWitnessTable();
  uint64_t v9 = type metadata accessor for KeyedEncodingContainer();
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v10;
  MEMORY[0x270FA5388](v11);
  v13 = (char *)&v23 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  EntityProperty.wrappedValue.getter();
  char v31 = 0;
  uint64_t v14 = v29;
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (v14)
  {
    uint64_t v15 = OUTLINED_FUNCTION_3();
    v16(v15);
  }
  else
  {
    uint64_t v17 = v23;
    uint64_t v18 = OUTLINED_FUNCTION_3();
    v19(v18);
    uint64_t v20 = v24;
    EntityProperty.title.getter();
    char v30 = 1;
    lazy protocol witness table accessor for type LocalizedStringResource and conformance LocalizedStringResource(&lazy protocol witness table cache variable for type LocalizedStringResource and conformance LocalizedStringResource, MEMORY[0x263F06D40]);
    uint64_t v21 = v25;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v20, v21);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v13, v9);
}

BOOL static IntentFile.CodingKeys.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void IntentFile.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
}

uint64_t IntentFile.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1635017060 && a2 == 0xE400000000000000;
  if (v2 || (OUTLINED_FUNCTION_2() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = OUTLINED_FUNCTION_2();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t IntentFile.CodingKeys.init(intValue:)()
{
  return 2;
}

Swift::Int IntentFile.CodingKeys.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

uint64_t IntentFile.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x656D616E656C6966;
  }
  else {
    return 1635017060;
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance IntentFile.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static IntentFile.CodingKeys.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance IntentFile.CodingKeys()
{
  return IntentFile.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance IntentFile.CodingKeys(uint64_t a1)
{
  IntentFile.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance IntentFile.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance IntentFile.CodingKeys()
{
  return IntentFile.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance IntentFile.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = IntentFile.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance IntentFile.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance IntentFile.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IntentFile.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<IntentFile.CodingKeys>);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v4 = IntentFile.data.getter();
  unint64_t v6 = v5;
  lazy protocol witness table accessor for type Data and conformance Data();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  outlined consume of Data._Representation(v4, v6);
  if (v1)
  {
    uint64_t v7 = OUTLINED_FUNCTION_4();
    return v8(v7);
  }
  else
  {
    IntentFile.filename.getter();
    KeyedEncodingContainer.encode(_:forKey:)();
    uint64_t v10 = OUTLINED_FUNCTION_4();
    v11(v10);
    return swift_bridgeObjectRelease();
  }
}

uint64_t one-time initialization function for shared()
{
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  uint64_t result = JSONEncoder.init()();
  static JSONEncoder.shared = result;
  return result;
}

uint64_t *JSONEncoder.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return &static JSONEncoder.shared;
}

uint64_t static JSONEncoder.shared.getter()
{
  return static JSONEncoder.shared.getter(&one-time initialization token for shared);
}

uint64_t one-time initialization function for iso8601()
{
  uint64_t v0 = type metadata accessor for JSONEncoder.KeyEncodingStrategy();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for JSONEncoder.OutputFormatting();
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for JSONEncoder();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F06198], v7);
  v12[1] = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type LocalizedStringResource and conformance LocalizedStringResource(&lazy protocol witness table cache variable for type JSONEncoder.OutputFormatting and conformance JSONEncoder.OutputFormatting, MEMORY[0x263F06130]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [JSONEncoder.OutputFormatting]);
  lazy protocol witness table accessor for type [JSONEncoder.OutputFormatting] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06150], v0);
  uint64_t result = JSONEncoder.init(dateEncodingStrategy:outputFormatting:keyEncodingStrategy:)((uint64_t)v10, (uint64_t)v6, (uint64_t)v3);
  static JSONEncoder.iso8601 = result;
  return result;
}

uint64_t default argument 1 of JSONEncoder.init(dateEncodingStrategy:outputFormatting:keyEncodingStrategy:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t default argument 2 of JSONEncoder.init(dateEncodingStrategy:outputFormatting:keyEncodingStrategy:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F06150];
  uint64_t v3 = type metadata accessor for JSONEncoder.KeyEncodingStrategy();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t JSONEncoder.init(dateEncodingStrategy:outputFormatting:keyEncodingStrategy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = type metadata accessor for JSONEncoder.KeyEncodingStrategy();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8 - v7;
  uint64_t v25 = type metadata accessor for JSONEncoder.OutputFormatting();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_1();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = dispatch thunk of JSONEncoder.__allocating_init()();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v22, a1, v16);
  swift_retain();
  dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v15, a2, v25);
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a3, v27);
  dispatch thunk of JSONEncoder.keyEncodingStrategy.setter();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a3, v27);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v25);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a1, v16);
  return v23;
}

uint64_t *JSONEncoder.iso8601.unsafeMutableAddressor()
{
  if (one-time initialization token for iso8601 != -1) {
    swift_once();
  }
  return &static JSONEncoder.iso8601;
}

uint64_t static JSONEncoder.iso8601.getter()
{
  return static JSONEncoder.shared.getter(&one-time initialization token for iso8601);
}

uint64_t one-time initialization function for iso8601PrettyPrinted()
{
  uint64_t v0 = type metadata accessor for JSONEncoder.KeyEncodingStrategy();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for JSONEncoder.OutputFormatting();
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1();
  uint64_t v17 = v16 - v15;
  type metadata accessor for JSONEncoder();
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v17, *MEMORY[0x263F06198], v11);
  static JSONEncoder.OutputFormatting.prettyPrinted.getter();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v6, *MEMORY[0x263F06150], v0);
  uint64_t result = JSONEncoder.init(dateEncodingStrategy:outputFormatting:keyEncodingStrategy:)(v17, v10, v6);
  static JSONEncoder.iso8601PrettyPrinted = result;
  return result;
}

uint64_t *JSONEncoder.iso8601PrettyPrinted.unsafeMutableAddressor()
{
  if (one-time initialization token for iso8601PrettyPrinted != -1) {
    swift_once();
  }
  return &static JSONEncoder.iso8601PrettyPrinted;
}

uint64_t static JSONEncoder.iso8601PrettyPrinted.getter()
{
  return static JSONEncoder.shared.getter(&one-time initialization token for iso8601PrettyPrinted);
}

uint64_t static JSONEncoder.shared.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_retain();
}

Swift::String __swiftcall Encodable.jsonPrettyPrinted()()
{
  uint64_t v2 = Encodable.jsonPrettyPrinted()(v0, v1, &one-time initialization token for iso8601PrettyPrinted);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

Swift::String __swiftcall Encodable.json()()
{
  uint64_t v2 = Encodable.jsonPrettyPrinted()(v0, v1, &one-time initialization token for iso8601);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t Encodable.jsonPrettyPrinted()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = type metadata accessor for String.Encoding();
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_1();
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v7 = v6;
  static String.Encoding.utf8.getter();
  uint64_t v8 = String.init(data:encoding:)();
  if (v9)
  {
    uint64_t v10 = v8;
    outlined consume of Data._Representation(v5, v7);
  }
  else
  {
    outlined consume of Data._Representation(v5, v7);
    return 0;
  }
  return v10;
}

Swift::String __swiftcall Encodable.jsonBase64()()
{
  if (one-time initialization token for iso8601 != -1) {
    swift_once();
  }
  uint64_t v0 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v2 = v1;
  Swift::String v3 = Data.base64EncodedString(options:)(0);
  outlined consume of Data._Representation(v0, v2);
  uint64_t countAndFlagsBits = v3._countAndFlagsBits;
  object = v3._object;
  result._object = object;
  result._uint64_t countAndFlagsBits = countAndFlagsBits;
  return result;
}

uint64_t type metadata accessor for EntityProperty<>.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

unint64_t lazy protocol witness table accessor for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys;
  if (!lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys;
  if (!lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys;
  if (!lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys;
  if (!lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys);
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

uint64_t lazy protocol witness table accessor for type LocalizedStringResource and conformance LocalizedStringResource(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type [JSONEncoder.OutputFormatting] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [JSONEncoder.OutputFormatting] and conformance [A];
  if (!lazy protocol witness table cache variable for type [JSONEncoder.OutputFormatting] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [JSONEncoder.OutputFormatting]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [JSONEncoder.OutputFormatting] and conformance [A]);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t base witness table accessor for Equatable in EntityProperty<A><>.CodingKeys()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for CustomDebugStringConvertible in EntityProperty<A><>.CodingKeys()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for CustomStringConvertible in EntityProperty<A><>.CodingKeys()
{
  return swift_getWitnessTable();
}

uint64_t type metadata instantiation function for EntityProperty<>.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EntityProperty<>.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for EntityProperty<>.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2586D47A4);
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

uint64_t getEnumTag for IntentFile.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for IntentFile.CodingKeys(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IntentFile.CodingKeys()
{
  return &type metadata for IntentFile.CodingKeys;
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

void type metadata accessor for _NSRange()
{
  if (!lazy cache variable for type metadata for _NSRange)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for _NSRange);
    }
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return v0;
}

void OUTLINED_FUNCTION_6(float a1)
{
  float *v1 = a1;
  JUMPOUT(0x25A2CA520);
}

void OUTLINED_FUNCTION_7()
{
  JUMPOUT(0x25A2CA650);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t ExperienceProviding.experiences.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  MEMORY[0x270FA5388](v4 - 8);
  os_log_type_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for IntentFile();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v17 - v10;
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    outlined destroy of IntentFile?((uint64_t)v6, &demangling cache variable for type metadata for IntentFile?);
    return MEMORY[0x263F8EE78];
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v6, v7);
    uint64_t v12 = IntentFile.data.getter();
    unint64_t v14 = v13;
    uint64_t v15 = static LoadExperience.fromData(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    outlined consume of Data._Representation(v12, v14);
  }
  return v15;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t static LoadExperience.fromData(_:)()
{
  type metadata accessor for NSKeyedUnarchiver(0, &lazy cache variable for type metadata for NSKeyedUnarchiver);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2586F7840;
  *(void *)(v1 + 32) = type metadata accessor for NSKeyedUnarchiver(0, &lazy cache variable for type metadata for NSArray);
  *(void *)(v1 + 40) = type metadata accessor for Experience();
  static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v0)
  {
    if (v3[3])
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Experience]);
      if (swift_dynamicCast()) {
        return v3[5];
      }
    }
    else
    {
      outlined destroy of IntentFile?((uint64_t)v3, &demangling cache variable for type metadata for Any?);
    }
    return MEMORY[0x263F8EE78];
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

uint64_t type metadata accessor for NSKeyedUnarchiver(uint64_t a1, unint64_t *a2)
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

uint64_t outlined destroy of IntentFile?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t dispatch thunk of ExperienceProviding.experienceSourceType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ExperienceProviding.experienceFile.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for LoadExperience()
{
  return &type metadata for LoadExperience;
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
  unint64_t v13 = (char *)(a4 + 32);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SearchGlobalEntity.CustomAttribute>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
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

uint64_t OUTLINED_FUNCTION_0_0()
{
  return v0;
}

uint64_t GlobalDialog.print.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GlobalDialog.print.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*GlobalDialog.print.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t GlobalDialog.speak.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GlobalDialog.speak.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*GlobalDialog.speak.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

OmniSearchTypes::GlobalDialog __swiftcall GlobalDialog.init(print:speak:)(Swift::String print, Swift::String speak)
{
  *uint64_t v2 = print;
  v2[1] = speak;
  result.speak = speak;
  result.print = print;
  return result;
}

uint64_t static GlobalDialog.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return _stringCompareWithSmolCheck(_:_:expecting:)();
    }
  }
  return result;
}

BOOL static GlobalDialog.CodingKeys.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void GlobalDialog.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
}

uint64_t GlobalDialog.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E697270 && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6B61657073 && a2 == 0xE500000000000000)
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

uint64_t GlobalDialog.CodingKeys.init(intValue:)()
{
  return 2;
}

Swift::Int GlobalDialog.CodingKeys.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

uint64_t GlobalDialog.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x6B61657073;
  }
  else {
    return 0x746E697270;
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GlobalDialog.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static GlobalDialog.CodingKeys.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GlobalDialog.CodingKeys()
{
  return GlobalDialog.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance GlobalDialog.CodingKeys(uint64_t a1)
{
  GlobalDialog.CodingKeys.hash(into:)(a1, *v1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GlobalDialog.CodingKeys()
{
  return GlobalDialog.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GlobalDialog.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = GlobalDialog.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GlobalDialog.CodingKeys()
{
  return protocol witness for CodingKey.intValue.getter in conformance EntityProperty<A><>.CodingKeys();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GlobalDialog.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = GlobalDialog.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GlobalDialog.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GlobalDialog.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GlobalDialog.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GlobalDialog.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  int64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  v12[1] = *(void *)(v1 + 24);
  void v12[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v14 = 0;
  uint64_t v10 = v12[3];
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v10)
  {
    char v13 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t lazy protocol witness table accessor for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys;
  if (!lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys;
  if (!lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys;
  if (!lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys;
  if (!lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys);
  }
  return result;
}

uint64_t GlobalDialog.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GlobalDialog.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GlobalDialog.CodingKeys and conformance GlobalDialog.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v6 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  uint64_t v15 = v9;
  uint64_t v12 = OUTLINED_FUNCTION_1_0();
  v13(v12);
  *a2 = v6;
  a2[1] = v8;
  a2[2] = v15;
  a2[3] = v11;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GlobalDialog@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return GlobalDialog.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GlobalDialog(void *a1)
{
  return GlobalDialog.encode(to:)(a1);
}

uint64_t GlobalDialog.init(renderedDialog:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = MEMORY[0x25A2C9AF0]();
  uint64_t v6 = v5;
  uint64_t v7 = MEMORY[0x25A2C9B00]();
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_RenderedDialogComponent();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  *a2 = v4;
  a2[1] = v6;
  a2[2] = v7;
  a2[3] = v9;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for GlobalDialog(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for GlobalDialog()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for GlobalDialog(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GlobalDialog(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

void *assignWithTake for GlobalDialog(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GlobalDialog(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for GlobalDialog(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GlobalDialog()
{
  return &type metadata for GlobalDialog;
}

unsigned char *storeEnumTagSinglePayload for GlobalDialog.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2586D6330);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

void *type metadata accessor for GlobalDialog.CodingKeys()
{
  return &unk_2706BAEF8;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

uint64_t Logging.search.unsafeMutableAddressor()
{
  if (one-time initialization token for search != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v0, (uint64_t)static Logging.search);
}

uint64_t one-time initialization function for search()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logging.search);
  __swift_project_value_buffer(v0, (uint64_t)static Logging.search);
  return Logger.init(subsystem:category:)();
}

uint64_t static Logging.search.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for search != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logging.search);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
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

uint64_t static MemoryCreationQUError.== infix(_:_:)()
{
  return 1;
}

void MemoryCreationQUError.hash(into:)()
{
}

Swift::Int MemoryCreationQUError.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance MemoryCreationQUError()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MemoryCreationQUError()
{
  return MemoryCreationQUError.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance MemoryCreationQUError()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MemoryCreationQUError()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance MemoryCreationQUError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance MemoryCreationQUError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance MemoryCreationQUError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance MemoryCreationQUError()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t MemoryCreationQUParse.query.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MemoryCreationQUParse.attributes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MemoryCreationQUParse.isTrip.getter()
{
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t MemoryCreationQUParse.isOpenEndedTimeRange.getter()
{
  return *(unsigned __int8 *)(v0 + 41);
}

void MemoryCreationQUParse.sortOrder.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 42);
}

uint64_t MemoryCreationQUParse.__allocating_init(query:attributes:isTrip:isOpenEndedTimeRange:sortOrder:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char *a6)
{
  OUTLINED_FUNCTION_10();
  uint64_t result = swift_allocObject();
  char v13 = *a6;
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = a3;
  *(unsigned char *)(result + 40) = a4;
  *(unsigned char *)(result + 41) = a5;
  *(unsigned char *)(result + 42) = v13;
  return result;
}

uint64_t MemoryCreationQUParse.init(query:attributes:isTrip:isOpenEndedTimeRange:sortOrder:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char *a6)
{
  char v7 = *a6;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  *(unsigned char *)(v6 + 40) = a4;
  *(unsigned char *)(v6 + 41) = a5;
  *(unsigned char *)(v6 + 42) = v7;
  return v6;
}

uint64_t MemoryCreationQUParse.encode()()
{
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  type metadata accessor for MemoryCreationQUParse();
  lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(&lazy protocol witness table cache variable for type MemoryCreationQUParse and conformance MemoryCreationQUParse, v0, (void (*)(uint64_t))type metadata accessor for MemoryCreationQUParse);
  uint64_t v1 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  swift_release();
  return v1;
}

uint64_t type metadata accessor for MemoryCreationQUParse()
{
  return self;
}

uint64_t static MemoryCreationQUParse.makeFrom(data:)()
{
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  JSONDecoder.init()();
  type metadata accessor for MemoryCreationQUParse();
  lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(&lazy protocol witness table cache variable for type MemoryCreationQUParse and conformance MemoryCreationQUParse, v1, (void (*)(uint64_t))type metadata accessor for MemoryCreationQUParse);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  uint64_t result = swift_release();
  if (!v0) {
    return v3;
  }
  return result;
}

uint64_t MemoryCreationQUParse.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  v3._uint64_t countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._uint64_t countAndFlagsBits = 10;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  if (*(unsigned char *)(v0 + 40)) {
    uint64_t v5 = 1702195828;
  }
  else {
    uint64_t v5 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + 40)) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  unint64_t v7 = v6;
  String.append(_:)(*(Swift::String *)&v5);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(v8, v9, v10, v11, v12, v13, v14, v15, 0x203A706972547369, 0xE800000000000000);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v0 + 41)) {
    uint64_t v16 = 1702195828;
  }
  else {
    uint64_t v16 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + 41)) {
    unint64_t v17 = 0xE400000000000000;
  }
  else {
    unint64_t v17 = 0xE500000000000000;
  }
  unint64_t v18 = v17;
  String.append(_:)(*(Swift::String *)&v16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(v19, v20, v21, v22, v23, v24, v25, v26, 0xD000000000000016, 0x80000002586FA560);
  swift_bridgeObjectRelease();
  unint64_t v27 = 0xE500000000000000;
  uint64_t v28 = 0x7473726966;
  if (*(unsigned char *)(v0 + 42) != 1)
  {
    uint64_t v28 = 1953718636;
    unint64_t v27 = 0xE400000000000000;
  }
  if (*(unsigned char *)(v0 + 42)) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = 1701736302;
  }
  if (*(unsigned char *)(v0 + 42)) {
    unint64_t v30 = v27;
  }
  else {
    unint64_t v30 = 0xE400000000000000;
  }
  unint64_t v31 = v30;
  String.append(_:)(*(Swift::String *)&v29);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(v32, v33, v34, v35, v36, v37, v38, v39, 0x6564724F74726F73, 0xEB00000000203A72);
  swift_bridgeObjectRelease();
  v40._uint64_t countAndFlagsBits = 0x7475626972747441;
  v40._object = (void *)0xEC0000000A3A7365;
  String.append(_:)(v40);
  unint64_t v41 = *(void *)(v0 + 32);
  if (!(v41 >> 62))
  {
    uint64_t v42 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v42) {
      goto LABEL_23;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    return 0x203A7972657551;
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v42 = result;
  if (!result) {
    goto LABEL_29;
  }
LABEL_23:
  if (v42 >= 1)
  {
    uint64_t v44 = 0;
    do
    {
      if ((v41 & 0xC000000000000001) != 0)
      {
        uint64_t v45 = MEMORY[0x25A2CA040](v44, v41);
      }
      else
      {
        uint64_t v45 = *(void *)(v41 + 8 * v44 + 32);
        swift_retain();
      }
      ++v44;
      v47._uint64_t countAndFlagsBits = (*(uint64_t (**)(void))(*(void *)v45 + 144))();
      v47._object = v46;
      OUTLINED_FUNCTION_6_0();
      String.append(_:)(v47);
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v42 != v44);
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t MemoryCreationQUParseSortOrder.rawValue.getter()
{
  uint64_t v1 = 0x7473726966;
  if (*v0 != 1) {
    uint64_t v1 = 1953718636;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701736302;
  }
}

BOOL static MemoryCreationQUParse.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void MemoryCreationQUParse.CodingKeys.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t MemoryCreationQUParse.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7972657571 && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7475626972747461 && a2 == 0xEA00000000007365;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x706972547369 && a2 == 0xE600000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000014 && a2 == 0x80000002586FA650 {
             || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      }
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x6564724F74726F73 && a2 == 0xE900000000000072)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v9) {
          return 4;
        }
        else {
          return 5;
        }
      }
    }
  }
}

uint64_t MemoryCreationQUParse.CodingKeys.init(intValue:)()
{
  return 5;
}

unint64_t MemoryCreationQUParse.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0x7972657571;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7475626972747461;
      break;
    case 2:
      unint64_t result = 0x706972547369;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0x6564724F74726F73;
      break;
    default:
      return result;
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MemoryCreationQUParse.CodingKeys(char *a1, char *a2)
{
  return static MemoryCreationQUParse.CodingKeys.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MemoryCreationQUParse.CodingKeys()
{
  return MemoryCreationQUParse.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance MemoryCreationQUParse.CodingKeys(uint64_t a1)
{
  MemoryCreationQUParse.CodingKeys.hash(into:)(a1, *v1);
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance MemoryCreationQUParse.CodingKeys()
{
  return MemoryCreationQUParse.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance MemoryCreationQUParse.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = MemoryCreationQUParse.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance MemoryCreationQUParse.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = MemoryCreationQUParse.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MemoryCreationQUParse.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance MemoryCreationQUParse.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MemoryCreationQUParse.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MemoryCreationQUParse.__deallocating_deinit()
{
  MemoryCreationQUParse.deinit();
  uint64_t v0 = OUTLINED_FUNCTION_10();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t MemoryCreationQUParse.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<MemoryCreationQUParse.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MemoryCreationQUParseAttributes]);
    lazy protocol witness table accessor for type [MemoryCreationQUParseAttributes] and conformance <A> [A](&lazy protocol witness table cache variable for type [MemoryCreationQUParseAttributes] and conformance <A> [A], &lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes and conformance MemoryCreationQUParseAttributes);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    KeyedEncodingContainer.encode(_:forKey:)();
    KeyedEncodingContainer.encode(_:forKey:)();
    lazy protocol witness table accessor for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  uint64_t v4 = OUTLINED_FUNCTION_4();
  return v5(v4);
}

unint64_t lazy protocol witness table accessor for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for MemoryCreationQUParseAttributes()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder()
{
  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder);
  }
  return result;
}

uint64_t MemoryCreationQUParse.__allocating_init(from:)(void *a1)
{
  OUTLINED_FUNCTION_10();
  uint64_t v2 = swift_allocObject();
  MemoryCreationQUParse.init(from:)(a1);
  return v2;
}

uint64_t MemoryCreationQUParse.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<MemoryCreationQUParse.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    type metadata accessor for MemoryCreationQUParse();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v1 + 16) = KeyedDecodingContainer.decode(_:forKey:)();
    *(void *)(v1 + 24) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MemoryCreationQUParseAttributes]);
    lazy protocol witness table accessor for type [MemoryCreationQUParseAttributes] and conformance <A> [A](&lazy protocol witness table cache variable for type [MemoryCreationQUParseAttributes] and conformance <A> [A], &lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes and conformance MemoryCreationQUParseAttributes);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    *(void *)(v1 + 32) = v9;
    *(unsigned char *)(v1 + 40) = KeyedDecodingContainer.decode(_:forKey:)() & 1;
    *(unsigned char *)(v1 + 41) = KeyedDecodingContainer.decode(_:forKey:)() & 1;
    lazy protocol witness table accessor for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v7 = OUTLINED_FUNCTION_3_0();
    v8(v7);
    *(unsigned char *)(v1 + 42) = v10;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v1;
}

uint64_t lazy protocol witness table accessor for type [MemoryCreationQUParseAttributes] and conformance <A> [A](unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [MemoryCreationQUParseAttributes]);
    lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(a2, v5, (void (*)(uint64_t))type metadata accessor for MemoryCreationQUParseAttributes);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance MemoryCreationQUParse@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 152))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance MemoryCreationQUParse()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144))();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MemoryCreationQUParse()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136))();
}

uint64_t MemoryCreationQUParseAttributes.range.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t MemoryCreationQUParseAttributes.substring.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MemoryCreationQUParseAttributes.expansionStringValues.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MemoryCreationQUParseAttributes.expansionDateValues.getter()
{
  return swift_bridgeObjectRetain();
}

void *MemoryCreationQUParseAttributes.__allocating_init(attributeKey:range:substring:expansionStringValues:expansionDateValues:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  result[7] = a6;
  result[8] = a7;
  result[9] = a8;
  return result;
}

void *MemoryCreationQUParseAttributes.init(attributeKey:range:substring:expansionStringValues:expansionDateValues:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = a6;
  v8[8] = a7;
  v8[9] = a8;
  return v8;
}

uint64_t MemoryCreationQUParseAttributes.__allocating_init(from:)(void *a1)
{
  OUTLINED_FUNCTION_11();
  uint64_t v2 = swift_allocObject();
  MemoryCreationQUParseAttributes.init(from:)(a1);
  return v2;
}

uint64_t MemoryCreationQUParseAttributes.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<MemoryCreationQUParseAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    LOBYTE(v17) = 0;
    *(void *)(v1 + 16) = OUTLINED_FUNCTION_15();
    *(void *)(v1 + 24) = v6;
    type metadata accessor for _NSRange();
    lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(&lazy protocol witness table cache variable for type _NSRange and conformance _NSRange, 255, (void (*)(uint64_t))type metadata accessor for _NSRange);
    OUTLINED_FUNCTION_4_0();
    *(_OWORD *)(v1 + 32) = v17;
    LOBYTE(v17) = 2;
    *(void *)(v1 + 48) = OUTLINED_FUNCTION_15();
    *(void *)(v1 + 56) = v8;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
    OUTLINED_FUNCTION_4_0();
    *(void *)(v1 + 64) = v17;
    LOBYTE(v19) = 4;
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    long long v9 = v17;
    type metadata accessor for NSKeyedUnarchiver(0, &lazy cache variable for type metadata for NSKeyedUnarchiver);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_2586F7840;
    *(void *)(v10 + 32) = type metadata accessor for NSKeyedUnarchiver(0, &lazy cache variable for type metadata for NSArray);
    *(void *)(v10 + 40) = type metadata accessor for NSKeyedUnarchiver(0, &lazy cache variable for type metadata for NSDate);
    static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
    swift_bridgeObjectRelease();
    if (v18)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSDate]);
      int v11 = swift_dynamicCast();
      unint64_t v12 = *((void *)&v9 + 1);
      uint64_t v13 = v9;
      if (v11)
      {
        uint64_t v14 = v19;
        outlined consume of Data._Representation(v9, *((unint64_t *)&v9 + 1));
LABEL_10:
        uint64_t v15 = OUTLINED_FUNCTION_1_1();
        v16(v15);
        *(void *)(v3 + 72) = v14;
        goto LABEL_4;
      }
    }
    else
    {
      outlined destroy of Any?((uint64_t)&v17);
      unint64_t v12 = *((void *)&v9 + 1);
      uint64_t v13 = v9;
    }
    outlined consume of Data._Representation(v13, v12);
    uint64_t v14 = MEMORY[0x263F8EE78];
    goto LABEL_10;
  }
  type metadata accessor for MemoryCreationQUParseAttributes();
  swift_deallocPartialClassInstance();
LABEL_4:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

unint64_t lazy protocol witness table accessor for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys);
  }
  return result;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t MemoryCreationQUParseAttributes.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<MemoryCreationQUParseAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys();
  OUTLINED_FUNCTION_14();
  LOBYTE(v24) = 0;
  OUTLINED_FUNCTION_12();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  }
  long long v24 = *(_OWORD *)(v3 + 32);
  char v23 = 1;
  type metadata accessor for _NSRange();
  lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(&lazy protocol witness table cache variable for type _NSRange and conformance _NSRange, 255, (void (*)(uint64_t))type metadata accessor for _NSRange);
  OUTLINED_FUNCTION_5();
  LOBYTE(v24) = 2;
  OUTLINED_FUNCTION_12();
  *(void *)&long long v24 = *(void *)(v3 + 64);
  char v23 = 3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
  OUTLINED_FUNCTION_5();
  unint64_t v12 = self;
  type metadata accessor for NSKeyedUnarchiver(0, &lazy cache variable for type metadata for NSDate);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  *(void *)&long long v24 = 0;
  id v14 = objc_msgSend(v12, sel_archivedDataWithRootObject_requiringSecureCoding_error_, isa, 1, &v24);

  id v15 = (id)v24;
  if (!v14)
  {
    uint64_t v21 = v15;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  }
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  *(void *)&long long v24 = v16;
  *((void *)&v24 + 1) = v18;
  char v23 = 4;
  lazy protocol witness table accessor for type Data and conformance Data();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  uint64_t v19 = OUTLINED_FUNCTION_4();
  v20(v19);
  return outlined consume of Data._Representation(v16, v18);
}

uint64_t lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t lazy protocol witness table accessor for type [String] and conformance <A> [A](unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL static MemoryCreationQUParseAttributes.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional __swiftcall MemoryCreationQUParseAttributes.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  BOOL v1 = stringValue._countAndFlagsBits == 0x7475626972747461 && stringValue._object == (void *)0xEC00000079654B65;
  if (v1
    || (object = stringValue._object,
        uint64_t countAndFlagsBits = stringValue._countAndFlagsBits,
        (OUTLINED_FUNCTION_2() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = countAndFlagsBits == 0x65676E6172 && object == (void *)0xE500000000000000;
    if (v5 || (OUTLINED_FUNCTION_2() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)1;
    }
    else
    {
      BOOL v6 = countAndFlagsBits == 0x6E69727473627573 && object == (void *)0xE900000000000067;
      if (v6 || (OUTLINED_FUNCTION_2() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)2;
      }
      else if (countAndFlagsBits == 0xD000000000000015 && object == (void *)0x80000002586FA580 {
             || (OUTLINED_FUNCTION_2() & 1) != 0)
      }
      {
        swift_bridgeObjectRelease();
        return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)3;
      }
      else if (countAndFlagsBits == 0xD000000000000013 && object == (void *)0x80000002586FA5A0)
      {
        swift_bridgeObjectRelease();
        return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)4;
      }
      else
      {
        char v7 = OUTLINED_FUNCTION_2();
        swift_bridgeObjectRelease();
        if (v7) {
          return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)4;
        }
        else {
          return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)5;
        }
      }
    }
  }
}

OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional __swiftcall MemoryCreationQUParseAttributes.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)5;
}

Swift::Int MemoryCreationQUParse.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t MemoryCreationQUParseAttributes.CodingKeys.intValue.getter()
{
  return 0;
}

unint64_t MemoryCreationQUParseAttributes.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0x7475626972747461;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x65676E6172;
      break;
    case 2:
      unint64_t result = 0x6E69727473627573;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MemoryCreationQUParseAttributes.CodingKeys(char *a1, char *a2)
{
  return static MemoryCreationQUParseAttributes.CodingKeys.== infix(_:_:)(*a1, *a2);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance MemoryCreationQUParseAttributes.CodingKeys()
{
  return MemoryCreationQUParse.CodingKeys.hashValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance MemoryCreationQUParseAttributes.CodingKeys()
{
  return MemoryCreationQUParseAttributes.CodingKeys.stringValue.getter(*v0);
}

OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional protocol witness for CodingKey.init(stringValue:) in conformance MemoryCreationQUParseAttributes.CodingKeys@<W0>(uint64_t a1@<X0>, OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional *a2@<X8>)
{
  result.value = MemoryCreationQUParseAttributes.CodingKeys.init(stringValue:)(*(Swift::String *)&a1).value;
  a2->value = result.value;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance MemoryCreationQUParseAttributes.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MemoryCreationQUParseAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance MemoryCreationQUParseAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MemoryCreationQUParseAttributes.description.getter()
{
  _StringGuts.grow(_:)(67);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_7_0();
  swift_bridgeObjectRelease();
  v0._uint64_t countAndFlagsBits = 0x6E6172203E2D2D20;
  v0._object = (void *)0xEC000000203A6567;
  String.append(_:)(v0);
  v1._uint64_t countAndFlagsBits = _NSRange.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._uint64_t countAndFlagsBits = 0x203A79656B202CLL;
  v2._object = (void *)0xE700000000000000;
  String.append(_:)(v2);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_7_0();
  swift_bridgeObjectRelease();
  v3._uint64_t countAndFlagsBits = 0xD000000000000014;
  v3._object = (void *)0x80000002586FA5C0;
  String.append(_:)(v3);
  uint64_t v4 = swift_bridgeObjectRetain();
  MEMORY[0x25A2C9F80](v4, MEMORY[0x263F8D310]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_0();
  swift_bridgeObjectRelease();
  v5._object = (void *)0x80000002586FA5E0;
  v5._uint64_t countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v5);
  uint64_t v6 = type metadata accessor for NSKeyedUnarchiver(0, &lazy cache variable for type metadata for NSDate);
  uint64_t v7 = swift_bridgeObjectRetain();
  MEMORY[0x25A2C9F80](v7, v6);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_0();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t MemoryCreationQUParseAttributes.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MemoryCreationQUParseAttributes.__deallocating_deinit()
{
  MemoryCreationQUParseAttributes.deinit();
  uint64_t v0 = OUTLINED_FUNCTION_11();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t protocol witness for Decodable.init(from:) in conformance MemoryCreationQUParseAttributes@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 128))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance MemoryCreationQUParseAttributes()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136))();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MemoryCreationQUParseAttributes()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144))();
}

OmniSearchTypes::MemoryCreationQUParseSortOrder_optional __swiftcall MemoryCreationQUParseSortOrder.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of MemoryCreationQUParseSortOrder.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 3;
  if (v5 < 3) {
    char v7 = v5;
  }
  *uint64_t v4 = v7;
  return result;
}

unint64_t lazy protocol witness table accessor for type MemoryCreationQUError and conformance MemoryCreationQUError()
{
  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUError and conformance MemoryCreationQUError;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUError and conformance MemoryCreationQUError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUError and conformance MemoryCreationQUError);
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance MemoryCreationQUParseSortOrder(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MemoryCreationQUParseSortOrder()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance MemoryCreationQUParseSortOrder(uint64_t a1)
{
  return specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MemoryCreationQUParseSortOrder(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

OmniSearchTypes::MemoryCreationQUParseSortOrder_optional protocol witness for RawRepresentable.init(rawValue:) in conformance MemoryCreationQUParseSortOrder(Swift::String *a1)
{
  return MemoryCreationQUParseSortOrder.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance MemoryCreationQUParseSortOrder@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MemoryCreationQUParseSortOrder.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance MemoryCreationQUParseSortOrder()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance MemoryCreationQUParseSortOrder()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t getEnumTagSinglePayload for MemoryCreationQUError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MemoryCreationQUError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2586D8D34);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for MemoryCreationQUError()
{
  return 0;
}

void type metadata accessor for MemoryCreationQUError()
{
}

uint64_t method lookup function for MemoryCreationQUParse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MemoryCreationQUParse);
}

uint64_t dispatch thunk of MemoryCreationQUParse.__allocating_init(query:attributes:isTrip:isOpenEndedTimeRange:sortOrder:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of MemoryCreationQUParse.encode()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MemoryCreationQUParse.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MemoryCreationQUParse.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of MemoryCreationQUParse.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t method lookup function for MemoryCreationQUParseAttributes(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MemoryCreationQUParseAttributes);
}

uint64_t dispatch thunk of MemoryCreationQUParseAttributes.__allocating_init(attributeKey:range:substring:expansionStringValues:expansionDateValues:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of MemoryCreationQUParseAttributes.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of MemoryCreationQUParseAttributes.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MemoryCreationQUParseAttributes.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

void type metadata accessor for MemoryCreationQUParseAttributes.CodingKeys()
{
}

uint64_t getEnumTagSinglePayload for MemoryCreationQUParseSortOrder(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MemoryCreationQUParseSortOrder(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2586D9070);
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

void type metadata accessor for MemoryCreationQUParseSortOrder()
{
}

uint64_t getEnumTagSinglePayload for MemoryCreationQUParseAttributes.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MemoryCreationQUParseAttributes.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x2586D91F8);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for MemoryCreationQUParse.CodingKeys(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void *type metadata accessor for MemoryCreationQUParse.CodingKeys()
{
  return &unk_2706BB158;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

void OUTLINED_FUNCTION_6_0()
{
  uint64_t v1 = 10;
  unint64_t v2 = 0xE100000000000000;
  String.append(_:)(*(Swift::String *)&v1);
}

void OUTLINED_FUNCTION_7_0()
{
  uint64_t v3 = v0;
  uint64_t v4 = v1;
  String.append(_:)(*(Swift::String *)&v3);
}

void OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  String.append(_:)(*(Swift::String *)&a9);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t key path getter for MemoryCreationQUPerformanceMetrics.llmQUModelLatency : MemoryCreationQUPerformanceMetrics@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 88))();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t key path setter for MemoryCreationQUPerformanceMetrics.llmQUModelLatency : MemoryCreationQUPerformanceMetrics(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void))(**(void **)a2 + 96))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t MemoryCreationQUPerformanceMetrics.llmQUModelLatency.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t MemoryCreationQUPerformanceMetrics.llmQUModelLatency.setter(uint64_t a1, char a2)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*MemoryCreationQUPerformanceMetrics.llmQUModelLatency.modify())()
{
  return MemoryCreationQUPerformanceMetrics.llmQUModelLatency.modify;
}

uint64_t MemoryCreationQUPerformanceMetrics.encode()()
{
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  type metadata accessor for MemoryCreationQUPerformanceMetrics();
  lazy protocol witness table accessor for type MemoryCreationQUPerformanceMetrics and conformance MemoryCreationQUPerformanceMetrics(&lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics and conformance MemoryCreationQUPerformanceMetrics);
  uint64_t v0 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  swift_release();
  return v0;
}

uint64_t type metadata accessor for MemoryCreationQUPerformanceMetrics()
{
  return self;
}

uint64_t MemoryCreationQUPerformanceMetrics.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(unsigned char *)(result + 24) = 1;
  return result;
}

uint64_t MemoryCreationQUPerformanceMetrics.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 1;
  return result;
}

uint64_t static MemoryCreationQUPerformanceMetrics.makeFrom(data:)()
{
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  JSONDecoder.init()();
  type metadata accessor for MemoryCreationQUPerformanceMetrics();
  lazy protocol witness table accessor for type MemoryCreationQUPerformanceMetrics and conformance MemoryCreationQUPerformanceMetrics(&lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics and conformance MemoryCreationQUPerformanceMetrics);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  uint64_t result = swift_release();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type MemoryCreationQUPerformanceMetrics and conformance MemoryCreationQUPerformanceMetrics(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MemoryCreationQUPerformanceMetrics();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t MemoryCreationQUPerformanceMetrics.description.getter()
{
  _StringGuts.grow(_:)(21);
  v1._object = (void *)0x80000002586FA6D0;
  v1._uint64_t countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v1);
  (*(void (**)(void))(*(void *)v0 + 88))();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Double?);
  _print_unlocked<A, B>(_:_:)();
  return 0;
}

void MemoryCreationQUPerformanceMetrics.CodingKeys.hash(into:)()
{
}

uint64_t MemoryCreationQUPerformanceMetrics.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x80000002586FA730)
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

Swift::Int MemoryCreationQUPerformanceMetrics.CodingKeys.hashValue.getter()
{
  return Hasher._finalize()();
}

unint64_t MemoryCreationQUPerformanceMetrics.CodingKeys.stringValue.getter()
{
  return 0xD000000000000011;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance MemoryCreationQUPerformanceMetrics.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = MemoryCreationQUPerformanceMetrics.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance MemoryCreationQUPerformanceMetrics.CodingKeys()
{
  return protocol witness for CodingKey.intValue.getter in conformance EntityProperty<A><>.CodingKeys();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance MemoryCreationQUPerformanceMetrics.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = protocol witness for static Equatable.== infix(_:_:) in conformance MemoryCreationQUError();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MemoryCreationQUPerformanceMetrics.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance MemoryCreationQUPerformanceMetrics.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MemoryCreationQUPerformanceMetrics.deinit()
{
  return v0;
}

uint64_t MemoryCreationQUPerformanceMetrics.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 25, 7);
}

uint64_t MemoryCreationQUPerformanceMetrics.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<MemoryCreationQUPerformanceMetrics.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys();
  uint64_t v10 = dispatch thunk of Encoder.container<A>(keyedBy:)();
  (*(void (**)(uint64_t))(*(void *)v2 + 88))(v10);
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t lazy protocol witness table accessor for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys);
  }
  return result;
}

uint64_t MemoryCreationQUPerformanceMetrics.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  MemoryCreationQUPerformanceMetrics.init(from:)(a1);
  return v2;
}

uint64_t MemoryCreationQUPerformanceMetrics.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<MemoryCreationQUPerformanceMetrics.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 24) = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type MemoryCreationQUPerformanceMetrics.CodingKeys and conformance MemoryCreationQUPerformanceMetrics.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    swift_release();
  }
  else
  {
    uint64_t v6 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    char v8 = v7;
    uint64_t v9 = OUTLINED_FUNCTION_3_0();
    v10(v9);
    swift_beginAccess();
    *(void *)(v3 + 16) = v6;
    *(unsigned char *)(v3 + 24) = v8 & 1;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t protocol witness for Decodable.init(from:) in conformance MemoryCreationQUPerformanceMetrics@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 144))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance MemoryCreationQUPerformanceMetrics()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136))();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MemoryCreationQUPerformanceMetrics()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

uint64_t method lookup function for MemoryCreationQUPerformanceMetrics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MemoryCreationQUPerformanceMetrics);
}

uint64_t dispatch thunk of MemoryCreationQUPerformanceMetrics.llmQUModelLatency.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of MemoryCreationQUPerformanceMetrics.llmQUModelLatency.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 96))(a1, a2 & 1);
}

uint64_t dispatch thunk of MemoryCreationQUPerformanceMetrics.llmQUModelLatency.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of MemoryCreationQUPerformanceMetrics.encode()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of MemoryCreationQUPerformanceMetrics.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of MemoryCreationQUPerformanceMetrics.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MemoryCreationQUPerformanceMetrics.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MemoryCreationQUPerformanceMetrics.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

unsigned char *storeEnumTagSinglePayload for MemoryCreationQUPerformanceMetrics.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2586DA194);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for MemoryCreationQUPerformanceMetrics.CodingKeys()
{
  return &unk_2706BB1E8;
}

double OmniSearchTypesInfo.versionNumber.getter()
{
  return *(double *)v0;
}

OmniSearchTypes::OmniSearchTypesInfo __swiftcall OmniSearchTypesInfo.init()()
{
  *(OmniSearchTypes::OmniSearchTypesInfo *)&result.versionNumber = (OmniSearchTypes::OmniSearchTypesInfo)0x3FF0000000000000;
  void *v0 = 0x3FF0000000000000;
  return result;
}

ValueMetadata *type metadata accessor for OmniSearchTypesInfo()
{
  return &type metadata for OmniSearchTypesInfo;
}

uint64_t specialized static EntityProperty<>.== infix(_:_:)()
{
  EntityProperty.wrappedValue.getter();
  EntityProperty.wrappedValue.getter();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

{
  char v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  EntityProperty.wrappedValue.getter();
  EntityProperty.wrappedValue.getter();
  if (v6)
  {
    if (v4)
    {
      if (v5 == v3 && v6 == v4)
      {
        swift_bridgeObjectRelease();
        char v1 = 1;
      }
      else
      {
        char v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      char v1 = 0;
    }
  }
  else
  {
    if (!v4)
    {
      char v1 = 1;
      return v1 & 1;
    }
    char v1 = 0;
  }
  swift_bridgeObjectRelease();
  return v1 & 1;
}

{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int EnumTagSinglePayload;
  uint64_t *v18;
  char v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;

  uint64_t v0 = type metadata accessor for IntentFile();
  long long v24 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (IntentFile?, IntentFile?));
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  char v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v23 - v12;
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v23 - v14;
  EntityProperty.wrappedValue.getter();
  EntityProperty.wrappedValue.getter();
  uint64_t v16 = (uint64_t)&v6[*(int *)(v4 + 56)];
  outlined init with copy of IntentFile?((uint64_t)v15, (uint64_t)v6, &demangling cache variable for type metadata for IntentFile?);
  outlined init with copy of IntentFile?((uint64_t)v13, v16, &demangling cache variable for type metadata for IntentFile?);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v0) == 1)
  {
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v16, 1, v0);
    if (EnumTagSinglePayload == 1) {
      unint64_t v18 = &demangling cache variable for type metadata for IntentFile?;
    }
    else {
      unint64_t v18 = &demangling cache variable for type metadata for (IntentFile?, IntentFile?);
    }
    if (EnumTagSinglePayload == 1) {
      uint64_t v19 = -1;
    }
    else {
      uint64_t v19 = 0;
    }
  }
  else
  {
    outlined init with copy of IntentFile?((uint64_t)v6, (uint64_t)v10, &demangling cache variable for type metadata for IntentFile?);
    if (__swift_getEnumTagSinglePayload(v16, 1, v0) == 1)
    {
      (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v0);
      uint64_t v19 = 0;
      unint64_t v18 = &demangling cache variable for type metadata for (IntentFile?, IntentFile?);
    }
    else
    {
      uint64_t v20 = v24;
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))(v2, v16, v0);
      lazy protocol witness table accessor for type IntentFile and conformance IntentFile((uint64_t)&lazy protocol witness table cache variable for type IntentFile and conformance IntentFile);
      uint64_t v19 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v20 + 8);
      v21(v2, v0);
      v21(v10, v0);
      unint64_t v18 = &demangling cache variable for type metadata for IntentFile?;
    }
  }
  _s10AppIntents10IntentFileVSgWOhTm_0((uint64_t)v6, v18);
  _s10AppIntents10IntentFileVSgWOhTm_0((uint64_t)v13, &demangling cache variable for type metadata for IntentFile?);
  _s10AppIntents10IntentFileVSgWOhTm_0((uint64_t)v15, &demangling cache variable for type metadata for IntentFile?);
  return v19 & 1;
}

{
  char v0;
  void *v2;
  void *v3;

  EntityProperty.wrappedValue.getter();
  EntityProperty.wrappedValue.getter();
  uint64_t v0 = specialized static Array<A>.== infix(_:_:)(v3, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t specialized Encodable.jsonPrettyPrinted()()
{
  uint64_t v1 = type metadata accessor for String.Encoding();
  MEMORY[0x270FA5388](v1 - 8);
  memcpy(v9, v0, sizeof(v9));
  if (one-time initialization token for iso8601PrettyPrinted != -1) {
    swift_once();
  }
  lazy protocol witness table accessor for type SearchGlobalEntity and conformance SearchGlobalEntity();
  uint64_t v2 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v4 = v3;
  static String.Encoding.utf8.getter();
  uint64_t v5 = String.init(data:encoding:)();
  if (v6)
  {
    uint64_t v7 = v5;
    outlined consume of Data._Representation(v2, v4);
  }
  else
  {
    outlined consume of Data._Representation(v2, v4);
    return 0;
  }
  return v7;
}

uint64_t SearchGlobalEntity.Timestamp.seconds.getter()
{
  return *(void *)v0;
}

uint64_t SearchGlobalEntity.Timestamp.timezone.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

BOOL static SearchGlobalEntity.Timestamp.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  char v6 = *(unsigned char *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a2 + 40);
  if (v4)
  {
    if (!*(unsigned char *)(a2 + 8)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)a1 == *(void *)a2) {
      char v10 = *(unsigned char *)(a2 + 8);
    }
    else {
      char v10 = 1;
    }
    if (v10) {
      return 0;
    }
  }
  if (v6)
  {
    if (!*(unsigned char *)(a2 + 24)) {
      return 0;
    }
  }
  else
  {
    if (v5 == *(void *)(a2 + 16)) {
      char v11 = *(unsigned char *)(a2 + 24);
    }
    else {
      char v11 = 1;
    }
    if (v11) {
      return 0;
    }
  }
  if (v8)
  {
    if (!v9) {
      return 0;
    }
    BOOL v12 = v7 == *(void *)(a2 + 32) && v8 == v9;
    return v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0;
  }
  return !v9;
}

uint64_t SearchGlobalEntity.Timestamp.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73646E6F636573 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x657366664F637475 && a2 == 0xE900000000000074;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x656E6F7A656D6974 && a2 == 0xE800000000000000)
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

uint64_t SearchGlobalEntity.Timestamp.CodingKeys.stringValue.getter(char a1)
{
  if (!a1) {
    return 0x73646E6F636573;
  }
  if (a1 == 1) {
    return 0x657366664F637475;
  }
  return 0x656E6F7A656D6974;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.Timestamp.CodingKeys()
{
  return SearchGlobalEntity.Timestamp.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.Timestamp.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.Timestamp.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.Timestamp.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.Timestamp.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.Timestamp.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.Timestamp.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys();
  OUTLINED_FUNCTION_122();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v0)
  {
    OUTLINED_FUNCTION_90();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_64();
  }
  OUTLINED_FUNCTION_40();
  v4();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_2_0();
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys);
  }
  return result;
}

void SearchGlobalEntity.Timestamp.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, __int16 a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_3_1();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_114();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.Timestamp.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_32();
  lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys();
  OUTLINED_FUNCTION_85();
  if (!v25)
  {
    a14 = 0;
    uint64_t v30 = OUTLINED_FUNCTION_61((uint64_t)&a14);
    char v32 = v31;
    a13 = 1;
    uint64_t v33 = OUTLINED_FUNCTION_61((uint64_t)&a13);
    a10 = v34;
    uint64_t v39 = v33;
    uint64_t v35 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v37 = v36;
    OUTLINED_FUNCTION_29();
    v38();
    *(void *)uint64_t v26 = v30;
    *(unsigned char *)(v26 + 8) = v32 & 1;
    *(void *)(v26 + 16) = v39;
    *(unsigned char *)(v26 + 24) = a10 & 1;
    *(void *)(v26 + 32) = v35;
    *(void *)(v26 + 40) = v37;
  }
  __swift_destroy_boxed_opaque_existential_0(v24);
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_2_0();
}

uint64_t SearchGlobalEntity.Timestamp.init(seconds:utcOffset:timezone:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(unsigned char *)(a7 + 8) = a2 & 1;
  *(void *)(a7 + 16) = a3;
  *(unsigned char *)(a7 + 24) = a4 & 1;
  *(void *)(a7 + 32) = a5;
  *(void *)(a7 + 40) = a6;
  return result;
}

#error "2586DB114: call analysis failed (funcsize=6)"

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.Timestamp()
{
}

uint64_t SearchGlobalEntity.Temperature.units.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t static SearchGlobalEntity.Temperature.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 16);
  char v3 = *(unsigned char *)(a1 + 24);
  uint64_t v4 = *(void *)(a2 + 8);
  double v5 = *(double *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  if (!*(void *)(a1 + 8))
  {
    if (!v4) {
      goto LABEL_10;
    }
    return 0;
  }
  if (!v4) {
    return 0;
  }
  OUTLINED_FUNCTION_56(a1);
  BOOL v9 = v9 && v7 == v8;
  if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = OUTLINED_FUNCTION_28(), (v11 & 1) != 0))
  {
LABEL_10:
    if (v3)
    {
      if ((v6 & 1) == 0) {
        return 0;
      }
    }
    else
    {
      if (v2 == v5) {
        char v12 = v6;
      }
      else {
        char v12 = 1;
      }
      if (v12) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

uint64_t SearchGlobalEntity.Temperature.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7374696E75 && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
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

uint64_t SearchGlobalEntity.Temperature.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x65756C6176;
  }
  else {
    return 0x7374696E75;
  }
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SearchGlobalEntity.Temperature.CodingKeys()
{
  return SearchGlobalEntity.Temperature.CodingKeys.hashValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.Temperature.CodingKeys()
{
  return SearchGlobalEntity.Temperature.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.Temperature.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.Temperature.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.Temperature.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.Temperature.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.Temperature.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.Temperature.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_77(v2);
  lazy protocol witness table accessor for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_65();
  if (!v0)
  {
    OUTLINED_FUNCTION_90();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  uint64_t v4 = OUTLINED_FUNCTION_4();
  v5(v4);
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_2_0();
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys);
  }
  return result;
}

void SearchGlobalEntity.Temperature.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  OUTLINED_FUNCTION_3_1();
  a22 = v26;
  a23 = v27;
  OUTLINED_FUNCTION_114();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.Temperature.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&a9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_32();
  lazy protocol witness table accessor for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v24)
  {
    __swift_destroy_boxed_opaque_existential_0(v23);
  }
  else
  {
    a13 = 0;
    uint64_t v31 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v33 = v32;
    OUTLINED_FUNCTION_91();
    KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_29();
    v34();
    *(void *)uint64_t v25 = v31;
    *(void *)(v25 + 8) = v33;
    *(void *)(v25 + 16) = v30;
    *(unsigned char *)(v25 + 24) = v30 & 1;
    __swift_destroy_boxed_opaque_existential_0(v23);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_2_0();
}

OmniSearchTypes::SearchGlobalEntity::Temperature __swiftcall SearchGlobalEntity.Temperature.init(units:value:)(Swift::String_optional units, Swift::Double_optional value)
{
  *(Swift::String_optional *)uint64_t v3 = units;
  *(void *)(v3 + 16) = *(void *)&value.is_nil;
  *(unsigned char *)(v3 + 24) = v2 & 1;
  result.units = units;
  result.value.value = value.value;
  result.value.is_nil = value.is_nil;
  return result;
}

#error "2586DB688: call analysis failed (funcsize=6)"

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.Temperature()
{
}

uint64_t SearchGlobalEntity.GeneralAttributes.alternateNames.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SearchGlobalEntity.GeneralAttributes.alternateNames.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*SearchGlobalEntity.GeneralAttributes.alternateNames.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.GeneralAttributes.contentURL.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.GeneralAttributes.contentURL.setter()
{
  OUTLINED_FUNCTION_27();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.GeneralAttributes.contentURL.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.GeneralAttributes.displayName.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.GeneralAttributes.displayName.setter()
{
  OUTLINED_FUNCTION_27();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.GeneralAttributes.displayName.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.GeneralAttributes.thumbnailData.getter()
{
  outlined copy of Data?(*(void *)(v0 + 40), *(void *)(v0 + 48));
  return OUTLINED_FUNCTION_4_1();
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

uint64_t SearchGlobalEntity.GeneralAttributes.thumbnailData.setter()
{
  OUTLINED_FUNCTION_27();
  uint64_t result = outlined consume of Data?(*(void *)(v1 + 40), *(void *)(v1 + 48));
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = v0;
  return result;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t (*SearchGlobalEntity.GeneralAttributes.thumbnailData.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.GeneralAttributes.title.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.GeneralAttributes.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return result;
}

uint64_t (*SearchGlobalEntity.GeneralAttributes.title.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t static SearchGlobalEntity.GeneralAttributes.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = *(void *)(a1 + 8);
  uint64_t v30 = *(void *)(a1 + 16);
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void *)(a1 + 24);
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v25 = *(void *)(a1 + 40);
  unint64_t v26 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  unint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  if ((specialized static Array<A>.== infix(_:_:)(*(void **)a1, *(void **)a2) & 1) == 0) {
    return 0;
  }
  uint64_t v24 = v2;
  if (!v30)
  {
    if (v5) {
      return 0;
    }
    goto LABEL_11;
  }
  if (!v5) {
    return 0;
  }
  BOOL v12 = v29 == v4 && v30 == v5;
  if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = OUTLINED_FUNCTION_28(), (v14 & 1) != 0))
  {
LABEL_11:
    if (v27)
    {
      if (!v7) {
        return 0;
      }
      if (v28 != v6 || v27 != v7)
      {
        _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = OUTLINED_FUNCTION_28();
        if ((v16 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v7)
    {
      return 0;
    }
    if (v26 >> 60 == 15)
    {
      uint64_t v18 = v8;
      unint64_t v17 = v9;
      if (v9 >> 60 == 15)
      {
LABEL_26:
        if (v3)
        {
          if (v11)
          {
            BOOL v23 = v24 == v10 && v3 == v11;
            if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              return 1;
            }
          }
        }
        else if (!v11)
        {
          return 1;
        }
        return 0;
      }
    }
    else
    {
      uint64_t v18 = v8;
      unint64_t v17 = v9;
      if (v9 >> 60 != 15)
      {
        uint64_t v21 = OUTLINED_FUNCTION_99();
        char v22 = MEMORY[0x25A2C98B0](v21);
        outlined consume of Data?(v8, v9);
        outlined consume of Data?(v25, v26);
        if ((v22 & 1) == 0) {
          return 0;
        }
        goto LABEL_26;
      }
    }
    uint64_t v19 = OUTLINED_FUNCTION_99();
    outlined consume of Data?(v19, v20);
    outlined consume of Data?(v18, v17);
    return 0;
  }
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t v3 = (double *)(a2 + 72);
  for (i = (uint64_t *)(a1 + 40); ; i += 6)
  {
    uint64_t v6 = *(i - 1);
    uint64_t v5 = *i;
    unint64_t v7 = i[2];
    uint64_t v8 = i[4];
    uint64_t v10 = *((void *)v3 - 5);
    uint64_t v9 = *((void *)v3 - 4);
    uint64_t v11 = *((uint64_t *)v3 - 3);
    uint64_t v54 = i[1];
    unint64_t v55 = *((void *)v3 - 2);
    unint64_t v12 = v55 >> 62;
    double v56 = *v3;
    if (!(v7 >> 62))
    {
      if (v12) {
        goto LABEL_56;
      }
      if (v6 != v10 || v5 != v9)
      {
        uint64_t v14 = *((void *)v3 - 4);
        char v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
        outlined copy of SearchGlobalEntity.CustomAttribute(v10, v14, v11, v55);
        outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        outlined consume of SearchGlobalEntity.CustomAttribute(v10, v14, v11, v55);
        if ((v46 & 1) == 0) {
          return 0;
        }
        goto LABEL_54;
      }
      outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v11, v55);
      outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
      outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
      uint64_t v19 = v6;
      uint64_t v20 = v5;
      uint64_t v21 = v11;
      unint64_t v22 = v55;
      goto LABEL_50;
    }
    if (v7 >> 62 == 1) {
      break;
    }
    if (v12 != 2)
    {
LABEL_56:
      uint64_t v34 = *((void *)v3 - 3);
      unint64_t v35 = v55;
      uint64_t v49 = v10;
      uint64_t v51 = v9;
      outlined copy of SearchGlobalEntity.CustomAttribute(v10, v9, v11, v55);
      uint64_t v36 = v6;
      uint64_t v37 = v5;
      uint64_t v38 = v54;
      uint64_t v39 = v54;
      unint64_t v40 = v7;
      goto LABEL_64;
    }
    if (v5)
    {
      if (!v9)
      {
        outlined copy of SearchGlobalEntity.CustomAttribute(v10, 0, v11, v55);
        outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        uint64_t v41 = v10;
        uint64_t v42 = 0;
        uint64_t v43 = v11;
        unint64_t v44 = v55;
        goto LABEL_65;
      }
      if (v6 != v10 || v5 != v9)
      {
        uint64_t v16 = *((void *)v3 - 5);
        uint64_t v48 = v16;
        uint64_t v17 = *((void *)v3 - 4);
        char v47 = _stringCompareWithSmolCheck(_:_:expecting:)();
        outlined copy of SearchGlobalEntity.CustomAttribute(v16, v17, v11, v55);
        outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        double v18 = *(double *)&v11;
        outlined consume of SearchGlobalEntity.CustomAttribute(v48, v17, v11, v55);
        if ((v47 & 1) == 0) {
          return 0;
        }
        if (v7)
        {
LABEL_53:
          if ((v55 & 1) == 0) {
            return 0;
          }
          goto LABEL_54;
        }
        goto LABEL_28;
      }
      outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v11, v55);
      outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
      outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
      uint64_t v29 = v6;
      uint64_t v30 = v5;
      double v18 = *(double *)&v11;
      uint64_t v31 = v11;
      unint64_t v32 = v55;
    }
    else
    {
      if (v9)
      {
        uint64_t v45 = *((void *)v3 - 4);
        swift_bridgeObjectRetain();
        outlined consume of SearchGlobalEntity.CustomAttribute(v6, 0, v54, v7);
        uint64_t v41 = v10;
        uint64_t v42 = v45;
        uint64_t v43 = v11;
        unint64_t v44 = v55;
        goto LABEL_65;
      }
      double v28 = *(v3 - 3);
      outlined consume of SearchGlobalEntity.CustomAttribute(v6, 0, v54, v7);
      uint64_t v29 = v10;
      uint64_t v30 = 0;
      double v18 = v28;
      uint64_t v31 = *(void *)&v28;
      unint64_t v32 = v55;
    }
    outlined consume of SearchGlobalEntity.CustomAttribute(v29, v30, v31, v32);
    if (v7) {
      goto LABEL_53;
    }
LABEL_28:
    if ((v55 & 1) != 0 || *(double *)&v54 != v18) {
      return 0;
    }
LABEL_54:
    v3 += 6;
    if (!--v2) {
      return 1;
    }
  }
  if (v12 != 1) {
    goto LABEL_56;
  }
  uint64_t v50 = *i;
  uint64_t v51 = *((void *)v3 - 4);
  if (v5)
  {
    if ((v9 & 1) == 0) {
      goto LABEL_63;
    }
  }
  else if ((v9 & 1) != 0 || v6 != v10)
  {
    goto LABEL_63;
  }
  if (v7)
  {
    if ((v55 & 1) == 0) {
      goto LABEL_63;
    }
  }
  else if ((v55 & 1) != 0 || v54 != v11)
  {
    goto LABEL_63;
  }
  unint64_t v52 = i[2];
  uint64_t v53 = *((uint64_t *)v3 - 3);
  if (v8)
  {
    if (v56 == 0.0) {
      goto LABEL_63;
    }
    uint64_t v23 = *(i - 1);
    uint64_t v24 = i[1];
    if (i[3] != *((void *)v3 - 1) || v8 != *(void *)&v56)
    {
      uint64_t v26 = *((void *)v3 - 4);
      char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
      uint64_t v9 = v26;
      uint64_t v11 = v53;
      if ((v27 & 1) == 0)
      {
        unint64_t v7 = v52;
        goto LABEL_62;
      }
    }
LABEL_49:
    outlined copy of SearchGlobalEntity.CustomAttribute(v10, v9, v11, v55);
    outlined copy of SearchGlobalEntity.CustomAttribute(v23, v50, v24, v52);
    outlined consume of SearchGlobalEntity.CustomAttribute(v23, v50, v24, v52);
    uint64_t v19 = v10;
    uint64_t v20 = v51;
    uint64_t v21 = v53;
    unint64_t v22 = v55;
LABEL_50:
    outlined consume of SearchGlobalEntity.CustomAttribute(v19, v20, v21, v22);
    goto LABEL_54;
  }
  uint64_t v23 = *(i - 1);
  uint64_t v24 = i[1];
  if (v56 == 0.0) {
    goto LABEL_49;
  }
  unint64_t v7 = i[2];
LABEL_62:
  uint64_t v6 = v23;
LABEL_63:
  uint64_t v49 = v10;
  uint64_t v34 = v11;
  unint64_t v35 = v55;
  outlined copy of SearchGlobalEntity.CustomAttribute(v10, v9, v11, v55);
  uint64_t v36 = v6;
  uint64_t v5 = v50;
  uint64_t v37 = v50;
  uint64_t v38 = v54;
  uint64_t v39 = v54;
  unint64_t v40 = v7;
LABEL_64:
  outlined copy of SearchGlobalEntity.CustomAttribute(v36, v37, v39, v40);
  outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v38, v7);
  uint64_t v41 = v49;
  uint64_t v42 = v51;
  uint64_t v43 = v34;
  unint64_t v44 = v35;
LABEL_65:
  outlined consume of SearchGlobalEntity.CustomAttribute(v41, v42, v43, v44);
  return 0;
}

uint64_t specialized static Array<A>.== infix(_:_:)(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = 0;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v8 = a2 + 7;
  uint64_t v9 = a1 + 7;
  unint64_t v10 = 1;
  while (v10 < v2)
  {
    uint64_t result = *(v9 - 1);
    if (result != *(v8 - 1) || *v9 != *v8)
    {
      uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((result & 1) == 0) {
        return 0;
      }
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t SearchGlobalEntity.GeneralAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74616E7265746C61 && a2 == 0xEE0073656D614E65;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x55746E65746E6F63 && a2 == 0xEA00000000004C52;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x69616E626D756874 && a2 == 0xED0000617461446CLL;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v10) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

uint64_t SearchGlobalEntity.GeneralAttributes.CodingKeys.stringValue.getter(char a1)
{
  uint64_t result = 0x74616E7265746C61;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x55746E65746E6F63;
      break;
    case 2:
      uint64_t result = 0x4E79616C70736964;
      break;
    case 3:
      uint64_t result = 0x69616E626D756874;
      break;
    case 4:
      uint64_t result = 0x656C746974;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.GeneralAttributes.CodingKeys()
{
  return SearchGlobalEntity.GeneralAttributes.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.GeneralAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.GeneralAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.GeneralAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.GeneralAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.GeneralAttributes.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.GeneralAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys();
  OUTLINED_FUNCTION_122();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v0)
  {
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_82();
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    OUTLINED_FUNCTION_82();
  }
  OUTLINED_FUNCTION_29();
  v4();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_2_0();
}

uint64_t SearchGlobalEntity.GeneralAttributes.init(alternateNames:contentURL:displayName:thumbnailData:title:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  return result;
}

void SearchGlobalEntity.GeneralAttributes.init(from:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.GeneralAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_98();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    swift_bridgeObjectRetain();
    uint64_t v17 = OUTLINED_FUNCTION_66();
    uint64_t v18 = v19;
    LOBYTE(v19) = 2;
    uint64_t v7 = v6;
    swift_bridgeObjectRetain();
    uint64_t v8 = OUTLINED_FUNCTION_66();
    uint64_t v10 = v9;
    uint64_t v16 = v8;
    lazy protocol witness table accessor for type Data and conformance Data();
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    outlined copy of Data?(v19, v20);
    uint64_t v11 = OUTLINED_FUNCTION_66();
    uint64_t v13 = v12;
    uint64_t v15 = v11;
    OUTLINED_FUNCTION_30();
    v14();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of Data?(v19, v20);
    OUTLINED_FUNCTION_121();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v4 = v18;
    v4[1] = v17;
    v4[2] = v7;
    v4[3] = v16;
    v4[4] = v10;
    v4[5] = v19;
    v4[6] = v20;
    v4[7] = v15;
    v4[8] = v13;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_121();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.GeneralAttributes()
{
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.GeneralAttributes()
{
}

BOOL static SearchGlobalEntity.CustomAttribute.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  unint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v10 = a2[2];
  unint64_t v11 = a2[3];
  uint64_t v12 = a2[4];
  if (!(v5 >> 62))
  {
    if (!(v11 >> 62))
    {
      uint64_t v26 = a1[2];
      uint64_t v27 = a2[2];
      if (v3 == v8 && v2 == v9)
      {
        BOOL v14 = 1;
      }
      else
      {
        OUTLINED_FUNCTION_93();
        unint64_t v29 = v11;
        uint64_t v31 = v30;
        char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v8 = v31;
        unint64_t v11 = v29;
        BOOL v14 = v32;
      }
      uint64_t v86 = v8;
      outlined copy of SearchGlobalEntity.CustomAttribute(v8, v9, v27, v11);
      uint64_t v59 = OUTLINED_FUNCTION_93();
      outlined copy of SearchGlobalEntity.CustomAttribute(v59, v60, v26, v5);
      uint64_t v61 = OUTLINED_FUNCTION_94();
      outlined consume of SearchGlobalEntity.CustomAttribute(v61, v62, v63, v64);
      uint64_t v23 = v86;
      uint64_t v24 = v9;
      uint64_t v25 = v27;
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  if (v5 >> 62 == 1)
  {
    if (v11 >> 62 == 1)
    {
      uint64_t v95 = a2[5];
      uint64_t v96 = v3;
      char v97 = v2 & 1;
      uint64_t v98 = v4;
      char v99 = v5 & 1;
      uint64_t v100 = v6;
      uint64_t v101 = v7;
      uint64_t v90 = v8;
      char v91 = v9 & 1;
      uint64_t v92 = v10;
      char v93 = v11 & 1;
      uint64_t v94 = v12;
      uint64_t v13 = v8;
      uint64_t v87 = v10;
      BOOL v14 = static SearchGlobalEntity.Timestamp.== infix(_:_:)((uint64_t)&v96, (uint64_t)&v90);
      OUTLINED_FUNCTION_104(v13);
      OUTLINED_FUNCTION_103();
      outlined copy of SearchGlobalEntity.CustomAttribute(v15, v16, v17, v18);
      OUTLINED_FUNCTION_103();
      outlined consume of SearchGlobalEntity.CustomAttribute(v19, v20, v21, v22);
      uint64_t v23 = v13;
      uint64_t v24 = v9;
      uint64_t v25 = v87;
LABEL_25:
      outlined consume of SearchGlobalEntity.CustomAttribute(v23, v24, v25, v11);
      return v14;
    }
    goto LABEL_20;
  }
  if (v11 >> 62 != 2)
  {
LABEL_20:
    unint64_t v89 = a2[3];
    uint64_t v45 = *a2;
    uint64_t v46 = a2[2];
    outlined copy of SearchGlobalEntity.CustomAttribute(*a2, a2[1], v10, v89);
    uint64_t v47 = OUTLINED_FUNCTION_79();
    outlined copy of SearchGlobalEntity.CustomAttribute(v47, v48, v49, v50);
    uint64_t v51 = OUTLINED_FUNCTION_79();
    outlined consume of SearchGlobalEntity.CustomAttribute(v51, v52, v53, v54);
    uint64_t v55 = v45;
    uint64_t v56 = v9;
    uint64_t v57 = v46;
    unint64_t v58 = v89;
LABEL_21:
    outlined consume of SearchGlobalEntity.CustomAttribute(v55, v56, v57, v58);
    return 0;
  }
  if (!v2)
  {
    if (!v9)
    {
      double v88 = *((double *)a1 + 2);
      uint64_t v83 = *a2;
      double v84 = *((double *)a2 + 2);
      outlined consume of SearchGlobalEntity.CustomAttribute(*a1, 0, v4, v5);
      uint64_t v79 = v83;
      uint64_t v80 = 0;
      double v44 = v84;
      uint64_t v81 = *(void *)&v84;
      unint64_t v82 = v11;
      goto LABEL_33;
    }
    uint64_t v66 = *a2;
    uint64_t v67 = a2[2];
    swift_bridgeObjectRetain();
LABEL_30:
    uint64_t v71 = OUTLINED_FUNCTION_93();
    outlined consume of SearchGlobalEntity.CustomAttribute(v71, v72, v73, v5);
    uint64_t v55 = v66;
    uint64_t v56 = v9;
    uint64_t v57 = v67;
    unint64_t v58 = v11;
    goto LABEL_21;
  }
  if (!v9)
  {
    uint64_t v68 = a1[2];
    uint64_t v66 = *a2;
    uint64_t v67 = a2[2];
    outlined copy of SearchGlobalEntity.CustomAttribute(*a2, 0, v10, v11);
    uint64_t v69 = OUTLINED_FUNCTION_93();
    outlined copy of SearchGlobalEntity.CustomAttribute(v69, v70, v68, v5);
    uint64_t v9 = 0;
    goto LABEL_30;
  }
  double v88 = *((double *)a1 + 2);
  if (v3 == v8 && v2 == v9)
  {
    double v74 = *((double *)a2 + 2);
    outlined copy of SearchGlobalEntity.CustomAttribute(v3, v2, v10, v11);
    uint64_t v75 = OUTLINED_FUNCTION_95();
    outlined copy of SearchGlobalEntity.CustomAttribute(v75, v76, v77, v78);
    outlined consume of SearchGlobalEntity.CustomAttribute(v3, v2, v12, v5);
    uint64_t v79 = OUTLINED_FUNCTION_93();
    double v44 = v74;
    uint64_t v81 = *(void *)&v74;
    unint64_t v82 = v11;
LABEL_33:
    outlined consume of SearchGlobalEntity.CustomAttribute(v79, v80, v81, v82);
    goto LABEL_34;
  }
  uint64_t v34 = *a2;
  uint64_t v35 = a2[2];
  char v85 = _stringCompareWithSmolCheck(_:_:expecting:)();
  OUTLINED_FUNCTION_104(v34);
  uint64_t v36 = OUTLINED_FUNCTION_95();
  outlined copy of SearchGlobalEntity.CustomAttribute(v36, v37, v38, v39);
  uint64_t v40 = OUTLINED_FUNCTION_94();
  outlined consume of SearchGlobalEntity.CustomAttribute(v40, v41, v42, v43);
  double v44 = *(double *)&v35;
  outlined consume of SearchGlobalEntity.CustomAttribute(v34, v9, v35, v11);
  if (v85)
  {
LABEL_34:
    if (v5)
    {
      if ((v11 & 1) == 0) {
        return 0;
      }
    }
    else if ((v11 & 1) != 0 || v88 != v44)
    {
      return 0;
    }
    return 1;
  }
  return 0;
}

uint64_t SearchGlobalEntity.CustomAttribute.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x676E69727473 && a2 == 0xE600000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275)
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

uint64_t SearchGlobalEntity.CustomAttribute.CodingKeys.stringValue.getter(char a1)
{
  if (!a1) {
    return 0x676E69727473;
  }
  if (a1 == 1) {
    return 0x6D617473656D6974;
  }
  return 0x74617265706D6574;
}

uint64_t SearchGlobalEntity.CustomAttribute.StringCodingKeys.stringValue.getter()
{
  return 12383;
}

uint64_t SearchGlobalEntity.CustomAttribute.StringCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
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

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.CustomAttribute.CodingKeys()
{
  return SearchGlobalEntity.CustomAttribute.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.CustomAttribute.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.CustomAttribute.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.CustomAttribute.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.CustomAttribute.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys()
{
  return SearchGlobalEntity.CustomAttribute.StringCodingKeys.hashValue.getter();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.CustomAttribute.StringCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.CustomAttribute.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_11_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.CustomAttribute.TimestampCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_25();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.CustomAttribute.StringCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_96();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.CustomAttribute.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_14_0();
  unint64_t v7 = *(void *)(v0 + 24);
  OUTLINED_FUNCTION_77(v2);
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v7 >> 62)
  {
    if (v7 >> 62 == 1)
    {
      lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys();
      OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_117();
      lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp();
    }
    else
    {
      lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys();
      OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_117();
      lazy protocol witness table accessor for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature();
    }
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    OUTLINED_FUNCTION_6_1();
    v9();
  }
  else
  {
    lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    KeyedEncodingContainer.encode(_:forKey:)();
    OUTLINED_FUNCTION_6_1();
    v8();
    OUTLINED_FUNCTION_86();
  }
  OUTLINED_FUNCTION_6_1();
  v10();
  OUTLINED_FUNCTION_2_0();
}

void SearchGlobalEntity.CustomAttribute.init(from:)()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = v2;
  uint64_t v40 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_11_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.CustomAttribute.TimestampCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_14_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.CustomAttribute.StringCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_96();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.CustomAttribute.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_43();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v0)
  {
    uint64_t v47 = v10;
    uint64_t v13 = v1;
    uint64_t v14 = KeyedDecodingContainer.allKeys.getter();
    uint64_t v15 = *(void *)(v14 + 16);
    uint64_t v16 = v8;
    if (v15)
    {
      int v17 = *(unsigned __int8 *)(v14 + 32);
      specialized ArraySlice.subscript.getter(1, v15, v14, v14 + 32, 0, (2 * v15) | 1);
      uint64_t v19 = v18;
      unint64_t v21 = v20;
      swift_bridgeObjectRelease();
      if (v19 == v21 >> 1)
      {
        if (v17)
        {
          if (v17 == 1)
          {
            LOBYTE(v42) = 1;
            lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys();
            KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
            lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp();
            KeyedDecodingContainer.decode<A>(_:forKey:)();
            uint64_t v12 = (uint64_t)v3;
            OUTLINED_FUNCTION_6_1();
            v27();
            swift_unknownObjectRelease();
            OUTLINED_FUNCTION_6_1();
            v28();
            uint64_t v29 = v42;
            uint64_t v30 = v43;
            uint64_t v31 = v44;
            long long v32 = v46;
            unint64_t v33 = v45 | 0x4000000000000000;
LABEL_15:
            *(void *)uint64_t v40 = v29;
            *(void *)(v40 + 8) = v30;
            *(void *)(v40 + 16) = v31;
            *(void *)(v40 + 24) = v33;
            *(_OWORD *)(v40 + 32) = v32;
            goto LABEL_11;
          }
          LOBYTE(v42) = 2;
          lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          lazy protocol witness table accessor for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature();
          KeyedDecodingContainer.decode<A>(_:forKey:)();
          uint64_t v12 = (uint64_t)v3;
          OUTLINED_FUNCTION_6_1();
          v37();
          swift_unknownObjectRelease();
          uint64_t v38 = OUTLINED_FUNCTION_87();
          v39(v38);
          uint64_t v29 = v42;
          uint64_t v30 = v43;
          uint64_t v31 = v44;
          unint64_t v33 = v45 | 0x8000000000000000;
        }
        else
        {
          lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v26 = KeyedDecodingContainer.decode(_:forKey:)();
          uint64_t v12 = (uint64_t)v3;
          uint64_t v30 = v34;
          uint64_t v41 = v26;
          OUTLINED_FUNCTION_6_1();
          v35();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_30();
          v36();
          uint64_t v29 = v41;
          uint64_t v31 = 0;
          unint64_t v33 = 0;
        }
        long long v32 = 0uLL;
        goto LABEL_15;
      }
      uint64_t v12 = (uint64_t)v3;
      uint64_t v22 = v47;
      uint64_t v16 = v8;
    }
    else
    {
      uint64_t v12 = (uint64_t)v3;
      uint64_t v22 = v47;
    }
    type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v24 = &type metadata for SearchGlobalEntity.CustomAttribute;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    OUTLINED_FUNCTION_46();
    (*(void (**)(void *))(v25 + 104))(v24);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v13, v16);
    goto LABEL_11;
  }
  uint64_t v12 = (uint64_t)v3;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_0(v12);
  OUTLINED_FUNCTION_2_0();
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.CustomAttribute()
{
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.CustomAttribute()
{
}

void SearchGlobalEntity.EntityType.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

BOOL static SearchGlobalEntity.EntityType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SearchGlobalEntity.EntityType.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x636972656E6567 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1936744813 && a2 == 0xE400000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
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

uint64_t SearchGlobalEntity.EntityType.CodingKeys.init(intValue:)()
{
  return 3;
}

uint64_t SearchGlobalEntity.EntityType.CodingKeys.stringValue.getter(char a1)
{
  if (!a1) {
    return 0x636972656E6567;
  }
  if (a1 == 1) {
    return 1936744813;
  }
  return 0x6E776F6E6B6E75;
}

uint64_t SearchGlobalEntity.EntityType.MapsCodingKeys.init(stringValue:)()
{
  return 1;
}

uint64_t SearchGlobalEntity.EntityType.MapsCodingKeys.stringValue.getter()
{
  return 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SearchGlobalEntity.EntityType.CodingKeys()
{
  return SearchGlobalEntity.Timestamp.CodingKeys.hashValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.EntityType.CodingKeys()
{
  return SearchGlobalEntity.EntityType.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.EntityType.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.EntityType.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.EntityType.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = SearchGlobalEntity.EntityType.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.EntityType.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.EntityType.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.EntityType.GenericCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.EntityType.GenericCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.EntityType.MapsCodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = SearchGlobalEntity.EntityType.MapsCodingKeys.init(stringValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.EntityType.MapsCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.EntityType.MapsCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.EntityType.UnknownCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.EntityType.UnknownCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.EntityType.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v0;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.EntityType.UnknownCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_11_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.EntityType.MapsCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_25();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.EntityType.GenericCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_14_0();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.EntityType.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_13_0();
  int v12 = *v2;
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v12)
  {
    if (v12 == 1) {
      lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys();
    }
    else {
      lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys();
    }
    OUTLINED_FUNCTION_102();
  }
  else
  {
    lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys();
    OUTLINED_FUNCTION_102();
    OUTLINED_FUNCTION_86();
  }
  OUTLINED_FUNCTION_6_1();
  v13();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v8);
  OUTLINED_FUNCTION_2_0();
}

Swift::Int SearchGlobalEntity.EntityType.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  OUTLINED_FUNCTION_127();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void SearchGlobalEntity.EntityType.init(from:)()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = v2;
  long long v32 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.EntityType.UnknownCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_11_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.EntityType.MapsCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_9_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.EntityType.GenericCodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_97();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.EntityType.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  uint64_t v33 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_25();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0) {
    goto LABEL_10;
  }
  uint64_t v34 = v3;
  uint64_t v11 = v1;
  uint64_t v12 = KeyedDecodingContainer.allKeys.getter();
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
LABEL_9:
    type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v25 = &type metadata for SearchGlobalEntity.EntityType;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    OUTLINED_FUNCTION_46();
    (*(void (**)(void *))(v26 + 104))(v25);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v11, v8);
    uint64_t v3 = v34;
LABEL_10:
    uint64_t v27 = (uint64_t)v3;
    goto LABEL_11;
  }
  uint64_t v14 = v1;
  int v15 = *(unsigned __int8 *)(v12 + 32);
  specialized ArraySlice.subscript.getter(1, v13, v12, v12 + 32, 0, (2 * v13) | 1);
  uint64_t v17 = v16;
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if (v17 != v19 >> 1)
  {
    uint64_t v11 = v14;
    goto LABEL_9;
  }
  char v20 = v15;
  if (v15)
  {
    if (v15 == 1)
    {
      lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys();
      OUTLINED_FUNCTION_92();
      unint64_t v21 = v32;
      OUTLINED_FUNCTION_6_1();
      v22();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_40();
      v23();
    }
    else
    {
      lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys();
      OUTLINED_FUNCTION_92();
      unint64_t v21 = v32;
      OUTLINED_FUNCTION_6_1();
      v30();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_40();
      v31();
      char v20 = v15;
    }
  }
  else
  {
    lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys();
    OUTLINED_FUNCTION_92();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_6_1();
    v28();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_6_1();
    v29();
    unint64_t v21 = v32;
  }
  *unint64_t v21 = v20;
  uint64_t v27 = (uint64_t)v34;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_0(v27);
  OUTLINED_FUNCTION_2_0();
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.EntityType()
{
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.EntityType()
{
}

uint64_t SearchGlobalEntity.EventAttributes.allDay.getter()
{
  return *v0;
}

uint64_t SearchGlobalEntity.EventAttributes.allDay.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*SearchGlobalEntity.EventAttributes.allDay.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.EventAttributes.startDate.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t SearchGlobalEntity.EventAttributes.startDate.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 8) = result;
  *(unsigned char *)(v2 + 16) = a2 & 1;
  return result;
}

uint64_t (*SearchGlobalEntity.EventAttributes.startDate.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.EventAttributes.endDate.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t SearchGlobalEntity.EventAttributes.endDate.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 24) = result;
  *(unsigned char *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*SearchGlobalEntity.EventAttributes.endDate.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t static SearchGlobalEntity.EventAttributes.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  uint64_t v3 = *((void *)a1 + 1);
  unsigned __int8 v4 = a1[16];
  uint64_t v5 = *((void *)a1 + 3);
  unsigned __int8 v6 = a1[32];
  int v7 = *a2;
  if (v2 == 2)
  {
    if (v7 != 2) {
      return 0;
    }
LABEL_6:
    if (v4)
    {
      if (!a2[16]) {
        return 0;
      }
    }
    else
    {
      if (v3 == *((void *)a2 + 1)) {
        char v10 = a2[16];
      }
      else {
        char v10 = 1;
      }
      if (v10) {
        return 0;
      }
    }
    if (v6)
    {
      if ((a2[32] & 1) == 0) {
        return 0;
      }
    }
    else
    {
      if (v5 == *((void *)a2 + 3)) {
        char v11 = a2[32];
      }
      else {
        char v11 = 1;
      }
      if (v11) {
        return 0;
      }
    }
    return 1;
  }
  uint64_t result = 0;
  BOOL v9 = (v2 & 1) == 0;
  if (v7 != 2 && ((v9 ^ v7) & 1) != 0) {
    goto LABEL_6;
  }
  return result;
}

uint64_t SearchGlobalEntity.EventAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7961446C6C61 && a2 == 0xE600000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7461447472617473 && a2 == 0xE900000000000065;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x65746144646E65 && a2 == 0xE700000000000000)
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

uint64_t SearchGlobalEntity.EventAttributes.CodingKeys.stringValue.getter(char a1)
{
  if (!a1) {
    return 0x7961446C6C61;
  }
  if (a1 == 1) {
    return 0x7461447472617473;
  }
  return 0x65746144646E65;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.EventAttributes.CodingKeys()
{
  return SearchGlobalEntity.EventAttributes.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.EventAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.EventAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.EventAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.EventAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.EventAttributes.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.EventAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_77(v2);
  lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys();
  OUTLINED_FUNCTION_68();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v0)
  {
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    OUTLINED_FUNCTION_63();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  uint64_t v4 = OUTLINED_FUNCTION_4();
  v5(v4);
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_2_0();
}

void SearchGlobalEntity.EventAttributes.init()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = 0;
  OUTLINED_FUNCTION_88(a1);
}

void SearchGlobalEntity.EventAttributes.init(allDay:startDate:endDate:)(uint64_t a1@<X8>, char a2@<W0>, uint64_t a3@<X1>, char a4@<W2>, uint64_t a5@<X3>)
{
  *(unsigned char *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(unsigned char *)(a1 + 16) = a4 & 1;
  *(void *)(a1 + 24) = a5;
  OUTLINED_FUNCTION_88(a1);
}

void SearchGlobalEntity.EventAttributes.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, char a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_3_1();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_114();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.EventAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&a9 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_32();
  lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys();
  OUTLINED_FUNCTION_85();
  if (!v25)
  {
    a14 = 0;
    char v32 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    a13 = 1;
    uint64_t v33 = OUTLINED_FUNCTION_61((uint64_t)&a13);
    a10 = v34;
    a12 = 2;
    OUTLINED_FUNCTION_61((uint64_t)&a12);
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_29();
    v35();
    *(unsigned char *)uint64_t v26 = v32;
    *(void *)(v26 + 8) = v33;
    *(unsigned char *)(v26 + 16) = a10 & 1;
    *(void *)(v26 + 24) = v31;
    *(unsigned char *)(v26 + 32) = v31 & 1;
  }
  __swift_destroy_boxed_opaque_existential_0(v24);
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_2_0();
}

#error "2586DF20C: call analysis failed (funcsize=6)"

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.EventAttributes()
{
}

uint64_t SearchGlobalEntity.PlaceAttributes.name.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.PlaceAttributes.name.setter()
{
  uint64_t result = OUTLINED_FUNCTION_34();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.name.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.locality.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.PlaceAttributes.locality.setter()
{
  uint64_t result = OUTLINED_FUNCTION_51();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.locality.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.subLocality.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.PlaceAttributes.subLocality.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.subLocality.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.administrativeArea.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.PlaceAttributes.administrativeArea.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.administrativeArea.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.subAdministrativeArea.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.PlaceAttributes.subAdministrativeArea.setter()
{
  OUTLINED_FUNCTION_27();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.subAdministrativeArea.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.country.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.PlaceAttributes.country.setter()
{
  OUTLINED_FUNCTION_27();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = v2;
  *(void *)(v1 + 88) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.country.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.isoCountryCode.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.PlaceAttributes.isoCountryCode.setter()
{
  OUTLINED_FUNCTION_27();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = v2;
  *(void *)(v1 + 104) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.isoCountryCode.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.postalAddress.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.PlaceAttributes.postalAddress.setter()
{
  OUTLINED_FUNCTION_27();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 112) = v2;
  *(void *)(v1 + 120) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.postalAddress.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.subThoroughfare.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.PlaceAttributes.subThoroughfare.setter()
{
  OUTLINED_FUNCTION_27();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 128) = v2;
  *(void *)(v1 + 136) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.subThoroughfare.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.thoroughfare.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.PlaceAttributes.thoroughfare.setter()
{
  OUTLINED_FUNCTION_27();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 144) = v2;
  *(void *)(v1 + 152) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.thoroughfare.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.latitude.getter()
{
  return *(void *)(v0 + 160);
}

uint64_t SearchGlobalEntity.PlaceAttributes.latitude.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 160) = result;
  *(unsigned char *)(v2 + 168) = a2 & 1;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.latitude.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.PlaceAttributes.longitude.getter()
{
  return *(void *)(v0 + 176);
}

uint64_t SearchGlobalEntity.PlaceAttributes.longitude.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 176) = result;
  *(unsigned char *)(v2 + 184) = a2 & 1;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.longitude.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t static SearchGlobalEntity.PlaceAttributes.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v184 = *(void *)(a1 + 24);
  uint64_t v179 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v182 = *(void *)(a1 + 16);
  uint64_t v183 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 96);
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v10 = *(void *)(a1 + 112);
  uint64_t v13 = *(void *)(a1 + 120);
  uint64_t v12 = *(void *)(a1 + 128);
  uint64_t v14 = *(void *)(a1 + 136);
  uint64_t v172 = *(void *)(a1 + 144);
  uint64_t v173 = *(void *)(a1 + 152);
  double v15 = *(double *)(a1 + 160);
  char v170 = *(unsigned char *)(a1 + 168);
  double v16 = *(double *)(a1 + 176);
  char v17 = *(unsigned char *)(a1 + 184);
  uint64_t v18 = *(void *)(a2 + 8);
  uint64_t v181 = *(void *)(a2 + 16);
  uint64_t v19 = *(void *)(a2 + 24);
  uint64_t v178 = *(void *)(a2 + 32);
  uint64_t v180 = *(void *)(a2 + 40);
  uint64_t v176 = *(void *)(a2 + 48);
  uint64_t v20 = *(void *)(a2 + 64);
  uint64_t v177 = *(void *)(a2 + 56);
  double v21 = *(double *)(a2 + 160);
  double v22 = *(double *)(a2 + 176);
  uint64_t v23 = *(void *)(a2 + 80);
  uint64_t v175 = *(void *)(a2 + 72);
  uint64_t v25 = *(void *)(a2 + 88);
  uint64_t v24 = *(void *)(a2 + 96);
  uint64_t v26 = *(void *)(a2 + 104);
  uint64_t v27 = *(void *)(a2 + 112);
  uint64_t v28 = *(void *)(a2 + 120);
  uint64_t v29 = *(void *)(a2 + 128);
  uint64_t v31 = *(void *)(a2 + 136);
  uint64_t v30 = *(void *)(a2 + 144);
  uint64_t v174 = *(void *)(a2 + 152);
  int v171 = *(unsigned __int8 *)(a2 + 168);
  char v169 = *(unsigned char *)(a2 + 184);
  if (!v3)
  {
    uint64_t v168 = *(void *)(a1 + 56);
    if (v18) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v18) {
    return 0;
  }
  uint64_t v168 = *(void *)(a1 + 56);
  if (*(void *)a1 == *(void *)a2 && v3 == v18) {
    goto LABEL_10;
  }
  uint64_t v134 = *(void *)(a1 + 88);
  uint64_t v139 = *(void *)(a2 + 120);
  uint64_t v156 = *(void *)(a2 + 112);
  uint64_t v162 = *(void *)(a2 + 136);
  char v33 = *(unsigned char *)(a1 + 184);
  uint64_t v34 = *(void *)(a1 + 128);
  uint64_t v144 = *(void *)(a2 + 128);
  uint64_t v150 = *(void *)(a2 + 144);
  uint64_t v35 = *(void *)(a1 + 136);
  uint64_t v36 = *(void *)(a1 + 112);
  uint64_t v37 = *(void *)(a1 + 120);
  uint64_t v119 = *(void *)(a2 + 64);
  uint64_t v123 = *(void *)(a1 + 72);
  uint64_t v38 = *(void *)(a1 + 96);
  uint64_t v130 = *(void *)(a2 + 88);
  uint64_t v115 = *(void *)(a1 + 104);
  uint64_t v117 = *(void *)(a2 + 104);
  uint64_t v39 = *(void *)(a1 + 80);
  uint64_t v40 = *(void *)(a2 + 96);
  uint64_t v112 = *(void *)(a1 + 64);
  char v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
  uint64_t v5 = v112;
  uint64_t v11 = v115;
  uint64_t v24 = v40;
  uint64_t v25 = v130;
  uint64_t v8 = v134;
  uint64_t v6 = v39;
  uint64_t v7 = v123;
  uint64_t v9 = v38;
  uint64_t v26 = v117;
  uint64_t v20 = v119;
  uint64_t v13 = v37;
  uint64_t v10 = v36;
  uint64_t v14 = v35;
  uint64_t v29 = v144;
  uint64_t v30 = v150;
  uint64_t v12 = v34;
  uint64_t v28 = v139;
  char v17 = v33;
  uint64_t v27 = v156;
  uint64_t v31 = v162;
  char v42 = v41;
  uint64_t result = 0;
  if (v42)
  {
LABEL_10:
    if (v184)
    {
      if (!v19) {
        return 0;
      }
      if (v182 != v181 || v184 != v19)
      {
        uint64_t v135 = v8;
        uint64_t v140 = v28;
        char v45 = v17;
        uint64_t v126 = v23;
        uint64_t v46 = v12;
        uint64_t v145 = v29;
        uint64_t v151 = v30;
        uint64_t v47 = v14;
        uint64_t v157 = v27;
        uint64_t v163 = v31;
        uint64_t v48 = v10;
        uint64_t v49 = v13;
        uint64_t v50 = v9;
        uint64_t v116 = v11;
        uint64_t v118 = v26;
        uint64_t v120 = v20;
        uint64_t v124 = v7;
        uint64_t v51 = v6;
        uint64_t v19 = v24;
        uint64_t v52 = v5;
        char v53 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v5 = v52;
        uint64_t v24 = v19;
        uint64_t v11 = v116;
        uint64_t v26 = v118;
        uint64_t v8 = v135;
        uint64_t v6 = v51;
        uint64_t v20 = v120;
        uint64_t v7 = v124;
        uint64_t v9 = v50;
        uint64_t v13 = v49;
        uint64_t v10 = v48;
        uint64_t v27 = v157;
        uint64_t v31 = v163;
        uint64_t v14 = v47;
        uint64_t v29 = v145;
        uint64_t v30 = v151;
        uint64_t v12 = v46;
        uint64_t v23 = v126;
        char v17 = v45;
        uint64_t v28 = v140;
        char v54 = v53;
        uint64_t result = 0;
        if ((v54 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v19)
    {
      return 0;
    }
    if (v183)
    {
      if (!v180) {
        return 0;
      }
      if (v179 != v178 || v183 != v180)
      {
        uint64_t v136 = v8;
        char v185 = v17;
        uint64_t v127 = v23;
        uint64_t v131 = v25;
        uint64_t v56 = v12;
        uint64_t v146 = v29;
        uint64_t v152 = v30;
        uint64_t v57 = v14;
        uint64_t v158 = v27;
        uint64_t v164 = v31;
        uint64_t v58 = v10;
        uint64_t v59 = v13;
        uint64_t v60 = v9;
        uint64_t v141 = v28;
        uint64_t v61 = v11;
        uint64_t v62 = v6;
        uint64_t v19 = v26;
        uint64_t v121 = v20;
        uint64_t v63 = v24;
        uint64_t v113 = v5;
        char v64 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v5 = v113;
        uint64_t v24 = v63;
        uint64_t v20 = v121;
        uint64_t v26 = v19;
        uint64_t v6 = v62;
        uint64_t v25 = v131;
        uint64_t v8 = v136;
        uint64_t v11 = v61;
        uint64_t v9 = v60;
        uint64_t v13 = v59;
        uint64_t v28 = v141;
        uint64_t v29 = v146;
        uint64_t v10 = v58;
        uint64_t v27 = v158;
        uint64_t v31 = v164;
        uint64_t v14 = v57;
        uint64_t v30 = v152;
        uint64_t v12 = v56;
        uint64_t v23 = v127;
        char v17 = v185;
        char v65 = v64;
        uint64_t result = 0;
        if ((v65 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v180)
    {
      return 0;
    }
    if (v168)
    {
      if (!v177) {
        return 0;
      }
      if (v4 != v176 || v168 != v177)
      {
        uint64_t v137 = v8;
        uint64_t v142 = v28;
        uint64_t v125 = v7;
        uint64_t v128 = v23;
        char v67 = v17;
        uint64_t v68 = v12;
        uint64_t v147 = v29;
        uint64_t v153 = v30;
        uint64_t v69 = v14;
        uint64_t v159 = v27;
        uint64_t v165 = v31;
        uint64_t v70 = v10;
        uint64_t v71 = v13;
        uint64_t v72 = v9;
        uint64_t v73 = v11;
        uint64_t v132 = v25;
        uint64_t v74 = v6;
        uint64_t v19 = v26;
        uint64_t v122 = v20;
        uint64_t v75 = v24;
        uint64_t v114 = v5;
        char v76 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v5 = v114;
        uint64_t v24 = v75;
        uint64_t v26 = v19;
        uint64_t v6 = v74;
        uint64_t v25 = v132;
        uint64_t v8 = v137;
        uint64_t v11 = v73;
        uint64_t v9 = v72;
        uint64_t v13 = v71;
        uint64_t v28 = v142;
        uint64_t v29 = v147;
        uint64_t v10 = v70;
        uint64_t v27 = v159;
        uint64_t v31 = v165;
        uint64_t v14 = v69;
        uint64_t v30 = v153;
        uint64_t v12 = v68;
        uint64_t v23 = v128;
        char v17 = v67;
        uint64_t v20 = v122;
        uint64_t v7 = v125;
        char v77 = v76;
        uint64_t result = 0;
        if ((v77 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v177)
    {
      return 0;
    }
    if (v7)
    {
      if (!v175) {
        return 0;
      }
      if (v5 != v20 || v7 != v175)
      {
        uint64_t v138 = v8;
        uint64_t v143 = v28;
        char v79 = v17;
        uint64_t v129 = v23;
        uint64_t v133 = v25;
        uint64_t v80 = v12;
        uint64_t v148 = v29;
        uint64_t v154 = v30;
        uint64_t v81 = v14;
        uint64_t v160 = v27;
        uint64_t v166 = v31;
        uint64_t v82 = v10;
        uint64_t v83 = v13;
        uint64_t v84 = v9;
        uint64_t v85 = v11;
        uint64_t v86 = v6;
        uint64_t v19 = v26;
        uint64_t v87 = v24;
        char v88 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v24 = v87;
        uint64_t v26 = v19;
        uint64_t v6 = v86;
        uint64_t v25 = v133;
        uint64_t v8 = v138;
        uint64_t v11 = v85;
        uint64_t v9 = v84;
        uint64_t v13 = v83;
        uint64_t v28 = v143;
        uint64_t v29 = v148;
        uint64_t v10 = v82;
        uint64_t v27 = v160;
        uint64_t v31 = v166;
        uint64_t v14 = v81;
        uint64_t v30 = v154;
        uint64_t v12 = v80;
        uint64_t v23 = v129;
        char v17 = v79;
        char v89 = v88;
        uint64_t result = 0;
        if ((v89 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v175)
    {
      return 0;
    }
    if (v8)
    {
      if (!v25) {
        return 0;
      }
      if (v6 != v23 || v8 != v25)
      {
        char v91 = v17;
        uint64_t v92 = v12;
        uint64_t v149 = v29;
        uint64_t v155 = v30;
        uint64_t v93 = v14;
        uint64_t v161 = v27;
        uint64_t v167 = v31;
        uint64_t v94 = v10;
        uint64_t v95 = v13;
        uint64_t v96 = v9;
        uint64_t v97 = v28;
        uint64_t v98 = v11;
        uint64_t v99 = v26;
        uint64_t v19 = v24;
        char v100 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v24 = v19;
        uint64_t v26 = v99;
        uint64_t v11 = v98;
        uint64_t v28 = v97;
        uint64_t v9 = v96;
        uint64_t v13 = v95;
        uint64_t v10 = v94;
        uint64_t v27 = v161;
        uint64_t v31 = v167;
        uint64_t v14 = v93;
        uint64_t v29 = v149;
        uint64_t v30 = v155;
        uint64_t v12 = v92;
        char v17 = v91;
        char v101 = v100;
        uint64_t result = 0;
        if ((v101 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v25)
    {
      return 0;
    }
    if (v11)
    {
      if (!v26) {
        return 0;
      }
      if (v9 != v24 || v11 != v26)
      {
        OUTLINED_FUNCTION_100();
        _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v30 = v19;
        uint64_t result = OUTLINED_FUNCTION_28();
        if ((v103 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v26)
    {
      return 0;
    }
    if (v13)
    {
      if (!v28) {
        return 0;
      }
      if (v10 != v27 || v13 != v28)
      {
        OUTLINED_FUNCTION_100();
        _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v30 = v19;
        uint64_t result = OUTLINED_FUNCTION_28();
        if ((v105 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v28)
    {
      return 0;
    }
    if (v14)
    {
      if (!v31) {
        return 0;
      }
      if (v12 != v29 || v14 != v31)
      {
        _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = OUTLINED_FUNCTION_28();
        if ((v107 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v31)
    {
      return 0;
    }
    if (v173)
    {
      if (v174)
      {
        if (v172 != v30 || v173 != v174)
        {
          _stringCompareWithSmolCheck(_:_:expecting:)();
          uint64_t result = OUTLINED_FUNCTION_28();
          if ((v109 & 1) == 0) {
            return result;
          }
        }
LABEL_91:
        if (v170)
        {
          if (!v171) {
            return 0;
          }
        }
        else
        {
          char v110 = v171;
          if (v15 != v21) {
            char v110 = 1;
          }
          if (v110) {
            return 0;
          }
        }
        if (v17)
        {
          if ((v169 & 1) == 0) {
            return 0;
          }
        }
        else
        {
          char v111 = v169;
          if (v16 != v22) {
            char v111 = 1;
          }
          if (v111) {
            return 0;
          }
        }
        return 1;
      }
    }
    else if (!v174)
    {
      goto LABEL_91;
    }
    return 0;
  }
  return result;
}

uint64_t SearchGlobalEntity.PlaceAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7974696C61636F6CLL && a2 == 0xE800000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6C61636F4C627573 && a2 == 0xEB00000000797469;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000012 && a2 == 0x80000002586FA890 {
             || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      }
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000015 && a2 == 0x80000002586FA8B0 {
             || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      }
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        BOOL v8 = a1 == 0x7972746E756F63 && a2 == 0xE700000000000000;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          BOOL v9 = a1 == 0x746E756F436F7369 && a2 == 0xEE0065646F437972;
          if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            BOOL v10 = a1 == 0x64416C6174736F70 && a2 == 0xED00007373657264;
            if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              BOOL v11 = a1 == 0x6F726F6854627573 && a2 == 0xEF65726166686775;
              if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                BOOL v12 = a1 == 0x6867756F726F6874 && a2 == 0xEC00000065726166;
                if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else
                {
                  BOOL v13 = a1 == 0x656475746974616CLL && a2 == 0xE800000000000000;
                  if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 10;
                  }
                  else if (a1 == 0x64757469676E6F6CLL && a2 == 0xE900000000000065)
                  {
                    swift_bridgeObjectRelease();
                    return 11;
                  }
                  else
                  {
                    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
                    swift_bridgeObjectRelease();
                    if (v15) {
                      return 11;
                    }
                    else {
                      return 12;
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

uint64_t SearchGlobalEntity.PlaceAttributes.CodingKeys.init(intValue:)()
{
  return 12;
}

unint64_t SearchGlobalEntity.PlaceAttributes.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7974696C61636F6CLL;
      break;
    case 2:
      unint64_t result = 0x6C61636F4C627573;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0x7972746E756F63;
      break;
    case 6:
      unint64_t result = 0x746E756F436F7369;
      break;
    case 7:
      unint64_t result = 0x64416C6174736F70;
      break;
    case 8:
      unint64_t result = 0x6F726F6854627573;
      break;
    case 9:
      unint64_t result = 0x6867756F726F6874;
      break;
    case 10:
      unint64_t result = 0x656475746974616CLL;
      break;
    case 11:
      unint64_t result = 0x64757469676E6F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.PlaceAttributes.CodingKeys()
{
  return SearchGlobalEntity.PlaceAttributes.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.PlaceAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.PlaceAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.PlaceAttributes.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = SearchGlobalEntity.PlaceAttributes.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.PlaceAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.PlaceAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.PlaceAttributes.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.PlaceAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_14_0();
  uint64_t v7 = v3[3];
  BOOL v8 = v3;
  uint64_t v10 = v9;
  __swift_project_boxed_opaque_existential_1(v8, v7);
  lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v0)
  {
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_41();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v10);
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_2_0();
}

void __swiftcall SearchGlobalEntity.PlaceAttributes.init()(OmniSearchTypes::SearchGlobalEntity::PlaceAttributes *__return_ptr retstr)
{
  retstr->latitude.is_nil = 1;
  retstr->longitude.value = 0.0;
  retstr->longitude.is_nil = 1;
}

void SearchGlobalEntity.PlaceAttributes.init(from:)()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.PlaceAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_98();
  char v94 = 1;
  char v92 = 1;
  uint64_t v10 = v3[3];
  uint64_t v11 = v3[4];
  uint64_t v46 = (uint64_t)v3;
  OUTLINED_FUNCTION_77(v3);
  lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
  {
    OUTLINED_FUNCTION_24();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = v1;
    uint64_t v72 = v66;
    uint64_t v73 = v11;
    uint64_t v74 = v44;
    uint64_t v75 = v8;
    uint64_t v76 = v64;
    uint64_t v77 = v0;
    uint64_t v78 = v45;
    uint64_t v79 = v10;
    uint64_t v80 = v62;
    uint64_t v81 = v6;
    uint64_t v82 = v60;
    uint64_t v83 = v47;
    uint64_t v84 = v58;
    uint64_t v85 = v56;
    uint64_t v86 = v52;
    uint64_t v87 = v50;
    uint64_t v88 = v54;
    OUTLINED_FUNCTION_108();
    *(_DWORD *)char v89 = *(_DWORD *)v93;
    *(_DWORD *)&v89[3] = *(_DWORD *)&v93[3];
    uint64_t v90 = 0;
  }
  else
  {
    BOOL v12 = v5;
    uint64_t v13 = OUTLINED_FUNCTION_15_0();
    uint64_t v15 = v14;
    uint64_t v43 = v13;
    swift_bridgeObjectRetain();
    uint64_t v95 = v15;
    uint64_t v42 = OUTLINED_FUNCTION_15_0();
    uint64_t v17 = v16;
    swift_bridgeObjectRetain();
    uint64_t v18 = OUTLINED_FUNCTION_15_0();
    uint64_t v20 = v19;
    swift_bridgeObjectRetain();
    uint64_t v40 = OUTLINED_FUNCTION_15_0();
    uint64_t v41 = v18;
    uint64_t v22 = v21;
    swift_bridgeObjectRetain();
    uint64_t v65 = v22;
    uint64_t v39 = OUTLINED_FUNCTION_15_0();
    uint64_t v24 = v23;
    swift_bridgeObjectRetain();
    uint64_t v38 = OUTLINED_FUNCTION_15_0();
    uint64_t v63 = v25;
    swift_bridgeObjectRetain();
    uint64_t v37 = OUTLINED_FUNCTION_15_0();
    uint64_t v61 = v26;
    swift_bridgeObjectRetain();
    uint64_t v48 = OUTLINED_FUNCTION_15_0();
    uint64_t v59 = v27;
    swift_bridgeObjectRetain();
    uint64_t v57 = OUTLINED_FUNCTION_15_0();
    uint64_t v53 = v28;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_115();
    uint64_t v51 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v55 = v29;
    LOBYTE(v69) = 10;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_115();
    uint64_t v49 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    char v35 = v30 & 1;
    char v94 = v30 & 1;
    char v68 = 11;
    uint64_t v36 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    char v32 = v31;
    uint64_t v33 = OUTLINED_FUNCTION_1_2();
    v34(v33);
    char v92 = v32 & 1;
    *(void *)char v67 = v43;
    *(void *)&v67[8] = v95;
    *(void *)&v67[16] = v42;
    *(void *)&v67[24] = v17;
    *(void *)&v67[32] = v41;
    *(void *)&v67[40] = v20;
    *(void *)&v67[48] = v40;
    *(void *)&v67[56] = v65;
    *(void *)&v67[64] = v39;
    *(void *)&v67[72] = v24;
    *(void *)&v67[80] = v38;
    *(void *)&v67[88] = v63;
    *(void *)&v67[96] = v37;
    *(void *)&v67[104] = v61;
    *(void *)&v67[112] = v48;
    *(void *)&v67[120] = v59;
    *(void *)&v67[128] = v57;
    *(void *)&v67[136] = v53;
    *(void *)&v67[144] = v51;
    *(void *)&v67[152] = v55;
    *(void *)&v67[160] = v49;
    v67[168] = v35;
    *(void *)&v67[176] = v36;
    v67[184] = v32 & 1;
    outlined retain of SearchGlobalEntity.PlaceAttributes((uint64_t)v67);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v12, v67, 0xB9uLL);
    __swift_destroy_boxed_opaque_existential_0(v46);
    uint64_t v69 = v43;
    uint64_t v70 = v95;
    uint64_t v71 = v42;
    uint64_t v72 = v17;
    uint64_t v73 = v41;
    uint64_t v74 = v20;
    uint64_t v75 = v40;
    uint64_t v76 = v65;
    uint64_t v77 = v39;
    uint64_t v78 = v24;
    uint64_t v79 = v38;
    uint64_t v80 = v63;
    uint64_t v81 = v37;
    uint64_t v82 = v61;
    uint64_t v83 = v48;
    uint64_t v84 = v59;
    uint64_t v85 = v57;
    uint64_t v86 = v53;
    uint64_t v87 = v51;
    uint64_t v88 = v55;
    OUTLINED_FUNCTION_108();
    *(_DWORD *)&v89[3] = *(_DWORD *)&v93[3];
    *(_DWORD *)char v89 = *(_DWORD *)v93;
    uint64_t v90 = v36;
  }
  char v91 = v92;
  outlined release of SearchGlobalEntity.PlaceAttributes((uint64_t)&v69);
  OUTLINED_FUNCTION_2_0();
}

void __swiftcall SearchGlobalEntity.PlaceAttributes.init(name:locality:subLocality:administrativeArea:subAdministrativeArea:country:isoCountryCode:postalAddress:subThoroughfare:thoroughfare:latitude:longitude:)(OmniSearchTypes::SearchGlobalEntity::PlaceAttributes *__return_ptr retstr, Swift::String_optional name, Swift::String_optional locality, Swift::String_optional subLocality, Swift::String_optional administrativeArea, Swift::String_optional subAdministrativeArea, Swift::String_optional country, Swift::String_optional isoCountryCode, Swift::String_optional postalAddress, Swift::String_optional subThoroughfare, Swift::String_optional thoroughfare, Swift::Double_optional latitude, Swift::Double_optional longitude)
{
  retstr->name = name;
  retstr->locality = locality;
  retstr->subLocality = subLocality;
  retstr->administrativeArea = administrativeArea;
  retstr->subAdministrativeArea = subAdministrativeArea;
  retstr->country = country;
  retstr->isoCountryCode = isoCountryCode;
  retstr->postalAddress = postalAddress;
  retstr->subThoroughfare = subThoroughfare;
  retstr->thoroughfare = thoroughfare;
  retstr->latitude.value = *(Swift::Double *)&latitude.is_nil;
  retstr->latitude.is_nil = v13 & 1;
  retstr->longitude.value = v14;
  retstr->longitude.is_nil = v15 & 1;
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.PlaceAttributes()
{
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.PlaceAttributes()
{
}

uint64_t SearchGlobalEntity.IDAttributes.muid.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.IDAttributes.muid.setter()
{
  uint64_t result = OUTLINED_FUNCTION_34();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.IDAttributes.muid.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.IDAttributes.umcID.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.IDAttributes.umcID.setter()
{
  uint64_t result = OUTLINED_FUNCTION_51();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.IDAttributes.umcID.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t static SearchGlobalEntity.IDAttributes.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  if (!a1[1])
  {
    if (v4) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v4) {
    return 0;
  }
  OUTLINED_FUNCTION_56((uint64_t)a1);
  BOOL v9 = v9 && v7 == v8;
  if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = OUTLINED_FUNCTION_28(), (v11 & 1) != 0))
  {
LABEL_10:
    if (v3)
    {
      if (v6)
      {
        if (v2 == v5 && v3 == v6) {
          return 1;
        }
        OUTLINED_FUNCTION_4_1();
        if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
          return 1;
        }
      }
    }
    else if (!v6)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t SearchGlobalEntity.IDAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1684632941 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4449636D75 && a2 == 0xE500000000000000)
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

Swift::Int SearchGlobalEntity.Temperature.CodingKeys.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

uint64_t SearchGlobalEntity.IDAttributes.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x4449636D75;
  }
  else {
    return 1684632941;
  }
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.IDAttributes.CodingKeys()
{
  return SearchGlobalEntity.IDAttributes.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.IDAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.IDAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.IDAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.IDAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.IDAttributes.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.IDAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_77(v2);
  lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_65();
  if (!v0)
  {
    OUTLINED_FUNCTION_118();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  uint64_t v4 = OUTLINED_FUNCTION_4();
  v5(v4);
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_2_0();
}

OmniSearchTypes::SearchGlobalEntity::IDAttributes __swiftcall SearchGlobalEntity.IDAttributes.init()()
{
  _OWORD *v0 = 0u;
  v0[1] = 0u;
  return result;
}

void SearchGlobalEntity.IDAttributes.init(from:)()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_114();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.IDAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_43();
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    uint64_t v4 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v6 = v5;
    OUTLINED_FUNCTION_91();
    uint64_t v7 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v9 = v8;
    uint64_t v11 = v7;
    OUTLINED_FUNCTION_29();
    v10();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *unint64_t v2 = v4;
    v2[1] = v6;
    v2[2] = v11;
    v2[3] = v9;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_2_0();
}

OmniSearchTypes::SearchGlobalEntity::IDAttributes __swiftcall SearchGlobalEntity.IDAttributes.init(muid:umcID:)(Swift::String_optional muid, Swift::String_optional umcID)
{
  *unint64_t v2 = muid;
  v2[1] = umcID;
  result.umcID = umcID;
  result.muid = muid;
  return result;
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.IDAttributes()
{
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.IDAttributes()
{
}

uint64_t SearchGlobalEntity.ContactAttributes.phoneNumber.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.ContactAttributes.phoneNumber.setter()
{
  uint64_t result = OUTLINED_FUNCTION_34();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.ContactAttributes.phoneNumber.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.ContactAttributes.email.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.ContactAttributes.email.setter()
{
  uint64_t result = OUTLINED_FUNCTION_51();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.ContactAttributes.email.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.ContactAttributes.imessageURL.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.ContactAttributes.imessageURL.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*SearchGlobalEntity.ContactAttributes.imessageURL.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.ContactAttributes.imessageID.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.ContactAttributes.imessageID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*SearchGlobalEntity.ContactAttributes.imessageID.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t static SearchGlobalEntity.ContactAttributes.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v7 = a1[7];
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v11 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v13 = a2[5];
  uint64_t v12 = a2[6];
  uint64_t v14 = a2[7];
  if (!a1[1])
  {
    if (v8) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v8) {
    return 0;
  }
  OUTLINED_FUNCTION_56((uint64_t)a1);
  BOOL v17 = v17 && v15 == v16;
  if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = OUTLINED_FUNCTION_28(), (v19 & 1) != 0))
  {
LABEL_10:
    if (v4)
    {
      if (!v11) {
        return 0;
      }
      if (v2 != v9 || v4 != v11)
      {
        _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = OUTLINED_FUNCTION_28();
        if ((v21 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v11)
    {
      return 0;
    }
    if (v6)
    {
      if (!v13) {
        return 0;
      }
      if (v3 != v10 || v6 != v13)
      {
        _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = OUTLINED_FUNCTION_28();
        if ((v23 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v13)
    {
      return 0;
    }
    if (v7)
    {
      if (v14)
      {
        BOOL v24 = v5 == v12 && v7 == v14;
        if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          return 1;
        }
      }
    }
    else if (!v14)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t SearchGlobalEntity.ContactAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6C69616D65 && a2 == 0xE500000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6567617373656D69 && a2 == 0xEB000000004C5255;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6567617373656D69 && a2 == 0xEA00000000004449)
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

uint64_t SearchGlobalEntity.ContactAttributes.CodingKeys.init(intValue:)()
{
  return 4;
}

uint64_t SearchGlobalEntity.ContactAttributes.CodingKeys.stringValue.getter(char a1)
{
  uint64_t result = 0x6D754E656E6F6870;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6C69616D65;
      break;
    case 2:
    case 3:
      uint64_t result = 0x6567617373656D69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.ContactAttributes.CodingKeys()
{
  return SearchGlobalEntity.ContactAttributes.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.ContactAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.ContactAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.ContactAttributes.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = SearchGlobalEntity.ContactAttributes.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.ContactAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.ContactAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.ContactAttributes.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.ContactAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_9_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v0)
  {
    OUTLINED_FUNCTION_118();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_64();
  }
  OUTLINED_FUNCTION_40();
  v4();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_2_0();
}

void __swiftcall SearchGlobalEntity.ContactAttributes.init()(OmniSearchTypes::SearchGlobalEntity::ContactAttributes *__return_ptr retstr)
{
  retstr->imessageURL = 0u;
  retstr->imessageID = 0u;
  retstr->phoneNumber = 0u;
  retstr->email = 0u;
}

void SearchGlobalEntity.ContactAttributes.init(from:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.ContactAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_25();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v0)
  {
    uint64_t v6 = OUTLINED_FUNCTION_60();
    uint64_t v8 = v7;
    uint64_t v23 = v6;
    OUTLINED_FUNCTION_91();
    uint64_t v9 = OUTLINED_FUNCTION_60();
    uint64_t v11 = v10;
    uint64_t v21 = v9;
    uint64_t v22 = v4;
    swift_bridgeObjectRetain();
    uint64_t v12 = OUTLINED_FUNCTION_60();
    uint64_t v14 = v13;
    uint64_t v20 = v12;
    swift_bridgeObjectRetain();
    uint64_t v15 = OUTLINED_FUNCTION_60();
    uint64_t v17 = v16;
    uint64_t v19 = v15;
    OUTLINED_FUNCTION_30();
    v18();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v22 = v23;
    v22[1] = v8;
    v22[2] = v21;
    v22[3] = v11;
    v22[4] = v20;
    v22[5] = v14;
    v22[6] = v19;
    v22[7] = v17;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_2_0();
}

void __swiftcall SearchGlobalEntity.ContactAttributes.init(phoneNumber:email:imessageURL:imessageID:)(OmniSearchTypes::SearchGlobalEntity::ContactAttributes *__return_ptr retstr, Swift::String_optional phoneNumber, Swift::String_optional email, Swift::String_optional imessageURL, Swift::String_optional imessageID)
{
  retstr->phoneNumber = phoneNumber;
  retstr->email = email;
  retstr->imessageURL = imessageURL;
  retstr->imessageID = imessageID;
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.ContactAttributes()
{
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.ContactAttributes()
{
}

uint64_t SearchGlobalEntity.AppStoreAttributes.adamID.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.AppStoreAttributes.adamID.setter()
{
  uint64_t result = OUTLINED_FUNCTION_34();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.AppStoreAttributes.adamID.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t static SearchGlobalEntity.AppStoreAttributes.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8))
  {
    if (v2)
    {
      OUTLINED_FUNCTION_56(a1);
      BOOL v5 = v5 && v3 == v4;
      if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
    }
  }
  else if (!v2)
  {
    return 1;
  }
  return 0;
}

uint64_t SearchGlobalEntity.AppStoreAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x44496D616461 && a2 == 0xE600000000000000)
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

Swift::Int SearchGlobalEntity.CustomAttribute.StringCodingKeys.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t SearchGlobalEntity.AppStoreAttributes.CodingKeys.stringValue.getter()
{
  return 0x44496D616461;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.AppStoreAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.AppStoreAttributes.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.AppStoreAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_13_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys();
  OUTLINED_FUNCTION_113();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  OUTLINED_FUNCTION_2_0();
}

OmniSearchTypes::SearchGlobalEntity::AppStoreAttributes __swiftcall SearchGlobalEntity.AppStoreAttributes.init()()
{
  void *v0 = 0;
  v0[1] = 0;
  return result;
}

OmniSearchTypes::SearchGlobalEntity::AppStoreAttributes __swiftcall SearchGlobalEntity.AppStoreAttributes.init(adamID:)(OmniSearchTypes::SearchGlobalEntity::AppStoreAttributes adamID)
{
  OmniSearchTypes::SearchGlobalEntity::AppStoreAttributes *v1 = adamID;
  return adamID;
}

void SearchGlobalEntity.AppStoreAttributes.init(from:)()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.AppStoreAttributes.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_32();
  lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v0)
  {
    uint64_t v6 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v8 = v7;
    OUTLINED_FUNCTION_29();
    v9();
    *uint64_t v4 = v6;
    v4[1] = v8;
  }
  __swift_destroy_boxed_opaque_existential_0(v2);
  OUTLINED_FUNCTION_2_0();
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.AppStoreAttributes()
{
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.AppStoreAttributes()
{
}

uint64_t SearchGlobalEntity.id.getter()
{
  EntityProperty.wrappedValue.getter();
  return v1;
}

uint64_t key path setter for SearchGlobalEntity.id : SearchGlobalEntity()
{
  return SearchGlobalEntity.id.setter();
}

uint64_t SearchGlobalEntity.id.setter()
{
  return OUTLINED_FUNCTION_110();
}

uint64_t (*SearchGlobalEntity.id.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_69((uint64_t)v1);
  *(void *)(v0 + 32) = EntityProperty.wrappedValue.modify();
  return SearchGlobalEntity.id.modify;
}

uint64_t SearchGlobalEntity.$id.getter()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t SearchGlobalEntity.domain.getter()
{
  EntityProperty.wrappedValue.getter();
  return v1;
}

uint64_t SearchGlobalEntity.domain.setter()
{
  return OUTLINED_FUNCTION_110();
}

uint64_t (*SearchGlobalEntity.domain.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_69((uint64_t)v1);
  *(void *)(v0 + 32) = EntityProperty.wrappedValue.modify();
  return SearchGlobalEntity.id.modify;
}

uint64_t SearchGlobalEntity.$domain.getter()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t SearchGlobalEntity.searchID.getter()
{
  outlined copy of Data?(*(void *)(v0 + 16), *(void *)(v0 + 24));
  return OUTLINED_FUNCTION_4_1();
}

void SearchGlobalEntity.entityType.getter(unsigned char *a1@<X8>)
{
}

uint64_t SearchGlobalEntity.text.getter()
{
  EntityProperty.wrappedValue.getter();
  return v1;
}

uint64_t SearchGlobalEntity.text.setter()
{
  return OUTLINED_FUNCTION_110();
}

uint64_t (*SearchGlobalEntity.text.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_69((uint64_t)v1);
  *(void *)(v0 + 32) = EntityProperty.wrappedValue.modify();
  return SearchGlobalEntity.id.modify;
}

uint64_t SearchGlobalEntity.$text.getter()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t SearchGlobalEntity.generalAttributes.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_70(*(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), a1);
}

uint64_t SearchGlobalEntity.customAttributes.getter()
{
  return swift_bridgeObjectRetain();
}

void SearchGlobalEntity.eventAttributes.getter(_OWORD *a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 144);
  *a1 = *(_OWORD *)(v1 + 128);
  a1[1] = v2;
  OUTLINED_FUNCTION_88((uint64_t)a1);
}

uint64_t SearchGlobalEntity.placeAttributes.getter@<X0>(uint64_t a1@<X8>)
{
  outlined init with take of SearchGlobalEntity.PlaceAttributes?(v1 + 168, (uint64_t)v4, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v4, a1, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  return outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v4);
}

uint64_t SearchGlobalEntity.idAttributes.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_53(v1[45], v1[46], v1[47], v1[48], a1);
}

uint64_t SearchGlobalEntity.contactAttributes.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_35(v1[49], v1[50], v1[51], v1[52], v1[53], v1[54], v1[55], v1[56], a1);
}

uint64_t SearchGlobalEntity.appstoreAttributes.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_71(*(void *)(v1 + 456), *(void *)(v1 + 464), a1);
}

uint64_t SearchGlobalEntity.lowConfidenceKnowledge.getter()
{
  return *(unsigned __int8 *)(v0 + 472);
}

uint64_t SearchGlobalEntity.lowConfidenceKnowledge.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 472) = result;
  return result;
}

uint64_t (*SearchGlobalEntity.lowConfidenceKnowledge.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.experienceFile.getter()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t key path setter for SearchGlobalEntity.experienceFile : SearchGlobalEntity(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of IntentFile?(a1, (uint64_t)v4, &demangling cache variable for type metadata for IntentFile?);
  return SearchGlobalEntity.experienceFile.setter((uint64_t)v4);
}

uint64_t SearchGlobalEntity.experienceFile.setter(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  uint64_t v4 = OUTLINED_FUNCTION_45(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_9_0();
  outlined init with copy of IntentFile?(a1, v1, &demangling cache variable for type metadata for IntentFile?);
  EntityProperty.wrappedValue.setter();
  return _s10AppIntents10IntentFileVSgWOhTm_0(a1, &demangling cache variable for type metadata for IntentFile?);
}

uint64_t (*SearchGlobalEntity.experienceFile.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_69((uint64_t)v1);
  *(void *)(v0 + 32) = EntityProperty.wrappedValue.modify();
  return SearchGlobalEntity.id.modify;
}

uint64_t SearchGlobalEntity.$experienceFile.getter()
{
  return EntityProperty.projectedValue.getter();
}

void SearchGlobalEntity.experienceSourceType.getter(unsigned char *a1@<X8>)
{
}

uint64_t SearchGlobalEntity.associatedQuery.getter()
{
  EntityProperty.wrappedValue.getter();
  return v1;
}

uint64_t key path setter for SearchGlobalEntity.domain : SearchGlobalEntity(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v6, v7);
}

uint64_t SearchGlobalEntity.associatedQuery.setter()
{
  return OUTLINED_FUNCTION_110();
}

uint64_t (*SearchGlobalEntity.associatedQuery.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_69((uint64_t)v1);
  *(void *)(v0 + 32) = EntityProperty.wrappedValue.modify();
  return SearchGlobalEntity.id.modify;
}

uint64_t SearchGlobalEntity.$associatedQuery.getter()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t SearchGlobalEntity.dialog.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_52(v1[62], v1[63], v1[64], v1[65], a1);
}

__n128 SearchGlobalEntity.dialog.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_81(a1);
  outlined consume of GlobalDialog?(v2[62], v2[63]);
  __n128 result = v5;
  *((__n128 *)v2 + 31) = v5;
  v2[64] = v1;
  v2[65] = v3;
  return result;
}

uint64_t (*SearchGlobalEntity.dialog.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

void SearchGlobalEntity.init()()
{
  OUTLINED_FUNCTION_33();
  __dst = v1;
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_31();
  uint64_t v3 = type metadata accessor for LocalizedStringResource();
  uint64_t v4 = OUTLINED_FUNCTION_45(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_42();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<String>);
  OUTLINED_FUNCTION_16();
  uint64_t v5 = MEMORY[0x25A2C96A0](v0);
  *(void *)uint64_t v13 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<String?>);
  swift_retain();
  OUTLINED_FUNCTION_21();
  uint64_t v6 = MEMORY[0x25A2C96A0](v0);
  *(void *)&v13[8] = v6;
  swift_retain();
  OUTLINED_FUNCTION_16();
  uint64_t v7 = MEMORY[0x25A2C96A0](v0);
  *(void *)&v13[40] = v7;
  v13[472] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<IntentFile?>);
  swift_retain();
  OUTLINED_FUNCTION_16();
  uint64_t v11 = MEMORY[0x25A2C9690](v0);
  *(void *)&v13[480] = v11;
  swift_retain();
  OUTLINED_FUNCTION_16();
  uint64_t v8 = MEMORY[0x25A2C96A0](v0);
  *(void *)&v13[488] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<[String]>);
  swift_retain();
  OUTLINED_FUNCTION_21();
  uint64_t v9 = MEMORY[0x25A2C96A0](v0);
  *(void *)&v13[528] = v9;
  *(_OWORD *)&v13[16] = xmmword_2586F8220;
  memset(&v13[48], 0, 80);
  *(void *)&v13[128] = 3;
  memset(&v13[136], 0, 25);
  _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(v14);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v14, (uint64_t)&v13[168], &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  *(void *)&v13[360] = 0;
  *(void *)&v13[368] = 1;
  memset(&v13[376], 0, 24);
  *(void *)&v13[400] = 1;
  memset(&v13[408], 0, 56);
  *(void *)&v13[464] = 1;
  memset(&v13[496], 0, 32);
  v13[32] = 3;
  v15[0] = v5;
  v15[1] = v6;
  long long v16 = xmmword_2586F8220;
  char v17 = 3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  uint64_t v18 = v7;
  uint64_t v24 = 3;
  uint64_t v27 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  char v28 = 0;
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v14, (uint64_t)v29, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v29[24] = 0;
  v29[25] = 1;
  memset(&v29[26], 0, 24);
  v29[29] = 1;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v33 = 0;
  uint64_t v34 = 1;
  char v35 = 0;
  uint64_t v36 = v11;
  uint64_t v37 = v8;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v40 = v9;
  swift_retain();
  outlined retain of SearchGlobalEntity(v15);
  EntityProperty.wrappedValue.setter();
  outlined release of SearchGlobalEntity(v15);
  outlined retain of SearchGlobalEntity(v15);
  EntityProperty.wrappedValue.setter();
  outlined release of SearchGlobalEntity(v15);
  outlined retain of SearchGlobalEntity(v15);
  UUID.init()();
  UUID.uuidString.getter();
  OUTLINED_FUNCTION_126();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_6_1();
  v10();
  EntityProperty.wrappedValue.setter();
  outlined release of SearchGlobalEntity(v15);
  outlined retain of SearchGlobalEntity(v15);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  EntityProperty.wrappedValue.setter();
  outlined release of SearchGlobalEntity(v15);
  memcpy(__dst, v13, 0x218uLL);
  OUTLINED_FUNCTION_39();
}

uint64_t SearchGlobalEntity.supportedTypeIdentifiersForExport.setter()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t SearchGlobalEntity.init(_:)@<X0>(void (*a1)(unsigned char *)@<X0>, uint64_t a2@<X8>)
{
  _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(v7);
  memset(__src, 0, 40);
  *(void *)&__src[40] = 0xF000000000000000;
  __src[48] = 3;
  memset(&__src[56], 0, 96);
  *(void *)&__src[152] = 3;
  memset(&__src[160], 0, 25);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v7, (uint64_t)&__src[192], &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  *(_OWORD *)&__src[384] = xmmword_2586F8230;
  memset(&__src[400], 0, 24);
  *(void *)&__src[424] = 1;
  memset(&__src[432], 0, 56);
  *(void *)&__src[488] = 1;
  __src[496] = 0;
  memset(&__src[504], 0, 32);
  memcpy(__dst, __src, sizeof(__dst));
  a1(__dst);
  SearchGlobalEntity.init(builder:)();
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v5, (uint64_t)v9, &demangling cache variable for type metadata for SearchGlobalEntity?);
  return outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v9, a2, &demangling cache variable for type metadata for SearchGlobalEntity?);
}

void *SearchGlobalEntity.Builder.init()@<X0>(void *a1@<X8>)
{
  _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(v3);
  memset(__src, 0, 40);
  *((void *)&__src[2] + 1) = 0xF000000000000000;
  LOBYTE(__src[3]) = 3;
  *(_OWORD *)((char *)&__src[3] + 8) = 0u;
  *(_OWORD *)((char *)&__src[4] + 8) = 0u;
  *(_OWORD *)((char *)&__src[5] + 8) = 0u;
  *(_OWORD *)((char *)&__src[6] + 8) = 0u;
  *(_OWORD *)((char *)&__src[7] + 8) = 0u;
  *(_OWORD *)((char *)&__src[8] + 8) = 0u;
  *((void *)&__src[9] + 1) = 3;
  memset(&__src[10], 0, 25);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v3, (uint64_t)&__src[12], &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  __src[24] = xmmword_2586F8230;
  memset(&__src[25], 0, 24);
  *((void *)&__src[26] + 1) = 1;
  memset(&__src[27], 0, 56);
  *((void *)&__src[30] + 1) = 1;
  LOBYTE(__src[31]) = 0;
  *(_OWORD *)((char *)&__src[31] + 8) = 0u;
  *(_OWORD *)((char *)&__src[32] + 8) = 0u;
  return memcpy(a1, __src, 0x218uLL);
}

void SearchGlobalEntity.init(builder:)()
{
  OUTLINED_FUNCTION_33();
  uint64_t v2 = v1;
  uint64_t v52 = v3;
  uint64_t v4 = type metadata accessor for LocalizedStringResource();
  uint64_t v5 = OUTLINED_FUNCTION_45(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_42();
  memcpy(v62, v2, 0x218uLL);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<String>);
  OUTLINED_FUNCTION_16();
  uint64_t v6 = MEMORY[0x25A2C96A0](v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<String?>);
  uint64_t v59 = v6;
  swift_retain();
  OUTLINED_FUNCTION_21();
  uint64_t v7 = MEMORY[0x25A2C96A0](v0);
  swift_retain();
  OUTLINED_FUNCTION_16();
  uint64_t v8 = MEMORY[0x25A2C96A0](v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<IntentFile?>);
  swift_retain();
  OUTLINED_FUNCTION_16();
  uint64_t v9 = MEMORY[0x25A2C9690](v0);
  swift_retain();
  OUTLINED_FUNCTION_16();
  uint64_t v10 = MEMORY[0x25A2C96A0](v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<[String]>);
  swift_retain();
  OUTLINED_FUNCTION_21();
  uint64_t v11 = MEMORY[0x25A2C96A0](v0);
  if (*((void *)&v62[0] + 1))
  {
    uint64_t v50 = *(void *)&v62[0];
    uint64_t v54 = *((void *)&v62[4] + 1);
    uint64_t v55 = *(void *)&v62[5];
    uint64_t v56 = *((void *)&v62[6] + 1);
    long long v57 = v62[7];
    uint64_t v58 = *((void *)&v62[5] + 1);
    uint64_t v49 = *((void *)&v62[0] + 1);
    long long v12 = v62[24];
    uint64_t v53 = *(void *)&v62[6];
    long long v13 = v62[25];
    long long v14 = v62[26];
    long long v15 = v62[27];
    long long v16 = v62[28];
    long long v17 = v62[29];
    uint64_t v47 = *(void *)&v62[30];
    uint64_t v48 = v11;
    uint64_t v18 = *((void *)&v62[30] + 1);
    uint64_t v45 = *((void *)&v62[30] + 1);
    v61[32] = v62[3];
    char v44 = v62[31];
    *(void *)&v61[152] = *(void *)&v62[11];
    v61[160] = BYTE8(v62[11]);
    uint64_t v19 = v10;
    uint64_t v46 = *((void *)&v62[31] + 1);
    uint64_t v43 = *(void *)&v62[32];
    *(void *)uint64_t v61 = v59;
    *(void *)&v61[8] = v7;
    *(_OWORD *)&v61[16] = v62[2];
    uint64_t v20 = *(void *)&v62[2];
    long long v51 = v62[2];
    unint64_t v21 = *((void *)&v62[2] + 1);
    *(void *)&v61[40] = v8;
    *(void *)&v61[48] = *((void *)&v62[4] + 1);
    *(_OWORD *)&v61[56] = v62[5];
    *(_OWORD *)&v61[72] = v62[6];
    *(_OWORD *)&v61[88] = v62[7];
    *(_OWORD *)&v61[104] = v62[8];
    *(_OWORD *)&v61[120] = v62[9];
    *(_OWORD *)&v61[136] = v62[10];
    uint64_t v22 = *((void *)&v62[32] + 1);
    uint64_t v42 = *(void *)&v62[33];
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v62[12], (uint64_t)&v61[168], &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    *(_OWORD *)&v61[360] = v12;
    *(_OWORD *)&v61[376] = v13;
    *(_OWORD *)&v61[392] = v14;
    *(_OWORD *)&v61[408] = v15;
    *(_OWORD *)&v61[424] = v16;
    *(_OWORD *)&v61[440] = v17;
    *(void *)&v61[456] = v47;
    *(void *)&v61[464] = v18;
    v61[472] = v44;
    *(void *)&v61[480] = v9;
    *(void *)&v61[488] = v19;
    *(void *)&v61[496] = v46;
    *(void *)&v61[504] = v43;
    *(void *)&v61[512] = v22;
    *(void *)&v61[520] = v42;
    *(void *)&v61[528] = v48;
    *(void *)uint64_t v60 = v50;
    *(void *)&v60[8] = v49;
    outlined copy of Data?(v20, v21);
    outlined copy of SearchGlobalEntity.GeneralAttributes?(v54, v55, v58, v53, v56, v57, *((unint64_t *)&v57 + 1));
    swift_bridgeObjectRetain();
    outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v62[12]);
    outlined copy of SearchGlobalEntity.IDAttributes?(v12, *((uint64_t *)&v12 + 1));
    outlined copy of SearchGlobalEntity.ContactAttributes?(v14, *((uint64_t *)&v14 + 1));
    outlined copy of SearchGlobalEntity.AppStoreAttributes?(v47, v45);
    outlined copy of GlobalDialog?(v46, v43);
    outlined copy of Data?(v51, *((unint64_t *)&v51 + 1));
    uint64_t v23 = OUTLINED_FUNCTION_57();
    outlined copy of SearchGlobalEntity.GeneralAttributes?(v23, v24, v25, v26, v27, v28, v29);
    swift_bridgeObjectRetain();
    outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v62[12]);
    outlined copy of SearchGlobalEntity.IDAttributes?(v12, *((uint64_t *)&v12 + 1));
    outlined copy of SearchGlobalEntity.ContactAttributes?(v14, *((uint64_t *)&v14 + 1));
    outlined copy of SearchGlobalEntity.AppStoreAttributes?(v47, v45);
    outlined copy of GlobalDialog?(v46, v43);
    swift_retain();
    swift_bridgeObjectRetain();
    outlined retain of SearchGlobalEntity(v61);
    EntityProperty.wrappedValue.setter();
    outlined release of SearchGlobalEntity(v61);
    *(_OWORD *)uint64_t v60 = v62[1];
    outlined retain of SearchGlobalEntity(v61);
    swift_bridgeObjectRetain();
    EntityProperty.wrappedValue.setter();
    outlined release of SearchGlobalEntity(v61);
    *(void *)uint64_t v60 = *((void *)&v62[3] + 1);
    *(void *)&v60[8] = *(void *)&v62[4];
    outlined retain of SearchGlobalEntity(v61);
    swift_bridgeObjectRetain();
    EntityProperty.wrappedValue.setter();
    outlined release of SearchGlobalEntity.Builder(v62);
    outlined release of SearchGlobalEntity(v61);
    memcpy(v60, v61, sizeof(v60));
    outlined retain of SearchGlobalEntity(v61);
    SearchGlobalEntity.validTypeIdentifiers.getter();
    *(void *)uint64_t v60 = v30;
    EntityProperty.wrappedValue.setter();
    outlined release of SearchGlobalEntity(v61);
    outlined retain of SearchGlobalEntity(v61);
    swift_release();
    outlined consume of GlobalDialog?(v46, v43);
    swift_release();
    swift_release();
    outlined consume of SearchGlobalEntity.AppStoreAttributes?(v47, v45);
    outlined consume of SearchGlobalEntity.ContactAttributes?(v14, *((uint64_t *)&v14 + 1));
    outlined consume of SearchGlobalEntity.IDAttributes?(v12, *((uint64_t *)&v12 + 1));
    outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v62[12]);
    swift_bridgeObjectRelease();
    uint64_t v31 = OUTLINED_FUNCTION_57();
    outlined consume of SearchGlobalEntity.GeneralAttributes?(v31, v32, v33, v34, v35, v36, v37);
    swift_release();
    outlined consume of Data?(v51, *((unint64_t *)&v51 + 1));
    swift_release();
    swift_release();
    memcpy(v52, v61, 0x218uLL);
    destructiveProjectEnumData for EntityProperty<>.CodingKeys(v52);
    outlined release of SearchGlobalEntity(v61);
  }
  else
  {
    outlined release of SearchGlobalEntity.Builder(v62);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    if (one-time initialization token for search != -1) {
      swift_once();
    }
    uint64_t v38 = type metadata accessor for Logger();
    __swift_project_value_buffer(v38, (uint64_t)static Logging.search);
    long long v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_2586D1000, v39, v40, "Attempting to create SearchGlobalEntity without id", v41, 2u);
      OUTLINED_FUNCTION_7();
    }

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    outlined consume of GlobalDialog?(0, 0);
    swift_release();
    _s15OmniSearchTypes0B12GlobalEntityVSgWOi0_(v61);
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v61, (uint64_t)v52, &demangling cache variable for type metadata for SearchGlobalEntity?);
  }
  OUTLINED_FUNCTION_39();
}

void SearchGlobalEntity.validTypeIdentifiers.getter()
{
  OUTLINED_FUNCTION_33();
  uint64_t v2 = type metadata accessor for UTType();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_14_0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  uint64_t v5 = OUTLINED_FUNCTION_45(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_97();
  memcpy(v18, v0, sizeof(v18));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2586F8240;
  outlined retain of SearchGlobalEntity(v18);
  EntityProperty.wrappedValue.getter();
  outlined release of SearchGlobalEntity(v18);
  uint64_t v7 = type metadata accessor for IntentFile();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v7);
  _s10AppIntents10IntentFileVSgWOhTm_0(v1, &demangling cache variable for type metadata for IntentFile?);
  if (EnumTagSinglePayload == 1)
  {
    *(void *)(inited + 32) = 0;
    *(void *)(inited + 40) = 0;
  }
  else
  {
    if (one-time initialization token for searchToolExportedExperiences != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v2, (uint64_t)static UTType.searchToolExportedExperiences);
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_106();
    v9();
    uint64_t v10 = UTType.identifier.getter();
    uint64_t v12 = v11;
    OUTLINED_FUNCTION_30();
    v13();
    *(void *)(inited + 32) = v10;
    *(void *)(inited + 40) = v12;
    swift_bridgeObjectRetain();
    long long v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v16 = *((void *)v14 + 2);
    unint64_t v15 = *((void *)v14 + 3);
    if (v16 >= v15 >> 1) {
      long long v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v15 > 1), v16 + 1, 1, (uint64_t)v14);
    }
    *((void *)v14 + 2) = v16 + 1;
    long long v17 = &v14[16 * v16];
    *((void *)v17 + 4) = v10;
    *((void *)v17 + 5) = v12;
  }
  swift_release();
  OUTLINED_FUNCTION_39();
}

uint64_t SearchGlobalEntity.Builder.id.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.Builder.id.setter()
{
  uint64_t result = OUTLINED_FUNCTION_34();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.id.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.domain.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.Builder.domain.setter()
{
  uint64_t result = OUTLINED_FUNCTION_51();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.domain.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.searchID.getter()
{
  outlined copy of Data?(*(void *)(v0 + 32), *(void *)(v0 + 40));
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.Builder.searchID.setter()
{
  OUTLINED_FUNCTION_27();
  uint64_t result = outlined consume of Data?(*(void *)(v1 + 32), *(void *)(v1 + 40));
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.searchID.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

void SearchGlobalEntity.Builder.entityType.getter(unsigned char *a1@<X8>)
{
}

unsigned char *SearchGlobalEntity.Builder.entityType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 48) = *result;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.entityType.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.text.getter()
{
  return OUTLINED_FUNCTION_4_1();
}

uint64_t SearchGlobalEntity.Builder.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.text.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.generalAttributes.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_109();
  return OUTLINED_FUNCTION_70(v0, v1, v2, v3, v4, v5, v6, v7, v8);
}

__n128 SearchGlobalEntity.Builder.generalAttributes.setter(long long *a1)
{
  long long v14 = *a1;
  long long v12 = a1[2];
  long long v13 = a1[1];
  __n128 v11 = (__n128)a1[3];
  uint64_t v2 = *((void *)a1 + 8);
  uint64_t v3 = OUTLINED_FUNCTION_109();
  outlined consume of SearchGlobalEntity.GeneralAttributes?(v3, v4, v5, v6, v7, v8, v9);
  *(_OWORD *)(v1 + 72) = v14;
  *(_OWORD *)(v1 + 88) = v13;
  *(_OWORD *)(v1 + 104) = v12;
  __n128 result = v11;
  *(__n128 *)(v1 + 120) = v11;
  *(void *)(v1 + 136) = v2;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.generalAttributes.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.customAttributes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SearchGlobalEntity.Builder.customAttributes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 144) = a1;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.customAttributes.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

void SearchGlobalEntity.Builder.eventAttributes.getter(_OWORD *a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 168);
  *a1 = *(_OWORD *)(v1 + 152);
  a1[1] = v2;
  OUTLINED_FUNCTION_88((uint64_t)a1);
}

__n128 SearchGlobalEntity.Builder.eventAttributes.setter(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 32);
  __n128 result = *(__n128 *)a1;
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 152) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 168) = v4;
  *(unsigned char *)(v1 + 184) = v2;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.eventAttributes.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.placeAttributes.getter@<X0>(uint64_t a1@<X8>)
{
  outlined init with take of SearchGlobalEntity.PlaceAttributes?(v1 + 192, (uint64_t)v4, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v4, a1, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  return outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v4);
}

uint64_t SearchGlobalEntity.Builder.placeAttributes.setter(uint64_t a1)
{
  outlined init with take of SearchGlobalEntity.PlaceAttributes?(a1, (uint64_t)v4, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  uint64_t v2 = v1 + 192;
  outlined init with take of SearchGlobalEntity.PlaceAttributes?(v2, (uint64_t)v5, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v5);
  return outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v4, v2, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
}

uint64_t (*SearchGlobalEntity.Builder.placeAttributes.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.idAttributes.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_53(v1[48], v1[49], v1[50], v1[51], a1);
}

__n128 SearchGlobalEntity.Builder.idAttributes.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_81(a1);
  outlined consume of SearchGlobalEntity.IDAttributes?(v2[48], v2[49]);
  __n128 result = v5;
  *((__n128 *)v2 + 24) = v5;
  v2[50] = v1;
  v2[51] = v3;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.idAttributes.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.contactAttributes.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_35(v1[52], v1[53], v1[54], v1[55], v1[56], v1[57], v1[58], v1[59], a1);
}

__n128 SearchGlobalEntity.Builder.contactAttributes.setter(long long *a1)
{
  long long v6 = a1[1];
  long long v7 = *a1;
  __n128 v5 = (__n128)a1[2];
  uint64_t v2 = *((void *)a1 + 6);
  uint64_t v3 = *((void *)a1 + 7);
  outlined consume of SearchGlobalEntity.ContactAttributes?(*(void *)(v1 + 416), *(void *)(v1 + 424));
  *(_OWORD *)(v1 + 416) = v7;
  *(_OWORD *)(v1 + 432) = v6;
  __n128 result = v5;
  *(__n128 *)(v1 + 448) = v5;
  *(void *)(v1 + 464) = v2;
  *(void *)(v1 + 472) = v3;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.contactAttributes.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.appstoreAttributes.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_71(*(void *)(v1 + 480), *(void *)(v1 + 488), a1);
}

uint64_t SearchGlobalEntity.Builder.appstoreAttributes.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = outlined consume of SearchGlobalEntity.AppStoreAttributes?(*(void *)(v1 + 480), *(void *)(v1 + 488));
  *(void *)(v1 + 480) = v2;
  *(void *)(v1 + 488) = v3;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.appstoreAttributes.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.lowConfidenceKnowledge.getter()
{
  return *(unsigned __int8 *)(v0 + 496);
}

uint64_t SearchGlobalEntity.Builder.lowConfidenceKnowledge.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 496) = result;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.lowConfidenceKnowledge.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t SearchGlobalEntity.Builder.dialog.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_52(v1[63], v1[64], v1[65], v1[66], a1);
}

__n128 SearchGlobalEntity.Builder.dialog.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_81(a1);
  outlined consume of GlobalDialog?(v2[63], v2[64]);
  __n128 result = v5;
  *(__n128 *)(v2 + 63) = v5;
  v2[65] = v1;
  v2[66] = v3;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.dialog.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

uint64_t default argument 12 of SearchGlobalEntity.Builder.init(id:domain:searchID:entityType:text:generalAttributes:customAttributes:eventAttributes:placeAttributes:idAttributes:contactAttributes:appstoreAttributes:lowConfidenceKnowledge:dialog:)()
{
  return 0;
}

void SearchGlobalEntity.Builder.init(id:domain:searchID:entityType:text:generalAttributes:customAttributes:eventAttributes:placeAttributes:idAttributes:contactAttributes:appstoreAttributes:lowConfidenceKnowledge:dialog:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,long long *a22,uint64_t a23,long long *a24,uint64_t a25,long long *a26,long long *a27,uint64_t *a28,char a29,long long *a30)
{
  OUTLINED_FUNCTION_33();
  uint64_t v68 = v30;
  uint64_t v69 = v31;
  uint64_t v66 = v32;
  uint64_t v67 = v33;
  uint64_t v64 = v34;
  uint64_t v65 = v35;
  uint64_t v63 = v36;
  uint64_t v38 = v37;
  char v40 = *v39;
  long long v55 = a22[1];
  long long v56 = *a22;
  long long v53 = a22[3];
  long long v54 = a22[2];
  uint64_t v41 = *((void *)a22 + 8);
  long long v59 = *a24;
  uint64_t v57 = *((void *)a24 + 3);
  uint64_t v58 = *((void *)a24 + 2);
  char v62 = *((unsigned char *)a24 + 32);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?(a25, (uint64_t)v70, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  uint64_t v43 = *((void *)a26 + 2);
  uint64_t v42 = *((void *)a26 + 3);
  long long v51 = *a27;
  long long v52 = *a26;
  long long v49 = a27[2];
  long long v50 = a27[1];
  uint64_t v45 = *((void *)a27 + 6);
  uint64_t v44 = *((void *)a27 + 7);
  uint64_t v46 = *a28;
  uint64_t v47 = a28[1];
  long long v61 = *a30;
  uint64_t v48 = *((void *)a30 + 3);
  uint64_t v60 = *((void *)a30 + 2);
  *(void *)uint64_t v38 = v63;
  *(void *)(v38 + 8) = v64;
  *(void *)(v38 + 16) = v65;
  *(void *)(v38 + 24) = v66;
  *(void *)(v38 + 32) = v67;
  *(void *)(v38 + 40) = v68;
  *(unsigned char *)(v38 + 48) = v40;
  *(void *)(v38 + 56) = v69;
  *(void *)(v38 + 64) = a21;
  *(_OWORD *)(v38 + 72) = v56;
  *(_OWORD *)(v38 + 88) = v55;
  *(_OWORD *)(v38 + 104) = v54;
  *(_OWORD *)(v38 + 120) = v53;
  *(void *)(v38 + 136) = v41;
  *(void *)(v38 + 144) = a23;
  *(_OWORD *)(v38 + 152) = v59;
  *(void *)(v38 + 168) = v58;
  *(void *)(v38 + 176) = v57;
  *(unsigned char *)(v38 + 184) = v62;
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v70, v38 + 192, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  *(_OWORD *)(v38 + 384) = v52;
  *(void *)(v38 + 400) = v43;
  *(void *)(v38 + 408) = v42;
  *(_OWORD *)(v38 + 416) = v51;
  *(_OWORD *)(v38 + 432) = v50;
  *(_OWORD *)(v38 + 448) = v49;
  *(void *)(v38 + 464) = v45;
  *(void *)(v38 + 472) = v44;
  *(void *)(v38 + 480) = v46;
  *(void *)(v38 + 488) = v47;
  *(unsigned char *)(v38 + 496) = a29;
  *(_OWORD *)(v38 + 504) = v61;
  *(void *)(v38 + 520) = v60;
  *(void *)(v38 + 528) = v48;
  OUTLINED_FUNCTION_39();
}

uint64_t one-time initialization function for typeDisplayRepresentation()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LocalizedStringResource?);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for LocalizedStringResource();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = type metadata accessor for TypeDisplayRepresentation();
  __swift_allocate_value_buffer(v4, static SearchGlobalEntity.typeDisplayRepresentation);
  __swift_project_value_buffer(v4, (uint64_t)static SearchGlobalEntity.typeDisplayRepresentation);
  LocalizedStringResource.init(stringLiteral:)();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LocalizedStringResource?);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for LocalizedStringResource();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = type metadata accessor for TypeDisplayRepresentation();
  __swift_allocate_value_buffer(v4, static SearchResultType.typeDisplayRepresentation);
  __swift_project_value_buffer(v4, (uint64_t)static SearchResultType.typeDisplayRepresentation);
  LocalizedStringResource.init(stringLiteral:)();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t static SearchGlobalEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for typeDisplayRepresentation != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchGlobalEntity.typeDisplayRepresentation);
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_46();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, v3, v2);
}

uint64_t static SearchGlobalEntity.typeDisplayRepresentation.setter(uint64_t a1)
{
  if (one-time initialization token for typeDisplayRepresentation != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchGlobalEntity.typeDisplayRepresentation);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 24))(v3, a1, v2);
  swift_endAccess();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_26();
  return v4();
}

uint64_t (*static SearchGlobalEntity.typeDisplayRepresentation.modify())()
{
  if (one-time initialization token for typeDisplayRepresentation != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for TypeDisplayRepresentation();
  __swift_project_value_buffer(v0, (uint64_t)static SearchGlobalEntity.typeDisplayRepresentation);
  swift_beginAccess();
  return MemoryCreationQUPerformanceMetrics.llmQUModelLatency.modify;
}

void SearchGlobalEntity.displayRepresentation.getter()
{
  OUTLINED_FUNCTION_33();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DisplayRepresentation.Image?);
  uint64_t v4 = OUTLINED_FUNCTION_45(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_9_0();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LocalizedStringResource?);
  uint64_t v6 = OUTLINED_FUNCTION_45(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_14_0();
  uint64_t v7 = type metadata accessor for LocalizedStringResource();
  OUTLINED_FUNCTION_46();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_13_0();
  uint64_t v9 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  uint64_t v10 = OUTLINED_FUNCTION_45(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_43();
  memcpy(v21, v0, 0x218uLL);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v11._object = (void *)0x80000002586FA840;
  v11._uint64_t countAndFlagsBits = 0xD000000000000018;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v11);
  outlined retain of SearchGlobalEntity(v21);
  EntityProperty.wrappedValue.getter();
  outlined release of SearchGlobalEntity(v21);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  v12._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v12);
  swift_bridgeObjectRelease();
  v13._uint64_t countAndFlagsBits = 0xD000000000000020;
  v13._object = (void *)0x80000002586FA860;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v13);
  outlined retain of SearchGlobalEntity(v21);
  EntityProperty.wrappedValue.getter();
  outlined release of SearchGlobalEntity(v21);
  if (v20) {
    uint64_t v14 = v19;
  }
  else {
    uint64_t v14 = 7104878;
  }
  if (v20) {
    unint64_t v15 = v20;
  }
  else {
    unint64_t v15 = 0xE300000000000000;
  }
  unint64_t v16 = v15;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(*(Swift::String *)&v14);
  swift_bridgeObjectRelease();
  v17._uint64_t countAndFlagsBits = 34;
  v17._object = (void *)0xE100000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v17);
  LocalizedStringResource.init(stringInterpolation:)();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v7);
  uint64_t v18 = type metadata accessor for DisplayRepresentation.Image();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  OUTLINED_FUNCTION_39();
}

uint64_t SearchGlobalEntity.Query.entities(for:)()
{
  return SearchGlobalEntity.Query.entities(for:)(*(uint64_t (**)(uint64_t))(v0 + 8), v0, MEMORY[0x263F8EE78]);
}

uint64_t protocol witness for EntityQuery.entities(for:) in conformance SearchGlobalEntity.Query()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = protocol witness for EntityQuery.entities(for:) in conformance SearchGlobalEntity.Query;
  return SearchGlobalEntity.Query.entities(for:)();
}

uint64_t protocol witness for EntityQuery.entities(for:) in conformance SearchGlobalEntity.Query(uint64_t a1)
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v4 = *v2;
  OUTLINED_FUNCTION_59();
  *uint64_t v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v1) {
    uint64_t v6 = a1;
  }
  return v7(v6);
}

uint64_t protocol witness for EntityQuery.suggestedEntities() in conformance SearchGlobalEntity.Query(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for EntityQuery.suggestedEntities() in conformance SearchGlobalEntity.Query;
  return MEMORY[0x270EE0E30](a1, a2, a3);
}

uint64_t protocol witness for EntityQuery.suggestedEntities() in conformance SearchGlobalEntity.Query()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_59();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t protocol witness for DynamicOptionsProvider.results() in conformance SearchGlobalEntity.Query(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = lazy protocol witness table accessor for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query();
  *uint64_t v5 = v2;
  v5[1] = protocol witness for DynamicOptionsProvider.results() in conformance SearchGlobalEntity.Query;
  return MEMORY[0x270EE0E40](a1, a2, v6);
}

uint64_t protocol witness for DynamicOptionsProvider.defaultResult() in conformance SearchGlobalEntity.Query(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for EntityQuery.suggestedEntities() in conformance SearchGlobalEntity.Query;
  return MEMORY[0x270EE1A10](a1, a2, a3);
}

uint64_t protocol witness for static PersistentlyIdentifiable.persistentIdentifier.getter in conformance SearchGlobalEntity.Query()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t (*static SearchGlobalEntity.defaultQuery.modify())()
{
  return destructiveProjectEnumData for EntityProperty<>.CodingKeys;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SearchGlobalEntity.validateParameters()()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v17 = v2;
  uint64_t v18 = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  uint64_t v5 = OUTLINED_FUNCTION_45(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_13_0();
  memcpy(v15, v0, 0x218uLL);
  outlined retain of SearchGlobalEntity(v15);
  EntityProperty.wrappedValue.getter();
  outlined release of SearchGlobalEntity(v15);
  uint64_t v6 = type metadata accessor for IntentFile();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v6);
  _s10AppIntents10IntentFileVSgWOhTm_0(v1, &demangling cache variable for type metadata for IntentFile?);
  if (EnumTagSinglePayload == 1)
  {
    if (one-time initialization token for search != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Logging.search);
    outlined retain of SearchGlobalEntity(v15);
    outlined retain of SearchGlobalEntity(v15);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      Swift::String v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v16[0] = v12;
      *(_DWORD *)Swift::String v11 = 136315138;
      uint64_t v13 = specialized Encodable.jsonPrettyPrinted()();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined release of SearchGlobalEntity(v15);
      outlined release of SearchGlobalEntity(v15);
      _os_log_impl(&dword_2586D1000, v9, v10, "Missing experience for globalEntity: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2CA650](v12, -1, -1);
      MEMORY[0x25A2CA650](v11, -1, -1);
    }
    else
    {
      outlined release of SearchGlobalEntity(v15);
      outlined release of SearchGlobalEntity(v15);
    }
  }
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_2_0();
}

uint64_t SearchGlobalEntity.supportedTypeIdentifiersForExport.getter()
{
  EntityProperty.wrappedValue.getter();
  return v1;
}

uint64_t key path setter for SearchGlobalEntity.supportedTypeIdentifiersForExport : SearchGlobalEntity()
{
  return SearchGlobalEntity.supportedTypeIdentifiersForExport.setter();
}

uint64_t (*SearchGlobalEntity.supportedTypeIdentifiersForExport.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_69((uint64_t)v1);
  *(void *)(v0 + 32) = EntityProperty.wrappedValue.modify();
  return SearchGlobalEntity.id.modify;
}

void SearchGlobalEntity.id.modify(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t SearchGlobalEntity.$supportedTypeIdentifiersForExport.getter()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t static SearchGlobalEntity.transferRepresentation.getter()
{
  uint64_t v1 = type metadata accessor for UTType();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_42();
  if (one-time initialization token for searchToolExportedExperiences != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v1, (uint64_t)static UTType.searchToolExportedExperiences);
  OUTLINED_FUNCTION_107();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v5, v1);
  lazy protocol witness table accessor for type SearchGlobalEntity and conformance SearchGlobalEntity();
  return DataRepresentation.init(exportedContentType:exporting:)();
}

void static SearchGlobalEntity.== infix(_:_:)()
{
  OUTLINED_FUNCTION_33();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  unint64_t v4 = *(void *)(v2 + 24);
  uint64_t v119 = *(void *)(v2 + 16);
  int v118 = *(unsigned __int8 *)(v2 + 32);
  uint64_t v115 = *(void *)(v2 + 56);
  uint64_t v110 = *(void *)(v2 + 64);
  uint64_t v111 = *(void *)(v2 + 72);
  uint64_t v117 = *(void *)(v2 + 80);
  uint64_t v112 = *(void *)(v2 + 88);
  unint64_t v113 = *(void *)(v2 + 96);
  uint64_t v116 = *(void *)(v2 + 104);
  uint64_t v108 = *(void *)(v2 + 112);
  uint64_t v109 = *(void *)(v2 + 48);
  uint64_t v99 = *(void *)(v2 + 120);
  uint64_t v97 = *(void *)(v2 + 128);
  uint64_t v94 = *(void *)(v2 + 144);
  uint64_t v95 = *(void *)(v2 + 136);
  uint64_t v93 = *(void *)(v2 + 152);
  char v92 = *(unsigned char *)(v2 + 160);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?(v2 + 168, (uint64_t)v153, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  uint64_t v84 = *(void *)(v3 + 360);
  uint64_t v82 = *(void *)(v3 + 376);
  uint64_t v86 = *(void *)(v3 + 384);
  uint64_t v87 = *(void *)(v3 + 368);
  unint64_t v74 = *(void *)(v3 + 408);
  unint64_t v75 = *(void *)(v3 + 392);
  unint64_t v78 = *(void *)(v3 + 416);
  uint64_t v79 = *(void *)(v3 + 400);
  unint64_t v72 = *(void *)(v3 + 440);
  unint64_t v73 = *(void *)(v3 + 424);
  unint64_t v76 = *(void *)(v3 + 448);
  unint64_t v77 = *(void *)(v3 + 432);
  uint64_t v55 = *(void *)(v3 + 456);
  uint64_t v71 = *(void *)(v3 + 464);
  HIDWORD(v53) = *(unsigned __int8 *)(v3 + 472);
  uint64_t v52 = *(void *)(v3 + 480);
  uint64_t v48 = *(void *)(v3 + 488);
  uint64_t v50 = *(void *)(v3 + 504);
  uint64_t v43 = *(void *)(v3 + 512);
  uint64_t v45 = *(void *)(v3 + 496);
  uint64_t v46 = *(void *)(v3 + 520);
  uint64_t v40 = *(void *)(v3 + 528);
  uint64_t v5 = *(void *)(v1 + 16);
  unint64_t v6 = *(void *)(v1 + 24);
  int v7 = *(unsigned __int8 *)(v1 + 32);
  uint64_t v114 = *(void *)(v1 + 48);
  uint64_t v101 = *(void *)(v1 + 56);
  uint64_t v102 = *(void *)(v1 + 64);
  uint64_t v103 = *(void *)(v1 + 72);
  uint64_t v104 = *(void *)(v1 + 80);
  uint64_t v105 = *(void *)(v1 + 88);
  unint64_t v106 = *(void *)(v1 + 96);
  uint64_t v107 = *(void *)(v1 + 104);
  uint64_t v100 = *(void *)(v1 + 112);
  uint64_t v98 = *(void *)(v1 + 120);
  uint64_t v96 = *(unsigned __int8 *)(v1 + 128);
  uint64_t v88 = *(void *)(v1 + 136);
  uint64_t v89 = *(void *)(v1 + 144);
  uint64_t v91 = *(void *)(v1 + 152);
  char v90 = *(unsigned char *)(v1 + 160);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?(v1 + 168, (uint64_t)v154, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  uint64_t v8 = *(void *)(v1 + 368);
  uint64_t v83 = *(void *)(v1 + 360);
  uint64_t v85 = *(void *)(v1 + 384);
  uint64_t v80 = *(void *)(v1 + 400);
  uint64_t v81 = *(void *)(v1 + 376);
  uint64_t v57 = *(void *)(v1 + 392);
  uint64_t v59 = *(void *)(v1 + 408);
  uint64_t v61 = *(void *)(v1 + 416);
  uint64_t v63 = *(void *)(v1 + 424);
  uint64_t v65 = *(void *)(v1 + 432);
  uint64_t v67 = *(void *)(v1 + 440);
  uint64_t v69 = *(void *)(v1 + 448);
  uint64_t v54 = *(void *)(v1 + 456);
  uint64_t v56 = *(void *)(v1 + 464);
  LODWORD(v53) = *(unsigned __int8 *)(v1 + 472);
  uint64_t v51 = *(void *)(v1 + 480);
  uint64_t v47 = *(void *)(v1 + 488);
  uint64_t v44 = *(void *)(v1 + 496);
  uint64_t v49 = *(void *)(v1 + 504);
  uint64_t v41 = *(void *)(v1 + 512);
  uint64_t v42 = *(void *)(v1 + 520);
  if ((specialized static EntityProperty<>.== infix(_:_:)() & 1) == 0
    || (specialized static EntityProperty<>.== infix(_:_:)() & 1) == 0)
  {
    goto LABEL_8;
  }
  if (v4 >> 60 == 15)
  {
    if (v6 >> 60 == 15) {
      goto LABEL_10;
    }
LABEL_7:
    outlined copy of Data?(v119, v4);
    outlined copy of Data?(v5, v6);
    outlined consume of Data?(v119, v4);
    outlined consume of Data?(v5, v6);
    goto LABEL_8;
  }
  if (v6 >> 60 == 15) {
    goto LABEL_7;
  }
  outlined copy of Data?(v119, v4);
  outlined copy of Data?(v5, v6);
  char v9 = MEMORY[0x25A2C98B0](v119, v4, v5, v6);
  outlined consume of Data?(v5, v6);
  outlined consume of Data?(v119, v4);
  if ((v9 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_10:
  if (v118 == 3)
  {
    if (v7 != 3) {
      goto LABEL_8;
    }
  }
  else if (v7 == 3 || v118 != v7)
  {
    goto LABEL_8;
  }
  if ((specialized static EntityProperty<>.== infix(_:_:)() & 1) == 0) {
    goto LABEL_8;
  }
  if (!v109)
  {
    uint64_t v16 = v116;
    unint64_t v13 = v113;
    uint64_t v12 = v112;
    uint64_t v17 = v117;
    uint64_t v18 = v111;
    uint64_t v11 = v110;
    uint64_t v19 = v115;
    uint64_t v14 = v108;
    uint64_t v20 = v114;
    if (!v114) {
      goto LABEL_24;
    }
LABEL_29:
    uint64_t v125 = v109;
    uint64_t v126 = v19;
    uint64_t v127 = v11;
    uint64_t v128 = v18;
    uint64_t v129 = v17;
    uint64_t v130 = v12;
    unint64_t v131 = v13;
    uint64_t v132 = v16;
    uint64_t v133 = v14;
    uint64_t v134 = v20;
    uint64_t v135 = v101;
    uint64_t v136 = v102;
    uint64_t v137 = v103;
    uint64_t v138 = v104;
    uint64_t v139 = v105;
    unint64_t v140 = v106;
    uint64_t v141 = v107;
    uint64_t v142 = v100;
    outlined copy of SearchGlobalEntity.GeneralAttributes?(v20, v101, v102, v103, v104, v105, v106);
    outlined release of (SearchGlobalEntity.GeneralAttributes?, SearchGlobalEntity.GeneralAttributes?)(&v125);
    goto LABEL_8;
  }
  uint64_t v125 = v109;
  uint64_t v126 = v115;
  uint64_t v11 = v110;
  uint64_t v127 = v110;
  uint64_t v128 = v111;
  uint64_t v129 = v117;
  uint64_t v12 = v112;
  uint64_t v130 = v112;
  unint64_t v13 = v113;
  unint64_t v131 = v113;
  uint64_t v132 = v116;
  uint64_t v14 = v108;
  uint64_t v133 = v108;
  if (!v114)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_49();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_49();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of Data?(v112, v113);
    swift_bridgeObjectRelease();
    uint64_t v20 = 0;
    uint64_t v17 = v117;
    uint64_t v18 = v111;
    uint64_t v19 = v115;
    uint64_t v16 = v116;
    goto LABEL_29;
  }
  uint64_t v144 = v114;
  uint64_t v145 = v101;
  uint64_t v146 = v102;
  uint64_t v147 = v103;
  uint64_t v148 = v104;
  uint64_t v149 = v105;
  unint64_t v150 = v106;
  uint64_t v151 = v107;
  uint64_t v152 = v100;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_49();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_49();
  char v15 = static SearchGlobalEntity.GeneralAttributes.== infix(_:_:)((uint64_t)&v125, (uint64_t)&v144);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(v112, v113);
  swift_bridgeObjectRelease();
  uint64_t v38 = v108;
  outlined consume of SearchGlobalEntity.GeneralAttributes?(v109, v115, v110, v111, v117, v112, v113);
  if ((v15 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_24:
  if (v99)
  {
    if (!v98) {
      goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    uint64_t v21 = swift_bridgeObjectRetain();
    char v22 = specialized static Array<A>.== infix(_:_:)(v21, v98);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else if (v98)
  {
    goto LABEL_8;
  }
  if (v97 == 3)
  {
    if (v96 != 3) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v125 = v97;
    uint64_t v126 = v95;
    uint64_t v127 = v94;
    uint64_t v128 = v93;
    LOBYTE(v129) = v92;
    if (v96 == 3) {
      goto LABEL_8;
    }
    LOBYTE(v144) = v96;
    uint64_t v145 = v88;
    LOBYTE(v146) = v89 & 1;
    uint64_t v147 = v91;
    LOBYTE(v148) = v90 & 1;
    if ((static SearchGlobalEntity.EventAttributes.== infix(_:_:)((unsigned __int8 *)&v125, (unsigned __int8 *)&v144) & 1) == 0) {
      goto LABEL_8;
    }
  }
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v153, (uint64_t)&v144, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  if (_s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOg((uint64_t)&v144) == 1)
  {
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v154, (uint64_t)&v125, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    uint64_t v23 = _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOg((uint64_t)&v125);
    if (v23 == 1) {
      goto LABEL_43;
    }
LABEL_41:
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v153, (uint64_t)&v125, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v154, (uint64_t)&v143, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v154);
    outlined release of (SearchGlobalEntity.PlaceAttributes?, SearchGlobalEntity.PlaceAttributes?)(&v125);
    goto LABEL_8;
  }
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v153, (uint64_t)__src, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v154, (uint64_t)&v125, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  if (_s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOg((uint64_t)&v125) == 1)
  {
    memcpy(__dst, __src, 0xB9uLL);
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v153, (uint64_t)v122, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v153, (uint64_t)v123, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    outlined retain of SearchGlobalEntity.PlaceAttributes((uint64_t)v123);
    outlined retain of SearchGlobalEntity.PlaceAttributes((uint64_t)v122);
    outlined release of SearchGlobalEntity.PlaceAttributes((uint64_t)__dst);
    goto LABEL_41;
  }
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v154, (uint64_t)__dst, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  memcpy(v120, __dst, 0xB9uLL);
  char v31 = static SearchGlobalEntity.PlaceAttributes.== infix(_:_:)((uint64_t)__src, (uint64_t)v120);
  memcpy(v122, __src, 0xB9uLL);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v153, (uint64_t)v123, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  outlined retain of SearchGlobalEntity.PlaceAttributes((uint64_t)v123);
  uint64_t v23 = outlined release of SearchGlobalEntity.PlaceAttributes((uint64_t)v122);
  if ((v31 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_43:
  if (v87 == 1)
  {
    if (v8 == 1) {
      goto LABEL_45;
    }
LABEL_50:
    outlined copy of SearchGlobalEntity.IDAttributes?(v83, v8);
    outlined consume of SearchGlobalEntity.IDAttributes?(v84, v87);
    outlined consume of SearchGlobalEntity.IDAttributes?(v83, v8);
    goto LABEL_8;
  }
  if (v8 == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_50;
  }
  if (v87)
  {
    if (!v8) {
      goto LABEL_8;
    }
    if (v84 != v83 || v87 != v8)
    {
      uint64_t v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((v23 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  else if (v8)
  {
    goto LABEL_8;
  }
  if (v86)
  {
    if (!v85) {
      goto LABEL_8;
    }
    if (v82 != v81 || v86 != v85)
    {
      uint64_t v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((v23 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  else if (v85)
  {
    goto LABEL_8;
  }
LABEL_45:
  if (v79 == 1)
  {
    if (v80 == 1) {
      goto LABEL_72;
    }
LABEL_61:
    OUTLINED_FUNCTION_18(v23, v24, v25, v26, v27, v28, v29, v30, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48,
      v49,
      v50,
      v51,
      v52,
      v53,
      v54,
      v55,
      v56,
      v57,
      v59,
      v61,
      v63,
      v65,
      v67,
      v69,
      v71,
      v72,
      v73,
      v74,
      v75,
      v76,
      v77,
      v78);
    uint64_t v133 = v58;
    uint64_t v134 = v80;
    uint64_t v135 = v60;
    uint64_t v136 = v62;
    uint64_t v137 = v64;
    uint64_t v138 = v66;
    uint64_t v139 = v68;
    unint64_t v140 = v70;
    outlined copy of SearchGlobalEntity.ContactAttributes?(v58, v80);
    outlined release of (SearchGlobalEntity.ContactAttributes?, SearchGlobalEntity.ContactAttributes?)(&v125);
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_18(v23, v24, v25, v26, v27, v28, v29, v30, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55,
    v56,
    v57,
    v59,
    v61,
    v63,
    v65,
    v67,
    v69,
    v71,
    v72,
    v73,
    v74,
    v75,
    v76,
    v77,
    v78);
  if (v80 == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v23 = swift_bridgeObjectRetain();
    goto LABEL_61;
  }
  __src[0] = v57;
  __src[1] = v80;
  void __src[2] = v59;
  __src[3] = v61;
  __src[4] = v63;
  __src[5] = v65;
  __src[6] = v67;
  __src[7] = v69;
  if ((static SearchGlobalEntity.ContactAttributes.== infix(_:_:)(&v125, __src) & 1) == 0) {
    goto LABEL_8;
  }
LABEL_72:
  if (v71 == 1)
  {
    if (v56 == 1) {
      goto LABEL_74;
    }
LABEL_92:
    outlined copy of SearchGlobalEntity.AppStoreAttributes?(v54, v56);
    outlined consume of SearchGlobalEntity.AppStoreAttributes?(v55, v71);
    outlined consume of SearchGlobalEntity.AppStoreAttributes?(v54, v56);
    goto LABEL_8;
  }
  if (v56 == 1)
  {
    swift_bridgeObjectRetain();
    goto LABEL_92;
  }
  if (v71)
  {
    if (!v56)
    {
      outlined copy of SearchGlobalEntity.AppStoreAttributes?(v55, v71);
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    if (v55 == v54 && v71 == v56)
    {
      outlined copy of SearchGlobalEntity.AppStoreAttributes?(v55, v71);
      swift_bridgeObjectRelease();
    }
    else
    {
      char v37 = _stringCompareWithSmolCheck(_:_:expecting:)();
      outlined copy of SearchGlobalEntity.AppStoreAttributes?(v55, v71);
      swift_bridgeObjectRelease();
      if ((v37 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  else if (v56)
  {
    goto LABEL_8;
  }
LABEL_74:
  if (HIDWORD(v53) != v53
    || (specialized static EntityProperty<>.== infix(_:_:)() & 1) == 0
    || (specialized static EntityProperty<>.== infix(_:_:)() & 1) == 0)
  {
    goto LABEL_8;
  }
  if (!v50)
  {
    if (!v49)
    {
LABEL_108:
      specialized static EntityProperty<>.== infix(_:_:)();
      goto LABEL_8;
    }
LABEL_110:
    outlined copy of GlobalDialog?(v44, v49);
    outlined consume of GlobalDialog?(v45, v50);
    outlined consume of GlobalDialog?(v44, v49);
    goto LABEL_8;
  }
  if (!v49)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_110;
  }
  BOOL v34 = v45 == v44 && v50 == v49;
  if (v34 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    BOOL v35 = v43 == v41 && v46 == v42;
    if (v35 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      goto LABEL_108;
    }
  }
LABEL_8:
  OUTLINED_FUNCTION_39();
}

uint64_t SearchGlobalEntity.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x4449686372616573 && a2 == 0xE800000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x7954797469746E65 && a2 == 0xEA00000000006570;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 1954047348 && a2 == 0xE400000000000000;
          if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000011 && a2 == 0x80000002586FA8D0 {
                 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          }
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x80000002586FA8F0 {
                 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          }
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            BOOL v10 = a1 == 0x747441746E657665 && a2 == 0xEF73657475626972;
            if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              BOOL v11 = a1 == 0x7474416563616C70 && a2 == 0xEF73657475626972;
              if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                BOOL v12 = a1 == 0x6269727474416469 && a2 == 0xEC00000073657475;
                if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else if (a1 == 0xD000000000000011 && a2 == 0x80000002586FA910 {
                       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                }
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else if (a1 == 0xD000000000000012 && a2 == 0x80000002586FA930 {
                       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                }
                {
                  swift_bridgeObjectRelease();
                  return 11;
                }
                else if (a1 == 0xD000000000000016 && a2 == 0x80000002586FA950 {
                       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                }
                {
                  swift_bridgeObjectRelease();
                  return 12;
                }
                else
                {
                  BOOL v13 = a1 == 0x6E65697265707865 && a2 == 0xEE00656C69466563;
                  if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 13;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x746169636F737361 && a2 == 0xEF79726575516465;
                    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 14;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x676F6C616964 && a2 == 0xE600000000000000;
                      if (v15 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 15;
                      }
                      else if (a1 == 0xD000000000000021 && a2 == 0x80000002586FA970)
                      {
                        swift_bridgeObjectRelease();
                        return 16;
                      }
                      else
                      {
                        char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
                        swift_bridgeObjectRelease();
                        if (v16) {
                          return 16;
                        }
                        else {
                          return 17;
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
  }
}

uint64_t SearchGlobalEntity.CodingKeys.init(intValue:)()
{
  return 17;
}

Swift::Int SearchGlobalEntity.Timestamp.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t SearchGlobalEntity.CodingKeys.stringValue.getter(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E69616D6F64;
      break;
    case 2:
      uint64_t result = 0x4449686372616573;
      break;
    case 3:
      uint64_t result = 0x7954797469746E65;
      break;
    case 4:
      uint64_t result = 1954047348;
      break;
    case 5:
    case 10:
      uint64_t result = 0xD000000000000011;
      break;
    case 6:
      uint64_t result = 0xD000000000000010;
      break;
    case 7:
      uint64_t v3 = 0x41746E657665;
      goto LABEL_9;
    case 8:
      uint64_t v3 = 0x416563616C70;
LABEL_9:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x7474000000000000;
      break;
    case 9:
      uint64_t result = 0x6269727474416469;
      break;
    case 11:
      uint64_t result = 0xD000000000000012;
      break;
    case 12:
      uint64_t result = 0xD000000000000016;
      break;
    case 13:
      uint64_t result = 0x6E65697265707865;
      break;
    case 14:
      uint64_t result = 0x746169636F737361;
      break;
    case 15:
      uint64_t result = 0x676F6C616964;
      break;
    case 16:
      uint64_t result = 0xD000000000000021;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.CodingKeys()
{
  return SearchGlobalEntity.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = SearchGlobalEntity.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.CodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = SearchGlobalEntity.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SearchGlobalEntity.encode(to:)()
{
  OUTLINED_FUNCTION_3_1();
  unint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.CodingKeys>);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_13_0();
  uint64_t v9 = *v0;
  uint64_t v43 = v0[10];
  uint64_t v41 = v0[12];
  uint64_t v42 = v0[11];
  uint64_t v39 = v0[14];
  uint64_t v40 = v0[13];
  uint64_t v38 = v0[16];
  uint64_t v36 = v0[18];
  uint64_t v37 = v0[17];
  uint64_t v35 = v0[19];
  char v34 = *((unsigned char *)v0 + 160);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)(v0 + 21), (uint64_t)v53, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  uint64_t v32 = v0[46];
  uint64_t v33 = v0[45];
  uint64_t v30 = v0[48];
  uint64_t v31 = v0[47];
  uint64_t v28 = v0[50];
  uint64_t v29 = v0[49];
  uint64_t v26 = v0[52];
  uint64_t v27 = v0[51];
  uint64_t v24 = v0[54];
  uint64_t v25 = v0[53];
  uint64_t v22 = v0[56];
  uint64_t v23 = v0[55];
  uint64_t v20 = v0[58];
  uint64_t v21 = v0[57];
  uint64_t v18 = v0[61];
  uint64_t v19 = v0[60];
  uint64_t v16 = v0[63];
  uint64_t v17 = v0[62];
  uint64_t v14 = v0[65];
  uint64_t v15 = v0[64];
  uint64_t v13 = v0[66];
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys();
  OUTLINED_FUNCTION_113();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v44 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<String>);
  lazy protocol witness table accessor for type EntityProperty<String> and conformance <> EntityProperty<A>();
  OUTLINED_FUNCTION_54();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (v1)
  {
    BOOL v11 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    uint64_t v12 = v2;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<String?>);
    lazy protocol witness table accessor for type EntityProperty<String?> and conformance <> EntityProperty<A>();
    OUTLINED_FUNCTION_54();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    lazy protocol witness table accessor for type Data and conformance Data();
    OUTLINED_FUNCTION_37();
    lazy protocol witness table accessor for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType();
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_54();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v48 = v43;
    uint64_t v49 = v42;
    uint64_t v50 = v41;
    uint64_t v51 = v40;
    uint64_t v52 = v39;
    lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes and conformance SearchGlobalEntity.GeneralAttributes();
    OUTLINED_FUNCTION_37();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SearchGlobalEntity.CustomAttribute]);
    lazy protocol witness table accessor for type [SearchGlobalEntity.CustomAttribute] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [SearchGlobalEntity.CustomAttribute] and conformance <A> [A]);
    OUTLINED_FUNCTION_54();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    uint64_t v44 = v38;
    uint64_t v45 = v37;
    uint64_t v46 = v36;
    uint64_t v47 = v35;
    LOBYTE(v48) = v34;
    lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes and conformance SearchGlobalEntity.EventAttributes();
    OUTLINED_FUNCTION_55();
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v53, (uint64_t)&v44, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes and conformance SearchGlobalEntity.PlaceAttributes();
    OUTLINED_FUNCTION_55();
    uint64_t v44 = v33;
    uint64_t v45 = v32;
    uint64_t v46 = v31;
    uint64_t v47 = v30;
    lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes and conformance SearchGlobalEntity.IDAttributes();
    OUTLINED_FUNCTION_55();
    uint64_t v44 = v29;
    uint64_t v45 = v28;
    uint64_t v46 = v27;
    uint64_t v47 = v26;
    uint64_t v48 = v25;
    uint64_t v49 = v24;
    uint64_t v50 = v23;
    uint64_t v51 = v22;
    lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes and conformance SearchGlobalEntity.ContactAttributes();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    uint64_t v44 = v21;
    uint64_t v45 = v20;
    lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes and conformance SearchGlobalEntity.AppStoreAttributes();
    OUTLINED_FUNCTION_84();
    LOBYTE(v44) = 12;
    KeyedEncodingContainer.encode(_:forKey:)();
    uint64_t v44 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<IntentFile?>);
    lazy protocol witness table accessor for type EntityProperty<IntentFile?> and conformance <> EntityProperty<A>();
    OUTLINED_FUNCTION_67();
    uint64_t v44 = v18;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v44 = v17;
    uint64_t v45 = v16;
    uint64_t v46 = v15;
    uint64_t v47 = v14;
    lazy protocol witness table accessor for type GlobalDialog and conformance GlobalDialog();
    OUTLINED_FUNCTION_84();
    uint64_t v44 = v13;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<[String]>);
    lazy protocol witness table accessor for type EntityProperty<[String]> and conformance <> EntityProperty<A>();
    OUTLINED_FUNCTION_67();
    BOOL v11 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    uint64_t v12 = v10;
  }
  v11(v12, v5);
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_2_0();
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity()
{
}

void protocol witness for ExperienceProviding.experienceSourceType.getter in conformance SearchGlobalEntity(unsigned char *a1@<X8>)
{
}

uint64_t protocol witness for Identifiable.id.getter in conformance SearchGlobalEntity@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SearchGlobalEntity.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for static _IntentValue.defaultResolverSpecification.getter in conformance SearchGlobalEntity(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity and conformance SearchGlobalEntity();

  return MEMORY[0x270EE0C68](a1, v2);
}

uint64_t protocol witness for CustomLocalizedStringResourceConvertible.localizedStringResource.getter in conformance SearchGlobalEntity(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchGlobalEntity and conformance SearchGlobalEntity();

  return MEMORY[0x270EE1D98](a1, v2);
}

uint64_t SearchGlobalEntity.init(entity:domain:isLowConfidenceKnowledge:dialog:)(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  char v293 = v4;
  uint64_t v288 = v5;
  uint64_t v283 = v6;
  uint64_t v307 = v1;
  uint64_t v298 = v7;
  type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute();
  OUTLINED_FUNCTION_0_1();
  uint64_t v348 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_11_0();
  uint64_t v326 = v10;
  OUTLINED_FUNCTION_31();
  type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityAppstoreAttributes();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_31();
  type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityIDAttributes();
  OUTLINED_FUNCTION_0_1();
  uint64_t v252 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_31();
  type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes();
  OUTLINED_FUNCTION_0_1();
  uint64_t v247 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_31();
  type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes();
  OUTLINED_FUNCTION_0_1();
  uint64_t v244 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_12_0();
  uint64_t v243 = v21;
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_31();
  type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes();
  OUTLINED_FUNCTION_0_1();
  uint64_t v241 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_12_0();
  uint64_t v240 = v27;
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_31();
  uint64_t v261 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes();
  OUTLINED_FUNCTION_0_1();
  uint64_t v340 = v37;
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_31();
  type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityMetadata();
  OUTLINED_FUNCTION_0_1();
  uint64_t v268 = v44;
  uint64_t v270 = v43;
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_11_0();
  uint64_t v329 = v45;
  OUTLINED_FUNCTION_31();
  uint64_t v309 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntity();
  OUTLINED_FUNCTION_0_1();
  uint64_t v305 = v46;
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_12_0();
  uint64_t v231 = v48;
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_17();
  uint64_t v331 = v50;
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_31();
  uint64_t v318 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityType();
  OUTLINED_FUNCTION_0_1();
  uint64_t v311 = v52;
  MEMORY[0x270FA5388](v53);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v54);
  OUTLINED_FUNCTION_58();
  uint64_t v299 = v55;
  OUTLINED_FUNCTION_31();
  type metadata accessor for Google_Protobuf_Any();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v56);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x270FA5388](v57);
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v58);
  long long v279 = *v3;
  uint64_t v59 = *((void *)v3 + 3);
  uint64_t v275 = *((void *)v3 + 2);
  _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(v387);
  memset(v388, 0, 40);
  *((void *)&v388[2] + 1) = 0xF000000000000000;
  LOBYTE(v388[3]) = 3;
  *(_OWORD *)((char *)&v388[3] + 8) = 0u;
  *(_OWORD *)((char *)&v388[4] + 8) = 0u;
  *(_OWORD *)((char *)&v388[5] + 8) = 0u;
  *(_OWORD *)((char *)&v388[6] + 8) = 0u;
  *(_OWORD *)((char *)&v388[7] + 8) = 0u;
  *(_OWORD *)((char *)&v388[8] + 8) = 0u;
  *((void *)&v388[9] + 1) = 3;
  memset(&v388[10], 0, 25);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v387, (uint64_t)&v388[12], &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v388[24] = xmmword_2586F8230;
  memset(&v388[25], 0, 24);
  *((void *)&v388[26] + 1) = 1;
  memset(&v388[27], 0, 56);
  *((void *)&v388[30] + 1) = 1;
  LOBYTE(v388[31]) = 0;
  *(_OWORD *)((char *)&v388[31] + 8) = 0u;
  *(_OWORD *)((char *)&v388[32] + 8) = 0u;
  memcpy(v386, v388, sizeof(v386));
  UUID.init()();
  uint64_t v60 = UUID.uuidString.getter();
  uint64_t v62 = v61;
  OUTLINED_FUNCTION_26();
  v64(v63);
  swift_bridgeObjectRelease();
  *(void *)v386 = v60;
  uint64_t v65 = v307;
  *(void *)&v386[8] = v62;
  swift_bridgeObjectRelease();
  *(void *)&v386[16] = v283;
  *(void *)&v386[24] = v288;
  v386[496] = v293;
  outlined consume of GlobalDialog?(*(uint64_t *)&v386[504], *(uint64_t *)&v386[512]);
  *(_OWORD *)&v386[504] = v279;
  *(void *)&v386[520] = v275;
  *(void *)&v386[528] = v59;
  if (Apple_Parsec_Siri_V2alpha_AppEntity.hasSearchID.getter())
  {
    Apple_Parsec_Siri_V2alpha_AppEntity.searchID.getter();
    lazy protocol witness table accessor for type IntentFile and conformance IntentFile((uint64_t)&lazy protocol witness table cache variable for type Google_Protobuf_Any and conformance Google_Protobuf_Any);
    uint64_t v66 = Message.serializedData(partial:)();
    uint64_t v68 = v67;
    uint64_t v69 = OUTLINED_FUNCTION_74();
    v70(v69);
    outlined consume of Data?(*(uint64_t *)&v386[32], *(unint64_t *)&v386[40]);
    *(void *)&v386[32] = v66;
    *(void *)&v386[40] = v68;
    uint64_t v65 = v307;
  }
  uint64_t v71 = v326;
  uint64_t v72 = v340;
  Apple_Parsec_Siri_V2alpha_AppEntity.type.getter();
  int v73 = (*(uint64_t (**)(uint64_t, uint64_t))(v311 + 88))(v299, v318);
  unint64_t v74 = KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:);
  uint64_t v75 = v331;
  if (v73 == *MEMORY[0x263F5CDD8])
  {
    char v76 = 2;
LABEL_9:
    v386[48] = v76;
    goto LABEL_10;
  }
  if (v73 == *MEMORY[0x263F5CDD0])
  {
    v386[48] = 0;
    goto LABEL_10;
  }
  if (v73 == *MEMORY[0x263F5CDC8])
  {
    char v76 = 1;
    goto LABEL_9;
  }
  if (one-time initialization token for search != -1) {
    swift_once();
  }
  uint64_t v94 = type metadata accessor for Logger();
  __swift_project_value_buffer(v94, (uint64_t)static Logging.search);
  OUTLINED_FUNCTION_106();
  v96(v95);
  uint64_t v97 = Logger.logObject.getter();
  os_log_type_t v98 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v97, v98))
  {
    uint64_t v99 = (uint8_t *)swift_slowAlloc();
    *(void *)v384 = swift_slowAlloc();
    *(_DWORD *)uint64_t v99 = 136315138;
    Apple_Parsec_Siri_V2alpha_AppEntity.type.getter();
    uint64_t v100 = String.init<A>(describing:)();
    uint64_t v102 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v100, v101, (uint64_t *)v384);
    OUTLINED_FUNCTION_129(v102);
    uint64_t v71 = v326;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_26();
    v104(v103);
    _os_log_impl(&dword_2586D1000, v97, v98, "Unknown AppEntity type %s", v99, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7();
    uint64_t v72 = v340;
    OUTLINED_FUNCTION_7();
  }
  else
  {
    OUTLINED_FUNCTION_26();
    v106(v105);
  }

  v386[48] = 2;
  OUTLINED_FUNCTION_6_1();
  v108(v107);
  uint64_t v65 = v307;
  uint64_t v75 = v331;
  unint64_t v74 = KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:);
LABEL_10:
  if (Apple_Parsec_Siri_V2alpha_AppEntity.hasMetadata.getter())
  {
    Apple_Parsec_Siri_V2alpha_AppEntity.metadata.getter();
    if (Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasGeneralAttributes.getter())
    {
      Apple_Parsec_Siri_V2alpha_AppEntityMetadata.generalAttributes.getter();
      char v77 = Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.hasThumbnailData.getter();
      unint64_t v78 = *(void (**)(uint64_t))(v72 + 8);
      uint64_t v79 = v261;
      OUTLINED_FUNCTION_72();
      v78(v80);
      if (v77)
      {
        Apple_Parsec_Siri_V2alpha_AppEntityMetadata.generalAttributes.getter();
        Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.thumbnailData.getter();
        OUTLINED_FUNCTION_72();
        v78(v81);
        lazy protocol witness table accessor for type IntentFile and conformance IntentFile((uint64_t)&lazy protocol witness table cache variable for type Google_Protobuf_Any and conformance Google_Protobuf_Any);
        uint64_t v332 = Message.serializedData(partial:)();
        unint64_t v319 = v109;
        OUTLINED_FUNCTION_6_1();
        v111(v110);
        uint64_t v79 = v261;
      }
      else
      {
        uint64_t v332 = 0;
        unint64_t v319 = 0xF000000000000000;
      }
      uint64_t v112 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.generalAttributes.getter();
      uint64_t v312 = MEMORY[0x25A2C9CE0](v112);
      OUTLINED_FUNCTION_72();
      v78(v113);
      Apple_Parsec_Siri_V2alpha_AppEntityMetadata.generalAttributes.getter();
      uint64_t v114 = Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.contentURL.getter();
      unint64_t v116 = v115;
      OUTLINED_FUNCTION_72();
      v78(v117);
      uint64_t v300 = String.nilIfEmpty.getter(v114, v116);
      uint64_t v294 = v118;
      swift_bridgeObjectRelease();
      Apple_Parsec_Siri_V2alpha_AppEntityMetadata.generalAttributes.getter();
      Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.displayName.getter();
      OUTLINED_FUNCTION_72();
      v78(v119);
      uint64_t v289 = OUTLINED_FUNCTION_50();
      uint64_t v284 = v120;
      swift_bridgeObjectRelease();
      Apple_Parsec_Siri_V2alpha_AppEntityMetadata.generalAttributes.getter();
      uint64_t v121 = Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.title.getter();
      OUTLINED_FUNCTION_72();
      v78(v122);
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_126();
      swift_bridgeObjectRelease();
      outlined consume of SearchGlobalEntity.GeneralAttributes?(*(uint64_t *)&v386[72], *(uint64_t *)&v386[80], *(uint64_t *)&v386[88], *(uint64_t *)&v386[96], *(uint64_t *)&v386[104], *(uint64_t *)&v386[112], *(unint64_t *)&v386[120]);
      *(void *)&v386[72] = v312;
      *(void *)&v386[80] = v300;
      *(void *)&v386[88] = v294;
      *(void *)&v386[96] = v289;
      *(void *)&v386[104] = v284;
      *(void *)&v386[112] = v332;
      *(void *)&v386[120] = v319;
      *(void *)&v386[128] = v121;
      *(void *)&v386[136] = v79;
      uint64_t v71 = v326;
    }
    if (Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasPlaceAttributes.getter())
    {
      Apple_Parsec_Siri_V2alpha_AppEntityMetadata.placeAttributes.getter();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.latitude.getter();
      double v124 = v123;
      uint64_t v125 = *(void (**)(uint64_t))(v241 + 8);
      uint64_t v126 = OUTLINED_FUNCTION_8_0();
      v125(v126);
      uint64_t v127 = v125;
      OUTLINED_FUNCTION_47();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.longitude.getter();
      double v129 = v128;
      uint64_t v130 = OUTLINED_FUNCTION_8_0();
      v125(v130);
      double v131 = v129;
      if (v124 == 0.0 && v129 == 0.0) {
        double v131 = 0.0;
      }
      double v341 = v131;
      if (v124 == 0.0 && v129 == 0.0) {
        double v132 = 0.0;
      }
      else {
        double v132 = v124;
      }
      double v333 = v132;
      OUTLINED_FUNCTION_47();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.name.getter();
      uint64_t v133 = OUTLINED_FUNCTION_7_1();
      v125(v133);
      uint64_t v313 = OUTLINED_FUNCTION_44();
      uint64_t v301 = v134;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_47();
      Apple_Parsec_Siri_V2alpha_Timestamp.timezone.getter();
      uint64_t v135 = OUTLINED_FUNCTION_7_1();
      v125(v135);
      uint64_t v295 = OUTLINED_FUNCTION_44();
      uint64_t v290 = v136;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_47();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subLocality.getter();
      uint64_t v137 = OUTLINED_FUNCTION_7_1();
      v125(v137);
      uint64_t v285 = OUTLINED_FUNCTION_44();
      uint64_t v280 = v138;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_47();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.administrativeArea.getter();
      uint64_t v139 = OUTLINED_FUNCTION_7_1();
      v125(v139);
      uint64_t v276 = OUTLINED_FUNCTION_44();
      uint64_t v272 = v140;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_47();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subAdministrativeArea.getter();
      uint64_t v141 = OUTLINED_FUNCTION_7_1();
      v125(v141);
      uint64_t v265 = OUTLINED_FUNCTION_44();
      uint64_t v262 = v142;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_47();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.country.getter();
      uint64_t v143 = OUTLINED_FUNCTION_7_1();
      v125(v143);
      v232 = v125;
      uint64_t v242 = OUTLINED_FUNCTION_44();
      uint64_t v236 = v144;
      swift_bridgeObjectRelease();
      Apple_Parsec_Siri_V2alpha_AppEntityMetadata.placeAttributes.getter();
      uint64_t v145 = Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.isoCountryCode.getter();
      unint64_t v147 = v146;
      OUTLINED_FUNCTION_19();
      v127(v148);
      uint64_t v237 = String.nilIfEmpty.getter(v145, v147);
      uint64_t v235 = v149;
      swift_bridgeObjectRelease();
      Apple_Parsec_Siri_V2alpha_AppEntityMetadata.placeAttributes.getter();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.postalAddress.getter();
      OUTLINED_FUNCTION_123();
      OUTLINED_FUNCTION_19();
      v232(v150);
      uint64_t v238 = OUTLINED_FUNCTION_50();
      uint64_t v234 = v151;
      swift_bridgeObjectRelease();
      Apple_Parsec_Siri_V2alpha_AppEntityMetadata.placeAttributes.getter();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subThoroughfare.getter();
      OUTLINED_FUNCTION_123();
      OUTLINED_FUNCTION_19();
      v232(v152);
      uint64_t v239 = OUTLINED_FUNCTION_50();
      uint64_t v233 = v153;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_47();
      uint64_t v154 = Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.thoroughfare.getter();
      uint64_t v71 = v155;
      uint64_t v156 = OUTLINED_FUNCTION_8_0();
      v232(v156);
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_125();
      v381[0] = v124 == 0.0 && v129 == 0.0;
      LOBYTE(v380[0]) = v381[0];
      *(void *)&v383[0] = v313;
      *((void *)&v383[0] + 1) = v301;
      *(void *)&v383[1] = v295;
      *((void *)&v383[1] + 1) = v290;
      *(void *)&v383[2] = v285;
      *((void *)&v383[2] + 1) = v280;
      *(void *)&v383[3] = v276;
      *((void *)&v383[3] + 1) = v272;
      *(void *)&v383[4] = v265;
      *((void *)&v383[4] + 1) = v262;
      *(void *)&v383[5] = v242;
      *((void *)&v383[5] + 1) = v236;
      *(void *)&v383[6] = v237;
      *((void *)&v383[6] + 1) = v235;
      *(void *)&v383[7] = v238;
      *((void *)&v383[7] + 1) = v234;
      *(void *)&v383[8] = v239;
      *((void *)&v383[8] + 1) = v233;
      *(void *)&v383[9] = v154;
      *((void *)&v383[9] + 1) = v240;
      *(double *)&v383[10] = v333;
      BYTE8(v383[10]) = v381[0];
      *(_DWORD *)((char *)&v383[10] + 9) = *(_DWORD *)v382;
      HIDWORD(v383[10]) = *(_DWORD *)&v382[3];
      *(double *)&v383[11] = v341;
      BYTE8(v383[11]) = v381[0];
      destructiveProjectEnumData for EntityProperty<>.CodingKeys(v383);
      outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v386[192], (uint64_t)v384, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
      outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v384);
      outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v383, (uint64_t)&v386[192], &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    }
    if (Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasContactAttribute.getter())
    {
      uint64_t v157 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.contactAttribute.getter();
      uint64_t v158 = MEMORY[0x25A2C9C80](v157);
      unint64_t v160 = v159;
      uint64_t v161 = *(void (**)(uint64_t))(v244 + 8);
      OUTLINED_FUNCTION_22();
      v161(v162);
      uint64_t v342 = String.nilIfEmpty.getter(v158, v160);
      uint64_t v334 = v163;
      swift_bridgeObjectRelease();
      uint64_t v164 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.contactAttribute.getter();
      MEMORY[0x25A2C9C90](v164);
      OUTLINED_FUNCTION_22();
      v161(v165);
      uint64_t v320 = OUTLINED_FUNCTION_50();
      uint64_t v314 = v166;
      swift_bridgeObjectRelease();
      uint64_t v167 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.contactAttribute.getter();
      MEMORY[0x25A2C9C70](v167);
      OUTLINED_FUNCTION_22();
      v161(v168);
      uint64_t v302 = OUTLINED_FUNCTION_50();
      uint64_t v170 = v169;
      swift_bridgeObjectRelease();
      uint64_t v171 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.contactAttribute.getter();
      uint64_t v172 = MEMORY[0x25A2C9C60](v171);
      uint64_t v71 = v173;
      OUTLINED_FUNCTION_22();
      v161(v174);
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_125();
      outlined consume of SearchGlobalEntity.ContactAttributes?(*(uint64_t *)&v386[416], *(uint64_t *)&v386[424]);
      *(void *)&v386[416] = v342;
      *(void *)&v386[424] = v334;
      *(void *)&v386[432] = v320;
      *(void *)&v386[440] = v314;
      *(void *)&v386[448] = v302;
      *(void *)&v386[456] = v170;
      *(void *)&v386[464] = v172;
      *(void *)&v386[472] = v243;
    }
    if (Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasEventAttributes.getter())
    {
      Apple_Parsec_Siri_V2alpha_AppEntityMetadata.eventAttributes.getter();
      char v343 = Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes.allDay.getter();
      uint64_t v175 = *(void (**)(uint64_t))(v247 + 8);
      OUTLINED_FUNCTION_22();
      v175(v176);
      uint64_t v177 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.eventAttributes.getter();
      uint64_t v335 = MEMORY[0x25A2C9B70](v177);
      OUTLINED_FUNCTION_22();
      v175(v178);
      Apple_Parsec_Siri_V2alpha_AppEntityMetadata.eventAttributes.getter();
      uint64_t v179 = Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes.endDate.getter();
      OUTLINED_FUNCTION_22();
      v175(v180);
      *(void *)&v386[152] = v343 & 1;
      *(void *)&v386[160] = v335;
      *(void *)&v386[168] = 0;
      *(void *)&v386[176] = v179;
      v386[184] = 0;
    }
    if (Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasIDAttributes.getter())
    {
      uint64_t v181 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.idAttributes.getter();
      MEMORY[0x25A2C9AC0](v181);
      OUTLINED_FUNCTION_126();
      uint64_t v182 = *(void (**)(uint64_t))(v252 + 8);
      OUTLINED_FUNCTION_19();
      v182(v183);
      uint64_t v344 = OUTLINED_FUNCTION_44();
      uint64_t v336 = v184;
      swift_bridgeObjectRelease();
      uint64_t v185 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.idAttributes.getter();
      MEMORY[0x25A2C9AD0](v185);
      OUTLINED_FUNCTION_19();
      v182(v186);
      uint64_t v187 = OUTLINED_FUNCTION_44();
      uint64_t v189 = v188;
      swift_bridgeObjectRelease();
      outlined consume of SearchGlobalEntity.IDAttributes?(*(uint64_t *)&v386[384], *(uint64_t *)&v386[392]);
      *(void *)&v386[384] = v344;
      *(void *)&v386[392] = v336;
      *(void *)&v386[400] = v187;
      *(void *)&v386[408] = v189;
    }
    if (Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasAppAttribute.getter())
    {
      uint64_t v190 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.appAttribute.getter();
      MEMORY[0x25A2C9D20](v190);
      OUTLINED_FUNCTION_126();
      OUTLINED_FUNCTION_86();
      OUTLINED_FUNCTION_6_1();
      v192(v191);
      uint64_t v193 = OUTLINED_FUNCTION_44();
      uint64_t v195 = v194;
      swift_bridgeObjectRelease();
      outlined consume of SearchGlobalEntity.AppStoreAttributes?(*(uint64_t *)&v386[480], *(uint64_t *)&v386[488]);
      *(void *)&v386[480] = v193;
      *(void *)&v386[488] = v195;
    }
    uint64_t v196 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.customAttributes.getter();
    uint64_t v197 = *(void *)(v196 + 16);
    if (v197)
    {
      v198 = *(void (**)(void))(v348 + 16);
      unint64_t v199 = v196 + ((*(unsigned __int8 *)(v348 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v348 + 80));
      uint64_t v200 = *(void *)(v348 + 72);
      swift_bridgeObjectRetain();
      v201 = (char *)MEMORY[0x263F8EE78];
      v321 = v198;
      uint64_t v315 = v200;
      do
      {
        OUTLINED_FUNCTION_106();
        v198(v202);
        closure #1 in SearchGlobalEntity.init(entity:domain:isLowConfidenceKnowledge:dialog:)(v71, (uint64_t *)v384);
        uint64_t v203 = OUTLINED_FUNCTION_101();
        v204(v203);
        if (*(void *)&v384[24] >> 1 != 0xFFFFFFFFLL)
        {
          long long v345 = *(_OWORD *)&v384[24];
          long long v337 = *(_OWORD *)v384;
          uint64_t v205 = *(void *)&v384[16];
          uint64_t v206 = *(void *)&v384[40];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v201 + 2) + 1, 1, (uint64_t)v201);
          }
          unint64_t v208 = *((void *)v201 + 2);
          unint64_t v207 = *((void *)v201 + 3);
          long long v209 = v345;
          if (v208 >= v207 >> 1)
          {
            v211 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v207 > 1), v208 + 1, 1, (uint64_t)v201);
            long long v209 = v345;
            v201 = v211;
          }
          *((void *)v201 + 2) = v208 + 1;
          v210 = &v201[48 * v208];
          *((_OWORD *)v210 + 2) = v337;
          *((void *)v210 + 6) = v205;
          *(_OWORD *)(v210 + 56) = v209;
          *((void *)v210 + 9) = v206;
          uint64_t v71 = v326;
          v198 = v321;
          uint64_t v200 = v315;
        }
        v199 += v200;
        --v197;
      }
      while (v197);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      v201 = (char *)MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
    *(void *)&v386[144] = v201;
    long long v322 = *(_OWORD *)&v386[16];
    long long v324 = *(_OWORD *)v386;
    uint64_t v316 = *(void *)&v386[32];
    uint64_t v212 = *(void *)&v386[40];
    char v213 = v386[48];
    long long v303 = *(_OWORD *)&v386[56];
    long long v291 = *(_OWORD *)&v386[88];
    long long v296 = *(_OWORD *)&v386[72];
    long long v281 = *(_OWORD *)&v386[120];
    long long v286 = *(_OWORD *)&v386[104];
    long long v349 = *(_OWORD *)&v386[152];
    uint64_t v214 = *(void *)&v386[136];
    uint64_t v346 = *(void *)&v386[168];
    uint64_t v338 = *(void *)&v386[176];
    char v327 = v386[184];
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v386[192], (uint64_t)v351, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    long long v273 = *(_OWORD *)&v386[400];
    long long v277 = *(_OWORD *)&v386[384];
    long long v263 = *(_OWORD *)&v386[432];
    long long v266 = *(_OWORD *)&v386[416];
    long long v257 = *(_OWORD *)&v386[464];
    long long v259 = *(_OWORD *)&v386[448];
    uint64_t v215 = *(void *)&v386[480];
    uint64_t v216 = *(void *)&v386[488];
    char v217 = v386[496];
    long long v255 = *(_OWORD *)&v386[504];
    uint64_t v218 = *(void *)&v386[520];
    uint64_t v219 = *(void *)&v386[528];
    *(_OWORD *)v382 = v324;
    *(_OWORD *)&v382[16] = v322;
    *(void *)&v382[32] = v316;
    *(void *)&v382[40] = v212;
    v382[48] = v213;
    *(_OWORD *)&v382[56] = v303;
    *(_OWORD *)&v382[72] = v296;
    *(_OWORD *)&v382[88] = v291;
    *(_OWORD *)&v382[104] = v286;
    *(_OWORD *)&v382[120] = v281;
    *(void *)&v382[136] = v214;
    *(void *)&v382[144] = v201;
    *(_OWORD *)&v382[152] = v349;
    *(void *)&v382[168] = v346;
    *(void *)&v382[176] = v338;
    v382[184] = v327;
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v351, (uint64_t)&v382[192], &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    *(_OWORD *)&v382[384] = v277;
    *(_OWORD *)&v382[400] = v273;
    *(_OWORD *)&v382[416] = v266;
    *(_OWORD *)&v382[432] = v263;
    *(_OWORD *)&v382[448] = v259;
    *(_OWORD *)&v382[464] = v257;
    *(void *)&v382[480] = v215;
    *(void *)&v382[488] = v216;
    v382[496] = v217;
    *(_OWORD *)&v382[504] = v255;
    *(void *)&v382[520] = v218;
    *(void *)&v382[528] = v219;
    memcpy(v380, v382, sizeof(v380));
    outlined retain of SearchGlobalEntity.Builder(v382);
    SearchGlobalEntity.init(builder:)();
    OUTLINED_FUNCTION_6_1();
    v221(v220);
    (*(void (**)(uint64_t, uint64_t))(v268 + 8))(v329, v270);
  }
  else
  {
    uint64_t v82 = v74;
    if (one-time initialization token for search != -1) {
      swift_once();
    }
    uint64_t v83 = type metadata accessor for Logger();
    __swift_project_value_buffer(v83, (uint64_t)static Logging.search);
    uint64_t v84 = *(void (**)(uint64_t, uint64_t, uint64_t))(v305 + 16);
    uint64_t v85 = v309;
    v84(v75, v65, v309);
    uint64_t v86 = Logger.logObject.getter();
    uint64_t v87 = v75;
    os_log_type_t v88 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v86, v88))
    {
      uint64_t v89 = swift_slowAlloc();
      *(void *)v384 = swift_slowAlloc();
      *(_DWORD *)uint64_t v89 = *((void *)v82 + 262);
      uint64_t v82 = (uint64_t (*)())(v89 + 12);
      v84(v231, v87, v309);
      uint64_t v90 = String.init<A>(describing:)();
      uint64_t v92 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v90, v91, (uint64_t *)v384);
      OUTLINED_FUNCTION_129(v92);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_128();
      OUTLINED_FUNCTION_29();
      ((void (*)(uint64_t))(v89 + 12))(v93);
      _os_log_impl(&dword_2586D1000, v86, v88, "AppEntity missing metadata %s", (uint8_t *)v89, 0xCu);
      swift_arrayDestroy();
      uint64_t v65 = v307;
      OUTLINED_FUNCTION_7();
      uint64_t v85 = v309;
      OUTLINED_FUNCTION_7();
    }
    else
    {
      OUTLINED_FUNCTION_128();
      OUTLINED_FUNCTION_29();
      v82();
    }

    OUTLINED_FUNCTION_62(v382);
    OUTLINED_FUNCTION_62(v380);
    outlined retain of SearchGlobalEntity.Builder(v382);
    SearchGlobalEntity.init(builder:)();
    ((void (*)(uint64_t, uint64_t))v82)(v65, v85);
  }
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v381, (uint64_t)v383, &demangling cache variable for type metadata for SearchGlobalEntity?);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v383, (uint64_t)v384, &demangling cache variable for type metadata for SearchGlobalEntity?);
  if (_s15OmniSearchTypes0B12GlobalEntityVSgWOg((uint64_t *)v384) == 1)
  {
    OUTLINED_FUNCTION_62(v380);
    outlined release of SearchGlobalEntity.Builder(v380);
    _s15OmniSearchTypes0B12GlobalEntityVSgWOi0_(v384);
  }
  else
  {
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v383, (uint64_t)&v352, &demangling cache variable for type metadata for SearchGlobalEntity?);
    OUTLINED_FUNCTION_62(v380);
    outlined release of SearchGlobalEntity.Builder(v380);
    uint64_t v350 = v379;
    uint64_t v347 = v375;
    uint64_t v339 = v376;
    uint64_t v330 = v377;
    uint64_t v328 = v378;
    long long v325 = v374;
    char v323 = v373;
    uint64_t v317 = v372[36];
    uint64_t v310 = v372[37];
    uint64_t v308 = v372[28];
    uint64_t v306 = v372[29];
    uint64_t v304 = v372[30];
    uint64_t v297 = v372[31];
    uint64_t v292 = v372[32];
    uint64_t v287 = v372[33];
    uint64_t v282 = v372[34];
    uint64_t v278 = v372[35];
    uint64_t v271 = v372[25];
    uint64_t v274 = v372[24];
    uint64_t v269 = v372[26];
    uint64_t v267 = v372[27];
    uint64_t v264 = v368;
    uint64_t v260 = v369;
    uint64_t v258 = v370;
    char v256 = v371;
    uint64_t v253 = v366;
    uint64_t v254 = v367;
    uint64_t v250 = v359;
    uint64_t v251 = v358;
    long long v245 = v352;
    uint64_t v248 = v361;
    uint64_t v249 = v360;
    uint64_t v246 = v362;
    uint64_t v222 = v363;
    uint64_t v223 = v364;
    uint64_t v224 = v365;
    uint64_t v225 = v357;
    uint64_t v226 = v356;
    char v227 = v355;
    uint64_t v228 = v353;
    uint64_t v229 = v354;
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v372, (uint64_t)v385, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    v383[0] = v245;
    *(void *)&v383[1] = v228;
    *((void *)&v383[1] + 1) = v229;
    LOBYTE(v383[2]) = v227;
    *((void *)&v383[2] + 1) = v226;
    *(void *)&v383[3] = v225;
    *((void *)&v383[3] + 1) = v251;
    *(void *)&v383[4] = v250;
    *((void *)&v383[4] + 1) = v249;
    *(void *)&v383[5] = v248;
    *((void *)&v383[5] + 1) = v246;
    *(void *)&v383[6] = v222;
    *((void *)&v383[6] + 1) = v223;
    *(void *)&v383[7] = v224;
    *((void *)&v383[7] + 1) = v253;
    *(void *)&v383[8] = v254;
    *((void *)&v383[8] + 1) = v264;
    *(void *)&v383[9] = v260;
    *((void *)&v383[9] + 1) = v258;
    LOBYTE(v383[10]) = v256;
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v385, (uint64_t)&v383[10] + 8, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    *((void *)&v383[22] + 1) = v274;
    *(void *)&v383[23] = v271;
    *((void *)&v383[23] + 1) = v269;
    *(void *)&v383[24] = v267;
    *((void *)&v383[24] + 1) = v308;
    *(void *)&v383[25] = v306;
    *((void *)&v383[25] + 1) = v304;
    *(void *)&v383[26] = v297;
    *((void *)&v383[26] + 1) = v292;
    *(void *)&v383[27] = v287;
    *((void *)&v383[27] + 1) = v282;
    *(void *)&v383[28] = v278;
    *((void *)&v383[28] + 1) = v317;
    *(void *)&v383[29] = v310;
    BYTE8(v383[29]) = v323;
    v383[30] = v325;
    *(void *)&v383[31] = v347;
    *((void *)&v383[31] + 1) = v339;
    *(void *)&v383[32] = v330;
    *((void *)&v383[32] + 1) = v328;
    *(void *)&v383[33] = v350;
    memcpy(v384, v383, sizeof(v384));
    destructiveProjectEnumData for EntityProperty<>.CodingKeys(v384);
  }
  return outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v384, v298, &demangling cache variable for type metadata for SearchGlobalEntity?);
}

uint64_t closure #1 in SearchGlobalEntity.init(entity:domain:isLowConfidenceKnowledge:dialog:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v64 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute();
  os_log_t v4 = *(os_log_t *)(v64 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v64);
  uint64_t v61 = (char *)v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v63 = (char *)v57 - v7;
  uint64_t v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_Temperature();
  uint64_t v59 = *(uint8_t **)(v8 - 8);
  uint64_t v60 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Apple_Parsec_Siri_V2alpha_Timestamp();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value?);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (void *)((char *)v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v57 - v19;
  uint64_t v62 = a1;
  Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.value.getter();
  uint64_t v21 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21) == 1) {
    goto LABEL_2;
  }
  os_log_t v58 = v4;
  outlined init with copy of IntentFile?((uint64_t)v20, (uint64_t)v18, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value?);
  uint64_t v37 = *(void *)(v21 - 8);
  int v38 = (*(uint64_t (**)(uint64_t *, uint64_t))(v37 + 88))(v18, v21);
  if (v38 != *MEMORY[0x263F5D060])
  {
    if (v38 == *MEMORY[0x263F5D070])
    {
      (*(void (**)(uint64_t *, uint64_t))(v37 + 96))(v18, v21);
      (*(void (**)(char *, uint64_t *, uint64_t))(v12 + 32))(v14, v18, v11);
      uint64_t v41 = Apple_Parsec_Siri_V2alpha_Timestamp.seconds.getter();
      uint64_t v42 = Apple_Parsec_Siri_V2alpha_Timestamp.utcOffset.getter();
      uint64_t v43 = Apple_Parsec_Siri_V2alpha_Timestamp.timezone.getter();
      unint64_t v45 = v44;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      uint64_t v46 = String.nilIfEmpty.getter(v43, v45);
      uint64_t v48 = v47;
      swift_bridgeObjectRelease();
      *a2 = v41;
      a2[1] = 0;
      a2[2] = v42;
      a2[3] = 0x4000000000000000;
      a2[4] = v46;
      a2[5] = v48;
      return _s10AppIntents10IntentFileVSgWOhTm_0((uint64_t)v20, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value?);
    }
    if (v38 == *MEMORY[0x263F5D068])
    {
      (*(void (**)(uint64_t *, uint64_t))(v37 + 96))(v18, v21);
      uint64_t v50 = v59;
      uint64_t v49 = v60;
      uint64_t v51 = (*((uint64_t (**)(char *, uint64_t *, uint64_t))v59 + 4))(v10, v18, v60);
      uint64_t v52 = MEMORY[0x25A2C99A0](v51);
      uint64_t v54 = v53;
      Apple_Parsec_Siri_V2alpha_Temperature.value.getter();
      uint64_t v56 = v55;
      (*((void (**)(char *, uint64_t))v50 + 1))(v10, v49);
      *a2 = v52;
      a2[1] = v54;
      a2[2] = v56;
      a2[5] = 0;
      a2[3] = 0x8000000000000000;
LABEL_10:
      a2[4] = 0;
      return _s10AppIntents10IntentFileVSgWOhTm_0((uint64_t)v20, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value?);
    }
    (*(void (**)(uint64_t *, uint64_t))(v37 + 8))(v18, v21);
    os_log_t v4 = v58;
LABEL_2:
    if (one-time initialization token for search != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    __swift_project_value_buffer(v22, (uint64_t)static Logging.search);
    Class isa = (void (*)(char *, uint64_t, uint64_t))v4[2].isa;
    uint64_t v24 = v63;
    uint64_t v25 = v64;
    isa(v63, v62, v64);
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    int v28 = v27;
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v29 = swift_slowAlloc();
      LODWORD(v60) = v28;
      uint64_t v30 = a2;
      uint64_t v31 = (uint8_t *)v29;
      uint64_t v62 = swift_slowAlloc();
      uint64_t v66 = v62;
      os_log_t v58 = v26;
      uint64_t v59 = v31;
      *(_DWORD *)uint64_t v31 = 136315138;
      v57[1] = v31 + 4;
      a2 = v30;
      ((void (*)(char *))isa)(v61);
      uint64_t v32 = String.init<A>(describing:)();
      uint64_t v65 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v4[1].isa)(v24, v25);
      os_log_t v35 = v58;
      uint64_t v34 = v59;
      _os_log_impl(&dword_2586D1000, v58, (os_log_type_t)v60, "SearchGlobalEntity unknown CustomAttribute %s", v59, 0xCu);
      uint64_t v36 = v62;
      swift_arrayDestroy();
      MEMORY[0x25A2CA650](v36, -1, -1);
      MEMORY[0x25A2CA650](v34, -1, -1);
    }
    else
    {
      ((void (*)(char *, uint64_t))v4[1].isa)(v24, v25);
    }
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = 0x1FFFFFFFELL;
    a2[5] = 0;
    goto LABEL_10;
  }
  (*(void (**)(uint64_t *, uint64_t))(v37 + 96))(v18, v21);
  uint64_t v39 = v18[1];
  *a2 = *v18;
  a2[1] = v39;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  return _s10AppIntents10IntentFileVSgWOhTm_0((uint64_t)v20, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value?);
}

uint64_t specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = type metadata accessor for UTType();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  v1[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation(), 0, 0);
}

uint64_t specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()()
{
  uint64_t v1 = v0[9];
  EntityProperty.wrappedValue.getter();
  uint64_t v2 = type metadata accessor for IntentFile();
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    _s10AppIntents10IntentFileVSgWOhTm_0(v0[9], &demangling cache variable for type metadata for IntentFile?);
    if (one-time initialization token for searchToolExportedExperiences != -1) {
      swift_once();
    }
    uint64_t v3 = v0[8];
    uint64_t v4 = v0[6];
    uint64_t v5 = v0[7];
    __swift_project_value_buffer(v4, (uint64_t)static UTType.searchToolExportedExperiences);
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_106();
    v6();
    uint64_t v7 = type metadata accessor for SearchTransferabilityError();
    lazy protocol witness table accessor for type IntentFile and conformance IntentFile((uint64_t)&lazy protocol witness table cache variable for type SearchTransferabilityError and conformance SearchTransferabilityError);
    swift_allocError();
    *(_WORD *)uint64_t v8 = 256;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(&v8[*(int *)(v7 + 24)], v3, v4);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    uint64_t v11 = IntentFile.data.getter();
    uint64_t v13 = v12;
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_6_1();
    v14();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v15(v11, v13);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v10;

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_5_0();
  uint64_t v4 = *v3;
  OUTLINED_FUNCTION_59();
  *uint64_t v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  if (!v1)
  {
    uint64_t v6 = v2;
    uint64_t v7 = v0;
  }
  return v8(v6, v7);
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys);
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.CustomAttribute(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 62;
  if (!(a4 >> 62) || v4 == 2 || v4 == 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined consume of SearchGlobalEntity.CustomAttribute(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 62;
  if (!(a4 >> 62) || v4 == 2 || v4 == 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys);
  }
  return result;
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
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
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
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
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
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys);
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

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys);
  }
  return result;
}

uint64_t outlined release of SearchGlobalEntity.PlaceAttributes(uint64_t a1)
{
  return a1;
}

uint64_t outlined retain of SearchGlobalEntity.PlaceAttributes(uint64_t a1)
{
  return a1;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys);
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.GeneralAttributes?(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of Data?(a6, a7);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.PlaceAttributes?(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.IDAttributes?(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.ContactAttributes?(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.AppStoreAttributes?(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of GlobalDialog?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined consume of GlobalDialog?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(_OWORD *a1)
{
  *a1 = xmmword_2586F8230;
  bzero(a1 + 1, 0xA9uLL);
}

void *outlined retain of SearchGlobalEntity(void *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  uint64_t v10 = a1[7];
  uint64_t v11 = a1[6];
  uint64_t v4 = a1[9];
  uint64_t v8 = a1[10];
  uint64_t v9 = a1[8];
  unint64_t v6 = a1[12];
  uint64_t v7 = a1[11];
  uint64_t v18 = a1[22];
  uint64_t v19 = a1[21];
  uint64_t v12 = a1[46];
  uint64_t v13 = a1[45];
  uint64_t v14 = a1[50];
  uint64_t v15 = a1[49];
  uint64_t v16 = a1[58];
  uint64_t v17 = a1[57];
  uint64_t v20 = a1[63];
  uint64_t v21 = a1[62];
  swift_retain();
  swift_retain();
  outlined copy of Data?(v2, v3);
  swift_retain();
  outlined copy of SearchGlobalEntity.GeneralAttributes?(v11, v10, v9, v4, v8, v7, v6);
  swift_bridgeObjectRetain();
  outlined copy of SearchGlobalEntity.PlaceAttributes?(v19, v18);
  outlined copy of SearchGlobalEntity.IDAttributes?(v13, v12);
  outlined copy of SearchGlobalEntity.ContactAttributes?(v15, v14);
  outlined copy of SearchGlobalEntity.AppStoreAttributes?(v17, v16);
  swift_retain();
  swift_retain();
  outlined copy of GlobalDialog?(v21, v20);
  swift_retain();
  return a1;
}

void *outlined release of SearchGlobalEntity(void *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  uint64_t v10 = a1[7];
  uint64_t v11 = a1[6];
  uint64_t v4 = a1[9];
  uint64_t v8 = a1[10];
  uint64_t v9 = a1[8];
  unint64_t v6 = a1[12];
  uint64_t v7 = a1[11];
  uint64_t v18 = a1[22];
  uint64_t v19 = a1[21];
  uint64_t v12 = a1[46];
  uint64_t v13 = a1[45];
  uint64_t v14 = a1[50];
  uint64_t v15 = a1[49];
  uint64_t v16 = a1[58];
  uint64_t v17 = a1[57];
  uint64_t v20 = a1[63];
  uint64_t v21 = a1[62];
  swift_release();
  swift_release();
  outlined consume of Data?(v2, v3);
  swift_release();
  outlined consume of SearchGlobalEntity.GeneralAttributes?(v11, v10, v9, v4, v8, v7, v6);
  swift_bridgeObjectRelease();
  outlined consume of SearchGlobalEntity.PlaceAttributes?(v19, v18);
  outlined consume of SearchGlobalEntity.IDAttributes?(v13, v12);
  outlined consume of SearchGlobalEntity.ContactAttributes?(v15, v14);
  outlined consume of SearchGlobalEntity.AppStoreAttributes?(v17, v16);
  swift_release();
  swift_release();
  outlined consume of GlobalDialog?(v21, v20);
  swift_release();
  return a1;
}

uint64_t outlined consume of SearchGlobalEntity.GeneralAttributes?(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of Data?(a6, a7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined consume of SearchGlobalEntity.PlaceAttributes?(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined consume of SearchGlobalEntity.IDAttributes?(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined consume of SearchGlobalEntity.ContactAttributes?(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined consume of SearchGlobalEntity.AppStoreAttributes?(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined init with take of SearchGlobalEntity.PlaceAttributes?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_46();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

void *outlined release of SearchGlobalEntity.Builder(void *a1)
{
  uint64_t v2 = a1[4];
  unint64_t v3 = a1[5];
  uint64_t v10 = a1[10];
  uint64_t v11 = a1[9];
  uint64_t v4 = a1[12];
  uint64_t v8 = a1[13];
  uint64_t v9 = a1[11];
  unint64_t v6 = a1[15];
  uint64_t v7 = a1[14];
  uint64_t v18 = a1[25];
  uint64_t v19 = a1[24];
  uint64_t v12 = a1[49];
  uint64_t v13 = a1[48];
  uint64_t v14 = a1[53];
  uint64_t v15 = a1[52];
  uint64_t v16 = a1[61];
  uint64_t v17 = a1[60];
  uint64_t v20 = a1[64];
  uint64_t v21 = a1[63];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(v2, v3);
  swift_bridgeObjectRelease();
  outlined consume of SearchGlobalEntity.GeneralAttributes?(v11, v10, v9, v4, v8, v7, v6);
  swift_bridgeObjectRelease();
  outlined consume of SearchGlobalEntity.PlaceAttributes?(v19, v18);
  outlined consume of SearchGlobalEntity.IDAttributes?(v13, v12);
  outlined consume of SearchGlobalEntity.ContactAttributes?(v15, v14);
  outlined consume of SearchGlobalEntity.AppStoreAttributes?(v17, v16);
  outlined consume of GlobalDialog?(v21, v20);
  return a1;
}

void _s15OmniSearchTypes0B12GlobalEntityVSgWOi0_(void *a1)
{
}

uint64_t outlined retain of SearchGlobalEntity.PlaceAttributes?(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_75(a1);
  char v5 = *(unsigned char *)(v1 + 184);
  v3(v2, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), *(void *)(v1 + 120), *(void *)(v1 + 128), *(void *)(v1 + 136), *(void *)(v1 + 144),
    *(void *)(v1 + 152),
    *(void *)(v1 + 160),
    *(void *)(v1 + 168),
    *(void *)(v1 + 176),
    v5);
  return v1;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t SearchGlobalEntity.Query.entities(for:)(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(void *__src)
{
  memcpy((void *)(v1 + 16), __src, 0x218uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 552) = v2;
  *uint64_t v2 = v1;
  v2[1] = specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation();
  return specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(v1 + 16);
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity and conformance SearchGlobalEntity()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

uint64_t *outlined release of (SearchGlobalEntity.GeneralAttributes?, SearchGlobalEntity.GeneralAttributes?)(uint64_t *a1)
{
  uint64_t v2 = a1[9];
  uint64_t v3 = a1[10];
  uint64_t v4 = a1[11];
  uint64_t v5 = a1[12];
  uint64_t v6 = a1[13];
  uint64_t v7 = a1[14];
  unint64_t v8 = a1[15];
  outlined consume of SearchGlobalEntity.GeneralAttributes?(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6]);
  outlined consume of SearchGlobalEntity.GeneralAttributes?(v2, v3, v4, v5, v6, v7, v8);
  return a1;
}

uint64_t _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOg(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t *outlined release of (SearchGlobalEntity.PlaceAttributes?, SearchGlobalEntity.PlaceAttributes?)(uint64_t *a1)
{
  uint64_t v2 = a1[25];
  uint64_t v4 = a1[24];
  outlined consume of SearchGlobalEntity.PlaceAttributes?(*a1, a1[1]);
  outlined consume of SearchGlobalEntity.PlaceAttributes?(v4, v2);
  return a1;
}

uint64_t *outlined release of (SearchGlobalEntity.ContactAttributes?, SearchGlobalEntity.ContactAttributes?)(uint64_t *a1)
{
  uint64_t v2 = a1[8];
  uint64_t v3 = a1[9];
  outlined consume of SearchGlobalEntity.ContactAttributes?(*a1, a1[1]);
  outlined consume of SearchGlobalEntity.ContactAttributes?(v2, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type EntityProperty<String> and conformance <> EntityProperty<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type EntityProperty<String> and conformance <> EntityProperty<A>;
  if (!lazy protocol witness table cache variable for type EntityProperty<String> and conformance <> EntityProperty<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for EntityProperty<String>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EntityProperty<String> and conformance <> EntityProperty<A>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type EntityProperty<String?> and conformance <> EntityProperty<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type EntityProperty<String?> and conformance <> EntityProperty<A>;
  if (!lazy protocol witness table cache variable for type EntityProperty<String?> and conformance <> EntityProperty<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for EntityProperty<String?>);
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type String? and conformance <A> A?);
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type String? and conformance <A> A?);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EntityProperty<String?> and conformance <> EntityProperty<A>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance <A> [A](uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_75(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes and conformance SearchGlobalEntity.GeneralAttributes()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes and conformance SearchGlobalEntity.GeneralAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes and conformance SearchGlobalEntity.GeneralAttributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes and conformance SearchGlobalEntity.GeneralAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute and conformance SearchGlobalEntity.CustomAttribute()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute and conformance SearchGlobalEntity.CustomAttribute;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute and conformance SearchGlobalEntity.CustomAttribute)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute and conformance SearchGlobalEntity.CustomAttribute);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes and conformance SearchGlobalEntity.EventAttributes()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes and conformance SearchGlobalEntity.EventAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes and conformance SearchGlobalEntity.EventAttributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes and conformance SearchGlobalEntity.EventAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes and conformance SearchGlobalEntity.PlaceAttributes()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes and conformance SearchGlobalEntity.PlaceAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes and conformance SearchGlobalEntity.PlaceAttributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes and conformance SearchGlobalEntity.PlaceAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes and conformance SearchGlobalEntity.IDAttributes()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes and conformance SearchGlobalEntity.IDAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes and conformance SearchGlobalEntity.IDAttributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes and conformance SearchGlobalEntity.IDAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes and conformance SearchGlobalEntity.ContactAttributes()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes and conformance SearchGlobalEntity.ContactAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes and conformance SearchGlobalEntity.ContactAttributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes and conformance SearchGlobalEntity.ContactAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes and conformance SearchGlobalEntity.AppStoreAttributes()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes and conformance SearchGlobalEntity.AppStoreAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes and conformance SearchGlobalEntity.AppStoreAttributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes and conformance SearchGlobalEntity.AppStoreAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type EntityProperty<IntentFile?> and conformance <> EntityProperty<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type EntityProperty<IntentFile?> and conformance <> EntityProperty<A>;
  if (!lazy protocol witness table cache variable for type EntityProperty<IntentFile?> and conformance <> EntityProperty<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for EntityProperty<IntentFile?>);
    lazy protocol witness table accessor for type IntentFile? and conformance <A> A?((uint64_t)&lazy protocol witness table cache variable for type IntentFile? and conformance <A> A?);
    lazy protocol witness table accessor for type IntentFile? and conformance <A> A?((uint64_t)&lazy protocol witness table cache variable for type IntentFile? and conformance <A> A?);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EntityProperty<IntentFile?> and conformance <> EntityProperty<A>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type IntentFile? and conformance <A> A?(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_75(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for IntentFile?);
    lazy protocol witness table accessor for type IntentFile and conformance IntentFile(v4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GlobalDialog and conformance GlobalDialog()
{
  unint64_t result = lazy protocol witness table cache variable for type GlobalDialog and conformance GlobalDialog;
  if (!lazy protocol witness table cache variable for type GlobalDialog and conformance GlobalDialog)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GlobalDialog and conformance GlobalDialog);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type EntityProperty<[String]> and conformance <> EntityProperty<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type EntityProperty<[String]> and conformance <> EntityProperty<A>;
  if (!lazy protocol witness table cache variable for type EntityProperty<[String]> and conformance <> EntityProperty<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for EntityProperty<[String]>);
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EntityProperty<[String]> and conformance <> EntityProperty<A>);
  }
  return result;
}

void *outlined retain of SearchGlobalEntity.Builder(void *a1)
{
  uint64_t v2 = a1[4];
  unint64_t v3 = a1[5];
  uint64_t v10 = a1[10];
  uint64_t v11 = a1[9];
  uint64_t v4 = a1[12];
  uint64_t v8 = a1[13];
  uint64_t v9 = a1[11];
  unint64_t v6 = a1[15];
  uint64_t v7 = a1[14];
  uint64_t v18 = a1[25];
  uint64_t v19 = a1[24];
  uint64_t v12 = a1[49];
  uint64_t v13 = a1[48];
  uint64_t v14 = a1[53];
  uint64_t v15 = a1[52];
  uint64_t v16 = a1[61];
  uint64_t v17 = a1[60];
  uint64_t v20 = a1[64];
  uint64_t v21 = a1[63];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of Data?(v2, v3);
  swift_bridgeObjectRetain();
  outlined copy of SearchGlobalEntity.GeneralAttributes?(v11, v10, v9, v4, v8, v7, v6);
  swift_bridgeObjectRetain();
  outlined copy of SearchGlobalEntity.PlaceAttributes?(v19, v18);
  outlined copy of SearchGlobalEntity.IDAttributes?(v13, v12);
  outlined copy of SearchGlobalEntity.ContactAttributes?(v15, v14);
  outlined copy of SearchGlobalEntity.AppStoreAttributes?(v17, v16);
  outlined copy of GlobalDialog?(v21, v20);
  return a1;
}

uint64_t _s15OmniSearchTypes0B12GlobalEntityVSgWOg(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query);
  }
  return result;
}

unint64_t associated type witness table accessor for DynamicOptionsProvider.Result : ResultsCollection in SearchGlobalEntity.Query()
{
  return lazy protocol witness table accessor for type [SearchGlobalEntity.CustomAttribute] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [SearchGlobalEntity] and conformance <A> [A]);
}

unint64_t lazy protocol witness table accessor for type [SearchGlobalEntity.CustomAttribute] and conformance <A> [A](uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_75(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : EntityIdentifierConvertible in SearchGlobalEntity()
{
  return MEMORY[0x263EFC020];
}

uint64_t associated type witness table accessor for Transferable.Representation : TransferRepresentation in SearchGlobalEntity()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in SearchGlobalEntity()
{
  return MEMORY[0x263F8D320];
}

unint64_t associated type witness table accessor for _IntentValue.Specification : ResolverSpecification in SearchGlobalEntity()
{
  return lazy protocol witness table accessor for type EmptyResolverSpecification<SearchGlobalEntity> and conformance EmptyResolverSpecification<A>((uint64_t)&lazy protocol witness table cache variable for type EmptyResolverSpecification<SearchGlobalEntity> and conformance EmptyResolverSpecification<A>);
}

uint64_t sub_2586ECBE4()
{
  OUTLINED_FUNCTION_89();
  uint64_t result = SearchGlobalEntity.id.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_2586ECC10()
{
  OUTLINED_FUNCTION_89();
  uint64_t result = SearchGlobalEntity.domain.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_2586ECC38(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for SearchGlobalEntity.domain : SearchGlobalEntity(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))SearchGlobalEntity.domain.setter);
}

uint64_t sub_2586ECC64()
{
  OUTLINED_FUNCTION_89();
  uint64_t result = SearchGlobalEntity.text.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_2586ECC8C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for SearchGlobalEntity.domain : SearchGlobalEntity(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))SearchGlobalEntity.text.setter);
}

uint64_t sub_2586ECCB8()
{
  return SearchGlobalEntity.experienceFile.getter();
}

uint64_t sub_2586ECCE0()
{
  OUTLINED_FUNCTION_89();
  uint64_t result = SearchGlobalEntity.associatedQuery.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_2586ECD08(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for SearchGlobalEntity.domain : SearchGlobalEntity(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))SearchGlobalEntity.associatedQuery.setter);
}

uint64_t sub_2586ECD34()
{
  OUTLINED_FUNCTION_89();
  uint64_t result = SearchGlobalEntity.supportedTypeIdentifiersForExport.getter();
  uint64_t *v0 = result;
  return result;
}

uint64_t destroy for SearchGlobalEntity(uint64_t *a1)
{
  swift_release();
  swift_release();
  unint64_t v2 = a1[3];
  if (v2 >> 60 != 15) {
    outlined consume of Data._Representation(a1[2], v2);
  }
  swift_release();
  if (a1[6])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v3 = a1[12];
    if (v3 >> 60 != 15) {
      outlined consume of Data._Representation(a1[11], v3);
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (a1[22] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[46] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[50] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[58] != 1) {
    swift_bridgeObjectRelease();
  }
  swift_release();
  swift_release();
  if (a1[63])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return swift_release();
}

uint64_t initializeWithCopy for SearchGlobalEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (uint64_t *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  swift_retain();
  swift_retain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
  }
  else
  {
    uint64_t v7 = *v5;
    outlined copy of Data._Representation(*v5, v6);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v6;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 56);
    uint64_t v10 = *(void *)(a2 + 64);
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = v9;
    uint64_t v11 = *(void *)(a2 + 72);
    uint64_t v12 = *(void *)(a2 + 80);
    *(void *)(a1 + 64) = v10;
    *(void *)(a1 + 72) = v11;
    *(void *)(a1 + 80) = v12;
    uint64_t v13 = (uint64_t *)(a2 + 88);
    unint64_t v14 = *(void *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 88) = *(_OWORD *)v13;
    }
    else
    {
      uint64_t v15 = *v13;
      outlined copy of Data._Representation(*v13, v14);
      *(void *)(a1 + 88) = v15;
      *(void *)(a1 + 96) = v14;
    }
    uint64_t v16 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = v16;
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(a1 + 48), (const void *)(a2 + 48), 0x48uLL);
  }
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  long long v17 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v17;
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  uint64_t v18 = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  if (v18 == 1)
  {
    memcpy((void *)(a1 + 168), (const void *)(a2 + 168), 0xB9uLL);
  }
  else
  {
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(void *)(a1 + 176) = v18;
    uint64_t v19 = *(void *)(a2 + 192);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(void *)(a1 + 192) = v19;
    uint64_t v20 = *(void *)(a2 + 208);
    *(void *)(a1 + 200) = *(void *)(a2 + 200);
    *(void *)(a1 + 208) = v20;
    uint64_t v21 = *(void *)(a2 + 224);
    *(void *)(a1 + 216) = *(void *)(a2 + 216);
    *(void *)(a1 + 224) = v21;
    uint64_t v22 = *(void *)(a2 + 240);
    *(void *)(a1 + 232) = *(void *)(a2 + 232);
    *(void *)(a1 + 240) = v22;
    uint64_t v23 = *(void *)(a2 + 256);
    *(void *)(a1 + 248) = *(void *)(a2 + 248);
    *(void *)(a1 + 256) = v23;
    uint64_t v24 = *(void *)(a2 + 272);
    *(void *)(a1 + 264) = *(void *)(a2 + 264);
    *(void *)(a1 + 272) = v24;
    uint64_t v25 = *(void *)(a2 + 288);
    *(void *)(a1 + 280) = *(void *)(a2 + 280);
    *(void *)(a1 + 288) = v25;
    uint64_t v26 = *(void *)(a2 + 304);
    *(void *)(a1 + 296) = *(void *)(a2 + 296);
    *(void *)(a1 + 304) = v26;
    uint64_t v27 = *(void *)(a2 + 320);
    *(void *)(a1 + 312) = *(void *)(a2 + 312);
    *(void *)(a1 + 320) = v27;
    uint64_t v28 = *(void *)(a2 + 328);
    *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
    *(void *)(a1 + 328) = v28;
    uint64_t v29 = *(void *)(a2 + 344);
    *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
    *(void *)(a1 + 344) = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v30 = *(void *)(a2 + 368);
  if (v30 == 1)
  {
    long long v31 = *(_OWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = *(_OWORD *)(a2 + 360);
    *(_OWORD *)(a1 + 376) = v31;
  }
  else
  {
    *(void *)(a1 + 360) = *(void *)(a2 + 360);
    *(void *)(a1 + 368) = v30;
    uint64_t v32 = *(void *)(a2 + 384);
    *(void *)(a1 + 376) = *(void *)(a2 + 376);
    *(void *)(a1 + 384) = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v33 = *(void *)(a2 + 400);
  if (v33 == 1)
  {
    long long v34 = *(_OWORD *)(a2 + 408);
    *(_OWORD *)(a1 + 392) = *(_OWORD *)(a2 + 392);
    *(_OWORD *)(a1 + 408) = v34;
    long long v35 = *(_OWORD *)(a2 + 440);
    *(_OWORD *)(a1 + 424) = *(_OWORD *)(a2 + 424);
    *(_OWORD *)(a1 + 440) = v35;
  }
  else
  {
    *(void *)(a1 + 392) = *(void *)(a2 + 392);
    *(void *)(a1 + 400) = v33;
    uint64_t v36 = *(void *)(a2 + 416);
    *(void *)(a1 + 408) = *(void *)(a2 + 408);
    *(void *)(a1 + 416) = v36;
    uint64_t v37 = *(void *)(a2 + 432);
    *(void *)(a1 + 424) = *(void *)(a2 + 424);
    *(void *)(a1 + 432) = v37;
    uint64_t v38 = *(void *)(a2 + 448);
    *(void *)(a1 + 440) = *(void *)(a2 + 440);
    *(void *)(a1 + 448) = v38;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v39 = (_OWORD *)(a2 + 456);
  uint64_t v40 = *(void *)(a2 + 464);
  if (v40 == 1)
  {
    *(_OWORD *)(a1 + 456) = *v39;
  }
  else
  {
    *(void *)(a1 + 456) = *(void *)v39;
    *(void *)(a1 + 464) = v40;
    swift_bridgeObjectRetain();
  }
  *(unsigned char *)(a1 + 472) = *(unsigned char *)(a2 + 472);
  uint64_t v41 = *(void *)(a2 + 488);
  *(void *)(a1 + 480) = *(void *)(a2 + 480);
  *(void *)(a1 + 488) = v41;
  uint64_t v42 = *(void *)(a2 + 504);
  swift_retain();
  swift_retain();
  if (v42)
  {
    *(void *)(a1 + 496) = *(void *)(a2 + 496);
    *(void *)(a1 + 504) = v42;
    *(void *)(a1 + 512) = *(void *)(a2 + 512);
    *(void *)(a1 + 520) = *(void *)(a2 + 520);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v43 = *(_OWORD *)(a2 + 512);
    *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 496);
    *(_OWORD *)(a1 + 512) = v43;
  }
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SearchGlobalEntity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v4 = (uint64_t *)(a2 + 16);
  unint64_t v5 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) >> 60 == 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *v4;
      outlined copy of Data._Representation(*v4, *(void *)(a2 + 24));
      *(void *)(a1 + 16) = v6;
      *(void *)(a1 + 24) = v5;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 16);
LABEL_6:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v7 = *v4;
  outlined copy of Data._Representation(*v4, *(void *)(a2 + 24));
  uint64_t v8 = *(void *)(a1 + 16);
  unint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v5;
  outlined consume of Data._Representation(v8, v9);
LABEL_8:
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  uint64_t v10 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48))
  {
    if (v10)
    {
      *(void *)(a1 + 48) = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v11 = (uint64_t *)(a2 + 88);
      unint64_t v12 = *(void *)(a2 + 96);
      if (*(void *)(a1 + 96) >> 60 == 15)
      {
        if (v12 >> 60 != 15)
        {
          uint64_t v13 = *v11;
          outlined copy of Data._Representation(*v11, *(void *)(a2 + 96));
          *(void *)(a1 + 88) = v13;
          *(void *)(a1 + 96) = v12;
LABEL_24:
          *(void *)(a1 + 104) = *(void *)(a2 + 104);
          *(void *)(a1 + 112) = *(void *)(a2 + 112);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
      }
      else
      {
        if (v12 >> 60 != 15)
        {
          uint64_t v17 = *v11;
          outlined copy of Data._Representation(*v11, *(void *)(a2 + 96));
          uint64_t v18 = *(void *)(a1 + 88);
          unint64_t v19 = *(void *)(a1 + 96);
          *(void *)(a1 + 88) = v17;
          *(void *)(a1 + 96) = v12;
          outlined consume of Data._Representation(v18, v19);
          goto LABEL_24;
        }
        outlined destroy of Data(a1 + 88);
      }
      *(_OWORD *)(a1 + 88) = *(_OWORD *)v11;
      goto LABEL_24;
    }
    outlined destroy of SearchGlobalEntity.GeneralAttributes(a1 + 48);
LABEL_17:
    memcpy((void *)(a1 + 48), (const void *)(a2 + 48), 0x48uLL);
    goto LABEL_25;
  }
  if (!v10) {
    goto LABEL_17;
  }
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  unint64_t v14 = (uint64_t *)(a2 + 88);
  unint64_t v15 = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 88) = *(_OWORD *)v14;
  }
  else
  {
    uint64_t v16 = *v14;
    outlined copy of Data._Representation(*v14, v15);
    *(void *)(a1 + 88) = v16;
    *(void *)(a1 + 96) = v15;
  }
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
LABEL_25:
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v20 = *(_OWORD *)(a2 + 128);
  long long v21 = *(_OWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(_OWORD *)(a1 + 128) = v20;
  *(_OWORD *)(a1 + 144) = v21;
  uint64_t v22 = *(void *)(a2 + 176);
  if (*(void *)(a1 + 176) == 1)
  {
    if (v22 != 1)
    {
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      *(void *)(a1 + 192) = *(void *)(a2 + 192);
      *(void *)(a1 + 200) = *(void *)(a2 + 200);
      *(void *)(a1 + 208) = *(void *)(a2 + 208);
      *(void *)(a1 + 216) = *(void *)(a2 + 216);
      *(void *)(a1 + 224) = *(void *)(a2 + 224);
      *(void *)(a1 + 232) = *(void *)(a2 + 232);
      *(void *)(a1 + 240) = *(void *)(a2 + 240);
      *(void *)(a1 + 248) = *(void *)(a2 + 248);
      *(void *)(a1 + 256) = *(void *)(a2 + 256);
      *(void *)(a1 + 264) = *(void *)(a2 + 264);
      *(void *)(a1 + 272) = *(void *)(a2 + 272);
      *(void *)(a1 + 280) = *(void *)(a2 + 280);
      *(void *)(a1 + 288) = *(void *)(a2 + 288);
      *(void *)(a1 + 296) = *(void *)(a2 + 296);
      *(void *)(a1 + 304) = *(void *)(a2 + 304);
      *(void *)(a1 + 312) = *(void *)(a2 + 312);
      *(void *)(a1 + 320) = *(void *)(a2 + 320);
      uint64_t v23 = *(void *)(a2 + 328);
      *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
      *(void *)(a1 + 328) = v23;
      uint64_t v24 = *(void *)(a2 + 344);
      *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
      *(void *)(a1 + 344) = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (v22 == 1)
  {
    outlined destroy of SearchGlobalEntity.PlaceAttributes(a1 + 168);
LABEL_30:
    memcpy((void *)(a1 + 168), (const void *)(a2 + 168), 0xB9uLL);
    goto LABEL_32;
  }
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(a2 + 328);
  *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
  *(void *)(a1 + 328) = v25;
  uint64_t v26 = *(void *)(a2 + 344);
  *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
  *(void *)(a1 + 344) = v26;
LABEL_32:
  uint64_t v27 = (_OWORD *)(a1 + 360);
  uint64_t v28 = (_OWORD *)(a2 + 360);
  uint64_t v29 = *(void *)(a2 + 368);
  if (*(void *)(a1 + 368) == 1)
  {
    if (v29 == 1)
    {
      long long v30 = *(_OWORD *)(a2 + 376);
      *uint64_t v27 = *v28;
      *(_OWORD *)(a1 + 376) = v30;
    }
    else
    {
      *(void *)(a1 + 360) = *(void *)(a2 + 360);
      *(void *)(a1 + 368) = *(void *)(a2 + 368);
      *(void *)(a1 + 376) = *(void *)(a2 + 376);
      *(void *)(a1 + 384) = *(void *)(a2 + 384);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v29 == 1)
  {
    outlined destroy of SearchGlobalEntity.IDAttributes(a1 + 360);
    long long v31 = *(_OWORD *)(a2 + 376);
    *uint64_t v27 = *v28;
    *(_OWORD *)(a1 + 376) = v31;
  }
  else
  {
    *(void *)(a1 + 360) = *(void *)(a2 + 360);
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 376) = *(void *)(a2 + 376);
    *(void *)(a1 + 384) = *(void *)(a2 + 384);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v32 = (_OWORD *)(a1 + 392);
  uint64_t v33 = (long long *)(a2 + 392);
  uint64_t v34 = *(void *)(a2 + 400);
  if (*(void *)(a1 + 400) == 1)
  {
    if (v34 == 1)
    {
      long long v35 = *v33;
      long long v36 = *(_OWORD *)(a2 + 408);
      long long v37 = *(_OWORD *)(a2 + 440);
      *(_OWORD *)(a1 + 424) = *(_OWORD *)(a2 + 424);
      *(_OWORD *)(a1 + 440) = v37;
      *uint64_t v32 = v35;
      *(_OWORD *)(a1 + 408) = v36;
    }
    else
    {
      *(void *)(a1 + 392) = *(void *)(a2 + 392);
      *(void *)(a1 + 400) = *(void *)(a2 + 400);
      *(void *)(a1 + 408) = *(void *)(a2 + 408);
      *(void *)(a1 + 416) = *(void *)(a2 + 416);
      *(void *)(a1 + 424) = *(void *)(a2 + 424);
      *(void *)(a1 + 432) = *(void *)(a2 + 432);
      *(void *)(a1 + 440) = *(void *)(a2 + 440);
      *(void *)(a1 + 448) = *(void *)(a2 + 448);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v34 == 1)
  {
    outlined destroy of SearchGlobalEntity.ContactAttributes(a1 + 392);
    long long v38 = *(_OWORD *)(a2 + 440);
    long long v40 = *v33;
    long long v39 = *(_OWORD *)(a2 + 408);
    *(_OWORD *)(a1 + 424) = *(_OWORD *)(a2 + 424);
    *(_OWORD *)(a1 + 440) = v38;
    *uint64_t v32 = v40;
    *(_OWORD *)(a1 + 408) = v39;
  }
  else
  {
    *(void *)(a1 + 392) = *(void *)(a2 + 392);
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 408) = *(void *)(a2 + 408);
    *(void *)(a1 + 416) = *(void *)(a2 + 416);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 424) = *(void *)(a2 + 424);
    *(void *)(a1 + 432) = *(void *)(a2 + 432);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 440) = *(void *)(a2 + 440);
    *(void *)(a1 + 448) = *(void *)(a2 + 448);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v41 = *(void *)(a2 + 464);
  if (*(void *)(a1 + 464) == 1)
  {
    if (v41 != 1)
    {
      *(void *)(a1 + 456) = *(void *)(a2 + 456);
      *(void *)(a1 + 464) = *(void *)(a2 + 464);
      swift_bridgeObjectRetain();
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  if (v41 == 1)
  {
    outlined destroy of SearchGlobalEntity.AppStoreAttributes(a1 + 456);
LABEL_51:
    *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
    goto LABEL_53;
  }
  *(void *)(a1 + 456) = *(void *)(a2 + 456);
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_53:
  *(unsigned char *)(a1 + 472) = *(unsigned char *)(a2 + 472);
  *(void *)(a1 + 480) = *(void *)(a2 + 480);
  swift_retain();
  swift_release();
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  swift_retain();
  swift_release();
  uint64_t v42 = (_OWORD *)(a1 + 496);
  long long v43 = (_OWORD *)(a2 + 496);
  uint64_t v44 = *(void *)(a2 + 504);
  if (*(void *)(a1 + 504))
  {
    if (v44)
    {
      *(void *)(a1 + 496) = *(void *)(a2 + 496);
      *(void *)(a1 + 504) = *(void *)(a2 + 504);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 512) = *(void *)(a2 + 512);
      *(void *)(a1 + 520) = *(void *)(a2 + 520);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      outlined destroy of GlobalDialog(a1 + 496);
      long long v45 = *(_OWORD *)(a2 + 512);
      *uint64_t v42 = *v43;
      *(_OWORD *)(a1 + 512) = v45;
    }
  }
  else if (v44)
  {
    *(void *)(a1 + 496) = *(void *)(a2 + 496);
    *(void *)(a1 + 504) = *(void *)(a2 + 504);
    *(void *)(a1 + 512) = *(void *)(a2 + 512);
    *(void *)(a1 + 520) = *(void *)(a2 + 520);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v46 = *(_OWORD *)(a2 + 512);
    *uint64_t v42 = *v43;
    *(_OWORD *)(a1 + 512) = v46;
  }
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t outlined destroy of Data(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of SearchGlobalEntity.GeneralAttributes(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of SearchGlobalEntity.PlaceAttributes(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of SearchGlobalEntity.IDAttributes(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of SearchGlobalEntity.ContactAttributes(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of SearchGlobalEntity.AppStoreAttributes(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of GlobalDialog(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy536_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x218uLL);
}

uint64_t assignWithTake for SearchGlobalEntity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  uint64_t v4 = (_OWORD *)(a2 + 16);
  unint64_t v5 = *(void *)(a1 + 24);
  if (v5 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v6 = *(void *)(a2 + 24);
  if (v6 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 16);
LABEL_4:
    *(_OWORD *)(a1 + 16) = *v4;
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)v4;
  *(void *)(a1 + 24) = v6;
  outlined consume of Data._Representation(v7, v5);
LABEL_6:
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  uint64_t v8 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
LABEL_13:
    memcpy((void *)(a1 + 48), (const void *)(a2 + 48), 0x48uLL);
    goto LABEL_16;
  }
  if (!v8)
  {
    outlined destroy of SearchGlobalEntity.GeneralAttributes(a1 + 48);
    goto LABEL_13;
  }
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)(a2 + 88);
  unint64_t v12 = *(void *)(a1 + 96);
  if (v12 >> 60 != 15)
  {
    unint64_t v13 = *(void *)(a2 + 96);
    if (v13 >> 60 != 15)
    {
      uint64_t v14 = *(void *)(a1 + 88);
      *(void *)(a1 + 88) = *v11;
      *(void *)(a1 + 96) = v13;
      outlined consume of Data._Representation(v14, v12);
      goto LABEL_15;
    }
    outlined destroy of Data(a1 + 88);
  }
  *(_OWORD *)(a1 + 88) = *(_OWORD *)v11;
LABEL_15:
  uint64_t v15 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v15;
  swift_bridgeObjectRelease();
LABEL_16:
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRelease();
  long long v16 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v16;
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  if (*(void *)(a1 + 176) == 1)
  {
LABEL_19:
    memcpy((void *)(a1 + 168), (const void *)(a2 + 168), 0xB9uLL);
    goto LABEL_21;
  }
  uint64_t v17 = *(void *)(a2 + 176);
  if (v17 == 1)
  {
    outlined destroy of SearchGlobalEntity.PlaceAttributes(a1 + 168);
    goto LABEL_19;
  }
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void *)(a2 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = v24;
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(a2 + 304);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(void *)(a1 + 304) = v25;
  swift_bridgeObjectRelease();
  uint64_t v26 = *(void *)(a2 + 320);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = v26;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
LABEL_21:
  if (*(void *)(a1 + 368) == 1)
  {
LABEL_24:
    long long v28 = *(_OWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = *(_OWORD *)(a2 + 360);
    *(_OWORD *)(a1 + 376) = v28;
    goto LABEL_26;
  }
  uint64_t v27 = *(void *)(a2 + 368);
  if (v27 == 1)
  {
    outlined destroy of SearchGlobalEntity.IDAttributes(a1 + 360);
    goto LABEL_24;
  }
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  *(void *)(a1 + 368) = v27;
  swift_bridgeObjectRelease();
  uint64_t v29 = *(void *)(a2 + 384);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = v29;
  swift_bridgeObjectRelease();
LABEL_26:
  if (*(void *)(a1 + 400) == 1)
  {
LABEL_29:
    long long v31 = *(_OWORD *)(a2 + 408);
    *(_OWORD *)(a1 + 392) = *(_OWORD *)(a2 + 392);
    *(_OWORD *)(a1 + 408) = v31;
    long long v32 = *(_OWORD *)(a2 + 440);
    *(_OWORD *)(a1 + 424) = *(_OWORD *)(a2 + 424);
    *(_OWORD *)(a1 + 440) = v32;
    goto LABEL_31;
  }
  uint64_t v30 = *(void *)(a2 + 400);
  if (v30 == 1)
  {
    outlined destroy of SearchGlobalEntity.ContactAttributes(a1 + 392);
    goto LABEL_29;
  }
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  *(void *)(a1 + 400) = v30;
  swift_bridgeObjectRelease();
  uint64_t v33 = *(void *)(a2 + 416);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  *(void *)(a1 + 416) = v33;
  swift_bridgeObjectRelease();
  uint64_t v34 = *(void *)(a2 + 432);
  *(void *)(a1 + 424) = *(void *)(a2 + 424);
  *(void *)(a1 + 432) = v34;
  swift_bridgeObjectRelease();
  uint64_t v35 = *(void *)(a2 + 448);
  *(void *)(a1 + 440) = *(void *)(a2 + 440);
  *(void *)(a1 + 448) = v35;
  swift_bridgeObjectRelease();
LABEL_31:
  long long v36 = (_OWORD *)(a2 + 456);
  if (*(void *)(a1 + 464) == 1)
  {
LABEL_34:
    *(_OWORD *)(a1 + 456) = *v36;
    goto LABEL_36;
  }
  uint64_t v37 = *(void *)(a2 + 464);
  if (v37 == 1)
  {
    outlined destroy of SearchGlobalEntity.AppStoreAttributes(a1 + 456);
    goto LABEL_34;
  }
  *(void *)(a1 + 456) = *(void *)v36;
  *(void *)(a1 + 464) = v37;
  swift_bridgeObjectRelease();
LABEL_36:
  *(unsigned char *)(a1 + 472) = *(unsigned char *)(a2 + 472);
  *(void *)(a1 + 480) = *(void *)(a2 + 480);
  swift_release();
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  swift_release();
  if (!*(void *)(a1 + 504))
  {
LABEL_40:
    long long v39 = *(_OWORD *)(a2 + 512);
    *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 496);
    *(_OWORD *)(a1 + 512) = v39;
    goto LABEL_41;
  }
  uint64_t v38 = *(void *)(a2 + 504);
  if (!v38)
  {
    outlined destroy of GlobalDialog(a1 + 496);
    goto LABEL_40;
  }
  *(void *)(a1 + 496) = *(void *)(a2 + 496);
  *(void *)(a1 + 504) = v38;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 512) = *(void *)(a2 + 512);
  *(void *)(a1 + 520) = *(void *)(a2 + 520);
  swift_bridgeObjectRelease();
LABEL_41:
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 536))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity(uint64_t result, int a2, int a3)
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
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
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
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 536) = 1;
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
    *(unsigned char *)(result + 536) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity()
{
}

uint64_t destroy for SearchGlobalEntity.Timestamp()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SearchGlobalEntity.Timestamp(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SearchGlobalEntity.Timestamp(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v3;
  uint64_t v4 = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SearchGlobalEntity.Timestamp(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.Timestamp(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 40);
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.Timestamp(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 40) = a2;
    }
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.Timestamp()
{
}

uint64_t destroy for SearchGlobalEntity.Temperature()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SearchGlobalEntity.Temperature(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SearchGlobalEntity.Temperature(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SearchGlobalEntity.Temperature(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.Temperature(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 25))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.Temperature(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.Temperature()
{
}

uint64_t destroy for SearchGlobalEntity.GeneralAttributes(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >> 60 != 15) {
    outlined consume of Data._Representation(*(void *)(a1 + 40), v2);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SearchGlobalEntity.GeneralAttributes(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = a2[4];
  unint64_t v6 = a2 + 5;
  unint64_t v7 = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v6;
  }
  else
  {
    uint64_t v8 = *v6;
    outlined copy of Data._Representation(*v6, v7);
    *(void *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = v7;
  }
  uint64_t v9 = a2[8];
  *(void *)(a1 + 56) = a2[7];
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SearchGlobalEntity.GeneralAttributes(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2 + 5;
  unint64_t v5 = a2[6];
  if (a1[6] >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      outlined copy of Data._Representation(*v4, a2[6]);
      uint64_t v8 = a1[5];
      unint64_t v9 = a1[6];
      a1[5] = v7;
      a1[6] = v5;
      outlined consume of Data._Representation(v8, v9);
      goto LABEL_8;
    }
    outlined destroy of Data((uint64_t)(a1 + 5));
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 5) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v6 = *v4;
  outlined copy of Data._Representation(*v4, a2[6]);
  a1[5] = v6;
  a1[6] = v5;
LABEL_8:
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

void *assignWithTake for SearchGlobalEntity.GeneralAttributes(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2 + 5;
  unint64_t v7 = a1[6];
  if (v7 >> 60 != 15)
  {
    unint64_t v8 = a2[6];
    if (v8 >> 60 != 15)
    {
      uint64_t v9 = a1[5];
      a1[5] = *v6;
      a1[6] = v8;
      outlined consume of Data._Representation(v9, v7);
      goto LABEL_6;
    }
    outlined destroy of Data((uint64_t)(a1 + 5));
  }
  *(_OWORD *)(a1 + 5) = *(_OWORD *)v6;
LABEL_6:
  uint64_t v10 = a2[8];
  a1[7] = a2[7];
  a1[8] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.GeneralAttributes(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 72))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.GeneralAttributes(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.GeneralAttributes()
{
}

uint64_t destroy for SearchGlobalEntity.CustomAttribute(uint64_t a1)
{
  return outlined consume of SearchGlobalEntity.CustomAttribute(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t *initializeWithCopy for SearchGlobalEntity.CustomAttribute(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  outlined copy of SearchGlobalEntity.CustomAttribute(*a2, v4, v5, v6);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return a1;
}

uint64_t *assignWithCopy for SearchGlobalEntity.CustomAttribute(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  outlined copy of SearchGlobalEntity.CustomAttribute(*a2, v4, v5, v6);
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v11 = a1[2];
  unint64_t v12 = a1[3];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  outlined consume of SearchGlobalEntity.CustomAttribute(v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for SearchGlobalEntity.CustomAttribute(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  long long v7 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = a2[2];
  outlined consume of SearchGlobalEntity.CustomAttribute(v3, v5, v4, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.CustomAttribute(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      int v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *(void *)(a1 + 24) >> 1;
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.CustomAttribute(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 0;
      *(void *)(result + 24) = 2 * -a2;
      *(void *)(result + 32) = 0;
      *(void *)(result + 40) = 0;
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t getEnumTag for SearchGlobalEntity.CustomAttribute(uint64_t a1)
{
  return *(void *)(a1 + 24) >> 62;
}

uint64_t destructiveProjectEnumData for SearchGlobalEntity.CustomAttribute(uint64_t result)
{
  *(void *)(result + 24) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t destructiveInjectEnumTag for SearchGlobalEntity.CustomAttribute(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = *(void *)(result + 24) & 1 | (a2 << 62);
  return result;
}

void type metadata accessor for SearchGlobalEntity.CustomAttribute()
{
}

void type metadata accessor for SearchGlobalEntity.EntityType()
{
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

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.EventAttributes(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && a1[33])
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *a1;
      if (v3 >= 2) {
        int v2 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
      }
      else {
        int v2 = -2;
      }
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.EventAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 2;
    }
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.EventAttributes()
{
}

uint64_t destroy for SearchGlobalEntity.PlaceAttributes()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SearchGlobalEntity.PlaceAttributes(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  uint64_t v10 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v10;
  uint64_t v11 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v11;
  uint64_t v12 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v12;
  uint64_t v13 = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = v13;
  uint64_t v14 = *(void *)(a2 + 176);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 176) = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SearchGlobalEntity.PlaceAttributes(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = v4;
  uint64_t v5 = *(void *)(a2 + 176);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 176) = v5;
  return a1;
}

void *__swift_memcpy185_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xB9uLL);
}

uint64_t assignWithTake for SearchGlobalEntity.PlaceAttributes(uint64_t a1, uint64_t a2)
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
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.PlaceAttributes(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 185))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.PlaceAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
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
    *(unsigned char *)(result + 184) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 185) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 185) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.PlaceAttributes()
{
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.IDAttributes(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.IDAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.IDAttributes()
{
}

uint64_t destroy for SearchGlobalEntity.ContactAttributes()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SearchGlobalEntity.ContactAttributes(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SearchGlobalEntity.ContactAttributes(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

void *assignWithTake for SearchGlobalEntity.ContactAttributes(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.ContactAttributes(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.ContactAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.ContactAttributes()
{
}

void *initializeBufferWithCopyOfBuffer for SearchGlobalEntity.AppStoreAttributes(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SearchGlobalEntity.AppStoreAttributes(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for SearchGlobalEntity.AppStoreAttributes(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.AppStoreAttributes(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.AppStoreAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.AppStoreAttributes()
{
}

uint64_t destroy for SearchGlobalEntity.Builder(uint64_t *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = a1[5];
  if (v2 >> 60 != 15) {
    outlined consume of Data._Representation(a1[4], v2);
  }
  swift_bridgeObjectRelease();
  if (a1[9])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v3 = a1[15];
    if (v3 >> 60 != 15) {
      outlined consume of Data._Representation(a1[14], v3);
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (a1[25] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[49] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[53] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[61] != 1) {
    swift_bridgeObjectRelease();
  }
  uint64_t result = a1[64];
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for SearchGlobalEntity.Builder(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = (uint64_t *)(a2 + 32);
  unint64_t v7 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v6;
  }
  else
  {
    uint64_t v8 = *v6;
    outlined copy of Data._Representation(*v6, v7);
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 40) = v7;
  }
  uint64_t v9 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v10;
  swift_bridgeObjectRetain();
  if (v9)
  {
    uint64_t v11 = *(void *)(a2 + 80);
    uint64_t v12 = *(void *)(a2 + 88);
    *(void *)(a1 + 72) = v9;
    *(void *)(a1 + 80) = v11;
    uint64_t v13 = *(void *)(a2 + 96);
    uint64_t v14 = *(void *)(a2 + 104);
    *(void *)(a1 + 88) = v12;
    *(void *)(a1 + 96) = v13;
    *(void *)(a1 + 104) = v14;
    uint64_t v15 = (uint64_t *)(a2 + 112);
    unint64_t v16 = *(void *)(a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 112) = *(_OWORD *)v15;
    }
    else
    {
      uint64_t v17 = *v15;
      outlined copy of Data._Representation(*v15, v16);
      *(void *)(a1 + 112) = v17;
      *(void *)(a1 + 120) = v16;
    }
    uint64_t v18 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = v18;
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(a1 + 72), (const void *)(a2 + 72), 0x48uLL);
  }
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  uint64_t v19 = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  if (v19 == 1)
  {
    memcpy((void *)(a1 + 192), (const void *)(a2 + 192), 0xB9uLL);
  }
  else
  {
    *(void *)(a1 + 192) = *(void *)(a2 + 192);
    *(void *)(a1 + 200) = v19;
    uint64_t v20 = *(void *)(a2 + 216);
    *(void *)(a1 + 208) = *(void *)(a2 + 208);
    *(void *)(a1 + 216) = v20;
    uint64_t v21 = *(void *)(a2 + 232);
    *(void *)(a1 + 224) = *(void *)(a2 + 224);
    *(void *)(a1 + 232) = v21;
    uint64_t v22 = *(void *)(a2 + 248);
    *(void *)(a1 + 240) = *(void *)(a2 + 240);
    *(void *)(a1 + 248) = v22;
    uint64_t v23 = *(void *)(a2 + 264);
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    *(void *)(a1 + 264) = v23;
    uint64_t v24 = *(void *)(a2 + 280);
    *(void *)(a1 + 272) = *(void *)(a2 + 272);
    *(void *)(a1 + 280) = v24;
    uint64_t v25 = *(void *)(a2 + 296);
    *(void *)(a1 + 288) = *(void *)(a2 + 288);
    *(void *)(a1 + 296) = v25;
    uint64_t v26 = *(void *)(a2 + 312);
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    *(void *)(a1 + 312) = v26;
    uint64_t v27 = *(void *)(a2 + 328);
    *(void *)(a1 + 320) = *(void *)(a2 + 320);
    *(void *)(a1 + 328) = v27;
    uint64_t v28 = *(void *)(a2 + 344);
    *(void *)(a1 + 336) = *(void *)(a2 + 336);
    *(void *)(a1 + 344) = v28;
    uint64_t v29 = *(void *)(a2 + 352);
    *(unsigned char *)(a1 + 360) = *(unsigned char *)(a2 + 360);
    *(void *)(a1 + 352) = v29;
    uint64_t v30 = *(void *)(a2 + 368);
    *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
    *(void *)(a1 + 368) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v31 = *(void *)(a2 + 392);
  if (v31 == 1)
  {
    long long v32 = *(_OWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
    *(_OWORD *)(a1 + 400) = v32;
  }
  else
  {
    *(void *)(a1 + 384) = *(void *)(a2 + 384);
    *(void *)(a1 + 392) = v31;
    uint64_t v33 = *(void *)(a2 + 408);
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
    *(void *)(a1 + 408) = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v34 = *(void *)(a2 + 424);
  if (v34 == 1)
  {
    long long v35 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
    *(_OWORD *)(a1 + 432) = v35;
    long long v36 = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v36;
  }
  else
  {
    *(void *)(a1 + 416) = *(void *)(a2 + 416);
    *(void *)(a1 + 424) = v34;
    uint64_t v37 = *(void *)(a2 + 440);
    *(void *)(a1 + 432) = *(void *)(a2 + 432);
    *(void *)(a1 + 440) = v37;
    uint64_t v38 = *(void *)(a2 + 456);
    *(void *)(a1 + 448) = *(void *)(a2 + 448);
    *(void *)(a1 + 456) = v38;
    uint64_t v39 = *(void *)(a2 + 472);
    *(void *)(a1 + 464) = *(void *)(a2 + 464);
    *(void *)(a1 + 472) = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  long long v40 = (_OWORD *)(a2 + 480);
  uint64_t v41 = *(void *)(a2 + 488);
  if (v41 == 1)
  {
    *(_OWORD *)(a1 + 480) = *v40;
  }
  else
  {
    *(void *)(a1 + 480) = *(void *)v40;
    *(void *)(a1 + 488) = v41;
    swift_bridgeObjectRetain();
  }
  *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
  uint64_t v42 = *(void *)(a2 + 512);
  if (v42)
  {
    *(void *)(a1 + 504) = *(void *)(a2 + 504);
    *(void *)(a1 + 512) = v42;
    *(void *)(a1 + 520) = *(void *)(a2 + 520);
    *(void *)(a1 + 528) = *(void *)(a2 + 528);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v43 = *(_OWORD *)(a2 + 520);
    *(_OWORD *)(a1 + 504) = *(_OWORD *)(a2 + 504);
    *(_OWORD *)(a1 + 520) = v43;
  }
  return a1;
}

uint64_t assignWithCopy for SearchGlobalEntity.Builder(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t *)(a2 + 32);
  unint64_t v5 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40) >> 60 == 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *v4;
      outlined copy of Data._Representation(*v4, *(void *)(a2 + 40));
      *(void *)(a1 + 32) = v6;
      *(void *)(a1 + 40) = v5;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 32);
LABEL_6:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v7 = *v4;
  outlined copy of Data._Representation(*v4, *(void *)(a2 + 40));
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v5;
  outlined consume of Data._Representation(v8, v9);
LABEL_8:
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72))
  {
    if (v10)
    {
      *(void *)(a1 + 72) = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v11 = (uint64_t *)(a2 + 112);
      unint64_t v12 = *(void *)(a2 + 120);
      if (*(void *)(a1 + 120) >> 60 == 15)
      {
        if (v12 >> 60 != 15)
        {
          uint64_t v13 = *v11;
          outlined copy of Data._Representation(*v11, *(void *)(a2 + 120));
          *(void *)(a1 + 112) = v13;
          *(void *)(a1 + 120) = v12;
LABEL_24:
          *(void *)(a1 + 128) = *(void *)(a2 + 128);
          *(void *)(a1 + 136) = *(void *)(a2 + 136);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
      }
      else
      {
        if (v12 >> 60 != 15)
        {
          uint64_t v17 = *v11;
          outlined copy of Data._Representation(*v11, *(void *)(a2 + 120));
          uint64_t v18 = *(void *)(a1 + 112);
          unint64_t v19 = *(void *)(a1 + 120);
          *(void *)(a1 + 112) = v17;
          *(void *)(a1 + 120) = v12;
          outlined consume of Data._Representation(v18, v19);
          goto LABEL_24;
        }
        outlined destroy of Data(a1 + 112);
      }
      *(_OWORD *)(a1 + 112) = *(_OWORD *)v11;
      goto LABEL_24;
    }
    outlined destroy of SearchGlobalEntity.GeneralAttributes(a1 + 72);
LABEL_17:
    memcpy((void *)(a1 + 72), (const void *)(a2 + 72), 0x48uLL);
    goto LABEL_25;
  }
  if (!v10) {
    goto LABEL_17;
  }
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v14 = (uint64_t *)(a2 + 112);
  unint64_t v15 = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)v14;
  }
  else
  {
    uint64_t v16 = *v14;
    outlined copy of Data._Representation(*v14, v15);
    *(void *)(a1 + 112) = v16;
    *(void *)(a1 + 120) = v15;
  }
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
LABEL_25:
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v20 = *(_OWORD *)(a2 + 152);
  long long v21 = *(_OWORD *)(a2 + 168);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(_OWORD *)(a1 + 168) = v21;
  *(_OWORD *)(a1 + 152) = v20;
  uint64_t v22 = *(void *)(a2 + 200);
  if (*(void *)(a1 + 200) == 1)
  {
    if (v22 != 1)
    {
      *(void *)(a1 + 192) = *(void *)(a2 + 192);
      *(void *)(a1 + 200) = *(void *)(a2 + 200);
      *(void *)(a1 + 208) = *(void *)(a2 + 208);
      *(void *)(a1 + 216) = *(void *)(a2 + 216);
      *(void *)(a1 + 224) = *(void *)(a2 + 224);
      *(void *)(a1 + 232) = *(void *)(a2 + 232);
      *(void *)(a1 + 240) = *(void *)(a2 + 240);
      *(void *)(a1 + 248) = *(void *)(a2 + 248);
      *(void *)(a1 + 256) = *(void *)(a2 + 256);
      *(void *)(a1 + 264) = *(void *)(a2 + 264);
      *(void *)(a1 + 272) = *(void *)(a2 + 272);
      *(void *)(a1 + 280) = *(void *)(a2 + 280);
      *(void *)(a1 + 288) = *(void *)(a2 + 288);
      *(void *)(a1 + 296) = *(void *)(a2 + 296);
      *(void *)(a1 + 304) = *(void *)(a2 + 304);
      *(void *)(a1 + 312) = *(void *)(a2 + 312);
      *(void *)(a1 + 320) = *(void *)(a2 + 320);
      *(void *)(a1 + 328) = *(void *)(a2 + 328);
      *(void *)(a1 + 336) = *(void *)(a2 + 336);
      *(void *)(a1 + 344) = *(void *)(a2 + 344);
      uint64_t v23 = *(void *)(a2 + 352);
      *(unsigned char *)(a1 + 360) = *(unsigned char *)(a2 + 360);
      *(void *)(a1 + 352) = v23;
      uint64_t v24 = *(void *)(a2 + 368);
      *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
      *(void *)(a1 + 368) = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (v22 == 1)
  {
    outlined destroy of SearchGlobalEntity.PlaceAttributes(a1 + 192);
LABEL_30:
    memcpy((void *)(a1 + 192), (const void *)(a2 + 192), 0xB9uLL);
    goto LABEL_32;
  }
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(a2 + 352);
  *(unsigned char *)(a1 + 360) = *(unsigned char *)(a2 + 360);
  *(void *)(a1 + 352) = v25;
  uint64_t v26 = *(void *)(a2 + 368);
  *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
  *(void *)(a1 + 368) = v26;
LABEL_32:
  uint64_t v27 = (_OWORD *)(a1 + 384);
  uint64_t v28 = (_OWORD *)(a2 + 384);
  uint64_t v29 = *(void *)(a2 + 392);
  if (*(void *)(a1 + 392) == 1)
  {
    if (v29 == 1)
    {
      long long v30 = *(_OWORD *)(a2 + 400);
      *uint64_t v27 = *v28;
      *(_OWORD *)(a1 + 400) = v30;
    }
    else
    {
      *(void *)(a1 + 384) = *(void *)(a2 + 384);
      *(void *)(a1 + 392) = *(void *)(a2 + 392);
      *(void *)(a1 + 400) = *(void *)(a2 + 400);
      *(void *)(a1 + 408) = *(void *)(a2 + 408);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v29 == 1)
  {
    outlined destroy of SearchGlobalEntity.IDAttributes(a1 + 384);
    long long v31 = *(_OWORD *)(a2 + 400);
    *uint64_t v27 = *v28;
    *(_OWORD *)(a1 + 400) = v31;
  }
  else
  {
    *(void *)(a1 + 384) = *(void *)(a2 + 384);
    *(void *)(a1 + 392) = *(void *)(a2 + 392);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
    *(void *)(a1 + 408) = *(void *)(a2 + 408);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  long long v32 = (_OWORD *)(a1 + 416);
  uint64_t v33 = (long long *)(a2 + 416);
  uint64_t v34 = *(void *)(a2 + 424);
  if (*(void *)(a1 + 424) == 1)
  {
    if (v34 == 1)
    {
      long long v35 = *v33;
      long long v36 = *(_OWORD *)(a2 + 432);
      long long v37 = *(_OWORD *)(a2 + 464);
      *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
      *(_OWORD *)(a1 + 464) = v37;
      *long long v32 = v35;
      *(_OWORD *)(a1 + 432) = v36;
    }
    else
    {
      *(void *)(a1 + 416) = *(void *)(a2 + 416);
      *(void *)(a1 + 424) = *(void *)(a2 + 424);
      *(void *)(a1 + 432) = *(void *)(a2 + 432);
      *(void *)(a1 + 440) = *(void *)(a2 + 440);
      *(void *)(a1 + 448) = *(void *)(a2 + 448);
      *(void *)(a1 + 456) = *(void *)(a2 + 456);
      *(void *)(a1 + 464) = *(void *)(a2 + 464);
      *(void *)(a1 + 472) = *(void *)(a2 + 472);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v34 == 1)
  {
    outlined destroy of SearchGlobalEntity.ContactAttributes(a1 + 416);
    long long v38 = *(_OWORD *)(a2 + 464);
    long long v40 = *v33;
    long long v39 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v38;
    *long long v32 = v40;
    *(_OWORD *)(a1 + 432) = v39;
  }
  else
  {
    *(void *)(a1 + 416) = *(void *)(a2 + 416);
    *(void *)(a1 + 424) = *(void *)(a2 + 424);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 432) = *(void *)(a2 + 432);
    *(void *)(a1 + 440) = *(void *)(a2 + 440);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 448) = *(void *)(a2 + 448);
    *(void *)(a1 + 456) = *(void *)(a2 + 456);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 464) = *(void *)(a2 + 464);
    *(void *)(a1 + 472) = *(void *)(a2 + 472);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v41 = *(void *)(a2 + 488);
  if (*(void *)(a1 + 488) == 1)
  {
    if (v41 != 1)
    {
      *(void *)(a1 + 480) = *(void *)(a2 + 480);
      *(void *)(a1 + 488) = *(void *)(a2 + 488);
      swift_bridgeObjectRetain();
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  if (v41 == 1)
  {
    outlined destroy of SearchGlobalEntity.AppStoreAttributes(a1 + 480);
LABEL_51:
    *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
    goto LABEL_53;
  }
  *(void *)(a1 + 480) = *(void *)(a2 + 480);
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_53:
  *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
  uint64_t v42 = (_OWORD *)(a1 + 504);
  long long v43 = (_OWORD *)(a2 + 504);
  uint64_t v44 = *(void *)(a2 + 512);
  if (*(void *)(a1 + 512))
  {
    if (v44)
    {
      *(void *)(a1 + 504) = *(void *)(a2 + 504);
      *(void *)(a1 + 512) = *(void *)(a2 + 512);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 520) = *(void *)(a2 + 520);
      *(void *)(a1 + 528) = *(void *)(a2 + 528);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      outlined destroy of GlobalDialog(a1 + 504);
      long long v45 = *(_OWORD *)(a2 + 520);
      *uint64_t v42 = *v43;
      *(_OWORD *)(a1 + 520) = v45;
    }
  }
  else if (v44)
  {
    *(void *)(a1 + 504) = *(void *)(a2 + 504);
    *(void *)(a1 + 512) = *(void *)(a2 + 512);
    *(void *)(a1 + 520) = *(void *)(a2 + 520);
    *(void *)(a1 + 528) = *(void *)(a2 + 528);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v46 = *(_OWORD *)(a2 + 520);
    *uint64_t v42 = *v43;
    *(_OWORD *)(a1 + 520) = v46;
  }
  return a1;
}

uint64_t assignWithTake for SearchGlobalEntity.Builder(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = (_OWORD *)(a2 + 32);
  unint64_t v7 = *(void *)(a1 + 40);
  if (v7 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v8 = *(void *)(a2 + 40);
  if (v8 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 32);
LABEL_4:
    *(_OWORD *)(a1 + 32) = *v6;
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)v6;
  *(void *)(a1 + 40) = v8;
  outlined consume of Data._Representation(v9, v7);
LABEL_6:
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 72);
  if (!*(void *)(a1 + 72))
  {
LABEL_13:
    memcpy((void *)(a1 + 72), (const void *)(a2 + 72), 0x48uLL);
    goto LABEL_16;
  }
  if (!v11)
  {
    outlined destroy of SearchGlobalEntity.GeneralAttributes(a1 + 72);
    goto LABEL_13;
  }
  *(void *)(a1 + 72) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)(a2 + 112);
  unint64_t v15 = *(void *)(a1 + 120);
  if (v15 >> 60 != 15)
  {
    unint64_t v16 = *(void *)(a2 + 120);
    if (v16 >> 60 != 15)
    {
      uint64_t v17 = *(void *)(a1 + 112);
      *(void *)(a1 + 112) = *v14;
      *(void *)(a1 + 120) = v16;
      outlined consume of Data._Representation(v17, v15);
      goto LABEL_15;
    }
    outlined destroy of Data(a1 + 112);
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)v14;
LABEL_15:
  uint64_t v18 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v18;
  swift_bridgeObjectRelease();
LABEL_16:
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  if (*(void *)(a1 + 200) == 1)
  {
LABEL_19:
    memcpy((void *)(a1 + 192), (const void *)(a2 + 192), 0xB9uLL);
    goto LABEL_21;
  }
  uint64_t v19 = *(void *)(a2 + 200);
  if (v19 == 1)
  {
    outlined destroy of SearchGlobalEntity.PlaceAttributes(a1 + 192);
    goto LABEL_19;
  }
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v24;
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v25;
  swift_bridgeObjectRelease();
  uint64_t v26 = *(void *)(a2 + 312);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = v26;
  swift_bridgeObjectRelease();
  uint64_t v27 = *(void *)(a2 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v27;
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void *)(a2 + 344);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  *(void *)(a1 + 344) = v28;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 352) = *(void *)(a2 + 352);
  *(unsigned char *)(a1 + 360) = *(unsigned char *)(a2 + 360);
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
LABEL_21:
  if (*(void *)(a1 + 392) == 1)
  {
LABEL_24:
    long long v30 = *(_OWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
    *(_OWORD *)(a1 + 400) = v30;
    goto LABEL_26;
  }
  uint64_t v29 = *(void *)(a2 + 392);
  if (v29 == 1)
  {
    outlined destroy of SearchGlobalEntity.IDAttributes(a1 + 384);
    goto LABEL_24;
  }
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  *(void *)(a1 + 392) = v29;
  swift_bridgeObjectRelease();
  uint64_t v31 = *(void *)(a2 + 408);
  *(void *)(a1 + 400) = *(void *)(a2 + 400);
  *(void *)(a1 + 408) = v31;
  swift_bridgeObjectRelease();
LABEL_26:
  if (*(void *)(a1 + 424) == 1)
  {
LABEL_29:
    long long v33 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
    *(_OWORD *)(a1 + 432) = v33;
    long long v34 = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v34;
    goto LABEL_31;
  }
  uint64_t v32 = *(void *)(a2 + 424);
  if (v32 == 1)
  {
    outlined destroy of SearchGlobalEntity.ContactAttributes(a1 + 416);
    goto LABEL_29;
  }
  *(void *)(a1 + 416) = *(void *)(a2 + 416);
  *(void *)(a1 + 424) = v32;
  swift_bridgeObjectRelease();
  uint64_t v35 = *(void *)(a2 + 440);
  *(void *)(a1 + 432) = *(void *)(a2 + 432);
  *(void *)(a1 + 440) = v35;
  swift_bridgeObjectRelease();
  uint64_t v36 = *(void *)(a2 + 456);
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  *(void *)(a1 + 456) = v36;
  swift_bridgeObjectRelease();
  uint64_t v37 = *(void *)(a2 + 472);
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  *(void *)(a1 + 472) = v37;
  swift_bridgeObjectRelease();
LABEL_31:
  long long v38 = (_OWORD *)(a2 + 480);
  if (*(void *)(a1 + 488) == 1)
  {
LABEL_34:
    *(_OWORD *)(a1 + 480) = *v38;
    goto LABEL_36;
  }
  uint64_t v39 = *(void *)(a2 + 488);
  if (v39 == 1)
  {
    outlined destroy of SearchGlobalEntity.AppStoreAttributes(a1 + 480);
    goto LABEL_34;
  }
  *(void *)(a1 + 480) = *(void *)v38;
  *(void *)(a1 + 488) = v39;
  swift_bridgeObjectRelease();
LABEL_36:
  *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
  if (!*(void *)(a1 + 512))
  {
LABEL_40:
    long long v41 = *(_OWORD *)(a2 + 520);
    *(_OWORD *)(a1 + 504) = *(_OWORD *)(a2 + 504);
    *(_OWORD *)(a1 + 520) = v41;
    return a1;
  }
  uint64_t v40 = *(void *)(a2 + 512);
  if (!v40)
  {
    outlined destroy of GlobalDialog(a1 + 504);
    goto LABEL_40;
  }
  *(void *)(a1 + 504) = *(void *)(a2 + 504);
  *(void *)(a1 + 512) = v40;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 520) = *(void *)(a2 + 520);
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.Builder(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 536))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.Builder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
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
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
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
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 536) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 536) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.Builder()
{
}

void type metadata accessor for SearchGlobalEntity.Query()
{
}

unint64_t sub_2586F0898()
{
  return lazy protocol witness table accessor for type EmptyResolverSpecification<SearchGlobalEntity> and conformance EmptyResolverSpecification<A>((uint64_t)&lazy protocol witness table cache variable for type DataRepresentation<SearchGlobalEntity> and conformance DataRepresentation<A>);
}

unint64_t lazy protocol witness table accessor for type EmptyResolverSpecification<SearchGlobalEntity> and conformance EmptyResolverSpecification<A>(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_75(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF0)
  {
    if (a2 + 16 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 16) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 17;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v5 = v6 - 17;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SearchGlobalEntity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *unint64_t result = a2 + 16;
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
        JUMPOUT(0x2586F0A68);
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
          *unint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

void *type metadata accessor for SearchGlobalEntity.CodingKeys()
{
  return &unk_2706BB9B8;
}

void *type metadata accessor for SearchGlobalEntity.AppStoreAttributes.CodingKeys()
{
  return &unk_2706BBA48;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.ContactAttributes.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SearchGlobalEntity.ContactAttributes.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x2586F0C0CLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

void *type metadata accessor for SearchGlobalEntity.ContactAttributes.CodingKeys()
{
  return &unk_2706BBAD8;
}

void *type metadata accessor for SearchGlobalEntity.IDAttributes.CodingKeys()
{
  return &unk_2706BBB68;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.PlaceAttributes.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF5)
  {
    if (a2 + 11 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 11) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v5 = v6 - 12;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SearchGlobalEntity.PlaceAttributes.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x2586F0DACLL);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

void *type metadata accessor for SearchGlobalEntity.PlaceAttributes.CodingKeys()
{
  return &unk_2706BBBF8;
}

void *type metadata accessor for SearchGlobalEntity.EventAttributes.CodingKeys()
{
  return &unk_2706BBC88;
}

void *type metadata accessor for SearchGlobalEntity.EntityType.CodingKeys()
{
  return &unk_2706BBD18;
}

void *type metadata accessor for SearchGlobalEntity.EntityType.GenericCodingKeys()
{
  return &unk_2706BBD38;
}

void *type metadata accessor for SearchGlobalEntity.EntityType.MapsCodingKeys()
{
  return &unk_2706BBD58;
}

void *type metadata accessor for SearchGlobalEntity.EntityType.UnknownCodingKeys()
{
  return &unk_2706BBD78;
}

void *type metadata accessor for SearchGlobalEntity.CustomAttribute.CodingKeys()
{
  return &unk_2706BBE08;
}

void *type metadata accessor for SearchGlobalEntity.CustomAttribute.StringCodingKeys()
{
  return &unk_2706BBE98;
}

void *type metadata accessor for SearchGlobalEntity.CustomAttribute.TimestampCodingKeys()
{
  return &unk_2706BBF28;
}

unsigned char *storeEnumTagSinglePayload for SearchGlobalEntity.AppStoreAttributes.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2586F0F00);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys()
{
  return &unk_2706BBFB8;
}

unsigned char *storeEnumTagSinglePayload for SearchGlobalEntity.GeneralAttributes.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2586F1004);
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

void *type metadata accessor for SearchGlobalEntity.GeneralAttributes.CodingKeys()
{
  return &unk_2706BC048;
}

unsigned char *storeEnumTagSinglePayload for SearchGlobalEntity.IDAttributes.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2586F1108);
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

void *type metadata accessor for SearchGlobalEntity.Temperature.CodingKeys()
{
  return &unk_2706BC0D8;
}

unsigned char *storeEnumTagSinglePayload for SearchGlobalEntity.EntityType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2586F120CLL);
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

void *type metadata accessor for SearchGlobalEntity.Timestamp.CodingKeys()
{
  return &unk_2706BC168;
}

uint64_t outlined init with copy of IntentFile?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_46();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t _s10AppIntents10IntentFileVSgWOhTm_0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_6_1();
  v3();
  return a1;
}

unint64_t lazy protocol witness table accessor for type IntentFile and conformance IntentFile(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_75(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

void OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,unint64_t a36,unint64_t a37,unint64_t a38,unint64_t a39,unint64_t a40,unint64_t a41,unint64_t a42)
{
  STACK[0x628] = a39;
  STACK[0x630] = v42;
  STACK[0x638] = a38;
  STACK[0x640] = a42;
  STACK[0x648] = a37;
  STACK[0x650] = a41;
  STACK[0x658] = a36;
  STACK[0x660] = a40;
}

uint64_t OUTLINED_FUNCTION_21()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0;
}

void OUTLINED_FUNCTION_24()
{
  v0[14] = 0;
  v0[15] = 0;
  v0[16] = 0;
  v0[17] = 0;
  v0[18] = 0;
  v0[19] = 0;
  v0[13] = 0;
  v0[21] = 0;
  v0[22] = 0;
  v0[10] = 0;
  v0[11] = 0;
  v0[23] = 0;
  v0[24] = 0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return 0;
}

void *OUTLINED_FUNCTION_32()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return outlined copy of SearchGlobalEntity.ContactAttributes?(a1, a2);
}

uint64_t OUTLINED_FUNCTION_37()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

void OUTLINED_FUNCTION_38()
{
  v0[14] = 0;
  v0[15] = 0;
  v0[16] = 0;
  v0[17] = 0;
  v0[18] = 0;
  v0[19] = 0;
  v0[13] = 0;
  v0[21] = 0;
  v0[22] = 0;
  v0[11] = 0;
}

uint64_t OUTLINED_FUNCTION_41()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return String.nilIfEmpty.getter(v0, v1);
}

uint64_t OUTLINED_FUNCTION_45(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_47()
{
  return Apple_Parsec_Siri_V2alpha_AppEntityMetadata.placeAttributes.getter();
}

uint64_t OUTLINED_FUNCTION_49()
{
  outlined copy of Data?(v1, v0);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return String.nilIfEmpty.getter(v0, v1);
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_52@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return outlined copy of GlobalDialog?(a1, a2);
}

uint64_t OUTLINED_FUNCTION_53@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return outlined copy of SearchGlobalEntity.IDAttributes?(a1, a2);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return v0 + 344;
}

uint64_t OUTLINED_FUNCTION_55()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_56(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_57()
{
  return *(void *)(v0 + 216);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_61(uint64_t a1)
{
  return MEMORY[0x270F9F2C0](a1, v1);
}

void *OUTLINED_FUNCTION_62(void *a1)
{
  return memcpy(a1, (const void *)(v1 + 4280), 0x218uLL);
}

void OUTLINED_FUNCTION_63()
{
  *(unsigned char *)(v0 - 67) = 2;
}

uint64_t OUTLINED_FUNCTION_64()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_65()
{
  *(unsigned char *)(v0 - 65) = 0;
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_67()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_69(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_70@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
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
  return outlined copy of SearchGlobalEntity.GeneralAttributes?(result, a2, a3, a4, a5, a6, a7);
}

uint64_t OUTLINED_FUNCTION_71@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return outlined copy of SearchGlobalEntity.AppStoreAttributes?(a1, a2);
}

uint64_t OUTLINED_FUNCTION_73()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_74()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_75(uint64_t a1)
{
  return *(void *)a1;
}

void *OUTLINED_FUNCTION_76()
{
  return malloc(0x28uLL);
}

void *OUTLINED_FUNCTION_77(void *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_79()
{
  return v0;
}

__n128 OUTLINED_FUNCTION_81(uint64_t a1)
{
  return *(__n128 *)a1;
}

uint64_t OUTLINED_FUNCTION_82()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

void OUTLINED_FUNCTION_83()
{
  v0[14] = 0;
  v0[15] = 0;
  v0[16] = 0;
  v0[17] = 0;
  v0[18] = 0;
  v0[19] = 0;
  v0[13] = 0;
}

uint64_t OUTLINED_FUNCTION_84()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_85()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_86()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_87()
{
  return v0;
}

void OUTLINED_FUNCTION_88(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 32) = v1;
}

uint64_t OUTLINED_FUNCTION_90()
{
  *(unsigned char *)(v0 - 66) = 1;
  return *(void *)(v0 - 96);
}

uint64_t OUTLINED_FUNCTION_91()
{
  *(unsigned char *)(v0 - 66) = 1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_92()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_93()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_94()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_95()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_99()
{
  outlined copy of Data?(v1, v0);
  outlined copy of Data?(v3, v2);
  return v1;
}

uint64_t OUTLINED_FUNCTION_101()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_102()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_104(uint64_t a1)
{
  return outlined copy of SearchGlobalEntity.CustomAttribute(a1, v2, v3, v1);
}

uint64_t OUTLINED_FUNCTION_107()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_108()
{
  *(void *)(v0 + 552) = *(void *)(v0 + 112);
  *(unsigned char *)(v0 + 560) = *(unsigned char *)(v1 - 96);
}

uint64_t OUTLINED_FUNCTION_109()
{
  return *(void *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_110()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t OUTLINED_FUNCTION_111()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_115()
{
  return v0 + 392;
}

uint64_t OUTLINED_FUNCTION_116()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_117()
{
  *(void *)(v1 - 112) = *(void *)(v1 - 168);
  *(unsigned char *)(v1 - 104) = v0 & 1;
}

uint64_t OUTLINED_FUNCTION_118()
{
  *(unsigned char *)(v0 - 66) = 1;
  return *(void *)(v0 - 96);
}

void OUTLINED_FUNCTION_119(unsigned char *a1@<X8>)
{
  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_120()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return outlined consume of Data?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_122()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_123()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_124()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_125()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_127()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_128()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_129(uint64_t a1)
{
  *(void *)(v1 + 3008) = a1;
  return v1 + 3008;
}

uint64_t OUTLINED_FUNCTION_130()
{
  return *(void *)(v0 + 16);
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  uint64_t v2 = 1701736302;
  if (a1)
  {
    OUTLINED_FUNCTION_2_1();
    if (v3) {
      uint64_t v5 = 0x7473726966;
    }
    else {
      uint64_t v5 = 1953718636;
    }
    if (v3) {
      unint64_t v6 = v4;
    }
    else {
      unint64_t v6 = 0xE400000000000000;
    }
  }
  else
  {
    unint64_t v6 = 0xE400000000000000;
    uint64_t v5 = 1701736302;
  }
  if (a2)
  {
    OUTLINED_FUNCTION_2_1();
    if (v7) {
      uint64_t v2 = 0x7473726966;
    }
    else {
      uint64_t v2 = 1953718636;
    }
    if (v7) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = 0xE400000000000000;
    }
  }
  else
  {
    unint64_t v9 = 0xE400000000000000;
  }
  if (v5 == v2 && v6 == v9) {
    char v11 = 1;
  }
  else {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x7469746E45707061;
  unint64_t v3 = 0xE900000000000079;
  uint64_t v4 = a1;
  uint64_t v5 = 0x7469746E45707061;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x6C61626F6C67;
      break;
    case 2:
      uint64_t v5 = 0x6867696C746F7073;
      unint64_t v3 = 0xE900000000000074;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x746E657665;
      break;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x647261436469;
      break;
    case 5:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x616964656DLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE900000000000079;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x6C61626F6C67;
      break;
    case 2:
      uint64_t v2 = 0x6867696C746F7073;
      unint64_t v6 = 0xE900000000000074;
      break;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x746E657665;
      break;
    case 4:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x647261436469;
      break;
    case 5:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x616964656DLL;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(char a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(0, a1);
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_2_1();
  }
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_2_1();
  }
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t static SearchResultType.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for typeDisplayRepresentation != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchResultType.typeDisplayRepresentation);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static SearchResultType.typeDisplayRepresentation.setter(uint64_t a1)
{
  if (one-time initialization token for typeDisplayRepresentation != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchResultType.typeDisplayRepresentation);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static SearchResultType.typeDisplayRepresentation.modify())()
{
  if (one-time initialization token for typeDisplayRepresentation != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for TypeDisplayRepresentation();
  __swift_project_value_buffer(v0, (uint64_t)static SearchResultType.typeDisplayRepresentation);
  swift_beginAccess();
  return MemoryCreationQUPerformanceMetrics.llmQUModelLatency.modify;
}

uint64_t static SearchResultType.caseDisplayRepresentations.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DisplayRepresentation.Image?);
  MEMORY[0x270FA5388](v0 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2 - v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LocalizedStringResource?);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for LocalizedStringResource();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(SearchResultType, DisplayRepresentation)>);
  uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (SearchResultType, DisplayRepresentation))
                 - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_2586F9DC0;
  unint64_t v12 = v19 + v11;
  *(unsigned char *)(v19 + v11) = 0;
  LocalizedStringResource.init(stringLiteral:)();
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  uint64_t v13 = type metadata accessor for DisplayRepresentation.Image();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v13);
  DisplayRepresentation.init(title:subtitle:image:)();
  OUTLINED_FUNCTION_3_2();
  *uint64_t v14 = 1;
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_2(v15);
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_2(v16);
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_2(v17);
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_2((unsigned char *)(v12 + 5 * v10));
  LocalizedStringResource.init(stringLiteral:)();
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v13);
  DisplayRepresentation.init(title:subtitle:image:)();
  type metadata accessor for DisplayRepresentation();
  lazy protocol witness table accessor for type SearchResultType and conformance SearchResultType();
  return Dictionary.init(dictionaryLiteral:)();
}

unint64_t lazy protocol witness table accessor for type SearchResultType and conformance SearchResultType()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

OmniSearchTypes::SearchResultType_optional __swiftcall SearchResultType.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SearchResultType.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 6;
  if (v5 < 6) {
    char v7 = v5;
  }
  *uint64_t v4 = v7;
  return result;
}

void *static SearchResultType.allCases.getter()
{
  return &outlined read-only object #0 of static SearchResultType.allCases.getter;
}

uint64_t SearchResultType.rawValue.getter()
{
  uint64_t result = 0x7469746E45707061;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6C61626F6C67;
      break;
    case 2:
      uint64_t result = 0x6867696C746F7073;
      break;
    case 3:
      uint64_t result = 0x746E657665;
      break;
    case 4:
      uint64_t result = 0x647261436469;
      break;
    case 5:
      uint64_t result = 0x616964656DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SearchResultType(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SearchResultType()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SearchResultType()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SearchResultType()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

OmniSearchTypes::SearchResultType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance SearchResultType(Swift::String *a1)
{
  return SearchResultType.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SearchResultType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SearchResultType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t lazy protocol witness table accessor for type [SearchResultType] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [SearchResultType] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SearchResultType] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SearchResultType]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SearchResultType] and conformance [A]);
  }
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance SearchResultType(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static SearchResultType.allCases.getter;
}

uint64_t associated type witness table accessor for RawRepresentable.RawValue : LosslessStringConvertible in SearchResultType()
{
  return MEMORY[0x263F8D380];
}

uint64_t associated type witness table accessor for _IntentValue.Specification : ResolverSpecification in SearchResultType()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for static _IntentValue.defaultResolverSpecification.getter in conformance SearchResultType(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchResultType and conformance SearchResultType();

  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t protocol witness for CustomLocalizedStringResourceConvertible.localizedStringResource.getter in conformance SearchResultType(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchResultType and conformance SearchResultType();

  return MEMORY[0x270EE1C28](a1, v2);
}

uint64_t getEnumTagSinglePayload for SearchResultType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SearchResultType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x2586F4240);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchResultType()
{
  return &type metadata for SearchResultType;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v3);
  return DisplayRepresentation.init(title:subtitle:image:)();
}

void OUTLINED_FUNCTION_4_2(unsigned char *a1@<X8>)
{
  *a1 = v1;
}

uint64_t String.nilIfEmpty.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  uint64_t v3 = a1;
  swift_bridgeObjectRetain();
  return v3;
}

Swift::String __swiftcall String.splitByCapitalLetters()()
{
  unint64_t v2 = v1;
  unint64_t v3 = v0;
  swift_bridgeObjectRetain();
  unint64_t v4 = specialized Collection.dropFirst(_:)(1uLL, v3, v2);
  unint64_t v6 = v5;
  unint64_t v8 = v7;
  unint64_t v10 = v9;
  swift_bridgeObjectRetain();
  uint64_t v11 = specialized Collection.prefix(_:)(1);
  uint64_t v12 = MEMORY[0x25A2C9E90](v11);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = specialized Sequence.reduce<A>(_:_:)(v12, v14, v4, v6, v8, v10);
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = v15;
  uint64_t v19 = v17;
  result._object = v19;
  result._uint64_t countAndFlagsBits = v18;
  return result;
}

unint64_t specialized Collection.dropFirst(_:)(unint64_t result, unint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0) {
      uint64_t v3 = HIBYTE(a3) & 0xF;
    }
    else {
      uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v4 = 11;
    }
    unint64_t v5 = v4 | (v3 << 16);
    Swift::String result = String.UnicodeScalarView.index(_:offsetBy:limitedBy:)(0xFuLL, result, v5, a2, a3);
    if (v6) {
      Swift::String result = v5;
    }
    if (4 * v3 >= result >> 14)
    {
      uint64_t v7 = String.UnicodeScalarView.subscript.getter();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized Collection.prefix(_:)(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    String.index(_:offsetBy:limitedBy:)();
    uint64_t v1 = String.subscript.getter();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

uint64_t closure #1 in String.splitByCapitalLetters()@<X0>(uint64_t *a1@<X0>, unsigned int *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for CharacterSet();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  uint64_t v10 = a1[1];
  unsigned int v12 = *a2;
  static CharacterSet.uppercaseLetters.getter();
  LOBYTE(a2) = CharacterSet.contains(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (a2)
  {
    uint64_t v34 = v11;
    uint64_t v35 = v10;
    swift_bridgeObjectRetain();
    v13._uint64_t countAndFlagsBits = 32;
    v13._object = (void *)0xE100000000000000;
    String.append(_:)(v13);
    uint64_t v14 = v34;
    uint64_t v15 = v35;
    if (v12 > 0x7F)
    {
      int v28 = (v12 & 0x3F) << 8;
      if (v12 >= 0x800)
      {
        int v30 = (v28 | (v12 >> 6) & 0x3F) << 8;
        int v31 = (((v30 | (v12 >> 12) & 0x3F) << 8) | (v12 >> 18)) - 2122219023;
        unsigned int v16 = (v30 | (v12 >> 12)) + 8487393;
        if (HIWORD(v12)) {
          unsigned int v16 = v31;
        }
      }
      else
      {
        unsigned int v16 = (v28 | (v12 >> 6)) + 33217;
      }
    }
    else
    {
      unsigned int v16 = v12 + 1;
    }
    uint64_t v34 = (v16 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v16) >> 3))));
    uint64_t v17 = MEMORY[0x25A2C9ED0](&v34);
    uint64_t v19 = v18;
    uint64_t v34 = v14;
    uint64_t v35 = v15;
    swift_bridgeObjectRetain();
    v20._uint64_t countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v12 > 0x7F)
    {
      int v29 = (v12 & 0x3F) << 8;
      if (v12 >= 0x800)
      {
        int v32 = (v29 | (v12 >> 6) & 0x3F) << 8;
        int v33 = (((v32 | (v12 >> 12) & 0x3F) << 8) | (v12 >> 18)) - 2122219023;
        unsigned int v21 = (v32 | (v12 >> 12)) + 8487393;
        if (HIWORD(v12)) {
          unsigned int v21 = v33;
        }
      }
      else
      {
        unsigned int v21 = (v29 | (v12 >> 6)) + 33217;
      }
    }
    else
    {
      unsigned int v21 = v12 + 1;
    }
    uint64_t v34 = (v21 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v21) >> 3))));
    uint64_t v22 = MEMORY[0x25A2C9ED0](&v34);
    uint64_t v24 = v23;
    uint64_t v34 = v11;
    uint64_t v35 = v10;
    swift_bridgeObjectRetain();
    v25._uint64_t countAndFlagsBits = v22;
    v25._object = v24;
    String.append(_:)(v25);
  }
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v27 = v35;
  *a3 = v34;
  a3[1] = v27;
  return result;
}

uint64_t specialized Sequence.reduce<A>(_:_:)(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v30 = a2;
  unint64_t v29 = a1;
  unint64_t v26 = a4 >> 14;
  if (a4 >> 14 == a3 >> 14)
  {
    uint64_t v7 = a1;
    swift_bridgeObjectRetain();
    return v7;
  }
  uint64_t v23 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v24 = a6 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v12 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  if ((a6 & 0x2000000000000000) != 0) {
    uint64_t v14 = HIBYTE(a6) & 0xF;
  }
  else {
    uint64_t v14 = a5 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v25 = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v15 = a3;
  while (1)
  {
    _StringGuts.validateScalarIndex(_:in:)(v15, a3, a4, a5, a6);
    if ((a6 & 0x1000000000000000) != 0)
    {
      uint64_t result = _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
    }
    else
    {
      if ((a6 & 0x2000000000000000) != 0)
      {
        unint64_t v27 = a5;
        uint64_t v28 = v24;
      }
      else if ((a5 & 0x1000000000000000) == 0)
      {
        _StringObject.sharedUTF8.getter();
      }
      uint64_t result = _decodeScalar(_:startingAt:)();
    }
    unsigned int v17 = result;
    if (v15 & 0xC) != v13 && (v15) {
      break;
    }
    if ((v15 & 0xC) == v13)
    {
      uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v15, a5, a6);
      unint64_t v15 = result;
    }
    if (v25 <= v15 >> 16) {
      goto LABEL_40;
    }
    if (v15) {
      goto LABEL_24;
    }
    unint64_t v15 = v15 & 0xC | _StringGuts.scalarAlignSlow(_:)(v15, a5, a6) & 0xFFFFFFFFFFFFFFF3 | 1;
    if ((a6 & 0x1000000000000000) != 0)
    {
LABEL_34:
      unint64_t v15 = String.UnicodeScalarView._foreignIndex(after:)();
      goto LABEL_35;
    }
LABEL_25:
    unint64_t v18 = v15 >> 16;
    if ((a6 & 0x2000000000000000) != 0)
    {
      unint64_t v27 = a5;
      uint64_t v28 = v24;
      int v20 = *((unsigned __int8 *)&v27 + v18);
    }
    else
    {
      uint64_t v19 = v23;
      if ((a5 & 0x1000000000000000) == 0) {
        uint64_t v19 = _StringObject.sharedUTF8.getter();
      }
      int v20 = *(unsigned __int8 *)(v19 + v18);
    }
    int v21 = (char)v20;
    unsigned int v22 = __clz(v20 ^ 0xFF) - 24;
    if (v21 >= 0) {
      LOBYTE(v22) = 1;
    }
    unint64_t v15 = ((v18 + v22) << 16) | 5;
LABEL_35:
    unsigned int v31 = v17;
    closure #1 in String.splitByCapitalLetters()((uint64_t *)&v29, &v31, (uint64_t *)&v27);
    if (v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7;
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = v27;
    unint64_t v29 = v27;
    uint64_t v30 = v28;
    if (v26 == v15 >> 14)
    {
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  if (v25 > v15 >> 16)
  {
LABEL_24:
    if ((a6 & 0x1000000000000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_25;
  }
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = String.UTF16View.index(_:offsetBy:)();
    OUTLINED_FUNCTION_0_3(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x25A2C9F20](15, a1 >> 16);
    OUTLINED_FUNCTION_0_3(v3);
    return v4 | 8;
  }
}

unint64_t _StringGuts.scalarAlignSlow(_:)(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) != 0)
    {
      uint64_t v10 = HIBYTE(a3) & 0xF;
      if ((a3 & 0x2000000000000000) == 0) {
        uint64_t v10 = a2 & 0xFFFFFFFFFFFFLL;
      }
      if (v5 != v10)
      {
        return MEMORY[0x270F9E998]();
      }
    }
    else
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v9 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
        }
        else
        {
          unint64_t v9 = result >> 16;
        }
        unint64_t v5 = v9;
      }
      else
      {
        if ((a2 & 0x1000000000000000) != 0)
        {
          uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
          uint64_t v7 = a2 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          unint64_t v12 = result >> 16;
          uint64_t v6 = _StringObject.sharedUTF8.getter();
          unint64_t v5 = v12;
        }
        if (v5 != v7)
        {
          do
            int v8 = *(unsigned char *)(v6 + v5--) & 0xC0;
          while (v8 == 128);
          ++v5;
        }
      }
      return v5 << 16;
    }
  }
  return result;
}

unint64_t _StringGuts.validateScalarIndex(_:in:)(unint64_t result, unint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  char v9 = (a5 & 0x1000000000000000) == 0 || (a4 & 0x800000000000000) != 0;
  unint64_t v10 = result & 0xC;
  unint64_t v11 = 4 << v9;
  if ((result & 1) == 0 || v10 == v11)
  {
LABEL_12:
    if (v10 == v11) {
      uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(result, a4, a5);
    }
    if (result >> 14 < a2 >> 14 || result >> 14 >= a3 >> 14)
    {
      __break(1u);
    }
    else if (result)
    {
      return result;
    }
    return result & 0xC | _StringGuts.scalarAlignSlow(_:)(result, a4, a5) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  unint64_t v10 = result >> 14;
  unint64_t v11 = a3 >> 14;
  if (result >> 14 < a2 >> 14 || v10 >= v11)
  {
    __break(1u);
    goto LABEL_12;
  }
  return result;
}

unint64_t _StringGuts.validateInclusiveScalarIndex(_:)(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    uint64_t result = _StringGuts.validateInclusiveSubscalarIndex(_:)(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | _StringGuts.scalarAlignSlow(_:)(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t _StringGuts.validateInclusiveSubscalarIndex(_:)(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t String.UnicodeScalarView.index(_:offsetBy:limitedBy:)(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  unint64_t v7 = a3;
  uint64_t v10 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v10) = 1;
  }
  uint64_t v11 = 4 << v10;
  if ((a3 & 0xC) == 4 << v10) {
LABEL_65:
  }
    unint64_t v7 = _StringGuts._slowEnsureMatchingEncoding(_:)(v7, a4, a5);
  unint64_t v12 = a1;
  if ((a1 & 0xC) == v11) {
    unint64_t v12 = _StringGuts._slowEnsureMatchingEncoding(_:)(a1, a4, a5);
  }
  unint64_t result = _StringGuts.validateInclusiveScalarIndex(_:)(a1, a4, a5);
  v7 >>= 14;
  if (a2 < 0)
  {
    uint64_t v11 = 0;
    a1 = v12 >> 14;
    unsigned int v22 = (char *)&v32 + 6;
    while (a1 < v7 || v7 < result >> 14)
    {
      if (result < 0x10000)
      {
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
      if ((a5 & 0x1000000000000000) != 0)
      {
        uint64_t v30 = v22;
        unint64_t result = String.UnicodeScalarView._foreignIndex(before:)();
        unsigned int v22 = v30;
      }
      else
      {
        unint64_t v24 = result >> 16;
        if ((a5 & 0x2000000000000000) != 0)
        {
          unint64_t v33 = a4;
          uint64_t v34 = a5 & 0xFFFFFFFFFFFFFFLL;
          if ((*((unsigned char *)&v33 + v24 - 1) & 0xC0) == 0x80)
          {
            uint64_t v27 = 0;
            do
              int v28 = v22[v24 + v27--] & 0xC0;
            while (v28 == 128);
            uint64_t v29 = 1 - v27;
          }
          else
          {
            uint64_t v29 = 1;
          }
          v24 -= v29;
        }
        else
        {
          uint64_t v25 = (a5 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a4 & 0x1000000000000000) == 0)
          {
            int v32 = v22;
            uint64_t v25 = _StringObject.sharedUTF8.getter();
            unsigned int v22 = v32;
          }
          do
            int v26 = *(unsigned char *)(v25 - 1 + v24--) & 0xC0;
          while (v26 == 128);
        }
        unint64_t result = (v24 << 16) | 5;
      }
      if (--v11 <= a2)
      {
        if (a1 < v7 || result >> 14 >= v7) {
          return result;
        }
        return 0;
      }
    }
    return 0;
  }
  a1 = v12 >> 14;
  if (a2)
  {
    if ((a5 & 0x2000000000000000) != 0) {
      unint64_t v14 = HIBYTE(a5) & 0xF;
    }
    else {
      unint64_t v14 = a4 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v11 = a5 & 0xFFFFFFFFFFFFFFLL;
    while (v7 < a1 || result >> 14 < v7)
    {
      unint64_t v16 = result >> 16;
      if (result >> 16 >= v14)
      {
        __break(1u);
        goto LABEL_64;
      }
      if ((a5 & 0x1000000000000000) != 0)
      {
        unint64_t result = String.UnicodeScalarView._foreignIndex(after:)();
      }
      else
      {
        if ((a5 & 0x2000000000000000) != 0)
        {
          unint64_t v33 = a4;
          uint64_t v34 = a5 & 0xFFFFFFFFFFFFFFLL;
          int v18 = *((unsigned __int8 *)&v33 + v16);
        }
        else
        {
          uint64_t v17 = (a5 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a4 & 0x1000000000000000) == 0) {
            uint64_t v17 = _StringObject.sharedUTF8.getter();
          }
          int v18 = *(unsigned __int8 *)(v17 + v16);
        }
        int v19 = (char)v18;
        unsigned int v20 = __clz(v18 ^ 0xFF) - 24;
        if (v19 >= 0) {
          LOBYTE(v20) = 1;
        }
        unint64_t result = ((v16 + v20) << 16) | 5;
      }
      if (!--a2) {
        goto LABEL_29;
      }
    }
    return 0;
  }
LABEL_29:
  if (v7 >= a1 && v7 < result >> 14) {
    return 0;
  }
  return result;
}

unint64_t OUTLINED_FUNCTION_0_3(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t UTType.searchToolExportedExperiences.unsafeMutableAddressor()
{
  if (one-time initialization token for searchToolExportedExperiences != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for UTType();

  return __swift_project_value_buffer(v0, (uint64_t)static UTType.searchToolExportedExperiences);
}

uint64_t static ExperienceProviding<>.experienceTransferableRepresentation()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for searchToolExportedExperiences != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)static UTType.searchToolExportedExperiences);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = a3;
  return DataRepresentation.init(exportedContentType:exporting:)();
}

BOOL static SearchTransferabilityError.Code.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void SearchTransferabilityError.Code.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int SearchTransferabilityError.Code.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void SearchTransferabilityError.code.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void SearchTransferabilityError.sourceResultType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

uint64_t SearchTransferabilityError.targetTransferType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SearchTransferabilityError() + 24);
  type metadata accessor for UTType();
  OUTLINED_FUNCTION_46();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t SearchTransferabilityError.init(code:sourceResultType:targetTransferType:)@<X0>(unsigned char *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  char v5 = *a2;
  *a4 = *a1;
  a4[1] = v5;
  uint64_t v6 = &a4[*(int *)(type metadata accessor for SearchTransferabilityError() + 24)];
  type metadata accessor for UTType();
  OUTLINED_FUNCTION_46();
  char v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 32);

  return v9(v6, a3, v7);
}

uint64_t one-time initialization function for searchToolExportedExperiences()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for UTType();
  __swift_allocate_value_buffer(v3, static UTType.searchToolExportedExperiences);
  __swift_project_value_buffer(v3, (uint64_t)static UTType.searchToolExportedExperiences);
  static UTType.data.getter();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v3);
  return UTType.init(exportedAs:conformingTo:)();
}

uint64_t static UTType.searchToolExportedExperiences.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for searchToolExportedExperiences != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for UTType();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static UTType.searchToolExportedExperiences);
  swift_beginAccess();
  OUTLINED_FUNCTION_46();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, v3, v2);
}

uint64_t static UTType.searchToolExportedExperiences.setter(uint64_t a1)
{
  if (one-time initialization token for searchToolExportedExperiences != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for UTType();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static UTType.searchToolExportedExperiences);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static UTType.searchToolExportedExperiences.modify())()
{
  if (one-time initialization token for searchToolExportedExperiences != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for UTType();
  __swift_project_value_buffer(v0, (uint64_t)static UTType.searchToolExportedExperiences);
  swift_beginAccess();
  return MemoryCreationQUPerformanceMetrics.llmQUModelLatency.modify;
}

uint64_t closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a2;
  v4[7] = a4;
  v4[5] = a1;
  uint64_t v5 = type metadata accessor for UTType();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  v4[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation(), 0, 0);
}

uint64_t closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()()
{
  unsigned int v22 = v0;
  uint64_t v1 = v0[11];
  (*(void (**)(void))(v0[7] + 16))(v0[6]);
  uint64_t v2 = type metadata accessor for IntentFile();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v2);
  uint64_t v4 = v0[11];
  if (EnumTagSinglePayload == 1)
  {
    uint64_t v6 = v0[6];
    uint64_t v5 = v0[7];
    outlined destroy of IntentFile?(v0[11]);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 8))(&v21, v6, v5);
    char v7 = v21;
    if (one-time initialization token for searchToolExportedExperiences != -1) {
      swift_once();
    }
    uint64_t v8 = v0[10];
    uint64_t v9 = v0[8];
    uint64_t v10 = v0[9];
    uint64_t v11 = __swift_project_value_buffer(v9, (uint64_t)static UTType.searchToolExportedExperiences);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v11, v9);
    uint64_t v12 = type metadata accessor for SearchTransferabilityError();
    lazy protocol witness table accessor for type SearchTransferabilityError and conformance SearchTransferabilityError();
    swift_allocError();
    unsigned char *v13 = 0;
    v13[1] = v7;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 32))(&v13[*(int *)(v12 + 24)], v8, v9);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
  else
  {
    uint64_t v16 = IntentFile.data.getter();
    uint64_t v18 = v17;
    OUTLINED_FUNCTION_46();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v4, v2);
    swift_task_dealloc();
    swift_task_dealloc();
    unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v20(v16, v18);
  }
}

uint64_t sub_2586F5B78()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = partial apply for closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation();
  return closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(a1, v4, v5, v6);
}

uint64_t partial apply for closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t type metadata accessor for SearchTransferabilityError()
{
  uint64_t result = type metadata singleton initialization cache for SearchTransferabilityError;
  if (!type metadata singleton initialization cache for SearchTransferabilityError) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchTransferabilityError.Code and conformance SearchTransferabilityError.Code()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchTransferabilityError.Code and conformance SearchTransferabilityError.Code;
  if (!lazy protocol witness table cache variable for type SearchTransferabilityError.Code and conformance SearchTransferabilityError.Code)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchTransferabilityError.Code and conformance SearchTransferabilityError.Code);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SearchTransferabilityError(unsigned char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    a1[1] = *((unsigned char *)a2 + 1);
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = &a1[v5];
    uint64_t v7 = (uint64_t)a2 + v5;
    uint64_t v8 = type metadata accessor for UTType();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for SearchTransferabilityError(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  uint64_t v3 = type metadata accessor for UTType();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

unsigned char *initializeWithCopy for SearchTransferabilityError(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for UTType();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

unsigned char *assignWithCopy for SearchTransferabilityError(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for UTType();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

unsigned char *initializeWithTake for SearchTransferabilityError(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for UTType();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

unsigned char *assignWithTake for SearchTransferabilityError(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for UTType();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchTransferabilityError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2586F613C);
}

uint64_t sub_2586F613C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    if (v4 >= 2) {
      return v4 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for UTType();
    uint64_t v9 = (uint64_t)&a1[*(int *)(a3 + 24)];
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SearchTransferabilityError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2586F61D0);
}

unsigned char *sub_2586F61D0(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *unint64_t result = a2 + 1;
  }
  else
  {
    uint64_t v7 = type metadata accessor for UTType();
    uint64_t v8 = (uint64_t)&v5[*(int *)(a4 + 24)];
    return (unsigned char *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for SearchTransferabilityError()
{
  uint64_t result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SearchTransferabilityError.Code(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2586F63B8);
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

ValueMetadata *type metadata accessor for SearchTransferabilityError.Code()
{
  return &type metadata for SearchTransferabilityError.Code;
}

uint64_t outlined destroy of IntentFile?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type SearchTransferabilityError and conformance SearchTransferabilityError()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchTransferabilityError and conformance SearchTransferabilityError;
  if (!lazy protocol witness table cache variable for type SearchTransferabilityError and conformance SearchTransferabilityError)
  {
    type metadata accessor for SearchTransferabilityError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchTransferabilityError and conformance SearchTransferabilityError);
  }
  return result;
}

uint64_t IntentFile.data.getter()
{
  return MEMORY[0x270EE0DA8]();
}

uint64_t IntentFile.filename.getter()
{
  return MEMORY[0x270EE0DE8]();
}

uint64_t type metadata accessor for IntentFile()
{
  return MEMORY[0x270EE0DF8]();
}

uint64_t EntityProperty.wrappedValue.modify()
{
  return MEMORY[0x270EE1040]();
}

uint64_t EntityProperty.wrappedValue.getter()
{
  return MEMORY[0x270EE1050]();
}

uint64_t EntityProperty.wrappedValue.setter()
{
  return MEMORY[0x270EE1060]();
}

uint64_t EntityProperty.projectedValue.getter()
{
  return MEMORY[0x270EE1068]();
}

uint64_t EntityProperty.title.getter()
{
  return MEMORY[0x270EE1078]();
}

uint64_t EntityProperty<>.init(title:)()
{
  return MEMORY[0x270EE10A0]();
}

{
  return MEMORY[0x270EE1100]();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return MEMORY[0x270EE1918]();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return MEMORY[0x270EE1938]();
}

uint64_t type metadata accessor for DisplayRepresentation()
{
  return MEMORY[0x270EE1958]();
}

uint64_t static DynamicOptionsProvider.useForParameterResolution.getter()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t TypeDisplayRepresentation.init(name:numericFormat:)()
{
  return MEMORY[0x270EE1CB0]();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return MEMORY[0x270EE1CC0]();
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

uint64_t static JSONEncoder.OutputFormatting.prettyPrinted.getter()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t type metadata accessor for JSONEncoder.KeyEncodingStrategy()
{
  return MEMORY[0x270EEDE80]();
}

uint64_t dispatch thunk of JSONEncoder.keyEncodingStrategy.setter()
{
  return MEMORY[0x270EEDE90]();
}

uint64_t type metadata accessor for JSONEncoder.DateEncodingStrategy()
{
  return MEMORY[0x270EEDEA0]();
}

uint64_t dispatch thunk of JSONEncoder.dateEncodingStrategy.setter()
{
  return MEMORY[0x270EEDEB8]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t dispatch thunk of JSONEncoder.__allocating_init()()
{
  return MEMORY[0x270EEDF20]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t static CharacterSet.uppercaseLetters.getter()
{
  return MEMORY[0x270EEE120]();
}

uint64_t CharacterSet.contains(_:)()
{
  return MEMORY[0x270EEE200]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x270EEE258]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return MEMORY[0x270EEF868]();
}

uint64_t LocalizedStringResource.init(stringInterpolation:)()
{
  return MEMORY[0x270EEF888]();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return MEMORY[0x270EEF8C0]();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = MEMORY[0x270EF0130](options);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static Data.== infix(_:_:)()
{
  return MEMORY[0x270EF0158]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntity.hasMetadata.getter()
{
  return MEMORY[0x270F526C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntity.hasSearchID.getter()
{
  return MEMORY[0x270F526C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntity.type.getter()
{
  return MEMORY[0x270F526D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntity.metadata.getter()
{
  return MEMORY[0x270F526D8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntity.searchID.getter()
{
  return MEMORY[0x270F526E0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntity()
{
  return MEMORY[0x270F526E8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Timestamp.seconds.getter()
{
  return MEMORY[0x270F52730]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Timestamp.timezone.getter()
{
  return MEMORY[0x270F52738]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Timestamp.utcOffset.getter()
{
  return MEMORY[0x270F52740]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_Timestamp()
{
  return MEMORY[0x270F52748]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Temperature.units.getter()
{
  return MEMORY[0x270F527E8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Temperature.value.getter()
{
  return MEMORY[0x270F527F0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_Temperature()
{
  return MEMORY[0x270F527F8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityType()
{
  return MEMORY[0x270F529A0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasAppAttribute.getter()
{
  return MEMORY[0x270F52B20]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.appAttribute.getter()
{
  return MEMORY[0x270F52B28]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.idAttributes.getter()
{
  return MEMORY[0x270F52B30]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.eventAttributes.getter()
{
  return MEMORY[0x270F52B38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasIDAttributes.getter()
{
  return MEMORY[0x270F52B40]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.placeAttributes.getter()
{
  return MEMORY[0x270F52B48]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.contactAttribute.getter()
{
  return MEMORY[0x270F52B50]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.customAttributes.getter()
{
  return MEMORY[0x270F52B58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.generalAttributes.getter()
{
  return MEMORY[0x270F52B60]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasEventAttributes.getter()
{
  return MEMORY[0x270F52B68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasPlaceAttributes.getter()
{
  return MEMORY[0x270F52B70]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasContactAttribute.getter()
{
  return MEMORY[0x270F52B78]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasGeneralAttributes.getter()
{
  return MEMORY[0x270F52B80]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityMetadata()
{
  return MEMORY[0x270F52B88]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityIDAttributes.muid.getter()
{
  return MEMORY[0x270F52E20]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityIDAttributes.umcID.getter()
{
  return MEMORY[0x270F52E28]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityIDAttributes()
{
  return MEMORY[0x270F52E30]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.print.getter()
{
  return MEMORY[0x270F52F60]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.speak.getter()
{
  return MEMORY[0x270F52F68]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RenderedDialogComponent()
{
  return MEMORY[0x270F52F70]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value()
{
  return MEMORY[0x270F52F78]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.value.getter()
{
  return MEMORY[0x270F52F80]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute()
{
  return MEMORY[0x270F52F88]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes.allDay.getter()
{
  return MEMORY[0x270F52F90]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes.endDate.getter()
{
  return MEMORY[0x270F52F98]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes.startDate.getter()
{
  return MEMORY[0x270F52FA0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes()
{
  return MEMORY[0x270F52FA8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subLocality.getter()
{
  return MEMORY[0x270F52FB0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.thoroughfare.getter()
{
  return MEMORY[0x270F52FB8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.postalAddress.getter()
{
  return MEMORY[0x270F52FC0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.isoCountryCode.getter()
{
  return MEMORY[0x270F52FC8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subThoroughfare.getter()
{
  return MEMORY[0x270F52FD0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.administrativeArea.getter()
{
  return MEMORY[0x270F52FD8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subAdministrativeArea.getter()
{
  return MEMORY[0x270F52FE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.name.getter()
{
  return MEMORY[0x270F52FE8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.country.getter()
{
  return MEMORY[0x270F52FF0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.latitude.getter()
{
  return MEMORY[0x270F52FF8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.locality.getter()
{
  return MEMORY[0x270F53000]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.longitude.getter()
{
  return MEMORY[0x270F53008]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes()
{
  return MEMORY[0x270F53010]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes.imessageID.getter()
{
  return MEMORY[0x270F53028]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes.imessageURL.getter()
{
  return MEMORY[0x270F53030]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes.phoneNumber.getter()
{
  return MEMORY[0x270F53038]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes.email.getter()
{
  return MEMORY[0x270F53040]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes()
{
  return MEMORY[0x270F53048]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.contentURL.getter()
{
  return MEMORY[0x270F53050]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.displayName.getter()
{
  return MEMORY[0x270F53058]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.thumbnailData.getter()
{
  return MEMORY[0x270F53060]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.alternateNames.getter()
{
  return MEMORY[0x270F53068]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.hasThumbnailData.getter()
{
  return MEMORY[0x270F53070]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.title.getter()
{
  return MEMORY[0x270F53078]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes()
{
  return MEMORY[0x270F53080]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityAppstoreAttributes.adamID.getter()
{
  return MEMORY[0x270F530D0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityAppstoreAttributes()
{
  return MEMORY[0x270F530D8]();
}

uint64_t DataRepresentation.init(exportedContentType:exporting:)()
{
  return MEMORY[0x270EE9F40]();
}

uint64_t type metadata accessor for Google_Protobuf_Any()
{
  return MEMORY[0x270F449A0]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t type metadata accessor for Experience()
{
  return MEMORY[0x270F66068]();
}

uint64_t UTType.init(exportedAs:conformingTo:)()
{
  return MEMORY[0x270FA16A0]();
}

uint64_t UTType.identifier.getter()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t static UTType.data.getter()
{
  return MEMORY[0x270FA1800]();
}

uint64_t type metadata accessor for UTType()
{
  return MEMORY[0x270FA1938]();
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

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x270EF1928]();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return MEMORY[0x270EF1938]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x270EF1A10]();
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

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

uint64_t String.UnicodeScalarView._foreignIndex(after:)()
{
  return MEMORY[0x270F9D678]();
}

uint64_t String.UnicodeScalarView._foreignIndex(before:)()
{
  return MEMORY[0x270F9D680]();
}

uint64_t String.UnicodeScalarView.subscript.getter()
{
  return MEMORY[0x270F9D6A0]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9D758]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8F0]();
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

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t _NSRange.description.getter()
{
  return MEMORY[0x270EF21E8]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return MEMORY[0x270F9E9A0]();
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

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
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
  return MEMORY[0x270F9EFE8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
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

{
  return MEMORY[0x270F9F278]();
}

{
  return MEMORY[0x270F9F280]();
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

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

{
  return MEMORY[0x270F9F3B8]();
}

{
  return MEMORY[0x270F9F3C0]();
}

{
  return MEMORY[0x270F9F3F8]();
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

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}