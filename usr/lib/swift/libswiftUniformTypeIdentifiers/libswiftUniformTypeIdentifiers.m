ValueMetadata *type metadata accessor for UTType()
{
  return &type metadata for UTType;
}

id static UTType._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

UTType __swiftcall UTType._bridgeToObjectiveC()()
{
  return (UTType)*v0;
}

id static UTType.threeDContent.getter@<X0>(void *a1@<X8>)
{
  v1 = (void *)*MEMORY[0x263F1D940];
  *a1 = *MEMORY[0x263F1D940];
  return v1;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance UTType()
{
  return *v0;
}

id static UTType.item.getter@<X0>(void *a1@<X8>)
{
  v1 = (void *)*MEMORY[0x263F1DB38];
  *a1 = *MEMORY[0x263F1DB38];
  return v1;
}

id static UTType.folder.getter@<X0>(void *a1@<X8>)
{
  v1 = (void *)*MEMORY[0x263F1DAB0];
  *a1 = *MEMORY[0x263F1DAB0];
  return v1;
}

id static UTType.content.getter@<X0>(void *a1@<X8>)
{
  v1 = (void *)*MEMORY[0x263F1DA38];
  *a1 = *MEMORY[0x263F1DA38];
  return v1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance UTType(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTType(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4 = [*v3 *a3];
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

uint64_t URLResourceValues.contentType.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = URLResourceValues.allValues.getter();
  if (!*(void *)(v2 + 16))
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  id v3 = (id)*MEMORY[0x263EFF608];
  unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v3);
  if ((v5 & 1) == 0)
  {
    long long v7 = 0u;
    long long v8 = 0u;

    goto LABEL_8;
  }
  outlined init with copy of Any(*(void *)(v2 + 56) + 32 * v4, (uint64_t)&v7);

  swift_bridgeObjectRelease();
  if (!*((void *)&v8 + 1))
  {
LABEL_9:
    uint64_t result = outlined destroy of Any?((uint64_t)&v7);
    goto LABEL_10;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
LABEL_10:
  }
    *a1 = 0;
  return result;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

void protocol witness for Hashable.hash(into:) in conformance UTType()
{
  id v1 = *v0;
  NSObject.hash(into:)();
}

uint64_t UTType.identifier.getter(SEL *a1)
{
  id v2 = [*v1 *a1];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(_:)(Swift::String a1)
{
  id v2 = v1;
  uint64_t v3 = (void *)MEMORY[0x216681FA0](a1._countAndFlagsBits);
  swift_bridgeObjectRelease();
  id v4 = [self sel_typeWithIdentifier:v3];

  *id v2 = v4;
  result.value._type.super.isa = v5;
  result.is_nil = v6;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UTType()
{
  return static NSObject.== infix(_:_:)() & 1;
}

uint64_t static UTType.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)() & 1;
}

uint64_t type metadata accessor for NSObject(uint64_t a1, unint64_t *a2)
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

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UTType()
{
  id v1 = *v0;
  Hasher.init(_seed:)();
  id v2 = v1;
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance UTType(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

Swift::Bool __swiftcall UTType.conforms(to:)(UniformTypeIdentifiers::UTType to)
{
  return [*v1 conformsToType:*(void *)to._type.super.isa];
}

uint64_t UTType.identifier.getter()
{
  return UTType.identifier.getter((SEL *)&selRef_identifier);
}

id static UTType.url.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DD08];
  *a1 = *MEMORY[0x263F1DD08];
  return v1;
}

id static UTType.resolvable.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DC80];
  *a1 = *MEMORY[0x263F1DC80];
  return v1;
}

ValueMetadata *type metadata accessor for UTTagClass()
{
  return &type metadata for UTTagClass;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTType(uint64_t a1, uint64_t a2)
{
  return protocol witness for CustomStringConvertible.description.getter in conformance UTType(a1, a2, (SEL *)&selRef_description);
}

id static UTType.playlist.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DC28];
  *a1 = *MEMORY[0x263F1DC28];
  return v1;
}

id static UTType.flatRTFD.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DAA8];
  *a1 = *MEMORY[0x263F1DAA8];
  return v1;
}

id static UTType.archive.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1D9A8];
  *a1 = *MEMORY[0x263F1D9A8];
  return v1;
}

id static UTType.script.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DCA0];
  *a1 = *MEMORY[0x263F1DCA0];
  return v1;
}

id static UTType.image.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DB18];
  *a1 = *MEMORY[0x263F1DB18];
  return v1;
}

id static UTType.text.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DCF8];
  *a1 = *MEMORY[0x263F1DCF8];
  return v1;
}

id static UTType.rtfd.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DC70];
  *a1 = *MEMORY[0x263F1DC70];
  return v1;
}

id static UTType.json.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DB48];
  *a1 = *MEMORY[0x263F1DB48];
  return v1;
}

id static UTType.pdf.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DBF0];
  *a1 = *MEMORY[0x263F1DBF0];
  return v1;
}

id static UTType.binaryPropertyList.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1D9D8];
  *a1 = *MEMORY[0x263F1D9D8];
  return v1;
}

id static UTType.audiovisualContent.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1D9C0];
  *a1 = *MEMORY[0x263F1D9C0];
  return v1;
}

id static UTType.xmlPropertyList.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DD90];
  *a1 = *MEMORY[0x263F1DD90];
  return v1;
}

id static UTType.symbolicLink.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DCD0];
  *a1 = *MEMORY[0x263F1DCD0];
  return v1;
}

id static UTType.propertyList.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DC40];
  *a1 = *MEMORY[0x263F1DC40];
  return v1;
}

id static UTType.presentation.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DC38];
  *a1 = *MEMORY[0x263F1DC38];
  return v1;
}

id static UTType.spreadsheet.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DCC0];
  *a1 = *MEMORY[0x263F1DCC0];
  return v1;
}

id static UTType.webArchive.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DD70];
  *a1 = *MEMORY[0x263F1DD70];
  return v1;
}

id static UTType.sourceCode.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DCB0];
  *a1 = *MEMORY[0x263F1DCB0];
  return v1;
}

id static UTType.executable.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DA98];
  *a1 = *MEMORY[0x263F1DA98];
  return v1;
}

unint64_t lazy protocol witness table accessor for type UTType and conformance UTType()
{
  unint64_t result = lazy protocol witness table cache variable for type UTType and conformance UTType;
  if (!lazy protocol witness table cache variable for type UTType and conformance UTType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType and conformance UTType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTType and conformance UTType;
  if (!lazy protocol witness table cache variable for type UTType and conformance UTType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType and conformance UTType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTType and conformance UTType;
  if (!lazy protocol witness table cache variable for type UTType and conformance UTType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType and conformance UTType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTType and conformance UTType;
  if (!lazy protocol witness table cache variable for type UTType and conformance UTType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType and conformance UTType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTType and conformance UTType;
  if (!lazy protocol witness table cache variable for type UTType and conformance UTType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType and conformance UTType);
  }
  return result;
}

id UTType.isDynamic.getter()
{
  return [*v0 sel_isDynamic];
}

id static UTType.directory.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DA68];
  *a1 = *MEMORY[0x263F1DA68];
  return v1;
}

id static UTType.heic.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DAE8];
  *a1 = *MEMORY[0x263F1DAE8];
  return v1;
}

id static UTType.data.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DA48];
  *a1 = *MEMORY[0x263F1DA48];
  return v1;
}

void UTType.init(filenameExtension:conformingTo:)(void **a1@<X2>, SEL *a2@<X3>, void *a3@<X8>)
{
  unint64_t v5 = *a1;
  Swift::Bool v6 = (void *)MEMORY[0x216681FA0]();
  swift_bridgeObjectRelease();
  id v7 = [self *a2:v6 v5];

  *a3 = v7;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(filenameExtension:conformingTo:)(Swift::String filenameExtension, UniformTypeIdentifiers::UTType conformingTo)
{
  UTType.init(filenameExtension:conformingTo:)((void **)conformingTo._type.super.isa, (SEL *)&selRef_typeWithFilenameExtension_conformingToType_, v2);
  result.value._type.super.isa = v3;
  result.is_nil = v4;
  return result;
}

id _UTSwiftOverlayRuntimeIssuesAssistant.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _UTSwiftOverlayRuntimeIssuesAssistant();
  return [super dealloc];
}

