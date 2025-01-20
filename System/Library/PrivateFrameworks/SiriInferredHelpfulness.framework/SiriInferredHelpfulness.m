void *LoggingConstants.subsystem.unsafeMutableAddressor()
{
  return &static LoggingConstants.subsystem;
}

unint64_t static LoggingConstants.subsystem.getter()
{
  return 0xD000000000000011;
}

void one-time initialization function for category()
{
  static LoggingConstants.category = 0x746C7561666564;
  *(void *)algn_2685714D8 = 0xE700000000000000;
}

uint64_t *LoggingConstants.category.unsafeMutableAddressor()
{
  if (one-time initialization token for category != -1) {
    swift_once();
  }
  return &static LoggingConstants.category;
}

uint64_t static LoggingConstants.category.getter()
{
  if (one-time initialization token for category != -1) {
    swift_once();
  }
  uint64_t v0 = static LoggingConstants.category;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t one-time initialization function for defaultLogger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, defaultLogger);
  __swift_project_value_buffer(v0, (uint64_t)defaultLogger);
  if (one-time initialization token for category != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t defaultLogger.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)defaultLogger);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t one-time initialization function for signpostLogger()
{
  type metadata accessor for OS_os_log();
  if (one-time initialization token for category != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  signpostLogger = result;
  return result;
}

id signpostLogger.getter()
{
  if (one-time initialization token for signpostLogger != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)signpostLogger;
  return v0;
}

uint64_t OS_os_log.os_signpostSimpleInterval<A>(object:name:begin:end:closure:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, int a3@<W3>, uint64_t a4@<X4>, uint64_t (*a5)(uint64_t)@<X7>, uint64_t a6@<X8>, uint64_t a7, void (*a8)(uint64_t), uint64_t a9)
{
  v10 = v9;
  uint64_t v31 = a4;
  v32 = a5;
  v29 = a8;
  uint64_t v30 = a9;
  uint64_t v33 = type metadata accessor for OSSignpostID();
  uint64_t v15 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388]();
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_unknownObjectRetain();
    id v18 = v10;
    OSSignpostID.init(log:object:)();
  }
  else
  {
    id v19 = v10;
    OSSignpostID.init(log:)();
  }
  static os_signpost_type_t.begin.getter();
  uint64_t v20 = a2;
  uint64_t v21 = os_signpost(_:dso:log:name:signpostID:_:_:)();
  v29(v21);
  v22 = v32;
  if (v32)
  {
    swift_retain();
    static os_signpost_type_t.end.getter();
    LODWORD(v31) = a3;
    uint64_t v30 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_22D494D10;
    uint64_t v24 = v22(a6);
    uint64_t v26 = v25;
    *(void *)(v23 + 56) = MEMORY[0x263F8D310];
    *(void *)(v23 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(void *)(v23 + 32) = v24;
    *(void *)(v23 + 40) = v26;
    os_signpost(_:dso:log:name:signpostID:_:_:)();
    _sxSSRi_zRi0_zlyxIsegno_SglWOe((uint64_t)v22);
    swift_bridgeObjectRelease();
  }
  else
  {
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v33);
}

uint64_t OS_os_log.os_signpostSimpleInterval(object:name:begin:end:closure:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t), uint64_t a11)
{
  uint64_t v24 = a11;
  uint64_t v25 = a5;
  uint64_t v22 = a8;
  uint64_t v23 = a10;
  uint64_t v26 = type metadata accessor for OSSignpostID();
  uint64_t v13 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_unknownObjectRetain();
    id v16 = v11;
    OSSignpostID.init(log:object:)();
  }
  else
  {
    id v17 = v11;
    OSSignpostID.init(log:)();
  }
  static os_signpost_type_t.begin.getter();
  uint64_t v18 = os_signpost(_:dso:log:name:signpostID:_:_:)();
  v23(v18);
  if (a9)
  {
    swift_bridgeObjectRetain();
    static os_signpost_type_t.end.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_22D494D10;
    *(void *)(v19 + 56) = MEMORY[0x263F8D310];
    *(void *)(v19 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(void *)(v19 + 32) = v22;
    *(void *)(v19 + 40) = a9;
    os_signpost(_:dso:log:name:signpostID:_:_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v26);
}

char **IHSignpost.featureExtraction.unsafeMutableAddressor()
{
  return &static IHSignpost.featureExtraction;
}

const char *static IHSignpost.featureExtraction.getter()
{
  return "featureExtraction";
}

char **IHSignpost.inference.unsafeMutableAddressor()
{
  return &static IHSignpost.inference;
}

const char *static IHSignpost.inference.getter()
{
  return "inference";
}

id default argument 1 of static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F00D98]);
  return objc_msgSend(v0, sel_init);
}

id default argument 1 of InferredHelpfulnessClassifier.predictAll(using:options:)()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F00DC8]);
  return objc_msgSend(v0, sel_init);
}

id default argument 0 of static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  return v0;
}

uint64_t default argument 1 of static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t default argument 1 of static CATUtils.classAndUseCase(from:lowercased:)()
{
  return 1;
}

id default argument 0 of TrialProvider.init(client:enrollment:)()
{
  id v0 = objc_msgSend(self, sel_clientWithIdentifier_, 266);
  return v0;
}

double default argument 1 of TrialProvider.init(client:enrollment:)@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
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

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t _sxSSRi_zRi0_zlyxIsegno_SglWOe(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

ValueMetadata *type metadata accessor for LoggingConstants()
{
  return &type metadata for LoggingConstants;
}

ValueMetadata *type metadata accessor for IHSignpost()
{
  return &type metadata for IHSignpost;
}

void type metadata accessor for MLModelMetadataKey(uint64_t a1)
{
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SISchemaAnyEventType(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance MLModelMetadataKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance MLModelMetadataKey(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance MLModelMetadataKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MLModelMetadataKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MLModelMetadataKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance MLModelMetadataKey(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance MLModelMetadataKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance MLModelMetadataKey(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance MLModelMetadataKey(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance MLModelMetadataKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = MEMORY[0x230F80F90](v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SISchemaDismissalReason()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SISchemaDismissalReason()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SISchemaDismissalReason()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance MLModelMetadataKey()
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

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SISchemaDismissalReason(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance SISchemaDismissalReason@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance MLModelMetadataKey@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x230F80F90](*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance MLModelMetadataKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance MLModelMetadataKey(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, type metadata accessor for MLModelMetadataKey);
  uint64_t v3 = lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, type metadata accessor for MLModelMetadataKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t base witness table accessor for RawRepresentable in MLModelMetadataKey()
{
  return lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, type metadata accessor for MLModelMetadataKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in MLModelMetadataKey()
{
  return lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, type metadata accessor for MLModelMetadataKey);
}

uint64_t lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(unint64_t *a1, void (*a2)(uint64_t))
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

{
  uint64_t result;

  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in MLModelMetadataKey()
{
  return lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, type metadata accessor for MLModelMetadataKey);
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
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

void type metadata accessor for SISchemaDismissalReason(uint64_t a1)
{
}

void type metadata accessor for MLModelMetadataKey(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t base witness table accessor for Equatable in SISchemaDismissalReason()
{
  return lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type SISchemaDismissalReason and conformance SISchemaDismissalReason, type metadata accessor for SISchemaDismissalReason);
}

id Model.extractFeatureAndLog(input:featureName:)(void *a1, uint64_t a2, unint64_t a3)
{
  v6 = (void *)MEMORY[0x230F80F90](a2, a3);
  id v7 = objc_msgSend(a1, sel_featureValueForName_, v6);

  if (v7)
  {
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)defaultLogger);
    id v9 = v7;
    swift_bridgeObjectRetain_n();
    id v10 = v9;
    v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v22 = a2;
      uint64_t v14 = (void *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = v23;
      *(_DWORD *)uint64_t v13 = 138412546;
      id v15 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v14 = v7;

      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, a3, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22D468000, v11, v12, "Extracted value: %@ from feature %s", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v14, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v23, -1, -1);
      MEMORY[0x230F81A50](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)defaultLogger);
    swift_bridgeObjectRetain_n();
    id v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v24 = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22D468000, v17, v18, "Couldn't extract value for %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v20, -1, -1);
      MEMORY[0x230F81A50](v19, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  return v7;
}

uint64_t Model.predictAll(from:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22D494FE0;
  *(void *)(v0 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D38]), sel_init);
  specialized Array._endMutation()();
  return v0;
}

Swift::String __swiftcall MLFeatureProvider.debugDescription()()
{
  uint64_t v0 = (void *)0x800000022D496080;
  uint64_t v1 = 0xD000000000000032;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

id MLModel.predict(from:)(uint64_t a1)
{
  uint64_t v2 = v1;
  v12[1] = *(id *)MEMORY[0x263EF8340];
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)defaultLogger);
  char v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_22D468000, v5, v6, "Prediction requested", v7, 2u);
    MEMORY[0x230F81A50](v7, -1, -1);
  }

  v12[0] = 0;
  id v8 = objc_msgSend(v2, sel_predictionFromFeatures_error_, a1, v12);
  if (v8)
  {
    id v9 = v12[0];
  }
  else
  {
    id v10 = v12[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v8;
}

id MLModel.predictAll(from:)(uint64_t a1)
{
  uint64_t v2 = v1;
  v26[1] = *(id *)MEMORY[0x263EF8340];
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)defaultLogger);
  swift_bridgeObjectRetain_n();
  char v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    id v8 = (void *)swift_slowAlloc();
    v26[0] = v8;
    uint64_t v24 = v2;
    *(_DWORD *)id v7 = 136315138;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
    uint64_t v10 = MEMORY[0x230F810D0](a1, v9);
    uint64_t v25 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, (uint64_t *)v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D468000, v5, v6, "Predictions requested for input: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F81A50](v8, -1, -1);
    MEMORY[0x230F81A50](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v12 = objc_allocWithZone(MEMORY[0x263F00D10]);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithFeatureProviderArray_, isa);

  v26[0] = 0;
  id v15 = objc_msgSend(v2, sel_predictionsFromBatch_error_, v14, v26);

  id v16 = v26[0];
  if (v15)
  {
    v26[0] = (id)MEMORY[0x263F8EE78];
    id v17 = v16;
    unint64_t v18 = (unint64_t)objc_msgSend(v15, sel_count);
    if ((v18 & 0x8000000000000000) != 0) {
      __break(1u);
    }
    unint64_t v19 = v18;
    if (v18)
    {
      uint64_t v20 = 0;
      do
      {
        id v21 = objc_msgSend(v15, sel_featuresAtIndex_, v20, v24, v25);
        MEMORY[0x230F81080]();
        if (*(void *)(((unint64_t)v26[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)v26[0] & 0xFFFFFFFFFFFFFF8)
                                                                                               + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        ++v20;
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      while (v19 != v20);
      swift_unknownObjectRelease();
      return v26[0];
    }
    else
    {
      swift_unknownObjectRelease();
      return (id)MEMORY[0x263F8EE78];
    }
  }
  else
  {
    id v23 = v26[0];
    _convertNSErrorToError(_:)();

    return (id)swift_willThrow();
  }
}

id protocol witness for Model.predict(from:) in conformance MLModel(uint64_t a1)
{
  return MLModel.predict(from:)(a1);
}

id protocol witness for Model.predictAll(from:) in conformance MLModel(uint64_t a1)
{
  return MLModel.predictAll(from:)(a1);
}

uint64_t closure #1 in static ModelRunner.predictions(model:input:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a2, v5, v6);
  static os_log_type_t.debug.getter();
  if (one-time initialization token for signpostLogger != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_22D494D10;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
  uint64_t v10 = MEMORY[0x230F810D0](a2, v9);
  uint64_t v12 = v11;
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  *(void *)(v8 + 64) = lazy protocol witness table accessor for type String and conformance String();
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 40) = v12;
  os_log(_:dso:log:_:_:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v7;
  return result;
}

uint64_t static ModelRunner.prediction(model:input:)(void *a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22D494FE0;
  *(void *)(v4 + 32) = a2;
  uint64_t v8 = v4;
  specialized Array._endMutation()();
  swift_unknownObjectRetain();
  unint64_t v5 = specialized static ModelRunner.predictions(model:input:)(a1, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5) {
    return 0;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  if ((v5 & 0xC000000000000001) != 0)
  {
    uint64_t v7 = MEMORY[0x230F812A0](0, v5);
    goto LABEL_7;
  }
  if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v7 = *(void *)(v5 + 32);
    swift_unknownObjectRetain();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t ModelRunner.deinit()
{
  return v0;
}

uint64_t ModelRunner.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t ModelRunner.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ModelRunner.init()()
{
  return v0;
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

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:)(uint64_t (*a1)(void))
{
  return a1();
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

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
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
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
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

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
        return (uint64_t)v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
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
    return (void *)MEMORY[0x263F8EE78];
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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

uint64_t specialized static ModelRunner.predictions(model:input:)(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OSSignpostID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  int64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)defaultLogger);
  int64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    size_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)size_t v11 = 0;
    _os_log_impl(&dword_22D468000, v9, v10, "Predictions requested", v11, 2u);
    MEMORY[0x230F81A50](v11, -1, -1);
  }

  if (one-time initialization token for signpostLogger != -1) {
    swift_once();
  }
  id v12 = (id)signpostLogger;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  closure #1 in static ModelRunner.predictions(model:input:)(a1, a2, &v15);
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t dispatch thunk of Model.predict(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of Model.predictAll(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t type metadata accessor for ModelRunner()
{
  return self;
}

uint64_t method lookup function for ModelRunner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ModelRunner);
}

uint64_t dispatch thunk of ModelRunner.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type [MLFeatureProvider] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [MLFeatureProvider] and conformance [A];
  if (!lazy protocol witness table cache variable for type [MLFeatureProvider] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [MLFeatureProvider]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [MLFeatureProvider] and conformance [A]);
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

id static ORCHEvents.orchEvent(from:)()
{
  return specialized SISchemaAnyEvent.unwrappedPayload<A>(as:)();
}

id specialized SISchemaAnyEvent.unwrappedPayload<A>(as:)()
{
  if (objc_msgSend(v0, sel_anyEventType) == 6)
  {
    Class isa = (Class)objc_msgSend(v0, sel_payload);
    if (isa)
    {
      uint64_t v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v4 = v3;

      Class isa = Data._bridgeToObjectiveC()().super.isa;
      outlined consume of Data._Representation(v2, v4);
    }
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED88]), sel_initWithData_, isa);

    id v6 = objc_msgSend(v5, sel_event);
    if (!v6) {
      return 0;
    }
  }
  else
  {
    id v6 = v0;
  }
  id v8 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();

  return v8;
}

uint64_t static ORCHEvents.requestID(_:)@<X0>(uint64_t a1@<X8>)
{
  id v2 = specialized SISchemaAnyEvent.unwrappedPayload<A>(as:)();
  if (v2
    && (unint64_t v3 = v2, v4 = objc_msgSend(v2, sel_eventMetadata), v3, v4)
    && (id v5 = objc_msgSend(v4, sel_requestId), v4, v5))
  {
    SISchemaUUID.toNSUUID()();

    uint64_t v6 = type metadata accessor for UUID();
    int64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
    uint64_t v8 = v6;
    uint64_t v9 = a1;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = type metadata accessor for UUID();
    int64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v8 = v11;
    uint64_t v9 = a1;
    uint64_t v10 = 1;
  }
  return v7(v9, v10, 1, v8);
}

ValueMetadata *type metadata accessor for ORCHEvents()
{
  return &type metadata for ORCHEvents;
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

uint64_t Collection.filterByType<A>(as:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x270FA5388]();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16))(&v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], v4, a2);
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  Sequence.filter(_:)();
  swift_getAssociatedTypeWitness();
  uint64_t v10 = _arrayConditionalCast<A, B>(_:)();
  swift_bridgeObjectRelease();
  if (!v10) {
    return Array.init()();
  }
  return v10;
}

BOOL partial apply for closure #1 in Collection.filterByType<A>(as:)()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_getAssociatedTypeWitness();
  return swift_getDynamicType() == v1;
}

uint64_t Collection.featureValueByType<A, B>(as:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  Collection.filterByType<A>(as:)(a1, a2, a3, a4);
  type metadata accessor for Array();
  swift_getWitnessTable();
  Collection.first.getter();
  swift_bridgeObjectRelease();
  if (!v8) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a3 + *MEMORY[0x263F73ED0])
  }
                                                                            - 8)
                                                                + 56))(a5, 1, 1);
  swift_retain();
  dispatch thunk of TypedFeature.value.getter();
  return swift_release_n();
}

uint64_t SISchemaAnyEvent.unwrappedPayload<A>(as:)()
{
  if (objc_msgSend(v0, sel_anyEventType) == 6)
  {
    Class isa = (Class)objc_msgSend(v0, sel_payload);
    if (isa)
    {
      uint64_t v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v4 = v3;

      Class isa = Data._bridgeToObjectiveC()().super.isa;
      outlined consume of Data._Representation(v2, v4);
    }
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED88]), sel_initWithData_, isa);

    id v6 = objc_msgSend(v5, sel_event);
    if (!v6) {
      return 0;
    }
  }
  else
  {
    id v6 = v0;
  }
  uint64_t v8 = SISchemaAnyEvent.topLevelPayload<A>(as:)();

  return v8;
}

id SISchemaAnyEvent.unwrapOrderingLayer()()
{
  if (objc_msgSend(v0, sel_anyEventType) != 6) {
    return v0;
  }
  Class isa = (Class)objc_msgSend(v0, sel_payload);
  if (isa)
  {
    uint64_t v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v4 = v3;

    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v2, v4);
  }
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED88]), sel_initWithData_, isa);

  id v6 = objc_msgSend(v5, sel_event);
  return v6;
}

uint64_t SISchemaAnyEvent.topLevelPayload<A>(as:)()
{
  id v1 = SISchemaAnyEvent.unwrapOrderingLayer()();
  switch(objc_msgSend(v0, sel_anyEventType))
  {
    case 1u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v5 = v4;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v3, v5);
        }
      }
      else
      {
        Class isa = 0;
      }
      uint64_t v33 = (objc_class *)MEMORY[0x263F6ED20];
      goto LABEL_53;
    case 4u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v8 = v7;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v6, v8);
        }
      }
      else
      {
        Class isa = 0;
      }
      uint64_t v33 = (objc_class *)MEMORY[0x263F6E320];
      goto LABEL_53;
    case 6u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v11 = v10;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v9, v11);
        }
      }
      else
      {
        Class isa = 0;
      }
      uint64_t v33 = (objc_class *)MEMORY[0x263F6ED88];
      goto LABEL_53;
    case 7u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v14 = v13;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v12, v14);
        }
      }
      else
      {
        Class isa = 0;
      }
      uint64_t v33 = (objc_class *)MEMORY[0x263F6EDA8];
      goto LABEL_53;
    case 9u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v17 = v16;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v15, v17);
        }
      }
      else
      {
        Class isa = 0;
      }
      uint64_t v33 = (objc_class *)MEMORY[0x263F6EDB8];
      goto LABEL_53;
    case 0xDu:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v20 = v19;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v18, v20);
        }
      }
      else
      {
        Class isa = 0;
      }
      uint64_t v33 = (objc_class *)MEMORY[0x263F6DBF8];
      goto LABEL_53;
    case 0xEu:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v23 = v22;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v21, v23);
        }
      }
      else
      {
        Class isa = 0;
      }
      uint64_t v33 = (objc_class *)MEMORY[0x263F6DA00];
      goto LABEL_53;
    case 0x12u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v26 = v25;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v24, v26);
        }
      }
      else
      {
        Class isa = 0;
      }
      uint64_t v33 = (objc_class *)MEMORY[0x263F6E5F8];
      goto LABEL_53;
    case 0x13u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v29 = v28;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v27, v29);
        }
      }
      else
      {
        Class isa = 0;
      }
      uint64_t v33 = (objc_class *)MEMORY[0x263F6E888];
      goto LABEL_53;
    case 0x14u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v30 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v32 = v31;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v30, v32);
        }
      }
      else
      {
        Class isa = 0;
      }
      uint64_t v33 = (objc_class *)MEMORY[0x263F6D9A0];
LABEL_53:
      id v34 = objc_msgSend(objc_allocWithZone(v33), sel_initWithData_, isa);

      if (!v34) {
        return 0;
      }
      uint64_t result = swift_dynamicCastUnknownClass();
      if (!result)
      {

        return 0;
      }
      return result;
    default:

      return 0;
  }
}

uint64_t SELFFeatureExtracting.extract(from:)()
{
  return MEMORY[0x263F8EE78];
}

uint64_t SELFFeatureExtracting.deinit()
{
  return v0;
}

uint64_t SELFFeatureExtracting.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t SELFFeatureExtracting.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SELFFeatureExtracting.init()()
{
  return v0;
}

uint64_t protocol witness for FeatureExtracting.extract(from:) in conformance SELFFeatureExtracting(void *a1)
{
  return (*(uint64_t (**)(void))(**(void **)v1 + 80))(*a1);
}

uint64_t type metadata accessor for SELFFeatureExtracting()
{
  return self;
}

uint64_t method lookup function for SELFFeatureExtracting(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SELFFeatureExtracting);
}

uint64_t dispatch thunk of SELFFeatureExtracting.extract(from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 80))();
}

uint64_t dispatch thunk of SELFFeatureExtracting.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

id specialized SISchemaAnyEvent.topLevelPayload<A>(as:)()
{
  id v1 = SISchemaAnyEvent.unwrapOrderingLayer()();
  switch(objc_msgSend(v0, sel_anyEventType))
  {
    case 1u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v5 = v4;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v3, v5);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6ED20];
      goto LABEL_53;
    case 4u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v8 = v7;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v6, v8);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E320];
      goto LABEL_53;
    case 6u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v11 = v10;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v9, v11);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6ED88];
      goto LABEL_53;
    case 7u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v14 = v13;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v12, v14);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6EDA8];
      goto LABEL_53;
    case 9u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v17 = v16;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v15, v17);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6EDB8];
      goto LABEL_53;
    case 0xDu:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v20 = v19;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v18, v20);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6DBF8];
      goto LABEL_53;
    case 0xEu:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v23 = v22;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v21, v23);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6DA00];
      goto LABEL_53;
    case 0x12u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v26 = v25;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v24, v26);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E5F8];
      goto LABEL_53;
    case 0x13u:
      if (v1 && (id v27 = objc_msgSend(v1, sel_payload)) != 0)
      {
        unint64_t v28 = v27;
        uint64_t v29 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v31 = v30;

        v32.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v29, v31);
      }
      else
      {
        v32.super.Class isa = 0;
      }
      id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E888]), sel_initWithData_, v32.super.isa);

      return v36;
    case 0x14u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v35 = v34;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v33, v35);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6D9A0];
LABEL_53:
      id v38 = objc_msgSend(objc_allocWithZone(v37), sel_initWithData_, isa);

      if (v38) {
      break;
      }
    default:

      break;
  }
  return 0;
}

{
  void *v0;
  id v1;
  Class isa;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  NSData v35;
  id v36;
  objc_class *v37;
  id v38;

  id v1 = SISchemaAnyEvent.unwrapOrderingLayer()();
  switch(objc_msgSend(v0, sel_anyEventType))
  {
    case 1u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v5 = v4;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v3, v5);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6ED20];
      goto LABEL_53;
    case 4u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v8 = v7;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v6, v8);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E320];
      goto LABEL_53;
    case 6u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v11 = v10;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v9, v11);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6ED88];
      goto LABEL_53;
    case 7u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v14 = v13;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v12, v14);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6EDA8];
      goto LABEL_53;
    case 9u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v17 = v16;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v15, v17);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6EDB8];
      goto LABEL_53;
    case 0xDu:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v20 = v19;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v18, v20);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6DBF8];
      goto LABEL_53;
    case 0xEu:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v23 = v22;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v21, v23);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6DA00];
      goto LABEL_53;
    case 0x12u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v26 = v25;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v24, v26);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E5F8];
      goto LABEL_53;
    case 0x13u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          id v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v29 = v28;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v27, v29);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E888];
LABEL_53:
      id v38 = objc_msgSend(objc_allocWithZone(v37), sel_initWithData_, isa);

      if (v38) {
      return 0;
      }
    case 0x14u:
      if (v1 && (unint64_t v30 = objc_msgSend(v1, sel_payload)) != 0)
      {
        unint64_t v31 = v30;
        NSData v32 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v34 = v33;

        v35.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v32, v34);
      }
      else
      {
        v35.super.Class isa = 0;
      }
      id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6D9A0]), sel_initWithData_, v35.super.isa);

      return v36;
    default:

      return 0;
  }
}

{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSData v7;
  Class isa;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  objc_class *v37;
  id v38;

  id v1 = SISchemaAnyEvent.unwrapOrderingLayer()();
  switch(objc_msgSend(v0, sel_anyEventType))
  {
    case 1u:
      if (v1 && (uint64_t v2 = objc_msgSend(v1, sel_payload)) != 0)
      {
        uint64_t v3 = v2;
        unint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v6 = v5;

        v7.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v4, v6);
      }
      else
      {
        v7.super.Class isa = 0;
      }
      id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED20]), sel_initWithData_, v7.super.isa);

      return v36;
    case 4u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v11 = v10;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v9, v11);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E320];
      goto LABEL_53;
    case 6u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v14 = v13;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v12, v14);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6ED88];
      goto LABEL_53;
    case 7u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v17 = v16;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v15, v17);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6EDA8];
      goto LABEL_53;
    case 9u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v20 = v19;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v18, v20);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6EDB8];
      goto LABEL_53;
    case 0xDu:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v23 = v22;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v21, v23);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6DBF8];
      goto LABEL_53;
    case 0xEu:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v26 = v25;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v24, v26);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6DA00];
      goto LABEL_53;
    case 0x12u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          id v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v29 = v28;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v27, v29);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E5F8];
      goto LABEL_53;
    case 0x13u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          unint64_t v30 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          NSData v32 = v31;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v30, v32);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E888];
      goto LABEL_53;
    case 0x14u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v35 = v34;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v33, v35);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6D9A0];
LABEL_53:
      id v38 = objc_msgSend(objc_allocWithZone(v37), sel_initWithData_, isa);

      if (v38) {
      break;
      }
    default:

      break;
  }
  return 0;
}

{
  void *v0;
  id v1;
  Class isa;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  NSData v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  objc_class *v37;
  id v38;

  id v1 = SISchemaAnyEvent.unwrapOrderingLayer()();
  switch(objc_msgSend(v0, sel_anyEventType))
  {
    case 1u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v5 = v4;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v3, v5);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6ED20];
      goto LABEL_53;
    case 4u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v8 = v7;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v6, v8);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E320];
      goto LABEL_53;
    case 6u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v11 = v10;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v9, v11);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6ED88];
      goto LABEL_53;
    case 7u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v14 = v13;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v12, v14);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6EDA8];
      goto LABEL_53;
    case 9u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v17 = v16;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v15, v17);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6EDB8];
      goto LABEL_53;
    case 0xDu:
      if (v1 && (uint64_t v18 = objc_msgSend(v1, sel_payload)) != 0)
      {
        unint64_t v19 = v18;
        unint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v22 = v21;

        v23.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v20, v22);
      }
      else
      {
        v23.super.Class isa = 0;
      }
      id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DBF8]), sel_initWithData_, v23.super.isa);

      return v36;
    case 0xEu:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v26 = v25;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v24, v26);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6DA00];
      goto LABEL_53;
    case 0x12u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          id v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v29 = v28;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v27, v29);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E5F8];
      goto LABEL_53;
    case 0x13u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          unint64_t v30 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          NSData v32 = v31;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v30, v32);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6E888];
      goto LABEL_53;
    case 0x14u:
      if (v1)
      {
        Class isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          uint64_t v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v35 = v34;

          Class isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v33, v35);
        }
      }
      else
      {
        Class isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x263F6D9A0];
LABEL_53:
      id v38 = objc_msgSend(objc_allocWithZone(v37), sel_initWithData_, isa);

      if (v38) {
      break;
      }
    default:

      break;
  }
  return 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FlowTaskStep(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

void *static FlowClientFeatureExtractor.currentTaskName(_:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_flowState);
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = objc_msgSend(v1, sel_currentTaskName);

    if (v3)
    {
      uint64_t v2 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

unint64_t static FlowClientFeatureExtractor.flowStateType(_:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_flowState);
  uint64_t v2 = v1;
  if (v1)
  {
    unsigned int v3 = objc_msgSend(v1, sel_flowStateType);

    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t static FlowClientFeatureExtractor.flowStatusReason(_:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_flowState);
  if (v1
    && (uint64_t v2 = v1, v3 = objc_msgSend(v1, sel_flowStateReason), v2, v3))
  {
    unsigned int v4 = objc_msgSend(v3, sel_statusReason);

    unsigned __int8 v5 = 0;
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = 0;
    unsigned __int8 v5 = 1;
  }
  return v6 | ((unint64_t)v5 << 32);
}

uint64_t FlowClientFeatureExtractor.extract(from:)(unint64_t a1)
{
  uint64_t v119 = type metadata accessor for Confidence();
  uint64_t v116 = *(void *)(v119 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v118 = (char *)&v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v117 = (char *)&v114 - v8;
  uint64_t v126 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
    {
LABEL_3:
      if (v9 >= 1)
      {
        uint64_t v10 = 0;
        unint64_t v122 = a1 & 0xC000000000000001;
        unint64_t v11 = (void *)MEMORY[0x263F8EE78];
        uint64_t v12 = (SEL *)&unk_2649AE000;
        v120 = (void (*)(char *, char *, uint64_t))v9;
        v121 = (void (*)(char *, void, uint64_t))a1;
        while (1)
        {
          id v14 = v122 ? (id)MEMORY[0x230F812A0](v10, a1) : *(id *)(a1 + 8 * v10 + 32);
          uint64_t v15 = v14;
          id v16 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
          id v13 = objc_msgSend(v16, sel_flowStep);

          if (v13) {
            break;
          }
          id v13 = v15;
LABEL_6:
          ++v10;

          if (v9 == v10) {
            goto LABEL_41;
          }
        }
        id v123 = objc_msgSend(v13, sel_timestampMs);
        id v17 = [v13 v12[92]];
        uint64_t v18 = v17;
        if (v17)
        {
          id v19 = objc_msgSend(v17, sel_currentTaskName);

          if (v19)
          {
            uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v18 = v21;
          }
          else
          {
            uint64_t v20 = 0;
            uint64_t v18 = 0;
          }
        }
        else
        {
          uint64_t v20 = 0;
        }
        id v22 = [v13 v12[92]];
        if (v22)
        {
          unint64_t v23 = v22;
          unsigned int v24 = objc_msgSend(v22, sel_flowStateType);
        }
        else
        {
          unsigned int v24 = -1;
        }
        unint64_t v25 = v12;
        id v26 = [v13 v12[92]];
        if (v26
          && (id v27 = v26,
              id v28 = objc_msgSend(v26, sel_flowStateReason),
              v27,
              v28))
        {
          unsigned int v29 = objc_msgSend(v28, sel_statusReason);

          if (v18) {
            uint64_t v30 = v20;
          }
          else {
            uint64_t v30 = 0;
          }
          if (v18) {
            unint64_t v31 = (unint64_t)v18;
          }
          else {
            unint64_t v31 = 0xE000000000000000;
          }
          if (swift_isUniquelyReferenced_nonNull_native()) {
            goto LABEL_36;
          }
        }
        else
        {
          if (v18) {
            uint64_t v30 = v20;
          }
          else {
            uint64_t v30 = 0;
          }
          if (v18) {
            unint64_t v31 = (unint64_t)v18;
          }
          else {
            unint64_t v31 = 0xE000000000000000;
          }
          unsigned int v29 = -1;
          if (swift_isUniquelyReferenced_nonNull_native()) {
            goto LABEL_36;
          }
        }
        unint64_t v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v11[2] + 1, 1, v11);
LABEL_36:
        NSData v32 = v11;
        unint64_t v33 = v11[2];
        unint64_t v34 = v32;
        unint64_t v35 = v32[3];
        if (v33 >= v35 >> 1) {
          unint64_t v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v35 > 1), v33 + 1, 1, v34);
        }
        v34[2] = v33 + 1;
        id v36 = &v34[4 * v33];
        unint64_t v11 = v34;
        v36[4] = v123;
        v36[5] = v30;
        v36[6] = v31;
        *((_DWORD *)v36 + 14) = v24;
        *((_DWORD *)v36 + 15) = v29;

        uint64_t v9 = (uint64_t)v120;
        a1 = (unint64_t)v121;
        uint64_t v12 = v25;
        goto LABEL_6;
      }
      __break(1u);
LABEL_86:
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      goto LABEL_68;
    }
  }
  unint64_t v11 = (void *)MEMORY[0x263F8EE78];
LABEL_41:
  swift_bridgeObjectRelease();
  v124 = v11;
  swift_bridgeObjectRetain_n();
  specialized MutableCollection<>.sort(by:)((uint64_t *)&v124);
  id v123 = v11;
  swift_bridgeObjectRelease();
  uint64_t v37 = (uint64_t)v124;
  uint64_t v38 = v124[2];
  if (v38)
  {
    swift_retain();
    v39 = (uint64_t *)(v37 + 48);
    a1 = MEMORY[0x263F8EE78];
    uint64_t v40 = v38;
    do
    {
      uint64_t v42 = *(v39 - 1);
      uint64_t v41 = *v39;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        a1 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16) + 1, 1, (void *)a1);
      }
      unint64_t v44 = *(void *)(a1 + 16);
      unint64_t v43 = *(void *)(a1 + 24);
      if (v44 >= v43 >> 1) {
        a1 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v43 > 1), v44 + 1, 1, (void *)a1);
      }
      *(void *)(a1 + 16) = v44 + 1;
      unint64_t v45 = a1 + 16 * v44;
      *(void *)(v45 + 32) = v42;
      *(void *)(v45 + 40) = v41;
      v39 += 4;
      --v40;
    }
    while (v40);
    swift_release();
    swift_retain();
    uint64_t v2 = (void *)MEMORY[0x263F8EE78];
    unint64_t v122 = v37;
    v46 = (unsigned int *)(v37 + 56);
    uint64_t v47 = v38;
    do
    {
      unsigned int v48 = *v46;
      swift_bridgeObjectRetain();
      v49 = @"FLOWSTATETYPE_UNKNOWN";
      v50 = @"FLOWSTATETYPE_UNKNOWN";
      if (v48 <= 0xD0)
      {
        uint64_t v51 = (int)v48;
        v49 = off_2649ACC20[v51];
        v50 = off_2649AD2A8[v51];
      }
      v52 = v49;
      v53 = v50;
      uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v56 = v55;
      swift_bridgeObjectRelease();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1, v2);
      }
      unint64_t v58 = v2[2];
      unint64_t v57 = v2[3];
      if (v58 >= v57 >> 1) {
        uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v57 > 1), v58 + 1, 1, v2);
      }
      v46 += 8;
      v2[2] = v58 + 1;
      v59 = &v2[2 * v58];
      v59[4] = v54;
      v59[5] = v56;
      --v47;
    }
    while (v47);
    unint64_t v60 = v122;
    swift_release();
    swift_retain();
    v61 = (unsigned int *)(v60 + 60);
    id v1 = (void *)MEMORY[0x263F8EE78];
    do
    {
      unsigned int v62 = *v61;
      swift_bridgeObjectRetain();
      v63 = @"FLOWSTATUSREASON_UNKNOWN";
      v64 = @"FLOWSTATUSREASON_UNKNOWN";
      if (v62 <= 0x62)
      {
        uint64_t v65 = (int)v62;
        v63 = off_2649AD930[v65];
        v64 = off_2649ADC48[v65];
      }
      v66 = v63;
      v67 = v64;
      uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v70 = v69;
      swift_bridgeObjectRelease();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v1 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1[2] + 1, 1, v1);
      }
      unint64_t v72 = v1[2];
      unint64_t v71 = v1[3];
      if (v72 >= v71 >> 1) {
        id v1 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v71 > 1), v72 + 1, 1, v1);
      }
      v61 += 8;
      v1[2] = v72 + 1;
      v73 = &v1[2 * v72];
      v73[4] = v68;
      v73[5] = v70;
      --v38;
    }
    while (v38);
    swift_release();
  }
  else
  {
    id v1 = (void *)MEMORY[0x263F8EE78];
    uint64_t v2 = (void *)MEMORY[0x263F8EE78];
    a1 = MEMORY[0x263F8EE78];
  }
  swift_release();
  uint64_t v9 = v2[2];
  v74 = (_DWORD *)MEMORY[0x263F73EB0];
  if (!v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void *)(a1 + 16);
    if (v9) {
      goto LABEL_71;
    }
    goto LABEL_82;
  }
  uint64_t v76 = v116;
  v75 = v117;
  v77 = *(void (**)(char *, char *, uint64_t))(v116 + 104);
  LODWORD(v121) = *MEMORY[0x263F73EB0];
  uint64_t v78 = v119;
  unint64_t v122 = v116 + 104;
  v120 = v77;
  ((void (*)(char *))v77)(v117);
  type metadata accessor for FlowStateTypeSequence(0);
  swift_allocObject();
  v124 = v2;
  v115 = *(void (**)(char *, char *, uint64_t))(v76 + 16);
  v115(v118, v75, v78);
  swift_bridgeObjectRetain();
  TypedFeature.init(value:confidence:)();
  v79 = *(uint64_t (**)(char *, uint64_t))(v76 + 8);
  unsigned int v4 = (uint64_t (*)(char *, uint64_t))(v76 + 8);
  v80 = v75;
  id v3 = v79;
  uint64_t v81 = v79(v80, v78);
  MEMORY[0x230F81080](v81);
  if (*(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_86;
  }
LABEL_68:
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  if ((unint64_t)v9 > v2[2])
  {
    __break(1u);
    goto LABEL_88;
  }
  v82 = &v2[2 * v9];
  uint64_t v84 = v82[2];
  uint64_t v83 = v82[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v85 = v117;
  uint64_t v86 = v119;
  v120(v117, (char *)v121, v119);
  type metadata accessor for FinalFlowStateType(0);
  swift_allocObject();
  v124 = (void *)v84;
  uint64_t v125 = v83;
  v115(v118, v85, v86);
  TypedFeature.init(value:confidence:)();
  uint64_t v87 = v3(v85, v86);
  MEMORY[0x230F81080](v87);
  if (*(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_90;
  }
  while (1)
  {
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    v74 = (_DWORD *)MEMORY[0x263F73EB0];
    uint64_t v9 = *(void *)(a1 + 16);
    if (!v9) {
      break;
    }
LABEL_71:
    uint64_t v88 = v116;
    v89 = v117;
    v90 = *(void (**)(void))(v116 + 104);
    LODWORD(v122) = *v74;
    uint64_t v91 = v119;
    v121 = (void (*)(char *, void, uint64_t))v90;
    v90(v117);
    type metadata accessor for FlowTaskNameSequence(0);
    swift_allocObject();
    v124 = (void *)a1;
    v120 = *(void (**)(char *, char *, uint64_t))(v88 + 16);
    v120(v118, v89, v91);
    swift_bridgeObjectRetain();
    TypedFeature.init(value:confidence:)();
    v92 = v89;
    unsigned int v4 = *(uint64_t (**)(char *, uint64_t))(v88 + 8);
    uint64_t v93 = v4(v92, v91);
    MEMORY[0x230F81080](v93);
    if (*(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_88:
    }
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    if ((unint64_t)v9 <= *(void *)(a1 + 16))
    {
      unint64_t v94 = a1 + 16 * v9;
      uint64_t v96 = *(void *)(v94 + 16);
      uint64_t v95 = *(void *)(v94 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v97 = v117;
      uint64_t v98 = v119;
      v121(v117, v122, v119);
      type metadata accessor for FinalFlowTaskName(0);
      swift_allocObject();
      v124 = (void *)v96;
      uint64_t v125 = v95;
      v120(v118, v97, v98);
      TypedFeature.init(value:confidence:)();
      uint64_t v99 = v4(v97, v98);
      MEMORY[0x230F81080](v99);
      if (*(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_92;
      }
      while (1)
      {
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        v74 = (_DWORD *)MEMORY[0x263F73EB0];
        unint64_t v100 = v1[2];
        if (!v100) {
          break;
        }
LABEL_75:
        uint64_t v102 = v116;
        v101 = v117;
        v103 = *(void (**)(void))(v116 + 104);
        LODWORD(v122) = *v74;
        uint64_t v104 = v119;
        v121 = (void (*)(char *, void, uint64_t))v103;
        v103(v117);
        type metadata accessor for FlowStatusReasonSequence(0);
        swift_allocObject();
        v124 = v1;
        v120 = *(void (**)(char *, char *, uint64_t))(v102 + 16);
        v120(v118, v101, v104);
        swift_bridgeObjectRetain();
        TypedFeature.init(value:confidence:)();
        v105 = *(uint64_t (**)(char *, uint64_t))(v102 + 8);
        uint64_t v116 = v102 + 8;
        uint64_t v106 = v105(v101, v104);
        MEMORY[0x230F81080](v106);
        if (*(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        if (v100 <= v1[2])
        {
          v107 = &v1[2 * v100];
          uint64_t v109 = v107[2];
          uint64_t v108 = v107[3];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v110 = v117;
          uint64_t v111 = v119;
          v121(v117, v122, v119);
          type metadata accessor for FinalFlowStatusReason(0);
          swift_allocObject();
          v124 = (void *)v109;
          uint64_t v125 = v108;
          v120(v118, v110, v111);
          TypedFeature.init(value:confidence:)();
          uint64_t v112 = v105(v110, v111);
          MEMORY[0x230F81080](v112);
          if (*(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          return v126;
        }
        __break(1u);
LABEL_92:
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      goto LABEL_83;
    }
    __break(1u);
LABEL_90:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
LABEL_82:
  swift_bridgeObjectRelease();
  unint64_t v100 = v1[2];
  if (v100) {
    goto LABEL_75;
  }
LABEL_83:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v126;
}

uint64_t FlowStateTypeSequence.__allocating_init(value:confidence:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Confidence();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  v10[1] = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v8 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v8;
}

uint64_t FinalFlowStateType.__allocating_init(value:confidence:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  v12[0] = a1;
  v12[1] = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
  uint64_t v10 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a3, v6);
  return v10;
}

uint64_t FlowClientFeatureExtractor.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t FlowClientFeatureExtractor.init()()
{
  return v0;
}

uint64_t FlowClientFeatureExtractor.deinit()
{
  return v0;
}

uint64_t FlowClientFeatureExtractor.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStateTypeSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStateTypeSequence.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for FlowStateTypeSequence);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowTaskNameSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStateTypeSequence.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for FlowTaskNameSequence);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStateTypeSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  a3(0);
  swift_allocObject();
  v13[1] = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t v11 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v11;
}

uint64_t FlowStateTypeSequence.init(value:confidence:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Confidence();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v9[1] = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  uint64_t v7 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v7;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStatusReasonSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStateTypeSequence.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for FlowStatusReasonSequence);
}

uint64_t FinalFlowTaskName.__deallocating_deinit()
{
  uint64_t v0 = TypedFeature.deinit();
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for FinalFlowTaskName);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowStateType.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for FinalFlowStateType);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  uint64_t v10 = a1[1];
  a3(0);
  swift_allocObject();
  v14[0] = v11;
  v14[1] = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t v12 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v12;
}

uint64_t FinalFlowTaskName.init(value:confidence:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v11[0] = a1;
  v11[1] = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  uint64_t v9 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a3, v6);
  return v9;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowStatusReason.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for FinalFlowStatusReason);
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<FlowTaskStep>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Double?>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<GradedInteraction>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 6);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[Int]>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UUID>);
  uint64_t v10 = *(void *)(type metadata accessor for UUID() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

Swift::Int specialized MutableCollection<>.sort(by:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(v5);
  *a1 = v2;
  return result;
}

uint64_t type metadata accessor for FlowStateTypeSequence(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FlowStateTypeSequence);
}

uint64_t type metadata accessor for FinalFlowStateType(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FinalFlowStateType);
}

uint64_t type metadata accessor for FlowTaskNameSequence(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FlowTaskNameSequence);
}

uint64_t type metadata accessor for FinalFlowTaskName(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FinalFlowTaskName);
}

uint64_t type metadata accessor for FlowStatusReasonSequence(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FlowStatusReasonSequence);
}

uint64_t type metadata accessor for FinalFlowStatusReason(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FinalFlowStatusReason);
}

uint64_t type metadata accessor for FlowStateTypeSequence(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for FlowClientFeatureExtractor()
{
  return self;
}

uint64_t type metadata completion function for FlowStateTypeSequence()
{
  return type metadata completion function for FlowStateTypeSequence();
}

{
  return swift_initClassMetadata2();
}

uint64_t ObjC metadata update function for FlowStateTypeSequence()
{
  return type metadata accessor for FlowStateTypeSequence(0);
}

uint64_t type metadata completion function for FlowTaskNameSequence()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for FlowTaskNameSequence()
{
  return type metadata accessor for FlowTaskNameSequence(0);
}

uint64_t type metadata completion function for FlowStatusReasonSequence()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for FlowStatusReasonSequence()
{
  return type metadata accessor for FlowStatusReasonSequence(0);
}

uint64_t type metadata completion function for FinalFlowTaskName()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for FinalFlowTaskName()
{
  return type metadata accessor for FinalFlowTaskName(0);
}

uint64_t type metadata completion function for FinalFlowStateType()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for FinalFlowStateType()
{
  return type metadata accessor for FinalFlowStateType(0);
}

uint64_t type metadata completion function for FinalFlowStatusReason()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for FinalFlowStatusReason()
{
  return type metadata accessor for FinalFlowStatusReason(0);
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v92 = 0;
      uint64_t v93 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v95 = *(void *)(v93 + 32 * i);
        uint64_t v96 = v92;
        do
        {
          v97 = (_OWORD *)(v93 + v96);
          if (v95 >= *(void *)(v93 + v96)) {
            break;
          }
          if (!v93) {
            goto LABEL_140;
          }
          uint64_t v98 = (void *)(v93 + v96);
          uint64_t v99 = *(void *)(v93 + v96 + 40);
          uint64_t v100 = *(void *)(v93 + v96 + 48);
          uint64_t v101 = *(void *)(v93 + v96 + 56);
          long long v102 = v97[1];
          *(_OWORD *)(v93 + v96 + 32) = *v97;
          *(_OWORD *)(v93 + v96 + 48) = v102;
          *uint64_t v98 = v95;
          v98[1] = v99;
          v98[2] = v100;
          v98[3] = v101;
          v96 -= 32;
        }
        while (v96 != -32);
        v92 += 32;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_145;
  }
  Swift::Int v6 = result;
  uint64_t v112 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      unint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      v103 = v12;
      uint64_t v114 = v9;
      if (v13 >= 2)
      {
        uint64_t v104 = *v112;
        do
        {
          unint64_t v105 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v104) {
            goto LABEL_144;
          }
          uint64_t v106 = v103;
          uint64_t v107 = *(void *)&v103[16 * v105 + 32];
          uint64_t v108 = *(void *)&v103[16 * v13 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v104 + 32 * v107), (char *)(v104 + 32 * *(void *)&v103[16 * v13 + 16]), v104 + 32 * v108, __dst);
          if (v1) {
            break;
          }
          if (v108 < v107) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v106 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v106);
          }
          if (v105 >= *((void *)v106 + 2)) {
            goto LABEL_133;
          }
          uint64_t v109 = &v106[16 * v105 + 32];
          *(void *)uint64_t v109 = v107;
          *((void *)v109 + 1) = v108;
          unint64_t v110 = *((void *)v106 + 2);
          if (v13 > v110) {
            goto LABEL_134;
          }
          memmove(&v106[16 * v13 + 16], &v106[16 * v13 + 32], 16 * (v110 - v13));
          v103 = v106;
          *((void *)v106 + 2) = v110 - 1;
          unint64_t v13 = v110 - 1;
        }
        while (v110 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(void *)(v114 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v114 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v8 + 16) = v7;
    uint64_t v114 = v8;
    __dst = (char *)(v8 + 32);
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v113 = *a1 + 64;
  uint64_t v111 = *a1 + 24;
  unint64_t v12 = (char *)MEMORY[0x263F8EE78];
  Swift::Int v115 = v6;
  Swift::Int v116 = v3;
  uint64_t v117 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 32 * v10);
      uint64_t v16 = 32 * v14;
      uint64_t v17 = *(void *)(v11 + 32 * v14);
      Swift::Int v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        unint64_t v18 = (uint64_t *)(v113 + 32 * v14);
        uint64_t v19 = v15;
        while (1)
        {
          uint64_t v21 = *v18;
          v18 += 4;
          uint64_t v20 = v21;
          if (v15 < v17 == v21 >= v19) {
            break;
          }
          ++v10;
          uint64_t v19 = v20;
          if (v3 == v10)
          {
            Swift::Int v10 = v3;
            break;
          }
        }
      }
      if (v15 < v17)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v22 = 32 * v10;
          Swift::Int v23 = v10;
          Swift::Int v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11) {
                goto LABEL_143;
              }
              unint64_t v25 = (_OWORD *)(v11 + v16);
              uint64_t v26 = v11 + v22;
              uint64_t v27 = *(void *)(v11 + v16 + 16);
              uint64_t v28 = *(void *)(v11 + v16 + 24);
              long long v29 = *(_OWORD *)(v11 + v16);
              long long v30 = *(_OWORD *)(v11 + v22 - 16);
              *unint64_t v25 = *(_OWORD *)(v11 + v22 - 32);
              v25[1] = v30;
              *(_OWORD *)(v26 - 32) = v29;
              *(void *)(v26 - 16) = v27;
              *(void *)(v26 - 8) = v28;
            }
            ++v24;
            v22 -= 32;
            v16 += 32;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    Swift::Int v31 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v31 >= v3) {
      Swift::Int v31 = v3;
    }
    if (v31 < v14) {
      break;
    }
    if (v10 != v31)
    {
      NSData v32 = (void *)(v111 + 32 * v10);
      do
      {
        uint64_t v33 = *(void *)(v11 + 32 * v10);
        Swift::Int v34 = v14;
        unint64_t v35 = v32;
        do
        {
          if (v33 >= *(v35 - 7)) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          id v36 = v35 - 3;
          long long v38 = *(_OWORD *)(v35 - 7);
          long long v37 = *(_OWORD *)(v35 - 5);
          *(v35 - 4) = *v35;
          v35 -= 4;
          uint64_t v39 = v35[2];
          uint64_t v40 = v35[3];
          *id v36 = v38;
          v36[1] = v37;
          *(v35 - 3) = v33;
          *(v35 - 2) = v39;
          *(v35 - 1) = v40;
          ++v34;
        }
        while (v10 != v34);
        ++v10;
        v32 += 4;
      }
      while (v10 != v31);
      Swift::Int v10 = v31;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v42 = *((void *)v12 + 2);
    unint64_t v41 = *((void *)v12 + 3);
    unint64_t v13 = v42 + 1;
    uint64_t v11 = v117;
    if (v42 >= v41 >> 1)
    {
      uint64_t v91 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v41 > 1), v42 + 1, 1, v12);
      uint64_t v11 = v117;
      unint64_t v12 = v91;
    }
    *((void *)v12 + 2) = v13;
    unint64_t v43 = v12 + 32;
    unint64_t v44 = &v12[16 * v42 + 32];
    *(void *)unint64_t v44 = v14;
    *((void *)v44 + 1) = v10;
    if (v42)
    {
      while (1)
      {
        unint64_t v45 = v13 - 1;
        if (v13 >= 4)
        {
          v50 = &v43[16 * v13];
          uint64_t v51 = *((void *)v50 - 8);
          uint64_t v52 = *((void *)v50 - 7);
          BOOL v56 = __OFSUB__(v52, v51);
          uint64_t v53 = v52 - v51;
          if (v56) {
            goto LABEL_119;
          }
          uint64_t v55 = *((void *)v50 - 6);
          uint64_t v54 = *((void *)v50 - 5);
          BOOL v56 = __OFSUB__(v54, v55);
          uint64_t v48 = v54 - v55;
          char v49 = v56;
          if (v56) {
            goto LABEL_120;
          }
          unint64_t v57 = v13 - 2;
          unint64_t v58 = &v43[16 * v13 - 32];
          uint64_t v60 = *(void *)v58;
          uint64_t v59 = *((void *)v58 + 1);
          BOOL v56 = __OFSUB__(v59, v60);
          uint64_t v61 = v59 - v60;
          if (v56) {
            goto LABEL_122;
          }
          BOOL v56 = __OFADD__(v48, v61);
          uint64_t v62 = v48 + v61;
          if (v56) {
            goto LABEL_125;
          }
          if (v62 >= v53)
          {
            v80 = &v43[16 * v45];
            uint64_t v82 = *(void *)v80;
            uint64_t v81 = *((void *)v80 + 1);
            BOOL v56 = __OFSUB__(v81, v82);
            uint64_t v83 = v81 - v82;
            if (v56) {
              goto LABEL_129;
            }
            BOOL v73 = v48 < v83;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v74 = *((void *)v12 + 4);
            uint64_t v75 = *((void *)v12 + 5);
            BOOL v56 = __OFSUB__(v75, v74);
            uint64_t v67 = v75 - v74;
            char v68 = v56;
            goto LABEL_77;
          }
          uint64_t v47 = *((void *)v12 + 4);
          uint64_t v46 = *((void *)v12 + 5);
          BOOL v56 = __OFSUB__(v46, v47);
          uint64_t v48 = v46 - v47;
          char v49 = v56;
        }
        if (v49) {
          goto LABEL_121;
        }
        unint64_t v57 = v13 - 2;
        v63 = &v43[16 * v13 - 32];
        uint64_t v65 = *(void *)v63;
        uint64_t v64 = *((void *)v63 + 1);
        BOOL v66 = __OFSUB__(v64, v65);
        uint64_t v67 = v64 - v65;
        char v68 = v66;
        if (v66) {
          goto LABEL_124;
        }
        uint64_t v69 = &v43[16 * v45];
        uint64_t v71 = *(void *)v69;
        uint64_t v70 = *((void *)v69 + 1);
        BOOL v56 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v56) {
          goto LABEL_127;
        }
        if (__OFADD__(v67, v72)) {
          goto LABEL_128;
        }
        if (v67 + v72 >= v48)
        {
          BOOL v73 = v48 < v72;
LABEL_83:
          if (v73) {
            unint64_t v45 = v57;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v68) {
          goto LABEL_123;
        }
        uint64_t v76 = &v43[16 * v45];
        uint64_t v78 = *(void *)v76;
        uint64_t v77 = *((void *)v76 + 1);
        BOOL v56 = __OFSUB__(v77, v78);
        uint64_t v79 = v77 - v78;
        if (v56) {
          goto LABEL_126;
        }
        if (v79 < v67) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v84 = v45 - 1;
        if (v45 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
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
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_142;
        }
        v85 = v12;
        uint64_t v86 = &v43[16 * v84];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = &v43[16 * v45];
        uint64_t v89 = *((void *)v88 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v11 + 32 * *(void *)v86), (char *)(v11 + 32 * *(void *)v88), v11 + 32 * v89, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v89 < v87) {
          goto LABEL_116;
        }
        if (v45 > *((void *)v85 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v43[16 * v84 + 8] = v89;
        unint64_t v90 = *((void *)v85 + 2);
        if (v45 >= v90) {
          goto LABEL_118;
        }
        unint64_t v12 = v85;
        unint64_t v13 = v90 - 1;
        memmove(&v43[16 * v45], v88 + 16, 16 * (v90 - 1 - v45));
        *((void *)v85 + 2) = v90 - 1;
        uint64_t v11 = v117;
        if (v90 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    Swift::Int v6 = v115;
    Swift::Int v3 = v116;
    if (v10 >= v116)
    {
      uint64_t v9 = v114;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  Swift::Int v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 31;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 5;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 31;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 5;
  uint64_t v28 = __src;
  uint64_t v27 = __dst;
  if (v10 >= v12 >> 5)
  {
    if (v11 >= -31)
    {
      if (__dst != a2 || &a2[32 * v13] <= __dst) {
        memmove(__dst, a2, 32 * v13);
      }
      unint64_t v18 = &v4[32 * v13];
      uint64_t v26 = v18;
      uint64_t v28 = v6;
      if (v7 < v6 && v11 >= 32)
      {
        uint64_t v19 = (char *)(a3 - 32);
        uint64_t v20 = v6;
        while (1)
        {
          uint64_t v21 = v19 + 32;
          uint64_t v22 = *((void *)v20 - 4);
          v20 -= 32;
          if (*((void *)v18 - 4) >= v22)
          {
            uint64_t v26 = v18 - 32;
            if (v21 < v18 || v19 >= v18 || v21 != v18)
            {
              long long v24 = *((_OWORD *)v18 - 1);
              *(_OWORD *)uint64_t v19 = *((_OWORD *)v18 - 2);
              *((_OWORD *)v19 + 1) = v24;
            }
            uint64_t v20 = v6;
            v18 -= 32;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v21 != v6 || v19 >= v6)
            {
              long long v23 = *((_OWORD *)v20 + 1);
              *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
              *((_OWORD *)v19 + 1) = v23;
            }
            uint64_t v28 = v20;
            if (v20 <= v7) {
              goto LABEL_42;
            }
          }
          v19 -= 32;
          Swift::Int v6 = v20;
          if (v18 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -31)
  {
    if (__dst != __src || &__src[32 * v10] <= __dst) {
      memmove(__dst, __src, 32 * v10);
    }
    Swift::Int v14 = &v4[32 * v10];
    uint64_t v26 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 32)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4)
          {
            long long v17 = *((_OWORD *)v4 + 1);
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
            *((_OWORD *)v7 + 1) = v17;
          }
          v4 += 32;
          uint64_t v27 = v4;
          uint64_t v15 = v6;
        }
        else
        {
          uint64_t v15 = v6 + 32;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
          {
            long long v16 = *((_OWORD *)v6 + 1);
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
            *((_OWORD *)v7 + 1) = v16;
          }
        }
        v7 += 32;
        if (v4 >= v14) {
          break;
        }
        Swift::Int v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      uint64_t v28 = v7;
    }
LABEL_42:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)((void **)&v28, (const void **)&v27, &v26);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  Swift::Int v14 = a4 + 32;
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

char *specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 31;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -32)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 5;
    if (result != v3 || result >= &v3[32 * v7])
    {
      return (char *)memmove(result, v3, 32 * v7);
    }
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
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
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
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
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for UUID() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    int64_t v11 = v9 + v10 * a1;
    uint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
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
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for FlowTaskStep(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FlowTaskStep()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FlowTaskStep(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FlowTaskStep(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
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

uint64_t assignWithTake for FlowTaskStep(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlowTaskStep(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FlowTaskStep(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FlowTaskStep()
{
  return &type metadata for FlowTaskStep;
}

Swift::Double __swiftcall Double.truncate(places:)(Swift::Int places)
{
  double v2 = v1;
  double v3 = __exp10((double)places);
  return floor(v3 * v2) / v3;
}

id InferredHelpfulnessClassifier.model.getter()
{
  return *(id *)(v0 + 16);
}

void *InferredHelpfulnessClassifier.targetName.unsafeMutableAddressor()
{
  return &static InferredHelpfulnessClassifier.targetName;
}

unint64_t static InferredHelpfulnessClassifier.targetName.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t InferredHelpfulnessClassifier.IHScoreSignificantFigures.getter()
{
  return 3;
}

uint64_t static InferredHelpfulnessClassifier.urlOfModelInThisBundle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  int64_t v11 = (void *)MEMORY[0x230F80F90](0xD00000000000001DLL, 0x800000022D495240);
  uint64_t v12 = (void *)MEMORY[0x230F80F90](0x636C65646F6D6C6DLL, 0xE800000000000000);
  id v13 = objc_msgSend(v10, sel_URLForResource_withExtension_, v11, v12);

  if (v13)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    Swift::Int v14 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v14(v8, v5, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
    if (result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(a1, v8, v2);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t InferredHelpfulnessClassifier.__allocating_init(model:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = 3;
  return result;
}

uint64_t InferredHelpfulnessClassifier.init(model:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  *(void *)(v1 + 24) = 3;
  return v1;
}

unint64_t InferredHelpfulnessClassifier.__allocating_init()()
{
  uint64_t v2 = v0;
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  id v10 = (char *)v14 - v9;
  (*(void (**)(uint64_t))(v0 + 96))(v8);
  unint64_t v11 = type metadata accessor for MLModel();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v10, v3);
  id v12 = @nonobjc MLModel.__allocating_init(contentsOf:)((uint64_t)v7);
  if (!v1) {
    unint64_t v11 = (*(uint64_t (**)(id))(v2 + 104))(v12);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v3);
  return v11;
}

uint64_t InferredHelpfulnessClassifier.__allocating_init(contentsOf:)(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = type metadata accessor for MLModel();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  uint64_t v10 = (uint64_t)v8;
  uint64_t v11 = v9;
  id v12 = @nonobjc MLModel.__allocating_init(contentsOf:)(v10);
  if (!v2) {
    uint64_t v11 = (*(uint64_t (**)(id))(v3 + 104))(v12);
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v11;
}

unint64_t type metadata accessor for MLModel()
{
  unint64_t result = lazy cache variable for type metadata for MLModel;
  if (!lazy cache variable for type metadata for MLModel)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for MLModel);
  }
  return result;
}

unint64_t InferredHelpfulnessClassifier.__allocating_init(configuration:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v12 = (char *)&v18 - v11;
  (*(void (**)(uint64_t))(v1 + 96))(v10);
  unint64_t v13 = type metadata accessor for MLModel();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, v5);
  id v14 = a1;
  id v15 = specialized @nonobjc MLModel.__allocating_init(contentsOf:configuration:)((uint64_t)v9, (uint64_t)v14);
  if (v2)
  {
  }
  else
  {
    id v16 = v15;

    unint64_t v13 = (*(uint64_t (**)(id))(v3 + 104))(v16);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
  return v13;
}

uint64_t InferredHelpfulnessClassifier.__allocating_init(contentsOf:configuration:)(uint64_t a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = type metadata accessor for MLModel();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  uint64_t v12 = (uint64_t)v10;
  uint64_t v13 = v11;
  id v14 = specialized @nonobjc MLModel.__allocating_init(contentsOf:configuration:)(v12, (uint64_t)a2);
  if (!v3) {
    uint64_t v13 = (*(uint64_t (**)(id))(v4 + 104))(v14);
  }

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  return v13;
}

id @nonobjc MLModel.__allocating_init(contentsOf:)(uint64_t a1)
{
  uint64_t v13 = (NSURL *)*MEMORY[0x263EF8340];
  URL._bridgeToObjectiveC()(v13);
  uint64_t v3 = v2;
  id v12 = 0;
  id v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_error_, v2, &v12);

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

uint64_t static InferredHelpfulnessClassifier.load(configuration:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(v3 + 96))(v9);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 120))(v11, a1, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

void static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = self;
  URL._bridgeToObjectiveC()(v8);
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a4;
  v13[4] = partial apply for closure #1 in static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:);
  v13[5] = v11;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  void v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed MLModel?, @guaranteed Error?) -> ();
  v13[3] = &block_descriptor;
  id v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_loadContentsOfURL_configuration_completionHandler_, v10, a2, v12);
  _Block_release(v12);
}

void closure #1 in static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)(void *a1, id a2, void (*a3)(id, uint64_t))
{
  if (a2)
  {
    id v5 = a2;
    a3(a2, 1);
  }
  else if (a1)
  {
    type metadata accessor for InferredHelpfulnessClassifier();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a1;
    *(void *)(v7 + 24) = 3;
    id v8 = a1;
    a3((id)v7, 0);
    swift_release();
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

void thunk for @escaping @callee_guaranteed (@guaranteed MLModel?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

Swift::Double_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> InferredHelpfulnessClassifier.predict(using:)(Swift::OpaquePointer using)
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00DC8]), sel_init);
  char v5 = (*(uint64_t (**)(void *, id))(*(void *)v1 + 136))(using._rawValue, v4);

  if (v2) {
    Swift::Bool v8 = v6;
  }
  else {
    Swift::Bool v8 = v5;
  }
  result.value = v7;
  result.is_nil = v8;
  return result;
}

Swift::Double_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> InferredHelpfulnessClassifier.predict(using:options:)(Swift::OpaquePointer using, MLPredictionOptions options)
{
  v29[1] = *(id *)MEMORY[0x263EF8340];
  type metadata accessor for FeatureProvider();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v4 = FeatureProvider.init(features:targetName:)();
  char v5 = *(void **)(v2 + 16);
  v29[0] = 0;
  id v6 = objc_msgSend(v5, sel_predictionFromFeatures_options_error_, v4, options.super.isa, v29);
  if (v6)
  {
    double v7 = v6;
    id v8 = v29[0];
    swift_unknownObjectRetain();
    uint64_t v9 = (void *)MEMORY[0x230F80F90](0xD00000000000001ELL, 0x800000022D498C10);
    id v10 = objc_msgSend(v7, sel_featureValueForName_, v9);

    if (v10)
    {
      id v11 = objc_msgSend(v10, sel_multiArrayValue);
      if (!v11)
      {
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v13 = v11;
      id v14 = objc_msgSend(v11, sel_objectAtIndexedSubscript_, 0);

      objc_msgSend(v14, sel_doubleValue);
      double v16 = v15;

      double v17 = floor(v16 * 1000.0) / 1000.0;
      double v18 = v17;
      if (one-time initialization token for defaultLogger != -1) {
        swift_once();
      }
      uint64_t v19 = type metadata accessor for Logger();
      __swift_project_value_buffer(v19, (uint64_t)defaultLogger);
      uint64_t v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 134217984;
        v29[0] = *(id *)&v17;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl(&dword_22D468000, v20, v21, "PredictionResults value: %f", v22, 0xCu);
        MEMORY[0x230F81A50](v22, -1, -1);
        swift_release();

        swift_unknownObjectRelease_n();
      }
      else
      {

        swift_unknownObjectRelease_n();
        swift_release();
      }
    }
    else
    {
      swift_unknownObjectRelease_n();
      swift_release();
      LOBYTE(v18) = 0;
    }
  }
  else
  {
    id v23 = v29[0];
    long long v24 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    __swift_project_value_buffer(v25, (uint64_t)defaultLogger);
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_22D468000, v26, v27, "Prediction results are nil, no IH score generated", v28, 2u);
      MEMORY[0x230F81A50](v28, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
    LOBYTE(v18) = 0;
  }
  LOBYTE(v11) = LOBYTE(v18);
LABEL_18:
  result.value = v12;
  result.is_nil = (char)v11;
  return result;
}

void *InferredHelpfulnessClassifier.predictAll(using:options:)(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = a2;
  v31[1] = *(id *)MEMORY[0x263EF8340];
  int64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = MEMORY[0x263F8EE78];
  double v7 = "inferredHelpfulnessProbability";
  if (v5)
  {
    v31[0] = (id)MEMORY[0x263F8EE78];
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v10 = a1 + 32;
    type metadata accessor for FeatureProvider();
    int64_t v11 = v5;
    do
    {
      v10 += 8;
      swift_allocObject();
      swift_bridgeObjectRetain();
      FeatureProvider.init(features:targetName:)();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v11;
    }
    while (v11);
    unint64_t v6 = (unint64_t)v31[0];
    double v7 = "inferredHelpfulnessProbability";
    uint64_t v4 = a2;
    uint64_t v3 = v2;
  }
  if (v6 >> 62) {
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
  while (1)
  {
    swift_bridgeObjectRelease();
    id v12 = objc_allocWithZone(MEMORY[0x263F00D10]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v12, sel_initWithFeatureProviderArray_, isa);

    double v15 = (void *)v3[2];
    v31[0] = 0;
    double v16 = objc_msgSend(v15, sel_predictionsFromBatch_options_error_, v14, v4, v31);
    if (!v16)
    {
      uint64_t v4 = v31[0];
      _convertNSErrorToError(_:)();

      swift_willThrow();
      return v4;
    }
    uint64_t v3 = v16;
    id v17 = v31[0];
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5, 0, MEMORY[0x263F8EE78]);
    int64_t v18 = (int64_t)objc_msgSend(v3, sel_count);
    if (v18 < 0)
    {
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }
    int64_t v5 = v18;
    if (!v18) {
      break;
    }
    uint64_t v19 = 0;
    double v7 = (const char *)((unint64_t)(v7 - 32) | 0x8000000000000000);
    while (v5 != v19)
    {
      id v20 = objc_msgSend(v3, sel_featuresAtIndex_, v19);
      os_log_type_t v21 = (void *)MEMORY[0x230F80F90](0xD00000000000001ELL, v7);
      id v22 = objc_msgSend(v20, sel_featureValueForName_, v21);

      if (!v22) {
        goto LABEL_24;
      }
      id v23 = objc_msgSend(v22, sel_multiArrayValue);

      if (!v23) {
        goto LABEL_25;
      }
      id v24 = objc_msgSend(v23, sel_objectAtIndexedSubscript_, 0);

      objc_msgSend(v24, sel_doubleValue);
      uint64_t v26 = v25;

      unint64_t v28 = v4[2];
      unint64_t v27 = v4[3];
      if (v28 >= v27 >> 1) {
        uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v27 > 1), v28 + 1, 1, v4);
      }
      ++v19;
      v4[2] = v28 + 1;
      long long v29 = &v4[2 * v28];
      v29[4] = v26;
      *((unsigned char *)v29 + 40) = 0;
      swift_unknownObjectRelease();
      if (v5 == v19) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
    _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
  }
LABEL_19:
  swift_unknownObjectRelease();

  return v4;
}

uint64_t InferredHelpfulnessClassifier.deinit()
{
  return v0;
}

uint64_t InferredHelpfulnessClassifier.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

id specialized @nonobjc MLModel.__allocating_init(contentsOf:configuration:)(uint64_t a1, uint64_t a2)
{
  double v15 = (NSURL *)*MEMORY[0x263EF8340];
  URL._bridgeToObjectiveC()(v15);
  int64_t v5 = v4;
  id v14 = 0;
  id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, &v14);

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = type metadata accessor for URL();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    id v10 = v7;
    v9(a1, v8);
  }
  else
  {
    id v11 = v14;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v12 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint64_t sub_22D474534()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)(void *a1, void *a2)
{
  closure #1 in static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)(a1, a2, *(void (**)(id, uint64_t))(v2 + 16));
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

uint64_t type metadata accessor for InferredHelpfulnessClassifier()
{
  return self;
}

uint64_t method lookup function for InferredHelpfulnessClassifier(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InferredHelpfulnessClassifier);
}

uint64_t dispatch thunk of static InferredHelpfulnessClassifier.urlOfModelInThisBundle.getter()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of InferredHelpfulnessClassifier.__allocating_init(model:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static InferredHelpfulnessClassifier.load(configuration:completionHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of InferredHelpfulnessClassifier.predict(using:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of InferredHelpfulnessClassifier.predict(using:options:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of InferredHelpfulnessClassifier.predictAll(using:options:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t specialized Sequence.compactMap<A>(_:)()
{
  uint64_t v0 = MEMORY[0x263F8EE78];
  uint64_t v5 = MEMORY[0x263F8EE78];
  swift_retain();
  swift_retain();
  dispatch thunk of _AnySequenceBox._makeIterator()();
  swift_release();
  dispatch thunk of _AnyIteratorBoxBase.next()();
  if (v4)
  {
    while (1)
    {
      uint64_t v1 = specialized InferredHelpfulnessInference.generateIntraTurnFeature(_:)();
      uint64_t v2 = swift_release();
      if (v1)
      {
        MEMORY[0x230F81080](v2);
        if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      dispatch thunk of _AnyIteratorBoxBase.next()();
    }
  }
  swift_release_n();
  swift_release();
  return v0;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay23SiriInferredHelpfulness12FeaturedTurnCG_AHs5NeverOTg5(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v6) {
      break;
    }
    uint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t result = specialized ContiguousArray.reserveCapacity(_:)();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v9 = MEMORY[0x230F812A0](v8, a3);
      }
      else
      {
        uint64_t v9 = *(void *)(a3 + 8 * v8 + 32);
        swift_retain();
      }
      uint64_t v10 = v9;
      a1(&v11, &v10);
      swift_release();
      if (v3) {
        return swift_release();
      }
      ++v8;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      if (v6 == v8) {
        return v12;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t InferredHelpfulnessInference.classifier.getter()
{
  return swift_retain();
}

uint64_t InferredHelpfulnessInference.classifier.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*InferredHelpfulnessInference.classifier.modify())()
{
  return InferredHelpfulnessInference.classifier.modify;
}

uint64_t InferredHelpfulnessInference.modelVersionString.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferredHelpfulnessInference.modelVersionString.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*InferredHelpfulnessInference.modelVersionString.modify())()
{
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t InferredHelpfulnessInference.emitSelfLogs.getter()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t InferredHelpfulnessInference.emitSelfLogs.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 40) = a1;
  return result;
}

uint64_t (*InferredHelpfulnessInference.emitSelfLogs.modify())()
{
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t InferredHelpfulnessInference.streamBookmarkName.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferredHelpfulnessInference.streamBookmarkName.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*InferredHelpfulnessInference.streamBookmarkName.modify())()
{
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t InferredHelpfulnessInference.failEval.getter()
{
  swift_beginAccess();
  return *(unsigned int *)(v0 + 64);
}

uint64_t InferredHelpfulnessInference.failEval.setter(int a1)
{
  uint64_t result = swift_beginAccess();
  *(_DWORD *)(v1 + 64) = a1;
  return result;
}

uint64_t (*InferredHelpfulnessInference.failEval.modify())()
{
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t InferredHelpfulnessInference.nullModelVersion.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferredHelpfulnessInference.nullModelVersion.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*InferredHelpfulnessInference.nullModelVersion.modify())()
{
  return InferredHelpfulnessInference.modelVersionString.modify;
}

double InferredHelpfulnessInference.failIHScore.getter()
{
  swift_beginAccess();
  return *(double *)(v0 + 88);
}

uint64_t InferredHelpfulnessInference.failIHScore.setter(double a1)
{
  uint64_t result = swift_beginAccess();
  *(double *)(v1 + 88) = a1;
  return result;
}

uint64_t (*InferredHelpfulnessInference.failIHScore.modify())()
{
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t InferredHelpfulnessInference.__allocating_init(streamBookmarkName:emitSelfLogs:trialProvider:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  InferredHelpfulnessInference.init(streamBookmarkName:emitSelfLogs:trialProvider:)(a1, a2, a3, a4);
  return v8;
}

uint64_t InferredHelpfulnessInference.init(streamBookmarkName:emitSelfLogs:trialProvider:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6 = v4;
  *(void *)(v6 + 16) = 0;
  uint64_t v10 = (unint64_t *)(v6 + 16);
  *(void *)(v6 + 48) = 0xD000000000000011;
  uint64_t v11 = v6 + 48;
  *(void *)(v6 + 56) = 0x800000022D495F90;
  *(_DWORD *)(v6 + 64) = 1;
  *(void *)(v6 + 72) = 0;
  *(void *)(v6 + 80) = 0xE000000000000000;
  *(void *)(v6 + 88) = 0xBFF0000000000000;
  if (a2)
  {
    swift_beginAccess();
    *(void *)(v6 + 48) = a1;
    *(void *)(v6 + 56) = a2;
    uint64_t v11 = swift_bridgeObjectRelease();
  }
  *(unsigned char *)(v6 + 40) = a3 & 1;
  uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 216))(v11);
  if (v5)
  {
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)defaultLogger);
    double v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_22D468000, v15, v16, "Unable to load model from Trial Assets", v17, 2u);
      MEMORY[0x230F81A50](v17, -1, -1);
    }
  }
  else
  {
    uint64_t v18 = v13;
    swift_beginAccess();
    unint64_t *v10 = v18;
    swift_release();
  }
  swift_beginAccess();
  unint64_t v19 = *v10;
  if (!*v10)
  {
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)defaultLogger);
    unint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v27, v28))
    {
      long long v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v29 = 0;
      _os_log_impl(&dword_22D468000, v27, v28, "Loading model from Bundle", v29, 2u);
      MEMORY[0x230F81A50](v29, -1, -1);
    }

    type metadata accessor for InferredHelpfulnessClassifier();
    unint64_t *v10 = InferredHelpfulnessClassifier.__allocating_init()();
    swift_release();
    unint64_t v19 = *v10;
    if (!*v10)
    {
      long long v34 = 0u;
      long long v35 = 0u;
LABEL_26:
      swift_beginAccess();
      uint64_t v31 = *(void *)(v6 + 72);
      uint64_t v30 = *(void *)(v6 + 80);
      uint64_t v37 = MEMORY[0x263F8D310];
      *(void *)&long long v36 = v31;
      *((void *)&v36 + 1) = v30;
      swift_bridgeObjectRetain();
      outlined destroy of Any?((uint64_t)&v34, &demangling cache variable for type metadata for Any?);
      goto LABEL_27;
    }
  }
  id v20 = objc_msgSend(*(id *)(v19 + 16), sel_modelDescription);
  id v21 = objc_msgSend(v20, sel_metadata);

  type metadata accessor for MLModelMetadataKey(0);
  lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, type metadata accessor for MLModelMetadataKey);
  uint64_t v22 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v22 + 16))
  {
    id v23 = (id)*MEMORY[0x263F00D08];
    unint64_t v24 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v23);
    if (v25)
    {
      outlined init with copy of Any(*(void *)(v22 + 56) + 32 * v24, (uint64_t)&v34);
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
    }
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v35 + 1)) {
    goto LABEL_26;
  }
  outlined init with take of Any(&v34, &v36);
LABEL_27:
  *(void *)&long long v34 = 0;
  *((void *)&v34 + 1) = 0xE000000000000000;
  _print_unlocked<A, B>(_:_:)();
  swift_release();
  long long v32 = v34;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v36);
  *(_OWORD *)(v6 + 24) = v32;
  return v6;
}

uint64_t one-time initialization function for selfFeatureExtractors()
{
  uint64_t result = closure #1 in variable initialization expression of static InferredHelpfulnessInference.selfFeatureExtractors();
  static InferredHelpfulnessInference.selfFeatureExtractors = result;
  return result;
}

uint64_t closure #1 in variable initialization expression of static InferredHelpfulnessInference.selfFeatureExtractors()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22D4952D0;
  type metadata accessor for UEIFeatureExtractor();
  uint64_t v1 = swift_allocObject();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = self;
  swift_retain();
  id v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v5 = static TrialProvider.shared;
  swift_retain();
  unint64_t v6 = specialized static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)(v4, v5);

  swift_release();
  *(void *)(v1 + 16) = v6;
  swift_release();
  *(void *)(v0 + 32) = v1;
  type metadata accessor for ASRFeatureExtractor();
  *(void *)(v0 + 40) = swift_allocObject();
  type metadata accessor for FlowClientFeatureExtractor();
  *(void *)(v0 + 48) = swift_allocObject();
  specialized Array._endMutation()();
  return v0;
}

uint64_t *InferredHelpfulnessInference.selfFeatureExtractors.unsafeMutableAddressor()
{
  if (one-time initialization token for selfFeatureExtractors != -1) {
    swift_once();
  }
  return &static InferredHelpfulnessInference.selfFeatureExtractors;
}

uint64_t static InferredHelpfulnessInference.selfFeatureExtractors.getter()
{
  if (one-time initialization token for selfFeatureExtractors != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t InferredHelpfulnessInference.gradeInteractions()()
{
  v1[10] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>);
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyAsyncSequence<Turn>);
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](InferredHelpfulnessInference.gradeInteractions(), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (__cdecl *v7)();
  uint64_t v8;

  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[14];
  id v4 = v0[15];
  type metadata accessor for PLLoggingReader();
  static PLLoggingReader.shared.getter();
  PLLoggingReader.asyncSignalReader.getter();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  dispatch thunk of AsyncSignalReader.turns()();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  type metadata accessor for FeaturedTurn(0);
  lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>, &demangling cache variable for type metadata for AnyAsyncSequence<Turn>);
  swift_retain();
  AsyncCompactMapSequence.init(_:transform:)();
  id v7 = (uint64_t (__cdecl *)())((char *)&async function pointer to specialized AsyncSequence.collect()
                             + async function pointer to specialized AsyncSequence.collect());
  uint64_t v5 = (void *)swift_task_alloc();
  v0[18] = v5;
  *uint64_t v5 = v0;
  v5[1] = InferredHelpfulnessInference.gradeInteractions();
  return v7();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  (*(void (**)(void, void))(v0[15] + 8))(v0[17], v0[14]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  BOOL v4;
  unint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t (*v17)(void *);
  uint64_t v19;

  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)defaultLogger);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  uint64_t v3 = static os_log_type_t.info.getter();
  id v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[19];
  if (v4)
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v6 = 134217984;
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      id v7 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[9] = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D468000, v2, v3, "Found %ld intra turns", v6, 0xCu);
    MEMORY[0x230F81A50](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v8 = specialized InferredHelpfulnessInference.generateInterTurnFeatures(_:)(v0[19]);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  uint64_t v9 = Logger.logObject.getter();
  uint64_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 134217984;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[8] = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D468000, v9, v10, "Found %ld turns", v11, 0xCu);
    MEMORY[0x230F81A50](v11, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v13 = v0[17];
  uint64_t v14 = v0[14];
  double v15 = v0[15];
  os_log_type_t v16 = InferredHelpfulnessInference.gradeInteractionsInternal(_:)(v8);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v17 = (uint64_t (*)(void *))v0[1];
  return v17(v16);
}

uint64_t InferredHelpfulnessInference.gradeInteractions()(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 104);
  uint64_t v5 = *(void *)(*v2 + 96);
  uint64_t v6 = *(void *)(*v2 + 88);
  *(void *)(v3 + 152) = a1;
  *(void *)(v3 + 160) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v1) {
    id v7 = InferredHelpfulnessInference.gradeInteractions();
  }
  else {
    id v7 = InferredHelpfulnessInference.gradeInteractions();
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t InferredHelpfulnessInference.gradeConversations()()
{
  v1[28] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Conversation?);
  v1[29] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for Conversation();
  v1[30] = v2;
  v1[31] = *(void *)(v2 - 8);
  v1[32] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>.Iterator);
  v1[33] = v3;
  v1[34] = *(void *)(v3 - 8);
  v1[35] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>);
  v1[36] = v4;
  v1[37] = *(void *)(v4 - 8);
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyAsyncSequence<(Conversation, StreamBookmark?)>);
  v1[40] = v5;
  v1[41] = *(void *)(v5 - 8);
  v1[42] = swift_task_alloc();
  v1[43] = swift_task_alloc();
  return MEMORY[0x270FA2498](InferredHelpfulnessInference.gradeConversations(), 0, 0);
}

{
  uint64_t *v0;
  uint64_t v1;
  void (*v2)(void);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  os_log_type_t type;
  os_log_type_t typea[8];
  uint64_t v42;
  uint64_t (*v43)(void);
  void *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;

  uint64_t v46 = v0;
  uint64_t v1 = v0[28];
  unint64_t v44 = v0 + 2;
  type metadata accessor for PLLoggingReader();
  static PLLoggingReader.shared.getter();
  PLLoggingReader.streamBookmarkStore.getter();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v0 + 8, v0[11]);
  uint64_t v2 = *(void (**)(void))(*(void *)v1 + 208);
  uint64_t v3 = (*(void *)v1 + 208) & 0xFFFFFFFFFFFFLL | 0x5DB4000000000000;
  v0[44] = (uint64_t)v2;
  v0[45] = v3;
  unint64_t v43 = (uint64_t (*)(void))v2;
  v2();
  uint64_t v4 = (void *)dispatch thunk of StreamBookmarkStore.read(name:)();
  swift_bridgeObjectRelease();
  if (v4)
  {
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)defaultLogger);
    uint64_t v6 = v4;
    swift_retain_n();
    uint64_t v7 = v6;
    uint64_t v8 = Logger.logObject.getter();
    uint64_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      type = v9;
      uint64_t v10 = swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      unint64_t v45 = v39;
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v11 = v43();
      v0[25] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2080;
      v0[26] = (uint64_t)v4;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StreamBookmark?);
      uint64_t v13 = Optional.debugDescription.getter();
      v0[27] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D468000, v8, type, "Loaded %s bookmark: %s ", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v39, -1, -1);
      MEMORY[0x230F81A50](v10, -1, -1);

      goto LABEL_13;
    }
  }
  else
  {
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    double v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)defaultLogger);
    swift_retain_n();
    os_log_type_t v16 = Logger.logObject.getter();
    id v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      unint64_t v19 = swift_slowAlloc();
      unint64_t v45 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      id v20 = v43();
      v0[24] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D468000, v16, v17, "No bookmark found for %s: to read from the beginning. ", v18, 0xCu);
      swift_arrayDestroy();
      uint64_t v22 = v19;
      uint64_t v4 = 0;
      MEMORY[0x230F81A50](v22, -1, -1);
      MEMORY[0x230F81A50](v18, -1, -1);

      goto LABEL_13;
    }
  }
  swift_release_n();
LABEL_13:
  static PLLoggingReader.shared.getter();
  PLLoggingReader.asyncSignalReader.getter();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v44, v0[5]);
  if (v4)
  {
    id v23 = v4;
  }
  else
  {
    type metadata accessor for StreamBookmark();
    v43();
    id v23 = (void *)StreamBookmark.__allocating_init(name:)();
  }
  v0[46] = (uint64_t)v4;
  unint64_t v24 = v4;
  uint64_t v26 = v0[42];
  char v25 = v0[43];
  unint64_t v27 = v0[40];
  os_log_type_t v28 = v0[41];
  long long v29 = v0[37];
  *(void *)typea = v0[36];
  unint64_t v42 = v0[38];
  long long v38 = v0[39];
  uint64_t v30 = v24;
  dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
  uint64_t v31 = swift_allocObject();
  v0[47] = v31;
  *(void *)(v31 + 16) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v26, v25, v27);
  long long v32 = swift_allocObject();
  *(void *)(v32 + 16) = &async function pointer to partial apply for closure #1 in InferredHelpfulnessInference.gradeConversations();
  *(void *)(v32 + 24) = v31;
  lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AnyAsyncSequence<(Conversation, StreamBookmark?)> and conformance AnyAsyncSequence<A>, &demangling cache variable for type metadata for AnyAsyncSequence<(Conversation, StreamBookmark?)>);
  swift_retain();
  AsyncMapSequence.init(_:transform:)();
  swift_retain();
  v0[23] = MEMORY[0x263F8EE78];
  (*(void (**)(uint64_t, uint64_t, os_log_type_t *))(v29 + 16))(v42, v38, *(os_log_type_t **)typea);
  lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation> and conformance AsyncMapSequence<A, B>, &demangling cache variable for type metadata for AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>);
  dispatch thunk of AsyncSequence.makeAsyncIterator()();
  uint64_t v33 = lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>.Iterator and conformance AsyncMapSequence<A, B>.Iterator, &demangling cache variable for type metadata for AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>.Iterator);
  long long v34 = (void *)swift_task_alloc();
  v0[48] = (uint64_t)v34;
  *long long v34 = v0;
  v34[1] = InferredHelpfulnessInference.gradeConversations();
  long long v35 = v0[33];
  long long v36 = v0[29];
  return MEMORY[0x270FA1E80](v36, v35, v33);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v8;

  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 392) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[34];
    uint64_t v3 = v2[35];
    uint64_t v5 = v2[33];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = InferredHelpfulnessInference.gradeConversations();
  }
  else
  {
    uint64_t v6 = InferredHelpfulnessInference.gradeConversations();
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t (*v26)(void);
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  uint64_t v46 = v0;
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 232);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    unint64_t v44 = (void *)(v0 + 64);
    uint64_t v4 = *(void *)(v0 + 376);
    uint64_t v5 = *(void *)(v0 + 312);
    uint64_t v7 = *(void *)(v0 + 288);
    uint64_t v6 = *(void *)(v0 + 296);
    uint64_t v8 = *(void *)(v0 + 224);
    (*(void (**)(void, void))(*(void *)(v0 + 272) + 8))(*(void *)(v0 + 280), *(void *)(v0 + 264));
    outlined destroy of Any?(v3, &demangling cache variable for type metadata for Conversation?);
    uint64_t v9 = *(void *)(v0 + 184);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    swift_release();
    uint64_t v10 = specialized InferredHelpfulnessInference.generateInterTurnFeaturesForConversation(_:)(v9);
    swift_bridgeObjectRelease();
    swift_retain();
    unint64_t v43 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay23SiriInferredHelpfulness20FeaturedConversationCG_AF06GradedH0Vs5NeverOTg504_s23de52Helpfulness0bC9InferenceC18gradeConversationsSayAA18ih12VGyYaKFAfA08G9H0CXEfU0_AF0efN0CTf1cn_nTf4ng_n(v10, v8);
    swift_bridgeObjectRelease();
    swift_release();
    swift_beginAccess();
    uint64_t v11 = *(void **)(v4 + 16);
    if (v11)
    {
      unint64_t v42 = *(void *)(v0 + 344);
      uint64_t v12 = *(void *)(v0 + 328);
      long long v38 = *(void **)(v0 + 368);
      uint64_t v40 = *(void *)(v0 + 320);
      uint64_t v13 = *(void *)(v0 + 224);
      __swift_project_boxed_opaque_existential_1(v44, *(void *)(v0 + 88));
      uint64_t v14 = v11;
      dispatch thunk of StreamBookmarkStore.write(bookmark:)();
      __swift_project_boxed_opaque_existential_1(v44, *(void *)(v0 + 88));
      outlined init with copy of StreamBookmarkStore((uint64_t)v44, v0 + 104);
      double v15 = swift_allocObject();
      outlined init with take of StreamBookmarkStore((long long *)(v0 + 104), v15 + 16);
      *(void *)(v15 + 56) = v13;
      swift_retain();
      dispatch thunk of StreamBookmarkStore.notifyOnComplete(completion:)();

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v42, v40);
      swift_release();
      os_log_type_t v16 = v0 + 64;
    }
    else
    {
      if (one-time initialization token for defaultLogger != -1) {
        swift_once();
      }
      id v23 = type metadata accessor for Logger();
      __swift_project_value_buffer(v23, (uint64_t)defaultLogger);
      swift_retain_n();
      unint64_t v24 = Logger.logObject.getter();
      char v25 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v24, v25))
      {
        long long v36 = *(void **)(v0 + 368);
        uint64_t v26 = *(uint64_t (**)(void))(v0 + 352);
        uint64_t v37 = *(void *)(v0 + 328);
        uint64_t v39 = *(void *)(v0 + 320);
        unint64_t v41 = *(void *)(v0 + 344);
        unint64_t v27 = (uint8_t *)swift_slowAlloc();
        os_log_type_t v28 = swift_slowAlloc();
        unint64_t v45 = v28;
        *(_DWORD *)unint64_t v27 = 136315138;
        long long v29 = v26();
        *(void *)(v0 + 176) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v30, &v45);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D468000, v24, v25, "Read nil bookmark for %s ", v27, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x230F81A50](v28, -1, -1);
        MEMORY[0x230F81A50](v27, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v41, v39);
      }
      else
      {
        uint64_t v31 = *(void *)(v0 + 344);
        long long v32 = *(void *)(v0 + 320);
        uint64_t v33 = *(void *)(v0 + 328);

        swift_release_n();
        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v31, v32);
      }
      swift_release();
      os_log_type_t v16 = v0 + 64;
    }
    __swift_destroy_boxed_opaque_existential_0(v16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    long long v34 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v34(v43);
  }
  else
  {
    id v17 = *(void *)(v0 + 256);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v17, v3, v1);
    uint64_t v18 = InferredHelpfulnessInference.generateIntraTurnFeaturesForConversation(_:)();
    specialized Array.append<A>(contentsOf:)(v18, (unint64_t *)type metadata accessor for FeaturedTurn, &lazy protocol witness table cache variable for type [FeaturedTurn] and conformance [A], &demangling cache variable for type metadata for [FeaturedTurn], (uint64_t *)specialized protocol witness for Collection.subscript.read in conformance [A]);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v17, v1);
    unint64_t v19 = lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>.Iterator and conformance AsyncMapSequence<A, B>.Iterator, &demangling cache variable for type metadata for AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>.Iterator);
    id v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 384) = v20;
    *id v20 = v0;
    v20[1] = InferredHelpfulnessInference.gradeConversations();
    id v21 = *(void *)(v0 + 264);
    uint64_t v22 = *(void *)(v0 + 232);
    return MEMORY[0x270FA1E80](v22, v21, v19);
  }
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  uint64_t v1 = (void *)v0[46];
  uint64_t v2 = v0[43];
  uint64_t v3 = v0[40];
  uint64_t v4 = v0[41];
  (*(void (**)(void, void))(v0[37] + 8))(v0[39], v0[36]);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 8));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t closure #1 in InferredHelpfulnessInference.gradeConversations()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a3;
  v4[8] = a4;
  v4[5] = a1;
  v4[6] = a2;
  return MEMORY[0x270FA2498](closure #1 in InferredHelpfulnessInference.gradeConversations(), 0, 0);
}

uint64_t closure #1 in InferredHelpfulnessInference.gradeConversations()()
{
  uint64_t v2 = (void *)v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  swift_beginAccess();
  uint64_t v5 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v2;
  id v6 = v2;

  uint64_t v7 = type metadata accessor for Conversation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v3, v4, v7);
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed Conversation, @guaranteed StreamBookmark?) -> (@out Conversation)(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void *)(a2
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Conversation, StreamBookmark?))
                          + 48));
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = partial apply for closure #1 in AsyncSequence.flatMap<A>(_:);
  return v10(a1, a2, v7);
}

uint64_t AsyncSequence.flatMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[8] = a5;
  v6[9] = v5;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  return MEMORY[0x270FA2498](AsyncSequence.flatMap<A>(_:), 0, 0);
}

uint64_t AsyncSequence.flatMap<A>(_:)()
{
  uint64_t v1 = *(void *)(v0 + 48);
  long long v8 = *(_OWORD *)(v0 + 56);
  long long v9 = *(_OWORD *)(v0 + 32);
  *(void *)(v0 + 24) = static Array._allocateUninitialized(_:)();
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v8;
  *(_OWORD *)(v2 + 40) = v9;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = type metadata accessor for Array();
  *uint64_t v3 = v0;
  v3[1] = AsyncSequence.flatMap<A>(_:);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v6 = *(void *)(v0 + 48);
  return MEMORY[0x270FA20A8](v0 + 16, v0 + 24, &async function pointer to partial apply for closure #1 in AsyncSequence.flatMap<A>(_:), v2, v6, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = AsyncSequence.flatMap<A>(_:);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = AsyncSequence.flatMap<A>(_:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void closure #3 in InferredHelpfulnessInference.gradeConversations()(void *a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  (*(void (**)(void))(*(void *)a2 + 208))();
  uint64_t v3 = (void *)dispatch thunk of StreamBookmarkStore.read(name:)();
  swift_bridgeObjectRelease();
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)defaultLogger);
  id v11 = v3;
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StreamBookmark?);
    uint64_t v9 = Optional.debugDescription.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D468000, v5, v6, "Saved boomark: %s ", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F81A50](v8, -1, -1);
    MEMORY[0x230F81A50](v7, -1, -1);
  }
  else
  {
  }
}

void *InferredHelpfulnessInference.gradeInteractionsInternal(_:)(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v57 = type metadata accessor for ImmutableLoggingMetadata();
  MEMORY[0x270FA5388](v57);
  uint64_t v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v8 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_3;
    }
LABEL_32:
    swift_bridgeObjectRelease();
    return (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t result = (void *)_CocoaArrayWrapper.endIndex.getter();
  uint64_t v9 = (uint64_t)result;
  if (!result) {
    goto LABEL_32;
  }
LABEL_3:
  uint64_t v12 = *(uint64_t (**)(void))(*(void *)v2 + 184);
  uint64_t v61 = *(void *)v2 + 184;
  uint64_t v62 = v12;
  if (v9 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v13 = 0;
    unint64_t v53 = a1 & 0xC000000000000001;
    uint64_t v60 = (void *)MEMORY[0x263F8EE78];
    uint64_t v52 = (void (**)(char *, uint64_t))(v6 + 8);
    *(void *)&long long v11 = 136315138;
    long long v48 = v11;
    v47[1] = MEMORY[0x263F8EE58] + 8;
    unint64_t v51 = a1;
    uint64_t v59 = v2;
    v50 = v5;
    uint64_t v54 = v9;
    uint64_t v55 = v8;
    do
    {
      if (v53)
      {
        double v15 = (void *)MEMORY[0x230F812A0](v13, a1);
      }
      else
      {
        double v15 = *(void **)(a1 + 8 * v13 + 32);
        swift_retain();
      }
      UUID.init()();
      UUID.init()();
      outlined init with copy of UUID?((uint64_t)v15 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, (uint64_t)&v5[*(int *)(v57 + 20)]);
      if (one-time initialization token for defaultLogger != -1) {
        swift_once();
      }
      uint64_t v16 = type metadata accessor for Logger();
      __swift_project_value_buffer(v16, (uint64_t)defaultLogger);
      swift_retain_n();
      id v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.default.getter();
      BOOL v19 = os_log_type_enabled(v17, v18);
      v63 = v15;
      if (v19)
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        uint64_t v64 = v21;
        *(_DWORD *)uint64_t v20 = v48;
        uint64_t v22 = (*(uint64_t (**)(void))(*(void *)v2 + 160))();
        *(void *)(v20 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, &v64);
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D468000, v17, v18, "versionString: %s", (uint8_t *)v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x230F81A50](v21, -1, -1);
        uint64_t v24 = v20;
        double v15 = v63;
        MEMORY[0x230F81A50](v24, -1, -1);
      }
      else
      {

        uint64_t v25 = swift_release_n();
      }
      uint64_t v26 = ((uint64_t (*)(uint64_t))v62)(v25);
      if (v26)
      {
        MEMORY[0x270FA5388](v26);
        v47[-2] = v5;
        specialized static IHProtoUtils.emitAndLogEvent(createMessageClosure:messageName:)((uint64_t (*)(void))partial apply for closure #1 in InferredHelpfulnessInference.gradeInteractionsInternal(_:), (uint64_t)&v47[-4], 0x4C74736575716572, 0xEB000000006B6E69);
        MEMORY[0x270FA5388](v27);
        v47[-4] = v5;
        v47[-3] = v8;
        v47[-2] = v2;
        specialized static IHProtoUtils.emitAndLogEvent(createMessageClosure:messageName:)((uint64_t (*)(void))partial apply for closure #2 in InferredHelpfulnessInference.gradeInteractionsInternal(_:), (uint64_t)&v47[-6], 0x7472617473, 0xE500000000000000);
      }
      uint64_t v28 = InferredHelpfulnessInference.generateGradedInteraction(featuredTurn:)(v15, (uint64_t)&v64);
      uint64_t v29 = v65;
      if (v65)
      {
        uint64_t v58 = v13;
        uint64_t v30 = v64;
        uint64_t v32 = v66;
        uint64_t v31 = v67;
        uint64_t v33 = v68;
        uint64_t v34 = v69;
        uint64_t v36 = v70;
        uint64_t v35 = v71;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        if (swift_isUniquelyReferenced_nonNull_native()) {
          uint64_t v37 = v60;
        }
        else {
          uint64_t v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v60[2] + 1, 1, v60);
        }
        unint64_t v39 = v37[2];
        unint64_t v38 = v37[3];
        if (v39 >= v38 >> 1) {
          uint64_t v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v38 > 1), v39 + 1, 1, v37);
        }
        v37[2] = v39 + 1;
        uint64_t v60 = v37;
        uint64_t v40 = &v37[8 * v39];
        v40[4] = v30;
        v40[5] = v29;
        v40[6] = v32;
        v40[7] = v31;
        v40[8] = v33;
        v40[9] = v34;
        v40[10] = v36;
        v40[11] = v35;
        uint64_t v41 = v62();
        if (v41)
        {
          char v49 = v47;
          MEMORY[0x270FA5388](v41);
          unint64_t v42 = v50;
          unint64_t v43 = v55;
          v47[-6] = v50;
          v47[-5] = v43;
          LODWORD(v47[-4]) = v44;
          HIDWORD(v47[-4]) = 0;
          LOBYTE(v47[-3]) = 1;
          HIDWORD(v47[-3]) = 0;
          LOBYTE(v47[-2]) = 1;
          specialized static IHProtoUtils.emitAndLogEvent(createMessageClosure:messageName:)((uint64_t (*)(void))partial apply for closure #3 in InferredHelpfulnessInference.gradeInteractionsInternal(_:), (uint64_t)&v47[-8], 6581861, 0xE300000000000000);
          uint64_t v45 = v29;
          uint64_t v8 = v43;
          uint64_t v5 = v42;
          outlined consume of GradedInteraction?(v30, v45);
          swift_release();
          a1 = v51;
          uint64_t v2 = v59;
        }
        else
        {
          outlined consume of GradedInteraction?(v30, v29);
          swift_release();
          a1 = v51;
          uint64_t v2 = v59;
          uint64_t v5 = v50;
          uint64_t v8 = v55;
        }
        uint64_t v14 = v54;
        uint64_t v13 = v58;
      }
      else
      {
        uint64_t v46 = ((uint64_t (*)(uint64_t))v62)(v28);
        if (v46)
        {
          MEMORY[0x270FA5388](v46);
          uint64_t v8 = v55;
          v47[-4] = v5;
          v47[-3] = v8;
          v47[-2] = v2;
          specialized static IHProtoUtils.emitAndLogEvent(createMessageClosure:messageName:)((uint64_t (*)(void))partial apply for closure #4 in InferredHelpfulnessInference.gradeInteractionsInternal(_:), (uint64_t)&v47[-6], 1818845542, 0xE400000000000000);
          swift_release();
        }
        else
        {
          swift_release();
          uint64_t v8 = v55;
        }
        uint64_t v14 = v54;
      }
      ++v13;
      outlined destroy of ImmutableLoggingMetadata((uint64_t)v5);
      (*v52)(v8, v56);
    }
    while (v14 != v13);
    swift_bridgeObjectRelease();
    return v60;
  }
  return result;
}

void *closure #2 in InferredHelpfulnessInference.gradeInteractionsInternal(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)a3 + 160))();
  uint64_t v7 = specialized static IHProtoUtils.generateModelEvalStart(loggingMetadata:contextId:modelId:)(a1, a2, v5, v6);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t InferredHelpfulnessInference.generateGradedInteraction(featuredTurn:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v2 + 136))();
  if (!v6
    || (uint64_t v7 = v6,
        (*(void (**)(void))(*a1 + 120))(),
        uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v7 + 128))(),
        char v10 = v9,
        swift_release(),
        swift_bridgeObjectRelease(),
        (v10 & 1) != 0))
  {
    double v11 = (*(double (**)(void))(*(void *)v3 + 280))();
  }
  else
  {
    double v11 = *(double *)&v8;
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 160);
  uint64_t v13 = swift_retain();
  uint64_t v14 = v12(v13);
  uint64_t result = GradedInteraction.init(inferredHelpfulnessScore:featuredTurn:modelVersion:)(a1, v14, v15, (uint64_t)&v22, v11);
  uint64_t v17 = v23;
  uint64_t v18 = v24;
  uint64_t v19 = v26;
  uint64_t v20 = v27;
  long long v21 = v25;
  *(_OWORD *)a2 = v22;
  *(void *)(a2 + 16) = v17;
  *(void *)(a2 + 24) = v18;
  *(_OWORD *)(a2 + 32) = v21;
  *(void *)(a2 + 48) = v19;
  *(void *)(a2 + 56) = v20;
  return result;
}

uint64_t closure #1 in InferredHelpfulnessInference.generateIntraTurnFeatures(_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](closure #1 in InferredHelpfulnessInference.generateIntraTurnFeatures(_:), 0, 0);
}

uint64_t closure #1 in InferredHelpfulnessInference.generateIntraTurnFeatures(_:)()
{
  uint64_t v1 = *(void **)(v0 + 16);
  void *v1 = specialized InferredHelpfulnessInference.generateIntraTurnFeature(_:)();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t specialized AsyncSequence.collect()()
{
  v1[4] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>);
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>.Iterator);
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized AsyncSequence.collect(), 0, 0);
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
  uint64_t v9;

  uint64_t v1 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  v0[2] = MEMORY[0x263F8EE78];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v3, v4);
  lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn> and conformance AsyncCompactMapSequence<A, B>, &demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>);
  dispatch thunk of AsyncSequence.makeAsyncIterator()();
  uint64_t v5 = lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>.Iterator and conformance AsyncCompactMapSequence<A, B>.Iterator, &demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>.Iterator);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[11] = v6;
  void *v6 = v0;
  v6[1] = specialized AsyncSequence.collect();
  uint64_t v7 = v0[8];
  return MEMORY[0x270FA1E80](v0 + 3, v7, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v8;

  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[9];
    uint64_t v3 = v2[10];
    uint64_t v5 = v2[8];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = specialized AsyncSequence.collect();
  }
  else
  {
    uint64_t v6 = specialized AsyncSequence.collect();
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;

  if (v0[3])
  {
    uint64_t v1 = swift_retain();
    MEMORY[0x230F81080](v1);
    if (*(void *)((v0[2] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[2] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_release();
    uint64_t v2 = lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>.Iterator and conformance AsyncCompactMapSequence<A, B>.Iterator, &demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>.Iterator);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[11] = v3;
    *uint64_t v3 = v0;
    v3[1] = specialized AsyncSequence.collect();
    uint64_t v4 = v0[8];
    return MEMORY[0x270FA1E80](v0 + 3, v4, v2);
  }
  else
  {
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
    swift_release();
    uint64_t v5 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
    return v6(v5);
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t AsyncSequence.collect()(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return MEMORY[0x270FA2498](AsyncSequence.collect(), 0, 0);
}

uint64_t AsyncSequence.collect()()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  swift_getAssociatedTypeWitness();
  v0[3] = static Array._allocateUninitialized(_:)();
  uint64_t v3 = swift_task_alloc();
  v0[7] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  uint64_t v5 = type metadata accessor for Array();
  *uint64_t v4 = v0;
  v4[1] = AsyncSequence.collect();
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[4];
  return MEMORY[0x270FA20A8](v0 + 2, v0 + 3, &async function pointer to partial apply for closure #1 in AsyncSequence.collect(), v3, v7, v5, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = AsyncSequence.collect();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = AsyncSequence.flatMap<A>(_:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized Array.append<A>(contentsOf:)(unint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v12 = *v5;
  if (*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v14 = v13 + v11;
    if (!__OFADD__(v13, v11)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v14 = v13 + v11;
  if (__OFADD__(v13, v11)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v12 = *v5;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v5 = v12;
  uint64_t v13 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v12 & 0x8000000000000000) == 0
    && (v12 & 0x4000000000000000) == 0)
  {
    uint64_t v16 = v12 & 0xFFFFFFFFFFFFFF8;
    if (v14 <= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v13 = 1;
  }
  uint64_t v23 = v11;
  uint64_t v11 = (uint64_t)a2;
  a2 = a3;
  a3 = (unint64_t *)a4;
  a4 = a5;
  if (v12 >> 62) {
    goto LABEL_27;
  }
  uint64_t v17 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v17 <= v14) {
      uint64_t v17 = v14;
    }
    swift_bridgeObjectRetain();
    unint64_t v12 = MEMORY[0x230F812B0](v13, v17, 1, v12);
    swift_bridgeObjectRelease();
    *uint64_t v5 = v12;
    uint64_t v16 = v12 & 0xFFFFFFFFFFFFFF8;
    a5 = a4;
    a4 = (uint64_t *)a3;
    a3 = a2;
    a2 = (unint64_t *)v11;
    uint64_t v11 = v23;
LABEL_15:
    uint64_t result = specialized Array._copyContents(initializing:)(v16 + 8 * *(void *)(v16 + 16) + 32, (*(void *)(v16 + 24) >> 1) - *(void *)(v16 + 16), a1, (void (*)(void))a2, a3, a4, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))a5);
    if (v19 >= v11) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v19 >= 1)
  {
    uint64_t v20 = *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v21 = __OFADD__(v20, v19);
    uint64_t v22 = v20 + v19;
    if (v21)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) = v22;
  }
  swift_bridgeObjectRelease();
  return specialized Array._endMutation()();
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t InferredHelpfulnessInference.generateIntraTurnFeaturesForConversation(_:)()
{
  Conversation.allTurnsChronologically.getter();
  swift_retain();
  unint64_t v0 = specialized Sequence.compactMap<A>(_:)();
  swift_release();
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    if ((v0 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v1 = MEMORY[0x230F812A0](0, v0);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    if (*(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v1 = *(void *)(v0 + 32);
      swift_retain();
LABEL_6:
      uint64_t v3 = *(void *)(v1 + 24);
      uint64_t v2 = *(void *)(v1 + 32);
      swift_bridgeObjectRetain();
      uint64_t v4 = swift_release();
      MEMORY[0x270FA5388](v4);
      void v12[2] = v3;
      uint64_t v12[3] = v2;
      uint64_t v5 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay23SiriInferredHelpfulness12FeaturedTurnCG_AHs5NeverOTg5((void (*)(uint64_t *__return_ptr, uint64_t *))partial apply for closure #1 in InferredHelpfulnessInference.generateIntraTurnFeaturesForConversation(_:), (uint64_t)v12, v0);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v5;
    }
    __break(1u);
    goto LABEL_15;
  }
  if (one-time initialization token for defaultLogger != -1) {
LABEL_15:
  }
    swift_once();
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)defaultLogger);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v10 = 0;
    _os_log_impl(&dword_22D468000, v8, v9, "No feature turns.", v10, 2u);
    MEMORY[0x230F81A50](v10, -1, -1);
  }

  return v0;
}

uint64_t InferredHelpfulnessInference.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InferredHelpfulnessInference.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t closure #1 in AsyncSequence.collect()(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[4] = AssociatedTypeWitness;
  v2[5] = *(void *)(AssociatedTypeWitness - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in AsyncSequence.collect(), 0, 0);
}

uint64_t closure #1 in AsyncSequence.collect()()
{
  (*(void (**)(void, void, void))(v0[5] + 16))(v0[6], v0[3], v0[4]);
  type metadata accessor for Array();
  Array.append(_:)();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t closure #1 in AsyncSequence.flatMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a4;
  v6[7] = a6;
  v6[4] = a2;
  v6[5] = a3;
  v6[3] = a1;
  return MEMORY[0x270FA2498](closure #1 in AsyncSequence.flatMap<A>(_:), 0, 0);
}

uint64_t closure #1 in AsyncSequence.flatMap<A>(_:)()
{
  *(void *)(v0 + 16) = (*(uint64_t (**)(void))(v0 + 40))(*(void *)(v0 + 32));
  type metadata accessor for Array();
  swift_getWitnessTable();
  Array.append<A>(contentsOf:)();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *closure #1 in serialize<A>(_:at:)(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt32 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
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

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for InferredHelpfulnessInference()
{
  return self;
}

uint64_t partial apply for closure #1 in InferredHelpfulnessInference.generateIntraTurnFeatures(_:)(uint64_t a1, void *a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for closure #1 in AsyncSequence.flatMap<A>(_:);
  uint64_t v5[2] = a1;
  v5[3] = *a2;
  return MEMORY[0x270FA2498](closure #1 in InferredHelpfulnessInference.generateIntraTurnFeatures(_:), 0, 0);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
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

uint64_t specialized Array._copyContents(initializing:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return specialized Array._copyContents(initializing:)(a1, a2, a3, (void (*)(void))type metadata accessor for FeaturedTurn, &lazy protocol witness table cache variable for type [FeaturedTurn] and conformance [A], &demangling cache variable for type metadata for [FeaturedTurn], (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))specialized protocol witness for Collection.subscript.read in conformance [A]);
}

uint64_t specialized Array._copyContents(initializing:)(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v15) {
      return a3;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v15) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        uint64_t v19 = lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(a5, a6);
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v15; ++i)
        {
          uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(a6);
          uint64_t v22 = (void (*)(unsigned char *, void))a7(v26, i, a3, v21, v19);
          uint64_t v24 = *v23;
          swift_retain();
          v22(v26, 0);
          *(void *)(a1 + 8 * i) = v24;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v17 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *specialized static IHProtoUtils.generateRequestLink(loggingMetadata:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v52 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v52 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v52 - v16;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v18((char *)&v52 - v16, a1, v5);
  uint64_t v19 = type metadata accessor for ImmutableLoggingMetadata();
  outlined init with copy of UUID?(a1 + *(int *)(v19 + 20), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    outlined destroy of Any?((uint64_t)v4, &demangling cache variable for type metadata for UUID?);
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)defaultLogger);
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_22D468000, v21, v22, "Unable to emit RequestLink for SELF as RequestId is not present in the logging metadata", v23, 2u);
      MEMORY[0x230F81A50](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v15, v4, v5);
  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDB8]), sel_init);
  uint64_t v54 = v15;
  uint64_t v55 = v17;
  if (!v24)
  {
LABEL_14:
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v39 = type metadata accessor for Logger();
    __swift_project_value_buffer(v39, (uint64_t)defaultLogger);
    v18(v12, (uint64_t)v17, v5);
    v18(v9, (uint64_t)v15, v5);
    uint64_t v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v57 = v53;
      *(_DWORD *)uint64_t v42 = 136315394;
      lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
      os_log_t v52 = v40;
      uint64_t v43 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v56 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v44, &v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v45 = *(void (**)(char *, uint64_t))(v6 + 8);
      v45(v12, v5);
      *(_WORD *)(v42 + 12) = 2080;
      uint64_t v46 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v56 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v47, &v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v45(v9, v5);
      os_log_t v48 = v52;
      _os_log_impl(&dword_22D468000, v52, v41, "Unable to create RequestLink schemas for SELF for ihId: %s, and requestId: %s", (uint8_t *)v42, 0x16u);
      uint64_t v49 = v53;
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v49, -1, -1);
      MEMORY[0x230F81A50](v42, -1, -1);

      v45(v54, v5);
      v45(v55, v5);
    }
    else
    {

      v50 = *(void (**)(char *, uint64_t))(v6 + 8);
      v50(v9, v5);
      v50(v12, v5);
      v50(v15, v5);
      v50(v17, v5);
    }
    return 0;
  }
  long long v25 = v24;
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
  if (!v26)
  {
    uint64_t v27 = v25;
LABEL_13:

    uint64_t v15 = v54;
    uint64_t v17 = v55;
    goto LABEL_14;
  }
  uint64_t v27 = v26;
  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
  if (!v28)
  {

    goto LABEL_13;
  }
  uint64_t v29 = v28;
  id v30 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
  uint64_t v31 = v55;
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v33 = objc_msgSend(v30, sel_initWithNSUUID_, isa);

  objc_msgSend(v27, sel_setUuid_, v33);
  objc_msgSend(v27, sel_setComponent_, 10);
  id v34 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
  uint64_t v35 = v54;
  Class v36 = UUID._bridgeToObjectiveC()().super.isa;
  id v37 = objc_msgSend(v34, sel_initWithNSUUID_, v36);

  objc_msgSend(v29, sel_setUuid_, v37);
  objc_msgSend(v29, sel_setComponent_, 1);
  objc_msgSend(v25, sel_setSource_, v27);
  objc_msgSend(v25, sel_setTarget_, v29);

  unint64_t v38 = *(void (**)(char *, uint64_t))(v6 + 8);
  v38(v35, v5);
  v38(v31, v5);
  return v25;
}

void *specialized static IHProtoUtils.generateModelEvalStart(loggingMetadata:contextId:modelId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v43 - v13;
  uint64_t v44 = v9;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v15((char *)v43 - v13, a1, v8);
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E210]), sel_init);
  uint64_t v45 = v14;
  if (v16)
  {
    uint64_t v17 = v16;
    id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E218]), sel_init);
    if (v18)
    {
      uint64_t v19 = v18;
      v43[1] = a2;
      id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E220]), sel_init);
      if (v20)
      {
        uint64_t v21 = v20;
        id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E238]), sel_init);
        if (v22)
        {
          uint64_t v23 = v22;
          if (a4) {
            id v24 = (void *)MEMORY[0x230F80F90](a3, a4);
          }
          else {
            id v24 = 0;
          }
          objc_msgSend(v23, sel_setModelId_, v24);

          id v35 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
          Class v36 = v23;
          Class isa = UUID._bridgeToObjectiveC()().super.isa;
          id v38 = objc_msgSend(v35, sel_initWithNSUUID_, isa);

          objc_msgSend(v21, sel_setContextId_, v38);
          objc_msgSend(v21, sel_setStartedOrChanged_, v36);
          id v39 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
          uint64_t v40 = v45;
          Class v41 = UUID._bridgeToObjectiveC()().super.isa;
          id v42 = objc_msgSend(v39, sel_initWithNSUUID_, v41);

          objc_msgSend(v19, sel_setIhId_, v42);
          objc_msgSend(v17, sel_setEventMetadata_, v19);
          objc_msgSend(v17, sel_setModelEvaluationContext_, v21);

          (*(void (**)(char *, uint64_t))(v44 + 8))(v40, v8);
          return v17;
        }

        uint64_t v17 = v19;
      }
      else
      {
        uint64_t v21 = v19;
      }

      uint64_t v17 = v21;
    }
    uint64_t v14 = v45;
  }
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)defaultLogger);
  v15(v12, (uint64_t)v14, v8);
  id v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v26, v27))
  {
    id v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v47 = v29;
    *(_DWORD *)id v28 = 136315138;
    lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
    uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v46 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v32 = *(void (**)(char *, uint64_t))(v44 + 8);
    v32(v12, v8);
    _os_log_impl(&dword_22D468000, v26, v27, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F81A50](v29, -1, -1);
    MEMORY[0x230F81A50](v28, -1, -1);

    id v33 = v45;
  }
  else
  {

    uint64_t v32 = *(void (**)(char *, uint64_t))(v44 + 8);
    v32(v12, v8);
    id v33 = v14;
  }
  v32(v33, v8);
  return 0;
}

void *specialized static IHProtoUtils.generateModelEvalEnd(loggingMetadata:contextId:ihScoreData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  uint64_t v50 = a2;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v47 - v14;
  uint64_t v51 = v10;
  id v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v47 - v14, a1, v9);
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E210]), sel_init);
  os_log_t v52 = v15;
  if (v17)
  {
    id v18 = v17;
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E218]), sel_init);
    if (v19)
    {
      id v20 = v19;
      id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E240]), sel_init);
      if (v21)
      {
        id v49 = v21;
        id v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E220]), sel_init);
        if (v48)
        {
          id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E228]), sel_init);
          if (v22)
          {
            id v24 = v22;
            if ((a5 & 0x100) == 0)
            {
              LODWORD(v23) = a3;
              objc_msgSend(v49, sel_setScore_, v23);
              if ((a5 & 1) == 0)
              {
                LODWORD(v25) = HIDWORD(a4);
                objc_msgSend(v49, sel_setUpperBoundary_, v25);
              }
              if ((a4 & 1) == 0)
              {
                LODWORD(v25) = HIDWORD(a3);
                objc_msgSend(v49, sel_setLowerBoundary_, v25);
              }
            }
            id v26 = v24;
            id v27 = v49;
            objc_msgSend(v24, sel_setScore_, v49);
            id v28 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
            Class isa = UUID._bridgeToObjectiveC()().super.isa;
            id v30 = objc_msgSend(v28, sel_initWithNSUUID_, isa);

            id v31 = v48;
            objc_msgSend(v48, sel_setContextId_, v30);

            objc_msgSend(v31, sel_setEnded_, v26);
            id v32 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
            id v33 = v52;
            Class v34 = UUID._bridgeToObjectiveC()().super.isa;
            id v35 = objc_msgSend(v32, sel_initWithNSUUID_, v34);

            objc_msgSend(v20, sel_setIhId_, v35);
            objc_msgSend(v18, sel_setEventMetadata_, v20);
            objc_msgSend(v18, sel_setModelEvaluationContext_, v31);

            (*(void (**)(char *, uint64_t))(v51 + 8))(v33, v9);
            return v18;
          }

          id v18 = v20;
          id v36 = v48;
          id v20 = v49;
        }
        else
        {
          id v36 = v49;
        }

        id v18 = v20;
        id v20 = v36;
      }

      id v18 = v20;
    }

    uint64_t v15 = v52;
  }
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v37 = type metadata accessor for Logger();
  __swift_project_value_buffer(v37, (uint64_t)defaultLogger);
  v16(v13, (uint64_t)v15, v9);
  id v38 = Logger.logObject.getter();
  os_log_type_t v39 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v54 = v41;
    *(_DWORD *)uint64_t v40 = 136315138;
    lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
    uint64_t v42 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v43, &v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v44 = *(void (**)(char *, uint64_t))(v51 + 8);
    v44(v13, v9);
    _os_log_impl(&dword_22D468000, v38, v39, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F81A50](v41, -1, -1);
    MEMORY[0x230F81A50](v40, -1, -1);

    uint64_t v45 = v52;
  }
  else
  {

    uint64_t v44 = *(void (**)(char *, uint64_t))(v51 + 8);
    v44(v13, v9);
    uint64_t v45 = v15;
  }
  v44(v45, v9);
  return 0;
}

void *specialized static IHProtoUtils.generateModelEvalFailure(loggingMetadata:contextId:errorCode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v39 - v11;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13((char *)&v39 - v11, a1, v6);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E210]), sel_init);
  uint64_t v40 = v12;
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E218]), sel_init);
    if (v16)
    {
      id v17 = v16;
      uint64_t v39 = a2;
      id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E220]), sel_init);
      if (v18)
      {
        id v19 = v18;
        id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E230]), sel_init);
        if (v20)
        {
          id v21 = v20;
          objc_msgSend(v20, sel_setErrorCode_, a3);
          id v22 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
          Class isa = UUID._bridgeToObjectiveC()().super.isa;
          id v24 = objc_msgSend(v22, sel_initWithNSUUID_, isa);

          objc_msgSend(v19, sel_setContextId_, v24);
          objc_msgSend(v19, sel_setFailed_, v21);
          id v25 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
          id v26 = v40;
          Class v27 = UUID._bridgeToObjectiveC()().super.isa;
          id v28 = objc_msgSend(v25, sel_initWithNSUUID_, v27);

          objc_msgSend(v17, sel_setIhId_, v28);
          objc_msgSend(v15, sel_setEventMetadata_, v17);
          objc_msgSend(v15, sel_setModelEvaluationContext_, v19);

          (*(void (**)(char *, uint64_t))(v7 + 8))(v26, v6);
          return v15;
        }

        uint64_t v15 = v17;
      }
      else
      {
        id v19 = v17;
      }

      uint64_t v15 = v19;
    }
    uint64_t v12 = v40;
  }
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v29 = type metadata accessor for Logger();
  __swift_project_value_buffer(v29, (uint64_t)defaultLogger);
  v13(v10, (uint64_t)v12, v6);
  id v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v30, v31))
  {
    id v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v42 = v33;
    *(_DWORD *)id v32 = 136315138;
    lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
    uint64_t v34 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v35, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    id v36 = *(void (**)(char *, uint64_t))(v7 + 8);
    v36(v10, v6);
    _os_log_impl(&dword_22D468000, v30, v31, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F81A50](v33, -1, -1);
    MEMORY[0x230F81A50](v32, -1, -1);

    uint64_t v37 = v40;
  }
  else
  {

    id v36 = *(void (**)(char *, uint64_t))(v7 + 8);
    v36(v10, v6);
    uint64_t v37 = v12;
  }
  v36(v37, v6);
  return 0;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay23SiriInferredHelpfulness20FeaturedConversationCG_AF06GradedH0Vs5NeverOTg504_s23de52Helpfulness0bC9InferenceC18gradeConversationsSayAA18ih12VGyYaKFAfA08G9H0CXEfU0_AF0efN0CTf1cn_nTf4ng_n(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v26 = a2;
  uint64_t v23 = type metadata accessor for UUID();
  uint64_t v5 = *(void **)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  id v22 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    if (!v7) {
      return v8;
    }
    uint64_t v27 = MEMORY[0x263F8EE78];
    uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0) {
      break;
    }
    uint64_t v10 = 0;
    uint64_t v8 = v27;
    unint64_t v24 = a1 & 0xC000000000000001;
    unint64_t v25 = a1;
    v20[1] = v3;
    id v21 = (void (**)(char *, uint64_t))(v5 + 1);
    while (v7 != v10)
    {
      if (v24)
      {
        uint64_t v11 = MEMORY[0x230F812A0](v10, a1);
      }
      else
      {
        uint64_t v11 = *(void *)(a1 + 8 * v10 + 32);
        swift_retain();
      }
      uint64_t v12 = InferredHelpfulnessInference.gradeInteractionsInternal(_:)(*(void *)(v11 + 32));
      uint64_t v5 = v12;
      if (v12[2])
      {
        uint64_t v13 = v12[7];
        uint64_t v3 = *(void *)(v13 + 24);
        uint64_t v14 = *(void *)(v13 + 32);
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v15 = v22;
        UUID.init()();
        uint64_t v3 = UUID.uuidString.getter();
        uint64_t v14 = v16;
        (*v21)(v15, v23);
      }
      swift_release();
      uint64_t v27 = v8;
      unint64_t v18 = *(void *)(v8 + 16);
      unint64_t v17 = *(void *)(v8 + 24);
      if (v18 >= v17 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v17 > 1, v18 + 1, 1);
        uint64_t v8 = v27;
      }
      ++v10;
      *(void *)(v8 + 16) = v18 + 1;
      id v19 = (void *)(v8 + 24 * v18);
      v19[4] = v3;
      v19[5] = v14;
      v19[6] = v5;
      a1 = v25;
      if (v7 == v10) {
        return v8;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t specialized InferredHelpfulnessInference.generateInterTurnFeatures(_:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SequenceFeatureExtractor();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = &outlined read-only object #0 of InferredHelpfulnessInference.generateInterTurnFeatures(_:);
  uint64_t v40 = inited;
  unint64_t v41 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62) {
    goto LABEL_48;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v7 = 0;
    unint64_t v42 = a1 & 0xC000000000000001;
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8;
    unint64_t v35 = (uint64_t *)(a1 + 32);
    uint64_t v36 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0) {
      uint64_t v8 = a1;
    }
    v33[1] = v8;
    uint64_t v37 = a1;
    id v38 = v4;
    uint64_t v39 = v6;
    while (v42)
    {
      unint64_t v17 = (void *)MEMORY[0x230F812A0](v7, a1);
      BOOL v18 = __OFADD__(v7++, 1);
      if (v18) {
        goto LABEL_45;
      }
LABEL_15:
      uint64_t v19 = v17[4];
      uint64_t v43 = v17[3];
      uint64_t v20 = v17[5];
      outlined init with copy of UUID?((uint64_t)v17 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, (uint64_t)v4);
      id v21 = *(uint64_t (**)(uint64_t))(*v17 + 120);
      uint64_t v22 = swift_bridgeObjectRetain();
      uint64_t v23 = v21(v22);
      type metadata accessor for FeaturedTurnInternal(0);
      unint64_t v24 = (void *)swift_allocObject();
      unint64_t v25 = (char *)v24 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_index;
      *(void *)unint64_t v25 = 0;
      v25[8] = 1;
      *(void *)((char *)v24 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_sortedFeaturedTurns) = a1;
      if (v41)
      {
        swift_bridgeObjectRetain_n();
        swift_retain();
        uint64_t v4 = (char *)_CocoaArrayWrapper.endIndex.getter();
        if (!v4)
        {
LABEL_6:
          swift_bridgeObjectRelease();
          uint64_t v9 = 0;
          char v10 = 1;
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v4 = *(char **)(v36 + 16);
        swift_bridgeObjectRetain_n();
        swift_retain();
        if (!v4) {
          goto LABEL_6;
        }
      }
      if (v42)
      {
        uint64_t v26 = MEMORY[0x230F812A0](0, a1);
      }
      else
      {
        uint64_t v26 = *v35;
        swift_retain();
      }
      if (*(void *)(v26 + 24) != v43 || *(void *)(v26 + 32) != v19)
      {
        uint64_t v34 = v23;
        char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_release();
        if (v27)
        {
          swift_bridgeObjectRelease();
          uint64_t v9 = 0;
          goto LABEL_27;
        }
        if (v4 == (char *)1)
        {
LABEL_41:
          swift_bridgeObjectRelease();
          uint64_t v9 = 0;
          char v10 = 1;
        }
        else
        {
          a1 = 5;
          while (1)
          {
            uint64_t v9 = a1 - 4;
            if (v42)
            {
              uint64_t v28 = MEMORY[0x230F812A0](a1 - 4, v37);
            }
            else
            {
              uint64_t v28 = *(void *)(v37 + 8 * a1);
              swift_retain();
            }
            if (*(void *)(v28 + 24) == v43 && *(void *)(v28 + 32) == v19)
            {
              a1 = v37;
              swift_bridgeObjectRelease();
              swift_release();
              goto LABEL_27;
            }
            char v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_release();
            if (v30) {
              break;
            }
            os_log_type_t v31 = (char *)(a1 - 3);
            if (__OFADD__(v9, 1)) {
              goto LABEL_46;
            }
            ++a1;
            if (v31 == v4)
            {
              a1 = v37;
              goto LABEL_41;
            }
          }
          a1 = v37;
          swift_bridgeObjectRelease();
LABEL_27:
          char v10 = 0;
        }
        uint64_t v4 = v38;
        uint64_t v23 = v34;
        goto LABEL_8;
      }
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v9 = 0;
      char v10 = 0;
LABEL_7:
      uint64_t v4 = v38;
LABEL_8:
      swift_beginAccess();
      *(void *)unint64_t v25 = v9;
      v25[8] = v10;
      swift_release();
      v24[6] = 0;
      v24[7] = 0;
      v24[3] = v43;
      v24[4] = v19;
      v24[5] = v20;
      uint64_t v11 = outlined init with take of UUID?((uint64_t)v4, (uint64_t)v24 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
      v24[2] = v23;
      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*v17 + 144))(v11);
      uint64_t v14 = v13;
      swift_beginAccess();
      v24[6] = v12;
      v24[7] = v14;
      swift_bridgeObjectRelease();
      unint64_t v15 = SequenceFeatureExtractor.extract(from:)((uint64_t)v24);
      uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*v17 + 136))(v44);
      specialized Array.append<A>(contentsOf:)(v15, MEMORY[0x263F740D8], &lazy protocol witness table cache variable for type [Feature] and conformance [A], &demangling cache variable for type metadata for [Feature], (uint64_t *)specialized protocol witness for Collection.subscript.read in conformance [A]);
      v16(v44, 0);
      swift_release();
      swift_release();
      if (v7 == v39) {
        goto LABEL_49;
      }
    }
    if (v7 >= *(void *)(v36 + 16)) {
      goto LABEL_47;
    }
    unint64_t v17 = (void *)v35[v7];
    swift_retain();
    BOOL v18 = __OFADD__(v7++, 1);
    if (!v18) {
      goto LABEL_15;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    swift_bridgeObjectRetain();
  }
LABEL_49:
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22D47BB2C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in InferredHelpfulnessInference.gradeConversations()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = partial apply for closure #1 in InferredHelpfulnessInference.gradeConversations();
  v8[7] = a3;
  v8[8] = v3;
  v8[5] = a1;
  v8[6] = a2;
  return MEMORY[0x270FA2498](closure #1 in InferredHelpfulnessInference.gradeConversations(), 0, 0);
}

uint64_t partial apply for closure #1 in InferredHelpfulnessInference.gradeConversations()()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22D47BD18()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed Conversation, @guaranteed StreamBookmark?) -> (@out Conversation)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = partial apply for closure #1 in AsyncSequence.flatMap<A>(_:);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed Conversation, @guaranteed StreamBookmark?) -> (@out Conversation)
                                                       + async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed Conversation, @guaranteed StreamBookmark?) -> (@out Conversation));
  return v8(a1, a2, v6);
}

uint64_t specialized InferredHelpfulnessInference.generateInterTurnFeaturesForConversation(_:)(uint64_t a1)
{
  unint64_t v27 = MEMORY[0x263F8EE78];
  uint64_t v28 = MEMORY[0x263F8EE78];
  unint64_t v1 = specialized InferredHelpfulnessInference.generateInterTurnFeatures(_:)(a1);
  unint64_t v2 = v1;
  if (v1 >> 62)
  {
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      if (v3 >= 1)
      {
        uint64_t v4 = 0;
        uint64_t v5 = 0;
        uint64_t v6 = 0;
        while (1)
        {
          if ((v2 & 0xC000000000000001) != 0)
          {
            uint64_t v7 = MEMORY[0x230F812A0](v6, v2);
          }
          else
          {
            uint64_t v7 = *(void *)(v2 + 8 * v6 + 32);
            swift_retain();
          }
          uint64_t v8 = *(uint64_t (**)(void))(*(void *)v7 + 144);
          uint64_t v9 = v8();
          if (v10)
          {
            if (v5)
            {
              if (v9 == v4 && v10 == v5)
              {
                swift_bridgeObjectRelease();
                goto LABEL_32;
              }
              char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if (v12) {
                goto LABEL_32;
              }
            }
          }
          else if (!v5)
          {
            goto LABEL_32;
          }
          uint64_t v13 = swift_bridgeObjectRelease();
          uint64_t v4 = ((uint64_t (*)(uint64_t))v8)(v13);
          uint64_t v5 = v14;
          if (v27 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (v21)
            {
LABEL_19:
              type metadata accessor for FeaturedConversation();
              unint64_t v15 = (void *)swift_allocObject();
              v15[4] = v27;
              if (v27 >> 62)
              {
                swift_bridgeObjectRetain();
                if (_CocoaArrayWrapper.endIndex.getter()) {
                  goto LABEL_21;
                }
              }
              else
              {
                uint64_t v16 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                if (v16)
                {
LABEL_21:
                  if ((v27 & 0xC000000000000001) != 0)
                  {
                    uint64_t v23 = MEMORY[0x230F812A0](0, v27);
                    swift_bridgeObjectRelease();
                    uint64_t v19 = *(void *)(v23 + 24);
                    uint64_t v18 = *(void *)(v23 + 32);
                    swift_bridgeObjectRetain();
                    uint64_t v20 = swift_unknownObjectRelease();
                  }
                  else
                  {
                    if (!*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10))
                    {
                      __break(1u);
                      goto LABEL_38;
                    }
                    uint64_t v17 = *(void *)(v27 + 32);
                    swift_retain();
                    swift_bridgeObjectRelease();
                    uint64_t v19 = *(void *)(v17 + 24);
                    uint64_t v18 = *(void *)(v17 + 32);
                    swift_bridgeObjectRetain();
                    uint64_t v20 = swift_release();
                  }
                  goto LABEL_29;
                }
              }
              uint64_t v20 = swift_bridgeObjectRelease();
              uint64_t v19 = 0;
              uint64_t v18 = 0;
LABEL_29:
              v15[2] = v19;
              v15[3] = v18;
              MEMORY[0x230F81080](v20);
              if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
              unint64_t v27 = MEMORY[0x263F8EE78];
            }
          }
          else if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_19;
          }
LABEL_32:
          uint64_t v22 = swift_retain();
          MEMORY[0x230F81080](v22);
          if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          ++v6;
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          swift_release();
          if (v3 == v6)
          {
            swift_bridgeObjectRelease();
            unint64_t v24 = v27;
            goto LABEL_40;
          }
        }
      }
      __break(1u);
      goto LABEL_48;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v24 = MEMORY[0x263F8EE78];
LABEL_40:
  swift_bridgeObjectRelease();
  if (!(v24 >> 62))
  {
    if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_42;
    }
LABEL_45:
    swift_bridgeObjectRelease();
    return v28;
  }
  swift_bridgeObjectRetain();
  uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v25) {
    goto LABEL_45;
  }
LABEL_42:
  type metadata accessor for FeaturedConversation();
  swift_allocObject();
  FeaturedConversation.init(_:)(v24);
  MEMORY[0x230F81080]();
  if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_48:
  }
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  return v28;
}

uint64_t outlined init with copy of StreamBookmarkStore(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22D47C2DC()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t outlined init with take of StreamBookmarkStore(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void partial apply for closure #3 in InferredHelpfulnessInference.gradeConversations()()
{
  closure #3 in InferredHelpfulnessInference.gradeConversations()((void *)(v0 + 16), *(void *)(v0 + 56));
}

uint64_t partial apply for closure #1 in AsyncSequence.flatMap<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v2 + 40);
  *(void *)(v3 + 16) = v7;
  *(void *)uint64_t v7 = v3;
  *(void *)(v7 + 8) = partial apply for closure #1 in AsyncSequence.flatMap<A>(_:);
  *(void *)(v7 + 56) = v6;
  *(_OWORD *)(v7 + 40) = v8;
  *(void *)(v7 + 24) = a1;
  *(void *)(v7 + 32) = a2;
  return MEMORY[0x270FA2498](closure #1 in AsyncSequence.flatMap<A>(_:), 0, 0);
}

uint64_t partial apply for closure #1 in AsyncSequence.collect()(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for closure #1 in InferredHelpfulnessInference.gradeConversations();
  return closure #1 in AsyncSequence.collect()(a1, a2);
}

uint64_t sub_22D47C4B8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 136))();
  *a2 = result;
  return result;
}

uint64_t sub_22D47C504(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 144);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_22D47C558@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 160))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_22D47C5A4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 168);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_22D47C60C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 184))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_22D47C65C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 192))(*a1);
}

uint64_t sub_22D47C6A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 208))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_22D47C6F0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 216);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_22D47C758@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 232))();
  *a2 = result;
  return result;
}

uint64_t sub_22D47C7A4(unsigned int *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 240))(*a1);
}

uint64_t sub_22D47C7EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 256))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_22D47C840(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 264);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void sub_22D47C8B0(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(void **)a1 + 280))();
}

uint64_t sub_22D47C904(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(void **)a2 + 288))(*a1);
}

uint64_t method lookup function for InferredHelpfulnessInference(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InferredHelpfulnessInference);
}

uint64_t dispatch thunk of InferredHelpfulnessInference.classifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.classifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.classifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.modelVersionString.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.modelVersionString.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.modelVersionString.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.emitSelfLogs.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.emitSelfLogs.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.emitSelfLogs.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.streamBookmarkName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.streamBookmarkName.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.streamBookmarkName.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failEval.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failEval.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failEval.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.nullModelVersion.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.nullModelVersion.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.nullModelVersion.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failIHScore.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failIHScore.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failIHScore.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.__allocating_init(streamBookmarkName:emitSelfLogs:trialProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.gradeInteractions()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 312) + **(int **)(*(void *)v0 + 312));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = dispatch thunk of InferredHelpfulnessInference.gradeInteractions();
  return v4();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.gradeInteractions()(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of InferredHelpfulnessInference.gradeConversations()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 320) + **(int **)(*(void *)v0 + 320));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = dispatch thunk of InferredHelpfulnessInference.gradeConversations();
  return v4();
}

void *specialized InferredHelpfulnessInference.generateIntraTurnFeature(_:)()
{
  uint64_t v0 = type metadata accessor for UUID();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v23 = (char *)v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v28 = MEMORY[0x263F8EE78];
  if (one-time initialization token for selfFeatureExtractors != -1) {
    swift_once();
  }
  uint64_t v2 = static InferredHelpfulnessInference.selfFeatureExtractors;
  if ((unint64_t)static InferredHelpfulnessInference.selfFeatureExtractors >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3)
    {
LABEL_5:
      if (v3 < 1)
      {
        __break(1u);
        goto LABEL_23;
      }
      uint64_t v4 = 0;
      do
      {
        if ((v2 & 0xC000000000000001) != 0)
        {
          uint64_t v5 = MEMORY[0x230F812A0](v4, v2);
        }
        else
        {
          uint64_t v5 = *(void *)(v2 + 8 * v4 + 32);
          swift_retain();
        }
        ++v4;
        Turn.events.getter();
        unint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 80))();
        swift_bridgeObjectRelease();
        specialized Array.append<A>(contentsOf:)(v6, MEMORY[0x263F740D8], &lazy protocol witness table cache variable for type [Feature] and conformance [A], &demangling cache variable for type metadata for [Feature], (uint64_t *)specialized protocol witness for Collection.subscript.read in conformance [A]);
        swift_release();
      }
      while (v3 != v4);
      swift_bridgeObjectRelease();
      uint64_t v7 = v28;
      if (!(v28 >> 62)) {
        goto LABEL_12;
      }
LABEL_16:
      swift_bridgeObjectRetain();
      uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_13;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((static InferredHelpfulnessInference.selfFeatureExtractors & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (MEMORY[0x263F8EE78] >> 62) {
    goto LABEL_16;
  }
LABEL_12:
  if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_13:
    type metadata accessor for FeaturedTurn(0);
    unint64_t v8 = Turn.events.getter();
    uint64_t v9 = static FeaturedTurn.from(events:features:)(v8, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v9;
  }
LABEL_17:
  swift_bridgeObjectRelease();
  if (one-time initialization token for defaultLogger != -1) {
LABEL_23:
  }
    swift_once();
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)defaultLogger);
  swift_retain_n();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v27 = v16;
    *(_DWORD *)unint64_t v15 = 136315138;
    v22[1] = v15 + 4;
    uint64_t v17 = v23;
    Turn.turnID.getter();
    lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
    uint64_t v18 = v25;
    uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v18);
    uint64_t v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v21, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D468000, v13, v14, "No features found for turn %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F81A50](v16, -1, -1);
    MEMORY[0x230F81A50](v15, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return 0;
}

uint64_t partial apply for closure #1 in InferredHelpfulnessInference.generateIntraTurnFeaturesForConversation(_:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v6 = *a1;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)*a1 + 152);
  swift_bridgeObjectRetain();
  v7(v5, v4);
  *a2 = v6;
  return swift_retain();
}

uint64_t outlined init with copy of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of ImmutableLoggingMetadata(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ImmutableLoggingMetadata();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *partial apply for closure #4 in InferredHelpfulnessInference.gradeInteractionsInternal(_:)()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(v0 + 32) + 232))();
  return specialized static IHProtoUtils.generateModelEvalFailure(loggingMetadata:contextId:errorCode:)(v1, v2, v3);
}

uint64_t outlined consume of GradedInteraction?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *partial apply for closure #3 in InferredHelpfulnessInference.gradeInteractionsInternal(_:)()
{
  return specialized static IHProtoUtils.generateModelEvalEnd(loggingMetadata:contextId:ihScoreData:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40) & 1 | ((unint64_t)*(unsigned int *)(v0 + 44) << 32), *(unsigned __int8 *)(v0 + 48));
}

void *partial apply for closure #1 in InferredHelpfulnessInference.gradeInteractionsInternal(_:)()
{
  return specialized static IHProtoUtils.generateRequestLink(loggingMetadata:)(*(void *)(v0 + 16));
}

void *partial apply for closure #2 in InferredHelpfulnessInference.gradeInteractionsInternal(_:)()
{
  return closure #2 in InferredHelpfulnessInference.gradeInteractionsInternal(_:)(v0[2], v0[3], v0[4]);
}

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with take of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(unint64_t *a1, uint64_t *a2)
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

void one-time initialization function for nullString()
{
  static CATUtils.nullString = 1819047246;
  unk_268571550 = 0xE400000000000000;
}

uint64_t *CATUtils.nullString.unsafeMutableAddressor()
{
  if (one-time initialization token for nullString != -1) {
    swift_once();
  }
  return &static CATUtils.nullString;
}

uint64_t static CATUtils.nullString.getter()
{
  return static CATUtils.nullString.getter(&one-time initialization token for nullString, &static CATUtils.nullString);
}

uint64_t one-time initialization function for catIdDefault(uint64_t a1)
{
  return one-time initialization function for catIdDefault(a1, &static CATUtils.catIdDefault, &qword_268571560);
}

uint64_t *CATUtils.catIdDefault.unsafeMutableAddressor()
{
  if (one-time initialization token for catIdDefault != -1) {
    swift_once();
  }
  return &static CATUtils.catIdDefault;
}

uint64_t static CATUtils.catIdDefault.getter()
{
  return static CATUtils.nullString.getter(&one-time initialization token for catIdDefault, &static CATUtils.catIdDefault);
}

uint64_t one-time initialization function for speakeasyCategoryDefault(uint64_t a1)
{
  return one-time initialization function for catIdDefault(a1, &static CATUtils.speakeasyCategoryDefault, &qword_268571570);
}

uint64_t one-time initialization function for catIdDefault(uint64_t a1, void *a2, void *a3)
{
  if (one-time initialization token for nullString != -1) {
    swift_once();
  }
  uint64_t v5 = unk_268571550;
  *a2 = static CATUtils.nullString;
  *a3 = v5;
  return swift_bridgeObjectRetain();
}

uint64_t *CATUtils.speakeasyCategoryDefault.unsafeMutableAddressor()
{
  if (one-time initialization token for speakeasyCategoryDefault != -1) {
    swift_once();
  }
  return &static CATUtils.speakeasyCategoryDefault;
}

uint64_t static CATUtils.speakeasyCategoryDefault.getter()
{
  return static CATUtils.nullString.getter(&one-time initialization token for speakeasyCategoryDefault, &static CATUtils.speakeasyCategoryDefault);
}

void one-time initialization function for dialogIdTokenSeparator()
{
  static CATUtils.dialogIdTokenSeparator = 35;
  unk_268571580 = 0xE100000000000000;
}

uint64_t *CATUtils.dialogIdTokenSeparator.unsafeMutableAddressor()
{
  if (one-time initialization token for dialogIdTokenSeparator != -1) {
    swift_once();
  }
  return &static CATUtils.dialogIdTokenSeparator;
}

uint64_t static CATUtils.dialogIdTokenSeparator.getter()
{
  return static CATUtils.nullString.getter(&one-time initialization token for dialogIdTokenSeparator, &static CATUtils.dialogIdTokenSeparator);
}

uint64_t static CATUtils.nullString.getter(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

void *CATUtils.numCatIdTokens.unsafeMutableAddressor()
{
  return &static CATUtils.numCatIdTokens;
}

uint64_t static CATUtils.numCatIdTokens.getter()
{
  return 2;
}

uint64_t static CATUtils.speakeasyCategory(from:by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
    if (v7)
    {
      unint64_t v8 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v6);
    }
    else
    {
      if (one-time initialization token for speakeasyCategoryDefault != -1) {
        swift_once();
      }
      unint64_t v8 = &static CATUtils.speakeasyCategoryDefault;
    }
    uint64_t v9 = *v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (one-time initialization token for speakeasyCategoryDefault != -1) {
      swift_once();
    }
    uint64_t v9 = static CATUtils.speakeasyCategoryDefault;
    swift_bridgeObjectRetain();
  }
  return v9;
}

uint64_t CATUtils.deinit()
{
  return v0;
}

uint64_t CATUtils.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t CATUtils.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t CATUtils.init()()
{
  return v0;
}

uint64_t specialized static CATUtils.classAndUseCase(from:lowercased:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v3)
  {
    if (one-time initialization token for dialogIdTokenSeparator != -1) {
      swift_once();
    }
    lazy protocol witness table accessor for type String and conformance String();
    StringProtocol.components<A>(separatedBy:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<String>);
    lazy protocol witness table accessor for type ArraySlice<String> and conformance ArraySlice<A>();
    uint64_t countAndFlagsBits = BidirectionalCollection<>.joined(separator:)();
    swift_bridgeObjectRelease();
    if (a3)
    {
      uint64_t countAndFlagsBits = String.lowercased()()._countAndFlagsBits;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (one-time initialization token for catIdDefault != -1) {
      swift_once();
    }
    uint64_t countAndFlagsBits = static CATUtils.catIdDefault;
    swift_bridgeObjectRetain();
  }
  return countAndFlagsBits;
}

unint64_t specialized static CATUtils.catIdToSpeakeasyCategory(_:)()
{
  v16[4] = *(id *)MEMORY[0x263EF8340];
  unint64_t v0 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  uint64_t v6 = Data.init(contentsOf:options:)();
  unint64_t v8 = v7;
  uint64_t v9 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v16[0] = 0;
  id v11 = objc_msgSend(v9, sel_JSONObjectWithData_options_error_, isa, 1, v16);

  if (v11)
  {
    id v12 = v16[0];
    _bridgeAnyObjectToAny(_:)();
    outlined consume of Data._Representation(v6, v8);
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      return v15;
    }
  }
  else
  {
    id v13 = v16[0];
    os_log_type_t v14 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    outlined consume of Data._Representation(v6, v8);
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    __swift_project_value_buffer(v1, (uint64_t)defaultLogger);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_22D468000, v2, v3, "Unable to parse CatIdToSpeakeasyCategory", v4, 2u);
      MEMORY[0x230F81A50](v4, -1, -1);
    }
  }
  return v0;
}

unint64_t specialized static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)(void *a1, uint64_t a2)
{
  v55[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v53 = (uint8_t *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v49 - v11;
  specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v52 = __swift_project_value_buffer(v13, (uint64_t)defaultLogger);
  os_log_type_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v50 = a1;
    uint64_t v51 = v12;
    uint64_t v18 = v17;
    v55[0] = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000019, 0x800000022D498EF0, (uint64_t *)v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_22D468000, v14, v15, "Loading CatIdToSpeakeasyCategory from Trial %s", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v18;
    a1 = v50;
    id v12 = v51;
    MEMORY[0x230F81A50](v19, -1, -1);
    MEMORY[0x230F81A50](v16, -1, -1);
  }

  unint64_t v20 = (*(uint64_t (**)(void))(*(void *)a2 + 224))();
  if (!*(void *)(v20 + 16))
  {
    unint64_t v21 = (void *)MEMORY[0x230F80F90](0xD000000000000018, 0x800000022D498ED0);
    uint64_t v22 = (void *)MEMORY[0x230F80F90](1852797802, 0xE400000000000000);
    id v23 = objc_msgSend(a1, sel_URLForResource_withExtension_, v21, v22);

    if (v23)
    {
      uint64_t v24 = v53;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v25 = *(void (**)(char *, uint8_t *, uint64_t))(v8 + 32);
      v25(v6, v24, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
      {
        swift_bridgeObjectRelease();
        v25(v12, (uint8_t *)v6, v7);
        uint64_t v26 = a1;
        uint64_t v27 = Logger.logObject.getter();
        os_log_type_t v28 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = (uint8_t *)swift_slowAlloc();
          char v30 = (void *)swift_slowAlloc();
          uint64_t v51 = v12;
          uint64_t v53 = v29;
          *(_DWORD *)uint64_t v29 = 138412290;
          v55[0] = v26;
          os_log_type_t v31 = v26;
          id v12 = v51;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *char v30 = v26;
          id v32 = v30;

          uint64_t v33 = v53;
          _os_log_impl(&dword_22D468000, v27, v28, "Loading CatIdToSpeakeasyCategory mapping from Bundle %@", v53, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          MEMORY[0x230F81A50](v32, -1, -1);
          MEMORY[0x230F81A50](v33, -1, -1);
        }
        else
        {

          uint64_t v27 = v26;
        }

        unint64_t v20 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
        uint64_t v37 = Data.init(contentsOf:options:)();
        unint64_t v39 = v38;
        uint64_t v40 = v12;
        unint64_t v41 = self;
        Class isa = Data._bridgeToObjectiveC()().super.isa;
        v55[0] = 0;
        id v43 = objc_msgSend(v41, sel_JSONObjectWithData_options_error_, isa, 1, v55);

        if (v43)
        {
          id v44 = v55[0];
          _bridgeAnyObjectToAny(_:)();
          outlined consume of Data._Representation(v37, v39);
          swift_unknownObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
          if (swift_dynamicCast())
          {
            swift_bridgeObjectRelease();
            unint64_t v20 = v54;
          }
          uint64_t v45 = v40;
        }
        else
        {
          id v47 = v55[0];
          id v48 = (void *)_convertNSErrorToError(_:)();

          swift_willThrow();
          outlined consume of Data._Representation(v37, v39);
          uint64_t v45 = v40;
          uint64_t v34 = Logger.logObject.getter();
          os_log_type_t v35 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v34, v35))
          {
            uint64_t v36 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v36 = 0;
            _os_log_impl(&dword_22D468000, v34, v35, "Unable to parse CatIdToSpeakeasyCategory", v36, 2u);
            MEMORY[0x230F81A50](v36, -1, -1);
          }
        }
        (*(void (**)(char *, uint64_t))(v8 + 8))(v45, v7);
        return v20;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    }
    outlined destroy of URL?((uint64_t)v6);
  }
  return v20;
}

uint64_t type metadata accessor for CATUtils()
{
  return self;
}

uint64_t method lookup function for CATUtils(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CATUtils);
}

uint64_t dispatch thunk of CATUtils.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t lazy protocol witness table accessor for type ArraySlice<String> and conformance ArraySlice<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<String>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>);
  }
  return result;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ImmutableLoggingMetadata.init(ihID:requestID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t v7 = a3 + *(int *)(type metadata accessor for ImmutableLoggingMetadata() + 20);
  return outlined init with take of UUID?(a2, v7);
}

uint64_t type metadata accessor for ImmutableLoggingMetadata()
{
  uint64_t result = type metadata singleton initialization cache for ImmutableLoggingMetadata;
  if (!type metadata singleton initialization cache for ImmutableLoggingMetadata) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *static IHProtoUtils.generateRequestLink(loggingMetadata:)(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(a1, v2);
  return specialized static IHProtoUtils.generateRequestLink(loggingMetadata:)((uint64_t)v4, v1, v2, v3);
}

void *static IHProtoUtils.generateModelEvalStart(loggingMetadata:contextId:modelId:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(a1, v8);
  return specialized static IHProtoUtils.generateModelEvalStart(loggingMetadata:contextId:modelId:)((uint64_t)v10, a2, a3, a4, v4, v8, v9);
}

void __swiftcall IHProtoUtils.IHScores.init(score:)(SiriInferredHelpfulness::IHProtoUtils::IHScores *__return_ptr retstr, Swift::Float score)
{
}

void *static IHProtoUtils.generateModelEvalEnd(loggingMetadata:contextId:ihScoreData:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  id v12 = __swift_project_boxed_opaque_existential_1(a1, v10);
  return specialized static IHProtoUtils.generateModelEvalEnd(loggingMetadata:contextId:ihScoreData:)((uint64_t)v12, a2, a3, a4, a5 & 0x1FF, v5, v10, v11);
}

void *static IHProtoUtils.generateModelEvalFailure(loggingMetadata:contextId:errorCode:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = __swift_project_boxed_opaque_existential_1(a1, v6);
  return specialized static IHProtoUtils.generateModelEvalFailure(loggingMetadata:contextId:errorCode:)((uint64_t)v8, a2, a3, v3, v6, v7);
}

uint64_t ImmutableLoggingMetadata.ihID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t ImmutableLoggingMetadata.requestID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ImmutableLoggingMetadata() + 20);
  return outlined init with copy of UUID?(v3, a1);
}

uint64_t protocol witness for LoggingMetadata.ihID.getter in conformance ImmutableLoggingMetadata@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t protocol witness for LoggingMetadata.requestID.getter in conformance ImmutableLoggingMetadata@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return outlined init with copy of UUID?(v2 + *(int *)(a1 + 20), a2);
}

void IHProtoUtils.IHScores.score.setter(float a1)
{
  float *v1 = a1;
}

uint64_t (*IHProtoUtils.IHScores.score.modify())()
{
  return FlowClientFeatureExtractor.__ivar_destroyer;
}

unint64_t IHProtoUtils.IHScores.lower.getter(unsigned int a1, char a2)
{
  return a1 | ((unint64_t)(a2 & 1) << 32);
}

uint64_t IHProtoUtils.IHScores.lower.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 4)  = result;
  *(unsigned char *)(v1 + 8)  = BYTE4(result) & 1;
  return result;
}

uint64_t (*IHProtoUtils.IHScores.lower.modify())()
{
  return FlowClientFeatureExtractor.__ivar_destroyer;
}

uint64_t IHProtoUtils.IHScores.upper.getter(uint64_t a1, uint64_t a2, char a3)
{
  *((void *)&v4 + 1)  = a3 & 1;
  *(void *)&long long v4 = a2;
  return v4 >> 32;
}

uint64_t IHProtoUtils.IHScores.upper.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 12)  = result;
  *(unsigned char *)(v1 + 16)  = BYTE4(result) & 1;
  return result;
}

uint64_t (*IHProtoUtils.IHScores.upper.modify())()
{
  return FlowClientFeatureExtractor.__ivar_destroyer;
}

void __swiftcall IHProtoUtils.IHScores.init(score:upper:lower:)(SiriInferredHelpfulness::IHProtoUtils::IHScores *__return_ptr retstr, Swift::Float score, Swift::Float upper, Swift::Float lower)
{
}

uint64_t IHProtoUtils.deinit()
{
  return v0;
}

uint64_t IHProtoUtils.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t IHProtoUtils.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t IHProtoUtils.init()()
{
  return v0;
}

void *specialized static IHProtoUtils.generateRequestLink(loggingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v54[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v54[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = &v54[-v15];
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = &v54[-v18];
  MEMORY[0x270FA5388](v17);
  unint64_t v21 = &v54[-v20];
  (*(void (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    outlined destroy of UUID?((uint64_t)v8);
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    __swift_project_value_buffer(v22, (uint64_t)defaultLogger);
    id v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_22D468000, v23, v24, "Unable to emit RequestLink for SELF as RequestId is not present in the logging metadata", v25, 2u);
      MEMORY[0x230F81A50](v25, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v21, v9);
    return 0;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v19, v8, v9);
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDB8]), sel_init);
  uint64_t v58 = v19;
  if (!v26)
  {
LABEL_14:
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v40 = type metadata accessor for Logger();
    __swift_project_value_buffer(v40, (uint64_t)defaultLogger);
    unint64_t v41 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16);
    v41(v16, v21, v9);
    v41(v13, v19, v9);
    unint64_t v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.error.getter();
    int v44 = v43;
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      uint64_t v60 = v56;
      *(_DWORD *)uint64_t v45 = 136315394;
      lazy protocol witness table accessor for type UUID and conformance UUID();
      int v55 = v44;
      uint64_t v46 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v47, &v60);
      uint64_t v57 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      id v48 = *(void (**)(unsigned char *, uint64_t))(v10 + 8);
      v48(v16, v9);
      *(_WORD *)(v45 + 12)  = 2080;
      uint64_t v49 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v50, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v48(v13, v9);
      _os_log_impl(&dword_22D468000, v42, (os_log_type_t)v55, "Unable to create RequestLink schemas for SELF for ihId: %s, and requestId: %s", (uint8_t *)v45, 0x16u);
      uint64_t v51 = v56;
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v51, -1, -1);
      MEMORY[0x230F81A50](v45, -1, -1);

      v48(v58, v9);
      v48(v57, v9);
    }
    else
    {

      uint64_t v52 = *(void (**)(unsigned char *, uint64_t))(v10 + 8);
      v52(v13, v9);
      v52(v16, v9);
      v52(v19, v9);
      v52(v21, v9);
    }
    return 0;
  }
  uint64_t v27 = v26;
  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
  if (!v28)
  {
    uint64_t v29 = v27;
LABEL_13:

    uint64_t v19 = v58;
    goto LABEL_14;
  }
  uint64_t v29 = v28;
  id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
  if (!v30)
  {

    goto LABEL_13;
  }
  os_log_type_t v31 = v30;
  id v32 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v34 = objc_msgSend(v32, sel_initWithNSUUID_, isa);

  uint64_t v57 = v21;
  objc_msgSend(v29, sel_setUuid_, v34);

  objc_msgSend(v29, sel_setComponent_, 10);
  id v35 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
  uint64_t v36 = v58;
  Class v37 = UUID._bridgeToObjectiveC()().super.isa;
  id v38 = objc_msgSend(v35, sel_initWithNSUUID_, v37);

  objc_msgSend(v31, sel_setUuid_, v38);
  objc_msgSend(v31, sel_setComponent_, 1);
  objc_msgSend(v27, sel_setSource_, v29);
  objc_msgSend(v27, sel_setTarget_, v31);

  unint64_t v39 = *(void (**)(unsigned char *, uint64_t))(v10 + 8);
  v39(v36, v9);
  v39(v57, v9);
  return v27;
}

void *specialized static IHProtoUtils.generateModelEvalStart(loggingMetadata:contextId:modelId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v47 - v16;
  (*(void (**)(uint64_t, uint64_t))(a7 + 8))(a6, a7);
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E210]), sel_init);
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E218]), sel_init);
    if (v20)
    {
      unint64_t v21 = v20;
      uint64_t v48 = v11;
      id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E220]), sel_init);
      if (v22)
      {
        id v23 = v22;
        id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E238]), sel_init);
        if (v24)
        {
          uint64_t v25 = v24;
          if (a4) {
            id v26 = (void *)MEMORY[0x230F80F90](a3, a4);
          }
          else {
            id v26 = 0;
          }
          uint64_t v40 = v25;
          objc_msgSend(v25, sel_setModelId_, v26);

          id v41 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
          Class isa = UUID._bridgeToObjectiveC()().super.isa;
          id v43 = objc_msgSend(v41, sel_initWithNSUUID_, isa);

          objc_msgSend(v23, sel_setContextId_, v43);
          objc_msgSend(v23, sel_setStartedOrChanged_, v40);
          id v44 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
          Class v45 = UUID._bridgeToObjectiveC()().super.isa;
          id v46 = objc_msgSend(v44, sel_initWithNSUUID_, v45);

          objc_msgSend(v21, sel_setIhId_, v46);
          objc_msgSend(v19, sel_setEventMetadata_, v21);
          objc_msgSend(v19, sel_setModelEvaluationContext_, v23);

          (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v48);
          return v19;
        }

        uint64_t v19 = v21;
      }
      else
      {
        id v23 = v21;
      }

      uint64_t v19 = v23;
      uint64_t v11 = v48;
    }
  }
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v27 = type metadata accessor for Logger();
  __swift_project_value_buffer(v27, (uint64_t)defaultLogger);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  id v28 = Logger.logObject.getter();
  uint64_t v29 = v17;
  uint64_t v30 = v11;
  os_log_type_t v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v48 = (uint64_t)v29;
    uint64_t v33 = (uint8_t *)v32;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v50 = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    lazy protocol witness table accessor for type UUID and conformance UUID();
    uint64_t v35 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v36, &v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    Class v37 = *(void (**)(char *, uint64_t))(v12 + 8);
    v37(v15, v30);
    _os_log_impl(&dword_22D468000, v28, v31, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F81A50](v34, -1, -1);
    MEMORY[0x230F81A50](v33, -1, -1);

    id v38 = (char *)v48;
  }
  else
  {

    Class v37 = *(void (**)(char *, uint64_t))(v12 + 8);
    v37(v15, v30);
    id v38 = v29;
  }
  v37(v38, v30);
  return 0;
}

void *specialized static IHProtoUtils.generateModelEvalEnd(loggingMetadata:contextId:ihScoreData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v52 = a2;
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v50 - v18;
  (*(void (**)(uint64_t, uint64_t))(a8 + 8))(a7, a8);
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E210]), sel_init);
  if (v20)
  {
    unint64_t v21 = v20;
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E218]), sel_init);
    if (v22)
    {
      id v23 = v22;
      uint64_t v53 = v19;
      id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E240]), sel_init);
      if (v24)
      {
        id v25 = v24;
        id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E220]), sel_init);
        if (v51)
        {
          id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E228]), sel_init);
          if (v26)
          {
            id v28 = v26;
            if ((a5 & 0x100) == 0)
            {
              LODWORD(v27)  = a3;
              objc_msgSend(v25, sel_setScore_, v27);
              if ((a5 & 1) == 0)
              {
                LODWORD(v29)  = HIDWORD(a4);
                objc_msgSend(v25, sel_setUpperBoundary_, v29);
              }
              if ((a4 & 1) == 0)
              {
                LODWORD(v29)  = HIDWORD(a3);
                objc_msgSend(v25, sel_setLowerBoundary_, v29);
              }
            }
            uint64_t v30 = v28;
            objc_msgSend(v28, sel_setScore_, v25);
            id v31 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
            Class isa = UUID._bridgeToObjectiveC()().super.isa;
            id v33 = objc_msgSend(v31, sel_initWithNSUUID_, isa);

            id v34 = v51;
            objc_msgSend(v51, sel_setContextId_, v33);

            objc_msgSend(v34, sel_setEnded_, v30);
            id v35 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
            unint64_t v36 = v53;
            Class v37 = UUID._bridgeToObjectiveC()().super.isa;
            id v38 = objc_msgSend(v35, sel_initWithNSUUID_, v37);

            objc_msgSend(v23, sel_setIhId_, v38);
            objc_msgSend(v21, sel_setEventMetadata_, v23);
            objc_msgSend(v21, sel_setModelEvaluationContext_, v34);

            (*(void (**)(char *, uint64_t))(v14 + 8))(v36, v13);
            return v21;
          }

          unint64_t v21 = v23;
          id v23 = v25;
          id v25 = v51;
        }

        unint64_t v21 = v23;
        id v23 = v25;
      }
      uint64_t v19 = v53;

      unint64_t v21 = v23;
    }
  }
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v39 = type metadata accessor for Logger();
  __swift_project_value_buffer(v39, (uint64_t)defaultLogger);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  uint64_t v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v40, v41))
  {
    unint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v53 = v19;
    uint64_t v44 = v43;
    uint64_t v55 = v43;
    *(_DWORD *)unint64_t v42 = 136315138;
    lazy protocol witness table accessor for type UUID and conformance UUID();
    uint64_t v45 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v47 = *(void (**)(char *, uint64_t))(v14 + 8);
    v47(v17, v13);
    _os_log_impl(&dword_22D468000, v40, v41, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F81A50](v44, -1, -1);
    MEMORY[0x230F81A50](v42, -1, -1);

    uint64_t v48 = v53;
  }
  else
  {

    uint64_t v47 = *(void (**)(char *, uint64_t))(v14 + 8);
    v47(v17, v13);
    uint64_t v48 = v19;
  }
  v47(v48, v13);
  return 0;
}

void *specialized static IHProtoUtils.generateModelEvalFailure(loggingMetadata:contextId:errorCode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v40 - v14;
  (*(void (**)(uint64_t, uint64_t))(a6 + 8))(a5, a6);
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E210]), sel_init);
  if (v16)
  {
    uint64_t v17 = v16;
    id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E218]), sel_init);
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E220]), sel_init);
      if (v20)
      {
        unint64_t v21 = v20;
        os_log_type_t v41 = (char *)v9;
        id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E230]), sel_init);
        if (v22)
        {
          id v23 = v22;
          objc_msgSend(v22, sel_setErrorCode_, a3);
          id v24 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
          Class isa = UUID._bridgeToObjectiveC()().super.isa;
          id v26 = objc_msgSend(v24, sel_initWithNSUUID_, isa);

          objc_msgSend(v21, sel_setContextId_, v26);
          objc_msgSend(v21, sel_setFailed_, v23);
          id v27 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
          Class v28 = UUID._bridgeToObjectiveC()().super.isa;
          id v29 = objc_msgSend(v27, sel_initWithNSUUID_, v28);

          objc_msgSend(v19, sel_setIhId_, v29);
          objc_msgSend(v17, sel_setEventMetadata_, v19);
          objc_msgSend(v17, sel_setModelEvaluationContext_, v21);

          (*(void (**)(char *, char *))(v10 + 8))(v15, v41);
          return v17;
        }

        uint64_t v17 = v19;
        uint64_t v9 = (uint64_t)v41;
      }
      else
      {
        unint64_t v21 = v19;
      }

      uint64_t v17 = v21;
    }
  }
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v30 = type metadata accessor for Logger();
  __swift_project_value_buffer(v30, (uint64_t)defaultLogger);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  id v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v31, v32))
  {
    id v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v43 = v34;
    *(_DWORD *)id v33 = 136315138;
    os_log_type_t v41 = v15;
    lazy protocol witness table accessor for type UUID and conformance UUID();
    uint64_t v35 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v42 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v36, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    Class v37 = *(void (**)(char *, uint64_t))(v10 + 8);
    v37(v13, v9);
    _os_log_impl(&dword_22D468000, v31, v32, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F81A50](v34, -1, -1);
    MEMORY[0x230F81A50](v33, -1, -1);

    id v38 = v41;
  }
  else
  {

    Class v37 = *(void (**)(char *, uint64_t))(v10 + 8);
    v37(v13, v9);
    id v38 = v15;
  }
  v37(v38, v9);
  return 0;
}

void specialized static IHProtoUtils.emitAndLogEvent(createMessageClosure:messageName:)(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = a1();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    objc_msgSend(objc_msgSend(self, sel_sharedStream), sel_emitMessage_, v6);
    swift_unknownObjectRelease();
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)defaultLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v18 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22D468000, v9, v10, "Logged %s event", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v12, -1, -1);
      MEMORY[0x230F81A50](v11, -1, -1);

      return;
    }
  }
  else
  {
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)defaultLogger);
    swift_bridgeObjectRetain_n();
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = v17;
      *(_DWORD *)id v16 = 136315138;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22D468000, v14, v15, "Failed to log %s event", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v17, -1, -1);
      MEMORY[0x230F81A50](v16, -1, -1);

      return;
    }
  }
  swift_bridgeObjectRelease_n();
}

uint64_t dispatch thunk of LoggingMetadata.ihID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of LoggingMetadata.requestID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t *initializeBufferWithCopyOfBuffer for ImmutableLoggingMetadata(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1  = *a2;
    a1  = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v11, (uint64_t *)v12, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for ImmutableLoggingMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v4);
  }
  return result;
}

char *initializeWithCopy for ImmutableLoggingMetadata(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for ImmutableLoggingMetadata(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(&a1[v9], 1, v6);
  int v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

char *initializeWithTake for ImmutableLoggingMetadata(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for ImmutableLoggingMetadata(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(&a1[v9], 1, v6);
  int v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ImmutableLoggingMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D480ED8);
}

uint64_t sub_22D480ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for ImmutableLoggingMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D480FE8);
}

uint64_t sub_22D480FE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void type metadata completion function for ImmutableLoggingMetadata()
{
  type metadata accessor for UUID();
  if (v0 <= 0x3F)
  {
    type metadata accessor for UUID?();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void type metadata accessor for UUID?()
{
  if (!lazy cache variable for type metadata for UUID?)
  {
    type metadata accessor for UUID();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for UUID?);
    }
  }
}

uint64_t type metadata accessor for IHProtoUtils()
{
  return self;
}

uint64_t method lookup function for IHProtoUtils(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IHProtoUtils);
}

uint64_t dispatch thunk of IHProtoUtils.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

__n128 __swift_memcpy17_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0]  = a2[1].n128_u8[0];
  *a1  = result;
  return result;
}

uint64_t getEnumTagSinglePayload for IHProtoUtils.IHScores(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for IHProtoUtils.IHScores(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 16)  = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8)  = 0;
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
  *(unsigned char *)(result + 17)  = v3;
  return result;
}

ValueMetadata *type metadata accessor for IHProtoUtils.IHScores()
{
  return &type metadata for IHProtoUtils.IHScores;
}

unint64_t lazy protocol witness table accessor for type UUID and conformance UUID()
{
  unint64_t result = lazy protocol witness table cache variable for type UUID and conformance UUID;
  if (!lazy protocol witness table cache variable for type UUID and conformance UUID)
  {
    type metadata accessor for UUID();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID);
  }
  return result;
}

uint64_t outlined destroy of UUID?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ASRFeatureExtractor.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ASRFeatureExtractor.extract(from:)(unint64_t a1)
{
  unint64_t v2 = type metadata accessor for Confidence();
  unint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (unint64_t *)((char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v79 = (char *)&v73 - v7;
  uint64_t v101 = MEMORY[0x263F8EE78];
  unint64_t v8 = specialized static ASRFeatureExtractor.asrPackageEvents(from:)(a1);
  if (one-time initialization token for defaultLogger != -1) {
    goto LABEL_90;
  }
LABEL_2:
  uint64_t v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)defaultLogger);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  BOOL v12 = os_log_type_enabled(v10, v11);
  unint64_t v13 = v8 >> 62;
  unint64_t v81 = v2;
  v80  = v6;
  if (v12)
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 134217984;
    if (v13)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v99 = (void *)v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D468000, v10, v11, "ASR final package events count: %ld", v14, 0xCu);
    MEMORY[0x230F81A50](v14, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v16 = specialized static ASRFeatureExtractor.asrRecognitionResultTier1Events(from:)(a1);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.debug.getter();
  BOOL v19 = os_log_type_enabled(v17, v18);
  unint64_t v20 = v16 >> 62;
  unint64_t v87 = v16;
  if (v19)
  {
    unint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v21 = 134217984;
    unint64_t v22 = v87;
    if (v20)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((v87 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v99 = (void *)v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D468000, v17, v18, "ASR recognition events count: %ld", v21, 0xCu);
    MEMORY[0x230F81A50](v21, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    unint64_t v22 = v16;
  }
  if (v13)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v24)
    {
LABEL_92:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    uint64_t v24 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v24) {
      goto LABEL_92;
    }
  }
  uint64_t v89 = v22 & 0xFFFFFFFFFFFFFF8;
  if (v20)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  a1  = 0;
  unint64_t v82 = v8 & 0xC000000000000001;
  uint64_t v74 = v8 & 0xFFFFFFFFFFFFFF8;
  unint64_t v73 = v8 + 32;
  unint64_t v26 = v22 & 0xC000000000000001;
  unint64_t v88 = v22 + 32;
  unint64_t v2 = *MEMORY[0x263F73EB0];
  uint64_t v6 = (void *)(v3 + 104);
  uint64_t v76 = (void (**)(void *, char *, unint64_t))(v3 + 16);
  uint64_t v75 = (uint64_t (**)(char *, unint64_t))(v3 + 8);
  unint64_t v90 = v22 & 0xC000000000000001;
  uint64_t v91 = v25;
  unint64_t v78 = v8;
  uint64_t v77 = v24;
  unsigned int v86 = v2;
  v85  = (void *)(v3 + 104);
  while (1)
  {
    if (v82)
    {
      id v27 = (id)MEMORY[0x230F812A0](a1, v8);
      BOOL v28 = __OFADD__(a1++, 1);
      if (v28) {
        goto LABEL_88;
      }
    }
    else
    {
      if (a1 >= *(void *)(v74 + 16)) {
        goto LABEL_89;
      }
      id v27 = *(id *)(v73 + 8 * a1);
      BOOL v28 = __OFADD__(a1++, 1);
      if (v28) {
        goto LABEL_88;
      }
    }
    unint64_t v84 = a1;
    unint64_t v3 = (unint64_t)v27;
    id v29 = objc_msgSend(v27, sel_package, v73);
    id v30 = objc_msgSend(v29, sel_postItn);

    unint64_t v2 = (unint64_t)&unk_2649AE000;
    id v92 = objc_msgSend(v30, sel_linkId);

    id v83 = (id)v3;
    specialized static ASRFeatureExtractor.bestTokensIndices(asrFinalPackageEvent:)((void *)v3);
    os_log_type_t v32 = v31;
    if (v25) {
      break;
    }
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
    unint64_t v8 = MEMORY[0x263F8EE78];
LABEL_75:
    swift_bridgeObjectRelease();
    uint64_t v99 = (void *)v8;
    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    v97  = lazy protocol witness table accessor for type [String] and conformance [A]();
    unint64_t v98 = v60;
    uint64_t v61 = BidirectionalCollection<>.joined(separator:)();
    v63  = v62;
    swift_bridgeObjectRelease();
    uint64_t v64 = v79;
    unint64_t v65 = v81;
    uint64_t v96 = (char *)*v85;
    ((void (*)(char *, void, unint64_t))v96)(v79, v86, v81);
    type metadata accessor for BestPostITNUtterance(0);
    swift_allocObject();
    uint64_t v99 = (void *)v61;
    uint64_t v100 = v63;
    uint64_t v66 = v80;
    uint64_t v95 = *v76;
    v95(v80, v64, v65);
    TypedFeature.init(value:confidence:)();
    unint64_t v94 = *v75;
    uint64_t v67 = v94(v64, v65);
    MEMORY[0x230F81080](v67);
    unint64_t v2 = *(void *)((v101 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2 >= *(void *)((v101 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    uint64_t v99 = v6;
    uint64_t v68 = BidirectionalCollection<>.joined(separator:)();
    uint64_t v70 = v69;
    swift_bridgeObjectRelease();
    uint64_t v6 = v85;
    ((void (*)(char *, void, unint64_t))v96)(v64, v86, v65);
    type metadata accessor for BestASRPhoneticSequence(0);
    unint64_t v3 = swift_allocObject();
    uint64_t v99 = (void *)v68;
    uint64_t v100 = v70;
    v95(v66, v64, v65);
    TypedFeature.init(value:confidence:)();
    uint64_t v71 = v94(v64, v65);
    MEMORY[0x230F81080](v71);
    if (*(void *)((v101 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v101 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();

    a1  = v84;
    unint64_t v8 = v78;
    unint64_t v22 = v87;
    unint64_t v26 = v90;
    uint64_t v25 = v91;
    if (v84 == v77) {
      goto LABEL_85;
    }
  }
  swift_bridgeObjectRetain();
  a1  = 0;
  uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  unint64_t v8 = MEMORY[0x263F8EE78];
  id v33 = v92;
  uint64_t v95 = v32;
  while (1)
  {
    if (v26)
    {
      uint64_t v34 = (uint64_t (*)(char *, unint64_t))MEMORY[0x230F812A0](a1, v22);
      BOOL v28 = __OFADD__(a1++, 1);
      if (v28) {
        goto LABEL_86;
      }
    }
    else
    {
      if (a1 >= *(void *)(v89 + 16)) {
        goto LABEL_87;
      }
      uint64_t v34 = (uint64_t (*)(char *, unint64_t))*(id *)(v88 + 8 * a1);
      BOOL v28 = __OFADD__(a1++, 1);
      if (v28)
      {
LABEL_86:
        __break(1u);
LABEL_87:
        __break(1u);
LABEL_88:
        __break(1u);
LABEL_89:
        __break(1u);
LABEL_90:
        swift_once();
        goto LABEL_2;
      }
    }
    unint64_t v93 = a1;
    unint64_t v94 = v34;
    id v35 = [v34 *(SEL *)(v2 + 1064)];
    if (v35) {
      break;
    }
    if (!v33) {
      goto LABEL_38;
    }
LABEL_26:

LABEL_27:
    id v33 = v92;
LABEL_28:
    a1  = v93;
    if (v93 == v25)
    {
      swift_bridgeObjectRelease();
      goto LABEL_75;
    }
  }
  unint64_t v36 = v35;
  if (!v33)
  {

    goto LABEL_28;
  }
  type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for SISchemaUUID);
  unint64_t v3 = (unint64_t)v33;
  id v37 = v36;
  char v38 = static NSObject.== infix(_:_:)();

  if ((v38 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_38:
  id v39 = objc_msgSend(v94, sel_tokens);
  if (v39)
  {
    uint64_t v40 = v39;
    type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for ASRSchemaASRTokenTier1);
    uint64_t v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v41 = 0;
  }
  uint64_t v96 = (char *)*((void *)v32 + 2);
  if (!v96)
  {

    swift_bridgeObjectRelease();
    unint64_t v26 = v90;
    uint64_t v25 = v91;
    goto LABEL_27;
  }
  v97  = v41 & 0xFFFFFFFFFFFFFF8;
  unint64_t v98 = v41 & 0xC000000000000001;
  uint64_t v42 = v41 + 32;
  swift_bridgeObjectRetain();
  uint64_t v43 = 0;
  while (1)
  {
    unint64_t v44 = *((void *)v32 + (void)v43 + 4);
    if (!v41)
    {
LABEL_51:
      uint64_t v47 = 0;
      unint64_t v49 = 0xE000000000000000;
      goto LABEL_52;
    }
    if (v98)
    {
      swift_bridgeObjectRetain();
      id v45 = (id)MEMORY[0x230F812A0](v44, v41);
      swift_bridgeObjectRelease();
      goto LABEL_49;
    }
    if ((v44 & 0x8000000000000000) != 0) {
      break;
    }
    if (v44 >= *(void *)(v97 + 16)) {
      goto LABEL_82;
    }
    id v45 = *(id *)(v42 + 8 * v44);
LABEL_49:
    id v46 = objc_msgSend(v45, sel_text);

    if (!v46) {
      goto LABEL_51;
    }
    uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v49 = v48;

LABEL_52:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v8 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v8 + 16) + 1, 1, (void *)v8);
    }
    unint64_t v51 = *(void *)(v8 + 16);
    unint64_t v50 = *(void *)(v8 + 24);
    if (v51 >= v50 >> 1) {
      unint64_t v8 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v50 > 1), v51 + 1, 1, (void *)v8);
    }
    *(void *)(v8 + 16)  = v51 + 1;
    unint64_t v52 = v8 + 16 * v51;
    *(void *)(v52 + 32)  = v47;
    *(void *)(v52 + 40)  = v49;
    if (!v41) {
      goto LABEL_63;
    }
    if (v98)
    {
      swift_bridgeObjectRetain();
      id v53 = (id)MEMORY[0x230F812A0](v44, v41);
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v44 & 0x8000000000000000) != 0) {
        goto LABEL_83;
      }
      if (v44 >= *(void *)(v97 + 16)) {
        goto LABEL_84;
      }
      id v53 = *(id *)(v42 + 8 * v44);
    }
    id v54 = objc_msgSend(v53, sel_phoneSequence);

    if (v54)
    {
      uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v57 = v56;
    }
    else
    {
LABEL_63:
      uint64_t v55 = 0;
      unint64_t v57 = 0xE000000000000000;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6[2] + 1, 1, v6);
    }
    unint64_t v3 = v6[2];
    unint64_t v58 = v6[3];
    if (v3 >= v58 >> 1) {
      uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v58 > 1), v3 + 1, 1, v6);
    }
    ++v43;
    v6[2]  = v3 + 1;
    uint64_t v59 = &v6[2 * v3];
    v59[4]  = v55;
    v59[5]  = v57;
    os_log_type_t v32 = v95;
    if (v96 == v43)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      unint64_t v22 = v87;
      unint64_t v26 = v90;
      uint64_t v25 = v91;
      unint64_t v2 = 0x2649AE000;
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v101;
}

uint64_t BestPostITNUtterance.__allocating_init(value:confidence:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  v12[0]  = a1;
  v12[1]  = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
  uint64_t v10 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a3, v6);
  return v10;
}

uint64_t ASRFeatureExtractor.init()()
{
  return v0;
}

uint64_t ASRFeatureExtractor.deinit()
{
  return v0;
}

uint64_t ASRFeatureExtractor.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t BestPostITNUtterance.__deallocating_deinit()
{
  uint64_t v0 = TypedFeature.deinit();
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to BestPostITNUtterance.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to BestPostITNUtterance.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for BestPostITNUtterance);
}

uint64_t BestPostITNUtterance.init(value:confidence:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v11[0]  = a1;
  v11[1]  = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  uint64_t v9 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a3, v6);
  return v9;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to BestASRPhoneticSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to BestPostITNUtterance.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for BestASRPhoneticSequence);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to BestPostITNUtterance.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  uint64_t v10 = a1[1];
  a3(0);
  swift_allocObject();
  v14[0]  = v11;
  v14[1]  = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t v12 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v12;
}

uint64_t specialized static ASRFeatureExtractor.asrPackageEvents(from:)(unint64_t a1)
{
  unint64_t v1 = a1;
  uint64_t v23 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_25;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    unint64_t v5 = v1 & 0xC000000000000001;
    uint64_t v6 = (SEL *)&unk_2649AE000;
    uint64_t v7 = (SEL *)&unk_2649AE000;
    unint64_t v22 = v1;
    while (1)
    {
      if (v5) {
        id v8 = (id)MEMORY[0x230F812A0](v4, v1);
      }
      else {
        id v8 = *(id *)(v1 + 8 * v4 + 32);
      }
      uint64_t v9 = v8;
      id v10 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = [v10 v6[145]];
        if (v12)
        {
          unint64_t v13 = v12;
          if ([v12 v7[146]])
          {
            if (one-time initialization token for defaultLogger != -1) {
              swift_once();
            }
            uint64_t v14 = type metadata accessor for Logger();
            __swift_project_value_buffer(v14, (uint64_t)defaultLogger);
            uint64_t v15 = Logger.logObject.getter();
            os_log_type_t v16 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v15, v16))
            {
              uint64_t v17 = v2;
              unint64_t v18 = v5;
              BOOL v19 = v6;
              unint64_t v20 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unint64_t v20 = 0;
              _os_log_impl(&dword_22D468000, v15, v16, "Found final ASRPackageGenerated Event", v20, 2u);
              unint64_t v21 = v20;
              uint64_t v6 = v19;
              unint64_t v5 = v18;
              uint64_t v2 = v17;
              unint64_t v1 = v22;
              MEMORY[0x230F81A50](v21, -1, -1);
            }

            MEMORY[0x230F81080]();
            if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            }
            specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized Array._endMutation()();
            uint64_t v7 = (SEL *)&unk_2649AE000;
            goto LABEL_6;
          }
        }
        else
        {
        }
      }
      else
      {
      }
LABEL_6:
      if (v2 == ++v4)
      {
        swift_bridgeObjectRelease();
        return v23;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized static ASRFeatureExtractor.asrRecognitionResultTier1Events(from:)(unint64_t a1)
{
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x230F812A0](i, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * i + 32);
      }
      uint64_t v6 = v5;
      id v7 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
      if (v7)
      {
        id v8 = v7;
        id v9 = objc_msgSend(v7, sel_recognitionResultTier1);

        if (v9)
        {
          MEMORY[0x230F81080]();
          if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
        }
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

void specialized static ASRFeatureExtractor.bestTokensIndices(asrFinalPackageEvent:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_package);
  if (!v1) {
    return;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_postItn);

  if (!v3) {
    return;
  }
  id v46 = v3;
  id v4 = objc_msgSend(v46, sel_utterances);
  if (v4)
  {
    id v5 = v4;
    type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for ASRSchemaASRUtterance);
    unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    unint64_t v6 = MEMORY[0x263F8EE78];
  }
  id v7 = objc_msgSend(v46, sel_phrases);
  if (v7)
  {
    id v8 = v7;
    type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for ASRSchemaASRPhrase);
    unint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (!(v6 >> 62)) {
      goto LABEL_8;
    }
LABEL_64:
    swift_bridgeObjectRetain();
    uint64_t v44 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v44) {
      goto LABEL_9;
    }
LABEL_65:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v9 = MEMORY[0x263F8EE78];
  if (v6 >> 62) {
    goto LABEL_64;
  }
LABEL_8:
  if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_65;
  }
LABEL_9:
  if ((v6 & 0xC000000000000001) != 0) {
    goto LABEL_77;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    for (id i = *(id *)(v6 + 32); ; id i = (id)MEMORY[0x230F812A0](0, v6))
    {
      uint64_t v11 = i;
      swift_bridgeObjectRelease();
      id v12 = objc_msgSend(v11, sel_interpretationIndices);
      if (v12)
      {
        unint64_t v13 = v12;
        type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for NSNumber);
        unint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        if (v14 >> 62) {
          goto LABEL_68;
        }
      }
      else
      {
        unint64_t v14 = MEMORY[0x263F8EE78];
        if (MEMORY[0x263F8EE78] >> 62)
        {
LABEL_68:
          swift_bridgeObjectRetain();
          uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          id v45 = v11;
          if (!v15)
          {
LABEL_69:

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            return;
          }
          goto LABEL_15;
        }
      }
      uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v45 = v11;
      if (!v15) {
        goto LABEL_69;
      }
LABEL_15:
      unint64_t v6 = 0;
      unint64_t v16 = v14 & 0xC000000000000001;
      unint64_t v57 = v9 & 0xC000000000000001;
      unint64_t v53 = v14 + 32;
      uint64_t v54 = v14 & 0xFFFFFFFFFFFFFF8;
      unint64_t v51 = v9 + 32;
      uint64_t v52 = v9 & 0xFFFFFFFFFFFFFF8;
      uint64_t v17 = (void *)MEMORY[0x263F8EE78];
      unint64_t v47 = v14;
      unint64_t v48 = v9;
      unint64_t v49 = v14 & 0xC000000000000001;
      uint64_t v50 = v15;
      while (1)
      {
        if (v16)
        {
          id v18 = (id)MEMORY[0x230F812A0](v6, v14);
        }
        else
        {
          if (v6 >= *(void *)(v54 + 16)) {
            goto LABEL_73;
          }
          id v18 = *(id *)(v53 + 8 * v6);
        }
        BOOL v19 = v18;
        unint64_t v20 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          break;
        }
        if (v57)
        {
          id v21 = (id)MEMORY[0x230F812A0](v6, v9);
        }
        else
        {
          if (v6 >= *(void *)(v52 + 16)) {
            goto LABEL_74;
          }
          id v21 = *(id *)(v51 + 8 * v6);
        }
        unint64_t v22 = v21;
        id v23 = objc_msgSend(v21, sel_interpretations);

        if (v23)
        {
          type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for ASRSchemaASRInterpretation);
          unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          unint64_t v24 = (unint64_t)objc_msgSend(v19, sel_integerValue);
          if ((v6 & 0xC000000000000001) != 0)
          {
            id v25 = (id)MEMORY[0x230F812A0](v24, v6);
          }
          else
          {
            if ((v24 & 0x8000000000000000) != 0) {
              goto LABEL_71;
            }
            if (v24 >= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_72;
            }
            id v25 = *(id *)(v6 + 8 * v24 + 32);
          }
          unint64_t v26 = v25;
          swift_bridgeObjectRelease();
          id v27 = objc_msgSend(v26, sel_tokens);
          BOOL v28 = v26;
          if (v27)
          {
            id v29 = v27;
            unint64_t v56 = v28;
            type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for ASRSchemaASRToken);
            unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

            if (v6 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v30 = _CocoaArrayWrapper.endIndex.getter();
              if (!v30)
              {
LABEL_61:

                swift_bridgeObjectRelease_n();
                goto LABEL_17;
              }
            }
            else
            {
              uint64_t v30 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain();
              if (!v30) {
                goto LABEL_61;
              }
            }
            unint64_t v9 = v6 & 0xC000000000000001;
            uint64_t v55 = v17;
            if ((v6 & 0xC000000000000001) != 0)
            {
              id v31 = (id)MEMORY[0x230F812A0](0, v6);
            }
            else
            {
              if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_75;
              }
              id v31 = *(id *)(v6 + 32);
            }
            os_log_type_t v32 = v31;
            unint64_t v33 = v30 - 1;
            if (v30 != 1)
            {
              if (v30 < 2) {
                goto LABEL_76;
              }
              if (!v9)
              {
                unint64_t v37 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
                if (v37 < 2 || v33 >= v37) {
                  goto LABEL_79;
                }
              }
              uint64_t v38 = 0;
              do
              {
                if (v9) {
                  id v39 = (id)MEMORY[0x230F812A0](v38 + 1, v6);
                }
                else {
                  id v39 = *(id *)(v6 + 8 * v38 + 40);
                }
                uint64_t v40 = v39;
                signed int v41 = objc_msgSend(v32, sel_confidence);
                signed int v42 = objc_msgSend(v40, sel_confidence);
                if (v41 >= v42) {
                  uint64_t v43 = v40;
                }
                else {
                  uint64_t v43 = v32;
                }
                if (v41 < v42) {
                  os_log_type_t v32 = v40;
                }

                ++v38;
              }
              while (v33 != v38);
            }
            swift_bridgeObjectRelease_n();
            unsigned int v34 = objc_msgSend(v32, sel_linkIndex);
            uint64_t v17 = v55;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v55[2] + 1, 1, v55);
            }
            unint64_t v14 = v47;
            unint64_t v9 = v48;
            unint64_t v36 = v17[2];
            unint64_t v35 = v17[3];
            if (v36 >= v35 >> 1) {
              uint64_t v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v35 > 1), v36 + 1, 1, v17);
            }
            v17[2]  = v36 + 1;
            v17[v36 + 4]  = v34;

            unint64_t v16 = v49;
            uint64_t v15 = v50;
          }
          else
          {
          }
        }
        else
        {
        }
LABEL_17:
        unint64_t v6 = v20;
        if (v20 == v15) {
          goto LABEL_69;
        }
      }
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
      ;
    }
  }
  __break(1u);
LABEL_79:
  __break(1u);
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
  }
  return result;
}

uint64_t type metadata accessor for BestPostITNUtterance(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for BestPostITNUtterance);
}

uint64_t type metadata accessor for BestASRPhoneticSequence(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for BestASRPhoneticSequence);
}

uint64_t type metadata accessor for ASRFeatureExtractor()
{
  return self;
}

uint64_t type metadata completion function for BestPostITNUtterance()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for BestPostITNUtterance()
{
  return type metadata accessor for BestPostITNUtterance(0);
}

uint64_t type metadata completion function for BestASRPhoneticSequence()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for BestASRPhoneticSequence()
{
  return type metadata accessor for BestASRPhoneticSequence(0);
}

uint64_t type metadata accessor for ASRSchemaASRTokenTier1(uint64_t a1, unint64_t *a2)
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

unint64_t static Constants.subsystem.getter()
{
  return 0xD000000000000022;
}

uint64_t URL.init(siriInferredHelpfulnessFrameworkPath:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v20 = a1;
  v21[1]  = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  unint64_t v9 = (char *)&v19 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v19 - v10;
  id v12 = objc_msgSend(self, sel_defaultManager, v19, v20);
  v21[0]  = 0;
  id v13 = objc_msgSend(v12, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 5, 8, 0, 0, v21);

  id v14 = v21[0];
  if (v13)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    id v15 = v14;

    URL.appendingPathComponent(_:)();
    URL.appendingPathComponent(_:)();
    unint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
    v16(v6, v2);
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    v16(v9, v2);
    return ((uint64_t (*)(char *, uint64_t))v16)(v11, v2);
  }
  else
  {
    id v18 = v21[0];
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    return swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> URL.makeIntermediateDirectories()()
{
  v12[1]  = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.deletingLastPathComponent()();
  id v4 = objc_msgSend(self, sel_defaultManager);
  URL._bridgeToObjectiveC()(v5);
  uint64_t v7 = v6;
  v12[0]  = 0;
  unsigned __int8 v8 = objc_msgSend(v4, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v6, 1, 0, v12);

  if (v8)
  {
    unint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
    id v10 = v12[0];
    v9(v3, v0);
  }
  else
  {
    id v11 = v12[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> URL.deleteFile()()
{
  v10[1]  = *(id *)MEMORY[0x263EF8340];
  id v0 = objc_msgSend(self, sel_defaultManager);
  uint64_t v1 = URL.path.getter();
  uint64_t v2 = (void *)MEMORY[0x230F80F90](v1);
  swift_bridgeObjectRelease();
  unsigned int v3 = objc_msgSend(v0, sel_fileExistsAtPath_, v2);

  if (v3)
  {
    URL._bridgeToObjectiveC()(v4);
    unint64_t v6 = v5;
    v10[0]  = 0;
    unsigned int v7 = objc_msgSend(v0, sel_removeItemAtURL_error_, v5, v10);

    if (v7)
    {
      id v8 = v10[0];
    }
    else
    {
      id v9 = v10[0];
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
  }
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

uint64_t specialized Collection.filterByType<A>(as:)(unint64_t a1)
{
  return specialized Collection.filterByType<A>(as:)(a1, type metadata accessor for BestPostITNUtterance, (void (*)(void))type metadata accessor for BestPostITNUtterance);
}

{
  return specialized Collection.filterByType<A>(as:)(a1, type metadata accessor for BestASRPhoneticSequence, (void (*)(void))type metadata accessor for BestASRPhoneticSequence);
}

{
  return specialized Collection.filterByType<A>(as:)(a1, type metadata accessor for CatId, (void (*)(void))type metadata accessor for CatId);
}

{
  return specialized Collection.filterByType<A>(as:)(a1, type metadata accessor for TextSimilarityScoreWithNextRequest, (void (*)(void))type metadata accessor for TextSimilarityScoreWithNextRequest);
}

uint64_t specialized Collection.filterByType<A>(as:)(unint64_t a1, uint64_t (*a2)(void), void (*a3)(void))
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  unint64_t v13 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    if (!v7) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v7) {
      goto LABEL_15;
    }
  }
  uint64_t result = a2(0);
  if (v7 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v9 = result;
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (v9 == *(void *)MEMORY[0x230F812A0](i, a1))
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    for (j  = 0; j != v7; ++j)
    {
      if (v9 == **(void **)(a1 + 8 * j + 32))
      {
        swift_retain();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
      }
    }
  }
LABEL_15:
  swift_bridgeObjectRelease();
  uint64_t v12 = specialized _arrayConditionalCast<A, B>(_:)(v13, a3);
  swift_release();
  if (v12) {
    return v12;
  }
  else {
    return v6;
  }
}

uint64_t specialized _arrayConditionalCast<A, B>(_:)(unint64_t a1, void (*a2)(void))
{
  uint64_t v3 = a1;
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  specialized ContiguousArray.reserveCapacity(_:)();
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        MEMORY[0x230F812A0](i, v3);
        uint64_t v6 = i + 1;
        if (__OFADD__(i, 1)) {
          break;
        }
        a2(0);
        if (!swift_dynamicCastClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (v6 == v4) {
          return v11;
        }
      }
      __break(1u);
    }
    else
    {
      for (j  = 0; ; ++j)
      {
        uint64_t v8 = j + 1;
        if (__OFADD__(j, 1)) {
          break;
        }
        a2(0);
        uint64_t v9 = swift_dynamicCastClass();
        if (!v9)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        uint64_t v3 = v9;
        swift_retain();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (v8 == v4) {
          return v11;
        }
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    specialized ContiguousArray.reserveCapacity(_:)();
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return v11;
}

SiriInferredHelpfulness::GradedConversation __swiftcall GradedConversation.init(_:)(Swift::OpaquePointer a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((void *)a1._rawValue + 2))
  {
    uint64_t v8 = *((void *)a1._rawValue + 7);
    uint64_t v9 = *(void *)(v8 + 24);
    id v10 = *(void **)(v8 + 32);
    uint64_t v11 = swift_bridgeObjectRetain();
  }
  else
  {
    UUID.init()();
    uint64_t v9 = UUID.uuidString.getter();
    id v10 = v14;
    uint64_t v11 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v3->_rawValue  = (void *)v9;
  v3[1]._rawValue  = v10;
  v3[2]._rawValue  = a1._rawValue;
  result.interactions._rawValue  = v13;
  result.id._object  = v12;
  result.id._uint64_t countAndFlagsBits = v11;
  return result;
}

uint64_t GradedInteraction.init(inferredHelpfulnessScore:featuredTurn:modelVersion:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v11 = a1[3];
  uint64_t v10 = a1[4];
  uint64_t v12 = *(uint64_t (**)(uint64_t))(*a1 + 120);
  swift_bridgeObjectRetain_n();
  swift_retain();
  uint64_t v13 = swift_bridgeObjectRetain();
  unint64_t v14 = v12(v13);
  unint64_t v15 = specialized Collection.filterByType<A>(as:)(v14, type metadata accessor for BestPostITNUtterance, (void (*)(void))type metadata accessor for BestPostITNUtterance);
  uint64_t result = swift_bridgeObjectRelease();
  if (!(v15 >> 62))
  {
    uint64_t v17 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v17) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v19 = 0;
LABEL_15:
    swift_bridgeObjectRetain();
    *(void *)a4  = v11;
    *(void *)(a4 + 8)  = v10;
    *(double *)(a4 + 16)  = a5;
    *(void *)(a4 + 24)  = a1;
    *(void *)(a4 + 32)  = v17;
    *(void *)(a4 + 40)  = v19;
    *(void *)(a4 + 48)  = a2;
    *(void *)(a4 + 56)  = a3;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_14;
  }
LABEL_3:
  if ((v15 & 0xC000000000000001) != 0)
  {
    MEMORY[0x230F812A0](0, v15);
    goto LABEL_6;
  }
  if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_6:
    swift_bridgeObjectRelease();
    dispatch thunk of Feature.value()();
    swift_release();
    int v18 = swift_dynamicCast();
    if (v18) {
      uint64_t v17 = v20;
    }
    else {
      uint64_t v17 = 0;
    }
    if (v18) {
      uint64_t v19 = v21;
    }
    else {
      uint64_t v19 = 0;
    }
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t GradedConversation.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GradedConversation.interactions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GradedInteraction.turnID.getter()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for Identifiable.id.getter in conformance GradedConversation@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1  = *v1;
  a1[1]  = v2;
  return swift_bridgeObjectRetain();
}

uint64_t GradedInteraction.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double GradedInteraction.inferredHelpfulnessScore.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t GradedInteraction.featuredTurn.getter()
{
  return swift_retain();
}

uint64_t GradedInteraction.utterance.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GradedInteraction.utterance.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32)  = a1;
  *(void *)(v2 + 40)  = a2;
  return result;
}

uint64_t (*GradedInteraction.utterance.modify())()
{
  return FlowClientFeatureExtractor.__ivar_destroyer;
}

uint64_t GradedInteraction.modelVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GradedInteraction.modelVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48)  = a1;
  *(void *)(v2 + 56)  = a2;
  return result;
}

uint64_t (*GradedInteraction.modelVersion.modify())()
{
  return FlowClientFeatureExtractor.__ivar_destroyer;
}

uint64_t GradedInteraction.features.getter()
{
  return (*(uint64_t (**)(void))(**(void **)(v0 + 24) + 120))();
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in GradedConversation()
{
  return MEMORY[0x263F8D320];
}

uint64_t destroy for GradedConversation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for GradedConversation(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1  = *a2;
  a1[1]  = v3;
  a1[2]  = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GradedConversation(void *a1, void *a2)
{
  *a1  = *a2;
  a1[1]  = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2]  = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0]  = a2[1].n128_u64[0];
  *a1  = result;
  return result;
}

uint64_t assignWithTake for GradedConversation(uint64_t a1, uint64_t a2)
{
  *(void *)a1  = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8)  = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GradedConversation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2)  = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GradedConversation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8)  = 0;
    *(void *)(result + 16)  = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24)  = 1;
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
      *(void *)(result + 8)  = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24)  = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GradedConversation()
{
  return &type metadata for GradedConversation;
}

uint64_t destroy for GradedInteraction()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for GradedInteraction(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1  = *a2;
  a1[1]  = v3;
  uint64_t v4 = a2[3];
  a1[2]  = a2[2];
  a1[3]  = v4;
  uint64_t v5 = a2[5];
  a1[4]  = a2[4];
  a1[5]  = v5;
  uint64_t v6 = a2[7];
  a1[6]  = a2[6];
  a1[7]  = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GradedInteraction(void *a1, void *a2)
{
  *a1  = *a2;
  a1[1]  = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2]  = a2[2];
  a1[3]  = a2[3];
  swift_retain();
  swift_release();
  a1[4]  = a2[4];
  a1[5]  = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6]  = a2[6];
  a1[7]  = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32)  = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48)  = v4;
  *(__n128 *)a1  = result;
  *(_OWORD *)(a1 + 16)  = v3;
  return result;
}

void *assignWithTake for GradedInteraction(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1  = *a2;
  a1[1]  = v4;
  swift_bridgeObjectRelease();
  a1[2]  = a2[2];
  a1[3]  = a2[3];
  swift_release();
  uint64_t v5 = a2[5];
  a1[4]  = a2[4];
  a1[5]  = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[7];
  a1[6]  = a2[6];
  a1[7]  = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GradedInteraction(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2)  = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GradedInteraction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56)  = 0;
    *(_OWORD *)(result + 40)  = 0u;
    *(_OWORD *)(result + 24)  = 0u;
    *(_OWORD *)(result + 8)  = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64)  = 1;
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
      *(void *)(result + 8)  = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64)  = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GradedInteraction()
{
  return &type metadata for GradedInteraction;
}

uint64_t static TrialProvider.shared.getter()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return swift_retain();
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  unint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1]  = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1]  = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2]  = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  long long v17;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
  unint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of URL??(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1]  = v8;
    unint64_t result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    uint64_t v13 = __OFADD__(v12, 1);
    BOOL v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2]  = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  void *v3;
  Swift::UInt32 v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;

  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<SISchemaDismissalReason, String>);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(_DWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v4);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v9 = (void *)(a1 + 72);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_DWORD *)(v3[6] + 4 * result)  = v4;
    char v10 = (void *)(v3[7] + 16 * result);
    void *v10 = v6;
    v10[1]  = v5;
    uint64_t v11 = v3[2];
    uint64_t v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2]  = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    BOOL v14 = v9 + 3;
    uint64_t v4 = *((_DWORD *)v9 - 4);
    uint64_t v6 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v4);
    uint64_t v9 = v14;
    uint64_t v5 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

void *TrialProvider.namespaceName.unsafeMutableAddressor()
{
  return &static TrialProvider.namespaceName;
}

uint64_t TrialAsset.description.getter(char a1)
{
  if (!a1) {
    return 0xD000000000000026;
  }
  if (a1 == 1) {
    return 0xD00000000000001DLL;
  }
  return 0x616C466C61697254;
}

uint64_t TrialAsset.rawValue.getter(char a1)
{
  if (!a1) {
    return 0xD000000000000026;
  }
  if (a1 == 1) {
    return 0xD00000000000001DLL;
  }
  return 0x616C466C61697254;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance TrialAsset(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = TrialAsset.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == TrialAsset.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TrialAsset()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  TrialAsset.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance TrialAsset()
{
  TrialAsset.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TrialAsset()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  TrialAsset.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance TrialAsset@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized TrialAsset.init(rawValue:)(*a1);
  *a2  = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance TrialAsset@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TrialAsset.rawValue.getter(*v1);
  *a1  = result;
  a1[1]  = v4;
  return result;
}

uint64_t TrialEnrollment.treatmentId.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrialEnrollment.experimentId.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrialEnrollment.rolloutId.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t TrialEnrollment.description.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = (void *)v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[5];
  uint64_t v20 = v0[4];
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  strcpy((char *)&v21, "experimentId=");
  HIWORD(v21._object)  = -4864;
  if (v3)
  {
    uint64_t v6 = v3;
  }
  else
  {
    uint64_t v4 = 7104878;
    uint64_t v6 = (void *)0xE300000000000000;
  }
  swift_bridgeObjectRetain();
  v7._uint64_t countAndFlagsBits = v4;
  v7._object  = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._uint64_t countAndFlagsBits = 8236;
  v8._object  = (void *)0xE200000000000000;
  String.append(_:)(v8);
  v9._uint64_t countAndFlagsBits = v21._countAndFlagsBits;
  object  = v21._object;
  HIDWORD(v21._object)  = -335544318;
  v9._object  = object;
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(16);
  swift_bridgeObjectRelease();
  strcpy((char *)&v21, "treatmentId=");
  if (v1) {
    uint64_t v11 = v2;
  }
  else {
    uint64_t v11 = 7104878;
  }
  if (v1) {
    uint64_t v12 = v1;
  }
  else {
    uint64_t v12 = (void *)0xE300000000000000;
  }
  swift_bridgeObjectRetain();
  v13._uint64_t countAndFlagsBits = v11;
  v13._object  = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._uint64_t countAndFlagsBits = 8236;
  v14._object  = (void *)0xE200000000000000;
  String.append(_:)(v14);
  swift_bridgeObjectRetain();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  strcpy((char *)&v21, "rolloutId=");
  BYTE3(v21._object)  = 0;
  HIDWORD(v21._object)  = -369098752;
  if (v5) {
    uint64_t v15 = v20;
  }
  else {
    uint64_t v15 = 7104878;
  }
  if (v5) {
    unint64_t v16 = v5;
  }
  else {
    unint64_t v16 = (void *)0xE300000000000000;
  }
  swift_bridgeObjectRetain();
  v17._uint64_t countAndFlagsBits = v15;
  v17._object  = v16;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._uint64_t countAndFlagsBits = 93;
  v18._object  = (void *)0xE100000000000000;
  String.append(_:)(v18);
  swift_bridgeObjectRetain();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0xD000000000000010;
}

uint64_t TrialEnrollment.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aTreatmenexperi[8 * a1];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TrialEnrollment.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TrialEnrollment.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance TrialEnrollment.CodingKeys()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TrialEnrollment.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance TrialEnrollment.CodingKeys()
{
  return TrialEnrollment.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance TrialEnrollment.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized TrialEnrollment.CodingKeys.init(stringValue:)(a1, a2);
  *a3  = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance TrialEnrollment.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance TrialEnrollment.CodingKeys(unsigned char *a1@<X8>)
{
  *a1  = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance TrialEnrollment.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance TrialEnrollment.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TrialEnrollment.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<TrialEnrollment.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  v11[3]  = v1[3];
  v11[4]  = v7;
  uint64_t v8 = v1[4];
  v11[1]  = v1[5];
  void v11[2] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v14 = 0;
  uint64_t v9 = v11[5];
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v9)
  {
    char v13 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v12 = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t TrialEnrollment.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<TrialEnrollment.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v27 = 0;
  uint64_t v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v11 = v10;
  uint64_t v24 = v9;
  char v26 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v22 = v12;
  char v25 = 2;
  swift_bridgeObjectRetain();
  uint64_t v23 = v14;
  uint64_t v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v17 = v16;
  uint64_t v18 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  uint64_t v19 = v23;
  *a2  = v24;
  a2[1]  = v11;
  a2[2]  = v22;
  a2[3]  = v19;
  a2[4]  = v18;
  a2[5]  = v17;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void __swiftcall TrialEnrollment.init(treatmentId:experimentId:rolloutId:)(SiriInferredHelpfulness::TrialEnrollment *__return_ptr retstr, Swift::String_optional treatmentId, Swift::String_optional experimentId, Swift::String_optional rolloutId)
{
  retstr->treatmentId  = treatmentId;
  retstr->experimentId  = experimentId;
  retstr->rolloutId  = rolloutId;
}

uint64_t protocol witness for Decodable.init(from:) in conformance TrialEnrollment@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return TrialEnrollment.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance TrialEnrollment(void *a1)
{
  return TrialEnrollment.encode(to:)(a1);
}

unint64_t static TrialProvider.namespaceName.getter()
{
  return 0xD000000000000019;
}

void one-time initialization function for assetFolderName()
{
  static TrialProvider.assetFolderName  = 0x395F737465737361;
  unk_2685715B0  = 0xEA00000000003034;
}

uint64_t *TrialProvider.assetFolderName.unsafeMutableAddressor()
{
  if (one-time initialization token for assetFolderName != -1) {
    swift_once();
  }
  return &static TrialProvider.assetFolderName;
}

uint64_t static TrialProvider.assetFolderName.getter()
{
  if (one-time initialization token for assetFolderName != -1) {
    swift_once();
  }
  uint64_t v0 = static TrialProvider.assetFolderName;
  swift_bridgeObjectRetain();
  return v0;
}

void *TrialProvider.modelAssetsDirectory.unsafeMutableAddressor()
{
  return &static TrialProvider.modelAssetsDirectory;
}

unint64_t static TrialProvider.modelAssetsDirectory.getter()
{
  return 0xD000000000000011;
}

double one-time initialization function for shared()
{
  id v0 = objc_msgSend(self, sel_clientWithIdentifier_, 266);
  type metadata accessor for TrialProvider();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = v1 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(void *)(v1 + 16)  = v0;
  double result = 0.0;
  *(_OWORD *)(v1 + 24)  = 0u;
  *(_OWORD *)(v1 + 40)  = 0u;
  *(_OWORD *)(v1 + 56)  = 0u;
  static TrialProvider.shared  = v1;
  return result;
}

uint64_t TrialProvider.__allocating_init(client:enrollment:)(uint64_t a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  long long v10 = a2[1];
  long long v11 = *a2;
  uint64_t v5 = *((void *)a2 + 4);
  uint64_t v6 = *((void *)a2 + 5);
  uint64_t v7 = v4 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(void *)(v4 + 16)  = a1;
  *(_OWORD *)(v4 + 24)  = v11;
  *(_OWORD *)(v4 + 40)  = v10;
  *(void *)(v4 + 56)  = v5;
  *(void *)(v4 + 64)  = v6;
  return v4;
}

id TrialProvider.client.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 16);
  return v1;
}

void TrialProvider.client.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16)  = a1;
}

uint64_t (*TrialProvider.client.modify())()
{
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t key path setter for TrialProvider.enrollment : TrialProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *a2;
  uint64_t v6 = *a1;
  long long v7 = *(_OWORD *)(a1 + 1);
  long long v8 = *(_OWORD *)(a1 + 3);
  uint64_t v9 = v2;
  uint64_t v4 = *(uint64_t (**)(uint64_t *))(*(void *)v3 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4(&v6);
}

uint64_t TrialProvider.enrollment.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 64);
  *(void *)a1  = *(void *)(v1 + 24);
  long long v4 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 8)  = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 24)  = v4;
  *(void *)(a1 + 40)  = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t TrialProvider.enrollment.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  long long v7 = *((_OWORD *)a1 + 1);
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  swift_beginAccess();
  *(void *)(v1 + 24)  = v2;
  *(void *)(v1 + 32)  = v3;
  *(_OWORD *)(v1 + 40)  = v7;
  *(void *)(v1 + 56)  = v4;
  *(void *)(v1 + 64)  = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*TrialProvider.enrollment.modify())()
{
  return InferredHelpfulnessInference.classifier.modify;
}

uint64_t key path setter for TrialProvider.assetUrl : TrialProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL??(a1, (uint64_t)v6, &demangling cache variable for type metadata for URL?);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 160))(v6);
}

uint64_t TrialProvider.assetUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL??);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v15[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
  swift_beginAccess();
  outlined init with copy of URL??(v9, (uint64_t)v8, &demangling cache variable for type metadata for URL??);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return outlined init with take of URL?((uint64_t)v8, a1);
  }
  uint64_t v12 = outlined destroy of Any?((uint64_t)v8, &demangling cache variable for type metadata for URL??);
  uint64_t v13 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v1 + 104))(v12);
  (*(void (**)(void))(*(void *)v1 + 200))();

  outlined init with copy of URL??(a1, (uint64_t)v6, &demangling cache variable for type metadata for URL?);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  outlined assign with take of URL??((uint64_t)v6, v9);
  return swift_endAccess();
}

uint64_t TrialProvider.assetUrl.setter(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL??);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with take of URL?(a1, (uint64_t)v5);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  uint64_t v7 = v1 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
  swift_beginAccess();
  outlined assign with take of URL??((uint64_t)v5, v7);
  return swift_endAccess();
}

void (*TrialProvider.assetUrl.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1  = v3;
  v3[6]  = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL??);
  v3[7]  = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v3[8]  = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[9]  = v6;
  size_t v7 = *(void *)(v6 + 64);
  v3[10]  = malloc(v7);
  uint64_t v8 = malloc(v7);
  v3[11]  = v8;
  TrialProvider.assetUrl.getter((uint64_t)v8);
  return TrialProvider.assetUrl.modify;
}

void TrialProvider.assetUrl.modify(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v4 = *(void **)(*(void *)a1 + 80);
  uint64_t v3 = *(void **)(*(void *)a1 + 88);
  if (a2)
  {
    uint64_t v5 = v2[8];
    uint64_t v6 = v2[9];
    uint64_t v8 = v2[6];
    size_t v7 = (void *)v2[7];
    outlined init with copy of URL??(v2[11], v2[10], &demangling cache variable for type metadata for URL?);
    outlined init with take of URL?((uint64_t)v4, (uint64_t)v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    uint64_t v9 = v8 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
    swift_beginAccess();
    outlined assign with take of URL??((uint64_t)v7, v9);
    swift_endAccess();
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for URL?);
  }
  else
  {
    uint64_t v10 = v2[8];
    uint64_t v11 = v2[9];
    uint64_t v12 = v2[6];
    size_t v7 = (void *)v2[7];
    outlined init with take of URL?(v2[11], (uint64_t)v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    uint64_t v13 = v12 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
    swift_beginAccess();
    outlined assign with take of URL??((uint64_t)v7, v13);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

uint64_t TrialProvider.init(client:enrollment:)(uint64_t a1, long long *a2)
{
  long long v9 = a2[1];
  long long v10 = *a2;
  uint64_t v4 = *((void *)a2 + 4);
  uint64_t v5 = *((void *)a2 + 5);
  uint64_t v6 = v2 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)(v2 + 16)  = a1;
  *(_OWORD *)(v2 + 24)  = v10;
  *(_OWORD *)(v2 + 40)  = v9;
  *(void *)(v2 + 56)  = v4;
  *(void *)(v2 + 64)  = v5;
  return v2;
}

uint64_t TrialProvider.setClient(client:)(void *a1)
{
  uint64_t v4 = *(uint64_t (**)(id))(*(void *)v1 + 112);
  id v2 = a1;
  return v4(v2);
}

uint64_t TrialProvider.defaultAssetsUrl()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for assetFolderName != -1) {
    swift_once();
  }
  uint64_t v6 = static TrialProvider.assetFolderName;
  swift_bridgeObjectRetain();
  uint64_t result = URL.init(siriInferredHelpfulnessFrameworkPath:)(v6, (uint64_t)v5);
  if (!v1)
  {
    URL.appendingPathComponent(_:isDirectory:)();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

id TrialProvider.fetchUpdatedAssetsURL(client:)@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  unint64_t v3 = v2;
  v138  = *MEMORY[0x263EF8340];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  unint64_t v122 = (char *)&v112 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)&v112 - v9;
  v127  = type metadata accessor for URL();
  unint64_t v11 = *(void *)(v127 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v127);
  id v123 = (char *)&v112 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v126 = (char *)&v112 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  MEMORY[0x270FA5388](v16);
  uint64_t v119 = (char *)&v112 - v17;
  uint64_t v116 = v18;
  v118  = v10;
  if (a1)
  {
    uint64_t v19 = *(void (**)(void))(*(void *)v3 + 184);
    id v20 = a1;
    v19();
  }
  unint64_t v21 = 0xD000000000000019;
  uint64_t v22 = *(uint64_t (**)(void))(*(void *)v3 + 104);
  uint64_t v23 = *(void *)v3 + 104;
  uint64_t v24 = (void *)v22();
  objc_msgSend(v24, sel_refresh);

  v128  = (void (*)(char *, uint64_t, uint64_t))v23;
  char v25 = (void *)v22();
  v124  = (unint64_t)"CatIdToSpeakeasyCategory";
  char v26 = (void *)MEMORY[0x230F80F90](0xD000000000000019, 0x800000022D498EF0);
  id v27 = objc_msgSend(v25, sel_treatmentIdWithNamespaceName_, v26);

  v120  = a2;
  if (v27)
  {
    BOOL v28 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v30 = v29;
  }
  else
  {
    BOOL v28 = 0;
    uint64_t v30 = 0;
  }
  unint64_t v125 = v11;
  id v31 = (void *)v22();
  os_log_type_t v32 = (void *)MEMORY[0x230F80F90](0xD000000000000019, 0x800000022D498EF0);
  id v33 = objc_msgSend(v31, sel_experimentIdWithNamespaceName_, v32);

  if (v33)
  {
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v36 = v35;
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v36 = 0;
  }
  v121  = v22;
  unint64_t v37 = (void *)v22();
  uint64_t v38 = (void *)MEMORY[0x230F80F90](0xD000000000000019, v124 | 0x8000000000000000);
  id v39 = objc_msgSend(v37, sel_rolloutIdWithNamespaceName_, v38);

  if (v39)
  {
    uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v42 = v41;
  }
  else
  {
    uint64_t v40 = 0;
    uint64_t v42 = 0;
  }
  v134  = v28;
  *(void *)&v135  = v30;
  *((void *)&v135 + 1)  = v34;
  *(void *)&v136  = v36;
  *((void *)&v136 + 1)  = v40;
  v137  = v42;
  (*(void (**)(void **))(*(void *)v3 + 136))(&v134);
  if (one-time initialization token for defaultLogger != -1) {
LABEL_58:
  }
    swift_once();
  uint64_t v43 = type metadata accessor for Logger();
  uint64_t v44 = __swift_project_value_buffer(v43, (uint64_t)defaultLogger);
  swift_retain_n();
  id v45 = Logger.logObject.getter();
  os_log_type_t v46 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v45, v46))
  {
    unint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    unint64_t v115 = v44;
    uint64_t v49 = v48;
    *(_DWORD *)unint64_t v47 = 136315138;
    v133  = v48;
    (*(void (**)(void **__return_ptr))(*(void *)v3 + 128))(&v134);
    v129  = v134;
    long long v114 = v135;
    long long v117 = v136;
    v130  = v135;
    v131  = v136;
    v132  = v137;
    unint64_t v50 = TrialEnrollment.description.getter();
    unint64_t v52 = v51;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v134  = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v52, &v133);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    unint64_t v21 = 0xD000000000000019;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D468000, v45, v46, "%s", v47, 0xCu);
    swift_arrayDestroy();
    uint64_t v53 = v49;
    uint64_t v44 = v115;
    MEMORY[0x230F81A50](v53, -1, -1);
    MEMORY[0x230F81A50](v47, -1, -1);
  }
  else
  {

    uint64_t v54 = swift_release_n();
  }
  unint64_t v55 = v125;
  unint64_t v56 = (void *)((uint64_t (*)(uint64_t))v121)(v54);
  uint64_t v57 = v21 - 8;
  unint64_t v58 = (void *)MEMORY[0x230F80F90](v21 - 8, 0x800000022D495F90);
  uint64_t v59 = (void *)MEMORY[0x230F80F90](0xD000000000000019, v124 | 0x8000000000000000);
  id v60 = objc_msgSend(v56, sel_levelForFactor_withNamespaceName_, v58, v59);

  if (!v60) {
    goto LABEL_21;
  }
  id result = objc_msgSend(v60, sel_directoryValue);
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v62 = result;
  v63  = objc_msgSend(result, sel_path);

  if (!v63) {
    goto LABEL_21;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v64 = (uint64_t)v118;
  URL.init(string:)();
  swift_bridgeObjectRelease();
  unint64_t v65 = *(uint64_t (**)(void))(v55 + 48);
  uint64_t v66 = v127;
  v124  = v55 + 48;
  v121  = v65;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v65)(v64, 1, v127) == 1)
  {
    outlined destroy of Any?(v64, &demangling cache variable for type metadata for URL?);
LABEL_21:
    uint64_t v67 = Logger.logObject.getter();
    os_log_type_t v68 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = (uint8_t *)swift_slowAlloc();
      uint64_t v70 = (void *)swift_slowAlloc();
      v134  = v70;
      *(_DWORD *)uint64_t v69 = 136315138;
      v129  = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v57, 0x800000022D495F90, (uint64_t *)&v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_22D468000, v67, v68, "Did not find URL path to Trial assets %s", v69, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v70, -1, -1);
      MEMORY[0x230F81A50](v69, -1, -1);
    }
    else
    {
    }
    return (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v55 + 56))(v120, 1, 1, v127);
  }
  id v113 = v60;
  uint64_t v71 = v119;
  v128  = *(void (**)(char *, uint64_t, uint64_t))(v55 + 32);
  v128(v119, v64, v66);
  uint64_t v72 = *(void (**)(uint64_t, char *, uint64_t))(v55 + 16);
  uint64_t v73 = v116;
  v118  = (char *)(v55 + 16);
  *(void *)&long long v117 = v72;
  v72(v116, v71, v66);
  uint64_t v74 = Logger.logObject.getter();
  unint64_t v75 = v55;
  os_log_type_t v76 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v74, v76))
  {
    uint64_t v77 = swift_slowAlloc();
    unint64_t v115 = v44;
    uint64_t v78 = v73;
    uint64_t v79 = (uint8_t *)v77;
    v80  = (void *)swift_slowAlloc();
    v134  = v80;
    *(_DWORD *)uint64_t v79 = 136315138;
    *(void *)&long long v114 = v79 + 4;
    lazy protocol witness table accessor for type URL and conformance URL();
    uint64_t v81 = dispatch thunk of CustomStringConvertible.description.getter();
    v129  = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v81, v82, (uint64_t *)&v134);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(void *)&long long v114 = *(void *)(v75 + 8);
    ((void (*)(uint64_t, uint64_t))v114)(v78, v66);
    _os_log_impl(&dword_22D468000, v74, v76, "Fetched URL path: %s to updated Trial assets", v79, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F81A50](v80, -1, -1);
    MEMORY[0x230F81A50](v79, -1, -1);
  }
  else
  {
    *(void *)&long long v114 = *(void *)(v75 + 8);
    ((void (*)(uint64_t, uint64_t))v114)(v73, v66);
  }

  unint64_t v21 = v75;
  id v83 = objc_msgSend(self, sel_defaultManager);
  URL._bridgeToObjectiveC()(&var20);
  v85  = v84;
  v134  = 0;
  id v86 = objc_msgSend(v83, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v84, 0, 0, &v134);

  id v87 = v134;
  if (v86)
  {
    uint64_t v88 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v89 = v87;

    v134  = (void *)MEMORY[0x263F8EE78];
    uint64_t v90 = *(void *)(v88 + 16);
    swift_bridgeObjectRetain();
    uint64_t v116 = v90;
    if (v90)
    {
      unint64_t v3 = 0;
      unint64_t v115 = v21 + 8;
      unint64_t v112 = (v21 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v91 = v127;
      uint64_t v92 = (uint64_t)v122;
      while (1)
      {
        if (v3 >= *(void *)(v88 + 16))
        {
          __break(1u);
          goto LABEL_58;
        }
        unint64_t v93 = v125;
        unint64_t v94 = (*(unsigned __int8 *)(v93 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80);
        unint64_t v21 = *(void *)(v125 + 72);
        ((void (*)(uint64_t, unint64_t, uint64_t))v117)(v92, v88 + v94 + v21 * v3, v91);
        uint64_t v95 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v93 + 56);
        v95(v92, 0, 1, v91);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v121)(v92, 1, v91) == 1)
        {
          unint64_t v21 = v125;
          goto LABEL_50;
        }
        v128(v126, v92, v91);
        if (URL.pathExtension.getter() == 0x636C65646F6D6C6DLL && v96 == 0xE800000000000000) {
          break;
        }
        v97  = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v97) {
          goto LABEL_39;
        }
        ((void (*)(char *, uint64_t))v114)(v126, v91);
LABEL_32:
        ++v3;
        uint64_t v92 = (uint64_t)v122;
        if (v116 == v3)
        {
          unint64_t v21 = v125;
          v95((uint64_t)v122, 1, 1, v91);
          goto LABEL_50;
        }
      }
      swift_bridgeObjectRelease();
LABEL_39:
      v128(v123, (uint64_t)v126, v91);
      unint64_t v98 = (char *)v134;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v98 + 2) + 1, 1);
        unint64_t v98 = (char *)v134;
      }
      unint64_t v100 = *((void *)v98 + 2);
      unint64_t v99 = *((void *)v98 + 3);
      if (v100 >= v99 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v99 > 1, v100 + 1, 1);
        unint64_t v98 = (char *)v134;
      }
      *((void *)v98 + 2)  = v100 + 1;
      uint64_t v91 = v127;
      v128(&v98[v94 + v100 * v21], (uint64_t)v123, v127);
      v134  = v98;
      goto LABEL_32;
    }
    uint64_t v95 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v75 + 56);
    uint64_t v91 = v127;
    uint64_t v92 = (uint64_t)v122;
    v95((uint64_t)v122, 1, 1, v127);
LABEL_50:
    swift_bridgeObjectRelease();
    outlined destroy of Any?(v92, &demangling cache variable for type metadata for URL?);
    uint64_t v107 = v134[2];
    swift_release();
    if (v107)
    {
      swift_bridgeObjectRelease();

      uint64_t v108 = v120;
      v128(v120, (uint64_t)v119, v91);
      return (id)((uint64_t (*)(char *, void, uint64_t, uint64_t))v95)(v108, 0, 1, v91);
    }
    else
    {
      if (v116)
      {
        uint64_t v109 = v120;
        id v110 = v113;
        if (!*(void *)(v88 + 16)) {
          __break(1u);
        }
        ((void (*)(char *, unint64_t, uint64_t))v117)(v120, v88 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80)), v91);
        uint64_t v111 = 0;
      }
      else
      {
        uint64_t v111 = 1;
        uint64_t v109 = v120;
        id v110 = v113;
      }
      v95((uint64_t)v109, v111, 1, v91);
      swift_bridgeObjectRelease();

      return (id)((uint64_t (*)(char *, uint64_t))v114)(v119, v91);
    }
  }
  else
  {
    uint64_t v101 = v134;
    long long v102 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    v103  = Logger.logObject.getter();
    uint64_t v104 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v103, (os_log_type_t)v104))
    {
      unint64_t v105 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v105 = 0;
      _os_log_impl(&dword_22D468000, v103, (os_log_type_t)v104, "Invalid Trial asset path", v105, 2u);
      MEMORY[0x230F81A50](v105, -1, -1);
    }

    uint64_t v106 = v127;
    ((void (*)(char *, uint64_t))v114)(v119, v127);
    return (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v75 + 56))(v120, 1, 1, v106);
  }
}

uint64_t TrialProvider.assetPath(assetName:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  long long v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = &v17[-v12];
  (*(void (**)(uint64_t))(*(void *)v1 + 152))(v11);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    uint64_t v14 = outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for URL?);
    (*(void (**)(uint64_t))(*(void *)v1 + 192))(v14);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32))(v13, v5, v6);
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    URL.path.getter();
    uint64_t v15 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
    v15(v10, v6);
    URL.init(fileURLWithPath:)();
    swift_bridgeObjectRelease();
    v15(v13, v6);
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
}

uint64_t TrialProvider.loadModel()()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  unint64_t v50 = (void (*)(char *, uint64_t))((char *)v46 - v11);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v46 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)v46 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v46 - v18;
  (*(void (**)(void))(*(void *)v0 + 208))(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    outlined destroy of Any?((uint64_t)v4, &demangling cache variable for type metadata for URL?);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v19, v4, v5);
    unint64_t v21 = v19;
    uint64_t v22 = *(void (**)(char *))(v6 + 16);
    unint64_t v51 = v21;
    v22(v17);
    type metadata accessor for MLModel();
    ((void (*)(char *, char *, uint64_t))v22)(v14, v17, v5);
    id v23 = @nonobjc MLModel.__allocating_init(contentsOf:)((uint64_t)v14);
    if (v1)
    {
      uint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
      v24(v17, v5);

      if (one-time initialization token for defaultLogger != -1) {
        swift_once();
      }
      uint64_t v25 = type metadata accessor for Logger();
      __swift_project_value_buffer(v25, (uint64_t)defaultLogger);
      ((void (*)(char *, char *, uint64_t))v22)(v9, v51, v5);
      char v26 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v26, v27))
      {
        BOOL v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        uint64_t v53 = v29;
        unint64_t v50 = v24;
        *(_DWORD *)BOOL v28 = 136315138;
        uint64_t v49 = (void (*)(char *, uint64_t))(v28 + 4);
        lazy protocol witness table accessor for type URL and conformance URL();
        uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v52 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, &v53);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        os_log_type_t v32 = v50;
        v50(v9, v5);
        _os_log_impl(&dword_22D468000, v26, v27, "Unable to load model from Trial asset path %s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x230F81A50](v29, -1, -1);
        MEMORY[0x230F81A50](v28, -1, -1);

        v32(v51, v5);
      }
      else
      {

        v24(v9, v5);
        v24(v51, v5);
      }
      return 0;
    }
    else
    {
      id v33 = v23;
      type metadata accessor for InferredHelpfulnessClassifier();
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16)  = v33;
      *(void *)(v20 + 24)  = 3;
      uint64_t v49 = *(void (**)(char *, uint64_t))(v6 + 8);
      v49(v17, v5);
      if (one-time initialization token for defaultLogger != -1) {
        swift_once();
      }
      uint64_t v34 = type metadata accessor for Logger();
      __swift_project_value_buffer(v34, (uint64_t)defaultLogger);
      uint64_t v35 = (char *)v50;
      ((void (*)(void (*)(char *, uint64_t), char *, uint64_t))v22)(v50, v51, v5);
      uint64_t v36 = Logger.logObject.getter();
      os_log_type_t v37 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        uint64_t v53 = v48;
        unint64_t v47 = v38;
        *(_DWORD *)uint64_t v38 = 136315138;
        v46[1]  = v38 + 4;
        lazy protocol witness table accessor for type URL and conformance URL();
        uint64_t v39 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v52 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, &v53);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        uint64_t v41 = v49;
        v49(v35, v5);
        os_log_type_t v42 = v37;
        uint64_t v43 = v47;
        _os_log_impl(&dword_22D468000, v36, v42, "Load model from Trial asset from %s", v47, 0xCu);
        uint64_t v44 = v48;
        swift_arrayDestroy();
        MEMORY[0x230F81A50](v44, -1, -1);
        MEMORY[0x230F81A50](v43, -1, -1);
      }
      else
      {

        uint64_t v41 = v49;
        v49(v35, v5);
      }
      v41(v51, v5);
    }
  }
  return v20;
}

unint64_t TrialProvider.loadCatIdMap()()
{
  v47[4]  = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v43 - v9;
  unint64_t v11 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  (*(void (**)(uint64_t))(*(void *)v0 + 208))(1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for URL?);
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)defaultLogger);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_22D468000, v13, v14, "Unable to load speakEasy category mapping file from Trial asset", v15, 2u);
      MEMORY[0x230F81A50](v15, -1, -1);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)defaultLogger);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      id v45 = v10;
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      unint64_t v21 = (void *)swift_slowAlloc();
      uint64_t v44 = v5;
      uint64_t v22 = v21;
      v47[0]  = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v43 = v17;
      lazy protocol witness table accessor for type URL and conformance URL();
      uint64_t v23 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v46 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, (uint64_t *)v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v25 = *(void (**)(char *, uint64_t))(v44 + 8);
      v25(v8, v4);
      _os_log_impl(&dword_22D468000, v18, v19, "Load CatIdToSpeakeasyCategory mapping from Trial asset: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v22, -1, -1);
      char v26 = v25;
      uint64_t v10 = v45;
      MEMORY[0x230F81A50](v20, -1, -1);
    }
    else
    {
      char v26 = *(void (**)(char *, uint64_t))(v5 + 8);
      v26(v8, v4);
    }

    unint64_t v11 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
    uint64_t v33 = Data.init(contentsOf:options:)();
    unint64_t v35 = v34;
    id v45 = v10;
    uint64_t v36 = self;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    v47[0]  = 0;
    id v38 = objc_msgSend(v36, sel_JSONObjectWithData_options_error_, isa, 1, v47);

    if (v38)
    {
      id v39 = v47[0];
      _bridgeAnyObjectToAny(_:)();
      outlined consume of Data._Representation(v33, v35);
      swift_unknownObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        unint64_t v11 = v46;
      }
      os_log_type_t v32 = v45;
    }
    else
    {
      id v41 = v47[0];
      os_log_type_t v42 = (void *)_convertNSErrorToError(_:)();

      swift_willThrow();
      outlined consume of Data._Representation(v33, v35);
      os_log_type_t v32 = v45;
      os_log_type_t v27 = Logger.logObject.getter();
      os_log_type_t v28 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = v32;
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl(&dword_22D468000, v27, v28, "Unable to parse CatIdToSpeakeasyCategory", v30, 2u);
        unint64_t v31 = v30;
        os_log_type_t v32 = v29;
        MEMORY[0x230F81A50](v31, -1, -1);
      }
    }
    v26(v32, v4);
  }
  return v11;
}

unint64_t TrialProvider.loadJsonFlags(_:)()
{
  v16[4]  = *(id *)MEMORY[0x263EF8340];
  unint64_t v0 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  uint64_t v6 = Data.init(contentsOf:options:)();
  unint64_t v8 = v7;
  uint64_t v9 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v16[0]  = 0;
  id v11 = objc_msgSend(v9, sel_JSONObjectWithData_options_error_, isa, 1, v16);

  if (v11)
  {
    id v12 = v16[0];
    _bridgeAnyObjectToAny(_:)();
    outlined consume of Data._Representation(v6, v8);
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      return v15;
    }
  }
  else
  {
    id v13 = v16[0];
    os_log_type_t v14 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    outlined consume of Data._Representation(v6, v8);
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    __swift_project_value_buffer(v1, (uint64_t)defaultLogger);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_22D468000, v2, v3, "Unable to parse flag file", v4, 2u);
      MEMORY[0x230F81A50](v4, -1, -1);
    }
  }
  return v0;
}

Swift::Bool __swiftcall TrialProvider.isIHPluginEnabled()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v1 - 8);
  os_log_type_t v3 = &v21[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t))(*(void *)v0 + 208))(2);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for URL?);
LABEL_16:
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)defaultLogger);
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v19 = 67109120;
      LODWORD(v22)  = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_22D468000, v17, v18, "Using default level for isIHPluginEnabled: %{BOOL}d", v19, 8u);
      MEMORY[0x230F81A50](v19, -1, -1);
    }

    LOBYTE(v11)  = 0;
    return v11;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v3, v4);
  uint64_t v8 = (*(uint64_t (**)(unsigned char *))(*(void *)v0 + 232))(v7);
  if (*(void *)(v8 + 16)
    && (unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, 0x800000022D4990A0), (v10 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v8 + 56) + 32 * v9, (uint64_t)&v22);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v23 + 1))
  {
    outlined destroy of Any?((uint64_t)&v22, &demangling cache variable for type metadata for Any?);
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_16;
  }
  int v11 = v21[15];
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)defaultLogger);
  id v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 67109120;
    LODWORD(v22)  = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_22D468000, v13, v14, "Use Trial server flag for isIHPluginEnabled: %{BOOL}d", v15, 8u);
    MEMORY[0x230F81A50](v15, -1, -1);
  }

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

uint64_t TrialProvider.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl, &demangling cache variable for type metadata for URL??);
  return v0;
}

uint64_t TrialProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl, &demangling cache variable for type metadata for URL??);
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *os_log_type_t v3 = result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *os_log_type_t v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *os_log_type_t v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *os_log_type_t v3 = (char *)result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<FlowTaskStep>);
    char v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2)  = v8;
    *((void *)v10 + 3)  = 2 * (v12 >> 5);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  os_log_type_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2)  = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<GradedConversation>);
    char v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2)  = v8;
    *((void *)v10 + 3)  = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2)  = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    char v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2)  = v8;
    *((void *)v10 + 3)  = 2 * (v12 >> 4);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  os_log_type_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2)  = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    char v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2)  = v8;
    *((void *)v10 + 3)  = 2 * (v12 >> 3);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  os_log_type_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2)  = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<URL>);
  uint64_t v10 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  void v13[2] = v8;
  v13[3]  = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  os_log_type_t v18 = (char *)v13 + v17;
  os_log_type_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2]  = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized static TrialEnrollment.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v11 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v12 = a2[5];
  if (!v3)
  {
    if (v8) {
      return 0;
    }
    goto LABEL_8;
  }
  if (!v8) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v8 || (v13 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v13 & 1) != 0))
  {
LABEL_8:
    if (v6)
    {
      if (!v11) {
        return 0;
      }
      if (v4 != v9 || v6 != v11)
      {
        char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = 0;
        if ((v15 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v11)
    {
      return 0;
    }
    if (v7)
    {
      if (v12 && (v5 == v10 && v7 == v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)) {
        return 1;
      }
    }
    else if (!v12)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t specialized TrialAsset.init(rawValue:)(Swift::String string)
{
  object  = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object  = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of TrialAsset.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys;
  if (!lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys;
  if (!lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys;
  if (!lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys;
  if (!lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys);
  }
  return result;
}

uint64_t outlined assign with take of URL??(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL??);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type URL and conformance URL()
{
  unint64_t result = lazy protocol witness table cache variable for type URL and conformance URL;
  if (!lazy protocol witness table cache variable for type URL and conformance URL)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type TrialAsset and conformance TrialAsset()
{
  unint64_t result = lazy protocol witness table cache variable for type TrialAsset and conformance TrialAsset;
  if (!lazy protocol witness table cache variable for type TrialAsset and conformance TrialAsset)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialAsset and conformance TrialAsset);
  }
  return result;
}

uint64_t sub_22D4893B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 104))();
  *a2  = result;
  return result;
}

uint64_t sub_22D4893FC(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 112))(*a1);
}

double sub_22D489450@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(_OWORD *__return_ptr))(**(void **)a1 + 128))(v5);
  long long v3 = v5[1];
  *a2  = v5[0];
  a2[1]  = v3;
  double result = *(double *)&v6;
  a2[2]  = v6;
  return result;
}

uint64_t sub_22D4894B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 152))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *double result = *a2;
  return result;
}

uint64_t getEnumTag for TrialAsset(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for TrialAsset(unsigned char *result, char a2)
{
  *double result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrialAsset()
{
  return &type metadata for TrialAsset;
}

uint64_t destroy for TrialEnrollment()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TrialEnrollment(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1  = *a2;
  a1[1]  = v3;
  uint64_t v4 = a2[3];
  a1[2]  = a2[2];
  a1[3]  = v4;
  uint64_t v5 = a2[5];
  a1[4]  = a2[4];
  a1[5]  = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TrialEnrollment(void *a1, void *a2)
{
  *a1  = *a2;
  a1[1]  = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2]  = a2[2];
  a1[3]  = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4]  = a2[4];
  a1[5]  = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16)  = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32)  = v3;
  *(__n128 *)a1  = result;
  return result;
}

void *assignWithTake for TrialEnrollment(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1  = *a2;
  a1[1]  = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2]  = a2[2];
  a1[3]  = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4]  = a2[4];
  a1[5]  = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialEnrollment(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3)  = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialEnrollment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40)  = 0;
    *(_OWORD *)(result + 24)  = 0u;
    *(_OWORD *)(result + 8)  = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48)  = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48)  = 0;
    }
    if (a2) {
      *(void *)(result + 8)  = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrialEnrollment()
{
  return &type metadata for TrialEnrollment;
}

uint64_t ObjC metadata update function for TrialProvider()
{
  return type metadata accessor for TrialProvider();
}

uint64_t type metadata accessor for TrialProvider()
{
  uint64_t result = type metadata singleton initialization cache for TrialProvider;
  if (!type metadata singleton initialization cache for TrialProvider) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void type metadata completion function for TrialProvider()
{
  type metadata accessor for URL??();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for TrialProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TrialProvider);
}

uint64_t dispatch thunk of TrialProvider.client.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of TrialProvider.client.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of TrialProvider.client.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of TrialProvider.enrollment.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of TrialProvider.enrollment.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of TrialProvider.enrollment.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of TrialProvider.assetUrl.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of TrialProvider.assetUrl.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of TrialProvider.assetUrl.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of TrialProvider.__allocating_init(client:enrollment:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of TrialProvider.setClient(client:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of TrialProvider.defaultAssetsUrl()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of TrialProvider.fetchUpdatedAssetsURL(client:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of TrialProvider.assetPath(assetName:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of TrialProvider.loadModel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of TrialProvider.loadCatIdMap()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of TrialProvider.loadJsonFlags(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of TrialProvider.isIHPluginEnabled()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

void type metadata accessor for URL??()
{
  if (!lazy cache variable for type metadata for URL??)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for URL?);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for URL??);
    }
  }
}

uint64_t getEnumTagSinglePayload for TrialAsset(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TrialAsset(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1]  = v6;
        break;
      case 2:
        *(_WORD *)(result + 1)  = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22D489D04);
      case 4:
        *(_DWORD *)(result + 1)  = v6;
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
        result[1]  = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1)  = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1)  = 0;
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

void *type metadata accessor for TrialEnrollment.CodingKeys()
{
  return &unk_26E11C790;
}

uint64_t specialized TrialEnrollment.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E656D7461657274 && a2 == 0xEB00000000644974;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D697265707865 && a2 == 0xEC0000006449746ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4974756F6C6C6F72 && a2 == 0xE900000000000064)
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

uint64_t outlined init with copy of URL??(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

Swift::Double_optional __swiftcall String.scoreRatcliffObershelp(between:)(Swift::String between)
{
  uint64_t v4 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v4 = v1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    goto LABEL_11;
  }
  object  = between._object;
  unint64_t countAndFlagsBits = between._countAndFlagsBits;
  uint64_t v7 = HIBYTE(between._object) & 0xF;
  if (((uint64_t)between._object & 0x2000000000000000) == 0) {
    uint64_t v7 = between._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
  {
LABEL_11:
    LOBYTE(v10)  = 0;
    goto LABEL_28;
  }
  unint64_t v8 = v2;
  uint64_t v9 = v1;
  if (v1 == between._countAndFlagsBits && (void *)v2 == between._object
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    LOBYTE(v10)  = 0;
    goto LABEL_28;
  }
  uint64_t v11 = String.count.getter();
  uint64_t v10 = String.count.getter();
  uint64_t v12 = v11 + v10;
  if (__OFADD__(v11, v10))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char v13 = String.commonSequences(between:)(countAndFlagsBits, (unint64_t)object, v9, v8);
  int64_t v14 = v13[2];
  if (v14)
  {
    uint64_t v26 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14, 0);
    uint64_t v15 = v26;
    uint64_t v16 = v13 + 5;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = String.count.getter();
      swift_bridgeObjectRelease();
      unint64_t v19 = *(void *)(v26 + 16);
      unint64_t v18 = *(void *)(v26 + 24);
      if (v19 >= v18 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v18 > 1, v19 + 1, 1);
      }
      v16 += 2;
      *(void *)(v26 + 16)  = v19 + 1;
      *(void *)(v26 + 8 * v19 + 32)  = v17;
      --v14;
    }
    while (v14);
    LOBYTE(v10)  = swift_bridgeObjectRelease();
    uint64_t v20 = *(void *)(v26 + 16);
    if (v20)
    {
LABEL_19:
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      while (1)
      {
        uint64_t v23 = *(void *)(v15 + 8 * v21 + 32);
        BOOL v24 = __OFADD__(v22, v23);
        v22 += v23;
        if (v24) {
          break;
        }
        if (v20 == ++v21)
        {
          swift_bridgeObjectRelease();
          double v25 = (double)v22;
          goto LABEL_25;
        }
      }
      __break(1u);
      goto LABEL_27;
    }
  }
  else
  {
    LOBYTE(v10)  = swift_bridgeObjectRelease();
    uint64_t v15 = MEMORY[0x263F8EE78];
    uint64_t v20 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v20) {
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRelease();
  double v25 = 0.0;
LABEL_25:
  double v3 = 2.0 / (double)v12 * v25;
  LOBYTE(v10)  = LOBYTE(v3);
LABEL_28:
  result.value  = v3;
  result.is_nil  = v10;
  return result;
}

void *String.commonSequences(between:)(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = String.longestCommonSubsequence(between:)();
  Swift::Double_optional result = (void *)MEMORY[0x263F8EE78];
  if (v14 >= 1)
  {
    uint64_t v16 = v11;
    uint64_t v17 = v11 - v14;
    if (__OFSUB__(v11, v14))
    {
      __break(1u);
    }
    else
    {
      int64_t v5 = v12;
      unint64_t v4 = String.index(_:offsetBy:)();
      unint64_t v13 = (unint64_t)String.index(_:offsetBy:)() >> 14;
      if (v13 >= v4 >> 14)
      {
        unint64_t v81 = v5;
        uint64_t v77 = a1;
        uint64_t v18 = String.subscript.getter();
        a1  = MEMORY[0x230F80FE0](v18);
        uint64_t v76 = v19;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        uint64_t v17 = specialized Collection.prefix(_:)(v17);
        unint64_t v4 = v20;
        int64_t v5 = v21;
        unint64_t v6 = v22;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        uint64_t v23 = String.count.getter();
        BOOL v24 = __OFSUB__(v23, v16);
        unint64_t v25 = v23 - v16;
        if (!v24)
        {
          unint64_t v75 = a1;
          unint64_t v26 = specialized BidirectionalCollection.suffix(_:)(v25, a3, a4);
          uint64_t v79 = v27;
          v80  = v26;
          uint64_t v78 = v28;
          a3  = v29;
          swift_bridgeObjectRelease();
          unint64_t v82 = (void *)MEMORY[0x263F8EE78];
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 2, 0);
          uint64_t v30 = v82;
          swift_bridgeObjectRetain();
          uint64_t v17 = MEMORY[0x230F80FE0](v17, v4, v5, v6);
          unint64_t v4 = v31;
          swift_bridgeObjectRelease();
          a1  = v82[2];
          unint64_t v13 = v82[3];
          int64_t v5 = a1 + 1;
          if (a1 < v13 >> 1) {
            goto LABEL_6;
          }
          goto LABEL_24;
        }
LABEL_23:
        __break(1u);
LABEL_24:
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v5, 1);
        uint64_t v30 = v82;
LABEL_6:
        v30[2]  = v5;
        os_log_type_t v32 = &v30[2 * a1];
        v32[4]  = v17;
        v32[5]  = v4;
        swift_bridgeObjectRetain();
        uint64_t v33 = MEMORY[0x230F80FE0](v80, v79, v78, a3);
        uint64_t v35 = v34;
        swift_bridgeObjectRelease();
        id v83 = v30;
        unint64_t v37 = v30[2];
        unint64_t v36 = v30[3];
        unint64_t v38 = v37 + 1;
        if (v37 >= v36 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v36 > 1, v37 + 1, 1);
        }
        v30[2]  = v38;
        id v39 = &v30[2 * v37];
        v39[4]  = v33;
        v39[5]  = v35;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v41 = v81 - v14;
        if (__OFSUB__(v81, v14))
        {
          __break(1u);
        }
        else
        {
          swift_bridgeObjectRetain();
          unint64_t v6 = specialized Collection.prefix(_:)(v41);
          uint64_t v41 = v42;
          uint64_t v33 = v43;
          uint64_t v45 = v44;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          uint64_t v46 = String.count.getter();
          BOOL v24 = __OFSUB__(v46, v81);
          unint64_t v47 = v46 - v81;
          if (!v24)
          {
            unint64_t v48 = specialized BidirectionalCollection.suffix(_:)(v47, v77, a2);
            v80  = v49;
            unint64_t v81 = v48;
            unint64_t v38 = v50;
            unint64_t v37 = v51;
            swift_bridgeObjectRelease();
            id v83 = (void *)MEMORY[0x263F8EE78];
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 2, 0);
            uint64_t v52 = v83;
            swift_bridgeObjectRetain();
            uint64_t v41 = MEMORY[0x230F80FE0](v6, v41, v33, v45);
            uint64_t v33 = v53;
            swift_bridgeObjectRelease();
            unint64_t v6 = v83[2];
            unint64_t v40 = v83[3];
            a2  = v6 + 1;
            if (v6 < v40 >> 1) {
              goto LABEL_11;
            }
            goto LABEL_27;
          }
        }
        __break(1u);
LABEL_27:
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v40 > 1, a2, 1);
        uint64_t v52 = v83;
LABEL_11:
        v52[2]  = a2;
        uint64_t v54 = &v52[2 * v6];
        v54[4]  = v41;
        v54[5]  = v33;
        swift_bridgeObjectRetain();
        uint64_t v55 = MEMORY[0x230F80FE0](v81, v80, v38, v37);
        uint64_t v57 = v56;
        swift_bridgeObjectRelease();
        unint64_t v59 = v52[2];
        unint64_t v58 = v52[3];
        if (v59 >= v58 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v58 > 1, v59 + 1, 1);
        }
        v52[2]  = v59 + 1;
        id v60 = &v52[2 * v59];
        v60[4]  = v55;
        v60[5]  = v57;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        Swift::Double_optional result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, MEMORY[0x263F8EE78]);
        uint64_t v61 = result;
        v63  = result[2];
        unint64_t v62 = result[3];
        if (v63 >= v62 >> 1)
        {
          Swift::Double_optional result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v62 > 1), v63 + 1, 1, result);
          uint64_t v61 = result;
        }
        v61[2]  = v63 + 1;
        uint64_t v64 = &v61[2 * v63];
        v64[4]  = v75;
        v64[5]  = v76;
        unint64_t v84 = v61;
        if (v30[2])
        {
          if (v52[2])
          {
            uint64_t v66 = v30[4];
            uint64_t v65 = v30[5];
            uint64_t v67 = v52[4];
            uint64_t v68 = v52[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v69 = String.commonSequences(between:)(v67, v68, v66, v65);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            Swift::Double_optional result = (void *)specialized Array.append<A>(contentsOf:)(v69);
            if (v30[2] >= 2uLL)
            {
              uint64_t v71 = v30[6];
              uint64_t v70 = v30[7];
              swift_bridgeObjectRetain();
              Swift::Double_optional result = (void *)swift_release();
              if (v52[2] >= 2uLL)
              {
                uint64_t v72 = v52[6];
                uint64_t v73 = v52[7];
                swift_bridgeObjectRetain();
                swift_release();
                uint64_t v74 = String.commonSequences(between:)(v72, v73, v71, v70);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                specialized Array.append<A>(contentsOf:)(v74);
                return v84;
              }
LABEL_31:
              __break(1u);
              return result;
            }
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_30;
      }
    }
    __break(1u);
    goto LABEL_23;
  }
  return result;
}

uint64_t String.longestCommonSubsequence(between:)()
{
  uint64_t v0 = String.count.getter();
  if (__OFADD__(v0, 1)) {
    goto LABEL_41;
  }
  uint64_t v1 = specialized Array.init(repeating:count:)(0, v0 + 1);
  uint64_t v2 = String.count.getter();
  if (__OFADD__(v2, 1)) {
    goto LABEL_42;
  }
  uint64_t v3 = specialized Array.init(repeating:count:)(v1, v2 + 1);
  swift_bridgeObjectRetain();
  unint64_t v26 = (void *)v3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_43;
  }
  while (1)
  {
    Swift::String_optional v4 = String.Iterator.next()();
    if (!v4.value._object) {
      break;
    }
    uint64_t countAndFlagsBits = v4.value._countAndFlagsBits;
    object  = v4.value._object;
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    unint64_t v27 = 0;
    unint64_t v28 = 0;
    uint64_t v9 = v26 + 4;
    while (1)
    {
      unint64_t v11 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        break;
      }
      swift_bridgeObjectRetain();
      unint64_t v12 = 0;
LABEL_9:
      unint64_t v13 = v12;
      while (1)
      {
        unint64_t v15 = v13;
        Swift::String_optional v16 = String.Iterator.next()();
        if (!v16.value._object) {
          break;
        }
        unint64_t v12 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
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
          goto LABEL_40;
        }
        if (countAndFlagsBits == v16.value._countAndFlagsBits && object == v16.value._object)
        {
          swift_bridgeObjectRelease();
LABEL_16:
          unint64_t v17 = v26[2];
          if (v7 >= v17) {
            goto LABEL_35;
          }
          uint64_t v18 = v9[v7];
          if (v15 >= *(void *)(v18 + 16)) {
            goto LABEL_36;
          }
          uint64_t v19 = *(void *)(v18 + 8 * v15 + 32);
          uint64_t v20 = v19 + 1;
          if (__OFADD__(v19, 1)) {
            goto LABEL_37;
          }
          if (v11 >= v17) {
            goto LABEL_38;
          }
          int64_t v21 = (void *)v9[v11];
          isUniquelyReferenced_nonNull_native  = swift_isUniquelyReferenced_nonNull_native();
          v9[v11]  = v21;
          if (isUniquelyReferenced_nonNull_native)
          {
            if ((v12 & 0x8000000000000000) == 0) {
              goto LABEL_22;
            }
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
          int64_t v21 = specialized _ArrayBuffer._consumeAndCreateNew()(v21);
          v9[v11]  = v21;
          if ((v12 & 0x8000000000000000) != 0) {
            goto LABEL_31;
          }
LABEL_22:
          if (v12 >= v21[2]) {
            goto LABEL_39;
          }
          v21[v12 + 4]  = v20;
          if (v8 >= v20) {
            unint64_t v23 = v28;
          }
          else {
            unint64_t v23 = v12;
          }
          unint64_t v24 = v27;
          if (v8 < v20) {
            unint64_t v24 = v7 + 1;
          }
          unint64_t v27 = v24;
          unint64_t v28 = v23;
          if (v8 <= v20) {
            uint64_t v8 = v20;
          }
          goto LABEL_9;
        }
        char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        unint64_t v13 = v15 + 1;
        if (v14) {
          goto LABEL_16;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      Swift::String_optional v10 = String.Iterator.next()();
      uint64_t countAndFlagsBits = v10.value._countAndFlagsBits;
      object  = v10.value._object;
      ++v7;
      if (!v10.value._object) {
        goto LABEL_33;
      }
    }
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    unint64_t v26 = specialized _ArrayBuffer._consumeAndCreateNew()(v26);
  }
LABEL_32:
  uint64_t v8 = 0;
LABEL_33:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t specialized Array.init(repeating:count:)(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (!a2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(result + 16)  = a2;
  int64_t v5 = (unint64_t *)(result + 32);
  if (a2 < 4)
  {
    unint64_t v6 = 0;
LABEL_9:
    unint64_t v10 = a2 - v6;
    do
    {
      *v5++  = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += a2 & 0xFFFFFFFFFFFFFFFCLL;
  int64x2_t v7 = vdupq_n_s64(a1);
  uint64_t v8 = (int64x2_t *)(result + 48);
  unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1]  = v7;
    *uint64_t v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v6 != a2) {
    goto LABEL_9;
  }
  return result;
}

uint64_t specialized Array.init(repeating:count:)(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
      Swift::String_optional v4 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
      int64_t v5 = v4;
      v4[2]  = a2;
      v4[4]  = a1;
      if (a2 != 1)
      {
        v4[5]  = a1;
        uint64_t v6 = a2 - 2;
        if (v6)
        {
          int64x2_t v7 = v4 + 6;
          do
          {
            *v7++  = a1;
            swift_bridgeObjectRetain();
            --v6;
          }
          while (v6);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x263F8EE78];
    }
    return (uint64_t)v5;
  }
  return result;
}

void *specialized _ArrayBuffer._consumeAndCreateNew()(void *a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
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
    return String.subscript.getter();
  }
  return result;
}

uint64_t specialized Collection.prefix(_:)(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    type metadata accessor for FeaturedTurn(0);
    Swift::Int v10 = 0;
    do
    {
      Swift::Int v11 = v10 + 1;
      _ArrayBuffer._typeCheckSlowPath(_:)(v10);
      Swift::Int v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = _CocoaArrayWrapper.subscript.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

unint64_t specialized BidirectionalCollection.suffix(_:)(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t result = String.index(_:offsetBy:limitedBy:)();
  if (v4) {
    uint64_t result = 15;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_12;
  }
  return String.subscript.getter();
}

uint64_t specialized Collection.featureValueByType<A, B>(as:)(uint64_t a1, uint64_t (*a2)(void))
{
  unint64_t v2 = a2();
  unint64_t v3 = v2;
  if (v2 >> 62)
  {
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t result = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    MEMORY[0x230F812A0](0, v3);
    goto LABEL_6;
  }
  if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_6:
    swift_bridgeObjectRelease();
    swift_retain();
    dispatch thunk of TypedFeature.value.getter();
    swift_release_n();
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t SequenceFeatureExtractor.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16)  = &outlined read-only object #0 of SequenceFeatureExtractor.__allocating_init();
  return result;
}

uint64_t SequenceFeatureExtractor.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16)  = &outlined read-only object #0 of SequenceFeatureExtractor.init();
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(double **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = specialized static SequenceFeatureExtractor.secondsTillNexRequest(_:)(*a1);
  *a2  = result;
  return result;
}

uint64_t implicit closure #2 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = specialized static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(*a1, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:), (void (*)(void))type metadata accessor for TextSimilarityScoreWithNextRequest);
  *a2  = result;
  return result;
}

uint64_t static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(uint64_t a1)
{
  return specialized static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(a1, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:), (void (*)(void))type metadata accessor for TextSimilarityScoreWithNextRequest);
}

uint64_t implicit closure #3 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = specialized static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(*a1, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:), (void (*)(void))type metadata accessor for PhoneticRestatementScoreWithNextRequest);
  *a2  = result;
  return result;
}

uint64_t static SequenceFeatureExtractor.phoneticRestatementScoreWithNextRequest(_:)(uint64_t a1)
{
  return specialized static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(a1, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:), (void (*)(void))type metadata accessor for PhoneticRestatementScoreWithNextRequest);
}

uint64_t implicit closure #4 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(uint64_t *a1@<X8>)
{
  return implicit closure #4 in variable initialization expression of SequenceFeatureExtractor.featureExtractors((void (*)(void))type metadata accessor for ConfirmationFollowed, a1);
}

uint64_t static SequenceFeatureExtractor.confirmationFollowed(_:)(uint64_t a1)
{
  return static SequenceFeatureExtractor.confirmationFollowed(_:)(a1, (void (*)(void))type metadata accessor for ConfirmationFollowed);
}

uint64_t implicit closure #5 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(uint64_t *a1@<X8>)
{
  return implicit closure #4 in variable initialization expression of SequenceFeatureExtractor.featureExtractors((void (*)(void))type metadata accessor for CancellationFollowed, a1);
}

uint64_t implicit closure #4 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(void (*a1)(void)@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Confidence();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  Swift::Int v10 = (char *)v13 - v9;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))((char *)v13 - v9, *MEMORY[0x263F73EB0], v4);
  a1(0);
  swift_allocObject();
  v13[3]  = 0;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  uint64_t v11 = TypedFeature.init(value:confidence:)();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  *a2  = v11;
  return result;
}

uint64_t static SequenceFeatureExtractor.cancellationFollowed(_:)(uint64_t a1)
{
  return static SequenceFeatureExtractor.confirmationFollowed(_:)(a1, (void (*)(void))type metadata accessor for CancellationFollowed);
}

uint64_t static SequenceFeatureExtractor.confirmationFollowed(_:)(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = type metadata accessor for Confidence();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v12 - v8;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))((char *)v12 - v8, *MEMORY[0x263F73EB0], v3);
  a2(0);
  swift_allocObject();
  uint64_t v12[3] = 0;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  uint64_t v10 = TypedFeature.init(value:confidence:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  return v10;
}

uint64_t SequenceFeatureExtractor.featureExtractors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SequenceFeatureExtractor.extract(from:)(uint64_t a1)
{
  void (*v7)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = v4 + 40;
    do
    {
      uint64_t v7 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v6 - 8);
      uint64_t v10 = a1;
      swift_retain();
      v7(&v9, &v10);
      swift_release();
      if (v9)
      {
        uint64_t v8 = swift_retain();
        MEMORY[0x230F81080](v8);
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        swift_release();
      }
      v6 += 16;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    return v11;
  }
  return result;
}

uint64_t static SequenceFeatureExtractor.secondsBetweenTurns(_:_:)(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return fabs(*(double *)(a1 + 40) - *(double *)(a2 + 40));
  }
  else {
    return 0;
  }
}

uint64_t static SequenceFeatureExtractor.textSimilarityScoreBetweenTurns(_:_:)(uint64_t a1, uint64_t a2)
{
  return static SequenceFeatureExtractor.textSimilarityScoreBetweenTurns(_:_:)(a1, a2, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:));
}

uint64_t static SequenceFeatureExtractor.phoneticRestatementScoreBetweenTurns(_:_:)(uint64_t a1, uint64_t a2)
{
  return static SequenceFeatureExtractor.textSimilarityScoreBetweenTurns(_:_:)(a1, a2, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:));
}

uint64_t static SequenceFeatureExtractor.textSimilarityScoreBetweenTurns(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)a1 + 120))();
  specialized Collection.featureValueByType<A, B>(as:)(v5, a3);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (!v7) {
    return 0;
  }
  if (!a2)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)a2 + 120);
  uint64_t v9 = swift_retain();
  uint64_t v10 = v8(v9);
  uint64_t v11 = specialized Collection.featureValueByType<A, B>(as:)(v10, a3);
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if (!v13)
  {
    swift_bridgeObjectRelease();
    swift_release();
    return 0;
  }
  v14._uint64_t countAndFlagsBits = v11;
  v14._object  = v13;
  Swift::Double_optional v17 = String.scoreRatcliffObershelp(between:)(v14);
  uint64_t v15 = *(void *)&v17.is_nil;
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t ConfirmationFollowed.__allocating_init(value:confidence:)(int a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Confidence();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  v10[3]  = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v8 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v8;
}

uint64_t SequenceFeatureExtractor.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SequenceFeatureExtractor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t protocol witness for FeatureExtracting.extract(from:) in conformance SequenceFeatureExtractor(void *a1)
{
  return (*(uint64_t (**)(void))(**(void **)v1 + 96))(*a1);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for SecondsTillNextRequest);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to PhoneticRestatementScoreWithNextRequest.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for PhoneticRestatementScoreWithNextRequest);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  a3(0);
  swift_allocObject();
  v13[1]  = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t v11 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v11;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to TextSimilarityScoreWithNextRequest.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for TextSimilarityScoreWithNextRequest);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextConversation.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for SecondsTillNextConversation);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to PhoneticRestatementScoreWithNextConversation.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for PhoneticRestatementScoreWithNextConversation);
}

uint64_t SecondsTillNextRequest.__allocating_init(value:confidence:)(uint64_t a1, double a2)
{
  uint64_t v4 = type metadata accessor for Confidence();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  *(double *)&v10[1]  = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v8;
}

uint64_t SecondsTillNextRequest.init(value:confidence:)(uint64_t a1, double a2)
{
  uint64_t v4 = type metadata accessor for Confidence();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  *(double *)&v9[1]  = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  uint64_t v7 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v7;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to TextSimilarityScoreWithNextConversation.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for TextSimilarityScoreWithNextConversation);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to ConfirmationFollowed.__allocating_init(value:confidence:)(_DWORD *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to ConfirmationFollowed.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for ConfirmationFollowed);
}

uint64_t ConfirmationFollowed.init(value:confidence:)(int a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Confidence();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v9[3]  = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  uint64_t v7 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v7;
}

uint64_t CancellationFollowed.__deallocating_deinit()
{
  uint64_t v0 = TypedFeature.deinit();
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to CancellationFollowed.__allocating_init(value:confidence:)(_DWORD *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to ConfirmationFollowed.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for CancellationFollowed);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to ConfirmationFollowed.__allocating_init(value:confidence:)(_DWORD *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(a1)  = *a1;
  a3(0);
  swift_allocObject();
  uint64_t v12[3] = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t v10 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v10;
}

uint64_t specialized static SequenceFeatureExtractor.secondsTillNexRequest(_:)(double *a1)
{
  uint64_t v2 = type metadata accessor for Confidence();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v15 - v7;
  unint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 272))(1, 1);
  unint64_t v10 = v9;
  if (!(v9 >> 62))
  {
    uint64_t result = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v10 & 0xC000000000000001) != 0)
  {
    uint64_t v12 = MEMORY[0x230F812A0](0, v10);
    goto LABEL_6;
  }
  if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v12 = *(void *)(v10 + 32);
    swift_retain();
LABEL_6:
    swift_bridgeObjectRelease();
    double v13 = vabdd_f64(a1[5], *(double *)(v12 + 40));
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v8, *MEMORY[0x263F73EB0], v2);
    type metadata accessor for SecondsTillNextRequest(0);
    swift_allocObject();
    *(double *)&v15[1]  = v13;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    uint64_t v14 = TypedFeature.init(value:confidence:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    swift_release();
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t specialized static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(uint64_t a1, uint64_t (*a2)(void), void (*a3)(void))
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v33 - v11;
  unint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 272))(1, 1);
  unint64_t v14 = v13;
  if (!(v13 >> 62))
  {
    uint64_t result = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v17 = swift_bridgeObjectRelease();
    uint64_t v16 = 0;
LABEL_9:
    uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(v17);
    specialized Collection.featureValueByType<A, B>(as:)(v18, a2);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    if (v20)
    {
      if (!v16)
      {
        swift_bridgeObjectRelease();
        return 0;
      }
      uint64_t v34 = a3;
      uint64_t v35 = v7;
      int64_t v21 = *(uint64_t (**)(uint64_t))(*(void *)v16 + 120);
      uint64_t v22 = swift_retain();
      uint64_t v23 = v21(v22);
      uint64_t v24 = specialized Collection.featureValueByType<A, B>(as:)(v23, a2);
      unint64_t v26 = v25;
      swift_bridgeObjectRelease();
      if (!v26)
      {
        swift_bridgeObjectRelease();
        swift_release_n();
        return 0;
      }
      v27._uint64_t countAndFlagsBits = v24;
      v27._object  = v26;
      Swift::Double_optional v37 = String.scoreRatcliffObershelp(between:)(v27);
      uint64_t v28 = *(void *)&v37.is_nil;
      char v30 = v29;
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0)
      {
        uint64_t v31 = v35;
        (*(void (**)(char *, void, uint64_t))(v35 + 104))(v12, *MEMORY[0x263F73EB0], v6);
        v34(0);
        swift_allocObject();
        uint64_t v36 = v28;
        (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v10, v12, v6);
        uint64_t v32 = TypedFeature.init(value:confidence:)();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v6);
        swift_release();
        return v32;
      }
    }
    swift_release();
    return 0;
  }
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v14 & 0xC000000000000001) != 0)
  {
    uint64_t v16 = MEMORY[0x230F812A0](0, v14);
    goto LABEL_6;
  }
  if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v16 = *(void *)(v14 + 32);
    swift_retain();
LABEL_6:
    uint64_t v17 = swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ConfirmationFollowed(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for ConfirmationFollowed);
}

uint64_t type metadata accessor for CancellationFollowed(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for CancellationFollowed);
}

uint64_t type metadata accessor for SequenceFeatureExtractor()
{
  return self;
}

uint64_t method lookup function for SequenceFeatureExtractor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SequenceFeatureExtractor);
}

uint64_t dispatch thunk of SequenceFeatureExtractor.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SequenceFeatureExtractor.extract(from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t type metadata accessor for SecondsTillNextRequest(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for SecondsTillNextRequest);
}

uint64_t type metadata completion function for SecondsTillNextRequest()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for SecondsTillNextRequest()
{
  return type metadata accessor for SecondsTillNextRequest(0);
}

uint64_t type metadata accessor for PhoneticRestatementScoreWithNextRequest(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for PhoneticRestatementScoreWithNextRequest);
}

uint64_t type metadata completion function for PhoneticRestatementScoreWithNextRequest()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for PhoneticRestatementScoreWithNextRequest()
{
  return type metadata accessor for PhoneticRestatementScoreWithNextRequest(0);
}

uint64_t type metadata accessor for TextSimilarityScoreWithNextRequest(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for TextSimilarityScoreWithNextRequest);
}

uint64_t type metadata completion function for TextSimilarityScoreWithNextRequest()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for TextSimilarityScoreWithNextRequest()
{
  return type metadata accessor for TextSimilarityScoreWithNextRequest(0);
}

uint64_t type metadata accessor for SecondsTillNextConversation(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for SecondsTillNextConversation);
}

uint64_t type metadata completion function for SecondsTillNextConversation()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for SecondsTillNextConversation()
{
  return type metadata accessor for SecondsTillNextConversation(0);
}

uint64_t type metadata accessor for PhoneticRestatementScoreWithNextConversation(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for PhoneticRestatementScoreWithNextConversation);
}

uint64_t type metadata completion function for PhoneticRestatementScoreWithNextConversation()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for PhoneticRestatementScoreWithNextConversation()
{
  return type metadata accessor for PhoneticRestatementScoreWithNextConversation(0);
}

uint64_t type metadata accessor for TextSimilarityScoreWithNextConversation(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for TextSimilarityScoreWithNextConversation);
}

uint64_t type metadata completion function for TextSimilarityScoreWithNextConversation()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for TextSimilarityScoreWithNextConversation()
{
  return type metadata accessor for TextSimilarityScoreWithNextConversation(0);
}

uint64_t type metadata completion function for ConfirmationFollowed()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for ConfirmationFollowed()
{
  return type metadata accessor for ConfirmationFollowed(0);
}

uint64_t type metadata completion function for CancellationFollowed()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for CancellationFollowed()
{
  return type metadata accessor for CancellationFollowed(0);
}

const char *FeatureFlag.domain.getter()
{
  return "SiriInferredHelpfulness";
}

const char *FeatureFlag.feature.getter()
{
  uint64_t v1 = "persistence";
  if (*v0 != 1) {
    uint64_t v1 = "logging";
  }
  if (*v0) {
    return v1;
  }
  else {
    return "SiriIH";
  }
}

Swift::Bool __swiftcall FeatureFlag.isOn()()
{
  char v1 = *v0;
  uint64_t v5 = &type metadata for FeatureFlag;
  unint64_t v6 = lazy protocol witness table accessor for type FeatureFlag and conformance FeatureFlag();
  v4[0]  = v1;
  char v2 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2 & 1;
}

unint64_t lazy protocol witness table accessor for type FeatureFlag and conformance FeatureFlag()
{
  unint64_t result = lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag;
  if (!lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag;
  if (!lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag);
  }
  return result;
}

BOOL static FeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void FeatureFlag.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int FeatureFlag.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for FeatureFlagStateProviding.isOn() in conformance FeatureFlag(uint64_t a1)
{
  char v2 = *v1;
  uint64_t v6 = a1;
  unint64_t v7 = lazy protocol witness table accessor for type FeatureFlag and conformance FeatureFlag();
  v5[0]  = v2;
  char v3 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3 & 1;
}

const char *protocol witness for FeatureFlagsKey.domain.getter in conformance FeatureFlag()
{
  return "SiriInferredHelpfulness";
}

const char *protocol witness for FeatureFlagsKey.feature.getter in conformance FeatureFlag()
{
  Swift::UInt v1 = "persistence";
  if (*v0 != 1) {
    Swift::UInt v1 = "logging";
  }
  if (*v0) {
    return v1;
  }
  else {
    return "SiriIH";
  }
}

uint64_t dispatch thunk of FeatureFlagStateProviding.isOn()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

unsigned char *storeEnumTagSinglePayload for FeatureFlag(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1]  = v6;
        break;
      case 2:
        *(_WORD *)(result + 1)  = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22D48CB24);
      case 4:
        *(_DWORD *)(result + 1)  = v6;
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
        result[1]  = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1)  = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1)  = 0;
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

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

uint64_t UEIFeatureExtractor.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v3 = static TrialProvider.shared;
  swift_retain();
  unint64_t v4 = specialized static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)(v2, v3);
  swift_retain();

  swift_release();
  *(void *)(v0 + 16)  = v4;
  swift_release();
  return v0;
}

uint64_t UEIFeatureExtractor.catIdToSpeakeasyCategory.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UEIFeatureExtractor.catIdToSpeakeasyCategory.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16)  = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*UEIFeatureExtractor.catIdToSpeakeasyCategory.modify())()
{
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t UEIFeatureExtractor.init()()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = self;
  swift_retain();
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v4 = static TrialProvider.shared;
  swift_retain();
  unint64_t v5 = specialized static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)(v3, v4);

  swift_release();
  *(void *)(v0 + 16)  = v5;
  swift_release();
  return v0;
}

uint64_t one-time initialization function for dismissalReasonMap()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(SISchemaDismissalReason, String)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16)  = xmmword_22D495C40;
  *(_DWORD *)(inited + 32)  = 13;
  *(void *)(inited + 40)  = 0x74756F68636E7550;
  *(void *)(inited + 48)  = 0xE800000000000000;
  *(_DWORD *)(inited + 56)  = 14;
  *(void *)(inited + 64)  = 0x74756F68636E7550;
  *(void *)(inited + 72)  = 0xE800000000000000;
  *(_DWORD *)(inited + 80)  = 11;
  *(void *)(inited + 88)  = 0x74756F68636E7550;
  *(void *)(inited + 96)  = 0xE800000000000000;
  *(_DWORD *)(inited + 104)  = 12;
  *(void *)(inited + 112)  = 1919251285;
  *(void *)(inited + 120)  = 0xE400000000000000;
  *(_DWORD *)(inited + 128)  = 9;
  *(void *)(inited + 136)  = 1919251285;
  *(void *)(inited + 144)  = 0xE400000000000000;
  *(_DWORD *)(inited + 152)  = 15;
  *(void *)(inited + 160)  = 1919251285;
  *(void *)(inited + 168)  = 0xE400000000000000;
  *(_DWORD *)(inited + 176)  = 8;
  *(void *)(inited + 184)  = 1919251285;
  *(void *)(inited + 192)  = 0xE400000000000000;
  *(_DWORD *)(inited + 200)  = 10;
  *(void *)(inited + 208)  = 1919251285;
  *(void *)(inited + 216)  = 0xE400000000000000;
  *(_DWORD *)(inited + 224)  = 4;
  *(void *)(inited + 232)  = 0x656D6954656C6449;
  *(void *)(inited + 240)  = 0xE900000000000072;
  *(_DWORD *)(inited + 248)  = 2;
  *(void *)(inited + 256)  = 0x6D6574737953;
  *(void *)(inited + 264)  = 0xE600000000000000;
  *(_DWORD *)(inited + 272)  = 1;
  *(void *)(inited + 280)  = 0x6D6574737953;
  *(void *)(inited + 288)  = 0xE600000000000000;
  *(_DWORD *)(inited + 296)  = 7;
  *(void *)(inited + 304)  = 0x6D6574737953;
  *(void *)(inited + 312)  = 0xE600000000000000;
  *(_DWORD *)(inited + 320)  = 6;
  *(void *)(inited + 328)  = 0x6D6574737953;
  *(void *)(inited + 336)  = 0xE600000000000000;
  *(_DWORD *)(inited + 344)  = 5;
  *(void *)(inited + 352)  = 0x6D6574737953;
  *(void *)(inited + 360)  = 0xE600000000000000;
  *(_DWORD *)(inited + 368)  = 3;
  *(void *)(inited + 376)  = 0xD000000000000011;
  *(void *)(inited + 384)  = 0x800000022D499500;
  *(_DWORD *)(inited + 392)  = 0;
  *(void *)(inited + 400)  = 1819047246;
  *(void *)(inited + 408)  = 0xE400000000000000;
  unint64_t v1 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (SISchemaDismissalReason, String));
  uint64_t result = swift_arrayDestroy();
  static UEIFeatureExtractor.dismissalReasonMap  = v1;
  return result;
}

uint64_t *UEIFeatureExtractor.dismissalReasonMap.unsafeMutableAddressor()
{
  if (one-time initialization token for dismissalReasonMap != -1) {
    swift_once();
  }
  return &static UEIFeatureExtractor.dismissalReasonMap;
}

uint64_t static UEIFeatureExtractor.dismissalReasonMap.getter()
{
  if (one-time initialization token for dismissalReasonMap != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static UEIFeatureExtractor.dismissalReasonMap.setter(uint64_t a1)
{
  if (one-time initialization token for dismissalReasonMap != -1) {
    swift_once();
  }
  swift_beginAccess();
  static UEIFeatureExtractor.dismissalReasonMap  = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static UEIFeatureExtractor.dismissalReasonMap.modify())()
{
  if (one-time initialization token for dismissalReasonMap != -1) {
    swift_once();
  }
  swift_beginAccess();
  return InferredHelpfulnessInference.classifier.modify;
}

uint64_t UEIFeatureExtractor.extract(from:)(int64_t a1)
{
  uint64_t v88 = type metadata accessor for Confidence();
  uint64_t v6 = *(void *)(v88 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v88);
  uint64_t v9 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v80 - v10;
  uint64_t v96 = MEMORY[0x263F8EE78];
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v1 = a1;
    }
    else {
      uint64_t v1 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  id v86 = v11;
  uint64_t v87 = v6;
  id v89 = v9;
  if (v12)
  {
    if (v12 < 1)
    {
      __break(1u);
LABEL_81:
      swift_once();
LABEL_63:
      v63  = type metadata accessor for Logger();
      __swift_project_value_buffer(v63, (uint64_t)defaultLogger);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v64 = Logger.logObject.getter();
      os_log_type_t v65 = static os_log_type_t.debug.getter();
      BOOL v66 = os_log_type_enabled(v64, v65);
      uint64_t v82 = v1;
      int64_t v83 = a1;
      v80  = v12;
      uint64_t v81 = v4;
      if (v66)
      {
        unint64_t v67 = v1;
        uint64_t v68 = swift_slowAlloc();
        uint64_t v69 = swift_slowAlloc();
        unint64_t v93 = (void *)v69;
        *(_DWORD *)uint64_t v68 = 136315650;
        swift_bridgeObjectRetain();
        uint64_t v95 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v12, (uint64_t *)&v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v68 + 12)  = 2080;
        swift_bridgeObjectRetain();
        uint64_t v95 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v84, v67, (uint64_t *)&v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v9 = v89;
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v68 + 22)  = 2080;
        swift_bridgeObjectRetain();
        uint64_t v95 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v85, a1, (uint64_t *)&v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22D468000, v64, v65, "%s \t %s \t %s", (uint8_t *)v68, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x230F81A50](v69, -1, -1);
        MEMORY[0x230F81A50](v68, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      uint64_t v71 = v86;
      uint64_t v70 = v87;
      uint64_t v72 = *(void (**)(void))(v87 + 104);
      LODWORD(v92)  = *MEMORY[0x263F73EB0];
      uint64_t v73 = v88;
      uint64_t v91 = (void (*)(char *, void, uint64_t))v72;
      v72(v86);
      type metadata accessor for CatIdSequence(0);
      swift_allocObject();
      unint64_t v93 = v3;
      uint64_t v90 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
      v90(v9, v71, v73);
      TypedFeature.init(value:confidence:)();
      uint64_t v74 = *(uint64_t (**)(char *, uint64_t))(v70 + 8);
      uint64_t v75 = v74(v71, v73);
      MEMORY[0x230F81080](v75);
      if (*(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      v91(v71, v92, v73);
      type metadata accessor for CatId(0);
      swift_allocObject();
      unint64_t v93 = (void *)v81;
      uint64_t v94 = v80;
      v90(v9, v71, v73);
      TypedFeature.init(value:confidence:)();
      uint64_t v76 = v74(v71, v73);
      MEMORY[0x230F81080](v76);
      if (*(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      v91(v71, v92, v73);
      type metadata accessor for SpeakeasyCategory(0);
      swift_allocObject();
      unint64_t v93 = v84;
      uint64_t v94 = v82;
      v90(v9, v71, v73);
      TypedFeature.init(value:confidence:)();
      uint64_t v77 = v74(v71, v73);
      MEMORY[0x230F81080](v77);
      if (*(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      v91(v71, v92, v73);
      type metadata accessor for DismissalReason(0);
      swift_allocObject();
      unint64_t v93 = (void *)v85;
      uint64_t v94 = v83;
      v90(v9, v71, v73);
      TypedFeature.init(value:confidence:)();
      uint64_t v78 = v74(v71, v73);
      MEMORY[0x230F81080](v78);
      if (*(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      return v96;
    }
    uint64_t v90 = v2;
    unint64_t v13 = a1 & 0xC000000000000001;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v14 = 0;
      id v3 = (void *)MEMORY[0x263F8EE78];
      do
      {
        MEMORY[0x230F812A0](v14, a1);
        uint64_t v16 = static UEIEvents.dialogID(_:)();
        uint64_t v18 = v17;
        swift_unknownObjectRelease();
        if (v18)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1, v3);
          }
          unint64_t v20 = v3[2];
          unint64_t v19 = v3[3];
          if (v20 >= v19 >> 1) {
            id v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v19 > 1), v20 + 1, 1, v3);
          }
          v3[2]  = v20 + 1;
          uint64_t v15 = &v3[2 * v20];
          v15[4]  = v16;
          v15[5]  = v18;
        }
        ++v14;
      }
      while (v12 != v14);
    }
    else
    {
      uint64_t v26 = 0;
      id v3 = (void *)MEMORY[0x263F8EE78];
      do
      {
        id v28 = *(id *)(a1 + 8 * v26 + 32);
        uint64_t v29 = static UEIEvents.dialogID(_:)();
        uint64_t v31 = v30;

        if (v31)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1, v3);
          }
          unint64_t v33 = v3[2];
          unint64_t v32 = v3[3];
          if (v33 >= v32 >> 1) {
            id v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v32 > 1), v33 + 1, 1, v3);
          }
          v3[2]  = v33 + 1;
          Swift::String v27 = &v3[2 * v33];
          v27[4]  = v29;
          v27[5]  = v31;
        }
        ++v26;
      }
      while (v12 != v26);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v34 = 0;
    uint64_t v91 = (void (*)(char *, void, uint64_t))(a1 & 0xC000000000000001);
    uint64_t v92 = (void *)MEMORY[0x263F8EE78];
    uint64_t v35 = (SEL *)&unk_2649AE000;
    do
    {
      if (v13) {
        id v36 = (id)MEMORY[0x230F812A0](v34, a1);
      }
      else {
        id v36 = *(id *)(a1 + 8 * v34 + 32);
      }
      Swift::Double_optional v37 = v36;
      id v38 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
      if (v38)
      {
        id v39 = v38;
        id v40 = [v38 v35[160]];
        if (v40
          && (uint64_t v41 = v40,
              id v42 = objc_msgSend(v40, sel_dismissed),
              v41,
              v42))
        {
          uint64_t v43 = v35;
          Swift::UInt32 v44 = objc_msgSend(v42, sel_dismissalReason);

          if (one-time initialization token for dismissalReasonMap != -1) {
            swift_once();
          }
          swift_beginAccess();
          uint64_t v45 = static UEIFeatureExtractor.dismissalReasonMap;
          if (*(void *)(static UEIFeatureExtractor.dismissalReasonMap + 16)
            && (unint64_t v46 = specialized __RawDictionaryStorage.find<A>(_:)(v44), (v47 & 1) != 0))
          {
            unint64_t v48 = (uint64_t *)(*(void *)(v45 + 56) + 16 * v46);
            uint64_t v50 = *v48;
            uint64_t v49 = v48[1];
            swift_endAccess();
            swift_bridgeObjectRetain();

            uint64_t v35 = v43;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v92 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v92[2] + 1, 1, v92);
            }
            unint64_t v13 = (unint64_t)v91;
            unint64_t v52 = v92[2];
            unint64_t v51 = v92[3];
            if (v52 >= v51 >> 1) {
              uint64_t v92 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v51 > 1), v52 + 1, 1, v92);
            }
            uint64_t v53 = v92;
            v92[2]  = v52 + 1;
            uint64_t v54 = &v53[2 * v52];
            v54[4]  = v50;
            v54[5]  = v49;
          }
          else
          {
            swift_endAccess();

            uint64_t v35 = v43;
            unint64_t v13 = (unint64_t)v91;
          }
        }
        else
        {
        }
      }
      else
      {
      }
      ++v34;
    }
    while (v12 != v34);
    swift_bridgeObjectRelease();
    uint64_t v9 = v89;
    id v2 = v90;
    int64_t v21 = v92;
    if (v3[2])
    {
LABEL_49:
      uint64_t v55 = v3[4];
      unint64_t v56 = v3[5];
      swift_bridgeObjectRetain();
      uint64_t v4 = specialized static CATUtils.classAndUseCase(from:lowercased:)(v55, v56, 1);
      uint64_t v12 = v57;
      uint64_t v58 = swift_bridgeObjectRelease();
      uint64_t v59 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 104))(v58);
      if (*(void *)(v59 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v60 = specialized __RawDictionaryStorage.find<A>(_:)(v4, v12);
        if (v61)
        {
          unint64_t v62 = (uint64_t *)(*(void *)(v59 + 56) + 16 * v60);
        }
        else
        {
          if (one-time initialization token for speakeasyCategoryDefault != -1) {
            swift_once();
          }
          unint64_t v62 = &static CATUtils.speakeasyCategoryDefault;
        }
        uint64_t v1 = v62[1];
        unint64_t v84 = (void *)*v62;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        if (one-time initialization token for speakeasyCategoryDefault != -1) {
          swift_once();
        }
        uint64_t v1 = qword_268571570;
        unint64_t v84 = (void *)static CATUtils.speakeasyCategoryDefault;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      if (v21[2])
      {
        a1  = v21[5];
        v85  = v21[4];
        swift_bridgeObjectRetain();
      }
      else
      {
        a1  = 0xE400000000000000;
        v85  = 1819047246;
      }
      swift_bridgeObjectRelease();
      if (one-time initialization token for defaultLogger == -1) {
        goto LABEL_63;
      }
      goto LABEL_81;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    int64_t v21 = (void *)MEMORY[0x263F8EE78];
    id v3 = (void *)MEMORY[0x263F8EE78];
    if (*(void *)(MEMORY[0x263F8EE78] + 16)) {
      goto LABEL_49;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)defaultLogger);
  uint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v23, v24))
  {
    unint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v25 = 0;
    _os_log_impl(&dword_22D468000, v23, v24, "No CAT ID found for the turn", v25, 2u);
    MEMORY[0x230F81A50](v25, -1, -1);
  }

  return v96;
}

uint64_t static UEIFeatureExtractor.dismissalReasonAsString(_:)(uint64_t a1)
{
  return static UEIFeatureExtractor.dismissalReasonAsString(_:)(a1, (uint64_t (*)(void))specialized static UEIFeatureExtractor.dismissalReasonAsString(_:));
}

uint64_t CatIdSequence.__allocating_init(value:confidence:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Confidence();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  v10[1]  = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v8 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v8;
}

uint64_t CatId.__allocating_init(value:confidence:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  v12[0]  = a1;
  v12[1]  = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
  uint64_t v10 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a3, v6);
  return v10;
}

id static UEIFeatureExtractor.clientEvent(from:)()
{
  return specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
}

void static UEIFeatureExtractor.turnID(_:)(uint64_t a1@<X8>)
{
  id v2 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
  if (v2)
  {
    id v5 = v2;
    static UEIFeatureExtractor.turnID(_:)(v2, a1);
  }
  else
  {
    uint64_t v3 = type metadata accessor for UUID();
    uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
    v4(a1, 1, 1, v3);
  }
}

uint64_t static UEIFeatureExtractor.turnID(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v30 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(a1, sel_eventMetadata);
  if (v7 && (uint64_t v8 = v7, v9 = objc_msgSend(v7, sel_turnID), v8, v9))
  {
    uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;

    unint64_t v13 = v12 >> 62;
    switch(v12 >> 62)
    {
      case 1uLL:
        LODWORD(v14)  = HIDWORD(v10) - v10;
        if (__OFSUB__(HIDWORD(v10), v10))
        {
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
        uint64_t v14 = (int)v14;
LABEL_11:
        if (v14 == 16)
        {
          if (!v13)
          {
            uint64_t v31 = v10;
            __int16 v32 = v12;
            char v33 = BYTE2(v12);
            char v34 = BYTE3(v12);
            char v35 = BYTE4(v12);
            char v36 = BYTE5(v12);
            (*(void (**)(char *, uint64_t *, uint64_t))(v30 + 16))(v6, &v31, v4);
            goto LABEL_25;
          }
          if (v13 != 1)
          {
            uint64_t v24 = *(void *)(v10 + 16);
            swift_retain();
            swift_retain();
            uint64_t v25 = __DataStorage._bytes.getter();
            if (!v25)
            {
LABEL_32:
              __DataStorage._length.getter();
              __break(1u);
              JUMPOUT(0x22D48E4FCLL);
            }
            uint64_t v26 = v25;
            uint64_t v27 = __DataStorage._offset.getter();
            BOOL v19 = __OFSUB__(v24, v27);
            uint64_t v28 = v24 - v27;
            if (!v19)
            {
              __DataStorage._length.getter();
              (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v6, v26 + v28, v4);
              swift_release();
              swift_release();
              goto LABEL_25;
            }
            goto LABEL_29;
          }
          if ((int)v10 <= v10 >> 32)
          {
            outlined copy of Data._Representation(v10, v12);
            uint64_t v20 = __DataStorage._bytes.getter();
            if (!v20)
            {
LABEL_31:
              __DataStorage._length.getter();
              __break(1u);
              goto LABEL_32;
            }
            uint64_t v21 = v20;
            uint64_t v22 = __DataStorage._offset.getter();
            uint64_t v23 = (int)v10 - v22;
            if (!__OFSUB__((int)v10, v22))
            {
              __DataStorage._length.getter();
              (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v6, v21 + v23, v4);
              outlined consume of Data._Representation(v10, v12);
LABEL_25:
              outlined consume of Data._Representation(v10, v12);
              (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(a2, v6, v4);
              return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v30 + 56))(a2, 0, 1, v4);
            }
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
LABEL_18:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(a2, 1, 1, v4);
        uint64_t result = outlined consume of Data._Representation(v10, v12);
        break;
      case 2uLL:
        uint64_t v18 = *(void *)(v10 + 16);
        uint64_t v17 = *(void *)(v10 + 24);
        BOOL v19 = __OFSUB__(v17, v18);
        uint64_t v14 = v17 - v18;
        if (!v19) {
          goto LABEL_11;
        }
        goto LABEL_27;
      case 3uLL:
        goto LABEL_18;
      default:
        uint64_t v14 = BYTE6(v12);
        goto LABEL_11;
    }
  }
  else
  {
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56);
    return v15(a2, 1, 1, v4);
  }
  return result;
}

uint64_t static UEIFeatureExtractor.dialogID(_:)(uint64_t a1)
{
  return static UEIFeatureExtractor.dismissalReasonAsString(_:)(a1, (uint64_t (*)(void))specialized static UEIFeatureExtractor.dialogID(_:));
}

uint64_t static UEIFeatureExtractor.dialogPhase(_:)(uint64_t a1)
{
  return static UEIFeatureExtractor.dismissalReasonAsString(_:)(a1, (uint64_t (*)(void))specialized static UEIFeatureExtractor.dialogPhase(_:));
}

uint64_t static UEIFeatureExtractor.dismissalReasonAsString(_:)(uint64_t a1, uint64_t (*a2)(void))
{
  id v3 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = a2();

  return v5;
}

id static UEIFeatureExtractor.dismissalReason(_:)()
{
  id result = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
  if (result)
  {
    uint64_t v1 = result;
    id v2 = objc_msgSend(result, sel_uiStateTransition);
    if (v2 && (id v3 = v2, v4 = objc_msgSend(v2, sel_dismissed), v3, v4))
    {
      signed int v5 = objc_msgSend(v4, sel_dismissalReason);

      return (id)v5;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

id static UEIFeatureExtractor.dismissalReason(_:)(void *a1)
{
  id result = objc_msgSend(a1, sel_uiStateTransition);
  if (result)
  {
    id v2 = result;
    id v3 = objc_msgSend(result, sel_dismissed);

    if (v3)
    {
      signed int v4 = objc_msgSend(v3, sel_dismissalReason);

      return (id)v4;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t UEIFeatureExtractor.__ivar_destroyer()
{
  return swift_bridgeObjectRelease();
}

uint64_t UEIFeatureExtractor.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t UEIFeatureExtractor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to CatId.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to CatId.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for CatId);
}

uint64_t CatIdSequence.init(value:confidence:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Confidence();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v9[1]  = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  uint64_t v7 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v7;
}

uint64_t CatIdSequence.__deallocating_deinit()
{
  uint64_t v0 = TypedFeature.deinit();
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to CatIdSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Confidence();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  type metadata accessor for CatIdSequence(0);
  swift_allocObject();
  v11[1]  = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v9 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v9;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SpeakeasyCategory.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to CatId.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for SpeakeasyCategory);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to CatId.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  uint64_t v10 = a1[1];
  a3(0);
  swift_allocObject();
  v14[0]  = v11;
  v14[1]  = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t v12 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v12;
}

uint64_t CatId.init(value:confidence:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Confidence();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v11[0]  = a1;
  v11[1]  = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  uint64_t v9 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a3, v6);
  return v9;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to DismissalReason.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to CatId.__allocating_init(value:confidence:)(a1, a2, (void (*)(void))type metadata accessor for DismissalReason);
}

uint64_t type metadata accessor for CatIdSequence(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for CatIdSequence);
}

uint64_t type metadata accessor for CatId(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for CatId);
}

uint64_t type metadata accessor for SpeakeasyCategory(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for SpeakeasyCategory);
}

uint64_t type metadata accessor for DismissalReason(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for DismissalReason);
}

void *specialized static UEIFeatureExtractor.dismissalReasonAsString(_:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_uiStateTransition);
  id v2 = v1;
  if (v1)
  {
    id v3 = objc_msgSend(v1, sel_dismissed);

    if (v3)
    {
      Swift::UInt32 v4 = objc_msgSend(v3, sel_dismissalReason);

      if (one-time initialization token for dismissalReasonMap != -1) {
        swift_once();
      }
      swift_beginAccess();
      uint64_t v5 = static UEIFeatureExtractor.dismissalReasonMap;
      if (*(void *)(static UEIFeatureExtractor.dismissalReasonMap + 16)
        && (unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(v4), (v7 & 1) != 0))
      {
        id v2 = *(void **)(*(void *)(v5 + 56) + 16 * v6);
        swift_bridgeObjectRetain();
      }
      else
      {
        id v2 = 0;
      }
      swift_endAccess();
    }
    else
    {
      return 0;
    }
  }
  return v2;
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

void *specialized static UEIFeatureExtractor.dialogID(_:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_uufrShown);
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(v2, sel_dialogIdentifier);

    if (v4)
    {
LABEL_5:
      unint64_t v6 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();

      return v6;
    }
  }
  id v5 = objc_msgSend(a1, sel_uufrSaid);
  unint64_t v6 = v5;
  if (v5)
  {
    id v4 = objc_msgSend(v5, sel_dialogIdentifier);

    if (!v4) {
      return 0;
    }
    goto LABEL_5;
  }
  return v6;
}

id specialized static UEIFeatureExtractor.dialogPhase(_:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_uufrSaid);
  id v2 = v1;
  if (!v1) {
    return 0;
  }
  id v3 = objc_msgSend(v1, sel_siriResponseContext);

  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_dialogPhase);

    if (v4)
    {
      id v3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t sub_22D48EF98@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 104))();
  *a2  = result;
  return result;
}

uint64_t sub_22D48EFE4(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 112);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t type metadata accessor for UEIFeatureExtractor()
{
  return self;
}

uint64_t method lookup function for UEIFeatureExtractor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UEIFeatureExtractor);
}

uint64_t dispatch thunk of UEIFeatureExtractor.catIdToSpeakeasyCategory.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of UEIFeatureExtractor.catIdToSpeakeasyCategory.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of UEIFeatureExtractor.catIdToSpeakeasyCategory.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t type metadata completion function for CatId()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for CatId()
{
  return type metadata accessor for CatId(0);
}

uint64_t type metadata completion function for CatIdSequence()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for CatIdSequence()
{
  return type metadata accessor for CatIdSequence(0);
}

uint64_t type metadata completion function for SpeakeasyCategory()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for SpeakeasyCategory()
{
  return type metadata accessor for SpeakeasyCategory(0);
}

uint64_t type metadata completion function for DismissalReason()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for DismissalReason()
{
  return type metadata accessor for DismissalReason(0);
}

void *static FeaturedTurn.from(events:features:)(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double)?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double));
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v36 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v36 - v19;
  uint64_t v41 = v2;
  static FeaturedTurn.extractUEITimestamp(from:)(a1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    outlined destroy of Any?((uint64_t)v10, &demangling cache variable for type metadata for (UUID, Double)?);
    return 0;
  }
  else
  {
    uint64_t v40 = a2;
    uint64_t v22 = *(int *)(v11 + 48);
    uint64_t v23 = type metadata accessor for UUID();
    id v39 = v15;
    unint64_t v24 = a1;
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)(v23 - 8);
    uint64_t v27 = v26;
    Swift::Double_optional v37 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
    uint64_t v38 = v26 + 32;
    v37(v20, v10, v23);
    uint64_t v28 = *(void *)&v10[v22];
    *(void *)&v20[v22]  = v28;
    static FeaturedTurn.extractRequestID(from:)(v24, v7);
    uint64_t v29 = *(int *)(v11 + 48);
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v18, v20, v25);
    *(void *)&v18[v29]  = v28;
    uint64_t v41 = UUID.uuidString.getter();
    uint64_t v31 = v30;
    __int16 v32 = *(void (**)(char *, uint64_t))(v27 + 8);
    v32(v18, v25);
    uint64_t v33 = *(int *)(v11 + 48);
    char v34 = v39;
    v37(v39, v20, v25);
    *(void *)&v34[v33]  = v28;
    type metadata accessor for FeaturedTurn(0);
    uint64_t v21 = (void *)swift_allocObject();
    v21[6]  = 0;
    v21[7]  = 0;
    v21[3]  = v41;
    v21[4]  = v31;
    v21[5]  = v28;
    outlined init with take of UUID?((uint64_t)v7, (uint64_t)v21 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
    v21[2]  = v40;
    swift_bridgeObjectRetain();
    v32(v34, v25);
  }
  return v21;
}

uint64_t FeaturedTurnInternal.__allocating_init(turnID:timestamp:requestID:features:sortedFeaturedTurns:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v12 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_index;
  *(void *)uint64_t v13 = 0;
  *(unsigned char *)(v13 + 8)  = 1;
  *(void *)(v12 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_sortedFeaturedTurns)  = a5;
  swift_bridgeObjectRetain();
  unint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = specialized Collection.firstIndex(where:)(v14, a1, a2);
  char v17 = v16;
  swift_bridgeObjectRelease();
  swift_retain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v13 = v15;
  *(unsigned char *)(v13 + 8)  = v17 & 1;
  swift_release();
  *(void *)(v12 + 48)  = 0;
  *(void *)(v12 + 56)  = 0;
  *(void *)(v12 + 24)  = a1;
  *(void *)(v12 + 32)  = a2;
  *(double *)(v12 + 40)  = a6;
  outlined init with take of UUID?(a3, v12 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
  *(void *)(v12 + 16)  = a4;
  return v12;
}

uint64_t FeaturedConversation.__allocating_init(_:)(unint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  FeaturedConversation.init(_:)(a1);
  return v2;
}

uint64_t FeaturedTurn.features.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeaturedTurn.features.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16)  = a1;
  return swift_bridgeObjectRelease();
}

uint64_t FeaturedTurn.turnID.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

double FeaturedTurn.timestamp.getter()
{
  return *(double *)(v0 + 40);
}

uint64_t (*FeaturedTurn.conversationID.modify())()
{
  return InferredHelpfulnessInference.classifier.modify;
}

uint64_t FeaturedTurn.requestID.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of UUID?(v1 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, a1);
}

uint64_t static FeaturedTurn.extractUEITimestamp(from:)@<X0>(unint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  char v7 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v87 - v8;
  uint64_t v10 = type metadata accessor for UUID();
  unint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v87 = (char *)&v87 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v95 = (char *)&v87 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v87 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v87 - v22;
  if (a1 >> 62)
  {
LABEL_55:
    swift_bridgeObjectRetain();
    uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    uint64_t v24 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  unint64_t v93 = v11;
  unint64_t v94 = a1;
  uint64_t v96 = (char *)v24;
  uint64_t v90 = a2;
  uint64_t v91 = v23;
  id v89 = v14;
  if (v24)
  {
    if (v24 < 1)
    {
      __break(1u);
      goto LABEL_57;
    }
    uint64_t v88 = v9;
    uint64_t v25 = 0;
    unint64_t v26 = a1 & 0xC000000000000001;
    unint64_t v27 = v11;
    uint64_t v28 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    uint64_t v29 = (void (**)(char *, char *, uint64_t))(v27 + 32);
    unint64_t v30 = MEMORY[0x263F8EE78];
    uint64_t v92 = v10;
    do
    {
      if (v26) {
        id v31 = (id)MEMORY[0x230F812A0](v25, a1);
      }
      else {
        id v31 = *(id *)(a1 + 8 * (void)v25 + 32);
      }
      __int16 v32 = v31;
      static UEIEvents.turnID(_:)();

      if ((*v28)(v7, 1, v10) == 1)
      {
        outlined destroy of Any?((uint64_t)v7, &demangling cache variable for type metadata for UUID?);
      }
      else
      {
        uint64_t v33 = *v29;
        (*v29)(v21, v7, v10);
        v33(v95, v21, v10);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v30 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v30 + 16) + 1, 1, v30);
        }
        unint64_t v35 = *(void *)(v30 + 16);
        unint64_t v34 = *(void *)(v30 + 24);
        if (v35 >= v34 >> 1) {
          unint64_t v30 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v34 > 1, v35 + 1, 1, v30);
        }
        *(void *)(v30 + 16)  = v35 + 1;
        unint64_t v36 = v30
            + ((*(unsigned __int8 *)(v93 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80))
            + *(void *)(v93 + 72) * v35;
        uint64_t v10 = v92;
        v33((char *)v36, v95, v92);
        a1  = v94;
      }
      uint64_t v24 = (uint64_t)v96;
      ++v25;
    }
    while (v96 != v25);
    swift_bridgeObjectRelease();
    unint64_t v11 = v93;
    uint64_t v23 = v91;
    uint64_t v9 = v88;
    if (*(void *)(v30 + 16)) {
      goto LABEL_18;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v30 = MEMORY[0x263F8EE78];
    if (*(void *)(MEMORY[0x263F8EE78] + 16))
    {
LABEL_18:
      (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v9, v30 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), v10);
      uint64_t v37 = 0;
      goto LABEL_21;
    }
  }
  uint64_t v37 = 1;
LABEL_21:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, v37, 1, v10);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    outlined destroy of Any?((uint64_t)v9, &demangling cache variable for type metadata for UUID?);
    if (one-time initialization token for defaultLogger == -1)
    {
LABEL_23:
      uint64_t v38 = type metadata accessor for Logger();
      __swift_project_value_buffer(v38, (uint64_t)defaultLogger);
      id v39 = Logger.logObject.getter();
      os_log_type_t v40 = static os_log_type_t.debug.getter();
      BOOL v41 = os_log_type_enabled(v39, v40);
      id v42 = v90;
      if (v41)
      {
        uint64_t v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v43 = 0;
        _os_log_impl(&dword_22D468000, v39, v40, "Unable to extract turnID", v43, 2u);
        MEMORY[0x230F81A50](v43, -1, -1);
      }

      uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double));
      uint64_t v45 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56);
      unint64_t v46 = v42;
      return v45(v46, 1, 1, v44);
    }
LABEL_57:
    swift_once();
    goto LABEL_23;
  }
  uint64_t v47 = v24;
  unint64_t v14 = (char *)(v11 + 32);
  unint64_t v48 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v48(v23, v9, v10);
  if (v47)
  {
    unint64_t v11 = a1 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    a1  = 4;
    a2  = (char *)&unk_2649AE000;
    while (1)
    {
      uint64_t v23 = (char *)(a1 - 4);
      if (v11) {
        uint64_t v49 = (char *)MEMORY[0x230F812A0](a1 - 4, v94);
      }
      else {
        uint64_t v49 = (char *)*(id *)(v94 + 8 * a1);
      }
      uint64_t v21 = v49;
      char v7 = (char *)(a1 - 3);
      if (__OFADD__(v23, 1))
      {
        __break(1u);
        goto LABEL_55;
      }
      uint64_t v50 = (void *)static UEIEvents.clientEvent(from:)();
      uint64_t v9 = (char *)objc_msgSend(v50, sel_deviceDynamicContext);

      if (v9) {
        break;
      }

      ++a1;
      if (v7 == v96)
      {
        swift_bridgeObjectRelease();
        unint64_t v51 = 0;
LABEL_40:
        unint64_t v11 = v93;
        uint64_t v23 = v91;
        goto LABEL_41;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v51 = v21;
    unint64_t v52 = (void *)static UEIEvents.clientEvent(from:)();
    if (!v52)
    {

      goto LABEL_40;
    }
    uint64_t v53 = v52;
    id v54 = objc_msgSend(v52, sel_deviceDynamicContext);
    unint64_t v55 = v93;
    unint64_t v56 = v91;
    if (v54)
    {
      uint64_t v57 = v54;
      objc_msgSend(v54, sel_timeIntervalSince1970);
      uint64_t v59 = v58;

      uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double));
      uint64_t v61 = *(int *)(v60 + 48);
      unint64_t v62 = v90;
      v48(v90, v56, v10);
      *(void *)&v62[v61]  = v59;
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v62, 0, 1, v60);
    }
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v75 = type metadata accessor for Logger();
    __swift_project_value_buffer(v75, (uint64_t)defaultLogger);
    uint64_t v76 = v87;
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v87, v56, v10);
    uint64_t v77 = v56;
    uint64_t v78 = Logger.logObject.getter();
    os_log_type_t v79 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v78, v79))
    {
      v80  = (uint8_t *)swift_slowAlloc();
      uint64_t v81 = swift_slowAlloc();
      uint64_t v98 = v81;
      uint64_t v96 = v51;
      *(_DWORD *)v80  = 136315138;
      uint64_t v95 = (char *)(v80 + 4);
      lazy protocol witness table accessor for type UUID and conformance UUID();
      uint64_t v82 = dispatch thunk of CustomStringConvertible.description.getter();
      v97  = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v82, v83, &v98);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      unint64_t v84 = *(void (**)(char *, uint64_t))(v55 + 8);
      v84(v76, v10);
      _os_log_impl(&dword_22D468000, v78, v79, "Unable to extract timestamp for turn %s", v80, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v81, -1, -1);
      MEMORY[0x230F81A50](v80, -1, -1);

      v85  = v96;
      v84(v91, v10);
    }
    else
    {

      id v86 = *(void (**)(char *, uint64_t))(v55 + 8);
      v86(v76, v10);

      v86(v77, v10);
    }
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double));
    uint64_t v45 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56);
    unint64_t v46 = v90;
  }
  else
  {
    unint64_t v51 = 0;
LABEL_41:
    uint64_t v64 = v89;
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v65 = type metadata accessor for Logger();
    __swift_project_value_buffer(v65, (uint64_t)defaultLogger);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v64, v23, v10);
    BOOL v66 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      uint64_t v98 = v69;
      *(_DWORD *)uint64_t v68 = 136315138;
      uint64_t v96 = v51;
      lazy protocol witness table accessor for type UUID and conformance UUID();
      uint64_t v70 = dispatch thunk of CustomStringConvertible.description.getter();
      v97  = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v70, v71, &v98);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v72 = *(void (**)(char *, uint64_t))(v11 + 8);
      v72(v64, v10);
      _os_log_impl(&dword_22D468000, v66, v67, "Unable to find DeviceDynamicContext for turn %s", v68, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F81A50](v69, -1, -1);
      MEMORY[0x230F81A50](v68, -1, -1);

      v72(v91, v10);
    }
    else
    {

      uint64_t v73 = *(void (**)(char *, uint64_t))(v11 + 8);
      v73(v64, v10);

      v73(v23, v10);
    }
    uint64_t v74 = v90;
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double));
    uint64_t v45 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56);
    unint64_t v46 = v74;
  }
  return v45(v46, 1, 1, v44);
}

uint64_t static FeaturedTurn.extractRequestID(from:)@<X0>(unint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(char **)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char **)((char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  unint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  unint64_t v14 = (char *)&v47 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v47 - v15;
  if (a1 >> 62)
  {
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
    if (v17) {
      goto LABEL_3;
    }
LABEL_38:
    unint64_t v11 = (char *)*((void *)v5 + 7);
LABEL_39:
    uint64_t v45 = a2;
    uint64_t v46 = 1;
LABEL_40:
    ((void (*)(void *, uint64_t, uint64_t, uint64_t))v11)(v45, v46, 1, v4);
    return swift_bridgeObjectRelease();
  }
  uint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v17) {
    goto LABEL_38;
  }
LABEL_3:
  unint64_t v52 = a2;
  uint64_t v53 = v17;
  uint64_t v50 = v11;
  unint64_t v51 = v14;
  unint64_t v48 = v7;
  uint64_t v49 = v5;
  unint64_t v18 = 0;
  unint64_t v54 = a1 & 0xC000000000000001;
  char v7 = (char **)(v5 + 56);
  unint64_t v14 = v5 + 48;
  while (1)
  {
    if (v54)
    {
      swift_bridgeObjectRetain();
      id v19 = (id)MEMORY[0x230F812A0](v18, a1);
    }
    else
    {
      uint64_t v20 = *(void **)(a1 + 8 * v18 + 32);
      swift_bridgeObjectRetain();
      id v19 = v20;
    }
    a2  = v19;
    if (objc_msgSend(v19, sel_anyEventType) == 6)
    {
      Class isa = (Class)objc_msgSend(a2, sel_payload);
      if (isa)
      {
        uint64_t v22 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v24 = v23;

        Class isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v22, v24);
      }
      id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED88]), sel_initWithData_, isa);

      id v26 = objc_msgSend(v25, sel_event);
      if (!v26) {
        goto LABEL_17;
      }
    }
    else
    {
      id v26 = a2;
    }
    id v27 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();

    if (v27)
    {
      id v28 = objc_msgSend(v27, sel_eventMetadata);

      if (v28)
      {
        id v29 = objc_msgSend(v28, sel_requestId);

        if (v29)
        {
          SISchemaUUID.toNSUUID()();

          unint64_t v11 = *v7;
          ((void (*)(char *, void, uint64_t, uint64_t))*v7)(v16, 0, 1, v4);
          goto LABEL_18;
        }
      }
    }
LABEL_17:
    unint64_t v11 = *v7;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v7)(v16, 1, 1, v4);
LABEL_18:
    swift_bridgeObjectRelease();

    uint64_t v5 = *(char **)v14;
    int v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))v14)(v16, 1, v4);
    uint64_t result = outlined destroy of Any?((uint64_t)v16, &demangling cache variable for type metadata for UUID?);
    if (v30 != 1) {
      break;
    }
    unint64_t v32 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    ++v18;
    if (v32 == v53) {
      goto LABEL_23;
    }
  }
  if (v53 == v18)
  {
LABEL_23:
    a2  = v52;
    goto LABEL_39;
  }
  if (v54)
  {
    id v33 = (id)MEMORY[0x230F812A0](v18, a1);
    goto LABEL_29;
  }
  if ((v18 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v18 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  id v33 = *(id *)(a1 + 8 * v18 + 32);
LABEL_29:
  unint64_t v34 = v33;
  id v35 = specialized SISchemaAnyEvent.unwrappedPayload<A>(as:)();
  uint64_t v36 = (uint64_t)v50;
  if (v35
    && (v37 = v35, id v38 = objc_msgSend(v35, sel_eventMetadata),
                   v37,
                   v38)
    && (id v39 = objc_msgSend(v38, sel_requestId), v38, v39))
  {
    SISchemaUUID.toNSUUID()();

    uint64_t v40 = 0;
  }
  else
  {
    uint64_t v40 = 1;
  }
  uint64_t v41 = (uint64_t)v51;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v11)(v51, v40, 1, v4);

  outlined init with copy of UUID?(v41, v36);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v5)(v36, 1, v4);
  if (result != 1)
  {
    id v42 = v48;
    uint64_t v43 = (void (*)(char **, uint64_t, uint64_t))*((void *)v49 + 4);
    v43(v48, v36, v4);
    outlined destroy of Any?(v41, &demangling cache variable for type metadata for UUID?);
    uint64_t v44 = v52;
    v43((char **)v52, (uint64_t)v42, v4);
    uint64_t v45 = v44;
    uint64_t v46 = 0;
    goto LABEL_40;
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t FeaturedTurn.__allocating_init(turnID:timestamp:requestID:features:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v12;
  *(void *)(v12 + 48)  = 0;
  *(void *)(v12 + 56)  = 0;
  *(void *)(v12 + 24)  = a1;
  *(void *)(v12 + 32)  = a2;
  double v14 = *(double *)&a3;
  if (a4) {
    double v14 = -1.0;
  }
  *(double *)(v12 + 40)  = v14;
  outlined init with take of UUID?(a5, v12 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
  *(void *)(v13 + 16)  = a6;
  return v13;
}

uint64_t type metadata accessor for FeaturedTurn(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FeaturedTurn);
}

uint64_t FeaturedTurn.init(turnID:timestamp:requestID:features:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 48)  = 0;
  *(void *)(v6 + 56)  = 0;
  *(void *)(v6 + 24)  = a1;
  *(void *)(v6 + 32)  = a2;
  if (a4) {
    *(double *)&a3  = -1.0;
  }
  *(double *)(v6 + 40)  = *(double *)&a3;
  outlined init with take of UUID?(a5, v6 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
  *(void *)(v6 + 16)  = a6;
  return v6;
}

Swift::Bool __swiftcall FeaturedTurn.hasUtterance()()
{
  return FeaturedTurn.hasUtterance()((uint64_t (*)(void))specialized Collection.filterByType<A>(as:));
}

Swift::Bool __swiftcall FeaturedTurn.hasCatId()()
{
  return FeaturedTurn.hasUtterance()((uint64_t (*)(void))specialized Collection.filterByType<A>(as:));
}

uint64_t FeaturedTurn.hasUtterance()(uint64_t (*a1)(void))
{
  (*(void (**)(void))(*(void *)v1 + 120))();
  unint64_t v3 = a1();
  uint64_t result = swift_bridgeObjectRelease();
  if (!(v3 >> 62))
  {
    if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_11;
  }
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    MEMORY[0x230F812A0](0, v3);
  }
  else
  {
    if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  dispatch thunk of Feature.value()();
  swift_release();
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v5 = *(void *)v7 & 0xFFFFFFFFFFFFLL;
  }
  return v5 != 0;
}

Swift::String __swiftcall FeaturedTurn.timestampString()()
{
  uint64_t v0 = type metadata accessor for TimeZone();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init(timeIntervalSince1970:)();
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v8, sel_setTimeStyle_, 2);
  objc_msgSend(v8, sel_setDateStyle_, 2);
  static TimeZone.current.getter();
  Class isa = TimeZone._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v8, sel_setTimeZone_, isa);

  Class v10 = Date._bridgeToObjectiveC()().super.isa;
  id v11 = objc_msgSend(v8, sel_stringFromDate_, v10);

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  double v14 = v13;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v15 = v12;
  uint64_t v16 = v14;
  result._object  = v16;
  result._uint64_t countAndFlagsBits = v15;
  return result;
}

BOOL static FeaturedTurn.compareTurns(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 40) < *(double *)(a2 + 40);
}

uint64_t FeaturedTurn.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, &demangling cache variable for type metadata for UUID?);
  return v0;
}

uint64_t FeaturedTurn.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, &demangling cache variable for type metadata for UUID?);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t FeaturedConversation.conversationID.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FeaturedConversation.turns.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeaturedConversation.init(_:)(unint64_t a1)
{
  v1[4]  = a1;
  if (!(a1 >> 62))
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  if (!result) {
    goto LABEL_7;
  }
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = MEMORY[0x230F812A0](0, a1);
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)(v8 + 24);
    uint64_t v6 = *(void *)(v8 + 32);
    swift_bridgeObjectRetain();
    swift_unknownObjectRelease();
    goto LABEL_8;
  }
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)(v5 + 24);
    uint64_t v6 = *(void *)(v5 + 32);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_8:
    v1[2]  = v7;
    v1[3]  = v6;
    return (uint64_t)v1;
  }
  __break(1u);
  return result;
}

uint64_t FeaturedConversation.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FeaturedConversation.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

void *static NeighborType.allCases.getter()
{
  return &outlined read-only object #0 of static NeighborType.allCases.getter;
}

unint64_t NeighborType.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x757165527478656ELL;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6F6365537478656ELL;
      break;
    default:
      unint64_t result = 0x6E7275547478656ELL;
      break;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NeighborType(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = NeighborType.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == NeighborType.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance NeighborType()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  NeighborType.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NeighborType()
{
  NeighborType.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NeighborType()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  NeighborType.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NeighborType@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized NeighborType.init(rawValue:)(*a1);
  *a2  = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NeighborType@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = NeighborType.rawValue.getter(*v1);
  *a1  = result;
  a1[1]  = v4;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance NeighborType(void *a1@<X8>)
{
  *a1  = &outlined read-only object #0 of protocol witness for static CaseIterable.allCases.getter in conformance NeighborType;
}

uint64_t FeaturedTurnInternal.sortedFeaturedTurns.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeaturedTurnInternal.sortedFeaturedTurns.setter(uint64_t a1)
{
  unint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_sortedFeaturedTurns);
  swift_beginAccess();
  *unint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*FeaturedTurnInternal.sortedFeaturedTurns.modify())()
{
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t FeaturedTurnInternal.index.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_index;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t FeaturedTurnInternal.index.setter(uint64_t a1, char a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_index;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8)  = a2 & 1;
  return result;
}

uint64_t (*FeaturedTurnInternal.index.modify())()
{
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t FeaturedTurnInternal.init(turnID:timestamp:requestID:features:sortedFeaturedTurns:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v12 = v6 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_index;
  *(void *)uint64_t v12 = 0;
  *(unsigned char *)(v12 + 8)  = 1;
  *(void *)(v6 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_sortedFeaturedTurns)  = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = specialized Collection.firstIndex(where:)(v13, a1, a2);
  char v16 = v15;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v12 = v14;
  *(unsigned char *)(v12 + 8)  = v16 & 1;
  swift_release();
  *(void *)(v6 + 48)  = 0;
  *(void *)(v6 + 56)  = 0;
  *(void *)(v6 + 24)  = a1;
  *(void *)(v6 + 32)  = a2;
  *(double *)(v6 + 40)  = a6;
  outlined init with take of UUID?(a3, v6 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
  *(void *)(v6 + 16)  = a4;
  return v6;
}

uint64_t FeaturedTurnInternal.neighborTurns(neighborType:neighborSize:)(char a1, uint64_t a2)
{
  v103  = *(uint64_t (**)(void))(*(void *)v2 + 216);
  unint64_t v7 = v103();
  if (v7 >> 62) {
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8)
  {
    switch(a1)
    {
      case 1:
        unint64_t v9 = v103();
        uint64_t v16 = (*(uint64_t (**)(void))(*(void *)v2 + 240))();
        if (v17) {
          uint64_t v18 = -1;
        }
        else {
          uint64_t v18 = v16;
        }
        uint64_t v2 = v18 + 1;
        if (__OFADD__(v18, 1)) {
          goto LABEL_152;
        }
        unint64_t v3 = v9 >> 62;
        if (v9 >> 62) {
          goto LABEL_158;
        }
        uint64_t v19 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v19 >= v2) {
          goto LABEL_23;
        }
        goto LABEL_168;
      case 2:
        unint64_t v9 = v103();
        uint64_t v21 = (*(uint64_t (**)(void))(*(void *)v2 + 240))();
        if (v22) {
          uint64_t v23 = -1;
        }
        else {
          uint64_t v23 = v21;
        }
        uint64_t v2 = v23 + 1;
        if (__OFADD__(v23, 1)) {
          goto LABEL_153;
        }
        unint64_t v3 = v9 >> 62;
        if (v9 >> 62) {
          goto LABEL_161;
        }
        uint64_t v24 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v24 >= v2) {
          goto LABEL_32;
        }
        goto LABEL_169;
      case 3:
        uint64_t v24 = v103();
        uint64_t v26 = (*(uint64_t (**)(void))(*(void *)v2 + 240))();
        if (v27) {
          uint64_t v28 = -1;
        }
        else {
          uint64_t v28 = v26;
        }
        unint64_t v9 = v28 + 1;
        if (__OFADD__(v28, 1)) {
          goto LABEL_154;
        }
        unint64_t v4 = (unint64_t)v24 >> 62;
        if ((unint64_t)v24 >> 62) {
          goto LABEL_164;
        }
        uint64_t v29 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v29 >= (uint64_t)v9) {
          goto LABEL_41;
        }
        goto LABEL_170;
      default:
        unint64_t v9 = v103();
        uint64_t v10 = (*(uint64_t (**)(void))(*(void *)v2 + 240))();
        if (v11) {
          uint64_t v12 = -1;
        }
        else {
          uint64_t v12 = v10;
        }
        uint64_t v2 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
        }
        else
        {
          unint64_t v3 = v9 >> 62;
          if (!(v9 >> 62))
          {
            uint64_t v13 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v13 >= v2) {
              goto LABEL_11;
            }
            goto LABEL_167;
          }
        }
        swift_bridgeObjectRetain();
        uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v13 < v2)
        {
LABEL_205:
          __break(1u);
LABEL_206:
          __break(1u);
LABEL_207:
          __break(1u);
          goto LABEL_208;
        }
        swift_bridgeObjectRetain();
        uint64_t v95 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v95 >= v2)
        {
LABEL_11:
          if ((v2 & 0x8000000000000000) == 0)
          {
            if (v3)
            {
              swift_bridgeObjectRetain();
              uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v14 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            if (v14 >= v13)
            {
              if ((v13 & 0x8000000000000000) == 0)
              {
                if ((v9 & 0xC000000000000001) != 0 && v2 != v13)
                {
                  if (v2 >= (unint64_t)v13)
                  {
LABEL_197:
                    __break(1u);
                    goto LABEL_198;
                  }
                  type metadata accessor for FeaturedTurn(0);
                  Swift::Int v31 = v2;
                  do
                  {
                    Swift::Int v32 = v31 + 1;
                    _ArrayBuffer._typeCheckSlowPath(_:)(v31);
                    Swift::Int v31 = v32;
                  }
                  while (v13 != v32);
                }
                if (v3)
                {
                  swift_bridgeObjectRetain();
                  _CocoaArrayWrapper.subscript.getter();
                  uint64_t v33 = v44;
                  uint64_t v2 = v45;
                  unint64_t v47 = v46;
                  swift_bridgeObjectRelease_n();
                  uint64_t v13 = v47 >> 1;
                }
                else
                {
                  uint64_t v33 = (v9 & 0xFFFFFFFFFFFFFF8) + 32;
                }
                unint64_t v104 = MEMORY[0x263F8EE78];
                uint64_t v48 = v13 - v2;
                if (v13 == v2)
                {
                  swift_unknownObjectRelease();
                  unint64_t v49 = MEMORY[0x263F8EE78];
                }
                else
                {
                  if (v13 <= v2)
                  {
LABEL_201:
                    __break(1u);
                    goto LABEL_202;
                  }
                  uint64_t v65 = v33 + 8 * v2;
                  do
                  {
                    BOOL v66 = *(uint64_t (**)(uint64_t))(**(void **)v65 + 184);
                    uint64_t v67 = swift_retain();
                    if (v66(v67))
                    {
                      swift_release();
                    }
                    else
                    {
                      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
                      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                      specialized ContiguousArray._endMutation()();
                    }
                    v65 += 8;
                    --v48;
                  }
                  while (v48);
                  swift_unknownObjectRelease();
                  unint64_t v49 = v104;
                }
                a2  = specialized Collection.prefix(_:)(a2, v49);
                uint64_t v75 = v74;
                uint64_t v77 = v76;
                unint64_t v79 = v78;
                swift_release();
                if ((v79 & 1) == 0) {
                  goto LABEL_187;
                }
                type metadata accessor for __ContiguousArrayStorageBase();
                swift_unknownObjectRetain_n();
                v80  = swift_dynamicCastClass();
                if (!v80)
                {
                  swift_unknownObjectRelease();
                  v80  = MEMORY[0x263F8EE78];
                }
                uint64_t v81 = *(void *)(v80 + 16);
                swift_release();
                unint64_t v82 = (v79 >> 1) - v77;
                if (!__OFSUB__(v79 >> 1, v77)) {
                  goto LABEL_191;
                }
                __break(1u);
                goto LABEL_122;
              }
              goto LABEL_179;
            }
            goto LABEL_175;
          }
          goto LABEL_171;
        }
        __break(1u);
LABEL_158:
        swift_bridgeObjectRetain();
        uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v19 < v2) {
          goto LABEL_206;
        }
        swift_bridgeObjectRetain();
        uint64_t v96 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v96 >= v2)
        {
LABEL_23:
          if ((v2 & 0x8000000000000000) == 0)
          {
            if (v3)
            {
              swift_bridgeObjectRetain();
              uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v20 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            if (v20 >= v19)
            {
              if ((v19 & 0x8000000000000000) == 0)
              {
                if ((v9 & 0xC000000000000001) != 0 && v2 != v19)
                {
                  if (v2 >= (unint64_t)v19)
                  {
LABEL_198:
                    __break(1u);
                    goto LABEL_199;
                  }
                  type metadata accessor for FeaturedTurn(0);
                  Swift::Int v34 = v2;
                  do
                  {
                    Swift::Int v35 = v34 + 1;
                    _ArrayBuffer._typeCheckSlowPath(_:)(v34);
                    Swift::Int v34 = v35;
                  }
                  while (v19 != v35);
                }
                if (v3)
                {
                  swift_bridgeObjectRetain();
                  _CocoaArrayWrapper.subscript.getter();
                  uint64_t v36 = v50;
                  uint64_t v2 = v51;
                  unint64_t v53 = v52;
                  swift_bridgeObjectRelease_n();
                  uint64_t v19 = v53 >> 1;
                }
                else
                {
                  uint64_t v36 = (v9 & 0xFFFFFFFFFFFFFF8) + 32;
                }
                unint64_t v104 = MEMORY[0x263F8EE78];
                uint64_t v48 = v19 - v2;
                if (v19 == v2)
                {
                  swift_unknownObjectRelease();
                  unint64_t v54 = MEMORY[0x263F8EE78];
LABEL_123:
                  a2  = specialized Collection.prefix(_:)(a2, v54);
                  uint64_t v75 = v83;
                  uint64_t v77 = v84;
                  unint64_t v79 = v85;
                  swift_release();
                  if ((v79 & 1) == 0) {
                    goto LABEL_187;
                  }
                  type metadata accessor for __ContiguousArrayStorageBase();
                  swift_unknownObjectRetain_n();
                  uint64_t v86 = swift_dynamicCastClass();
                  if (!v86)
                  {
                    swift_unknownObjectRelease();
                    uint64_t v86 = MEMORY[0x263F8EE78];
                  }
                  uint64_t v81 = *(void *)(v86 + 16);
                  swift_release();
                  unint64_t v82 = (v79 >> 1) - v77;
                  if (!__OFSUB__(v79 >> 1, v77)) {
                    goto LABEL_191;
                  }
                  __break(1u);
                  goto LABEL_129;
                }
                if (v19 <= v2)
                {
LABEL_202:
                  __break(1u);
                  goto LABEL_203;
                }
                uint64_t v68 = v36 + 8 * v2;
                do
                {
                  uint64_t v69 = *(uint64_t (**)(uint64_t))(**(void **)v68 + 176);
                  uint64_t v70 = swift_retain();
                  if (v69(v70))
                  {
                    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
                    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                    specialized ContiguousArray._endMutation()();
                  }
                  else
                  {
                    swift_release();
                  }
                  v68 += 8;
                  --v48;
                }
                while (v48);
LABEL_122:
                swift_unknownObjectRelease();
                unint64_t v54 = v104;
                goto LABEL_123;
              }
              goto LABEL_180;
            }
            goto LABEL_176;
          }
          goto LABEL_172;
        }
        __break(1u);
LABEL_161:
        swift_bridgeObjectRetain();
        uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v24 < v2) {
          goto LABEL_207;
        }
        swift_bridgeObjectRetain();
        v97  = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v97 >= v2)
        {
LABEL_32:
          if ((v2 & 0x8000000000000000) == 0)
          {
            if (v3)
            {
              swift_bridgeObjectRetain();
              uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v25 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            if (v25 >= v24)
            {
              if ((v24 & 0x8000000000000000) == 0)
              {
                if ((v9 & 0xC000000000000001) != 0 && v2 != v24)
                {
                  if (v2 >= (unint64_t)v24)
                  {
LABEL_199:
                    __break(1u);
                    goto LABEL_200;
                  }
                  type metadata accessor for FeaturedTurn(0);
                  Swift::Int v37 = v2;
                  do
                  {
                    Swift::Int v38 = v37 + 1;
                    _ArrayBuffer._typeCheckSlowPath(_:)(v37);
                    Swift::Int v37 = v38;
                  }
                  while (v24 != v38);
                }
                if (v3)
                {
                  swift_bridgeObjectRetain();
                  _CocoaArrayWrapper.subscript.getter();
                  uint64_t v39 = v55;
                  uint64_t v2 = v56;
                  unint64_t v58 = v57;
                  swift_bridgeObjectRelease_n();
                  uint64_t v24 = v58 >> 1;
                }
                else
                {
                  uint64_t v39 = (v9 & 0xFFFFFFFFFFFFFF8) + 32;
                }
                uint64_t v48 = MEMORY[0x263F8EE78];
                unint64_t v104 = MEMORY[0x263F8EE78];
                uint64_t v59 = v24 - v2;
                if (v24 == v2)
                {
                  swift_unknownObjectRelease();
                  unint64_t v60 = MEMORY[0x263F8EE78];
                  goto LABEL_130;
                }
                if (v24 <= v2)
                {
LABEL_203:
                  __break(1u);
LABEL_204:
                  __break(1u);
                  goto LABEL_205;
                }
                uint64_t v71 = v39 + 8 * v2;
                do
                {
                  uint64_t v72 = *(uint64_t (**)(uint64_t))(**(void **)v71 + 176);
                  uint64_t v73 = swift_retain();
                  if (v72(v73))
                  {
                    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
                    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                    specialized ContiguousArray._endMutation()();
                  }
                  else
                  {
                    swift_release();
                  }
                  v71 += 8;
                  --v59;
                }
                while (v59);
LABEL_129:
                swift_unknownObjectRelease();
                unint64_t v60 = v104;
LABEL_130:
                unint64_t v105 = v48;
                if ((v60 & 0x8000000000000000) != 0 || (v60 & 0x4000000000000000) != 0)
                {
                  swift_bridgeObjectRetain();
                  uint64_t v87 = _CocoaArrayWrapper.endIndex.getter();
                  swift_release();
                  if (v87) {
                    goto LABEL_133;
                  }
                }
                else
                {
                  uint64_t v87 = *(void *)(v60 + 16);
                  if (v87)
                  {
LABEL_133:
                    if (v87 >= 1)
                    {
                      uint64_t v88 = 0;
                      while (1)
                      {
                        if ((v60 & 0xC000000000000001) != 0)
                        {
                          id v89 = (void *)MEMORY[0x230F812A0](v88, v60);
                        }
                        else
                        {
                          id v89 = *(void **)(v60 + 8 * v88 + 32);
                          swift_retain();
                        }
                        uint64_t v90 = (*(uint64_t (**)(void))(*v89 + 144))();
                        if (v91)
                        {
                          if (v90 == v89[3] && v91 == v89[4])
                          {
                            swift_bridgeObjectRelease();
LABEL_148:
                            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
                            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                            specialized ContiguousArray._endMutation()();
                            goto LABEL_136;
                          }
                          char v93 = _stringCompareWithSmolCheck(_:_:expecting:)();
                          swift_bridgeObjectRelease();
                          if (v93) {
                            goto LABEL_148;
                          }
                        }
                        swift_release();
LABEL_136:
                        if (v87 == ++v88)
                        {
                          swift_release();
                          unint64_t v94 = v105;
                          goto LABEL_186;
                        }
                      }
                    }
                    __break(1u);
                    goto LABEL_197;
                  }
                }
                swift_release();
                unint64_t v94 = MEMORY[0x263F8EE78];
LABEL_186:
                a2  = specialized Collection.prefix(_:)(a2, v94);
                uint64_t v75 = v99;
                uint64_t v77 = v100;
                unint64_t v79 = v101;
                swift_release();
                if (v79)
                {
                  type metadata accessor for __ContiguousArrayStorageBase();
                  swift_unknownObjectRetain_n();
                  uint64_t v102 = swift_dynamicCastClass();
                  if (!v102)
                  {
                    swift_unknownObjectRelease();
                    uint64_t v102 = MEMORY[0x263F8EE78];
                  }
                  uint64_t v81 = *(void *)(v102 + 16);
                  swift_release();
                  unint64_t v82 = (v79 >> 1) - v77;
                  if (!__OFSUB__(v79 >> 1, v77))
                  {
LABEL_191:
                    if (v81 == v82)
                    {
                      uint64_t v64 = swift_dynamicCastClass();
                      swift_unknownObjectRelease();
                      if (!v64)
                      {
                        swift_unknownObjectRelease();
                        return MEMORY[0x263F8EE78];
                      }
                      return v64;
                    }
                    swift_unknownObjectRelease();
                    goto LABEL_187;
                  }
                  goto LABEL_204;
                }
LABEL_187:
                uint64_t v64 = specialized _copyCollectionToContiguousArray<A>(_:)(a2, v75, v77, v79);
                swift_unknownObjectRelease();
                return v64;
              }
              goto LABEL_181;
            }
            goto LABEL_177;
          }
          goto LABEL_173;
        }
        __break(1u);
LABEL_164:
        swift_bridgeObjectRetain();
        uint64_t v29 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v29 < (uint64_t)v9)
        {
LABEL_208:
          __break(1u);
          JUMPOUT(0x22D492244);
        }
        swift_bridgeObjectRetain();
        uint64_t v98 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v98 >= (uint64_t)v9)
        {
LABEL_41:
          if ((v9 & 0x8000000000000000) == 0)
          {
            if (v4)
            {
              swift_bridgeObjectRetain();
              uint64_t v30 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v30 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            if (v30 >= v29)
            {
              if ((v29 & 0x8000000000000000) == 0)
              {
                if ((v24 & 0xC000000000000001) != 0 && v9 != v29)
                {
                  if (v9 >= v29)
                  {
LABEL_200:
                    __break(1u);
                    goto LABEL_201;
                  }
                  type metadata accessor for FeaturedTurn(0);
                  Swift::Int v40 = v9;
                  do
                  {
                    Swift::Int v41 = v40 + 1;
                    _ArrayBuffer._typeCheckSlowPath(_:)(v40);
                    Swift::Int v40 = v41;
                  }
                  while (v29 != v41);
                }
                if (v4)
                {
                  swift_bridgeObjectRetain();
                  _CocoaArrayWrapper.subscript.getter();
                  uint64_t v42 = v61;
                  unint64_t v9 = v62;
                  unint64_t v43 = v63;
                  swift_bridgeObjectRelease_n();
                }
                else
                {
                  uint64_t v42 = (v24 & 0xFFFFFFFFFFFFFF8) + 32;
                  unint64_t v43 = (2 * v29) | 1;
                }
                swift_retain();
                a2  = specialized _ArrayProtocol.filter(_:)(v42, v9, v43, v2, a2);
                swift_unknownObjectRelease();
                swift_release();
                if ((a2 & 0x8000000000000000) == 0 && (a2 & 0x4000000000000000) == 0) {
                  return a2 & 0xFFFFFFFFFFFFFF8;
                }
LABEL_183:
                uint64_t v64 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a2);
                swift_bridgeObjectRelease();
                return v64;
              }
LABEL_182:
              __break(1u);
              goto LABEL_183;
            }
            goto LABEL_178;
          }
          goto LABEL_174;
        }
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
        goto LABEL_182;
    }
  }
  return v103();
}

void FeaturedTurnInternal.__allocating_init(turnID:timestamp:requestID:features:)()
{
}

void FeaturedTurnInternal.init(turnID:timestamp:requestID:features:)()
{
}

uint64_t FeaturedTurnInternal.__ivar_destroyer()
{
  return swift_bridgeObjectRelease();
}

uint64_t FeaturedTurnInternal.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, &demangling cache variable for type metadata for UUID?);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FeaturedTurnInternal.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, &demangling cache variable for type metadata for UUID?);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      unint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      unint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2]  = v2;
      v3[3]  = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    specialized Array._copyContents(initializing:)((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v8 = v5;
    if (v5 <= 0)
    {
      unint64_t v9 = (void *)MEMORY[0x263F8EE78];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        type metadata accessor for FeaturedTurn(0);
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      unint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      void v9[2] = v5;
      v9[3]  = (2 * (v11 >> 3)) | 1;
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*specialized protocol witness for Collection.subscript.read in conformance [A](uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1  = v6;
  *((void *)v6 + 4)  = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

{
  uint64_t (*v6)();

  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1  = v6;
  *((void *)v6 + 4)  = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

void protocol witness for Collection.subscript.read in conformance [A]specialized (void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*specialized Array.subscript.read(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x230F812A0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *unint64_t v3 = v4;
    return Array.subscript.readspecialized ;
  }
  __break(1u);
  return result;
}

{
  uint64_t *v3;
  uint64_t v4;

  unint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x230F812A0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *unint64_t v3 = v4;
    return Array.subscript.readspecialized ;
  }
  __break(1u);
  return result;
}

uint64_t Array.subscript.readspecialized ()
{
  return swift_release();
}

uint64_t specialized Collection.firstIndex(where:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = MEMORY[0x230F812A0](v7, a1);
      }
      else
      {
        uint64_t v8 = *(void *)(a1 + 8 * v7 + 32);
        swift_retain();
      }
      if (*(void *)(v8 + 24) == a2 && *(void *)(v8 + 32) == a3) {
        break;
      }
      char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_release();
      if (v10) {
        return v7;
      }
      uint64_t v11 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_17:
        swift_bridgeObjectRetain();
        uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        uint64_t v7 = 0;
        if (!v6) {
          return v7;
        }
      }
      else
      {
        ++v7;
        if (v11 == v6) {
          return 0;
        }
      }
    }
    swift_release();
  }
  return v7;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v11 = MEMORY[0x263F8EE78];
  int64_t v7 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    uint64_t v9 = a2;
    double v10 = (double)a5;
    while (v9 < v7)
    {
      if (*(double *)(*(void *)(a1 + 8 * v9) + 40) <= *(double *)(a4 + 40) + v10)
      {
        swift_retain();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        uint64_t result = specialized ContiguousArray._endMutation()();
      }
      if (v7 == ++v9) {
        return v11;
      }
    }
    __break(1u);
  }
  return result;
}

unint64_t specialized NeighborType.init(rawValue:)(Swift::String string)
{
  object  = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object  = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of NeighborType.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return 4;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type NeighborType and conformance NeighborType()
{
  unint64_t result = lazy protocol witness table cache variable for type NeighborType and conformance NeighborType;
  if (!lazy protocol witness table cache variable for type NeighborType and conformance NeighborType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NeighborType and conformance NeighborType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [NeighborType] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [NeighborType] and conformance [A];
  if (!lazy protocol witness table cache variable for type [NeighborType] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [NeighborType]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [NeighborType] and conformance [A]);
  }
  return result;
}

uint64_t sub_22D492B6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 120))();
  *a2  = result;
  return result;
}

uint64_t sub_22D492BB8(uint64_t a1, uint64_t a2)
{
  Swift::String v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 128);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_22D492C0C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 144))();
  *a2  = result;
  a2[1]  = v4;
  return result;
}

uint64_t sub_22D492C58(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 152);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_22D492CC0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 216))();
  *a2  = result;
  return result;
}

uint64_t sub_22D492D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 224);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_22D492D60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 240))();
  *(void *)a2  = result;
  *(unsigned char *)(a2 + 8)  = v4 & 1;
  return result;
}

uint64_t sub_22D492DB4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void))(**(void **)a2 + 248))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t ObjC metadata update function for FeaturedTurn()
{
  return type metadata accessor for FeaturedTurn(0);
}

void type metadata completion function for FeaturedTurn()
{
  type metadata accessor for UUID?();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for FeaturedTurn(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeaturedTurn);
}

uint64_t dispatch thunk of FeaturedTurn.features.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of FeaturedTurn.features.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of FeaturedTurn.features.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of FeaturedTurn.conversationID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of FeaturedTurn.conversationID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of FeaturedTurn.conversationID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of FeaturedTurn.__allocating_init(turnID:timestamp:requestID:features:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v4 + 168))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of FeaturedTurn.hasUtterance()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of FeaturedTurn.hasCatId()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of FeaturedTurn.timestampString()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t type metadata accessor for FeaturedConversation()
{
  return self;
}

uint64_t method lookup function for FeaturedConversation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeaturedConversation);
}

uint64_t dispatch thunk of FeaturedConversation.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t getEnumTagSinglePayload for NeighborType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NeighborType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1]  = v6;
        break;
      case 2:
        *(_WORD *)(result + 1)  = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22D4931F0);
      case 4:
        *(_DWORD *)(result + 1)  = v6;
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
        result[1]  = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1)  = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1)  = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NeighborType()
{
  return &type metadata for NeighborType;
}

uint64_t ObjC metadata update function for FeaturedTurnInternal()
{
  return type metadata accessor for FeaturedTurnInternal(0);
}

uint64_t type metadata accessor for FeaturedTurnInternal(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FeaturedTurnInternal);
}

uint64_t type metadata completion function for FeaturedTurnInternal()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for FeaturedTurnInternal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeaturedTurnInternal);
}

uint64_t dispatch thunk of FeaturedTurnInternal.sortedFeaturedTurns.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.sortedFeaturedTurns.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.sortedFeaturedTurns.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.index.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.index.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 248))(a1, a2 & 1);
}

uint64_t dispatch thunk of FeaturedTurnInternal.index.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.__allocating_init(turnID:timestamp:requestID:features:sortedFeaturedTurns:)()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.neighborTurns(neighborType:neighborSize:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

double BiomeGradedInteractionWriter.missingRestatementScore.getter()
{
  return -1.0;
}

id BiomeGradedInteractionWriter.bms.getter()
{
  return *(id *)(v0 + 24);
}

id BiomeGradedInteractionWriter.bmsEventContext.getter()
{
  return *(id *)(v0 + 32);
}

void *BiomeGradedInteractionWriter.__allocating_init()()
{
  uint64_t v0 = (void *)swift_allocObject();
  v0[2]  = 0xBFF0000000000000;
  v0[3]  = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A940]), sel_init);
  v0[4]  = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A798]), sel_init);
  return v0;
}

void *BiomeGradedInteractionWriter.init()()
{
  v0[2]  = 0xBFF0000000000000;
  v0[3]  = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A940]), sel_init);
  v0[4]  = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A798]), sel_init);
  return v0;
}

Swift::Void __swiftcall BiomeGradedInteractionWriter.write(gradedInteractions:)(Swift::OpaquePointer gradedInteractions)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v1 = *((void *)gradedInteractions._rawValue + 2);
  if (v1)
  {
    uint64_t v46 = *(void *)(v42 + 32);
    for (uint64_t i = (double *)(swift_bridgeObjectRetain() + 88); ; i += 8)
    {
      uint64_t v47 = v1;
      double v3 = *(i - 5);
      unsigned int v4 = (void *)*((void *)i - 4);
      uint64_t v5 = *((void *)i - 1);
      double v6 = *i;
      id v7 = objc_allocWithZone(MEMORY[0x263EFF910]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      id v8 = objc_msgSend(v7, sel_init);
      objc_msgSend(v8, sel_timeIntervalSinceReferenceDate);
      double v10 = v9;

      uint64_t v11 = *(uint64_t (**)(uint64_t))(*v4 + 120);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v12 = swift_bridgeObjectRetain();
      unint64_t v13 = v11(v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v14 = specialized Collection.filterByType<A>(as:)(v13);
      unint64_t v15 = v14;
      if (v14 >> 62)
      {
        if (!_CocoaArrayWrapper.endIndex.getter())
        {
LABEL_13:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_14:
          double v16 = -1.0;
          goto LABEL_15;
        }
      }
      else if (!*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_13;
      }
      if ((v15 & 0xC000000000000001) != 0)
      {
        MEMORY[0x230F812A0](0, v15);
      }
      else
      {
        if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          __break(1u);
        }
        swift_retain();
      }
      swift_bridgeObjectRelease();
      swift_retain();
      dispatch thunk of TypedFeature.value.getter();
      swift_bridgeObjectRelease();
      swift_release_n();
      if (v49 == 1) {
        goto LABEL_14;
      }
      double v16 = v48;
LABEL_15:
      uint64_t v17 = v4[3];
      uint64_t v18 = v4[4];
      id v19 = objc_allocWithZone(MEMORY[0x263F2A938]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v20 = (void *)MEMORY[0x230F80F90](v17, v18);
      swift_bridgeObjectRelease();
      uint64_t v21 = (void *)MEMORY[0x230F80F90](v5, *(void *)&v6);
      swift_bridgeObjectRelease();
      id v22 = objc_msgSend(v19, sel_initWithAbsoluteTimestamp_inferredHelpfulnessScore_restatementScore_turnID_modelID_, v20, v21, v10, v3, v16);

      double v48 = 0.0;
      if (objc_msgSend(v22, sel_isValidWithContext_error_, v46, &v48))
      {
        uint64_t v23 = *(void **)(v42 + 24);
        id v24 = *(id *)&v48;
        id v25 = objc_msgSend(v23, sel_source);
        objc_msgSend(v25, sel_sendEvent_, v22);

        if (one-time initialization token for defaultLogger != -1) {
          swift_once();
        }
        uint64_t v26 = type metadata accessor for Logger();
        __swift_project_value_buffer(v26, (uint64_t)defaultLogger);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v27 = Logger.logObject.getter();
        os_log_type_t v28 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = swift_slowAlloc();
          unint64_t v43 = v22;
          double v30 = COERCE_DOUBLE(swift_slowAlloc());
          double v48 = v30;
          *(_DWORD *)uint64_t v29 = 136315138;
          uint64_t v31 = v4[3];
          unint64_t v32 = v4[4];
          swift_bridgeObjectRetain();
          *(void *)(v29 + 4)  = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, (uint64_t *)&v48);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22D468000, v27, v28, "successfully streamed event with turnID: %s", (uint8_t *)v29, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x230F81A50](*(void *)&v30, -1, -1);
          MEMORY[0x230F81A50](v29, -1, -1);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_release_n();
          swift_bridgeObjectRelease_n();
        }
      }
      else
      {
        id v33 = *(id *)&v48;
        uint64_t v34 = _convertNSErrorToError(_:)();

        id v45 = (id)v34;
        swift_willThrow();
        if (one-time initialization token for defaultLogger != -1) {
          swift_once();
        }
        uint64_t v35 = type metadata accessor for Logger();
        __swift_project_value_buffer(v35, (uint64_t)defaultLogger);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v36 = Logger.logObject.getter();
        os_log_type_t v37 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v36, v37))
        {
          uint64_t v38 = swift_slowAlloc();
          uint64_t v44 = v22;
          double v39 = COERCE_DOUBLE(swift_slowAlloc());
          double v48 = v39;
          *(_DWORD *)uint64_t v38 = 136315138;
          uint64_t v41 = v4[3];
          unint64_t v40 = v4[4];
          swift_bridgeObjectRetain();
          *(void *)(v38 + 4)  = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v40, (uint64_t *)&v48);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22D468000, v36, v37, "failed to stream event with turnID: %s", (uint8_t *)v38, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x230F81A50](*(void *)&v39, -1, -1);
          MEMORY[0x230F81A50](v38, -1, -1);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_release_n();
          swift_bridgeObjectRelease_n();
        }
      }
      --v1;
      if (v47 == 1)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
  }
}

uint64_t BiomeGradedInteractionWriter.deinit()
{
  return v0;
}

uint64_t BiomeGradedInteractionWriter.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t protocol witness for GradedInteractionWriter.write(gradedInteractions:) in conformance BiomeGradedInteractionWriter()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112))();
}

uint64_t dispatch thunk of GradedInteractionWriter.write(gradedInteractions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for BiomeGradedInteractionWriter()
{
  return self;
}

uint64_t method lookup function for BiomeGradedInteractionWriter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BiomeGradedInteractionWriter);
}

uint64_t dispatch thunk of BiomeGradedInteractionWriter.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of BiomeGradedInteractionWriter.write(gradedInteractions:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
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

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x270EEFCB0]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t URL.deletingLastPathComponent()()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x270EEFFC8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x270EF0C88]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)MEMORY[0x270EF15C8]();
}

uint64_t static TimeZone.current.getter()
{
  return MEMORY[0x270EF1600]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x270EF1608]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x270F28690]();
}

uint64_t type metadata accessor for Confidence()
{
  return MEMORY[0x270F701A0]();
}

uint64_t Conversation.allTurnsChronologically.getter()
{
  return MEMORY[0x270F701B0]();
}

uint64_t type metadata accessor for Conversation()
{
  return MEMORY[0x270F701B8]();
}

uint64_t TypedFeature.init(value:confidence:)()
{
  return MEMORY[0x270F70200]();
}

uint64_t dispatch thunk of TypedFeature.value.getter()
{
  return MEMORY[0x270F70208]();
}

uint64_t TypedFeature.deinit()
{
  return MEMORY[0x270F70210]();
}

uint64_t StreamBookmark.__allocating_init(name:)()
{
  return MEMORY[0x270F70298]();
}

uint64_t type metadata accessor for StreamBookmark()
{
  return MEMORY[0x270F702A0]();
}

uint64_t FeatureProvider.init(features:targetName:)()
{
  return MEMORY[0x270F702F8]();
}

uint64_t type metadata accessor for FeatureProvider()
{
  return MEMORY[0x270F70300]();
}

uint64_t PLLoggingReader.asyncSignalReader.getter()
{
  return MEMORY[0x270F70308]();
}

uint64_t PLLoggingReader.streamBookmarkStore.getter()
{
  return MEMORY[0x270F70310]();
}

uint64_t static PLLoggingReader.shared.getter()
{
  return MEMORY[0x270F70318]();
}

uint64_t type metadata accessor for PLLoggingReader()
{
  return MEMORY[0x270F70320]();
}

uint64_t dispatch thunk of AsyncSignalReader.turns()()
{
  return MEMORY[0x270F70370]();
}

uint64_t dispatch thunk of StreamBookmarkStore.notifyOnComplete(completion:)()
{
  return MEMORY[0x270F703E0]();
}

uint64_t dispatch thunk of StreamBookmarkStore.read(name:)()
{
  return MEMORY[0x270F703E8]();
}

uint64_t dispatch thunk of StreamBookmarkStore.write(bookmark:)()
{
  return MEMORY[0x270F703F0]();
}

uint64_t dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)()
{
  return MEMORY[0x270F70530]();
}

uint64_t Turn.events.getter()
{
  return MEMORY[0x270F705D8]();
}

uint64_t Turn.turnID.getter()
{
  return MEMORY[0x270F705E0]();
}

uint64_t dispatch thunk of Feature.value()()
{
  return MEMORY[0x270F70668]();
}

uint64_t static UEIEvents.clientEvent(from:)()
{
  return MEMORY[0x270F70670]();
}

uint64_t static UEIEvents.turnID(_:)()
{
  return MEMORY[0x270F70680]();
}

uint64_t static UEIEvents.dialogID(_:)()
{
  return MEMORY[0x270F70688]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t OSSignpostID.init(log:object:)()
{
  return MEMORY[0x270FA2CB8]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
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

uint64_t Array.init()()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
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

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x270F9D5F8]();
  result._object  = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9D758]();
}

uint64_t String.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D760]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = MEMORY[0x270F9D7D8]();
  result.value._object  = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t Sequence.filter(_:)()
{
  return MEMORY[0x270F9D990]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9DBA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t Array.debugDescription.getter()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t Array.append<A>(contentsOf:)()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return MEMORY[0x270FA2080]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x270F9E140]();
}

uint64_t SISchemaUUID.toNSUUID()()
{
  return MEMORY[0x270F66220]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
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

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
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

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
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

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t AsyncMapSequence.init(_:transform:)()
{
  return MEMORY[0x270FA2240]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return MEMORY[0x270F9F000]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return MEMORY[0x270F9F088]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t _arrayConditionalCast<A, B>(_:)()
{
  return MEMORY[0x270F9F220]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x270F9F4C8](a1);
}

uint64_t AsyncCompactMapSequence.init(_:transform:)()
{
  return MEMORY[0x270FA2310]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return MEMORY[0x270F9F918]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x270F9F920]();
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}