uint64_t type metadata accessor for _UTSwiftOverlayRuntimeIssuesAssistant()
{
  return self;
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *UniformTypeIdentifiers::UTType_optional result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UTHardwareColor(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for UTHardwareColor(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)UniformTypeIdentifiers::UTType_optional result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

void type metadata accessor for UTHardwareColor(uint64_t a1)
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NSURLResourceKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

unsigned __int8 *protocol witness for RawRepresentable.init(rawValue:) in conformance UTHardwareColorType@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance UTHardwareColorType(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSURLResourceKey()
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

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSURLResourceKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for UTHardwareColor.__Unnamed_union___Anonymous_field2(uint64_t a1)
{
}

void type metadata accessor for UTHardwareColorType(uint64_t a1)
{
}

void type metadata accessor for UTHardwareColor(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void URL.appendingPathComponent(_:conformingTo:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, NSURL *a4@<X8>)
{
  uint64_t v6 = *a3;
  URL._bridgeToObjectiveC()(a4);
  uint64_t v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x216681FA0](a1, a2);
  id v10 = [v8 URLByAppendingPathComponent:v9 conformingToType:v6];

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Void __swiftcall URL.appendPathComponent(_:conformingTo:)(Swift::String _, UniformTypeIdentifiers::UTType conformingTo)
{
  uint64_t v3 = v2;
  object = _._object;
  uint64_t countAndFlagsBits = _._countAndFlagsBits;
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)conformingTo._type.super.isa;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v10, v3, v7);
  URL._bridgeToObjectiveC()(v12);
  uint64_t v14 = v13;
  uint64_t v15 = (void *)MEMORY[0x216681FA0](countAndFlagsBits, object);
  id v16 = [v14 URLByAppendingPathComponent:v15 conformingToType:v11];

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void URL.appendingPathExtension(for:)(uint64_t *a1@<X0>, NSURL *a2@<X8>)
{
  uint64_t v2 = *a1;
  URL._bridgeToObjectiveC()(a2);
  uint64_t v4 = v3;
  id v5 = [v3 URLByAppendingPathExtensionForType:v2];

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Void __swiftcall URL.appendPathExtension(for:)(UniformTypeIdentifiers::UTType a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)a1._type.super.isa;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v2, v4);
  URL._bridgeToObjectiveC()(v9);
  uint64_t v11 = v10;
  id v12 = [v10 URLByAppendingPathExtensionForType:v8];

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void String.appendingPathExtension(for:)()
{
}

void String.appendingPathComponent(_:conformingTo:)()
{
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  uint64_t v4 = (void *)MEMORY[0x216681FA0](a1, a2);
  Swift::UInt HashCode = _UTIdentifierGetHashCode();

  Hasher._combine(_:)(HashCode);
  Swift::Int v6 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v6);
}

{
  Swift::Int v4;
  uint64_t vars8;

  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    swift_bridgeObjectRetain();
    id v12 = (void *)MEMORY[0x216681FA0](v10, v11);
    uint64_t v13 = (void *)MEMORY[0x216681FA0](a1, a2);
    char v14 = _UTIdentifiersAreEqual();
    swift_bridgeObjectRelease();

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v5;
      for (unint64_t i = (i + 1) & v15; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v15)
      {
        id v16 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
        uint64_t v17 = *v16;
        uint64_t v18 = v16[1];
        swift_bridgeObjectRetain();
        v19 = (void *)MEMORY[0x216681FA0](v17, v18);
        v20 = (void *)MEMORY[0x216681FA0](a1, a2);
        LOBYTE(v17) = _UTIdentifiersAreEqual();
        swift_bridgeObjectRelease();

        if (v17) {
          break;
        }
      }
    }
  }
  return i;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  Swift::Int v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      id v12 = ~v5;
      do
      {
        Swift::Int v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        char v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(_rawBluetoothProductID:rawVendorID:)(Swift::UInt32 _rawBluetoothProductID, Swift::UInt16 rawVendorID)
{
  uint64_t v3 = v2;
  uint64_t v4 = (objc_class *)[self _typeWithBluetoothProductID:_rawBluetoothProductID vendorID:rawVendorID];
  void *v3 = v4;
  result.value._type.super.isa = v4;
  result.is_nil = v5;
  return result;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(mimeType:conformingTo:)(Swift::String mimeType, UniformTypeIdentifiers::UTType conformingTo)
{
  UTType.init(filenameExtension:conformingTo:)((void **)conformingTo._type.super.isa, (SEL *)&selRef_typeWithMIMEType_conformingToType_, v2);
  result.value._type.super.isa = v3;
  result.is_nil = v4;
  return result;
}

uint64_t UTType.preferredFilenameExtension.getter()
{
  return UTType.preferredFilenameExtension.getter((SEL *)&selRef_preferredFilenameExtension);
}

uint64_t UTType.preferredMIMEType.getter()
{
  return UTType.preferredFilenameExtension.getter((SEL *)&selRef_preferredMIMEType);
}

uint64_t UTType.localizedDescription.getter()
{
  return UTType.preferredFilenameExtension.getter((SEL *)&selRef_localizedDescription);
}

uint64_t UTType.preferredFilenameExtension.getter(SEL *a1)
{
  id v2 = [*v1 *a1];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

id UTType.version.getter()
{
  id v1 = [*v0 sel_version];
  id v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = [v1 integerValue];

  return v3;
}

uint64_t UTType.referenceURL.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = [*v1 sel_referenceURL];
  if (v3)
  {
    uint64_t v4 = v3;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v5 = type metadata accessor for URL();
    Swift::Int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    Swift::Int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

id UTType.isDeclared.getter()
{
  return [*v0 sel_isDeclared];
}

id UTType.isPublic.getter()
{
  return [*v0 sel_isPublicType];
}

Swift::Bool __swiftcall UTType.isSupertype(of:)(UniformTypeIdentifiers::UTType of)
{
  return [*v1 isSupertypeOfType:*(void *)of._type.super.isa];
}

Swift::Bool __swiftcall UTType.isSubtype(of:)(UniformTypeIdentifiers::UTType of)
{
  return [*v1 isSubtypeOfType:*(void *)of._type.super.isa];
}

uint64_t UTType.supertypes.getter()
{
  id v1 = [*v0 sel_supertypes];
  lazy protocol witness table accessor for type UTType and conformance UTType();
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(tag:tagClass:conformingTo:)(Swift::String tag, UniformTypeIdentifiers::UTTagClass tagClass, UniformTypeIdentifiers::UTType_optional conformingTo)
{
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)tagClass.rawValue._countAndFlagsBits;
  uint64_t v6 = *(void *)(tagClass.rawValue._countAndFlagsBits + 8);
  uint64_t v7 = *(void **)tagClass.rawValue._object;
  uint64_t v8 = (void *)MEMORY[0x216681FA0](tag._countAndFlagsBits);
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)MEMORY[0x216681FA0](v5, v6);
  swift_bridgeObjectRelease();
  id v10 = [self sel_typeWithTag_tagClass_conformingToType_:v8 tagClass:v9 conformingToType:v7];

  *uint64_t v4 = v10;
  result.value._type.super.isa = v11;
  result.is_nil = v12;
  return result;
}

uint64_t static UTType.types(tag:tagClass:conformingTo:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v4 = *a3;
  uint64_t v5 = a3[1];
  uint64_t v6 = *a4;
  uint64_t v7 = (void *)MEMORY[0x216681FA0]();
  uint64_t v8 = (void *)MEMORY[0x216681FA0](v4, v5);
  id v9 = [self typesWithTag:v7 tagClass:v8 conformingToType:v6];

  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return v10;
}

uint64_t UTType.tags.getter()
{
  id v1 = [*v0 sel_tags];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v3 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySSSaySSGG_22UniformTypeIdentifiers10UTTagClassV_AFts5NeverOTg5012_sSSSaySSG22de13Identifiers10gh34VAAIgggro_SS3key_AA5valuetAD_AAts5I92OIegnrzr_TR04_s22ab31Identifiers6UTTypeV4tagsSDyAA10de19VSaySSGGvgAF_AGtSS_R5XEfU_Tf3nnnpf_nTf1cn_n(v2);
  swift_bridgeObjectRelease();
  if (*(void *)(v3 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UTTagClass, [String]>);
    uint64_t v4 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE80];
  }
  uint64_t v7 = v4;
  uint64_t v5 = (void *)swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v5, 1, &v7);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySSSaySSGG_22UniformTypeIdentifiers10UTTagClassV_AFts5NeverOTg5012_sSSSaySSG22de13Identifiers10gh34VAAIgggro_SS3key_AA5valuetAD_AAts5I92OIegnrzr_TR04_s22ab31Identifiers6UTTypeV4tagsSDyAA10de19VSaySSGGvgAF_AGtSS_R5XEfU_Tf3nnnpf_nTf1cn_n(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v3 = a1;
  uint64_t v30 = MEMORY[0x263F8EE78];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
  uint64_t v2 = v30;
  uint64_t result = specialized Dictionary.startIndex.getter(v3);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = v3 + 64;
  uint64_t v24 = v3 + 80;
  int64_t v25 = v1;
  int v26 = v5;
  uint64_t v27 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(v3 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(v3 + 36) != v5) {
      goto LABEL_24;
    }
    uint64_t v28 = v7;
    Swift::Bool v12 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v6);
    uint64_t v13 = v12[1];
    uint64_t v29 = *v12;
    uint64_t v14 = *(void *)(*(void *)(v3 + 56) + 8 * v6);
    uint64_t v15 = v3;
    unint64_t v17 = *(void *)(v30 + 16);
    unint64_t v16 = *(void *)(v30 + 24);
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    if (v17 >= v16 >> 1) {
      uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v16 > 1), v17 + 1, 1);
    }
    *(void *)(v30 + 16) = v17 + 1;
    uint64_t v18 = (void *)(v30 + 24 * v17);
    v18[4] = v29;
    v18[5] = v13;
    v18[6] = v14;
    int64_t v9 = 1 << *(unsigned char *)(v15 + 32);
    if (v6 >= v9) {
      goto LABEL_25;
    }
    uint64_t v8 = v27;
    uint64_t v19 = *(void *)(v27 + 8 * v11);
    if ((v19 & (1 << v6)) == 0) {
      goto LABEL_26;
    }
    uint64_t v3 = v15;
    int v5 = v26;
    if (*(_DWORD *)(v15 + 36) != v26) {
      goto LABEL_27;
    }
    unint64_t v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      int64_t v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v25;
    }
    else
    {
      unint64_t v21 = v11 + 1;
      unint64_t v22 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v25;
      if (v11 + 1 < v22)
      {
        unint64_t v23 = *(void *)(v27 + 8 * v21);
        if (v23)
        {
LABEL_20:
          int64_t v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v11)
          {
            unint64_t v23 = *(void *)(v24 + 8 * v11++);
            if (v23)
            {
              unint64_t v21 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    uint64_t v7 = v28 + 1;
    uint64_t v6 = v9;
    if (v28 + 1 == v10) {
      return v2;
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

UniformTypeIdentifiers::UTType __swiftcall UTType.init(exportedAs:conformingTo:)(Swift::String exportedAs, UniformTypeIdentifiers::UTType_optional conformingTo)
{
  UTType.init(exportedAs:conformingTo:)(exportedAs._countAndFlagsBits, (uint64_t)exportedAs._object, (id *)conformingTo.value._type.super.isa, (SEL *)&selRef_exportedTypeWithIdentifier_conformingToType_, (SEL *)&selRef_exportedTypeWithIdentifier_, v2);
  return result;
}

UniformTypeIdentifiers::UTType __swiftcall UTType.init(importedAs:conformingTo:)(Swift::String importedAs, UniformTypeIdentifiers::UTType_optional conformingTo)
{
  UTType.init(exportedAs:conformingTo:)(importedAs._countAndFlagsBits, (uint64_t)importedAs._object, (id *)conformingTo.value._type.super.isa, (SEL *)&selRef_importedTypeWithIdentifier_conformingToType_, (SEL *)&selRef_importedTypeWithIdentifier_, v2);
  return result;
}

void UTType.init(exportedAs:conformingTo:)(uint64_t a1@<X0>, uint64_t a2@<X1>, id *a3@<X2>, SEL *a4@<X3>, SEL *a5@<X4>, void *a6@<X8>)
{
  if (*a3)
  {
    id v10 = *a3;
    unint64_t v11 = (void *)MEMORY[0x216681FA0](a1, a2);
    swift_bridgeObjectRelease();
    id v12 = [self *a4:v11 v10];
  }
  else
  {
    unint64_t v11 = (void *)MEMORY[0x216681FA0](a1, a2);
    swift_bridgeObjectRelease();
    id v12 = [self *a5:v11];
  }

  *a6 = v12;
}

void UTType.hash(into:)()
{
  id v1 = *v0;
  NSObject.hash(into:)();
}

Swift::Int UTType.hashValue.getter()
{
  id v1 = *v0;
  Hasher.init(_seed:)();
  id v2 = v1;
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UTType()
{
  id v1 = *v0;
  Hasher.init(_seed:)();
  id v2 = v1;
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

uint64_t UTType.description.getter()
{
  return UTType.identifier.getter((SEL *)&selRef_description);
}

uint64_t UTType.debugDescription.getter()
{
  return UTType.identifier.getter((SEL *)&selRef_debugDescription);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance UTType(uint64_t a1, uint64_t a2)
{
  return protocol witness for CustomStringConvertible.description.getter in conformance UTType(a1, a2, (SEL *)&selRef_debugDescription);
}

id static UTType._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t static UTType._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance UTType@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance UTType._CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UTType._CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance UTType._CodingKeys()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UTType._CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance UTType._CodingKeys()
{
  if (*v0) {
    return 0x746E6174736E6F63;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance UTType._CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized UTType._CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance UTType._CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance UTType._CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTType._CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type UTType._CodingKeys and conformance UTType._CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance UTType._CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type UTType._CodingKeys and conformance UTType._CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UTType.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<UTType._CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v28 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = *v1;
  unint64_t v25 = (unint64_t)[*v1 sel__constantIndex];
  if ((v25 & 0x8000000000000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v22 = v5;
  uint64_t v23 = v4;
  uint64_t v12 = a1[3];
  uint64_t v26 = a1[4];
  uint64_t v24 = __swift_project_boxed_opaque_existential_1(a1, v12);
  id v13 = v7;
  id v14 = [v13 sel_identifier];
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;

  v27[0] = v15;
  v27[1] = v17;
  char v18 = Encoder.encodeSingleValueSafely<A>(_:)((uint64_t)v27, v12, MEMORY[0x263F8D310]);
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  char v20 = v18;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v5 = v22;
  uint64_t v4 = v23;
  if ((v20 & 1) == 0)
  {
LABEL_2:
    uint64_t v26 = v2;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    lazy protocol witness table accessor for type UTType._CodingKeys and conformance UTType._CodingKeys();
    uint64_t v8 = v28;
    dispatch thunk of Encoder.container<A>(keyedBy:)();
    id v9 = v7;
    id v10 = [v9 sel_identifier];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    LOBYTE(v27[0]) = 0;
    uint64_t v11 = v26;
    KeyedEncodingContainer.encode(_:forKey:)();
    if (v11)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    if ((v25 & 0x8000000000000000) == 0)
    {
      LOBYTE(v27[0]) = 1;
      KeyedEncodingContainer.encode(_:forKey:)();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

uint64_t UTType.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v21 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTType._CodingKeys>?);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v20[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTType._CodingKeys>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  id v9 = (char *)&v20[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type UTType._CodingKeys and conformance UTType._CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    outlined destroy of KeyedDecodingContainer<UTType._CodingKeys>?((uint64_t)v5);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    dispatch thunk of Decoder.singleValueContainer()();
    __swift_project_boxed_opaque_existential_1(v20, v20[3]);
    uint64_t v11 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    uint64_t v13 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    uint64_t v14 = -1;
  }
  else
  {
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    LOBYTE(v20[0]) = 0;
    uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v13 = v10;
    LOBYTE(v20[0]) = 1;
    uint64_t v14 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    char v16 = v15;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if (v16) {
      uint64_t v14 = -1;
    }
  }
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UTType);
  id v17 = @nonobjc UTType.init(_identifier:constantIndex:)(v11, v13, v14);
  *uint64_t v21 = v17;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

id @nonobjc UTType.init(_identifier:constantIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x216681FA0]();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  id v5 = [swift_getObjCClassFromMetadata() _typeWithIdentifier:v4 constantIndex:a3 error:v9];

  if (v5)
  {
    id v6 = v9[0];
  }
  else
  {
    id v7 = v9[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v5;
}

uint64_t protocol witness for Decodable.init(from:) in conformance UTType@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return UTType.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance UTType(void *a1)
{
  return UTType.encode(to:)(a1);
}

void specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(void *a1, char a2, void *a3)
{
  LOBYTE(v4) = a2;
  uint64_t v6 = a1[2];
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_23;
  }
  uint64_t v8 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v9 = a1[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v10 = (void *)*a3;
  unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v8);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  BOOL v15 = __OFADD__(v13, v14);
  uint64_t v16 = v13 + v14;
  if (v15)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v17 = v12;
  if (v10[3] < v16)
  {
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v16, v4 & 1);
    unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v8);
    if ((v17 & 1) == (v18 & 1)) {
      goto LABEL_8;
    }
LABEL_6:
    unint64_t v11 = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  if (v4)
  {
LABEL_8:
    if (v17) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  unint64_t v21 = v11;
  specialized _NativeDictionary.copy()();
  unint64_t v11 = v21;
  if (v17)
  {
LABEL_9:
    uint64_t v19 = (void *)swift_allocError();
    swift_willThrow();
    id v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_28;
  }
LABEL_12:
  uint64_t v22 = (void *)*a3;
  *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
  uint64_t v23 = (uint64_t *)(v22[6] + 16 * v11);
  *uint64_t v23 = v9;
  v23[1] = v8;
  *(void *)(v22[7] + 8 * v11) = v7;
  uint64_t v24 = v22[2];
  BOOL v15 = __OFADD__(v24, 1);
  uint64_t v25 = v24 + 1;
  if (v15)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    _StringGuts.grow(_:)(30);
    v38._object = (void *)0x8000000212812990;
    v38._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
    String.append(_:)(v38);
    _print_unlocked<A, B>(_:_:)();
    v39._uint64_t countAndFlagsBits = 39;
    v39._object = (void *)0xE100000000000000;
    String.append(_:)(v39);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  v22[2] = v25;
  if (v6 != 1)
  {
    uint64_t v4 = a1 + 9;
    unint64_t v26 = 1;
    while (v26 < a1[2])
    {
      uint64_t v8 = *(v4 - 1);
      uint64_t v7 = *v4;
      uint64_t v9 = *(v4 - 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v8) {
        goto LABEL_23;
      }
      uint64_t v27 = (void *)*a3;
      unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v8);
      uint64_t v30 = v27[2];
      BOOL v31 = (v29 & 1) == 0;
      BOOL v15 = __OFADD__(v30, v31);
      uint64_t v32 = v30 + v31;
      if (v15) {
        goto LABEL_25;
      }
      char v17 = v29;
      if (v27[3] < v32)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v32, 1);
        unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v8);
        if ((v17 & 1) != (v33 & 1)) {
          goto LABEL_6;
        }
      }
      if (v17) {
        goto LABEL_9;
      }
      v34 = (void *)*a3;
      *(void *)(*a3 + 8 * (v28 >> 6) + 64) |= 1 << v28;
      v35 = (uint64_t *)(v34[6] + 16 * v28);
      uint64_t *v35 = v9;
      v35[1] = v8;
      *(void *)(v34[7] + 8 * v28) = v7;
      uint64_t v36 = v34[2];
      BOOL v15 = __OFADD__(v36, 1);
      uint64_t v37 = v36 + 1;
      if (v15) {
        goto LABEL_26;
      }
      ++v26;
      v34[2] = v37;
      v4 += 3;
      if (v6 == v26) {
        goto LABEL_23;
      }
    }
    goto LABEL_27;
  }
LABEL_23:
  swift_bridgeObjectRelease_n();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type UTType._CodingKeys and conformance UTType._CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys);
  }
  return result;
}

uint64_t outlined destroy of KeyedDecodingContainer<UTType._CodingKeys>?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTType._CodingKeys>?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UTType._CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UTType._CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21280ADE0);
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

uint64_t getEnumTag for UTType._CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for UTType._CodingKeys(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for UTType._CodingKeys()
{
  return &unk_26C3BAFC8;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UTTagClass, [String]>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    char v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UTTagClass, [String]>);
  char v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    v35 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v37 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        int64_t v23 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v36) {
          goto LABEL_33;
        }
        unint64_t v24 = v37[v23];
        ++v13;
        if (!v24)
        {
          int64_t v13 = v23 + 1;
          if (v23 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v24 = v37[v13];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v36)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v35;
              if (v38)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v37[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v13 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v24 = v37[v13];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v25;
          }
        }
LABEL_30:
        unint64_t v10 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v13 << 6);
      }
      uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v22);
      uint64_t v32 = *v30;
      uint64_t v31 = v30[1];
      uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v22);
      if ((v38 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      unint64_t v14 = (void *)MEMORY[0x216681FA0](v32, v31);
      Swift::UInt HashCode = _UTIdentifierGetHashCode();

      Hasher._combine(_:)(HashCode);
      uint64_t result = Hasher._finalize()();
      uint64_t v16 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v11 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v11 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v18 == v27;
          if (v18 == v27) {
            unint64_t v18 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v11 + 8 * v18);
        }
        while (v29 == -1);
        unint64_t v19 = __clz(__rbit64(~v29)) + (v18 << 6);
      }
      *(void *)(v11 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t v20 = (void *)(*(void *)(v7 + 48) + 16 * v19);
      void *v20 = v32;
      v20[1] = v31;
      *(void *)(*(void *)(v7 + 56) + 8 * v19) = v33;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
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

uint64_t specialized UTType._CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E6174736E6F63 && a2 == 0xED00007865646E49)
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

uint64_t static UTTagClass._deviceModelCode.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id static UTType.compositeContent.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA28];
  *a1 = *MEMORY[0x263F1DA28];
  return v1;
}

id static UTType.diskImage.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA70];
  *a1 = *MEMORY[0x263F1DA70];
  return v1;
}

id static UTType.mountPoint.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBC0];
  *a1 = *MEMORY[0x263F1DBC0];
  return v1;
}

id static UTType.aliasFile.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D968];
  *a1 = *MEMORY[0x263F1D968];
  return v1;
}

id static UTType.urlBookmarkData.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD10];
  *a1 = *MEMORY[0x263F1DD10];
  return v1;
}

id static UTType.fileURL.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DAA0];
  *a1 = *MEMORY[0x263F1DAA0];
  return v1;
}

id static UTType.plainText.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC20];
  *a1 = *MEMORY[0x263F1DC20];
  return v1;
}

id static UTType.utf8PlainText.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD38];
  *a1 = *MEMORY[0x263F1DD38];
  return v1;
}

id static UTType.utf16ExternalPlainText.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD28];
  *a1 = *MEMORY[0x263F1DD28];
  return v1;
}

id static UTType.utf16PlainText.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD30];
  *a1 = *MEMORY[0x263F1DD30];
  return v1;
}

id static UTType.delimitedText.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA58];
  *a1 = *MEMORY[0x263F1DA58];
  return v1;
}

id static UTType.commaSeparatedText.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA20];
  *a1 = *MEMORY[0x263F1DA20];
  return v1;
}

id static UTType.tabSeparatedText.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DCE8];
  *a1 = *MEMORY[0x263F1DCE8];
  return v1;
}

id static UTType.utf8TabSeparatedText.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD40];
  *a1 = *MEMORY[0x263F1DD40];
  return v1;
}

id static UTType.rtf.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC68];
  *a1 = *MEMORY[0x263F1DC68];
  return v1;
}

id static UTType.html.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB00];
  *a1 = *MEMORY[0x263F1DB00];
  return v1;
}

id static UTType.xml.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD88];
  *a1 = *MEMORY[0x263F1DD88];
  return v1;
}

id static UTType.yaml.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DDA0];
  *a1 = *MEMORY[0x263F1DDA0];
  return v1;
}

id static UTType.css.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA08];
  *a1 = *MEMORY[0x263F1DA08];
  return v1;
}

id static UTType.assemblyLanguageSource.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D9B0];
  *a1 = *MEMORY[0x263F1D9B0];
  return v1;
}

id static UTType.cSource.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA10];
  *a1 = *MEMORY[0x263F1DA10];
  return v1;
}

id static UTType.objectiveCSource.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBE8];
  *a1 = *MEMORY[0x263F1DBE8];
  return v1;
}

id static UTType.swiftSource.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DCC8];
  *a1 = *MEMORY[0x263F1DCC8];
  return v1;
}

id static UTType.cPlusPlusSource.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA00];
  *a1 = *MEMORY[0x263F1DA00];
  return v1;
}

id static UTType.objectiveCPlusPlusSource.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBE0];
  *a1 = *MEMORY[0x263F1DBE0];
  return v1;
}

id static UTType.cHeader.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D9F0];
  *a1 = *MEMORY[0x263F1D9F0];
  return v1;
}

id static UTType.cPlusPlusHeader.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D9F8];
  *a1 = *MEMORY[0x263F1D9F8];
  return v1;
}

id static UTType.appleScript.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D988];
  *a1 = *MEMORY[0x263F1D988];
  return v1;
}

id static UTType.osaScript.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBD0];
  *a1 = *MEMORY[0x263F1DBD0];
  return v1;
}

id static UTType.osaScriptBundle.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBD8];
  *a1 = *MEMORY[0x263F1DBD8];
  return v1;
}

id static UTType.javaScript.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB50];
  *a1 = *MEMORY[0x263F1DB50];
  return v1;
}

id static UTType.shellScript.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DCA8];
  *a1 = *MEMORY[0x263F1DCA8];
  return v1;
}

id static UTType.perlScript.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC18];
  *a1 = *MEMORY[0x263F1DC18];
  return v1;
}

id static UTType.pythonScript.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC48];
  *a1 = *MEMORY[0x263F1DC48];
  return v1;
}

id static UTType.rubyScript.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC88];
  *a1 = *MEMORY[0x263F1DC88];
  return v1;
}

id static UTType.phpScript.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBF8];
  *a1 = *MEMORY[0x263F1DBF8];
  return v1;
}

id static UTType.makefile.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBB0];
  *a1 = *MEMORY[0x263F1DBB0];
  return v1;
}

id static UTType.jpeg.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB40];
  *a1 = *MEMORY[0x263F1DB40];
  return v1;
}

id static UTType.tiff.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DCE0];
  *a1 = *MEMORY[0x263F1DCE0];
  return v1;
}

id static UTType.gif.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DAD0];
  *a1 = *MEMORY[0x263F1DAD0];
  return v1;
}

id static UTType.png.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC08];
  *a1 = *MEMORY[0x263F1DC08];
  return v1;
}

id static UTType.icns.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB08];
  *a1 = *MEMORY[0x263F1DB08];
  return v1;
}

id static UTType.bmp.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D9C8];
  *a1 = *MEMORY[0x263F1D9C8];
  return v1;
}

id static UTType.ico.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB10];
  *a1 = *MEMORY[0x263F1DB10];
  return v1;
}

id static UTType.rawImage.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC60];
  *a1 = *MEMORY[0x263F1DC60];
  return v1;
}

id static UTType.svg.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC90];
  *a1 = *MEMORY[0x263F1DC90];
  return v1;
}

id static UTType.livePhoto.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB60];
  *a1 = *MEMORY[0x263F1DB60];
  return v1;
}

id static UTType.heif.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DAF8];
  *a1 = *MEMORY[0x263F1DAF8];
  return v1;
}

id static UTType.heics.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DAF0];
  *a1 = *MEMORY[0x263F1DAF0];
  return v1;
}

id static UTType.webP.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD78];
  *a1 = *MEMORY[0x263F1DD78];
  return v1;
}

id static UTType.exr.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA88];
  *a1 = *MEMORY[0x263F1DA88];
  return v1;
}

id static UTType.dng.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA40];
  *a1 = *MEMORY[0x263F1DA40];
  return v1;
}

void static UTType.jpegxl.getter(void *a1@<X8>)
{
  BOOL v2 = (void *)MEMORY[0x216681FA0](0x6A2E63696C627570, 0xEE006C782D676570);
  id v3 = [self sel_typeWithIdentifier:v2];

  if (v3) {
    *a1 = v3;
  }
  else {
    __break(1u);
  }
}

id static UTType.usd.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD18];
  *a1 = *MEMORY[0x263F1DD18];
  return v1;
}

id static UTType.usdz.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD20];
  *a1 = *MEMORY[0x263F1DD20];
  return v1;
}

id static UTType.realityFile.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC78];
  *a1 = *MEMORY[0x263F1DC78];
  return v1;
}

id static UTType.sceneKitScene.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC98];
  *a1 = *MEMORY[0x263F1DC98];
  return v1;
}

id static UTType.arReferenceObject.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D958];
  *a1 = *MEMORY[0x263F1D958];
  return v1;
}

id static UTType.movie.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBC8];
  *a1 = *MEMORY[0x263F1DBC8];
  return v1;
}

id static UTType.video.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD58];
  *a1 = *MEMORY[0x263F1DD58];
  return v1;
}

id static UTType.audio.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D9B8];
  *a1 = *MEMORY[0x263F1D9B8];
  return v1;
}

id static UTType.quickTimeMovie.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC58];
  *a1 = *MEMORY[0x263F1DC58];
  return v1;
}

id static UTType.mpeg.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB88];
  *a1 = *MEMORY[0x263F1DB88];
  return v1;
}

id static UTType.mpeg2Video.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB98];
  *a1 = *MEMORY[0x263F1DB98];
  return v1;
}

id static UTType.mpeg2TransportStream.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB90];
  *a1 = *MEMORY[0x263F1DB90];
  return v1;
}

id static UTType.mp3.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB80];
  *a1 = *MEMORY[0x263F1DB80];
  return v1;
}

id static UTType.mpeg4Movie.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBA8];
  *a1 = *MEMORY[0x263F1DBA8];
  return v1;
}

id static UTType.mpeg4Audio.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBA0];
  *a1 = *MEMORY[0x263F1DBA0];
  return v1;
}

id static UTType.appleProtectedMPEG4Audio.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D978];
  *a1 = *MEMORY[0x263F1D978];
  return v1;
}

id static UTType.appleProtectedMPEG4Video.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D980];
  *a1 = *MEMORY[0x263F1D980];
  return v1;
}

id static UTType.avi.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D960];
  *a1 = *MEMORY[0x263F1D960];
  return v1;
}

id static UTType.aiff.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D950];
  *a1 = *MEMORY[0x263F1D950];
  return v1;
}

id static UTType.wav.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD68];
  *a1 = *MEMORY[0x263F1DD68];
  return v1;
}

id static UTType.midi.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB78];
  *a1 = *MEMORY[0x263F1DB78];
  return v1;
}

id static UTType.m3uPlaylist.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB70];
  *a1 = *MEMORY[0x263F1DB70];
  return v1;
}

id static UTType.volume.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD60];
  *a1 = *MEMORY[0x263F1DD60];
  return v1;
}

id static UTType.package.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC10];
  *a1 = *MEMORY[0x263F1DC10];
  return v1;
}

id static UTType.bundle.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D9E8];
  *a1 = *MEMORY[0x263F1D9E8];
  return v1;
}

id static UTType.pluginBundle.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC30];
  *a1 = *MEMORY[0x263F1DC30];
  return v1;
}

id static UTType.spotlightImporter.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DCB8];
  *a1 = *MEMORY[0x263F1DCB8];
  return v1;
}

id static UTType.quickLookGenerator.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC50];
  *a1 = *MEMORY[0x263F1DC50];
  return v1;
}

id static UTType.xpcService.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD98];
  *a1 = *MEMORY[0x263F1DD98];
  return v1;
}

id static UTType.framework.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DAC8];
  *a1 = *MEMORY[0x263F1DAC8];
  return v1;
}

id static UTType.application.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D990];
  *a1 = *MEMORY[0x263F1D990];
  return v1;
}

id static UTType.applicationBundle.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D998];
  *a1 = *MEMORY[0x263F1D998];
  return v1;
}

id static UTType.applicationExtension.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D9A0];
  *a1 = *MEMORY[0x263F1D9A0];
  return v1;
}

id static UTType.unixExecutable.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD48];
  *a1 = *MEMORY[0x263F1DD48];
  return v1;
}

id static UTType.exe.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA80];
  *a1 = *MEMORY[0x263F1DA80];
  return v1;
}

id static UTType.systemPreferencesPane.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DCD8];
  *a1 = *MEMORY[0x263F1DCD8];
  return v1;
}

id static UTType.gzip.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DAD8];
  *a1 = *MEMORY[0x263F1DAD8];
  return v1;
}

id static UTType.bz2.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D9D0];
  *a1 = *MEMORY[0x263F1D9D0];
  return v1;
}

id static UTType.zip.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DDA8];
  *a1 = *MEMORY[0x263F1DDA8];
  return v1;
}

id static UTType.appleArchive.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D970];
  *a1 = *MEMORY[0x263F1D970];
  return v1;
}

id static UTType.tarArchive.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DCF0];
  *a1 = *MEMORY[0x263F1DCF0];
  return v1;
}

id static UTType.database.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA50];
  *a1 = *MEMORY[0x263F1DA50];
  return v1;
}

id static UTType.message.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DBB8];
  *a1 = *MEMORY[0x263F1DBB8];
  return v1;
}

id static UTType.contact.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA30];
  *a1 = *MEMORY[0x263F1DA30];
  return v1;
}

id static UTType.vCard.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD50];
  *a1 = *MEMORY[0x263F1DD50];
  return v1;
}

id static UTType.toDoItem.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD00];
  *a1 = *MEMORY[0x263F1DD00];
  return v1;
}

id static UTType.calendarEvent.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA18];
  *a1 = *MEMORY[0x263F1DA18];
  return v1;
}

id static UTType.emailMessage.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA90];
  *a1 = *MEMORY[0x263F1DA90];
  return v1;
}

id static UTType.internetLocation.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB20];
  *a1 = *MEMORY[0x263F1DB20];
  return v1;
}

id static UTType.internetShortcut.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB28];
  *a1 = *MEMORY[0x263F1DB28];
  return v1;
}

id static UTType.font.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DAC0];
  *a1 = *MEMORY[0x263F1DAC0];
  return v1;
}

id static UTType.bookmark.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D9E0];
  *a1 = *MEMORY[0x263F1D9E0];
  return v1;
}

id static UTType.pkcs12.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DC00];
  *a1 = *MEMORY[0x263F1DC00];
  return v1;
}

id static UTType.x509Certificate.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DD80];
  *a1 = *MEMORY[0x263F1DD80];
  return v1;
}

id static UTType.epub.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DA78];
  *a1 = *MEMORY[0x263F1DA78];
  return v1;
}

id static UTType.log.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB68];
  *a1 = *MEMORY[0x263F1DB68];
  return v1;
}

id static UTType.ahap.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1D948];
  *a1 = *MEMORY[0x263F1D948];
  return v1;
}

id static UTType.geoJSON.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DAE0];
  *a1 = *MEMORY[0x263F1DAE0];
  return v1;
}

id static UTType.linkPresentationMetadata.getter@<X0>(void *a1@<X8>)
{
  unint64_t v1 = (void *)*MEMORY[0x263F1DB58];
  *a1 = *MEMORY[0x263F1DB58];
  return v1;
}

char *static UTType._namedConstants_UTCoreTypes.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UTType>);
  uint64_t v0 = swift_allocObject();
  unint64_t v1 = (void **)MEMORY[0x263F1DB38];
  *(_OWORD *)(v0 + 16) = xmmword_2128123F0;
  BOOL v2 = *v1;
  id v3 = (void *)*MEMORY[0x263F1DA38];
  *(void *)(v0 + 32) = v2;
  *(void *)(v0 + 40) = v3;
  uint64_t v4 = (void *)*MEMORY[0x263F1DA28];
  char v5 = (void *)*MEMORY[0x263F1DA70];
  *(void *)(v0 + 48) = *MEMORY[0x263F1DA28];
  *(void *)(v0 + 56) = v5;
  char v6 = (void *)*MEMORY[0x263F1DA48];
  unint64_t v7 = (void *)*MEMORY[0x263F1DA68];
  unint64_t v8 = (void **)MEMORY[0x263F1DC80];
  *(void *)(v0 + 64) = *MEMORY[0x263F1DA48];
  *(void *)(v0 + 72) = v7;
  uint64_t v9 = *v8;
  unint64_t v10 = (void *)*MEMORY[0x263F1DCD0];
  *(void *)(v0 + 80) = *v8;
  *(void *)(v0 + 88) = v10;
  uint64_t v11 = (void *)*MEMORY[0x263F1DA98];
  unint64_t v12 = (void *)*MEMORY[0x263F1DBC0];
  *(void *)(v0 + 96) = *MEMORY[0x263F1DA98];
  *(void *)(v0 + 104) = v12;
  v225 = (void *)*MEMORY[0x263F1D968];
  v226 = (void *)*MEMORY[0x263F1DD10];
  uint64_t v13 = *MEMORY[0x263F1DD10];
  unint64_t v14 = (void **)MEMORY[0x263F1DD08];
  *(void *)(v0 + 112) = *MEMORY[0x263F1D968];
  *(void *)(v0 + 120) = v13;
  v227 = *v14;
  v230 = (void *)*MEMORY[0x263F1DAA0];
  uint64_t v15 = *MEMORY[0x263F1DAA0];
  *(void *)(v0 + 128) = v227;
  *(void *)(v0 + 136) = v15;
  v228 = (void *)*MEMORY[0x263F1DCF8];
  v231 = (void *)*MEMORY[0x263F1DC20];
  uint64_t v16 = *MEMORY[0x263F1DC20];
  *(void *)(v0 + 144) = *MEMORY[0x263F1DCF8];
  *(void *)(v0 + 152) = v16;
  v229 = (void *)*MEMORY[0x263F1DD38];
  v232 = (void *)*MEMORY[0x263F1DD28];
  uint64_t v17 = *MEMORY[0x263F1DD28];
  unint64_t v18 = (void **)MEMORY[0x263F1DD30];
  *(void *)(v0 + 160) = *MEMORY[0x263F1DD38];
  *(void *)(v0 + 168) = v17;
  v233 = *v18;
  v236 = (void *)*MEMORY[0x263F1DA58];
  uint64_t v19 = *MEMORY[0x263F1DA58];
  *(void *)(v0 + 176) = v233;
  *(void *)(v0 + 184) = v19;
  v234 = (void *)*MEMORY[0x263F1DA20];
  v237 = (void *)*MEMORY[0x263F1DCE8];
  uint64_t v20 = *MEMORY[0x263F1DCE8];
  *(void *)(v0 + 192) = *MEMORY[0x263F1DA20];
  *(void *)(v0 + 200) = v20;
  v235 = (void *)*MEMORY[0x263F1DD40];
  v238 = (void *)*MEMORY[0x263F1DC68];
  uint64_t v21 = *MEMORY[0x263F1DC68];
  unint64_t v22 = (void **)MEMORY[0x263F1DB00];
  *(void *)(v0 + 208) = *MEMORY[0x263F1DD40];
  *(void *)(v0 + 216) = v21;
  v239 = *v22;
  v241 = (void *)*MEMORY[0x263F1DD88];
  uint64_t v23 = *MEMORY[0x263F1DD88];
  *(void *)(v0 + 224) = v239;
  *(void *)(v0 + 232) = v23;
  v240 = (void *)*MEMORY[0x263F1DDA0];
  v243 = (void *)*MEMORY[0x263F1DCB0];
  uint64_t v24 = *MEMORY[0x263F1DCB0];
  *(void *)(v0 + 240) = *MEMORY[0x263F1DDA0];
  *(void *)(v0 + 248) = v24;
  v242 = (void *)*MEMORY[0x263F1D9B0];
  v244 = (void *)*MEMORY[0x263F1DA10];
  uint64_t v25 = *MEMORY[0x263F1DA10];
  *(void *)(v0 + 256) = *MEMORY[0x263F1D9B0];
  char v26 = (void **)MEMORY[0x263F1DBE8];
  *(void *)(v0 + 264) = v25;
  v245 = *v26;
  v247 = (void *)*MEMORY[0x263F1DCC8];
  uint64_t v27 = *MEMORY[0x263F1DCC8];
  *(void *)(v0 + 272) = v245;
  *(void *)(v0 + 280) = v27;
  v246 = (void *)*MEMORY[0x263F1DA00];
  v249 = (void *)*MEMORY[0x263F1DBE0];
  uint64_t v28 = *MEMORY[0x263F1DBE0];
  *(void *)(v0 + 288) = *MEMORY[0x263F1DA00];
  *(void *)(v0 + 296) = v28;
  v248 = (void *)*MEMORY[0x263F1D9F0];
  v250 = (void *)*MEMORY[0x263F1D9F8];
  uint64_t v29 = *MEMORY[0x263F1D9F8];
  *(void *)(v0 + 304) = *MEMORY[0x263F1D9F0];
  uint64_t v30 = (void **)MEMORY[0x263F1DCA0];
  *(void *)(v0 + 312) = v29;
  v251 = *v30;
  v253 = (void *)*MEMORY[0x263F1D988];
  uint64_t v31 = *MEMORY[0x263F1D988];
  *(void *)(v0 + 320) = v251;
  *(void *)(v0 + 328) = v31;
  v252 = (void *)*MEMORY[0x263F1DBD0];
  v255 = (void *)*MEMORY[0x263F1DBD8];
  uint64_t v32 = *MEMORY[0x263F1DBD8];
  *(void *)(v0 + 336) = *MEMORY[0x263F1DBD0];
  *(void *)(v0 + 344) = v32;
  v254 = (void *)*MEMORY[0x263F1DB50];
  v256 = (void *)*MEMORY[0x263F1DCA8];
  uint64_t v33 = *MEMORY[0x263F1DCA8];
  *(void *)(v0 + 352) = *MEMORY[0x263F1DB50];
  uint64_t v34 = (void **)MEMORY[0x263F1DC18];
  *(void *)(v0 + 360) = v33;
  v257 = *v34;
  v259 = (void *)*MEMORY[0x263F1DC48];
  uint64_t v35 = *MEMORY[0x263F1DC48];
  *(void *)(v0 + 368) = v257;
  *(void *)(v0 + 376) = v35;
  v258 = (void *)*MEMORY[0x263F1DC88];
  v261 = (void *)*MEMORY[0x263F1DBF8];
  uint64_t v36 = *MEMORY[0x263F1DBF8];
  *(void *)(v0 + 384) = *MEMORY[0x263F1DC88];
  *(void *)(v0 + 392) = v36;
  v260 = (void *)*MEMORY[0x263F1DB48];
  v262 = (void *)*MEMORY[0x263F1DC40];
  uint64_t v37 = *MEMORY[0x263F1DC40];
  *(void *)(v0 + 400) = *MEMORY[0x263F1DB48];
  char v38 = (void **)MEMORY[0x263F1DD90];
  *(void *)(v0 + 408) = v37;
  v263 = *v38;
  v265 = (void *)*MEMORY[0x263F1D9D8];
  uint64_t v39 = *MEMORY[0x263F1D9D8];
  *(void *)(v0 + 416) = v263;
  *(void *)(v0 + 424) = v39;
  v264 = (void *)*MEMORY[0x263F1DBF0];
  v267 = (void *)*MEMORY[0x263F1DC70];
  uint64_t v40 = *MEMORY[0x263F1DC70];
  *(void *)(v0 + 432) = *MEMORY[0x263F1DBF0];
  *(void *)(v0 + 440) = v40;
  v266 = (void *)*MEMORY[0x263F1DAA8];
  v268 = (void *)*MEMORY[0x263F1DD70];
  uint64_t v41 = *MEMORY[0x263F1DD70];
  *(void *)(v0 + 448) = *MEMORY[0x263F1DAA8];
  v42 = (void **)MEMORY[0x263F1DB18];
  *(void *)(v0 + 456) = v41;
  v269 = *v42;
  v271 = (void *)*MEMORY[0x263F1DB40];
  uint64_t v43 = *MEMORY[0x263F1DB40];
  *(void *)(v0 + 464) = v269;
  *(void *)(v0 + 472) = v43;
  v270 = (void *)*MEMORY[0x263F1DCE0];
  v273 = (void *)*MEMORY[0x263F1DAD0];
  uint64_t v44 = *MEMORY[0x263F1DAD0];
  *(void *)(v0 + 480) = *MEMORY[0x263F1DCE0];
  *(void *)(v0 + 488) = v44;
  v272 = (void *)*MEMORY[0x263F1DC08];
  v274 = (void *)*MEMORY[0x263F1DB08];
  uint64_t v45 = *MEMORY[0x263F1DB08];
  *(void *)(v0 + 496) = *MEMORY[0x263F1DC08];
  v275 = (void *)*MEMORY[0x263F1D9C8];
  uint64_t v46 = *MEMORY[0x263F1D9C8];
  *(void *)(v0 + 504) = v45;
  *(void *)(v0 + 512) = v46;
  v277 = (void *)*MEMORY[0x263F1DB10];
  *(void *)(v0 + 520) = *MEMORY[0x263F1DB10];
  v276 = (void *)*MEMORY[0x263F1DC60];
  v47 = (void **)MEMORY[0x263F1DC90];
  *(void *)(v0 + 528) = *MEMORY[0x263F1DC60];
  v278 = *v47;
  *(void *)(v0 + 536) = *v47;
  v280 = (void *)*MEMORY[0x263F1DB60];
  *(void *)(v0 + 544) = *MEMORY[0x263F1DB60];
  v279 = (void *)*MEMORY[0x263F1DAF8];
  v48 = (void **)MEMORY[0x263F1DAE8];
  *(void *)(v0 + 552) = *MEMORY[0x263F1DAF8];
  v281 = *v48;
  *(void *)(v0 + 560) = *v48;
  v283 = (void *)*MEMORY[0x263F1DD78];
  *(void *)(v0 + 568) = *MEMORY[0x263F1DD78];
  v282 = (void *)*MEMORY[0x263F1D940];
  v49 = (void **)MEMORY[0x263F1DD18];
  *(void *)(v0 + 576) = *MEMORY[0x263F1D940];
  v284 = *v49;
  *(void *)(v0 + 584) = *v49;
  v286 = (void *)*MEMORY[0x263F1DD20];
  *(void *)(v0 + 592) = *MEMORY[0x263F1DD20];
  v285 = (void *)*MEMORY[0x263F1DC78];
  v50 = (void **)MEMORY[0x263F1DC98];
  *(void *)(v0 + 600) = *MEMORY[0x263F1DC78];
  v287 = *v50;
  *(void *)(v0 + 608) = *v50;
  v289 = (void *)*MEMORY[0x263F1D958];
  *(void *)(v0 + 616) = *MEMORY[0x263F1D958];
  v288 = (void *)*MEMORY[0x263F1D9C0];
  v51 = (void **)MEMORY[0x263F1DBC8];
  *(void *)(v0 + 624) = *MEMORY[0x263F1D9C0];
  v290 = *v51;
  *(void *)(v0 + 632) = *v51;
  v292 = (void *)*MEMORY[0x263F1DD58];
  *(void *)(v0 + 640) = *MEMORY[0x263F1DD58];
  v291 = (void *)*MEMORY[0x263F1D9B8];
  v52 = (void **)MEMORY[0x263F1DC58];
  *(void *)(v0 + 648) = *MEMORY[0x263F1D9B8];
  v293 = *v52;
  *(void *)(v0 + 656) = *v52;
  v295 = (void *)*MEMORY[0x263F1DB88];
  *(void *)(v0 + 664) = *MEMORY[0x263F1DB88];
  v294 = (void *)*MEMORY[0x263F1DB98];
  v53 = (void **)MEMORY[0x263F1DB90];
  *(void *)(v0 + 672) = *MEMORY[0x263F1DB98];
  v296 = *v53;
  *(void *)(v0 + 680) = *v53;
  v298 = (void *)*MEMORY[0x263F1DB80];
  *(void *)(v0 + 688) = *MEMORY[0x263F1DB80];
  v297 = (void *)*MEMORY[0x263F1DBA8];
  v54 = (void **)MEMORY[0x263F1DBA0];
  *(void *)(v0 + 696) = *MEMORY[0x263F1DBA8];
  v299 = *v54;
  *(void *)(v0 + 704) = *v54;
  v301 = (void *)*MEMORY[0x263F1D978];
  *(void *)(v0 + 712) = *MEMORY[0x263F1D978];
  v300 = (void *)*MEMORY[0x263F1D980];
  v55 = (void **)MEMORY[0x263F1D960];
  *(void *)(v0 + 720) = *MEMORY[0x263F1D980];
  v302 = *v55;
  *(void *)(v0 + 728) = *v55;
  v304 = (void *)*MEMORY[0x263F1D950];
  *(void *)(v0 + 736) = *MEMORY[0x263F1D950];
  v303 = (void *)*MEMORY[0x263F1DD68];
  v56 = (void **)MEMORY[0x263F1DB78];
  *(void *)(v0 + 744) = *MEMORY[0x263F1DD68];
  v305 = *v56;
  *(void *)(v0 + 752) = *v56;
  v307 = (void *)*MEMORY[0x263F1DC28];
  *(void *)(v0 + 760) = *MEMORY[0x263F1DC28];
  v306 = (void *)*MEMORY[0x263F1DB70];
  v57 = (void **)MEMORY[0x263F1DAB0];
  *(void *)(v0 + 768) = *MEMORY[0x263F1DB70];
  v308 = *v57;
  *(void *)(v0 + 776) = *v57;
  v310 = (void *)*MEMORY[0x263F1DD60];
  *(void *)(v0 + 784) = *MEMORY[0x263F1DD60];
  v309 = (void *)*MEMORY[0x263F1DC10];
  v58 = (void **)MEMORY[0x263F1D9E8];
  *(void *)(v0 + 792) = *MEMORY[0x263F1DC10];
  v311 = *v58;
  *(void *)(v0 + 800) = *v58;
  v313 = (void *)*MEMORY[0x263F1DC30];
  *(void *)(v0 + 808) = *MEMORY[0x263F1DC30];
  v312 = (void *)*MEMORY[0x263F1DCB8];
  v59 = (void **)MEMORY[0x263F1DC50];
  *(void *)(v0 + 816) = *MEMORY[0x263F1DCB8];
  v314 = *v59;
  *(void *)(v0 + 824) = *v59;
  v316 = (void *)*MEMORY[0x263F1DD98];
  *(void *)(v0 + 832) = *MEMORY[0x263F1DD98];
  v315 = (void *)*MEMORY[0x263F1DAC8];
  v60 = (void **)MEMORY[0x263F1D990];
  *(void *)(v0 + 840) = *MEMORY[0x263F1DAC8];
  v317 = *v60;
  *(void *)(v0 + 848) = *v60;
  v319 = (void *)*MEMORY[0x263F1D998];
  *(void *)(v0 + 856) = *MEMORY[0x263F1D998];
  v318 = (void *)*MEMORY[0x263F1D9A0];
  v61 = (void **)MEMORY[0x263F1DD48];
  *(void *)(v0 + 864) = *MEMORY[0x263F1D9A0];
  v320 = *v61;
  *(void *)(v0 + 872) = *v61;
  v322 = (void *)*MEMORY[0x263F1DA80];
  *(void *)(v0 + 880) = *MEMORY[0x263F1DA80];
  v321 = (void *)*MEMORY[0x263F1DCD8];
  v62 = (void **)MEMORY[0x263F1D9A8];
  *(void *)(v0 + 888) = *MEMORY[0x263F1DCD8];
  v323 = *v62;
  *(void *)(v0 + 896) = *v62;
  v325 = (void *)*MEMORY[0x263F1DAD8];
  *(void *)(v0 + 904) = *MEMORY[0x263F1DAD8];
  v324 = (void *)*MEMORY[0x263F1D9D0];
  v63 = (void **)MEMORY[0x263F1DDA8];
  *(void *)(v0 + 912) = *MEMORY[0x263F1D9D0];
  v326 = *v63;
  *(void *)(v0 + 920) = *v63;
  v328 = (void *)*MEMORY[0x263F1D970];
  *(void *)(v0 + 928) = *MEMORY[0x263F1D970];
  v327 = (void *)*MEMORY[0x263F1DCC0];
  v64 = (void **)MEMORY[0x263F1DC38];
  *(void *)(v0 + 936) = *MEMORY[0x263F1DCC0];
  v329 = *v64;
  *(void *)(v0 + 944) = *v64;
  v331 = (void *)*MEMORY[0x263F1DA50];
  *(void *)(v0 + 952) = *MEMORY[0x263F1DA50];
  v330 = (void *)*MEMORY[0x263F1DBB8];
  v65 = (void **)MEMORY[0x263F1DA30];
  *(void *)(v0 + 960) = *MEMORY[0x263F1DBB8];
  v332 = *v65;
  *(void *)(v0 + 968) = *v65;
  v334 = (void *)*MEMORY[0x263F1DD50];
  *(void *)(v0 + 976) = *MEMORY[0x263F1DD50];
  v333 = (void *)*MEMORY[0x263F1DD00];
  v66 = (void **)MEMORY[0x263F1DA18];
  *(void *)(v0 + 984) = *MEMORY[0x263F1DD00];
  v335 = *v66;
  *(void *)(v0 + 992) = *v66;
  v337 = (void *)*MEMORY[0x263F1DA90];
  *(void *)(v0 + 1000) = *MEMORY[0x263F1DA90];
  v336 = (void *)*MEMORY[0x263F1DB20];
  v67 = (void **)MEMORY[0x263F1DB28];
  *(void *)(v0 + 1008) = *MEMORY[0x263F1DB20];
  v338 = *v67;
  *(void *)(v0 + 1016) = *v67;
  v340 = (void *)*MEMORY[0x263F1DAC0];
  *(void *)(v0 + 1024) = *MEMORY[0x263F1DAC0];
  v339 = (void *)*MEMORY[0x263F1D9E0];
  v68 = (void **)MEMORY[0x263F1DC00];
  *(void *)(v0 + 1032) = *MEMORY[0x263F1D9E0];
  v341 = *v68;
  *(void *)(v0 + 1040) = *v68;
  v343 = (void *)*MEMORY[0x263F1DD80];
  *(void *)(v0 + 1048) = *MEMORY[0x263F1DD80];
  v342 = (void *)*MEMORY[0x263F1DA78];
  v69 = (void **)MEMORY[0x263F1DB68];
  *(void *)(v0 + 1056) = *MEMORY[0x263F1DA78];
  v344 = *v69;
  *(void *)(v0 + 1064) = *v69;
  v345 = (void *)*MEMORY[0x263F1DBB0];
  id v70 = v2;
  id v71 = v3;
  id v72 = v4;
  id v73 = v5;
  id v74 = v6;
  id v75 = v7;
  id v76 = v9;
  id v77 = v10;
  id v78 = v11;
  id v79 = v12;
  id v80 = v225;
  id v81 = v226;
  id v82 = v227;
  id v83 = v230;
  id v84 = v228;
  id v85 = v231;
  id v86 = v229;
  id v87 = v232;
  id v88 = v233;
  id v89 = v236;
  id v90 = v234;
  id v91 = v237;
  id v92 = v235;
  id v93 = v238;
  id v94 = v239;
  id v95 = v241;
  id v96 = v240;
  id v97 = v243;
  id v98 = v242;
  id v99 = v244;
  id v100 = v245;
  id v101 = v247;
  id v102 = v246;
  id v103 = v249;
  id v104 = v248;
  id v105 = v250;
  id v106 = v251;
  id v107 = v253;
  id v108 = v252;
  id v109 = v255;
  id v110 = v254;
  id v111 = v256;
  id v112 = v257;
  id v113 = v259;
  id v114 = v258;
  id v115 = v261;
  id v116 = v260;
  id v117 = v262;
  id v118 = v263;
  id v119 = v265;
  id v120 = v264;
  id v121 = v267;
  id v122 = v266;
  id v123 = v268;
  id v124 = v269;
  id v125 = v271;
  id v126 = v270;
  id v127 = v273;
  id v128 = v272;
  id v129 = v274;
  id v130 = v275;
  id v131 = v277;
  id v132 = v276;
  id v133 = v278;
  id v134 = v280;
  id v135 = v279;
  id v136 = v281;
  id v137 = v283;
  id v138 = v282;
  id v139 = v284;
  id v140 = v286;
  id v141 = v285;
  id v142 = v287;
  id v143 = v289;
  id v144 = v288;
  id v145 = v290;
  id v146 = v292;
  id v147 = v291;
  id v148 = v293;
  id v149 = v295;
  id v150 = v294;
  id v151 = v296;
  id v152 = v298;
  id v153 = v297;
  id v154 = v299;
  id v155 = v301;
  id v156 = v300;
  id v157 = v302;
  id v158 = v304;
  id v159 = v303;
  id v160 = v305;
  id v161 = v307;
  id v162 = v306;
  id v163 = v308;
  id v164 = v310;
  id v165 = v309;
  id v166 = v311;
  id v167 = v313;
  id v168 = v312;
  id v169 = v314;
  id v170 = v316;
  id v171 = v315;
  id v172 = v317;
  id v173 = v319;
  id v174 = v318;
  id v175 = v320;
  id v176 = v322;
  id v177 = v321;
  id v178 = v323;
  id v179 = v325;
  id v180 = v324;
  id v181 = v326;
  id v182 = v328;
  id v183 = v327;
  id v184 = v329;
  id v185 = v331;
  id v186 = v330;
  id v187 = v332;
  id v188 = v334;
  id v189 = v333;
  id v190 = v335;
  id v191 = v337;
  id v192 = v336;
  id v193 = v338;
  id v194 = v340;
  id v195 = v339;
  id v196 = v341;
  id v197 = v343;
  id v198 = v342;
  id v199 = v344;
  id v200 = v345;
  v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)1, 131, 1, (char *)v0);
  *((void *)v201 + 2) = 131;
  *((void *)v201 + 134) = v200;
  unint64_t v202 = *((void *)v201 + 3);
  id v203 = (id)*MEMORY[0x263F1DA08];
  if (v202 <= 0x107) {
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v202 > 1), 132, 1, v201);
  }
  *((void *)v201 + 2) = 132;
  *((void *)v201 + 135) = v203;
  unint64_t v204 = *((void *)v201 + 3);
  id v205 = (id)*MEMORY[0x263F1DAF0];
  if (v204 <= 0x109) {
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v204 > 1), 133, 1, v201);
  }
  *((void *)v201 + 2) = 133;
  *((void *)v201 + 136) = v205;
  unint64_t v206 = *((void *)v201 + 3);
  id v207 = (id)*MEMORY[0x263F1DA88];
  if (v206 <= 0x10B) {
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v206 > 1), 134, 1, v201);
  }
  *((void *)v201 + 2) = 134;
  *((void *)v201 + 137) = v207;
  unint64_t v208 = *((void *)v201 + 3);
  id v209 = (id)*MEMORY[0x263F1DA40];
  if (v208 <= 0x10D) {
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v208 > 1), 135, 1, v201);
  }
  *((void *)v201 + 2) = 135;
  *((void *)v201 + 138) = v209;
  unint64_t v210 = *((void *)v201 + 3);
  id v211 = (id)*MEMORY[0x263F1DCF0];
  if (v210 <= 0x10F) {
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v210 > 1), 136, 1, v201);
  }
  *((void *)v201 + 2) = 136;
  *((void *)v201 + 139) = v211;
  unint64_t v212 = *((void *)v201 + 3);
  id v213 = (id)*MEMORY[0x263F1DAE0];
  if (v212 <= 0x111) {
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v212 > 1), 137, 1, v201);
  }
  *((void *)v201 + 2) = 137;
  *((void *)v201 + 140) = v213;
  unint64_t v214 = *((void *)v201 + 3);
  id v215 = (id)*MEMORY[0x263F1DB58];
  if (v214 <= 0x113) {
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v214 > 1), 138, 1, v201);
  }
  *((void *)v201 + 2) = 138;
  *((void *)v201 + 141) = v215;
  v216 = (void *)MEMORY[0x216681FA0](0x6A2E63696C627570, 0xEE006C782D676570);
  id v217 = [self sel_typeWithIdentifier:v216];

  if (!v217) {
    __break(1u);
  }
  unint64_t v219 = *((void *)v201 + 2);
  unint64_t v218 = *((void *)v201 + 3);
  unint64_t v220 = v219 + 1;
  if (v219 >= v218 >> 1) {
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v218 > 1), v219 + 1, 1, v201);
  }
  *((void *)v201 + 2) = v220;
  *(void *)&v201[8 * v219 + 32] = v217;
  unint64_t v221 = *((void *)v201 + 3);
  int64_t v222 = v219 + 2;
  id v223 = (id)*MEMORY[0x263F1D948];
  if (v222 > (uint64_t)(v221 >> 1)) {
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v221 > 1), v222, 1, v201);
  }
  *((void *)v201 + 2) = v222;
  *(void *)&v201[8 * v220 + 32] = v223;
  return v201;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UTType>);
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
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

id NSItemProvider.init(contentsOf:contentType:openInPlace:coordinated:visibility:)@<X0>(uint64_t a1@<X0>, void **a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, NSURL *a6@<X8>)
{
  unint64_t v10 = *a2;
  URL._bridgeToObjectiveC()(a6);
  uint64_t v12 = v11;
  id v13 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithContentsOfURL:v11 contentType:v10 openInPlace:(a3 & 1) coordinated:(a4 & 1) visibility:v12];

  uint64_t v14 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
  return v13;
}

void NSItemProvider.registerDataRepresentation(for:visibility:loadHandler:)(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = *a1;
  v9[4] = a3;
  v9[5] = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  id v9[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
  v9[3] = &block_descriptor;
  int64_t v7 = _Block_copy(v9);
  id v8 = v6;
  swift_retain();
  swift_release();
  [v4 registerDataRepresentationForContentType:v8 visibility:a2 loadHandler:v7];
  _Block_release(v7);
}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *a2)
{
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(a1, a2, (uint64_t)&unk_26C3BB238, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> ());
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

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> ()(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = _convertErrorToNSError(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

void NSItemProvider.registerFileRepresentation(for:visibility:openInPlace:loadHandler:)(void **a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  id v8 = *a1;
  v11[4] = a4;
  v11[5] = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
  v11[3] = &block_descriptor_3;
  uint64_t v9 = _Block_copy(v11);
  id v10 = v8;
  swift_retain();
  swift_release();
  [v5 registerFileRepresentationForContentType:v10 visibility:a2 openInPlace:(a3 & 1) loadHandler:v9];
  _Block_release(v9);
}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *a2)
{
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(a1, a2, (uint64_t)&unk_26C3BB210, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ());
}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *aBlock, uint64_t a3, uint64_t a4)
{
  char v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  unint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_retain();
  id v8 = (void *)v5(a4, v7);
  swift_release();
  swift_release();

  return v8;
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL?(a1, (uint64_t)v9);
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  id v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    URL._bridgeToObjectiveC()(v12);
    id v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  }
  if (a3) {
    uint64_t v15 = (void *)_convertErrorToNSError(_:)();
  }
  else {
    uint64_t v15 = 0;
  }
  (*(void (**)(uint64_t, void *, void, void *))(a4 + 16))(a4, v13, a2 & 1, v15);
}

id NSItemProvider.loadDataRepresentation(for:completionHandler:)(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  v9[4] = a2;
  v9[5] = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  id v9[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ();
  v9[3] = &block_descriptor_6;
  char v5 = _Block_copy(v9);
  id v6 = v4;
  swift_retain();
  swift_release();
  id v7 = [v3 loadDataRepresentationForContentType:v6 completionHandler:v5];
  _Block_release(v5);

  return v7;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  char v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  outlined consume of Data?((uint64_t)v4, v8);

  return swift_release();
}

id NSItemProvider.loadFileRepresentation(for:openInPlace:completionHandler:)(void **a1, char a2, uint64_t a3, uint64_t a4)
{
  id v6 = *a1;
  v11[4] = a3;
  v11[5] = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ();
  v11[3] = &block_descriptor_9;
  unint64_t v7 = _Block_copy(v11);
  id v8 = v6;
  swift_retain();
  swift_release();
  id v9 = [v4 loadFileRepresentationForContentType:v8 openInPlace:(a2 & 1) completionHandler:v7];
  _Block_release(v7);

  return v9;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388]();
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void (**)(char *, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  swift_retain();
  id v13 = a4;
  v10(v9, a3, a4);
  swift_release();

  return outlined destroy of URL?((uint64_t)v9);
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_21280DB8C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(uint64_t a1, char a2, uint64_t a3)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> ()(uint64_t a1, unint64_t a2, uint64_t a3)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> ()(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t Encoder.encodeSingleValueSafely<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v15[6] = a1;
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  id v9 = (char *)&v15[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(dispatch thunk of Encoder.codingPath.getter() + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  }
  else
  {
    v15[0] = swift_getDynamicType();
    swift_getMetatypeMetadata();
    String.init<A>(describing:)();
    uint64_t v14 = a3;
    uint64_t v11 = specialized Sequence<>.starts<A>(with:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    if (v11)
    {
      char v12 = 0;
      return v12 & 1;
    }
  }
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, v15[3]);
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  if (!v4) {
    char v12 = 1;
  }
  return v12 & 1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t specialized Sequence<>.starts<A>(with:)()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Swift::String_optional v0 = String.Iterator.next()();
  if (v0.value._object)
  {
    uint64_t countAndFlagsBits = v0.value._countAndFlagsBits;
    object = v0.value._object;
    do
    {
      Swift::String_optional v5 = String.Iterator.next()();
      if (!v5.value._object)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (countAndFlagsBits == v5.value._countAndFlagsBits && object == v5.value._object)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      Swift::String_optional v4 = String.Iterator.next()();
      uint64_t countAndFlagsBits = v4.value._countAndFlagsBits;
      object = v4.value._object;
    }
    while (v4.value._object);
  }
  swift_bridgeObjectRelease();
  id v6 = String.Iterator.next()().value._object;
  swift_bridgeObjectRelease();
  BOOL v7 = v6 == 0;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t static UTType._enumerateAllDeclaredTypes(using:)(uint64_t a1, uint64_t a2)
{
  return specialized static UTType._enumerateAllDeclaredTypes(using:)(a1, a2);
}

{
  void v3[6];

  v3[2] = a1;
  v3[3] = a2;
  return specialized static UTType._enumerateAllDeclaredTypes(using:)((uint64_t)partial apply for closure #1 in static UTType._enumerateAllDeclaredTypes(using:), (uint64_t)v3);
}

uint64_t closure #1 in static UTType._enumerateAllDeclaredTypes(using:)(uint64_t *a1, unsigned char *a2, uint64_t (*a3)(uint64_t *, char *))
{
  uint64_t v4 = *a1;
  char v7 = 0;
  uint64_t v6 = v4;
  uint64_t result = a3(&v6, &v7);
  *a2 = v7;
  return result;
}

void thunk for @escaping @callee_guaranteed (@in_guaranteed UTType, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void **, uint64_t))(a1 + 32);
  uint64_t v6 = a2;
  id v5 = a2;
  v4(&v6, a3);
}

uint64_t static UTType._types(identifiers:)()
{
  Swift::String_optional v0 = self;
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  id v2 = [v0 typesWithIdentifiers:isa];

  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return v3;
}

Swift::String_optional __swiftcall UTType._localizedDescription(using:)(Swift::OpaquePointer using)
{
  uint64_t v1 = UTType._localizedDescription(using:)((uint64_t)using._rawValue, (SEL *)&selRef__localizedDescriptionWithPreferredLocalizations_);
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t UTType._localizedDescriptionDictionary.getter()
{
  return UTType._localizedDescriptionDictionary.getter((SEL *)&selRef__localizedDescriptionDictionary);
}

uint64_t UTType._kindString.getter()
{
  id v1 = [*v0 kindString];
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

Swift::String_optional __swiftcall UTType._kindString(using:)(Swift::OpaquePointer using)
{
  uint64_t v1 = UTType._localizedDescription(using:)((uint64_t)using._rawValue, (SEL *)&selRef__kindStringWithPreferredLocalizations_);
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t UTType._localizedDescription(using:)(uint64_t a1, SEL *a2)
{
  uint64_t v4 = *v2;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v6 = [v4 *a2:isa];

  if (!v6) {
    return 0;
  }
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v7;
}

uint64_t UTType._kindStringDictionary.getter()
{
  return UTType._localizedDescriptionDictionary.getter((SEL *)&selRef__kindStringDictionary);
}

uint64_t UTType._localizedDescriptionDictionary.getter(SEL *a1)
{
  id v2 = [*v1 *a1];
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t UTType.init(_ofItemAt:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  id v9 = @nonobjc UTType.init(_ofItemAt:)((uint64_t)v8);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  }
  id v11 = v9;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  *a2 = v11;
  return result;
}

id @nonobjc UTType.init(_ofItemAt:)(uint64_t a1)
{
  id v13 = (NSURL *)*MEMORY[0x263EF8340];
  URL._bridgeToObjectiveC()(v13);
  uint64_t v3 = v2;
  id v12 = 0;
  id v4 = [swift_getObjCClassFromMetadata() _typeOfItemAtFileURL:v2 error:&v12];

  id v5 = v12;
  if (v4)
  {
    uint64_t v6 = type metadata accessor for URL();
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    id v8 = v5;
    v7(a1, v6);
  }
  else
  {
    id v9 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  }
  return v4;
}

char *UTType._parentTypes.getter()
{
  uint64_t v1 = type metadata accessor for NSFastEnumerationIterator();
  uint64_t v10 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  id v4 = [*v0 parentTypes];
  NSOrderedSet.makeIterator()();

  lazy protocol witness table accessor for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator();
  dispatch thunk of IteratorProtocol.next()();
  if (v15)
  {
    id v5 = (char *)MEMORY[0x263F8EE78];
    do
    {
      outlined init with take of Any(&v14, v13);
      outlined init with copy of Any((uint64_t)v13, (uint64_t)v11);
      if ((swift_dynamicCast() & 1) == 0) {
        uint64_t v12 = 0;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
      uint64_t v6 = v12;
      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
        }
        unint64_t v8 = *((void *)v5 + 2);
        unint64_t v7 = *((void *)v5 + 3);
        if (v8 >= v7 >> 1) {
          id v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
        }
        *((void *)v5 + 2) = v8 + 1;
        *(void *)&v5[8 * v8 + 32] = v6;
      }
      dispatch thunk of IteratorProtocol.next()();
    }
    while (v15);
  }
  else
  {
    id v5 = (char *)MEMORY[0x263F8EE78];
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v3, v1);

  return v5;
}

uint64_t UTType._childTypes.getter()
{
  return UTType._childTypes.getter((SEL *)&selRef__childTypes);
}

uint64_t UTType._subtypes.getter()
{
  return UTType._childTypes.getter((SEL *)&selRef__subtypes);
}

uint64_t UTType._childTypes.getter(SEL *a1)
{
  id v2 = [*v1 *a1];
  lazy protocol witness table accessor for type UTType and conformance UTType();
  uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id UTType._isExported.getter()
{
  return [*v0 isExported];
}

id UTType._isImported.getter()
{
  return [*v0 isImported];
}

id UTType._isWildcard.getter()
{
  return [*v0 isWildcard];
}

id UTType._isCoreType.getter()
{
  return [*v0 isCoreType];
}

UniformTypeIdentifiers::UTType __swiftcall UTType.init(_exportedAs:from:conformingTo:)(Swift::String _exportedAs, NSBundle from, UniformTypeIdentifiers::UTType_optional conformingTo)
{
  UTType.init(_exportedAs:from:conformingTo:)(from.super.isa, (void **)conformingTo.value._type.super.isa, (SEL *)&selRef__exportedTypeWithIdentifier_bundle_conformingToType_, v3);
  return result;
}

UniformTypeIdentifiers::UTType __swiftcall UTType.init(_importedAs:from:conformingTo:)(Swift::String _importedAs, NSBundle from, UniformTypeIdentifiers::UTType_optional conformingTo)
{
  UTType.init(_exportedAs:from:conformingTo:)(from.super.isa, (void **)conformingTo.value._type.super.isa, (SEL *)&selRef__importedTypeWithIdentifier_bundle_conformingToType_, v3);
  return result;
}

void UTType.init(_exportedAs:from:conformingTo:)(void *a1@<X2>, void **a2@<X3>, SEL *a3@<X4>, void *a4@<X8>)
{
  unint64_t v7 = *a2;
  unint64_t v8 = (void *)MEMORY[0x216681FA0]();
  swift_bridgeObjectRelease();
  id v9 = [self *a3:v8 a1:v7];

  *a4 = v9;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(_identifier:allowUndeclared:)(Swift::String _identifier, Swift::Bool allowUndeclared)
{
  id v4 = v2;
  id v5 = (void *)MEMORY[0x216681FA0](_identifier._countAndFlagsBits);
  swift_bridgeObjectRelease();
  id v6 = [self typeWithIdentifier:v5 allowUndeclared:allowUndeclared];

  *id v4 = v6;
  result.value._type.super.Class isa = v7;
  result.is_nil = v8;
  return result;
}

uint64_t specialized static UTType._enumerateAllDeclaredTypes(using:)(uint64_t a1, uint64_t a2)
{
  id v11 = 0;
  uint64_t v4 = self;
  id v5 = (void *)swift_allocObject();
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = &v11;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = partial apply for closure #1 in static UTType._enumerateAllDeclaredTypes(using:);
  *(void *)(v6 + 24) = v5;
  v10[4] = partial apply for thunk for @callee_guaranteed (@in_guaranteed UTType, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed UTType, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v10[3] = &block_descriptor_0;
  unint64_t v7 = _Block_copy(v10);
  swift_retain();
  swift_release();
  [v4 enumerateAllDeclaredTypesUsingBlock:v7];
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (v11)
    {
      id v9 = v11;
      swift_willThrow();
    }
    return swift_release();
  }
  return result;
}

uint64_t partial apply for closure #1 in static UTType._enumerateAllDeclaredTypes(using:)(uint64_t *a1)
{
  id v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = *a1;
  return v2(&v4);
}

unint64_t type metadata accessor for UTType()
{
  unint64_t result = lazy cache variable for type metadata for UTType;
  if (!lazy cache variable for type metadata for UTType)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for UTType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator()
{
  unint64_t result = lazy protocol witness table cache variable for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator;
  if (!lazy protocol witness table cache variable for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator)
  {
    type metadata accessor for NSFastEnumerationIterator();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator);
  }
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21280ED34()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in static UTType._enumerateAllDeclaredTypes(using:)(uint64_t *a1, unsigned char *a2)
{
  return closure #1 in static UTType._enumerateAllDeclaredTypes(using:)(a1, a2, *(uint64_t (**)(uint64_t *, char *))(v2 + 16));
}

uint64_t sub_21280ED50()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed UTType, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
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

uint64_t static UTHardwareColor.currentEnclosureColor.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = _UTHardwareColorGetCurrentEnclosureColor();
  if (result) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 0xFF00000000;
  }
  *(_DWORD *)a1 = v3;
  *(unsigned char *)(a1 + 4) = BYTE4(v3);
  return result;
}

void UTHardwareColor.hash(into:)()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  if (*(unsigned char *)(v0 + 4))
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(BYTE1(v1));
    Hasher._combine(_:)(BYTE2(v1));
  }
}

Swift::Int UTHardwareColor.hashValue.getter()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  char v2 = *(unsigned char *)(v0 + 4);
  Hasher.init(_seed:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(BYTE1(v1));
    Hasher._combine(_:)(BYTE2(v1));
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UTHardwareColor()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  char v2 = *(unsigned char *)(v0 + 4);
  Hasher.init(_seed:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(BYTE1(v1));
    Hasher._combine(_:)(BYTE2(v1));
  }
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance UTHardwareColor()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  if (*(unsigned char *)(v0 + 4))
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(BYTE1(v1));
    Hasher._combine(_:)(BYTE2(v1));
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UTHardwareColor()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  char v2 = *(unsigned char *)(v0 + 4);
  Hasher.init(_seed:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(BYTE1(v1));
    Hasher._combine(_:)(BYTE2(v1));
  }
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance UTHardwareColor._CodingKey()
{
  if (*v0) {
    return 0x7865646E69;
  }
  else {
    return 6449010;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance UTHardwareColor._CodingKey@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized UTHardwareColor._CodingKey.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTHardwareColor._CodingKey(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance UTHardwareColor._CodingKey(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UTHardwareColor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTHardwareColor._CodingKey>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  Swift::Bool v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    v14[15] = 0;
    lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    uint64_t v10 = v15;
    if (!v15)
    {
      v14[14] = 1;
      int v13 = KeyedDecodingContainer.decode(_:forKey:)();
      (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
      goto LABEL_9;
    }
    if (*(void *)(v15 + 16) == 3)
    {
      int v11 = *(unsigned __int8 *)(v15 + 34);
      int v12 = *(unsigned __int16 *)(v15 + 32);
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
      int v13 = v12 | (v11 << 16);
LABEL_9:
      *(_DWORD *)a2 = v13;
      *(unsigned char *)(a2 + 4) = v10 == 0;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    swift_bridgeObjectRelease();
    v14[13] = 0;
    type metadata accessor for DecodingError();
    swift_allocError();
    lazy protocol witness table accessor for type KeyedDecodingContainer<UTHardwareColor._CodingKey> and conformance KeyedDecodingContainer<A>();
    static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
    swift_willThrow();
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t UTHardwareColor.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<UTHardwareColor._CodingKey>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v7 = *v1;
  char v8 = *((unsigned char *)v1 + 4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v8)
  {
    char v13 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_212812410;
    *(_WORD *)(v9 + 32) = v7;
    *(unsigned char *)(v9 + 34) = BYTE2(v7);
    v11[1] = v9;
    char v12 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t protocol witness for Decodable.init(from:) in conformance UTHardwareColor@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return UTHardwareColor.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance UTHardwareColor(void *a1)
{
  return UTHardwareColor.encode(to:)(a1);
}

uint64_t specialized static UTHardwareColor.== infix(_:_:)(int *a1, int *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  char v4 = *((unsigned char *)a2 + 4);
  if (a1[1])
  {
    if (v2 == v3) {
      return *((unsigned __int8 *)a2 + 4);
    }
    else {
      return 0;
    }
  }
  else
  {
    if ((unsigned __int16)*a1 != (unsigned __int16)v3) {
      char v4 = 1;
    }
    return (v4 & 1) == 0 && BYTE2(v2) == BYTE2(v3);
  }
}

unint64_t lazy protocol witness table accessor for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey()
{
  unint64_t result = lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey;
  if (!lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey;
  if (!lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey;
  if (!lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey;
  if (!lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey);
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

unint64_t lazy protocol witness table accessor for type KeyedDecodingContainer<UTHardwareColor._CodingKey> and conformance KeyedDecodingContainer<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type KeyedDecodingContainer<UTHardwareColor._CodingKey> and conformance KeyedDecodingContainer<A>;
  if (!lazy protocol witness table cache variable for type KeyedDecodingContainer<UTHardwareColor._CodingKey> and conformance KeyedDecodingContainer<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for KeyedDecodingContainer<UTHardwareColor._CodingKey>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyedDecodingContainer<UTHardwareColor._CodingKey> and conformance KeyedDecodingContainer<A>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt8]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UTHardwareColor and conformance UTHardwareColor()
{
  unint64_t result = lazy protocol witness table cache variable for type UTHardwareColor and conformance UTHardwareColor;
  if (!lazy protocol witness table cache variable for type UTHardwareColor and conformance UTHardwareColor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTHardwareColor and conformance UTHardwareColor);
  }
  return result;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for UTHardwareColor(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UTHardwareColor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 4) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for UTHardwareColor(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4);
}

uint64_t destructiveInjectEnumTag for UTHardwareColor(uint64_t result, char a2)
{
  *(unsigned char *)(result + 4) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UTHardwareColor()
{
  return &type metadata for UTHardwareColor;
}

unsigned char *storeEnumTagSinglePayload for UTHardwareColor._CodingKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21280FA28);
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

void *type metadata accessor for UTHardwareColor._CodingKey()
{
  return &unk_26C3BAEA8;
}

uint64_t specialized UTHardwareColor._CodingKey.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 6449010 && a2 == 0xE300000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000)
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

UniformTypeIdentifiers::UTTagClass __swiftcall UTTagClass.init(rawValue:)(UniformTypeIdentifiers::UTTagClass rawValue)
{
  UniformTypeIdentifiers::UTTagClass *v1 = rawValue;
  return rawValue;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance UTTagClass@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UTTagClass@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t static UTTagClass.filenameExtension.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static UTTagClass.mimeType.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static UTTagClass.== infix(_:_:)(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  unsigned int v4 = (void *)MEMORY[0x216681FA0](*a1, a1[1]);
  uint64_t v5 = (void *)MEMORY[0x216681FA0](v2, v3);
  uint64_t v6 = _UTIdentifiersAreEqual();

  return v6;
}

void UTTagClass.hash(into:)()
{
  Swift::UInt32 v1 = (void *)MEMORY[0x216681FA0](*v0, v0[1]);
  Swift::UInt HashCode = _UTIdentifierGetHashCode();

  Hasher._combine(_:)(HashCode);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UTTagClass(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  unsigned int v4 = (void *)MEMORY[0x216681FA0](*a1, a1[1]);
  uint64_t v5 = (void *)MEMORY[0x216681FA0](v2, v3);
  uint64_t v6 = _UTIdentifiersAreEqual();

  return v6;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UTTagClass()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  Hasher.init(_seed:)();
  uint64_t v3 = (void *)MEMORY[0x216681FA0](v1, v2);
  Swift::UInt HashCode = _UTIdentifierGetHashCode();

  Hasher._combine(_:)(HashCode);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance UTTagClass()
{
  uint64_t v1 = (void *)MEMORY[0x216681FA0](*v0, v0[1]);
  Swift::UInt HashCode = _UTIdentifierGetHashCode();

  Hasher._combine(_:)(HashCode);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UTTagClass()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  Hasher.init(_seed:)();
  uint64_t v3 = (void *)MEMORY[0x216681FA0](v1, v2);
  Swift::UInt HashCode = _UTIdentifierGetHashCode();

  Hasher._combine(_:)(HashCode);
  return Hasher._finalize()();
}

uint64_t UTTagClass.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTTagClass()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UTTagClass._CodingKeys()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UTTagClass._CodingKeys()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance UTTagClass._CodingKeys()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UTTagClass._CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance UTTagClass._CodingKeys()
{
  return 0x7373616C43676174;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance UTTagClass._CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x7373616C43676174 && a2 == 0xE800000000000000)
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

void protocol witness for CodingKey.init(intValue:) in conformance UTTagClass._CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTTagClass._CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance UTTagClass._CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UTTagClass.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<UTTagClass._CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  char v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v9 = v1[1];
  uint64_t v10 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  v13[0] = v8;
  v13[1] = v9;
  uint64_t result = Encoder.encodeSingleValueSafely<A>(_:)((uint64_t)v13, v10, MEMORY[0x263F8D310]);
  if (!v2 && (result & 1) == 0)
  {
    uint64_t v12 = a1[3];
    v13[3] = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v12);
    lazy protocol witness table accessor for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys();
    dispatch thunk of Encoder.container<A>(keyedBy:)();
    KeyedEncodingContainer.encode(_:forKey:)();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys);
  }
  return result;
}

uint64_t UTTagClass.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v18 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTTagClass._CodingKeys>?);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v17[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTTagClass._CodingKeys>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v17[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    outlined destroy of KeyedDecodingContainer<UTTagClass._CodingKeys>?((uint64_t)v5);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    dispatch thunk of Decoder.singleValueContainer()();
    __swift_project_boxed_opaque_existential_1(v17, v17[3]);
    uint64_t v10 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    uint64_t v12 = v11;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  else
  {
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v12 = v13;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  long long v14 = v18;
  *unint64_t v18 = v10;
  v14[1] = v12;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t outlined destroy of KeyedDecodingContainer<UTTagClass._CodingKeys>?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTTagClass._CodingKeys>?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type UTTagClass and conformance UTTagClass()
{
  unint64_t result = lazy protocol witness table cache variable for type UTTagClass and conformance UTTagClass;
  if (!lazy protocol witness table cache variable for type UTTagClass and conformance UTTagClass)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTTagClass and conformance UTTagClass);
  }
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance UTTagClass@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return UTTagClass.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance UTTagClass(void *a1)
{
  return UTTagClass.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for UTTagClass(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for UTTagClass()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for UTTagClass(void *a1, void *a2)
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

void *assignWithTake for UTTagClass(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UTTagClass(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for UTTagClass(uint64_t result, int a2, int a3)
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

uint64_t getEnumTagSinglePayload for UTTagClass._CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for UTTagClass._CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2128108D0);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for UTTagClass._CodingKeys()
{
  return 0;
}

void *type metadata accessor for UTTagClass._CodingKeys()
{
  return &unk_26C3BAD98;
}

id static UTType._currentDevice.getter@<X0>(void *a1@<X8>)
{
  id result = [self typeOfCurrentDevice];
  if (result) {
    *a1 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

void UTType.init(_deviceModelCode:enclosureColor:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  if (*(unsigned __int8 *)(a3 + 4) == 255)
  {
    uint64_t v7 = (void *)MEMORY[0x216681FA0](a1, a2);
    swift_bridgeObjectRelease();
    id v8 = [self _typeWithDeviceModelCode:v7];
  }
  else
  {
    if ((((unint64_t)*(unsigned __int8 *)(a3 + 4) << 32) & 0x100000000) != 0) {
      uint64_t v9 = _UTHardwareColorMakeWithIndex();
    }
    else {
      uint64_t v9 = _UTHardwareColorMakeWithRGBComponents();
    }
    uint64_t v10 = v9;
    uint64_t v7 = (void *)MEMORY[0x216681FA0](a1, a2);
    swift_bridgeObjectRelease();
    id v8 = [self typeWithDeviceModelCode:v7 enclosureColor:v10];
  }
  id v11 = v8;

  *a4 = v11;
}

id UTType._preferredEnclosureColor.getter@<X0>(uint64_t a1@<X8>)
{
  return UTType._preferredEnclosureColor.getter((SEL *)&selRef__getPreferredEnclosureColor_, a1);
}

id UTType._enclosureColors.getter()
{
  id v1 = *v0;
  id v2 = [*v0 sel_tags];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v3 + 16) && (unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(v4, v5), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(*(void *)(v3 + 56) + 8 * v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void *)(v8 + 16);
    swift_bridgeObjectRelease();
    if (v9)
    {
      type metadata accessor for UTHardwareColor(0);
      id v10 = v1;
      uint64_t v11 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v11 + 16) = v9;
      goto LABEL_7;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v12 = v1;
  uint64_t v9 = 0;
  uint64_t v11 = MEMORY[0x263F8EE78];
LABEL_7:
  id result = [v1 getEnclosureColors:v11 + 32 count:v9];
  if (v9 < (uint64_t)result)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v11 + 16) = result;

    int64_t v14 = *(void *)(v11 + 16);
    if (v14)
    {
      uint64_t v24 = MEMORY[0x263F8EE78];
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14, 0);
      uint64_t v15 = 0;
      uint64_t v16 = v24;
      unint64_t v17 = *(void *)(v24 + 16);
      uint64_t v18 = 8 * v17;
      do
      {
        int v19 = *(unsigned __int8 *)(v11 + v15 + 32);
        if (v19 == 1) {
          int v20 = *(_DWORD *)(v11 + v15 + 36);
        }
        else {
          int v20 = *(_DWORD *)(v11 + v15 + 36) & 0xFFFFFF;
        }
        unint64_t v21 = *(void *)(v24 + 24);
        unint64_t v22 = v17 + 1;
        if (v17 >= v21 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v21 > 1), v17 + 1, 1);
        }
        *(void *)(v24 + 16) = v22;
        uint64_t v23 = v24 + v18 + v15;
        *(_DWORD *)(v23 + 32) = v20;
        *(unsigned char *)(v23 + 36) = v19 == 1;
        v15 += 8;
        unint64_t v17 = v22;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      return (id)MEMORY[0x263F8EE78];
    }
    return (id)v16;
  }
  return result;
}

id UTType._enclosureColor.getter@<X0>(uint64_t a1@<X8>)
{
  return UTType._preferredEnclosureColor.getter((SEL *)&selRef__getEnclosureColor_, a1);
}

id UTType._preferredEnclosureColor.getter@<X0>(SEL *a1@<X0>, uint64_t a2@<X8>)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v2;
  v7[0] = 0;
  id result = [v4 *a1:v7];
  if (result)
  {
    uint64_t v6 = HIDWORD(v7[0]) & 0xFFFFFF;
    if (LOBYTE(v7[0]) == 1) {
      uint64_t v6 = HIDWORD(v7[0]) | 0x100000000;
    }
  }
  else
  {
    uint64_t v6 = 0xFF00000000;
  }
  *(_DWORD *)a2 = v6;
  *(unsigned char *)(a2 + 4) = BYTE4(v6);
  return result;
}

void *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(void *a1, int64_t a2, char a3)
{
  id result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  id result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(UTTagClass, [String])>);
    id v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F8EE78];
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UTTagClass, [String]));
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UTHardwareColor>);
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
  int64_t v14 = a4 + 32;
  size_t v15 = 8 * v8;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_release();
  return v10;
}

id static UTType._blockSpecial.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DDE0];
  *a1 = *MEMORY[0x263F1DDE0];
  return v1;
}

id static UTType._characterSpecial.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DDE8];
  *a1 = *MEMORY[0x263F1DDE8];
  return v1;
}

id static UTType._namedPipeOrFIFO.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE58];
  *a1 = *MEMORY[0x263F1DE58];
  return v1;
}

id static UTType._socket.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE78];
  *a1 = *MEMORY[0x263F1DE78];
  return v1;
}

id static UTType._device.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DDF8];
  *a1 = *MEMORY[0x263F1DDF8];
  return v1;
}

id static UTType._computer.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DDF0];
  *a1 = *MEMORY[0x263F1DDF0];
  return v1;
}

id static UTType._genericPC.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE08];
  *a1 = *MEMORY[0x263F1DE08];
  return v1;
}

id static UTType._speaker.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE80];
  *a1 = *MEMORY[0x263F1DE80];
  return v1;
}

id static UTType._display.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE00];
  *a1 = *MEMORY[0x263F1DE00];
  return v1;
}

id static UTType._appleDevice.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DDB8];
  *a1 = *MEMORY[0x263F1DDB8];
  return v1;
}

id static UTType._mac.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE20];
  *a1 = *MEMORY[0x263F1DE20];
  return v1;
}

id static UTType._iMac.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE88];
  *a1 = *MEMORY[0x263F1DE88];
  return v1;
}

id static UTType._macPro.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE50];
  *a1 = *MEMORY[0x263F1DE50];
  return v1;
}

id static UTType._macMini.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE48];
  *a1 = *MEMORY[0x263F1DE48];
  return v1;
}

id static UTType._macLaptop.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE40];
  *a1 = *MEMORY[0x263F1DE40];
  return v1;
}

id static UTType._macBook.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE28];
  *a1 = *MEMORY[0x263F1DE28];
  return v1;
}

id static UTType._macBookAir.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE30];
  *a1 = *MEMORY[0x263F1DE30];
  return v1;
}

id static UTType._macBookPro.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE38];
  *a1 = *MEMORY[0x263F1DE38];
  return v1;
}

id static UTType._iOSDevice.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE90];
  *a1 = *MEMORY[0x263F1DE90];
  return v1;
}

id static UTType._iPhone.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DEA8];
  *a1 = *MEMORY[0x263F1DEA8];
  return v1;
}

id static UTType._iPad.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DEA0];
  *a1 = *MEMORY[0x263F1DEA0];
  return v1;
}

id static UTType._iPodTouch.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DEB0];
  *a1 = *MEMORY[0x263F1DEB0];
  return v1;
}

id static UTType._iOSSimulator.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE98];
  *a1 = *MEMORY[0x263F1DE98];
  return v1;
}

id static UTType._appleWatch.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DDD8];
  *a1 = *MEMORY[0x263F1DDD8];
  return v1;
}

id static UTType._appleTV.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DDC8];
  *a1 = *MEMORY[0x263F1DDC8];
  return v1;
}

id static UTType._homePod.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE18];
  *a1 = *MEMORY[0x263F1DE18];
  return v1;
}

id static UTType._appleVisionPro.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DDD0];
  *a1 = *MEMORY[0x263F1DDD0];
  return v1;
}

id static UTType._passBundle.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE60];
  *a1 = *MEMORY[0x263F1DE60];
  return v1;
}

id static UTType._passData.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE68];
  *a1 = *MEMORY[0x263F1DE68];
  return v1;
}

id static UTType._passesData.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE70];
  *a1 = *MEMORY[0x263F1DE70];
  return v1;
}

id static UTType._heifStandard.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DE10];
  *a1 = *MEMORY[0x263F1DE10];
  return v1;
}

id static UTType._appleEncryptedArchive.getter@<X0>(void *a1@<X8>)
{
  id v1 = (void *)*MEMORY[0x263F1DDC0];
  *a1 = *MEMORY[0x263F1DDC0];
  return v1;
}

char *static UTType._namedConstants_UTCoreTypesPriv.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UTType>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2128128C0;
  id v1 = (void *)*MEMORY[0x263F1DDE0];
  id v2 = (void *)*MEMORY[0x263F1DDE8];
  *(void *)(inited + 32) = *MEMORY[0x263F1DDE0];
  *(void *)(inited + 40) = v2;
  uint64_t v3 = (void *)*MEMORY[0x263F1DE58];
  uint64_t v4 = (void *)*MEMORY[0x263F1DE78];
  char v5 = (void **)MEMORY[0x263F1DDF8];
  *(void *)(inited + 48) = *MEMORY[0x263F1DE58];
  *(void *)(inited + 56) = v4;
  unint64_t v6 = *v5;
  int64_t v7 = (void *)*MEMORY[0x263F1DDF0];
  *(void *)(inited + 64) = *v5;
  *(void *)(inited + 72) = v7;
  uint64_t v8 = (void *)*MEMORY[0x263F1DE08];
  uint64_t v9 = (void *)*MEMORY[0x263F1DE80];
  *(void *)(inited + 80) = *MEMORY[0x263F1DE08];
  *(void *)(inited + 88) = v9;
  id v10 = (void *)*MEMORY[0x263F1DE00];
  int64_t v11 = (void *)*MEMORY[0x263F1DDB8];
  uint64_t v12 = (void **)MEMORY[0x263F1DE20];
  *(void *)(inited + 96) = *MEMORY[0x263F1DE00];
  *(void *)(inited + 104) = v11;
  v61 = *v12;
  v64 = (void *)*MEMORY[0x263F1DE88];
  uint64_t v13 = *MEMORY[0x263F1DE88];
  *(void *)(inited + 112) = v61;
  *(void *)(inited + 120) = v13;
  v62 = (void *)*MEMORY[0x263F1DE50];
  v65 = (void *)*MEMORY[0x263F1DE48];
  uint64_t v14 = *MEMORY[0x263F1DE48];
  *(void *)(inited + 128) = *MEMORY[0x263F1DE50];
  *(void *)(inited + 136) = v14;
  v63 = (void *)*MEMORY[0x263F1DE40];
  v66 = (void *)*MEMORY[0x263F1DE28];
  uint64_t v15 = *MEMORY[0x263F1DE28];
  uint64_t v16 = (void **)MEMORY[0x263F1DE30];
  *(void *)(inited + 144) = *MEMORY[0x263F1DE40];
  *(void *)(inited + 152) = v15;
  v67 = *v16;
  id v70 = (void *)*MEMORY[0x263F1DE38];
  uint64_t v17 = *MEMORY[0x263F1DE38];
  *(void *)(inited + 160) = v67;
  *(void *)(inited + 168) = v17;
  v68 = (void *)*MEMORY[0x263F1DE90];
  id v71 = (void *)*MEMORY[0x263F1DEA8];
  uint64_t v18 = *MEMORY[0x263F1DEA8];
  *(void *)(inited + 176) = *MEMORY[0x263F1DE90];
  *(void *)(inited + 184) = v18;
  v69 = (void *)*MEMORY[0x263F1DEA0];
  id v72 = (void *)*MEMORY[0x263F1DEB0];
  uint64_t v19 = *MEMORY[0x263F1DEB0];
  int v20 = (void **)MEMORY[0x263F1DE98];
  *(void *)(inited + 192) = *MEMORY[0x263F1DEA0];
  *(void *)(inited + 200) = v19;
  id v73 = *v20;
  id v76 = (void *)*MEMORY[0x263F1DDD8];
  uint64_t v21 = *MEMORY[0x263F1DDD8];
  *(void *)(inited + 208) = v73;
  *(void *)(inited + 216) = v21;
  id v74 = (void *)*MEMORY[0x263F1DDC8];
  id v77 = (void *)*MEMORY[0x263F1DE18];
  uint64_t v22 = *MEMORY[0x263F1DE18];
  *(void *)(inited + 224) = *MEMORY[0x263F1DDC8];
  *(void *)(inited + 232) = v22;
  id v75 = (void *)*MEMORY[0x263F1DE60];
  id v78 = (void *)*MEMORY[0x263F1DE68];
  uint64_t v23 = *MEMORY[0x263F1DE68];
  uint64_t v24 = (void **)MEMORY[0x263F1DE10];
  *(void *)(inited + 240) = *MEMORY[0x263F1DE60];
  *(void *)(inited + 248) = v23;
  id v79 = *v24;
  *(void *)(inited + 256) = *v24;
  id v80 = (void *)*MEMORY[0x263F1DE70];
  id v25 = v1;
  id v26 = v2;
  id v27 = v3;
  id v28 = v4;
  id v29 = v6;
  id v30 = v7;
  id v31 = v8;
  id v32 = v9;
  id v33 = v10;
  id v34 = v11;
  id v35 = v61;
  id v36 = v64;
  id v37 = v62;
  id v38 = v65;
  id v39 = v63;
  id v40 = v66;
  id v41 = v67;
  id v42 = v70;
  id v43 = v68;
  id v44 = v71;
  id v45 = v69;
  id v46 = v72;
  id v47 = v73;
  id v48 = v76;
  id v49 = v74;
  id v50 = v77;
  id v51 = v75;
  id v52 = v78;
  id v53 = v79;
  id v54 = v80;
  v55 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)1, 30, 1, (char *)inited);
  *((void *)v55 + 2) = 30;
  *((void *)v55 + 33) = v54;
  unint64_t v56 = *((void *)v55 + 3);
  id v57 = (id)*MEMORY[0x263F1DDC0];
  if (v56 <= 0x3D) {
    v55 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v56 > 1), 31, 1, v55);
  }
  *((void *)v55 + 2) = 31;
  *((void *)v55 + 34) = v57;
  unint64_t v58 = *((void *)v55 + 3);
  id v59 = (id)*MEMORY[0x263F1DDD0];
  if (v58 <= 0x3F) {
    v55 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v58 > 1), 32, 1, v55);
  }
  *((void *)v55 + 2) = 32;
  *((void *)v55 + 35) = v59;
  return v55;
}

uint64_t URLResourceValues.allValues.getter()
{
  return MEMORY[0x270EEEED8]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x270EEFA18]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
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

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = MEMORY[0x270F9D7D8]();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x270EF1C98]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t NSOrderedSet.makeIterator()()
{
  return MEMORY[0x270EF1E70]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x270FA1190]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)()
{
  return MEMORY[0x270F9EA70]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
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

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F290]();
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
  return MEMORY[0x270F9F330]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F448]();
}

{
  return MEMORY[0x270F9F470]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
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

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.codingPath.getter()
{
  return MEMORY[0x270F9FD78]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UTHardwareColorGetCurrentEnclosureColor()
{
  return MEMORY[0x270F063D0]();
}

uint64_t _UTHardwareColorMakeWithIndex()
{
  return MEMORY[0x270F063D8]();
}

uint64_t _UTHardwareColorMakeWithRGBComponents()
{
  return MEMORY[0x270F063E0]();
}

uint64_t _UTIdentifierGetHashCode()
{
  return MEMORY[0x270F063E8]();
}

uint64_t _UTIdentifiersAreEqual()
{
  return MEMORY[0x270F063F0]();
}

void bzero(void *a1, size_t a2)
{
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}