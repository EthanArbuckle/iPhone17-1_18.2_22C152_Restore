BOOL Logger.Subsystem.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Logger.Subsystem.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

unint64_t Logger.Subsystem.rawValue.getter()
{
  return OUTLINED_FUNCTION_1();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  return String.hash(into:)();
}

{
  uint64_t vars8;

  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

BOOL protocol witness for RawRepresentable.init(rawValue:) in conformance Logger.Subsystem@<W0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = Logger.Subsystem.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Logger.Subsystem@<X0>(void *a1@<X8>)
{
  unint64_t result = Logger.Subsystem.rawValue.getter();
  *a1 = 0xD00000000000001ELL;
  a1[1] = v3;
  return result;
}

SiriCorrections::Logger::Category_optional __swiftcall Logger.Category.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Logger.Category.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = SiriCorrections_Logger_Category_instrumentation;
  }
  else {
    v4.value = SiriCorrections_Logger_Category_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t Logger.Category.rawValue.getter(char a1)
{
  if (a1) {
    return 0x656D757274736E49;
  }
  else {
    return 0x6974636572726F43;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Logger.Category(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Logger.Category()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Logger.Category()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Logger.Category()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

SiriCorrections::Logger::Category_optional protocol witness for RawRepresentable.init(rawValue:) in conformance Logger.Category@<W0>(Swift::String *a1@<X0>, SiriCorrections::Logger::Category_optional *a2@<X8>)
{
  result.value = Logger.Category.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Logger.Category@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Logger.Category.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t one-time initialization function for log()
{
  type metadata accessor for OS_os_log();
  OUTLINED_FUNCTION_1();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  static Logger.log = result;
  return result;
}

uint64_t *Logger.log.unsafeMutableAddressor()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  return &static Logger.log;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.logger);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.logger);
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v1 = (id)static Logger.log;
  return Logger.init(_:)();
}

uint64_t Logger.logger.unsafeMutableAddressor()
{
  return Logger.logger.unsafeMutableAddressor(&one-time initialization token for logger, (uint64_t)static Logger.logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.logger.getter(&one-time initialization token for logger, (uint64_t)static Logger.logger, a1);
}

uint64_t one-time initialization function for instrumentation()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.instrumentation);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.instrumentation);
  type metadata accessor for OS_os_log();
  OUTLINED_FUNCTION_1();
  OS_os_log.init(subsystem:category:)();
  return Logger.init(_:)();
}

uint64_t Logger.instrumentation.unsafeMutableAddressor()
{
  return Logger.logger.unsafeMutableAddressor(&one-time initialization token for instrumentation, (uint64_t)static Logger.instrumentation);
}

uint64_t Logger.logger.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.instrumentation.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.logger.getter(&one-time initialization token for instrumentation, (uint64_t)static Logger.instrumentation, a1);
}

uint64_t static Logger.logger.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t static Logger.makeSignpostID(log:)(void *a1)
{
  id v1 = a1;
  return OSSignpostID.init(log:)();
}

uint64_t static Logger.begin(_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static Logger.begin(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Logger.begin(_:_:log:)(a1, a2, a3, a4, a5, MEMORY[0x1E4FBD3A0]);
}

uint64_t static Logger.event(_:log:)()
{
  uint64_t v0 = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790]();
  id v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.event.getter();
  static OSSignpostID.exclusive.getter();
  OUTLINED_FUNCTION_3();
  os_signpost(_:dso:log:name:signpostID:)();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v0);
}

id static Logger.log.getter()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static Logger.log;
  return v0;
}

uint64_t static Logger.end(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Logger.begin(_:_:log:)(a1, a2, a3, a4, a5, MEMORY[0x1E4FBD398]);
}

uint64_t static Logger.begin(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  a6();
  OUTLINED_FUNCTION_3();
  return os_signpost(_:dso:log:name:signpostID:)();
}

id default argument 1 of static Logger.withSignpost<A>(name:log:completion:)()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static Logger.log;
  return v0;
}

uint64_t static Logger.withSignpost<A>(name:log:completion:)(uint64_t a1, uint64_t a2, int a3, void *a4, void (*a5)(uint64_t, uint64_t))
{
  int v21 = a3;
  v20[0] = a1;
  v20[1] = a2;
  uint64_t v7 = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10, v11);
  v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (OS_os_log.signpostsEnabled.getter())
  {
    id v14 = a4;
    OSSignpostID.init(log:)();
    static os_signpost_type_t.begin.getter();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_2();
    a5(v15, v16);
    static os_signpost_type_t.end.getter();
    OUTLINED_FUNCTION_5();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v13, v7);
  }
  else
  {
    OUTLINED_FUNCTION_2();
    return ((uint64_t (*)(uint64_t, uint64_t))a5)(v18, v19);
  }
}

unint64_t lazy protocol witness table accessor for type Logger.Subsystem and conformance Logger.Subsystem()
{
  unint64_t result = lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem;
  if (!lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Logger.Category and conformance Logger.Category()
{
  unint64_t result = lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category;
  if (!lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category);
  }
  return result;
}

void type metadata accessor for Logger()
{
}

uint64_t getEnumTagSinglePayload for Logger.Subsystem(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for Logger.Subsystem(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C9DBA574);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for Logger.Subsystem()
{
  return 0;
}

void type metadata accessor for Logger.Subsystem()
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Logger.Category(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Logger.Category(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C9DBA714);
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

uint64_t getEnumTag for Logger.Category(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for Logger.Category(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for Logger.Category()
{
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSPropertyListMutabilityOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = specialized OptionSet<>.init()();
  *a1 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SCSchemaSCUndoOutcomeReason@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = destructiveProjectEnumData for Logger.Subsystem(*v1);
  *a1 = result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SCSchemaSCUndoType(int *a1, int *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

void *protocol witness for OptionSet.init(rawValue:) in conformance NSPropertyListMutabilityOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
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

void CorrectionsEngine.__allocating_init()()
{
}

unint64_t OUTLINED_FUNCTION_1()
{
  return 0xD00000000000001ELL;
}

uint64_t OUTLINED_FUNCTION_5()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t CorrectionsPlatformClient.setupNewTurn(executionUUID:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  unsigned int v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  (*(void (**)(uint64_t))(*(void *)static CorrectionsSELFHelper.shared + 176))(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t CorrectionsPlatformClient.undoFollowUpPluginActionUserDataKey.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CorrectionsPlatformClient.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  CorrectionsPlatformClient.init()();
  return v0;
}

uint64_t CorrectionsPlatformClient.init()()
{
  uint64_t v1 = off_1EBC696B8;
  *(void *)(v0 + 16) = qword_1EBC696B0;
  *(void *)(v0 + 24) = v1;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t CorrectionsPlatformClient.checkUndo(input:context:)(uint64_t a1, long long *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome?);
  MEMORY[0x1F4188790](v4 - 8, v5);
  BOOL v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = *a2;
  long long v15 = a2[1];
  long long v16 = v8;
  long long v14 = a2[2];
  uint64_t v9 = *((void *)a2 + 6);
  uint64_t v10 = *((void *)a2 + 7);
  type metadata accessor for CorrectionsEngine();
  uint64_t inited = swift_initStaticObject();
  v17[0] = v16;
  v17[1] = v15;
  v17[2] = v14;
  uint64_t v18 = v9;
  uint64_t v19 = v10;
  uint64_t v12 = type metadata accessor for Siri_Nlu_External_CorrectionOutcome();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v12);
  (*(void (**)(uint64_t, _OWORD *, char *))(*(void *)inited + 128))(a1, v17, v7);
  return outlined destroy of Siri_Nlu_External_CorrectionOutcome?((uint64_t)v7);
}

uint64_t CorrectionsPlatformClient.checkUndo(input:context:correctionsOutcome:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v17 = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  type metadata accessor for CorrectionsEngine();
  uint64_t inited = swift_initStaticObject();
  OUTLINED_FUNCTION_0_0(inited, v8, v9, v10, v11, v12, v13, v14, v17);
  uint64_t v19 = v5;
  uint64_t v20 = v6;
  OUTLINED_FUNCTION_1_0();
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v15 + 128))(a1, v18, a3);
}

Swift::Void __swiftcall CorrectionsPlatformClient.commit()()
{
  type metadata accessor for CorrectionsEngine();
  swift_initStaticObject();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(void))(v0 + 144))();
}

uint64_t CorrectionsPlatformClient.setUndoInvocation(directInvocation:context:)(long long *a1, long long *a2)
{
  uint64_t v2 = *((void *)a1 + 2);
  long long v9 = *a2;
  long long v10 = *a1;
  long long v7 = a2[2];
  long long v8 = a2[1];
  uint64_t v3 = *((void *)a2 + 6);
  uint64_t v4 = *((void *)a2 + 7);
  type metadata accessor for CorrectionsEngine();
  swift_initStaticObject();
  long long v14 = v10;
  uint64_t v15 = v2;
  v11[0] = v9;
  v11[1] = v8;
  v11[2] = v7;
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  OUTLINED_FUNCTION_1_0();
  return (*(uint64_t (**)(long long *, _OWORD *))(v5 + 120))(&v14, v11);
}

Swift::Bool __swiftcall CorrectionsPlatformClient.isCorrectionPossible(context:)(SiriCorrections::CorrectionsContext_optional *context)
{
  long long resultCandidateId = (__int128)context->value.resultCandidateId;
  uint64_t countAndFlagsBits = context->value.executionRequestId.value._countAndFlagsBits;
  object = context->value.executionRequestId.value._object;
  type metadata accessor for CorrectionsEngine();
  uint64_t inited = swift_initStaticObject();
  OUTLINED_FUNCTION_0_0(inited, v4, v5, v6, v7, v8, v9, v10, resultCandidateId);
  uint64_t v15 = countAndFlagsBits;
  long long v16 = object;
  OUTLINED_FUNCTION_1_0();
  return (*(uint64_t (**)(unsigned char *))(v11 + 136))(v14) & 1;
}

uint64_t CorrectionsPlatformClient.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CorrectionsPlatformClient.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 32, 7);
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t outlined destroy of Siri_Nlu_External_CorrectionOutcome?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for CorrectionsPlatformClient()
{
  return self;
}

uint64_t method lookup function for CorrectionsPlatformClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CorrectionsPlatformClient);
}

uint64_t dispatch thunk of CorrectionsPlatformClient.setupNewTurn(executionUUID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.checkUndo(input:context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.checkUndo(input:context:correctionsOutcome:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.commit()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.setUndoInvocation(directInvocation:context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.isCorrectionPossible(context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

__n128 OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  return (__n128)a9;
}

uint64_t CorrectionOperation.attribute.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CorrectionOperation.correction.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  unsigned __int8 v4 = *(unsigned char *)(v1 + 32);
  *(unsigned char *)(a1 + 16) = v4;
  return outlined copy of CorrectionType(v2, v3, v4);
}

uint64_t outlined copy of CorrectionType(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 >= 2u && a3 != 3)
  {
    if (a3 != 2) {
      return result;
    }
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

__n128 CorrectionOperation.init(attribute:correction:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, __n128 *a4@<X8>)
{
  unsigned __int8 v4 = a3[1].n128_u8[0];
  a4->n128_u64[0] = a1;
  a4->n128_u64[1] = a2;
  __n128 result = *a3;
  a4[1] = *a3;
  a4[2].n128_u8[0] = v4;
  return result;
}

uint64_t destroy for CorrectionType(uint64_t a1)
{
  return outlined consume of CorrectionType(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t outlined consume of CorrectionType(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 >= 2u && a3 != 3)
  {
    if (a3 != 2) {
      return result;
    }
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for CorrectionType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of CorrectionType(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CorrectionType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of CorrectionType(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of CorrectionType(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CorrectionType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of CorrectionType(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionType(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFC && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for CorrectionType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for CorrectionType(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t destructiveInjectEnumTag for CorrectionType(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CorrectionType()
{
  return &type metadata for CorrectionType;
}

uint64_t initializeBufferWithCopyOfBuffer for CorrectionOperation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CorrectionOperation(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 32);
  return outlined consume of CorrectionType(v2, v3, v4);
}

uint64_t initializeWithCopy for CorrectionOperation(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  outlined copy of CorrectionType(v4, v5, v6);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for CorrectionOperation(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  LOBYTE(v2) = *((unsigned char *)v2 + 32);
  outlined copy of CorrectionType(v4, v5, v2);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = (_BYTE)v2;
  outlined consume of CorrectionType(v6, v7, v8);
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

uint64_t assignWithTake for CorrectionOperation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  char v5 = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  unsigned __int8 v8 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v5;
  outlined consume of CorrectionType(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionOperation(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 33))
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

uint64_t storeEnumTagSinglePayload for CorrectionOperation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CorrectionOperation()
{
  return &type metadata for CorrectionOperation;
}

Swift::Bool __swiftcall CorrectionsCustomizing.shouldConsiderVerbAsCorrection(verb:)(Swift::String verb)
{
  object = verb._object;
  uint64_t countAndFlagsBits = verb._countAndFlagsBits;
  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v6);
  if (!v6) {
    return 1;
  }
  char v4 = specialized Set.contains(_:)(countAndFlagsBits, (uint64_t)object, v6);
  swift_bridgeObjectRelease();
  return v4 & 1;
}

Swift::Bool __swiftcall WildcardStringSet.contains(value:)(Swift::String value)
{
  if (*v1) {
    return specialized Set.contains(_:)(value._countAndFlagsBits, (uint64_t)value._object, *v1);
  }
  else {
    return 1;
  }
}

Swift::Bool __swiftcall CorrectionsCustomizing.shouldAllowAttributeToBeCorrected(attribute:)(Swift::String attribute)
{
  uint64_t object = (uint64_t)attribute._object;
  uint64_t countAndFlagsBits = attribute._countAndFlagsBits;
  uint64_t v4 = (*(uint64_t (**)())(v1 + 8))();
  LOBYTE(object) = specialized Set.contains(_:)(countAndFlagsBits, object, v4);
  swift_bridgeObjectRelease();
  return (object & 1) == 0;
}

uint64_t specialized Set.contains(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          long long v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.attributesNotAllowedToBeCorrected.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.attributesNotAllowedToBeCorrected.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*CorrectionsCustomizationsAllowingAllEntities.attributesNotAllowedToBeCorrected.modify())(void)
{
  return destructiveProjectEnumData for Logger.Subsystem;
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.explicitCorrectionVerbs.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8);
  return swift_bridgeObjectRetain();
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.explicitCorrectionVerbs.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = v2;
  return result;
}

uint64_t (*CorrectionsCustomizationsAllowingAllEntities.explicitCorrectionVerbs.modify())(void)
{
  return destructiveProjectEnumData for Logger.Subsystem;
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.shouldAllowCorrectionsForTopLevelTaskEntity(_:)()
{
  return 1;
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.init(attributesNotAllowedToBeCorrected:explicitCorrectionVerbs:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  *a3 = result;
  a3[1] = v3;
  return result;
}

uint64_t protocol witness for CorrectionsCustomizing.shouldAllowCorrectionsForTopLevelTaskEntity(_:) in conformance CorrectionsCustomizationsAllowingAllEntities()
{
  return 1;
}

uint64_t dispatch thunk of CorrectionsCustomizing.attributesNotAllowedToBeCorrected.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CorrectionsCustomizing.explicitCorrectionVerbs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

void *initializeBufferWithCopyOfBuffer for WildcardStringSet(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for WildcardStringSet()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for WildcardStringSet(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for WildcardStringSet(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WildcardStringSet(uint64_t *a1, unsigned int a2)
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
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WildcardStringSet(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
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

uint64_t getEnumTag for WildcardStringSet(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *destructiveInjectEnumTag for WildcardStringSet(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for WildcardStringSet()
{
  return &type metadata for WildcardStringSet;
}

uint64_t destroy for CorrectionsCustomizationsAllowingAllEntities()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for CorrectionsCustomizationsAllowingAllEntities(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CorrectionsCustomizationsAllowingAllEntities(void *a1, void *a2)
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

_OWORD *assignWithTake for CorrectionsCustomizationsAllowingAllEntities(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionsCustomizationsAllowingAllEntities(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CorrectionsCustomizationsAllowingAllEntities(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CorrectionsCustomizationsAllowingAllEntities()
{
  return &type metadata for CorrectionsCustomizationsAllowingAllEntities;
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t CorrectionsDomainClient.undoFollowUpPluginActionUserDataKey.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CorrectionsDomainClient.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  CorrectionsDomainClient.init()();
  return v0;
}

uint64_t CorrectionsDomainClient.init()()
{
  uint64_t v1 = off_1EBC696B8;
  *(void *)(v0 + 16) = qword_1EBC696B0;
  *(void *)(v0 + 24) = v1;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t CorrectionsDomainClient.checkCorrection(input:)(uint64_t a1)
{
  type metadata accessor for CorrectionsEngine();
  uint64_t inited = swift_initStaticObject();
  return (*(uint64_t (**)(uint64_t))(*(void *)inited + 104))(a1);
}

uint64_t CorrectionsDomainClient.checkCorrections(input:customizations:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for CorrectionsEngine();
  uint64_t inited = swift_initStaticObject();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)inited + 112))(&v11, a1, a2);
  uint64_t v5 = v12;
  if (!v12) {
    return MEMORY[0x1E4FBC860];
  }
  char v6 = v15;
  uint64_t v8 = v13;
  uint64_t v7 = v14;
  uint64_t v9 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CorrectionOperation>);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_1C9DCFD30;
  *(void *)(result + 32) = v9;
  *(void *)(result + 40) = v5;
  *(void *)(result + 48) = v8;
  *(void *)(result + 56) = v7;
  *(unsigned char *)(result + 64) = v6;
  return result;
}

uint64_t CorrectionsDomainClient.donate(undoParse:)(long long *a1)
{
  long long v4 = *a1;
  uint64_t v1 = *((void *)a1 + 2);
  type metadata accessor for CorrectionsEngine();
  uint64_t inited = swift_initStaticObject();
  long long v6 = v4;
  uint64_t v7 = v1;
  memset(v5, 0, sizeof(v5));
  return (*(uint64_t (**)(long long *, _OWORD *))(*(void *)inited + 120))(&v6, v5);
}

uint64_t CorrectionsDomainClient.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CorrectionsDomainClient.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t type metadata accessor for CorrectionsDomainClient()
{
  return self;
}

uint64_t method lookup function for CorrectionsDomainClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CorrectionsDomainClient);
}

uint64_t dispatch thunk of CorrectionsDomainClient.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CorrectionsDomainClient.checkCorrection(input:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of CorrectionsDomainClient.checkCorrections(input:customizations:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of CorrectionsDomainClient.donate(undoParse:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t CorrectionsUSOParse.debugDescription.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x1F4188790](v2, v3);
  OUTLINED_FUNCTION_3_0();
  _StringGuts.grow(_:)(53);
  v4._uint64_t countAndFlagsBits = 0x7372615072657355;
  v4._uint64_t object = (void *)0xEB00000000203A65;
  String.append(_:)(v4);
  type metadata accessor for Siri_Nlu_External_UserParse();
  _print_unlocked<A, B>(_:_:)();
  v5._uint64_t object = (void *)0x80000001C9DD03D0;
  v5._uint64_t countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v5);
  uint64_t v6 = type metadata accessor for CorrectionsUSOParse(0);
  outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(v0 + *(int *)(v6 + 20), v1);
  v7._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._uint64_t countAndFlagsBits = 0x6E7542707061202CLL;
  v8._uint64_t object = (void *)0xEF203A6449656C64;
  String.append(_:)(v8);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  v9._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._uint64_t countAndFlagsBits = 41;
  v10._uint64_t object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  return 0;
}

uint64_t type metadata accessor for CorrectionsUSOParse(uint64_t a1)
{
  return type metadata accessor for CorrectionsUSOParse(a1, type metadata singleton initialization cache for CorrectionsUSOParse);
}

uint64_t outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CorrectionsUSOParse.init(userParse:parserIdentifier:appBundleId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for CorrectionsUSOParse(0);
  outlined init with take of Siri_Nlu_External_Parser.ParserIdentifier?(a2, a5 + *(int *)(v10 + 20));
  type metadata accessor for Siri_Nlu_External_UserParse();
  OUTLINED_FUNCTION_4_0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 32))(a5, a1);
  uint64_t v13 = (void *)(a5 + *(int *)(v10 + 24));
  void *v13 = a3;
  v13[1] = a4;
  return result;
}

uint64_t outlined init with take of Siri_Nlu_External_Parser.ParserIdentifier?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t CorrectionsUSOParse.userParse.getter@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for Siri_Nlu_External_UserParse();
  OUTLINED_FUNCTION_4_0();
  Swift::String v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t CorrectionsUSOParse.parserIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for CorrectionsUSOParse(0) + 20);
  return outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(v3, a1);
}

uint64_t CorrectionsUSOParse.appBundleId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CorrectionsUSOParse(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static CorrectionsUSOParse.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8, v9);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Siri_Nlu_External_Parser.ParserIdentifier?, Siri_Nlu_External_Parser.ParserIdentifier?));
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x1F4188790](v13, v14);
  OUTLINED_FUNCTION_3_0();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  uint64_t v17 = MEMORY[0x1F4188790](v15 - 8, v16);
  uint64_t v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v17, v20);
  v23 = (char *)&v45 - v22;
  MEMORY[0x1F4188790](v21, v24);
  v26 = (char *)&v45 - v25;
  if ((static Siri_Nlu_External_UserParse.== infix(_:_:)() & 1) == 0) {
    return 0;
  }
  uint64_t v27 = type metadata accessor for CorrectionsUSOParse(0);
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v30 = v27;
  uint64_t v31 = *(int *)(v27 + 20);
  uint64_t v45 = v28;
  outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(v28 + v31, (uint64_t)v26);
  uint64_t v46 = v30;
  uint64_t v32 = *(int *)(v30 + 20);
  uint64_t v33 = v29;
  outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(v29 + v32, (uint64_t)v23);
  uint64_t v34 = v2 + *(int *)(v12 + 48);
  outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v26, v2);
  outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v23, v34);
  OUTLINED_FUNCTION_5_0(v2);
  if (!v35)
  {
    outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(v2, (uint64_t)v19);
    OUTLINED_FUNCTION_5_0(v34);
    if (!v35)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v11, v34, v5);
      lazy protocol witness table accessor for type Siri_Nlu_External_Parser.ParserIdentifier and conformance Siri_Nlu_External_Parser.ParserIdentifier();
      char v36 = dispatch thunk of static Equatable.== infix(_:_:)();
      v37 = *(void (**)(char *, uint64_t))(v7 + 8);
      v37(v11, v5);
      outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v23, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v26, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      v37(v19, v5);
      outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?(v2, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      if ((v36 & 1) == 0) {
        return 0;
      }
      goto LABEL_12;
    }
    outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v23, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v26, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v19, v5);
LABEL_10:
    outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?(v2, &demangling cache variable for type metadata for (Siri_Nlu_External_Parser.ParserIdentifier?, Siri_Nlu_External_Parser.ParserIdentifier?));
    return 0;
  }
  outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v23, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v26, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  OUTLINED_FUNCTION_5_0(v34);
  if (!v35) {
    goto LABEL_10;
  }
  outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?(v2, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
LABEL_12:
  uint64_t v38 = *(int *)(v46 + 24);
  v39 = (void *)(v45 + v38);
  uint64_t v40 = *(void *)(v45 + v38 + 8);
  v41 = (void *)(v33 + v38);
  uint64_t v42 = v41[1];
  if (v40)
  {
    if (v42)
    {
      BOOL v43 = *v39 == *v41 && v40 == v42;
      if (v43 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
    }
  }
  else if (!v42)
  {
    return 1;
  }
  return 0;
}

uint64_t CorrectionsDirectInvocation.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CorrectionsDirectInvocation.userData.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CorrectionsDirectInvocation.init(identifier:userData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

BOOL static CorrectionsDirectInvocation.CodingKeys.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void CorrectionsDirectInvocation.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
}

SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional __swiftcall CorrectionsDirectInvocation.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  uint64_t object = stringValue._object;
  BOOL v2 = stringValue._countAndFlagsBits == 0x696669746E656469 && stringValue._object == (void *)0xEA00000000007265;
  if (v2
    || (uint64_t countAndFlagsBits = stringValue._countAndFlagsBits, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (countAndFlagsBits == 0x6174614472657375 && object == (void *)0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return (SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional)1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return (SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional)1;
    }
    else {
      return (SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional)2;
    }
  }
}

SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional __swiftcall CorrectionsDirectInvocation.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional)2;
}

Swift::Int CorrectionsDirectInvocation.CodingKeys.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

uint64_t CorrectionsDirectInvocation.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t CorrectionsDirectInvocation.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x6174614472657375;
  }
  else {
    return 0x696669746E656469;
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CorrectionsDirectInvocation.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static CorrectionsDirectInvocation.CodingKeys.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CorrectionsDirectInvocation.CodingKeys()
{
  return CorrectionsDirectInvocation.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance CorrectionsDirectInvocation.CodingKeys(uint64_t a1)
{
  CorrectionsDirectInvocation.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CorrectionsDirectInvocation.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CorrectionsDirectInvocation.CodingKeys()
{
  return CorrectionsDirectInvocation.CodingKeys.stringValue.getter(*v0);
}

SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional protocol witness for CodingKey.init(stringValue:) in conformance CorrectionsDirectInvocation.CodingKeys@<W0>(uint64_t a1@<X0>, SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional *a2@<X8>)
{
  result.value = CorrectionsDirectInvocation.CodingKeys.init(stringValue:)(*(Swift::String *)&a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance CorrectionsDirectInvocation.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance CorrectionsDirectInvocation.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CorrectionsDirectInvocation.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CorrectionsDirectInvocation.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t CorrectionsDirectInvocation.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CorrectionsDirectInvocation.CodingKeys>);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v5, v6);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    LOBYTE(v28) = 0;
    uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v11 = v10;
    LOBYTE(v27) = 1;
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    unint64_t v26 = v29;
    if (v29 >> 60 == 15)
    {
      uint64_t v12 = OUTLINED_FUNCTION_2_0();
      v13(v12);
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v15 = (uint64_t)v28;
      uint64_t v24 = self;
      uint64_t v25 = v15;
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      id v28 = 0;
      id v16 = objc_msgSend(v24, sel_propertyListWithData_options_format_error_, isa, 0, 0, &v28);

      if (!v16)
      {
        id v22 = v28;
        swift_bridgeObjectRelease();
        _convertNSErrorToError(_:)();

        swift_willThrow();
        outlined consume of Data?(v25, v26);
        uint64_t v7 = OUTLINED_FUNCTION_2_0();
        v8(v7);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
      id v17 = v28;
      _bridgeAnyObjectToAny(_:)();
      outlined consume of Data?(v25, v26);
      swift_unknownObjectRelease();
      uint64_t v18 = OUTLINED_FUNCTION_2_0();
      v19(v18);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
      int v20 = swift_dynamicCast();
      uint64_t v14 = v27;
      if (!v20) {
        uint64_t v14 = 0;
      }
    }
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t CorrectionsDirectInvocation.encode(to:)(void *a1)
{
  v27[2] = *(id *)MEMORY[0x1E4F143B8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CorrectionsDirectInvocation.CodingKeys>);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7, v8);
  OUTLINED_FUNCTION_3_0();
  uint64_t v26 = *(void *)(v1 + 16);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1;
  uint64_t v12 = v11;
  __swift_project_boxed_opaque_existential_1(v10, v9);
  lazy protocol witness table accessor for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v27[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v3, v12);
  }
  if (v26)
  {
    uint64_t v14 = self;
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    v27[0] = 0;
    id v16 = objc_msgSend(v14, sel_dataWithPropertyList_format_options_error_, isa, 200, 0, v27);

    id v17 = v27[0];
    if (v16)
    {
      uint64_t v18 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
      int v20 = v19;

      v27[0] = v18;
      v27[1] = v20;
      lazy protocol witness table accessor for type Data and conformance Data();
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      uint64_t v21 = OUTLINED_FUNCTION_6();
      v22(v21);
      return outlined consume of Data._Representation((uint64_t)v18, (unint64_t)v20);
    }
    v23 = v17;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  uint64_t v24 = OUTLINED_FUNCTION_6();
  return v25(v24);
}

uint64_t protocol witness for Decodable.init(from:) in conformance CorrectionsDirectInvocation@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CorrectionsDirectInvocation.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CorrectionsDirectInvocation(void *a1)
{
  return CorrectionsDirectInvocation.encode(to:)(a1);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t lazy protocol witness table accessor for type Siri_Nlu_External_Parser.ParserIdentifier and conformance Siri_Nlu_External_Parser.ParserIdentifier()
{
  unint64_t result = lazy protocol witness table cache variable for type Siri_Nlu_External_Parser.ParserIdentifier and conformance Siri_Nlu_External_Parser.ParserIdentifier;
  if (!lazy protocol witness table cache variable for type Siri_Nlu_External_Parser.ParserIdentifier and conformance Siri_Nlu_External_Parser.ParserIdentifier)
  {
    type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Siri_Nlu_External_Parser.ParserIdentifier and conformance Siri_Nlu_External_Parser.ParserIdentifier);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys;
  if (!lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys;
  if (!lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys;
  if (!lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys;
  if (!lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys);
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

uint64_t specialized OptionSet<>.init()()
{
  return 0;
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

uint64_t *initializeBufferWithCopyOfBuffer for CorrectionsParse(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
    return a1;
  }
  uint64_t v6 = *(void *)(a3 - 8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v16 = a2[1];
      *a1 = *a2;
      a1[1] = v16;
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 1:
      *a1 = *a2;
      swift_unknownObjectRetain();
      goto LABEL_13;
    case 0:
      uint64_t v8 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      uint64_t v9 = type metadata accessor for CorrectionsUSOParse(0);
      uint64_t v10 = *(int *)(v9 + 20);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
        __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
      }
      uint64_t v17 = *(int *)(v9 + 24);
      uint64_t v18 = (uint64_t *)((char *)a1 + v17);
      uint64_t v19 = (uint64_t *)((char *)a2 + v17);
      uint64_t v20 = v19[1];
      *uint64_t v18 = *v19;
      v18[1] = v20;
      swift_bridgeObjectRetain();
      goto LABEL_13;
  }
  memcpy(a1, a2, *(void *)(v6 + 64));
  return a1;
}

uint64_t destroy for CorrectionsParse(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    return swift_bridgeObjectRelease();
  }
  if (result != 1)
  {
    if (result) {
      return result;
    }
    uint64_t v3 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    uint64_t v4 = a1 + *(int *)(type metadata accessor for CorrectionsUSOParse(0) + 20);
    uint64_t v5 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
    }
    goto LABEL_8;
  }
  return swift_unknownObjectRelease();
}

void *initializeWithCopy for CorrectionsParse(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 1:
      *a1 = *a2;
      swift_unknownObjectRetain();
      goto LABEL_11;
    case 0:
      uint64_t v7 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = type metadata accessor for CorrectionsUSOParse(0);
      uint64_t v9 = *(int *)(v8 + 20);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      }
      uint64_t v15 = *(int *)(v8 + 24);
      uint64_t v16 = (void *)((char *)a1 + v15);
      uint64_t v17 = (void *)((char *)a2 + v15);
      uint64_t v18 = v17[1];
      *uint64_t v16 = *v17;
      v16[1] = v18;
      swift_bridgeObjectRetain();
      goto LABEL_11;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *assignWithCopy for CorrectionsParse(void *a1, void *a2, uint64_t a3)
{
  if (a1 == a2) {
    return a1;
  }
  outlined destroy of CorrectionsParse((uint64_t)a1);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 1:
      *a1 = *a2;
      swift_unknownObjectRetain();
      goto LABEL_12;
    case 0:
      uint64_t v7 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = type metadata accessor for CorrectionsUSOParse(0);
      uint64_t v9 = *(int *)(v8 + 20);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      }
      uint64_t v14 = *(int *)(v8 + 24);
      uint64_t v15 = (void *)((char *)a1 + v14);
      uint64_t v16 = (void *)((char *)a2 + v14);
      *uint64_t v15 = *v16;
      v15[1] = v16[1];
      swift_bridgeObjectRetain();
      goto LABEL_12;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

uint64_t outlined destroy of CorrectionsParse(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CorrectionsParse(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for CorrectionsParse(uint64_t a1)
{
  return type metadata accessor for CorrectionsUSOParse(a1, (uint64_t *)&type metadata singleton initialization cache for CorrectionsParse);
}

uint64_t type metadata accessor for CorrectionsUSOParse(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *initializeWithTake for CorrectionsParse(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = type metadata accessor for CorrectionsUSOParse(0);
    uint64_t v8 = *(int *)(v7 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    *(_OWORD *)&a1[*(int *)(v7 + 24)] = *(_OWORD *)&a2[*(int *)(v7 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for CorrectionsParse(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of CorrectionsParse((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = type metadata accessor for CorrectionsUSOParse(0);
      uint64_t v8 = *(int *)(v7 + 20);
      uint64_t v9 = &a1[v8];
      uint64_t v10 = &a2[v8];
      uint64_t v11 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
        __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      }
      *(_OWORD *)&a1[*(int *)(v7 + 24)] = *(_OWORD *)&a2[*(int *)(v7 + 24)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destructiveInjectEnumTag for CorrectionsParse()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for CorrectionsParse()
{
  uint64_t result = type metadata accessor for CorrectionsUSOParse(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for CorrectionsUSOParse(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = (uint64_t *)((char *)a1 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for CorrectionsUSOParse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Siri_Nlu_External_UserParse();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CorrectionsUSOParse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserParse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CorrectionsUSOParse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserParse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for CorrectionsUSOParse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserParse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for CorrectionsUSOParse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserParse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionsUSOParse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C9DBE7B8);
}

uint64_t sub_1C9DBE7B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for Siri_Nlu_External_UserParse();
  OUTLINED_FUNCTION_0_2();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  OUTLINED_FUNCTION_0_2();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  int v14 = v13 - 1;
  if (v14 < 0) {
    int v14 = -1;
  }
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrectionsUSOParse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C9DBE894);
}

void sub_1C9DBE894(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for Siri_Nlu_External_UserParse();
  OUTLINED_FUNCTION_0_2();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    OUTLINED_FUNCTION_0_2();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void type metadata completion function for CorrectionsUSOParse()
{
  type metadata accessor for Siri_Nlu_External_UserParse();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier?();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier?()
{
  if (!lazy cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?)
  {
    type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    }
  }
}

uint64_t destroy for CorrectionsDirectInvocation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for CorrectionsDirectInvocation(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CorrectionsDirectInvocation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

uint64_t assignWithTake for CorrectionsDirectInvocation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionsDirectInvocation(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
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

uint64_t storeEnumTagSinglePayload for CorrectionsDirectInvocation(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CorrectionsDirectInvocation()
{
  return &type metadata for CorrectionsDirectInvocation;
}

unsigned char *storeEnumTagSinglePayload for CorrectionsDirectInvocation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C9DBED14);
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

ValueMetadata *type metadata accessor for CorrectionsDirectInvocation.CodingKeys()
{
  return &type metadata for CorrectionsDirectInvocation.CodingKeys;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

void __swiftcall CorrectionsContext.init(userId:assistantId:)(SiriCorrections::CorrectionsContext *__return_ptr retstr, Swift::String_optional userId, Swift::String_optional assistantId)
{
  retstr->userId = userId;
  retstr->assistantId = assistantId;
  retstr->long long resultCandidateId = 0u;
  retstr->executionRequestId = 0u;
}

uint64_t CorrectionsContext.userId.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

uint64_t CorrectionsContext.assistantId.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

uint64_t CorrectionsContext.resultCandidateId.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

uint64_t CorrectionsContext.executionRequestId.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

double static CorrectionsContext.builder.getter()
{
  type metadata accessor for CorrectionsContext.Builder();
  uint64_t v0 = (_OWORD *)swift_allocObject();
  double result = 0.0;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[4] = 0u;
  return result;
}

double CorrectionsContext.Builder.__allocating_init()()
{
  uint64_t v0 = (_OWORD *)swift_allocObject();
  double result = 0.0;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[4] = 0u;
  return result;
}

uint64_t type metadata accessor for CorrectionsContext.Builder()
{
  return self;
}

uint64_t key path setter for CorrectionsContext.Builder.userId : CorrectionsContext.Builder(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 120);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t CorrectionsContext.Builder.userId.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

uint64_t CorrectionsContext.Builder.userId.setter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*CorrectionsContext.Builder.userId.modify())()
{
  return CorrectionsContext.Builder.userId.modify;
}

uint64_t key path setter for CorrectionsContext.Builder.assistantId : CorrectionsContext.Builder(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 144);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t CorrectionsContext.Builder.assistantId.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

uint64_t CorrectionsContext.Builder.assistantId.setter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*CorrectionsContext.Builder.assistantId.modify())()
{
  return CorrectionsContext.Builder.assistantId.modify;
}

uint64_t key path setter for CorrectionsContext.Builder.resultCandidateId : CorrectionsContext.Builder(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 168);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t CorrectionsContext.Builder.resultCandidateId.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

uint64_t CorrectionsContext.Builder.resultCandidateId.setter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*CorrectionsContext.Builder.resultCandidateId.modify())()
{
  return CorrectionsContext.Builder.userId.modify;
}

uint64_t key path setter for CorrectionsContext.Builder.executionRequestId : CorrectionsContext.Builder(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 192);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t CorrectionsContext.Builder.executionRequestId.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

uint64_t CorrectionsContext.Builder.executionRequestId.setter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1();
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*CorrectionsContext.Builder.executionRequestId.modify())()
{
  return CorrectionsContext.Builder.userId.modify;
}

uint64_t CorrectionsContext.Builder.userId(_:)()
{
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 120);
  swift_bridgeObjectRetain();
  uint64_t v2 = OUTLINED_FUNCTION_3_1();
  v1(v2);
  return swift_retain();
}

uint64_t CorrectionsContext.Builder.assistantId(_:)()
{
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 144);
  swift_bridgeObjectRetain();
  uint64_t v2 = OUTLINED_FUNCTION_3_1();
  v1(v2);
  return swift_retain();
}

uint64_t CorrectionsContext.Builder.resultCandidateId(_:)()
{
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 168);
  swift_bridgeObjectRetain();
  uint64_t v2 = OUTLINED_FUNCTION_3_1();
  v1(v2);
  return swift_retain();
}

uint64_t CorrectionsContext.Builder.executionRequestId(_:)()
{
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 192);
  swift_bridgeObjectRetain();
  uint64_t v2 = OUTLINED_FUNCTION_3_1();
  v1(v2);
  return swift_retain();
}

void __swiftcall CorrectionsContext.Builder.build()(SiriCorrections::CorrectionsContext *__return_ptr retstr)
{
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = (*(uint64_t (**)(void))(v2 + 112))();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_0_3();
  uint64_t v7 = (*(uint64_t (**)(void))(v6 + 136))();
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_0_3();
  uint64_t v11 = (*(uint64_t (**)(void))(v10 + 160))();
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_0_3();
  uint64_t v15 = (*(uint64_t (**)(void))(v14 + 184))();
  retstr->userId.value._uint64_t countAndFlagsBits = v3;
  retstr->userId.value._uint64_t object = v5;
  retstr->assistantId.value._uint64_t countAndFlagsBits = v7;
  retstr->assistantId.value._uint64_t object = v9;
  retstr->resultCandidateId.value._uint64_t countAndFlagsBits = v11;
  retstr->resultCandidateId.value._uint64_t object = v13;
  retstr->executionRequestId.value._uint64_t countAndFlagsBits = v15;
  retstr->executionRequestId.value._uint64_t object = v16;
}

uint64_t CorrectionsContext.Builder.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CorrectionsContext.Builder.__deallocating_deinit()
{
  CorrectionsContext.Builder.deinit();
  return MEMORY[0x1F4186488](v0, 80, 7);
}

double CorrectionsContext.Builder.init()()
{
  double result = 0.0;
  v0[3] = 0u;
  v0[4] = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return result;
}

uint64_t CorrectionsContext.debugDescription.getter()
{
  _StringGuts.grow(_:)(74);
  v0._uint64_t countAndFlagsBits = 0x203A644972657375;
  v0._uint64_t object = (void *)0xE800000000000000;
  String.append(_:)(v0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  v1._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_6_0();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._uint64_t countAndFlagsBits = 0x747369737361202CLL;
  v2._uint64_t object = (void *)0xEF203A6449746E61;
  String.append(_:)(v2);
  swift_bridgeObjectRetain();
  v3._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_6_0();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._uint64_t object = (void *)0x80000001C9DD03F0;
  v4._uint64_t countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v4);
  swift_bridgeObjectRetain();
  v5._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_6_0();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = 0xD000000000000016;
  v6._uint64_t object = (void *)0x80000001C9DD0410;
  String.append(_:)(v6);
  swift_bridgeObjectRetain();
  v7._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_6_0();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static CorrectionsContext.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = a2[2];
  uint64_t v6 = a2[3];
  if (!v3
    || (uint64_t v8 = a2[1]) == 0
    || (*a1 == *a2 ? (BOOL v9 = v3 == v8) : (BOOL v9 = 0),
        v9 || (v10 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v10 & 1) != 0)))
  {
    uint64_t result = 1;
    if (v5 && v6 && (v4 != v7 || v5 != v6))
    {
      return _stringCompareWithSmolCheck(_:_:expecting:)();
    }
  }
  return result;
}

uint64_t sub_1C9DBF94C@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_0_3();
  uint64_t result = (*(uint64_t (**)(void))(v2 + 112))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1C9DBF998@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_0_3();
  uint64_t result = (*(uint64_t (**)(void))(v2 + 136))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1C9DBF9E4@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_0_3();
  uint64_t result = (*(uint64_t (**)(void))(v2 + 160))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1C9DBFA30@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_0_3();
  uint64_t result = (*(uint64_t (**)(void))(v2 + 184))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t destroy for CorrectionsContext()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CorrectionsContext(void *a1, void *a2)
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

void *assignWithCopy for CorrectionsContext(void *a1, void *a2)
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

void *assignWithTake for CorrectionsContext(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for CorrectionsContext(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CorrectionsContext(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for CorrectionsContext()
{
  return &type metadata for CorrectionsContext;
}

uint64_t method lookup function for CorrectionsContext.Builder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CorrectionsContext.Builder);
}

uint64_t dispatch thunk of CorrectionsContext.Builder.userId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.userId.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.userId.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.assistantId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.assistantId.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.assistantId.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.resultCandidateId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.resultCandidateId.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.resultCandidateId.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.executionRequestId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.executionRequestId.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.executionRequestId.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.userId(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.assistantId(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.resultCandidateId(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.executionRequestId(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.build()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return String.init<A>(describing:)();
}

uint64_t *CorrectionsSELFHelper.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return &static CorrectionsSELFHelper.shared;
}

uint64_t one-time initialization function for shared()
{
  type metadata accessor for CorrectionsSELFHelper();
  uint64_t v0 = swift_allocObject();
  UUID.init()();
  uint64_t result = UUID.init()();
  static CorrectionsSELFHelper.shared = v0;
  return result;
}

uint64_t CorrectionsSELFHelper.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  UUID.init()();
  UUID.init()();
  return v0;
}

uint64_t static CorrectionsSELFHelper.shared.getter()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t CorrectionsSELFHelper.correctionsId.setter(uint64_t a1)
{
  return CorrectionsSELFHelper.correctionsId.setter(a1, &OBJC_IVAR____TtC15SiriCorrections21CorrectionsSELFHelper_correctionsId, "[CorrectionsSELFHelper] SELF logging Corrections ID: %s");
}

void CorrectionsSELFHelper.correctionsId.didset(void *a1, const char *a2)
{
  uint64_t v5 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8, v9);
  OUTLINED_FUNCTION_17();
  uint64_t v12 = v11 - v10;
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  __swift_project_value_buffer(v13, (uint64_t)static Logger.instrumentation);
  swift_retain_n();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v21 = a2;
    uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_11();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v17 = v2 + *a1;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v12, v17, v5);
    uint64_t v18 = UUID.uuidString.getter();
    unint64_t v20 = v19;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v12, v5);
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v20, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9DB7000, v14, v15, v21, v16, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();
  }
  else
  {

    swift_release_n();
  }
}

uint64_t CorrectionsSELFHelper.executionRequestId.setter(uint64_t a1)
{
  return CorrectionsSELFHelper.correctionsId.setter(a1, &OBJC_IVAR____TtC15SiriCorrections21CorrectionsSELFHelper_executionRequestId, "[CorrectionsSELFHelper] SELF logging Execution Request ID: %s");
}

uint64_t CorrectionsSELFHelper.correctionsId.setter(uint64_t a1, void *a2, const char *a3)
{
  uint64_t v7 = v3 + *a2;
  swift_beginAccess();
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v7, a1, v8);
  swift_endAccess();
  CorrectionsSELFHelper.correctionsId.didset(a2, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
}

uint64_t static CorrectionsSELFHelper.emit(_:)(uint64_t a1)
{
  objc_msgSend(objc_msgSend(self, sel_sharedStream), sel_emitMessage_, a1);
  return swift_unknownObjectRelease();
}

void CorrectionsSELFHelper.emitCheckUndo(undoType:undoReason:context:)()
{
  OUTLINED_FUNCTION_4_2();
  long long v1 = v0[1];
  v21[0] = *v0;
  v21[1] = v1;
  long long v2 = v0[3];
  v21[2] = v0[2];
  v21[3] = v2;
  uint64_t v4 = (*(uint64_t (**)(void))(v3 + 168))();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (one-time initialization token for instrumentation != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    uint64_t v7 = (_DWORD *)__swift_project_value_buffer(v6, (uint64_t)static Logger.instrumentation);
    id v8 = v5;
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, v10))
    {
      swift_slowAlloc();
      *(void *)&v21[0] = OUTLINED_FUNCTION_7_0();
      *uint64_t v7 = 136315138;
      id v11 = v8;
      id v12 = objc_msgSend(v11, sel_description);
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v15 = v14;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v15, (uint64_t *)v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_5_2(&dword_1C9DB7000, v9, v16, "[CorrectionsSELFHelper] Emitting checkUndo metric %s");
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {
    }
    static CorrectionsSELFHelper.emit(_:)((uint64_t)v8);
  }
  else
  {
    if (one-time initialization token for instrumentation != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Logger.instrumentation);
    oslog = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v19 = 0;
      _os_log_impl(&dword_1C9DB7000, oslog, v18, "[CorrectionsSELFHelper] checkUndo failed to be emitted", v19, 2u);
      OUTLINED_FUNCTION_1_2();
    }
  }
}

void CorrectionsSELFHelper.emitSetUndo(correctionsDirectInvocation:context:)()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v1 = *((void *)v0 + 2);
  long long v24 = *v0;
  uint64_t v25 = v1;
  long long v3 = v2[1];
  v23[0] = *v2;
  v23[1] = v3;
  long long v4 = v2[3];
  v23[2] = v2[2];
  v23[3] = v4;
  uint64_t v6 = (*(uint64_t (**)(long long *, _OWORD *))(v5 + 160))(&v24, v23);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    if (one-time initialization token for instrumentation != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    uint64_t v9 = (_DWORD *)__swift_project_value_buffer(v8, (uint64_t)static Logger.instrumentation);
    id v10 = v7;
    id v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      swift_slowAlloc();
      *(void *)&v23[0] = OUTLINED_FUNCTION_7_0();
      *uint64_t v9 = 136315138;
      id v13 = v10;
      id v14 = objc_msgSend(v13, sel_description);
      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v17 = v16;

      *(void *)&long long v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v17, (uint64_t *)v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_5_2(&dword_1C9DB7000, v11, v18, "[CorrectionsSELFHelper] Emitting undoSet metric %s");
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {
    }
    static CorrectionsSELFHelper.emit(_:)((uint64_t)v10);
  }
  else
  {
    if (one-time initialization token for instrumentation != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    __swift_project_value_buffer(v19, (uint64_t)static Logger.instrumentation);
    oslog = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1C9DB7000, oslog, v20, "[CorrectionsSELFHelper] setUndo failed to be emitted", v21, 2u);
      OUTLINED_FUNCTION_1_2();
    }
  }
}

void *CorrectionsSELFHelper.buildSetUndo(correctionsDirectInvocation:context:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  long long v3 = CorrectionsSELFHelper.makeClientEventWrapper(context:)();
  if (v3)
  {
    long long v4 = v3;
    uint64_t v5 = closure #1 in CorrectionsSELFHelper.buildSetUndo(correctionsDirectInvocation:context:)(v3, v2, v1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return v5;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
}

void *closure #1 in CorrectionsSELFHelper.buildSetUndo(correctionsDirectInvocation:context:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1218]), sel_init);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1208]), sel_init);
    if (v8)
    {
      uint64_t v9 = v8;
      outlined bridged method (mbgnn) of @objc SCSchemaSCSetUndoArgs.directInvocationId.setter(a2, a3, v8);
      objc_msgSend(v7, sel_setSetUndoArgs_, v9);
      objc_msgSend(a1, sel_setUndoSet_, v7);

      id v10 = a1;
      return a1;
    }
  }
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.instrumentation);
  os_log_type_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_1C9DB7000, v12, v13, "[CorrectionsSELFHelper] setUndo failed to be emitted", v14, 2u);
    MEMORY[0x1CB78F000](v14, -1, -1);
  }

  return 0;
}

void *CorrectionsSELFHelper.buildCheckUndo(undoType:undoReason:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = CorrectionsSELFHelper.makeClientEventWrapper(context:)();
  if (result)
  {
    uint64_t v5 = result;
    id v6 = closure #1 in CorrectionsSELFHelper.buildCheckUndo(undoType:undoReason:context:)(result, a1, a2);

    return v6;
  }
  return result;
}

void *closure #1 in CorrectionsSELFHelper.buildCheckUndo(undoType:undoReason:context:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA11F0]), sel_init);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1210]), sel_init);
    if (v8)
    {
      uint64_t v9 = v8;
      objc_msgSend(v7, sel_setUndoType_, a2);
      objc_msgSend(v7, sel_setReason_, a3);
      objc_msgSend(v9, sel_setCheckUndoResponse_, v7);
      objc_msgSend(a1, sel_setUndoChecked_, v9);

      id v10 = a1;
      return a1;
    }
  }
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.instrumentation);
  os_log_type_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_1C9DB7000, v12, v13, "[CorrectionsSELFHelper] checkUndo failed to be emitted", v14, 2u);
    MEMORY[0x1CB78F000](v14, -1, -1);
  }

  return 0;
}

void CorrectionsSELFHelper.makeCorrectionsIdAndEmitRequestLink(executionUUID:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v150 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v4 - 8, v5);
  OUTLINED_FUNCTION_17();
  v146 = (void (*)(void, void, void))(v7 - v6);
  uint64_t v8 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  uint64_t v13 = MEMORY[0x1F4188790](v11, v12);
  uint64_t v15 = &v133[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v13, v16);
  OUTLINED_FUNCTION_16();
  uint64_t v143 = v17;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v18, v19);
  OUTLINED_FUNCTION_16();
  uint64_t v141 = v20;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v21, v22);
  OUTLINED_FUNCTION_16();
  uint64_t v142 = v23;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v24, v25);
  OUTLINED_FUNCTION_16();
  v140 = v26;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v27, v28);
  OUTLINED_FUNCTION_16();
  uint64_t v145 = v29;
  OUTLINED_FUNCTION_19();
  uint64_t v32 = MEMORY[0x1F4188790](v30, v31);
  MEMORY[0x1F4188790](v32, v33);
  char v35 = &v133[-v34];
  uint64_t v36 = v10 + 16;
  v37 = *(void (**)(void))(v10 + 16);
  OUTLINED_FUNCTION_2_2();
  v37();
  v147 = v35;
  uint64_t v139 = v2;
  CorrectionsSELFHelper.executionRequestId.setter((uint64_t)v35);
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v38 = type metadata accessor for Logger();
  uint64_t v39 = __swift_project_value_buffer(v38, (uint64_t)static Logger.instrumentation);
  uint64_t v153 = a1;
  OUTLINED_FUNCTION_2_2();
  v37();
  uint64_t v151 = v39;
  uint64_t v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    v148 = v37;
    v155[0] = v43;
    *(_DWORD *)uint64_t v42 = 136315394;
    v138 = v15;
    v44 = @"COMPONENTNAME_SIRI_CORRECTIONS";
    uint64_t v45 = @"COMPONENTNAME_SIRI_CORRECTIONS";
    uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v149 = v10;
    uint64_t v47 = v8;
    uint64_t v48 = v46;
    uint64_t v144 = v36;
    unint64_t v50 = v49;

    uint64_t v154 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v50, v155);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 12) = 2080;
    uint64_t v51 = UUID.uuidString.getter();
    uint64_t v154 = OUTLINED_FUNCTION_14(v51, v52);
    uint64_t v8 = v47;
    uint64_t v10 = v149;
    uint64_t v36 = v144;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v53 = OUTLINED_FUNCTION_13();
    v54(v53);
    _os_log_impl(&dword_1C9DB7000, v40, v41, "[CorrectionsSELFHelper] Deriving identifier for: %s and execution ID: %s", (uint8_t *)v42, 0x16u);
    uint64_t v15 = v138;
    swift_arrayDestroy();
    v37 = v148;
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();
  }
  else
  {
    uint64_t v55 = OUTLINED_FUNCTION_13();
    v56(v55);
  }

  v57 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA12F8]), sel_init);
  if (!v57) {
    goto LABEL_19;
  }
  uint64_t v40 = v57;
  v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1308]), sel_init);
  if (!v58)
  {
    v59 = v40;
LABEL_18:

LABEL_19:
    OUTLINED_FUNCTION_2_2();
    v37();
    v97 = Logger.logObject.getter();
    os_log_type_t v98 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_18(v98))
    {
      OUTLINED_FUNCTION_11();
      v155[0] = OUTLINED_FUNCTION_7_0();
      LODWORD(v40->isa) = 136315138;
      uint64_t v99 = UUID.uuidString.getter();
      uint64_t v101 = OUTLINED_FUNCTION_14(v99, v100);
      OUTLINED_FUNCTION_12(v101);
      swift_bridgeObjectRelease();
      v152(v15, v8);
      OUTLINED_FUNCTION_5_2(&dword_1C9DB7000, v97, v102, "[CorrectionsSELFHelper] Unable to create RequestLink schemas for SELF for execution ID: %s. Will create an unlinked UUID.");
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {
      OUTLINED_FUNCTION_15();
      v103();
    }

    UUID.init()();
    return;
  }
  v59 = v58;
  id v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1308]), sel_init);
  if (!v60)
  {

    goto LABEL_18;
  }
  v61 = v60;
  uint64_t v149 = v10;
  unint64_t v62 = type metadata accessor for SISchemaUUID();
  v63 = v40;
  uint64_t v64 = (uint64_t)v147;
  v148 = v37;
  OUTLINED_FUNCTION_3_2();
  v37();
  unint64_t v136 = v62;
  id v65 = SISchemaUUID.__allocating_init(nsuuid:)(v64);
  objc_msgSend(v61, sel_setUuid_, v65);

  if (AFDeviceSupportsSAE()) {
    uint64_t v66 = 43;
  }
  else {
    uint64_t v66 = 1;
  }
  objc_msgSend(v61, sel_setComponent_, v66);
  [v59 setComponent:31];
  [v63 setSource:v59];
  v137 = v63;
  [v63 setTarget:v61];
  v67 = self;
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v69 = objc_msgSend(v67, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, 31, isa);

  v138 = v59;
  if (v69)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v71 = v149 + 32;
    v70 = *(void (**)(void, uint64_t, uint64_t))(v149 + 32);
    v72 = v146;
    v70(v146, v64, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v72, 0, 1, v8);
    if (__swift_getEnumTagSinglePayload((uint64_t)v72, 1, v8) != 1)
    {
      v146 = v70;
      v70(v145, (uint64_t)v72, v8);
      v73 = v140;
      v74 = v148;
      OUTLINED_FUNCTION_3_2();
      v74();
      uint64_t v75 = v142;
      uint64_t v144 = v36;
      OUTLINED_FUNCTION_3_2();
      v74();
      v76 = Logger.logObject.getter();
      os_log_type_t v77 = static os_log_type_t.debug.getter();
      int v78 = v77;
      BOOL v79 = os_log_type_enabled(v76, v77);
      uint64_t v135 = v71;
      if (v79)
      {
        uint64_t v80 = (uint64_t)v73;
        uint64_t v81 = swift_slowAlloc();
        uint64_t v143 = swift_slowAlloc();
        v155[0] = v143;
        *(_DWORD *)uint64_t v81 = 136315650;
        int v134 = v78;
        uint64_t v153 = v8;
        v82 = @"COMPONENTNAME_SIRI_CORRECTIONS";
        v83 = @"COMPONENTNAME_SIRI_CORRECTIONS";
        uint64_t v84 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v86 = v85;

        uint64_t v154 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v84, v86, v155);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v81 + 12) = 2080;
        uint64_t v87 = UUID.uuidString.getter();
        uint64_t v89 = OUTLINED_FUNCTION_14(v87, v88);
        OUTLINED_FUNCTION_20(v89);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v90 = v80;
        v91 = (void (*)(uint64_t, uint64_t))v152;
        v152(v90, v153);
        *(_WORD *)(v81 + 22) = 2080;
        v140 = v61;
        v92 = v76;
        uint64_t v93 = v142;
        uint64_t v94 = UUID.uuidString.getter();
        uint64_t v96 = OUTLINED_FUNCTION_14(v94, v95);
        OUTLINED_FUNCTION_20(v96);
        uint64_t v8 = v153;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v91(v93, v8);
        _os_log_impl(&dword_1C9DB7000, v92, (os_log_type_t)v134, "[CorrectionsSELFHelper] Emitting request link: %s/%s to ORCH:%s", (uint8_t *)v81, 0x20u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_1_2();

        v61 = v140;
      }
      else
      {
        v115 = v73;
        v116 = (void (*)(uint64_t, uint64_t))v152;
        v152(v115, v8);
        v116(v75, v8);
      }
      uint64_t v117 = (uint64_t)v147;
      v118 = v148;
      OUTLINED_FUNCTION_2_2();
      v118();
      id v119 = SISchemaUUID.__allocating_init(nsuuid:)(v117);
      [v138 setUuid:v119];

      id v120 = objc_msgSend(v67, sel_sharedStream);
      objc_msgSend(v120, sel_emitMessage_, v137);
      swift_unknownObjectRelease();
      uint64_t v121 = v141;
      OUTLINED_FUNCTION_2_2();
      v118();
      v122 = Logger.logObject.getter();
      os_log_type_t v123 = static os_log_type_t.debug.getter();
      if (OUTLINED_FUNCTION_18(v123))
      {
        OUTLINED_FUNCTION_11();
        v155[0] = OUTLINED_FUNCTION_7_0();
        OUTLINED_FUNCTION_21(4.8149e-34);
        lazy protocol witness table accessor for type UUID and conformance UUID();
        uint64_t v124 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v154 = OUTLINED_FUNCTION_14(v124, v125);
        uint64_t v8 = v121;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        uint64_t v126 = OUTLINED_FUNCTION_10();
        v127(v126);
        OUTLINED_FUNCTION_5_2(&dword_1C9DB7000, v122, v128, "[CorrectionsSELFHelper] Emitted request link SELF logging Corrections ID: %s");
        OUTLINED_FUNCTION_6_1();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_1_2();
      }
      else
      {
        OUTLINED_FUNCTION_15();
        v129();
      }

      uint64_t v130 = (uint64_t)v147;
      uint64_t v131 = v145;
      OUTLINED_FUNCTION_2_2();
      v132();
      CorrectionsSELFHelper.correctionsId.setter(v130);

      v146(v150, v131, v8);
      return;
    }
  }
  else
  {
    v72 = v146;
    __swift_storeEnumTagSinglePayload((uint64_t)v146, 1, 1, v8);
  }
  outlined destroy of UUID?((uint64_t)v72);
  OUTLINED_FUNCTION_3_2();
  v104();
  v105 = Logger.logObject.getter();
  os_log_type_t v106 = static os_log_type_t.error.getter();
  if (OUTLINED_FUNCTION_18(v106))
  {
    OUTLINED_FUNCTION_11();
    v155[0] = OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_21(4.8149e-34);
    uint64_t v107 = UUID.uuidString.getter();
    uint64_t v109 = OUTLINED_FUNCTION_14(v107, v108);
    OUTLINED_FUNCTION_12(v109);
    swift_bridgeObjectRelease();
    uint64_t v110 = OUTLINED_FUNCTION_10();
    v111(v110);
    OUTLINED_FUNCTION_5_2(&dword_1C9DB7000, v105, v112, "[CorrectionsSELFHelper] Failed to create a derived identifier for SELF for execution ID: %s. Will create a random UUID.");
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();
  }
  else
  {
    OUTLINED_FUNCTION_15();
    v113();
  }

  v114 = v137;
  UUID.init()();
}

id SISchemaUUID.__allocating_init(nsuuid:)(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v4 = objc_msgSend(v2, sel_initWithNSUUID_, isa);

  uint64_t v5 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void *CorrectionsSELFHelper.makeClientEventWrapper(context:)()
{
  uint64_t v1 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v2, v3);
  OUTLINED_FUNCTION_17();
  uint64_t v6 = v5 - v4;
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA11F8]), sel_init);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1200]), sel_init);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = AFDeviceSupportsSAE();
      type metadata accessor for SISchemaUUID();
      swift_beginAccess();
      uint64_t v12 = OUTLINED_FUNCTION_8();
      ((void (*)(uint64_t))v11)(v12);
      if (v11) {
        uint64_t v13 = &selRef_setSubRequestId_;
      }
      else {
        uint64_t v13 = &selRef_setRequestId_;
      }
      id v18 = SISchemaUUID.__allocating_init(nsuuid:)(v6);
      objc_msgSend(v10, *v13, v18);

      type metadata accessor for SISchemaUUID();
      uint64_t v19 = v0 + OBJC_IVAR____TtC15SiriCorrections21CorrectionsSELFHelper_correctionsId;
      swift_beginAccess();
      ((void (*)(uint64_t, uint64_t, uint64_t))v11)(v6, v19, v1);
      id v20 = SISchemaUUID.__allocating_init(nsuuid:)(v6);
      objc_msgSend(v10, sel_setScId_, v20);

      objc_msgSend(v8, sel_setEventMetadata_, v10);
      return v8;
    }
  }
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  __swift_project_value_buffer(v14, (uint64_t)static Logger.instrumentation);
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_1C9DB7000, v15, v16, "[CorrectionsSELFHelper] Failed to create base SELF objects", v17, 2u);
    OUTLINED_FUNCTION_1_2();
  }

  return 0;
}

uint64_t CorrectionsSELFHelper.deinit()
{
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_22();
  uint64_t v2 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_9();
  v2();
  OUTLINED_FUNCTION_9();
  v2();
  return v0;
}

uint64_t CorrectionsSELFHelper.__deallocating_deinit()
{
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_22();
  uint64_t v2 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_9();
  v2();
  OUTLINED_FUNCTION_9();
  v2();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t CorrectionsSELFHelper.init()()
{
  UUID.init()();
  UUID.init()();
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
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
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
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
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
    return MEMORY[0x1E4FBC860];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x1E4FBC860];
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
    return (void *)MEMORY[0x1E4FBC860];
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
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ModifiedNode>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CorrectionCandidateTask>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CorrectionOperation>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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

unint64_t type metadata accessor for SISchemaUUID()
{
  unint64_t result = lazy cache variable for type metadata for SISchemaUUID;
  if (!lazy cache variable for type metadata for SISchemaUUID)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SISchemaUUID);
  }
  return result;
}

uint64_t outlined destroy of UUID?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t ObjC metadata update function for CorrectionsSELFHelper()
{
  return type metadata accessor for CorrectionsSELFHelper();
}

uint64_t type metadata accessor for CorrectionsSELFHelper()
{
  uint64_t result = type metadata singleton initialization cache for CorrectionsSELFHelper;
  if (!type metadata singleton initialization cache for CorrectionsSELFHelper) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for CorrectionsSELFHelper()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CorrectionsSELFHelper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CorrectionsSELFHelper);
}

uint64_t dispatch thunk of CorrectionsSELFHelper.emitCheckUndo(undoType:undoReason:context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.emitSetUndo(correctionsDirectInvocation:context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.buildSetUndo(correctionsDirectInvocation:context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.buildCheckUndo(undoType:undoReason:context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.makeCorrectionsIdAndEmitRequestLink(executionUUID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

void outlined bridged method (mbgnn) of @objc SCSchemaSCSetUndoArgs.directInvocationId.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)MEMORY[0x1CB78E810]();
  objc_msgSend(a3, sel_setDirectInvocationId_, v4);
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void OUTLINED_FUNCTION_1_2()
{
  JUMPOUT(0x1CB78F000);
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t result = v1;
  *(void *)(v2 - 120) = *(void *)(v0 + 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1, unint64_t a2)
{
  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)(v2 - 96));
}

BOOL OUTLINED_FUNCTION_18(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

void OUTLINED_FUNCTION_21(float a1)
{
  float *v1 = a1;
}

BOOL specialized == infix<A>(_:_:)(int a1, int a2)
{
  return a1 == a2;
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  char v2 = a2 & 1;
  uint64_t v3 = Logger.Category.rawValue.getter(a1 & 1);
  uint64_t v5 = v4;
  if (v3 == Logger.Category.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void one-time initialization function for correctIntoString()
{
  static CorrectionsConstants.correctIntoString = 0x5474636572726F63;
  *(void *)algn_1EA5C60B8 = 0xE90000000000006FLL;
}

void one-time initialization function for updateVerbString()
{
  static CorrectionsConstants.updateVerbString = 0x657461647075;
  *(void *)algn_1EA5C60C8 = 0xE600000000000000;
}

uint64_t one-time initialization function for attributeDenyList()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_1C9DD0160;
  strcpy((char *)(result + 32), "usoQuantifier");
  *(_WORD *)(result + 46) = -4864;
  *(void *)(result + 48) = 0xD000000000000010;
  *(void *)(result + 56) = 0x80000001C9DD0960;
  static CorrectionsConstants.attributeDenyList = (_UNKNOWN *)result;
  return result;
}

uint64_t one-time initialization function for operatorStrings()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_1C9DD0170;
  *(void *)(result + 32) = 0x7465536F54646461;
  *(void *)(result + 40) = 0xE800000000000000;
  *(void *)(result + 48) = 0x6C61566F54646461;
  *(void *)(result + 56) = 0xEA00000000006575;
  *(void *)(result + 64) = 0x6E6769737361;
  *(void *)(result + 72) = 0xE600000000000000;
  strcpy((char *)(result + 80), "removeFromSet");
  *(_WORD *)(result + 94) = -4864;
  *(void *)(result + 96) = 0x724665766F6D6572;
  *(void *)(result + 104) = 0xEF65756C61566D6FLL;
  *(void *)(result + 112) = 0x6563616C706572;
  *(void *)(result + 120) = 0xE700000000000000;
  *(void *)(result + 128) = 0x646E65707061;
  *(void *)(result + 136) = 0xE600000000000000;
  *(void *)(result + 144) = 0x6574656C6564;
  *(void *)(result + 152) = 0xE600000000000000;
  static CorrectionsConstants.operatorStrings = (_UNKNOWN *)result;
  return result;
}

double one-time initialization function for deleteVerbStrings()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 3;
  *(_OWORD *)(v0 + 16) = xmmword_1C9DD0180;
  *(void *)(v0 + 32) = 0x6574656C6564;
  *(void *)(v0 + 40) = 0xE600000000000000;
  *(void *)(v0 + 48) = 1886352499;
  *(void *)(v0 + 56) = 0xE400000000000000;
  *(void *)(v0 + 64) = 0x656C6261736964;
  *(void *)(v0 + 72) = 0xE700000000000000;
  static CorrectionsConstants.deleteVerbStrings = v0;
  return result;
}

void *one-time initialization function for rrUtils()
{
  type metadata accessor for ReferenceResolutionUtils();
  double result = (void *)swift_allocObject();
  static CorrectionsEngine.rrUtils = result;
  return result;
}

void one-time initialization function for inverseDirectInvocation()
{
  static CorrectionsEngine.inverseDirectInvocation = 0;
  qword_1EBC69B90 = 0;
  qword_1EBC69B98 = 0;
}

uint64_t *CorrectionsEngine.inverseDirectInvocation.unsafeMutableAddressor()
{
  if (one-time initialization token for inverseDirectInvocation != -1) {
    swift_once();
  }
  return &static CorrectionsEngine.inverseDirectInvocation;
}

uint64_t static CorrectionsEngine.inverseDirectInvocation.getter@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for inverseDirectInvocation != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_19_0();
  uint64_t v2 = static CorrectionsEngine.inverseDirectInvocation;
  uint64_t v3 = qword_1EBC69B90;
  uint64_t v4 = qword_1EBC69B98;
  *a1 = static CorrectionsEngine.inverseDirectInvocation;
  a1[1] = v3;
  a1[2] = v4;
  return outlined copy of CorrectionsDirectInvocation?(v2, v3);
}

uint64_t outlined copy of CorrectionsDirectInvocation?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t one-time initialization function for parseStoredTime()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  __swift_allocate_value_buffer(v0, static CorrectionsEngine.parseStoredTime);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)static CorrectionsEngine.parseStoredTime);
  uint64_t v2 = type metadata accessor for Date();
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
}

double one-time initialization function for context()
{
  uint64_t v0 = (_OWORD *)swift_slowAlloc();
  static CorrectionsEngine.context = (uint64_t)v0;
  double result = 0.0;
  *uint64_t v0 = xmmword_1C9DD0190;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  return result;
}

uint64_t CorrectionsEngine.context.unsafeMutableAddressor()
{
  if (one-time initialization token for context != -1) {
    swift_once();
  }
  return static CorrectionsEngine.context;
}

uint64_t static CorrectionsEngine.context.getter@<X0>(uint64_t *a1@<X8>)
{
  if (one-time initialization token for context != -1) {
    swift_once();
  }
  uint64_t v2 = (uint64_t *)static CorrectionsEngine.context;
  OUTLINED_FUNCTION_19_0();
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v9 = v2[6];
  uint64_t v10 = v2[7];
  *a1 = *v2;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  return outlined copy of CorrectionsContext?(v3, v4);
}

uint64_t outlined copy of CorrectionsContext?(uint64_t a1, uint64_t a2)
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

uint64_t CorrectionsEngine.undoFollowUpPluginActionUserDataKey.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

uint64_t static CorrectionsEngine.setReferenceResolver(to:)(void *a1)
{
  if (one-time initialization token for rrUtils != -1) {
    swift_once();
  }
  static CorrectionsEngine.rrUtils = a1;
  swift_retain();
  return swift_release();
}

uint64_t static CorrectionsEngine.shared()()
{
  type metadata accessor for CorrectionsEngine();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for CorrectionsEngine()
{
  return self;
}

uint64_t CorrectionsEngine.checkCorrection(input:)(uint64_t a1)
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  (*(void (**)(uint64_t, _OWORD *))(*(void *)v1 + 112))(a1, v3);
  return outlined destroy of CorrectionsCustomizing?((uint64_t)v3, &demangling cache variable for type metadata for CorrectionsCustomizing?);
}

void CorrectionsEngine.checkCorrection(input:customizations:)()
{
  OUTLINED_FUNCTION_37();
  unint64_t v1 = v0;
  uint64_t v168 = v2;
  uint64_t v181 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5, v6);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_14_0(v7);
  uint64_t v180 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  OUTLINED_FUNCTION_0();
  unint64_t v9 = v8;
  MEMORY[0x1F4188790](v10, v11);
  OUTLINED_FUNCTION_5_3();
  uint64_t v179 = v12;
  uint64_t v184 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  OUTLINED_FUNCTION_0();
  uint64_t v188 = v13;
  uint64_t v16 = MEMORY[0x1F4188790](v14, v15);
  unint64_t v18 = (unint64_t)v167 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16, v19);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v20, v21);
  int64_t v23 = (int64_t)v167 - v22;
  v167[2] = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_0();
  v167[1] = v24;
  MEMORY[0x1F4188790](v25, v26);
  OUTLINED_FUNCTION_17();
  uint64_t v29 = v28 - v27;
  if (one-time initialization token for log != -1) {
    goto LABEL_288;
  }
  while (1)
  {
    id v30 = (id)static Logger.log;
    OSSignpostID.init(log:)();
    static os_signpost_type_t.begin.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    uint64_t v31 = MEMORY[0x1E4FBC860];
    uint64_t v202 = MEMORY[0x1E4FBC860];
    outlined init with copy of CorrectionsCustomizing?(v1, (uint64_t)&v195, &demangling cache variable for type metadata for CorrectionsCustomizing?);
    if (v197)
    {
      uint64_t v32 = outlined init with take of CorrectionsCustomizing(&v195, (uint64_t)v199);
    }
    else
    {
      v200 = &type metadata for CorrectionsCustomizationsAllowingAllEntities;
      v201 = (uint8_t *)&protocol witness table for CorrectionsCustomizationsAllowingAllEntities;
      v199[0] = MEMORY[0x1E4FBC870];
      v199[1] = MEMORY[0x1E4FBC870];
      uint64_t v32 = outlined destroy of CorrectionsCustomizing?((uint64_t)&v195, &demangling cache variable for type metadata for CorrectionsCustomizing?);
    }
    uint64_t v33 = MEMORY[0x1CB78E470](v32);
    uint64_t v34 = *(void *)(v33 + 16);
    uint64_t v177 = v29;
    uint64_t v187 = v34;
    if (v34) {
      break;
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_44(v31);
    if (!v59) {
      goto LABEL_259;
    }
    uint64_t v174 = 0;
    uint64_t v57 = v31;
LABEL_47:
    unint64_t v9 = 0xED00007465536D6FLL;
    uint64_t v194 = v31;
    uint64_t v170 = v57 + 32;
    v167[0] = v57;
    swift_bridgeObjectRetain();
    unint64_t v60 = 0;
    while (1)
    {
      if (v60 >= *v171) {
        goto LABEL_287;
      }
      unint64_t v173 = v60;
      v61 = (int64_t *)(v170 + 32 * v60);
      int64_t v23 = *v61;
      int64_t v172 = v61[1];
      unint64_t v1 = v61[2];
      uint64_t v4 = v61[3];
      v193 = (char *)v31;
      uint64_t v62 = *(void *)(v4 + 16);
      unint64_t v176 = v1;
      uint64_t v181 = v62;
      if (v62) {
        break;
      }
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      LODWORD(v175) = 0;
LABEL_234:
      if (one-time initialization token for updateVerbString != -1) {
        swift_once();
      }
      if (v172 == static CorrectionsConstants.updateVerbString && v176 == *(void *)algn_1EA5C60C8)
      {
        unint64_t v1 = (unint64_t)v193;
LABEL_243:
        if (!((*(void *)(v1 + 16) != 0) | v175 & 1))
        {
          unint64_t v136 = v200;
          v137 = v201;
          unsigned __int8 v138 = __swift_project_boxed_opaque_existential_1(v199, (uint64_t)v200);
          uint64_t v139 = v136;
          os_log_type_t v140 = v138;
          if (CorrectionsCustomizing.shouldCheckEntityForCorrections(entity:)(v23, v139, v137))
          {
            if (one-time initialization token for logger != -1) {
              swift_once();
            }
            uint64_t v141 = type metadata accessor for Logger();
            uint64_t v142 = OUTLINED_FUNCTION_9_0(v141, (uint64_t)static Logger.logger);
            os_log_type_t v143 = static os_log_type_t.debug.getter();
            if (OUTLINED_FUNCTION_4_3(v143))
            {
              uint64_t v144 = (_WORD *)OUTLINED_FUNCTION_7_1();
              OUTLINED_FUNCTION_13_0(v144);
              _os_log_impl(&dword_1C9DB7000, v142, v140, "[CorrectionsEngine.checkCorrection] returning underspecified correction type due to UPDATE verb.", v137, 2u);
              OUTLINED_FUNCTION_6_2();
            }

            type metadata accessor for CorrectionsEngine();
            uint64_t v145 = static CorrectionsEngine.getCorrectedEntitiesFromSRR(correctionCandidateTaskEntity:attributePath:)(v23, 0, 0xE000000000000000);
            unint64_t v1 = (unint64_t)v193;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v1 = (unint64_t)OUTLINED_FUNCTION_49();
            }
            unint64_t v18 = *(void *)(v1 + 16);
            unint64_t v146 = *(void *)(v1 + 24);
            if (v18 >= v146 >> 1) {
              unint64_t v1 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v146 > 1), v18 + 1, 1, v1);
            }
            *(void *)(v1 + 16) = v18 + 1;
            unint64_t v147 = v1 + 40 * v18;
            *(void *)(v147 + 32) = 0;
            *(void *)(v147 + 40) = 0xE000000000000000;
            *(void *)(v147 + 48) = v145;
            *(void *)(v147 + 56) = 0;
            *(unsigned char *)(v147 + 64) = 3;
            v193 = (char *)v1;
          }
        }
        goto LABEL_254;
      }
      char v135 = _stringCompareWithSmolCheck(_:_:expecting:)();
      unint64_t v1 = (unint64_t)v193;
      if (v135) {
        goto LABEL_243;
      }
LABEL_254:
      unint64_t v148 = v173 + 1;
      uint64_t v149 = swift_bridgeObjectRetain();
      specialized Array.append<A>(contentsOf:)(v149);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      unint64_t v60 = v148;
      if (v148 == v169)
      {
LABEL_270:
        swift_bridgeObjectRelease();
        uint64_t v150 = v194;
        goto LABEL_271;
      }
    }
    uint64_t v180 = v4 + 32;
    swift_bridgeObjectRetain_n();
    swift_retain();
    swift_bridgeObjectRetain();
    int v63 = 0;
    unint64_t v64 = 0;
    int64_t v178 = v23;
    uint64_t v179 = v4;
    while (1)
    {
      LODWORD(v175) = v63;
LABEL_52:
      if (v64 >= *(void *)(v4 + 16)) {
        goto LABEL_286;
      }
      id v65 = (unint64_t *)(v180 + 24 * v64);
      unint64_t v18 = *v65;
      uint64_t v66 = (void *)v65[1];
      uint64_t v4 = v65[2];
      uint64_t v182 = v64 + 1;
      unint64_t v1 = (unint64_t)v200;
      __swift_project_boxed_opaque_existential_1(v199, (uint64_t)v200);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      *(void *)&long long v183 = v18;
      v67._uint64_t countAndFlagsBits = v18;
      *((void *)&v183 + 1) = v66;
      v67._uint64_t object = v66;
      if (CorrectionsCustomizing.shouldAllowAttributeToBeCorrected(attribute:)(v67)) {
        break;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v63 = 1;
      unint64_t v64 = v182;
      int64_t v23 = v178;
      uint64_t v4 = v179;
      if (v182 == v181)
      {
        swift_bridgeObjectRelease();
        LODWORD(v175) = 1;
        goto LABEL_234;
      }
    }
    unint64_t v191 = v31;
    unint64_t v192 = v31;
    uint64_t v68 = *(void *)(v4 + 64);
    uint64_t v188 = v4 + 64;
    uint64_t v69 = 1 << *(unsigned char *)(v4 + 32);
    if (v69 < 64) {
      uint64_t v70 = ~(-1 << v69);
    }
    else {
      uint64_t v70 = -1;
    }
    unint64_t v71 = v70 & v68;
    int64_t v189 = (unint64_t)(v69 + 63) >> 6;
    swift_bridgeObjectRetain();
    LODWORD(v184) = 0;
    LODWORD(v187) = 0;
    uint64_t v72 = 0;
    int64_t v73 = 0;
    int64_t v23 = 0xEA00000000006575;
    uint64_t v185 = v4;
    while (2)
    {
      while (2)
      {
        if (v71)
        {
          v190 = (void (**)(void))((v71 - 1) & v71);
          unint64_t v74 = __clz(__rbit64(v71)) | (v73 << 6);
        }
        else
        {
          BOOL v75 = __OFADD__(v73++, 1);
          if (v75)
          {
            __break(1u);
            goto LABEL_259;
          }
          if (v73 >= v189)
          {
LABEL_209:
            swift_release();
            uint64_t v29 = v177;
            uint64_t v31 = MEMORY[0x1E4FBC860];
            unint64_t v1 = v192;
            int64_t v23 = v178;
            if (v192 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v133 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
              if (!v133)
              {
LABEL_211:
                swift_bridgeObjectRelease();
                type metadata accessor for CorrectionsEngine();
                unint64_t v1 = static CorrectionsEngine.getCorrectedEntitiesFromSRR(correctionCandidateTaskEntity:attributePath:)(v23, v183, *((unint64_t *)&v183 + 1));
                unint64_t v192 = v1;
              }
            }
            else if (!*(void *)((v192 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              goto LABEL_211;
            }
            if ((v72 & v187 | v184))
            {
              unint64_t v125 = v191;
              swift_bridgeObjectRelease();
              long long v195 = v183;
              unint64_t v196 = v1;
              unint64_t v197 = v125;
              char v198 = 2;
              specialized Array.replaceSubrange<A>(_:with:)(0, 0, (uint64_t)&v195);
            }
            else if (v72)
            {
              swift_bridgeObjectRelease();
              unint64_t v126 = v191;
              swift_bridgeObjectRelease();
              unint64_t v1 = (unint64_t)v193;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                unint64_t v1 = (unint64_t)OUTLINED_FUNCTION_49();
              }
              unint64_t v18 = *(void *)(v1 + 16);
              unint64_t v127 = *(void *)(v1 + 24);
              if (v18 >= v127 >> 1) {
                unint64_t v1 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v127 > 1), v18 + 1, 1, v1);
              }
              *(void *)(v1 + 16) = v18 + 1;
              OUTLINED_FUNCTION_51(v1 + 40 * v18);
              *(void *)(v128 + 48) = v126;
              *(void *)(v128 + 56) = 0;
              *(unsigned char *)(v128 + 64) = 0;
              v193 = (char *)v1;
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v187)
              {
                v129 = v193;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  v129 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v129 + 2) + 1, 1, (uint64_t)v129);
                }
                unint64_t v131 = *((void *)v129 + 2);
                unint64_t v130 = *((void *)v129 + 3);
                if (v131 >= v130 >> 1) {
                  v129 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v130 > 1), v131 + 1, 1, (uint64_t)v129);
                }
                *((void *)v129 + 2) = v131 + 1;
                OUTLINED_FUNCTION_51((uint64_t)&v129[40 * v131]);
                *(void *)(v132 + 48) = v1;
                *(void *)(v132 + 56) = 0;
                *(unsigned char *)(v132 + 64) = 1;
                v193 = v129;
              }
              else
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
            }
            uint64_t v4 = v179;
            unint64_t v64 = v182;
            if (v182 == v181)
            {
              swift_bridgeObjectRelease();
              goto LABEL_234;
            }
            goto LABEL_52;
          }
          unint64_t v76 = *(void *)(v188 + 8 * v73);
          if (!v76)
          {
            OUTLINED_FUNCTION_43();
            if (v77 == v75) {
              goto LABEL_209;
            }
            OUTLINED_FUNCTION_45();
            if (!v76)
            {
              OUTLINED_FUNCTION_43();
              if (v77 == v75) {
                goto LABEL_209;
              }
              OUTLINED_FUNCTION_45();
              if (!v76)
              {
                OUTLINED_FUNCTION_43();
                if (v77 == v75) {
                  goto LABEL_209;
                }
                OUTLINED_FUNCTION_45();
                if (!v76)
                {
                  while (1)
                  {
                    int64_t v73 = v78 + 1;
                    if (__OFADD__(v78, 1)) {
                      break;
                    }
                    if (v73 >= v189) {
                      goto LABEL_209;
                    }
                    unint64_t v76 = *(void *)(v188 + 8 * v73);
                    ++v78;
                    if (v76) {
                      goto LABEL_73;
                    }
                  }
LABEL_267:
                  __break(1u);
LABEL_268:
                  __break(1u);
LABEL_269:
                  __break(1u);
                  goto LABEL_270;
                }
              }
            }
            int64_t v73 = v78;
          }
LABEL_73:
          v190 = (void (**)(void))((v76 - 1) & v76);
          unint64_t v74 = __clz(__rbit64(v76)) + (v73 << 6);
        }
        BOOL v79 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v74);
        uint64_t v81 = *v79;
        uint64_t v80 = v79[1];
        unint64_t v1 = *(void *)(*(void *)(v4 + 56) + 8 * v74);
        BOOL v82 = *v79 == 0x7465536F54646461 && v80 == 0xE800000000000000;
        unint64_t v18 = v1 >> 62;
        if (!v82)
        {
          OUTLINED_FUNCTION_54();
          if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
            && (v81 != 0x6C61566F54646461 || v80 != 0xEA00000000006575))
          {
            OUTLINED_FUNCTION_54();
            if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
            {
              BOOL v84 = v81 == 0x646E65707061 && v80 == 0xE600000000000000;
              if (!v84 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
              {
                OUTLINED_FUNCTION_42();
                if (!v55 || v80 != v9)
                {
                  OUTLINED_FUNCTION_26();
                  _stringCompareWithSmolCheck(_:_:expecting:)();
                  OUTLINED_FUNCTION_42();
                  BOOL v87 = v55 && v80 == 0xEF65756C61566D6FLL;
                  BOOL v88 = v87;
                  if ((v86 & 1) == 0 && !v88)
                  {
                    OUTLINED_FUNCTION_26();
                    char v89 = _stringCompareWithSmolCheck(_:_:expecting:)();
                    BOOL v90 = v81 == 0x6574656C6564 && v80 == 0xE600000000000000;
                    BOOL v91 = v90;
                    if ((v89 & 1) == 0 && !v91 && (OUTLINED_FUNCTION_34() & 1) == 0)
                    {
                      unint64_t v18 = v72;
                      uint64_t v92 = one-time initialization token for correctIntoString;
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      if (v92 != -1) {
                        swift_once();
                      }
                      if (v81 == static CorrectionsConstants.correctIntoString && v80 == *(void *)algn_1EA5C60B8)
                      {
                        swift_bridgeObjectRelease();
                      }
                      else
                      {
                        char v94 = _stringCompareWithSmolCheck(_:_:expecting:)();
                        swift_bridgeObjectRelease();
                        if ((v94 & 1) == 0)
                        {
                          swift_bridgeObjectRelease();
LABEL_118:
                          unint64_t v71 = (unint64_t)v190;
                          uint64_t v72 = v18;
                          continue;
                        }
                      }
                      specialized Array.append<A>(contentsOf:)(v1);
                      LODWORD(v184) = 1;
                      goto LABEL_118;
                    }
                  }
                }
                if (v18)
                {
                  OUTLINED_FUNCTION_64();
                  uint64_t v102 = _CocoaArrayWrapper.endIndex.getter();
                  swift_bridgeObjectRelease();
                }
                else
                {
                  uint64_t v102 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
                  swift_bridgeObjectRetain();
                }
                LODWORD(v187) = v72;
                unint64_t v103 = v192;
                unint64_t v104 = v192 >> 62;
                if (v192 >> 62)
                {
                  swift_bridgeObjectRetain();
                  _CocoaArrayWrapper.endIndex.getter();
                  OUTLINED_FUNCTION_46();
                }
                else
                {
                  int64_t v23 = *(void *)((v192 & 0xFFFFFFFFFFFFFF8) + 0x10);
                }
                int64_t v105 = v23 + v102;
                if (__OFADD__(v23, v102)) {
                  goto LABEL_268;
                }
                uint64_t v106 = 0;
                if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                  || (v103 & 0x8000000000000000) != 0
                  || (v103 & 0x4000000000000000) != 0)
                {
LABEL_150:
                  if (v104)
                  {
                    OUTLINED_FUNCTION_40();
                    _CocoaArrayWrapper.endIndex.getter();
                    OUTLINED_FUNCTION_46();
                  }
                  else
                  {
                    int64_t v23 = *(void *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x10);
                  }
                  if (v23 > v105) {
                    int64_t v105 = v23;
                  }
                  swift_bridgeObjectRetain();
                  uint64_t v107 = MEMORY[0x1CB78E9D0](v106, v105, 1, v103);
                  swift_bridgeObjectRelease();
                  unint64_t v192 = v107;
                  int64_t v23 = v107 & 0xFFFFFFFFFFFFFF8;
                }
                else
                {
                  int64_t v23 = v103 & 0xFFFFFFFFFFFFFF8;
                  if (v105 > *(void *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  {
                    uint64_t v106 = 1;
                    goto LABEL_150;
                  }
                }
                uint64_t v108 = *(void *)(v23 + 16);
                unint64_t v9 = *(void *)(v23 + 24);
                if (v18)
                {
                  swift_bridgeObjectRetain();
                  uint64_t v29 = _CocoaArrayWrapper.endIndex.getter();
                  swift_bridgeObjectRelease();
                }
                else
                {
                  uint64_t v29 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
                }
                uint64_t v72 = v187;
                if (v29)
                {
                  if ((uint64_t)((v9 >> 1) - v108) < v102) {
                    goto LABEL_280;
                  }
                  unint64_t v117 = v23 + 8 * v108 + 32;
                  if (v18)
                  {
                    if (v29 < 1) {
                      goto LABEL_284;
                    }
                    unint64_t v186 = v102;
                    unint64_t v9 = lazy protocol witness table accessor for type [UsoEntity] and conformance [A]();
                    swift_bridgeObjectRetain();
                    uint64_t v4 = (uint64_t)&demangling cache variable for type metadata for [UsoEntity];
                    do
                    {
                      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoEntity]);
                      id v120 = OUTLINED_FUNCTION_47();
                      unint64_t v18 = *v121;
                      swift_retain();
                      uint64_t v122 = OUTLINED_FUNCTION_61();
                      v120((void *)v122);
                      OUTLINED_FUNCTION_60();
                    }
                    while (!v55);
                    swift_bridgeObjectRelease();
                    OUTLINED_FUNCTION_31();
                    uint64_t v72 = v187;
                    uint64_t v102 = v186;
                  }
                  else
                  {
                    if (v102 < 0) {
                      goto LABEL_289;
                    }
                    OUTLINED_FUNCTION_33();
                    BOOL v119 = v111 || v117 >= v118;
                    unint64_t v9 = 0xED00007465536D6FLL;
                    if (!v119) {
                      goto LABEL_289;
                    }
                    type metadata accessor for UsoEntity();
                    OUTLINED_FUNCTION_62();
                  }
                  int64_t v23 = 0xEA00000000006575;
                  if (v102 > 0)
                  {
                    uint64_t v123 = *(void *)((v192 & 0xFFFFFFFFFFFFFF8) + 0x10);
                    BOOL v75 = __OFADD__(v123, v102);
                    uint64_t v124 = v123 + v102;
                    if (v75) {
                      goto LABEL_283;
                    }
                    *(void *)((v192 & 0xFFFFFFFFFFFFFF8) + 0x10) = v124;
                  }
                }
                else
                {
                  unint64_t v9 = 0xED00007465536D6FLL;
                  int64_t v23 = 0xEA00000000006575;
                  if (v102 > 0) {
                    goto LABEL_269;
                  }
                }
                swift_bridgeObjectRelease();
                specialized Array._endMutation()();
                LODWORD(v187) = 1;
                unint64_t v71 = (unint64_t)v190;
                continue;
              }
            }
          }
        }
        break;
      }
      if (v18)
      {
        OUTLINED_FUNCTION_64();
        uint64_t v95 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v95 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
      }
      unint64_t v96 = v191;
      unint64_t v97 = v191 >> 62;
      if (v191 >> 62)
      {
        OUTLINED_FUNCTION_40();
        _CocoaArrayWrapper.endIndex.getter();
        OUTLINED_FUNCTION_46();
      }
      else
      {
        int64_t v23 = *(void *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      int64_t v98 = v23 + v95;
      if (__OFADD__(v23, v95))
      {
        __break(1u);
LABEL_265:
        __break(1u);
LABEL_266:
        __break(1u);
        goto LABEL_267;
      }
      uint64_t v99 = 0;
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v96 & 0x8000000000000000) != 0
        || (v96 & 0x4000000000000000) != 0)
      {
LABEL_129:
        if (v97)
        {
          OUTLINED_FUNCTION_40();
          _CocoaArrayWrapper.endIndex.getter();
          OUTLINED_FUNCTION_46();
        }
        else
        {
          int64_t v23 = *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v23 <= v98) {
          int64_t v23 = v98;
        }
        swift_bridgeObjectRetain();
        MEMORY[0x1CB78E9D0](v99, v23, 1, v96);
        OUTLINED_FUNCTION_46();
        unint64_t v191 = v23;
        uint64_t v100 = v23 & 0xFFFFFFFFFFFFFF8;
      }
      else
      {
        uint64_t v100 = v96 & 0xFFFFFFFFFFFFFF8;
        if (v98 > *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
          uint64_t v99 = 1;
          goto LABEL_129;
        }
      }
      uint64_t v101 = *(void *)(v100 + 16);
      unint64_t v9 = *(void *)(v100 + 24);
      if (v18)
      {
        swift_bridgeObjectRetain();
        uint64_t v29 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v29 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      int64_t v23 = 0xEA00000000006575;
      if (!v29)
      {
        unint64_t v9 = 0xED00007465536D6FLL;
        if (v95 > 0) {
          goto LABEL_265;
        }
        goto LABEL_178;
      }
      if ((uint64_t)((v9 >> 1) - v101) < v95) {
        goto LABEL_266;
      }
      unint64_t v109 = v100 + 8 * v101 + 32;
      if (v18)
      {
        if (v29 < 1) {
          goto LABEL_282;
        }
        unint64_t v186 = v95;
        unint64_t v9 = lazy protocol witness table accessor for type [UsoEntity] and conformance [A]();
        swift_bridgeObjectRetain();
        uint64_t v4 = (uint64_t)&demangling cache variable for type metadata for [UsoEntity];
        do
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoEntity]);
          uint64_t v112 = OUTLINED_FUNCTION_47();
          unint64_t v18 = *v113;
          swift_retain();
          uint64_t v114 = OUTLINED_FUNCTION_61();
          v112((void *)v114);
          OUTLINED_FUNCTION_60();
        }
        while (!v55);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_31();
        uint64_t v95 = v186;
      }
      else
      {
        if (v95 < 0
          || ((OUTLINED_FUNCTION_33(), !v111) ? (v111 = v109 >= v110) : (v111 = 1), unint64_t v9 = 0xED00007465536D6FLL, !v111))
        {
LABEL_289:
          OUTLINED_FUNCTION_56();
          _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
          goto LABEL_290;
        }
        type metadata accessor for UsoEntity();
        OUTLINED_FUNCTION_62();
      }
      int64_t v23 = 0xEA00000000006575;
      if (v95 <= 0) {
        goto LABEL_178;
      }
      uint64_t v115 = *(void *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x10);
      BOOL v75 = __OFADD__(v115, v95);
      uint64_t v116 = v115 + v95;
      if (!v75)
      {
        *(void *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x10) = v116;
LABEL_178:
        swift_bridgeObjectRelease();
        specialized Array._endMutation()();
        uint64_t v72 = 1;
        unint64_t v71 = (unint64_t)v190;
        continue;
      }
      break;
    }
    __break(1u);
LABEL_280:
    __break(1u);
LABEL_281:
    __break(1u);
LABEL_282:
    __break(1u);
LABEL_283:
    __break(1u);
LABEL_284:
    __break(1u);
LABEL_285:
    __break(1u);
LABEL_286:
    __break(1u);
LABEL_287:
    __break(1u);
LABEL_288:
    swift_once();
  }
  unint64_t v173 = v18;
  uint64_t v35 = v4;
  uint64_t v4 = 0;
  unint64_t v36 = 0;
  uint64_t v37 = 0;
  unint64_t v186 = v33 + ((*(unsigned __int8 *)(v188 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v188 + 80));
  unint64_t v175 = v9 + 8;
  unint64_t v176 = v35 + 8;
  uint64_t v29 = v182;
  unint64_t v38 = v184;
  *(void *)&long long v183 = v23;
  int64_t v189 = v188 + 16;
  uint64_t v185 = v33;
  v190 = (void (**)(void))(v188 + 8);
  do
  {
    if (v36 >= *(void *)(v33 + 16)) {
      goto LABEL_285;
    }
    unint64_t v18 = *(void *)(v188 + 16);
    ((void (*)(int64_t, unint64_t, unint64_t))v18)(v23, v186 + *(void *)(v188 + 72) * v36, v38);
    unint64_t v9 = v38;
    if ((Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter() & 1) == 0)
    {
      char v45 = Siri_Nlu_External_UserDialogAct.hasRejected.getter();
      ((void (*)(int64_t, int64_t, unint64_t))v18)(v178, v23, v38);
      uint64_t v46 = v190;
      if (v45)
      {
        uint64_t v47 = *v190;
        OUTLINED_FUNCTION_29();
        v47();
      }
      else
      {
        char v48 = Siri_Nlu_External_UserDialogAct.hasCancelled.getter();
        unint64_t v38 = v184;
        char v49 = v48;
        uint64_t v47 = *v46;
        OUTLINED_FUNCTION_29();
        v47();
        if ((v49 & 1) == 0)
        {
          unint64_t v9 = v183;
          uint64_t v56 = Siri_Nlu_External_UserDialogAct.hasAccepted.getter();
          unint64_t v38 = v184;
          unint64_t v1 = v56;
          ((void (*)(unint64_t, unint64_t, uint64_t))v18)(v173, v9, v184);
          if ((v1 & 1) == 0)
          {
            Siri_Nlu_External_UserDialogAct.hasWantedToProceed.getter();
            unint64_t v38 = v184;
          }
          OUTLINED_FUNCTION_29();
          v47();
          int64_t v23 = v183;
          ((void (*)(void, unint64_t))v47)(v183, v38);
          goto LABEL_35;
        }
      }
      unint64_t v1 = v183;
      uint64_t v50 = OUTLINED_FUNCTION_2_1();
      ((void (*)(uint64_t))v47)(v50);
      int64_t v23 = v1;
LABEL_35:
      uint64_t v29 = v182;
      goto LABEL_42;
    }
    Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
    Siri_Nlu_External_UserStatedTask.task.getter();
    OUTLINED_FUNCTION_10_0();
    v39();
    uint64_t v40 = static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)();
    if (v37)
    {
LABEL_290:
      OUTLINED_FUNCTION_10_0();
      v166();
      swift_unexpectedError();
      __break(1u);
      return;
    }
    uint64_t v41 = v40;
    OUTLINED_FUNCTION_10_0();
    v42();
    unint64_t v43 = MEMORY[0x1CB78E5D0](v41);
    unint64_t v18 = v43;
    v44 = (void (**)(int64_t, uint64_t))v190;
    *((void *)&v183 + 1) = v41;
    if ((v4 & 1) == 0)
    {
      if (v43 >> 62)
      {
        swift_bridgeObjectRetain();
        int64_t v23 = _CocoaArrayWrapper.endIndex.getter();
        if (v23)
        {
LABEL_18:
          uint64_t v174 = 0;
          uint64_t v29 = v18 & 0xC000000000000001;
          uint64_t v51 = 4;
          while (1)
          {
            if (v29)
            {
              unint64_t v1 = MEMORY[0x1CB78E9C0](v51 - 4, v18);
            }
            else
            {
              unint64_t v1 = *(void *)(v18 + 8 * v51);
              swift_retain();
            }
            unint64_t v9 = v51 - 3;
            if (__OFADD__(v51 - 4, 1)) {
              goto LABEL_281;
            }
            uint64_t v52 = UsoTask.verbString.getter();
            uint64_t v54 = v53;
            if (one-time initialization token for updateVerbString != -1) {
              swift_once();
            }
            BOOL v55 = v52 == static CorrectionsConstants.updateVerbString && v54 == *(void *)algn_1EA5C60C8;
            if (v55) {
              break;
            }
            uint64_t v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_release();
            swift_bridgeObjectRelease();
            if ((v4 & 1) == 0)
            {
              ++v51;
              if (v9 != v23) {
                continue;
              }
            }
            goto LABEL_37;
          }
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v4 = 1;
LABEL_37:
          uint64_t v37 = v174;
          uint64_t v29 = v182;
          v44 = (void (**)(int64_t, uint64_t))v190;
          goto LABEL_40;
        }
      }
      else
      {
        int64_t v23 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v23) {
          goto LABEL_18;
        }
      }
      uint64_t v4 = 0;
LABEL_40:
      swift_bridgeObjectRelease();
      int64_t v23 = v183;
      goto LABEL_41;
    }
    uint64_t v4 = 1;
LABEL_41:
    type metadata accessor for CorrectionsEngine();
    unint64_t v1 = (unint64_t)static CorrectionsEngine.searchTasks(tasks:customizations:)(v18, v199);
    swift_bridgeObjectRelease();
    specialized Array.append<A>(contentsOf:)(v1);
    swift_release();
    unint64_t v38 = v184;
    (*v44)(v23, v184);
LABEL_42:
    ++v36;
    uint64_t v33 = v185;
  }
  while (v36 != v187);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_44(v202);
  if (v58)
  {
    uint64_t v174 = v37;
    uint64_t v29 = v177;
    uint64_t v31 = MEMORY[0x1E4FBC860];
    goto LABEL_47;
  }
  uint64_t v150 = MEMORY[0x1E4FBC860];
  if (v4)
  {
    uint64_t v194 = MEMORY[0x1E4FBC860];
LABEL_271:
    swift_bridgeObjectRelease();
    if (*(void *)(v150 + 16) >= 2uLL)
    {
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v158 = type metadata accessor for Logger();
      v159 = (void *)OUTLINED_FUNCTION_9_0(v158, (uint64_t)static Logger.logger);
      os_log_type_t v160 = static os_log_type_t.debug.getter();
      if (OUTLINED_FUNCTION_4_3(v160))
      {
        v161 = (_WORD *)OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_13_0(v161);
        OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v162, v163, "[CorrectionsEngine.checkCorrection] found more than one correction candidate.");
        OUTLINED_FUNCTION_6_2();
      }
    }
    specialized Collection.first.getter(v194, v168);
    swift_bridgeObjectRelease();
    goto LABEL_278;
  }
LABEL_259:
  swift_bridgeObjectRelease();
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v151 = type metadata accessor for Logger();
  v152 = (void *)OUTLINED_FUNCTION_9_0(v151, (uint64_t)static Logger.logger);
  os_log_type_t v153 = static os_log_type_t.debug.getter();
  if (OUTLINED_FUNCTION_4_3(v153))
  {
    uint64_t v154 = (_WORD *)OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_13_0(v154);
    OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v155, v156, "[CorrectionsEngine.checkCorrection] No correction candidates, and the verb is not update.");
    OUTLINED_FUNCTION_6_2();
  }

  v157 = (_OWORD *)v168;
  *(unsigned char *)(v168 + 32) = 0;
  _OWORD *v157 = 0u;
  v157[1] = 0u;
LABEL_278:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v199);
  id v164 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  OUTLINED_FUNCTION_10_0();
  v165();
  OUTLINED_FUNCTION_39();
}

char *static CorrectionsEngine.searchTasks(tasks:customizations:)(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_65;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v4 = v3;
  if (!v3)
  {
LABEL_66:
    uint64_t v53 = (char *)MEMORY[0x1E4FBC860];
    goto LABEL_67;
  }
  while (1)
  {
    unint64_t v5 = 0;
    unint64_t v6 = a1;
    uint64_t v53 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v44 = v4;
    uint64_t v47 = a2;
LABEL_4:
    if ((a1 & 0xC000000000000001) != 0)
    {
      MEMORY[0x1CB78E9C0](v5, v6);
    }
    else
    {
      if (v5 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_64;
      }
      swift_retain();
    }
    if (!__OFADD__(v5++, 1)) {
      break;
    }
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    if (!v4) {
      goto LABEL_66;
    }
  }
  uint64_t v8 = UsoTask.arguments.getter();
  uint64_t v9 = v8;
  int64_t v10 = 0;
  uint64_t v11 = v8 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(v8 + 32);
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & *(void *)(v8 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v49 = v8 + 64;
  uint64_t v50 = v8;
  int64_t v48 = v15;
  for (i = v5; ; unint64_t v5 = i)
  {
LABEL_13:
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v10 << 6);
      goto LABEL_29;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    if (v18 >= v15) {
      goto LABEL_58;
    }
    unint64_t v19 = *(void *)(v11 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v15) {
        goto LABEL_58;
      }
      unint64_t v19 = *(void *)(v11 + 8 * v10);
      if (!v19)
      {
        int64_t v10 = v18 + 2;
        if (v18 + 2 >= v15) {
          goto LABEL_58;
        }
        unint64_t v19 = *(void *)(v11 + 8 * v10);
        if (!v19) {
          break;
        }
      }
    }
LABEL_28:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_29:
    unint64_t v21 = *(void *)(*(void *)(v9 + 56) + 8 * v17);
    if (v21 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
      if (!v22)
      {
LABEL_31:
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v22) {
        goto LABEL_31;
      }
    }
    if (v22 < 1) {
      goto LABEL_62;
    }
    uint64_t v23 = 0;
    uint64_t v54 = v22;
    int64_t v52 = v10;
    unint64_t v55 = v14;
    do
    {
      if ((v21 & 0xC000000000000001) != 0) {
        MEMORY[0x1CB78E9C0](v23, v21);
      }
      else {
        swift_retain();
      }
      uint64_t v24 = dispatch thunk of UsoValue.getAsEntity()();
      if (v24)
      {
        uint64_t v25 = (void *)v24;
        uint64_t v26 = a2[3];
        uint64_t v27 = a2[4];
        __swift_project_boxed_opaque_existential_1(a2, v26);
        if (CorrectionsCustomizing.shouldCheckEntityForCorrections(entity:)(v25, v26, v27))
        {
          uint64_t v28 = UsoTask.verbString.getter();
          uint64_t v30 = v29;
          if (one-time initialization token for updateVerbString != -1) {
            swift_once();
          }
          if (v28 == static CorrectionsConstants.updateVerbString && v30 == *(void *)algn_1EA5C60C8) {
            char v51 = 1;
          }
          else {
            char v51 = _stringCompareWithSmolCheck(_:_:expecting:)();
          }
          swift_bridgeObjectRelease();
          __swift_project_boxed_opaque_existential_1(a2, a2[3]);
          v32._uint64_t countAndFlagsBits = UsoTask.verbString.getter();
          Swift::Bool v33 = CorrectionsCustomizing.shouldConsiderVerbAsCorrection(verb:)(v32);
          swift_bridgeObjectRelease();
          type metadata accessor for CorrectionsEngine();
          swift_retain();
          uint64_t v34 = UsoTask.verbString.getter();
          uint64_t v36 = static CorrectionsEngine.searchEntityForCorrectedAttributes(usoEntity:isExplicitCorrection:attributePathRoot:)(v25, (v51 | v33) & 1, v34, v35);
          swift_release();
          swift_bridgeObjectRelease();
          swift_retain();
          uint64_t v37 = UsoTask.verbString.getter();
          uint64_t v39 = v38;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v53 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v53 + 2) + 1, 1, (uint64_t)v53);
          }
          unint64_t v41 = *((void *)v53 + 2);
          unint64_t v40 = *((void *)v53 + 3);
          if (v41 >= v40 >> 1) {
            uint64_t v53 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v40 > 1), v41 + 1, 1, (uint64_t)v53);
          }
          *((void *)v53 + 2) = v41 + 1;
          uint64_t v42 = &v53[32 * v41];
          *((void *)v42 + 4) = v25;
          *((void *)v42 + 5) = v37;
          *((void *)v42 + 6) = v39;
          *((void *)v42 + 7) = v36;
          swift_release();
          swift_release();
          a2 = v47;
          int64_t v15 = v48;
          uint64_t v11 = v49;
          uint64_t v9 = v50;
        }
        else
        {
          swift_release();
          swift_release();
        }
        int64_t v10 = v52;
      }
      else
      {
        swift_release();
      }
      ++v23;
      unint64_t v14 = v55;
    }
    while (v54 != v23);
    swift_bridgeObjectRelease();
  }
  int64_t v20 = v18 + 3;
  if (v20 < v15)
  {
    unint64_t v19 = *(void *)(v11 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        int64_t v10 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          goto LABEL_61;
        }
        if (v10 >= v15) {
          goto LABEL_58;
        }
        unint64_t v19 = *(void *)(v11 + 8 * v10);
        ++v20;
        if (v19) {
          goto LABEL_28;
        }
      }
    }
    int64_t v10 = v20;
    goto LABEL_28;
  }
LABEL_58:
  swift_release();
  swift_release();
  unint64_t v6 = a1;
  if (v5 != v44) {
    goto LABEL_4;
  }
LABEL_67:
  swift_bridgeObjectRelease();
  return v53;
}

uint64_t specialized Array.append<A>(contentsOf:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1CB78E9D0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = specialized Array._copyContents(initializing:)(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return specialized Array._endMutation()();
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
  uint64_t result = specialized UnsafeMutablePointer.initialize(from:count:)(v6 + 32, v2, v3 + 40 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
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

{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

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
  uint64_t result = specialized UnsafeMutablePointer.initialize(from:count:)(v6 + 32, v2, v3 + 32 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
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

uint64_t static CorrectionsEngine.getCorrectedEntitiesFromSRR(correctionCandidateTaskEntity:attributePath:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (one-time initialization token for rrUtils != -1) {
    swift_once();
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t))(*(void *)static CorrectionsEngine.rrUtils + 80);
  swift_retain();
  unint64_t v7 = v6(a1);
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v8 = specialized Sequence.flatMap<A>(_:)(v7, a2, a3);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t specialized Collection.first.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

double specialized Collection.first.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    *(void *)a2 = *(void *)(a1 + 32);
    *(void *)(a2 + 8) = v2;
    *(void *)(a2 + 16) = v3;
    *(void *)(a2 + 24) = v4;
    unsigned __int8 v5 = *(unsigned char *)(a1 + 64);
    *(unsigned char *)(a2 + 32) = v5;
    swift_bridgeObjectRetain();
    outlined copy of CorrectionType(v3, v4, v5);
  }
  else
  {
    *(unsigned char *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t static CorrectionsEngine.searchEntityForCorrectedAttributes(usoEntity:isExplicitCorrection:attributePathRoot:)(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  int v170 = a2;
  uint64_t v7 = type metadata accessor for Name();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v7, v9);
  uint64_t v12 = (char *)&v155 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10, v13);
  int64_t v15 = (char *)&v155 - v14;
  if (!a1) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v161 = a3;
  uint64_t v162 = a4;
  swift_retain();
  v166 = a1;
  uint64_t v16 = UsoTask.verbString.getter();
  uint64_t v18 = v17;
  static Name.primitiveString.getter();
  uint64_t v19 = Name.value.getter();
  uint64_t v21 = v20;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v15, v7);
  if (v16 == v19 && v18 == v21) {
    goto LABEL_15;
  }
  char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v24)
  {
LABEL_16:
    if (v170)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, [UsoEntity])>);
      unint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1C9DCFD30;
      uint64_t v35 = one-time initialization token for correctIntoString;
      uint64_t v25 = v162;
      swift_bridgeObjectRetain();
      int64_t v27 = (int64_t)v166;
      if (v35 == -1) {
        goto LABEL_18;
      }
      goto LABEL_215;
    }
    swift_release();
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v25 = UsoTask.verbString.getter();
  int64_t v27 = (int64_t)v26;
  static Name.primitiveInteger.getter();
  uint64_t v28 = Name.value.getter();
  uint64_t v30 = v29;
  v22(v12, v7);
  if (v25 == v28 && v27 == (void)v30)
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  unint64_t inited = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (inited) {
    goto LABEL_16;
  }
  if (*(void *)(UsoEntity.attributes.getter() + 16))
  {
    specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, 0x80000001C9DD0960);
    unint64_t inited = v33;
    swift_bridgeObjectRelease();
    uint64_t v34 = v161;
    if (inited)
    {
      unint64_t inited = *(void *)(UsoEntity.attributes.getter() + 16);
      swift_bridgeObjectRelease();
      v170 |= inited > 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v34 = v161;
  }
  uint64_t v45 = UsoEntity.attributes.getter();
  int64_t v46 = 0;
  uint64_t v47 = *(void *)(v45 + 64);
  uint64_t v163 = v45 + 64;
  uint64_t v168 = v45;
  uint64_t v48 = 1 << *(unsigned char *)(v45 + 32);
  uint64_t v49 = -1;
  if (v48 < 64) {
    uint64_t v49 = ~(-1 << v48);
  }
  unint64_t v50 = v49 & v47;
  uint64_t v39 = (char *)MEMORY[0x1E4FBC860];
  int64_t v165 = (unint64_t)(v48 + 63) >> 6;
  uint64_t v51 = v162;
  if (!v50) {
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v172 = (v50 - 1) & v50;
  int64_t v173 = v46;
  for (unint64_t i = __clz(__rbit64(v50)) | (v46 << 6); ; unint64_t i = __clz(__rbit64(v54)) + (v55 << 6))
  {
    uint64_t v57 = (uint64_t *)(*(void *)(v168 + 48) + 16 * i);
    uint64_t v58 = *v57;
    unint64_t inited = v57[1];
    uint64_t v59 = *(void *)(*(void *)(v168 + 56) + 8 * i);
    uint64_t v60 = one-time initialization token for attributeDenyList;
    swift_bridgeObjectRetain();
    uint64_t v174 = v59;
    swift_bridgeObjectRetain();
    if (v60 != -1) {
      swift_once();
    }
    int64_t v27 = (int64_t)static CorrectionsConstants.attributeDenyList;
    uint64_t v61 = *((void *)static CorrectionsConstants.attributeDenyList + 2);
    if (v61)
    {
      BOOL v62 = *((void *)static CorrectionsConstants.attributeDenyList + 4) == v58
         && *((void *)static CorrectionsConstants.attributeDenyList + 5) == inited;
      if (v62 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
LABEL_58:
        swift_bridgeObjectRelease();
        goto LABEL_59;
      }
      if (v61 != 1)
      {
        BOOL v63 = *(void *)(v27 + 48) == v58 && *(void *)(v27 + 56) == inited;
        if (v63 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_58;
        }
        if (v61 != 2)
        {
          v27 += 72;
          uint64_t v25 = 2;
          while (1)
          {
            uint64_t v64 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              break;
            }
            BOOL v65 = *(void *)(v27 - 8) == v58 && *(void *)v27 == inited;
            if (v65 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              goto LABEL_58;
            }
            v27 += 16;
            ++v25;
            if (v64 == v61) {
              goto LABEL_70;
            }
          }
LABEL_209:
          __break(1u);
LABEL_210:
          __break(1u);
LABEL_211:
          __break(1u);
LABEL_212:
          __break(1u);
LABEL_213:
          __break(1u);
LABEL_214:
          __break(1u);
LABEL_215:
          swift_once();
LABEL_18:
          uint64_t v36 = *(void *)algn_1EA5C60B8;
          *(void *)(inited + 32) = static CorrectionsConstants.correctIntoString;
          *(void *)(inited + 40) = v36;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
          uint64_t v37 = swift_allocObject();
          *(_OWORD *)(v37 + 16) = xmmword_1C9DD01A0;
          *(void *)(v37 + 32) = v27;
          uint64_t v175 = v37;
          specialized Array._endMutation()();
          *(void *)(inited + 48) = v175;
          swift_retain();
          swift_bridgeObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoEntity]);
          uint64_t v38 = Dictionary.init(dictionaryLiteral:)();
          uint64_t v39 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, MEMORY[0x1E4FBC860]);
          unint64_t v41 = *((void *)v39 + 2);
          unint64_t v40 = *((void *)v39 + 3);
          uint64_t v42 = v161;
          if (v41 >= v40 >> 1) {
            uint64_t v39 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v40 > 1), v41 + 1, 1, (uint64_t)v39);
          }
          *((void *)v39 + 2) = v41 + 1;
          unint64_t v43 = &v39[24 * v41];
          *((void *)v43 + 4) = v42;
          *((void *)v43 + 5) = v25;
          *((void *)v43 + 6) = v38;
LABEL_21:
          swift_release();
          return (uint64_t)v39;
        }
      }
    }
LABEL_70:
    uint64_t v175 = v34;
    uint64_t v176 = v51;
    swift_bridgeObjectRetain();
    v66._uint64_t countAndFlagsBits = 46;
    v66._uint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v66);
    v67._uint64_t countAndFlagsBits = v58;
    v67._uint64_t object = (void *)inited;
    String.append(_:)(v67);
    swift_bridgeObjectRelease();
    uint64_t v159 = v175;
    uint64_t v160 = v176;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoEntity]);
    uint64_t v164 = Dictionary.init(dictionaryLiteral:)();
    uint64_t v68 = v174;
    if (!((unint64_t)v174 >> 62))
    {
      uint64_t v69 = *(void *)((v174 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v69) {
        goto LABEL_72;
      }
      goto LABEL_200;
    }
    if (v174 < 0) {
      unint64_t inited = v174;
    }
    else {
      unint64_t inited = v174 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v69 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v69)
    {
LABEL_72:
      unint64_t v70 = 0;
      unint64_t v169 = v68 & 0xC000000000000001;
      uint64_t v158 = v68 & 0xFFFFFFFFFFFFFF8;
      uint64_t v157 = v68 + 32;
      uint64_t v167 = v69;
      while (1)
      {
        if (v169)
        {
          MEMORY[0x1CB78E9C0](v70, v68);
        }
        else
        {
          if (v70 >= *(void *)(v158 + 16)) {
            goto LABEL_210;
          }
          swift_retain();
        }
        BOOL v71 = __OFADD__(v70++, 1);
        if (v71)
        {
          __break(1u);
          goto LABEL_209;
        }
        uint64_t v72 = dispatch thunk of UsoValue.getAsExpression()();
        if (!v72) {
          break;
        }
        uint64_t v25 = v72;
        if (one-time initialization token for operatorStrings != -1) {
          swift_once();
        }
        int64_t v73 = static CorrectionsConstants.operatorStrings;
        swift_bridgeObjectRetain();
        uint64_t v74 = UsoExpression.operatorAsString.getter();
        if (v75) {
          uint64_t v76 = v74;
        }
        else {
          uint64_t v76 = 0;
        }
        if (v75) {
          unint64_t inited = v75;
        }
        else {
          unint64_t inited = 0xE000000000000000;
        }
        int64_t v27 = v73[2];
        if (!v27)
        {
          swift_bridgeObjectRelease();
LABEL_109:
          swift_bridgeObjectRelease();
          type metadata accessor for CorrectionsEngine();
          uint64_t v95 = dispatch thunk of UsoValue.getAsEntity()();
          unint64_t inited = static CorrectionsEngine.searchEntityForCorrectedAttributes(usoEntity:isExplicitCorrection:attributePathRoot:)(v95, 0, v159, v160);
          swift_release();
          uint64_t v96 = *(void *)(inited + 16);
          int64_t v27 = *((void *)v39 + 2);
          unint64_t v97 = (char *)(v27 + v96);
          uint64_t v69 = v167;
          if (__OFADD__(v27, v96)) {
            goto LABEL_212;
          }
          swift_bridgeObjectRetain();
          isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
          if (!isUniquelyReferenced_nonNull_native || (uint64_t)v97 > *((void *)v39 + 3) >> 1)
          {
            if (v27 <= (uint64_t)v97) {
              int64_t v99 = v27 + v96;
            }
            else {
              int64_t v99 = v27;
            }
            uint64_t v39 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v99, 1, (uint64_t)v39);
          }
          if (*(void *)(inited + 16))
          {
            uint64_t v100 = *((void *)v39 + 2);
            if ((*((void *)v39 + 3) >> 1) - v100 < v96) {
              goto LABEL_214;
            }
            unint64_t v101 = (unint64_t)&v39[24 * v100 + 32];
            if (inited + 32 < v101 + 24 * v96 && v101 < inited + 32 + 24 * v96) {
              goto LABEL_227;
            }
            swift_arrayInitWithCopy();
            if (v96)
            {
              uint64_t v103 = *((void *)v39 + 2);
              BOOL v71 = __OFADD__(v103, v96);
              uint64_t v104 = v103 + v96;
              if (v71) {
                goto LABEL_219;
              }
              *((void *)v39 + 2) = v104;
            }
          }
          else if (v96)
          {
            goto LABEL_213;
          }
          swift_bridgeObjectRelease_n();
          swift_release();
LABEL_180:
          swift_release();
          goto LABEL_194;
        }
        v171 = v39;
        BOOL v77 = v73[4] == v76 && v73[5] == inited;
        if (!v77 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          uint64_t v39 = v171;
          if (v27 == 1)
          {
            swift_bridgeObjectRelease();
LABEL_149:
            uint64_t v68 = v174;
            goto LABEL_109;
          }
          BOOL v115 = v73[6] == v76 && v73[7] == inited;
          if (!v115 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            if (v27 != 2)
            {
              uint64_t v116 = v73 + 9;
              uint64_t v117 = 2;
              do
              {
                unint64_t v118 = (void *)(v117 + 1);
                if (__OFADD__(v117, 1)) {
                  goto LABEL_223;
                }
                BOOL v119 = *(v116 - 1) == v76 && *v116 == inited;
                if (v119 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
                  goto LABEL_93;
                }
                v116 += 2;
                ++v117;
              }
              while (v118 != (void *)v27);
            }
            swift_bridgeObjectRelease();
            uint64_t v39 = v171;
            goto LABEL_149;
          }
        }
LABEL_93:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v78 = UsoExpression.operatorAsString.getter();
        if (!v79)
        {
          swift_release();
          swift_release();
          uint64_t v39 = v171;
          uint64_t v68 = v174;
LABEL_177:
          uint64_t v69 = v167;
          goto LABEL_194;
        }
        unint64_t inited = v78;
        uint64_t v80 = v79;
        uint64_t v81 = UsoExpression.operandAsValue.getter();
        uint64_t v39 = v171;
        uint64_t v69 = v167;
        if (v81 && (uint64_t v82 = dispatch thunk of UsoValue.getAsEntity()(), swift_release(), v82))
        {
          uint64_t v83 = *(void *)(v164 + 16);
          uint64_t v156 = inited;
          if (v83)
          {
            swift_bridgeObjectRetain();
            unint64_t v84 = specialized __RawDictionaryStorage.find<A>(_:)(inited, v80);
            uint64_t v85 = MEMORY[0x1E4FBC860];
            if (v86)
            {
              uint64_t v85 = *(void *)(*(void *)(v164 + 56) + 8 * v84);
              swift_bridgeObjectRetain();
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v85 = MEMORY[0x1E4FBC860];
          }
          uint64_t v175 = v85;
          swift_retain_n();
          uint64_t v135 = swift_bridgeObjectRetain();
          MEMORY[0x1CB78E890](v135);
          if (*(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          uint64_t v155 = v175;
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v136 = v164;
          char v137 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v175 = v136;
          unint64_t v138 = specialized __RawDictionaryStorage.find<A>(_:)(v156, v80);
          uint64_t v140 = *(void *)(v136 + 16);
          BOOL v141 = (v139 & 1) == 0;
          Swift::Int v142 = v140 + v141;
          if (__OFADD__(v140, v141)) {
            goto LABEL_221;
          }
          int64_t v27 = v138;
          unint64_t inited = v139;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, [UsoEntity]>);
          Swift::Bool v143 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v137, v142);
          uint64_t v39 = v171;
          uint64_t v69 = v167;
          if (v143)
          {
            unint64_t v144 = specialized __RawDictionaryStorage.find<A>(_:)(v156, v80);
            if ((inited & 1) != (v145 & 1)) {
              goto LABEL_228;
            }
            int64_t v27 = v144;
          }
          unint64_t v146 = (void *)v175;
          uint64_t v164 = v175;
          if (inited)
          {
            unint64_t inited = *(void *)(v175 + 56);
            swift_bridgeObjectRelease();
            *(void *)(inited + 8 * v27) = v155;
          }
          else
          {
            *(void *)(v175 + 8 * ((unint64_t)v27 >> 6) + 64) |= 1 << v27;
            unint64_t v147 = (void *)(v146[6] + 16 * v27);
            void *v147 = v156;
            v147[1] = v80;
            *(void *)(v146[7] + 8 * v27) = v155;
            uint64_t v148 = v146[2];
            BOOL v71 = __OFADD__(v148, 1);
            uint64_t v149 = v148 + 1;
            if (v71) {
              goto LABEL_226;
            }
            v146[2] = v149;
            swift_bridgeObjectRetain();
          }
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
        }
        uint64_t v68 = v174;
LABEL_194:
        if (v70 == v69) {
          goto LABEL_200;
        }
      }
      uint64_t v87 = dispatch thunk of UsoValue.getAsEntity()();
      if (!v87) {
        goto LABEL_180;
      }
      uint64_t v25 = v87;
      if ((v170 & 1) == 0)
      {
        type metadata accessor for CorrectionsEngine();
        uint64_t v105 = static CorrectionsEngine.searchEntityForCorrectedAttributes(usoEntity:isExplicitCorrection:attributePathRoot:)(v25, 0, v159, v160);
        uint64_t v106 = *(void *)(v105 + 16);
        int64_t v27 = *((void *)v39 + 2);
        uint64_t v107 = (char *)(v27 + v106);
        if (__OFADD__(v27, v106))
        {
          __break(1u);
LABEL_217:
          __break(1u);
LABEL_218:
          __break(1u);
LABEL_219:
          __break(1u);
          goto LABEL_220;
        }
        unint64_t inited = v105;
        uint64_t v108 = (char *)swift_isUniquelyReferenced_nonNull_native();
        if (!v108 || (uint64_t)v107 > *((void *)v39 + 3) >> 1)
        {
          if (v27 <= (uint64_t)v107) {
            int64_t v109 = v27 + v106;
          }
          else {
            int64_t v109 = v27;
          }
          uint64_t v39 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v108, v109, 1, (uint64_t)v39);
        }
        if (*(void *)(inited + 16))
        {
          uint64_t v110 = *((void *)v39 + 2);
          if ((*((void *)v39 + 3) >> 1) - v110 < v106) {
            goto LABEL_222;
          }
          unint64_t v111 = (unint64_t)&v39[24 * v110 + 32];
          if (inited + 32 < v111 + 24 * v106 && v111 < inited + 32 + 24 * v106) {
            goto LABEL_227;
          }
          swift_arrayInitWithCopy();
          if (v106)
          {
            uint64_t v113 = *((void *)v39 + 2);
            BOOL v71 = __OFADD__(v113, v106);
            uint64_t v114 = v113 + v106;
            if (v71) {
              goto LABEL_225;
            }
            *((void *)v39 + 2) = v114;
          }
        }
        else if (v106)
        {
          goto LABEL_218;
        }
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_180;
      }
      if (one-time initialization token for correctIntoString != -1) {
        swift_once();
      }
      uint64_t v88 = static CorrectionsConstants.correctIntoString;
      uint64_t v89 = *(void *)algn_1EA5C60B8;
      uint64_t v90 = v164;
      uint64_t v91 = *(void *)(v164 + 16);
      swift_bridgeObjectRetain();
      uint64_t v156 = v88;
      if (v91)
      {
        swift_bridgeObjectRetain();
        unint64_t v92 = specialized __RawDictionaryStorage.find<A>(_:)(v88, v89);
        uint64_t v93 = MEMORY[0x1E4FBC860];
        if (v94)
        {
          uint64_t v93 = *(void *)(*(void *)(v90 + 56) + 8 * v92);
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v93 = MEMORY[0x1E4FBC860];
      }
      v171 = v39;
      uint64_t v175 = v93;
      swift_retain_n();
      uint64_t v120 = swift_bridgeObjectRetain();
      MEMORY[0x1CB78E890](v120);
      if (*(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      uint64_t v121 = v175;
      swift_bridgeObjectRelease();
      swift_release();
      unint64_t inited = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v175 = v90;
      unint64_t v122 = specialized __RawDictionaryStorage.find<A>(_:)(v156, v89);
      uint64_t v124 = *(void *)(v90 + 16);
      BOOL v125 = (v123 & 1) == 0;
      Swift::Int v126 = v124 + v125;
      if (__OFADD__(v124, v125)) {
        goto LABEL_217;
      }
      int64_t v27 = v122;
      char v127 = v123;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, [UsoEntity]>);
      Swift::Bool v128 = _NativeDictionary.ensureUnique(isUnique:capacity:)(inited, v126);
      uint64_t v39 = v171;
      if (v128)
      {
        unint64_t v129 = specialized __RawDictionaryStorage.find<A>(_:)(v156, v89);
        if ((v127 & 1) != (v130 & 1)) {
          goto LABEL_228;
        }
        int64_t v27 = v129;
      }
      unint64_t v131 = (void *)v175;
      uint64_t v164 = v175;
      if (v127)
      {
        unint64_t inited = *(void *)(v175 + 56);
        swift_bridgeObjectRelease();
        *(void *)(inited + 8 * v27) = v121;
      }
      else
      {
        *(void *)(v175 + 8 * ((unint64_t)v27 >> 6) + 64) |= 1 << v27;
        uint64_t v132 = (void *)(v131[6] + 16 * v27);
        *uint64_t v132 = v156;
        v132[1] = v89;
        *(void *)(v131[7] + 8 * v27) = v121;
        uint64_t v133 = v131[2];
        BOOL v71 = __OFADD__(v133, 1);
        uint64_t v134 = v133 + 1;
        if (v71) {
          goto LABEL_224;
        }
        v131[2] = v134;
        swift_bridgeObjectRetain();
      }
      uint64_t v68 = v174;
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_177;
    }
LABEL_200:
    swift_bridgeObjectRelease();
    unint64_t inited = v164;
    if (*(void *)(v164 + 16))
    {
      swift_bridgeObjectRetain();
      char v150 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v51 = v162;
      uint64_t v34 = v161;
      if ((v150 & 1) == 0) {
        uint64_t v39 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v39 + 2) + 1, 1, (uint64_t)v39);
      }
      unint64_t v152 = *((void *)v39 + 2);
      unint64_t v151 = *((void *)v39 + 3);
      unint64_t inited = v152 + 1;
      if (v152 >= v151 >> 1) {
        uint64_t v39 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v151 > 1), v152 + 1, 1, (uint64_t)v39);
      }
      *((void *)v39 + 2) = inited;
      os_log_type_t v153 = &v39[24 * v152];
      uint64_t v154 = v160;
      *((void *)v153 + 4) = v159;
      *((void *)v153 + 5) = v154;
      *((void *)v153 + 6) = v164;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v51 = v162;
      uint64_t v34 = v161;
    }
LABEL_59:
    swift_bridgeObjectRelease();
    unint64_t v50 = v172;
    int64_t v46 = v173;
    if (v172) {
      goto LABEL_29;
    }
LABEL_30:
    int64_t v53 = v46 + 1;
    if (__OFADD__(v46, 1)) {
      goto LABEL_211;
    }
    if (v53 >= v165)
    {
LABEL_207:
      swift_release();
      goto LABEL_21;
    }
    unint64_t v54 = *(void *)(v163 + 8 * v53);
    int64_t v55 = v46 + 1;
    if (!v54)
    {
      int64_t v55 = v46 + 2;
      if (v46 + 2 >= v165) {
        goto LABEL_207;
      }
      unint64_t v54 = *(void *)(v163 + 8 * v55);
      if (!v54)
      {
        int64_t v55 = v46 + 3;
        if (v46 + 3 >= v165) {
          goto LABEL_207;
        }
        unint64_t v54 = *(void *)(v163 + 8 * v55);
        if (!v54) {
          break;
        }
      }
    }
LABEL_43:
    uint64_t v172 = (v54 - 1) & v54;
    int64_t v173 = v55;
  }
  uint64_t v56 = v46 + 4;
  if (v46 + 4 >= v165) {
    goto LABEL_207;
  }
  unint64_t v54 = *(void *)(v163 + 8 * v56);
  if (v54)
  {
    int64_t v55 = v46 + 4;
    goto LABEL_43;
  }
  while (1)
  {
    int64_t v55 = v56 + 1;
    if (__OFADD__(v56, 1)) {
      break;
    }
    if (v55 >= v165) {
      goto LABEL_207;
    }
    unint64_t v54 = *(void *)(v163 + 8 * v55);
    ++v56;
    if (v54) {
      goto LABEL_43;
    }
  }
LABEL_220:
  __break(1u);
LABEL_221:
  __break(1u);
LABEL_222:
  __break(1u);
LABEL_223:
  __break(1u);
LABEL_224:
  __break(1u);
LABEL_225:
  __break(1u);
LABEL_226:
  __break(1u);
LABEL_227:
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_228:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t static CorrectionsEngine.searchEntityForPath(entity:path:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v4 = a2 & 0xFFFFFFFFFFFFLL;
  }
  unsigned __int8 v5 = "CorrectionsDirectInvocation";
  if (!v4)
  {
    if (one-time initialization token for logger != -1) {
      goto LABEL_72;
    }
    goto LABEL_7;
  }
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v6 = (void *)StringProtocol.components<A>(separatedBy:)();
  uint64_t v7 = v6;
  if (v6[2])
  {
    uint64_t v9 = v6[4];
    uint64_t v8 = v6[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v15 = UsoTask.verbString.getter();
  if (!v8)
  {
    swift_bridgeObjectRelease();
LABEL_19:
    swift_bridgeObjectRelease();
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    __swift_project_value_buffer(v19, (uint64_t)static Logger.logger);
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_1C9DB7000, v20, v21, "[CorrectionsEngine.searchEntityForPath] the entity type does not match the path root type", v22, 2u);
      MEMORY[0x1CB78F000](v22, -1, -1);
    }

    return MEMORY[0x1E4FBC860];
  }
  if (v9 == v15 && v8 == v16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0) {
      goto LABEL_19;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1C9DD01A0;
  *(void *)(v23 + 32) = a1;
  uint64_t v50 = v23;
  uint64_t result = specialized Array._endMutation()();
  unint64_t v25 = v7[2];
  if (v25 == 1)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    return v50;
  }
  if (!v25)
  {
    __break(1u);
    return result;
  }
  unint64_t v41 = v7 + 4;
  swift_retain();
  unint64_t v26 = 1;
  unint64_t v27 = MEMORY[0x1E4FBC860];
  a1 = v50;
  uint64_t v42 = v7;
  unint64_t v40 = v25;
  while (1)
  {
    if (v26 >= v25) {
      goto LABEL_71;
    }
    unint64_t v51 = v27;
    if (a1 >> 62) {
      break;
    }
    uint64_t v28 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v28) {
      goto LABEL_31;
    }
LABEL_62:
    swift_bridgeObjectRelease();
    a1 = v27;
LABEL_63:
    if (++v26 == v25)
    {
      swift_bridgeObjectRelease();
      return a1;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v28 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v28) {
    goto LABEL_62;
  }
LABEL_31:
  unsigned __int8 v5 = 0;
  uint64_t v46 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v47 = &v41[2 * v26];
  unint64_t v48 = a1 & 0xC000000000000001;
  unint64_t v43 = a1;
  uint64_t v44 = v28;
  unint64_t v45 = v26;
  while (1)
  {
    if (v48)
    {
      MEMORY[0x1CB78E9C0](v5, a1);
    }
    else
    {
      if ((unint64_t)v5 >= *(void *)(v46 + 16)) {
        goto LABEL_69;
      }
      swift_retain();
    }
    if (__OFADD__(v5++, 1)) {
      break;
    }
    uint64_t v30 = UsoEntity.attributes.getter();
    if (v26 >= v7[2]) {
      goto LABEL_68;
    }
    uint64_t v31 = v30;
    if (*(void *)(v30 + 16))
    {
      uint64_t v33 = *v47;
      uint64_t v32 = v47[1];
      swift_bridgeObjectRetain();
      unint64_t v34 = specialized __RawDictionaryStorage.find<A>(_:)(v33, v32);
      if (v35)
      {
        unint64_t v36 = *(void *)(*(void *)(v31 + 56) + 8 * v34);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v36 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (!v37) {
            goto LABEL_57;
          }
LABEL_42:
          if (v37 < 1) {
            goto LABEL_70;
          }
          for (uint64_t i = 0; i != v37; ++i)
          {
            if ((v36 & 0xC000000000000001) != 0) {
              MEMORY[0x1CB78E9C0](i, v36);
            }
            else {
              swift_retain();
            }
            if (dispatch thunk of UsoValue.getAsEntity()())
            {
              uint64_t v39 = swift_retain();
              MEMORY[0x1CB78E890](v39);
              if (*(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
              swift_release();
            }
            swift_release();
          }
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v7 = v42;
          a1 = v43;
        }
        else
        {
          uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v37) {
            goto LABEL_42;
          }
LABEL_57:
          swift_release();
          swift_bridgeObjectRelease();
        }
        uint64_t v28 = v44;
        unint64_t v26 = v45;
        goto LABEL_59;
      }
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
    }
    swift_bridgeObjectRelease();
LABEL_59:
    if (v5 == (const char *)v28)
    {
      swift_bridgeObjectRelease();
      a1 = v51;
      unint64_t v25 = v40;
      unint64_t v27 = MEMORY[0x1E4FBC860];
      goto LABEL_63;
    }
  }
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
  swift_once();
LABEL_7:
  uint64_t v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Logger.logger);
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1C9DB7000, v11, v12, "[CorrectionsEngine.searchEntityForPath] No path provided, returning entire entity", v13, 2u);
    MEMORY[0x1CB78F000](v13, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = *((_OWORD *)v5 + 26);
  *(void *)(v14 + 32) = a1;
  uint64_t v49 = v14;
  specialized Array._endMutation()();
  a1 = v49;
  swift_retain();
  return a1;
}

uint64_t specialized Sequence.flatMap<A>(_:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v12 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = _CocoaArrayWrapper.endIndex.getter())
  {
    type metadata accessor for CorrectionsEngine();
    for (uint64_t i = 4; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        unint64_t v6 = MEMORY[0x1CB78E9C0](i - 4, a1);
      }
      else
      {
        unint64_t v6 = *(void *)(a1 + 8 * i);
        swift_retain();
      }
      uint64_t v7 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      unint64_t v8 = static CorrectionsEngine.searchEntityForPath(entity:path:)(v6, a2, a3);
      swift_release();
      specialized Array.append<A>(contentsOf:)(v8);
      if (v7 == v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v12;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

double specialized Dictionary.subscript.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    outlined init with copy of Any(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t static CorrectionsEngine.tasks(from:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v2, v4);
  char v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5, v8);
  uint64_t v10 = (char *)v30 - v9;
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v13);
  uint64_t v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v31 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16, v17);
  uint64_t v19 = (char *)v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter())
  {
    Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
    Siri_Nlu_External_UserStatedTask.task.getter();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)();
    uint64_t v28 = MEMORY[0x1CB78E5D0]();
    swift_release();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v19, v16);
  }
  else
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)static Logger.logger);
    os_log_type_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v21(v10, a1, v2);
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      char v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v33 = v31;
      *(_DWORD *)char v24 = 136315138;
      v30[1] = v24 + 4;
      v21(v7, (uint64_t)v10, v2);
      uint64_t v25 = String.init<A>(describing:)();
      uint64_t v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v26, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
      _os_log_impl(&dword_1C9DB7000, v22, v23, "[CorrectionsEngine.checkUndo] No UserStatedTask for %s, returning []", v24, 0xCu);
      uint64_t v27 = v31;
      swift_arrayDestroy();
      MEMORY[0x1CB78F000](v27, -1, -1);
      MEMORY[0x1CB78F000](v24, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
    }

    return MEMORY[0x1E4FBC860];
  }
  return v28;
}

uint64_t static CorrectionsEngine.isCrossAlarmTimerDomain(invocation:incomingParse:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  MEMORY[0x1F4188790](v0 - 8, v1);
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v4, v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(MEMORY[0x1CB78E470](v7) + 16);
  uint64_t v11 = swift_bridgeObjectRelease();
  if (v10 != 1) {
    goto LABEL_26;
  }
  uint64_t v12 = MEMORY[0x1CB78E470](v11);
  specialized Collection.first.getter(v12, (uint64_t)v3);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4) == 1)
  {
    outlined destroy of CorrectionsCustomizing?((uint64_t)v3, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
LABEL_26:
    char v24 = 0;
    return v24 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v9, v3, v4);
  type metadata accessor for CorrectionsEngine();
  unint64_t v13 = static CorrectionsEngine.tasks(from:)((uint64_t)v9);
  unint64_t v14 = v13;
  if (!(v13 >> 62))
  {
    uint64_t result = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_6;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    goto LABEL_26;
  }
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  if (!result) {
    goto LABEL_25;
  }
LABEL_6:
  if ((v14 & 0xC000000000000001) != 0)
  {
    MEMORY[0x1CB78E9C0](0, v14);
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v16 = UsoTask.baseEntityAsString.getter();
    uint64_t v18 = v17;
    swift_release();
    Swift::String v27 = String.lowercased()();
    uint64_t v25 = 0x6D72616C61;
    unint64_t v26 = 0xE500000000000000;
    lazy protocol witness table accessor for type String and conformance String();
    char v19 = StringProtocol.contains<A>(_:)();
    swift_bridgeObjectRelease();
    if (v19)
    {
      if (v16 != 0x415F6E6F6D6D6F63 || v18 != 0xEC0000006D72616CLL)
      {
LABEL_20:
        char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        char v24 = v23 ^ 1;
LABEL_22:
        (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
        return v24 & 1;
      }
    }
    else
    {
      Swift::String v27 = String.lowercased()();
      uint64_t v25 = 0x72656D6974;
      unint64_t v26 = 0xE500000000000000;
      char v21 = StringProtocol.contains<A>(_:)();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0)
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
      if (v16 != 0x545F6E6F6D6D6F63 || v18 != 0xEC00000072656D69) {
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
    char v24 = 0;
    goto LABEL_22;
  }
  if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

void CorrectionsEngine.setUndoInvocation(directInvocation:context:)()
{
  OUTLINED_FUNCTION_37();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x1F4188790](v6, v7);
  OUTLINED_FUNCTION_53();
  type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v8, v9);
  OUTLINED_FUNCTION_22_0();
  uint64_t v11 = *v4;
  uint64_t v10 = v4[1];
  uint64_t v12 = v4[2];
  uint64_t v13 = *v2;
  uint64_t v33 = v2[2];
  uint64_t v34 = v2[1];
  uint64_t v31 = v2[4];
  uint64_t v32 = v2[3];
  uint64_t v29 = v2[6];
  uint64_t v30 = v2[5];
  uint64_t v28 = v2[7];
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v14 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v16 = OUTLINED_FUNCTION_9_0(v15, (uint64_t)static Logger.logger);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_7_1();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_1C9DB7000, v16, v17, "[CorrectionsEngine.setUndoInvocation] storing an undo direct invocation.", v18, 2u);
    OUTLINED_FUNCTION_1_2();
  }

  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  v36[0] = v11;
  v36[1] = v10;
  v36[2] = v12;
  v35[0] = v13;
  v35[1] = v34;
  v35[2] = v33;
  v35[3] = v32;
  v35[4] = v31;
  v35[5] = v30;
  v35[6] = v29;
  v35[7] = v28;
  (*(void (**)(void *, void *))(*(void *)static CorrectionsSELFHelper.shared + 152))(v36, v35);
  if (one-time initialization token for parseStoredTime != -1) {
    swift_once();
  }
  uint64_t v19 = __swift_project_value_buffer(v5, (uint64_t)static CorrectionsEngine.parseStoredTime);
  static Date.now.getter();
  uint64_t v20 = type metadata accessor for Date();
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v20);
  swift_beginAccess();
  outlined assign with take of Date?(v0, v19);
  swift_endAccess();
  if (one-time initialization token for inverseDirectInvocation != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v21 = static CorrectionsEngine.inverseDirectInvocation;
  uint64_t v22 = qword_1EBC69B90;
  static CorrectionsEngine.inverseDirectInvocation = v11;
  qword_1EBC69B90 = v10;
  qword_1EBC69B98 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined consume of CorrectionsDirectInvocation?(v21, v22);
  if (one-time initialization token for context != -1) {
    swift_once();
  }
  char v23 = (uint64_t *)static CorrectionsEngine.context;
  OUTLINED_FUNCTION_48();
  uint64_t v24 = *v23;
  uint64_t v25 = v23[1];
  uint64_t *v23 = v13;
  v23[1] = v34;
  v23[2] = v33;
  v23[3] = v32;
  _OWORD v23[4] = v31;
  v23[5] = v30;
  v23[6] = v29;
  v23[7] = v28;
  outlined copy of CorrectionsContext?(v13, v34);
  outlined consume of CorrectionsContext?(v24, v25);
  id v26 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  OUTLINED_FUNCTION_12_0();
  v27();
  OUTLINED_FUNCTION_39();
}

void CorrectionsEngine.checkUndo(input:context:correctionsOutcome:)()
{
  OUTLINED_FUNCTION_37();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v367 = v6;
  uint64_t v364 = v7;
  uint64_t v352 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x1F4188790](v8, v9);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_14_0(v10);
  uint64_t v358 = type metadata accessor for Date();
  OUTLINED_FUNCTION_0();
  uint64_t v354 = v11;
  MEMORY[0x1F4188790](v12, v13);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_14_0(v14);
  uint64_t v374 = type metadata accessor for Siri_Nlu_External_UserParse();
  OUTLINED_FUNCTION_0();
  uint64_t v339 = v15;
  MEMORY[0x1F4188790](v16, v17);
  OUTLINED_FUNCTION_5_3();
  uint64_t v332 = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  uint64_t v20 = OUTLINED_FUNCTION_41(v19);
  MEMORY[0x1F4188790](v20, v21);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v22, v23);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v24, v25);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v26, v27);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v28, v29);
  OUTLINED_FUNCTION_66();
  uint64_t v344 = v30;
  uint64_t v355 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  OUTLINED_FUNCTION_0();
  uint64_t v351 = v31;
  MEMORY[0x1F4188790](v32, v33);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v34, v35);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v36, v37);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v38, v39);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v40, v41);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v42, v43);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v44, v45);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v46, v47);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v48, v49);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v50, v51);
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_14_0(v52);
  uint64_t v53 = type metadata accessor for Siri_Nlu_External_CorrectionOutcome();
  OUTLINED_FUNCTION_0();
  uint64_t v356 = v54;
  MEMORY[0x1F4188790](v55, v56);
  OUTLINED_FUNCTION_5_3();
  uint64_t v58 = OUTLINED_FUNCTION_14_0(v57);
  uint64_t v59 = type metadata accessor for CorrectionsUSOParse(v58);
  uint64_t v60 = OUTLINED_FUNCTION_41(v59);
  MEMORY[0x1F4188790](v60, v61);
  OUTLINED_FUNCTION_5_3();
  uint64_t v63 = OUTLINED_FUNCTION_14_0(v62);
  uint64_t v366 = type metadata accessor for CorrectionsParse(v63);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x1F4188790](v64, v65);
  OUTLINED_FUNCTION_5_3();
  v371 = (void (*)(void))v66;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
  uint64_t v68 = OUTLINED_FUNCTION_41(v67);
  MEMORY[0x1F4188790](v68, v69);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v70, v71);
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_14_0(v72);
  uint64_t v73 = type metadata accessor for Siri_Nlu_External_CorrectionOutcome.CorrectionType();
  OUTLINED_FUNCTION_0();
  uint64_t v377 = v74;
  MEMORY[0x1F4188790](v75, v76);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x1F4188790](v77, v78);
  OUTLINED_FUNCTION_66();
  uint64_t v349 = v79;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Siri_Nlu_External_CorrectionOutcome.CorrectionType?, Siri_Nlu_External_CorrectionOutcome.CorrectionType?));
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x1F4188790](v81, v82);
  OUTLINED_FUNCTION_53();
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome?);
  uint64_t v84 = OUTLINED_FUNCTION_41(v83);
  MEMORY[0x1F4188790](v84, v85);
  OUTLINED_FUNCTION_22_0();
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  uint64_t v87 = OUTLINED_FUNCTION_41(v86);
  MEMORY[0x1F4188790](v87, v88);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_3_3();
  uint64_t v91 = MEMORY[0x1F4188790](v89, v90);
  uint64_t v93 = &v325[-v92];
  MEMORY[0x1F4188790](v91, v94);
  uint64_t v96 = &v325[-v95];
  uint64_t v363 = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_0();
  uint64_t v365 = v97;
  MEMORY[0x1F4188790](v98, v99);
  OUTLINED_FUNCTION_17();
  uint64_t v102 = v101 - v100;
  uint64_t v369 = *v5;
  uint64_t v373 = v5[1];
  uint64_t v368 = v5[2];
  uint64_t v370 = v5[3];
  uint64_t v359 = v5[4];
  uint64_t v360 = v5[5];
  uint64_t v361 = v5[6];
  uint64_t v362 = v5[7];
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v103 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  outlined init with copy of CorrectionsCustomizing?(v3, v0, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome?);
  OUTLINED_FUNCTION_21_0(v0, 1, v53);
  uint64_t v372 = v102;
  uint64_t v348 = v3;
  uint64_t v347 = v53;
  if (v114)
  {
    outlined destroy of CorrectionsCustomizing?(v0, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome?);
    uint64_t v104 = 1;
  }
  else
  {
    Siri_Nlu_External_CorrectionOutcome.type.getter();
    (*(void (**)(uint64_t, uint64_t))(v356 + 8))(v0, v53);
    uint64_t v104 = 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v96, v104, 1, v73);
  unsigned int v105 = *MEMORY[0x1E4FA2938];
  uint64_t v106 = *(void (**)(uint64_t, void, uint64_t))(v377 + 104);
  v106((uint64_t)v93, *MEMORY[0x1E4FA2938], v73);
  __swift_storeEnumTagSinglePayload((uint64_t)v93, 0, 1, v73);
  uint64_t v107 = (uint64_t)v1 + *(int *)(v80 + 48);
  outlined init with copy of CorrectionsCustomizing?((uint64_t)v96, (uint64_t)v1, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  outlined init with copy of CorrectionsCustomizing?((uint64_t)v93, v107, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  OUTLINED_FUNCTION_18_0((uint64_t)v1);
  uint64_t v108 = v374;
  unsigned int v342 = v105;
  v341 = v106;
  if (v114)
  {
    outlined destroy of CorrectionsCustomizing?((uint64_t)v93, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
    outlined destroy of CorrectionsCustomizing?((uint64_t)v96, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
    OUTLINED_FUNCTION_18_0(v107);
    if (v114)
    {
      outlined destroy of CorrectionsCustomizing?((uint64_t)v1, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
      int v109 = 0;
      uint64_t v110 = 8;
      char v111 = 1;
      OUTLINED_FUNCTION_24();
      uint64_t v112 = v367;
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  uint64_t v113 = v350;
  outlined init with copy of CorrectionsCustomizing?((uint64_t)v1, v350, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  OUTLINED_FUNCTION_18_0(v107);
  if (v114)
  {
    outlined destroy of CorrectionsCustomizing?((uint64_t)v93, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
    uint64_t v115 = OUTLINED_FUNCTION_2_1();
    outlined destroy of CorrectionsCustomizing?(v115, v116);
    (*(void (**)(uint64_t, uint64_t))(v377 + 8))(v113, v73);
LABEL_14:
    outlined destroy of CorrectionsCustomizing?((uint64_t)v1, &demangling cache variable for type metadata for (Siri_Nlu_External_CorrectionOutcome.CorrectionType?, Siri_Nlu_External_CorrectionOutcome.CorrectionType?));
    uint64_t v112 = v367;
    goto LABEL_15;
  }
  uint64_t v136 = v377;
  OUTLINED_FUNCTION_25();
  v137();
  lazy protocol witness table accessor for type Siri_Nlu_External_CorrectionOutcome.CorrectionType and conformance Siri_Nlu_External_CorrectionOutcome.CorrectionType(&lazy protocol witness table cache variable for type Siri_Nlu_External_CorrectionOutcome.CorrectionType and conformance Siri_Nlu_External_CorrectionOutcome.CorrectionType);
  int v326 = dispatch thunk of static Equatable.== infix(_:_:)();
  unint64_t v138 = *(void (**)(void))(v136 + 8);
  OUTLINED_FUNCTION_29();
  v138();
  outlined destroy of CorrectionsCustomizing?((uint64_t)v93, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  outlined destroy of CorrectionsCustomizing?((uint64_t)v96, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  OUTLINED_FUNCTION_29();
  v138();
  uint64_t v108 = v374;
  outlined destroy of CorrectionsCustomizing?((uint64_t)v1, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  uint64_t v112 = v367;
  if (v326)
  {
    int v109 = 0;
    uint64_t v110 = 8;
    char v111 = 1;
    goto LABEL_16;
  }
LABEL_15:
  char v111 = 0;
  uint64_t v110 = 7;
  int v109 = 1;
LABEL_16:
  OUTLINED_FUNCTION_24();
LABEL_17:
  __swift_storeEnumTagSinglePayload((uint64_t)v1, 1, 1, v108);
  uint64_t v117 = (uint64_t)v371;
  outlined init with copy of CorrectionsParse(v112, (uint64_t)v371);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  unint64_t v119 = 0x1EBC69000;
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1)
    {
      if ((v111 & 1) == 0)
      {
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v147 = type metadata accessor for Logger();
        uint64_t v148 = (void *)OUTLINED_FUNCTION_9_0(v147, (uint64_t)static Logger.logger);
        os_log_type_t v149 = static os_log_type_t.debug.getter();
        OUTLINED_FUNCTION_4_3(v149);
        OUTLINED_FUNCTION_58();
        if (v150)
        {
          unint64_t v151 = (_WORD *)OUTLINED_FUNCTION_7_1();
          OUTLINED_FUNCTION_13_0(v151);
          OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v152, v153, "[CorrectionsEngine.checkUndo] this is not nlv4 or uso parse");
          uint64_t v117 = (uint64_t)v371;
          OUTLINED_FUNCTION_1_2();
        }

        if (one-time initialization token for shared != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_1_3();
        OUTLINED_FUNCTION_36();
        OUTLINED_FUNCTION_55();
        v154();
        outlined destroy of CorrectionsCustomizing?((uint64_t)v1, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
        uint64_t v155 = type metadata accessor for UndoAction();
        __swift_storeEnumTagSinglePayload(v364, 1, 1, v155);
        outlined destroy of CorrectionsParse(v117, (void (*)(void))type metadata accessor for CorrectionsParse);
        goto LABEL_147;
      }
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v128 = type metadata accessor for Logger();
      unint64_t v129 = (void *)OUTLINED_FUNCTION_9_0(v128, (uint64_t)static Logger.logger);
      os_log_type_t v130 = static os_log_type_t.debug.getter();
      OUTLINED_FUNCTION_4_3(v130);
      OUTLINED_FUNCTION_63();
      if (v131)
      {
        uint64_t v132 = (_WORD *)OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_13_0(v132);
        OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v133, v134, "[CorrectionsEngine.checkUndo] this is not nlv4 or uso parse, but correction signal is present");
        uint64_t v117 = (uint64_t)v371;
        OUTLINED_FUNCTION_1_2();
      }

      outlined destroy of CorrectionsParse(v117, (void (*)(void))type metadata accessor for CorrectionsParse);
      char v135 = 1;
LABEL_117:
      if (one-time initialization token for parseStoredTime != -1) {
        swift_once();
      }
      uint64_t v231 = __swift_project_value_buffer(v352, (uint64_t)static CorrectionsEngine.parseStoredTime);
      OUTLINED_FUNCTION_19_0();
      uint64_t v232 = v231;
      uint64_t v233 = v353;
      outlined init with copy of CorrectionsCustomizing?(v232, v353, (uint64_t *)&demangling cache variable for type metadata for Date?);
      OUTLINED_FUNCTION_21_0(v233, 1, v110);
      if (v114)
      {
        outlined destroy of CorrectionsCustomizing?(v233, (uint64_t *)&demangling cache variable for type metadata for Date?);
      }
      else
      {
        OUTLINED_FUNCTION_25();
        v234();
        if (*(void *)(v119 + 2064) != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_19_0();
        uint64_t v235 = qword_1EBC69B90;
        if (qword_1EBC69B90)
        {
          uint64_t v236 = static CorrectionsEngine.inverseDirectInvocation;
          uint64_t v237 = qword_1EBC69B98;
          uint64_t v238 = one-time initialization token for context;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v238 != -1) {
            swift_once();
          }
          v239 = (void *)static CorrectionsEngine.context;
          OUTLINED_FUNCTION_19_0();
          uint64_t v240 = v239[1];
          BOOL v241 = v240 == 1 || v373 == 1;
          if (v241
            || ((uint64_t v263 = v239[2], v264 = v239[3], !v240)
             || !v373
             || (*v239 == v369 ? (BOOL v265 = v240 == v373) : (BOOL v265 = 0),
                 v265 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
            && (!v264
             || !v370
             || (v263 == v368 ? (BOOL v266 = v264 == v370) : (BOOL v266 = 0),
                 v266 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
          {
            Date.timeIntervalSinceNow.getter();
            if (v242 >= -30.0)
            {
              if (one-time initialization token for logger != -1) {
                swift_once();
              }
              uint64_t v276 = type metadata accessor for Logger();
              v277 = OUTLINED_FUNCTION_9_0(v276, (uint64_t)static Logger.logger);
              os_log_type_t v278 = static os_log_type_t.debug.getter();
              os_log_type_enabled(v277, v278);
              OUTLINED_FUNCTION_58();
              if (v279)
              {
                v280 = (uint8_t *)OUTLINED_FUNCTION_7_1();
                *(_WORD *)v280 = 0;
                _os_log_impl(&dword_1C9DB7000, v277, v278, "[CorrectionsEngine.checkUndo] undo action being returned", v280, 2u);
                OUTLINED_FUNCTION_1_2();
              }

              if (one-time initialization token for shared != -1) {
                swift_once();
              }
              OUTLINED_FUNCTION_1_3();
              OUTLINED_FUNCTION_55();
              v281();
              OUTLINED_FUNCTION_10_0();
              v282();
              uint64_t v283 = type metadata accessor for UndoAction();
              uint64_t v284 = v364;
              outlined init with take of Siri_Nlu_External_UserParse?(v376, v364 + *(int *)(v283 + 24));
              *(void *)uint64_t v284 = v236;
              *(void *)(v284 + 8) = v235;
              *(void *)(v284 + 16) = v237;
              *(unsigned char *)(v284 + 24) = v135;
              __swift_storeEnumTagSinglePayload(v284, 0, 1, v283);
              goto LABEL_147;
            }
            outlined consume of CorrectionsDirectInvocation?(v236, v235);
            if (one-time initialization token for logger != -1) {
              swift_once();
            }
            uint64_t v243 = type metadata accessor for Logger();
            v244 = (void *)OUTLINED_FUNCTION_9_0(v243, (uint64_t)static Logger.logger);
            os_log_type_t v245 = static os_log_type_t.debug.getter();
            OUTLINED_FUNCTION_4_3(v245);
            OUTLINED_FUNCTION_32();
            if (v246)
            {
              v247 = (_WORD *)OUTLINED_FUNCTION_7_1();
              OUTLINED_FUNCTION_13_0(v247);
              OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v248, v249, "[CorrectionsEngine.checkUndo] undo action has gone stale.");
              OUTLINED_FUNCTION_6_2();
            }

            uint64_t v250 = v364;
            if (one-time initialization token for shared == -1) {
              goto LABEL_167;
            }
          }
          else
          {
            outlined consume of CorrectionsDirectInvocation?(v236, v235);
            if (one-time initialization token for logger != -1) {
              swift_once();
            }
            uint64_t v267 = type metadata accessor for Logger();
            v268 = (void *)OUTLINED_FUNCTION_9_0(v267, (uint64_t)static Logger.logger);
            os_log_type_t v269 = static os_log_type_t.debug.getter();
            OUTLINED_FUNCTION_4_3(v269);
            OUTLINED_FUNCTION_32();
            if (v270)
            {
              v271 = (_WORD *)OUTLINED_FUNCTION_7_1();
              OUTLINED_FUNCTION_13_0(v271);
              OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v272, v273, "[CorrectionsEngine.checkUndo] mismatched context.");
              OUTLINED_FUNCTION_6_2();
            }

            uint64_t v250 = v364;
            if (one-time initialization token for shared == -1) {
              goto LABEL_167;
            }
          }
          swift_once();
LABEL_167:
          OUTLINED_FUNCTION_1_3();
          OUTLINED_FUNCTION_36();
          OUTLINED_FUNCTION_55();
          v274();
          OUTLINED_FUNCTION_10_0();
          v275();
          outlined destroy of CorrectionsCustomizing?(v237, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
          uint64_t v259 = type metadata accessor for UndoAction();
          uint64_t v260 = v250;
          goto LABEL_146;
        }
        (*(void (**)(uint64_t, uint64_t))(v354 + 8))(v357, v110);
      }
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v251 = type metadata accessor for Logger();
      v252 = (void *)OUTLINED_FUNCTION_9_0(v251, (uint64_t)static Logger.logger);
      os_log_type_t v253 = static os_log_type_t.debug.getter();
      OUTLINED_FUNCTION_4_3(v253);
      OUTLINED_FUNCTION_58();
      if (v254)
      {
        v255 = (_WORD *)OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_13_0(v255);
        OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v256, v257, "[CorrectionsEngine.checkUndo] nothing to undo.");
        OUTLINED_FUNCTION_6_2();
      }

      if (one-time initialization token for shared == -1)
      {
LABEL_145:
        OUTLINED_FUNCTION_1_3();
        OUTLINED_FUNCTION_36();
        OUTLINED_FUNCTION_55();
        v258();
        outlined destroy of CorrectionsCustomizing?((uint64_t)v1, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
        uint64_t v259 = type metadata accessor for UndoAction();
        uint64_t v260 = v364;
LABEL_146:
        __swift_storeEnumTagSinglePayload(v260, 1, 1, v259);
LABEL_147:
        id v261 = (id)static Logger.log;
        static os_signpost_type_t.end.getter();
        os_signpost(_:dso:log:name:signpostID:)();

        OUTLINED_FUNCTION_12_0();
        v262();
        OUTLINED_FUNCTION_39();
        return;
      }
LABEL_188:
      swift_once();
      goto LABEL_145;
    }
    self;
    uint64_t v120 = swift_dynamicCastObjCClass();
    self;
    if (swift_dynamicCastObjCClass() || v120)
    {
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v156 = type metadata accessor for Logger();
      uint64_t v157 = (void *)OUTLINED_FUNCTION_9_0(v156, (uint64_t)static Logger.logger);
      os_log_type_t v158 = static os_log_type_t.debug.getter();
      if (OUTLINED_FUNCTION_35(v158))
      {
        uint64_t v1 = (void (*)(void))OUTLINED_FUNCTION_7_1();
        *(_WORD *)uint64_t v1 = 0;
        OUTLINED_FUNCTION_59(&dword_1C9DB7000, v159, v160, "[CorrectionsEngine.checkUndo] undo request detected in NLv4");
        OUTLINED_FUNCTION_24();
        OUTLINED_FUNCTION_1_2();
        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
      }
      char v135 = 1;
      OUTLINED_FUNCTION_63();
      goto LABEL_117;
    }
    swift_unknownObjectRelease();
LABEL_97:
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v216 = type metadata accessor for Logger();
    v217 = (void *)OUTLINED_FUNCTION_9_0(v216, (uint64_t)static Logger.logger);
    os_log_type_t v218 = static os_log_type_t.debug.getter();
    OUTLINED_FUNCTION_4_3(v218);
    OUTLINED_FUNCTION_58();
    if (v219)
    {
      v220 = (_WORD *)OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_13_0(v220);
      OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v221, v222, "[CorrectionsEngine.checkUndo] undo was not requested");
      OUTLINED_FUNCTION_6_2();
    }

    if (one-time initialization token for shared == -1) {
      goto LABEL_145;
    }
    goto LABEL_188;
  }
  outlined init with take of CorrectionsUSOParse(v117, v375);
  OUTLINED_FUNCTION_21_0(v348, 1, v347);
  if (v114)
  {
    Siri_Nlu_External_UserParse.correctionOutcome.getter();
    Siri_Nlu_External_CorrectionOutcome.type.getter();
    OUTLINED_FUNCTION_12_0();
    v121();
    v341(v343, v342, v73);
    lazy protocol witness table accessor for type Siri_Nlu_External_CorrectionOutcome.CorrectionType and conformance Siri_Nlu_External_CorrectionOutcome.CorrectionType(&lazy protocol witness table cache variable for type Siri_Nlu_External_CorrectionOutcome.CorrectionType and conformance Siri_Nlu_External_CorrectionOutcome.CorrectionType);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    unint64_t v122 = (void (*)(void))v380;
    char v123 = v378;
    uint64_t v124 = *(void (**)(void))(v377 + 8);
    unint64_t v119 = 0x1EBC69000;
    OUTLINED_FUNCTION_20_0();
    v124();
    OUTLINED_FUNCTION_20_0();
    v124();
    if (v122 != v123) {
      goto LABEL_34;
    }
LABEL_24:
    char v125 = 1;
    uint64_t v126 = v372;
    uint64_t v127 = v355;
    goto LABEL_37;
  }
  if (!v109) {
    goto LABEL_24;
  }
LABEL_34:
  OUTLINED_FUNCTION_28();
  uint64_t v139 = v344;
  specialized Collection.first.getter(v140, v344);
  swift_bridgeObjectRelease();
  uint64_t v127 = v355;
  OUTLINED_FUNCTION_21_0(v139, 1, v355);
  uint64_t v126 = v372;
  if (v114)
  {
    outlined destroy of CorrectionsCustomizing?(v139, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
    char v125 = 0;
LABEL_37:
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v141 = type metadata accessor for Logger();
    Swift::Int v142 = (void *)OUTLINED_FUNCTION_9_0(v141, (uint64_t)static Logger.logger);
    os_log_type_t v143 = static os_log_type_t.debug.getter();
    if (OUTLINED_FUNCTION_4_3(v143))
    {
      unint64_t v144 = (_WORD *)OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_13_0(v144);
      OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v145, v146, "[CorrectionsEngine.checkUndo] Corrections signal detected");
      OUTLINED_FUNCTION_6_2();
    }

    if ((v125 & 1) == 0) {
      goto LABEL_96;
    }
    goto LABEL_42;
  }
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_25();
  v161();
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v162 = type metadata accessor for Logger();
  uint64_t v163 = (void *)OUTLINED_FUNCTION_9_0(v162, (uint64_t)static Logger.logger);
  os_log_type_t v164 = static os_log_type_t.debug.getter();
  if (OUTLINED_FUNCTION_4_3(v164))
  {
    int64_t v165 = (_WORD *)OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_13_0(v165);
    OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v166, v167, "[CorrectionsEngine.checkUndo] Corrections signal not detected, falling back to using user dialog acts.");
    OUTLINED_FUNCTION_1_2();
  }

  if ((Siri_Nlu_External_UserDialogAct.hasRejected.getter() & 1) == 0)
  {
    if (Siri_Nlu_External_UserDialogAct.hasCancelled.getter())
    {
      int v168 = 2;
      goto LABEL_66;
    }
    char v213 = Siri_Nlu_External_UserDialogAct.hasWantedToUndo.getter();
    uint64_t v214 = OUTLINED_FUNCTION_30();
    v215(v214);
    if ((v213 & 1) == 0)
    {
LABEL_96:
      outlined destroy of CorrectionsParse(v375, (void (*)(void))type metadata accessor for CorrectionsUSOParse);
      goto LABEL_97;
    }
LABEL_42:
    LODWORD(v377) = 8;
    goto LABEL_67;
  }
  int v168 = 1;
LABEL_66:
  LODWORD(v377) = v168;
  uint64_t v169 = OUTLINED_FUNCTION_30();
  v170(v169);
LABEL_67:
  uint64_t v171 = v345;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v172 = type metadata accessor for Logger();
  __swift_project_value_buffer(v172, (uint64_t)static Logger.logger);
  int64_t v173 = Logger.logObject.getter();
  os_log_type_t v174 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v173, v174))
  {
    uint64_t v175 = (uint8_t *)OUTLINED_FUNCTION_7_1();
    *(_WORD *)uint64_t v175 = 0;
    _os_log_impl(&dword_1C9DB7000, v173, v174, "[CorrectionsEngine.checkUndo] undo request detected in uso", v175, 2u);
    OUTLINED_FUNCTION_1_2();
  }

  OUTLINED_FUNCTION_28();
  specialized Collection.first.getter(v176, v171);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_0(v171);
  if (v114)
  {
    outlined destroy of CorrectionsCustomizing?(v171, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
    goto LABEL_85;
  }
  uint64_t v177 = v127;
  uint64_t v178 = v126;
  uint64_t v179 = v351;
  uint64_t v180 = v346;
  OUTLINED_FUNCTION_25();
  v181();
  char v182 = Siri_Nlu_External_UserDialogAct.hasRejected.getter();
  long long v183 = *(void (**)(uint64_t, uint64_t, uint64_t))(v179 + 16);
  v183(v335, v180, v177);
  if (v182) {
    char v184 = 1;
  }
  else {
    char v184 = Siri_Nlu_External_UserDialogAct.hasCancelled.getter();
  }
  uint64_t v110 = v351 + 8;
  uint64_t v1 = *(void (**)(void))(v351 + 8);
  uint64_t v185 = v355;
  OUTLINED_FUNCTION_50();
  v1();
  v183(v336, v346, v185);
  if (v184)
  {
    OUTLINED_FUNCTION_50();
    v1();
    uint64_t v126 = v178;
    goto LABEL_80;
  }
  char v186 = Siri_Nlu_External_UserDialogAct.hasWantedToUndo.getter();
  OUTLINED_FUNCTION_50();
  v1();
  uint64_t v126 = v178;
  if (v186)
  {
LABEL_80:
    OUTLINED_FUNCTION_28();
    uint64_t v188 = *(void *)(v187 + 16);
    swift_bridgeObjectRelease();
    if (v188 == 1)
    {
      int64_t v189 = (void *)Logger.logObject.getter();
      os_log_type_t v190 = static os_log_type_t.debug.getter();
      unint64_t v119 = 0x1EBC69000;
      if (OUTLINED_FUNCTION_4_3(v190))
      {
        unint64_t v191 = (_WORD *)OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_13_0(v191);
        OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v192, v193, "[CorrectionsEngine.checkUndo] undo action parseExludingUndoUserDialogActs won't be set");
        OUTLINED_FUNCTION_6_2();
      }

      OUTLINED_FUNCTION_20_0();
      v1();
      outlined destroy of CorrectionsParse(v375, (void (*)(void))type metadata accessor for CorrectionsUSOParse);
      char v135 = 1;
      OUTLINED_FUNCTION_24();
      goto LABEL_116;
    }
  }
  uint64_t v127 = v355;
  OUTLINED_FUNCTION_20_0();
  v1();
  unint64_t v119 = 0x1EBC69000;
LABEL_85:
  OUTLINED_FUNCTION_28();
  uint64_t v194 = v340;
  specialized Collection.first.getter(v195, v340);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_0(v194);
  if (v114)
  {
    outlined destroy of CorrectionsCustomizing?(v194, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  }
  else
  {
    uint64_t v196 = v127;
    uint64_t v197 = v126;
    uint64_t v198 = v351;
    uint64_t v199 = v338;
    OUTLINED_FUNCTION_25();
    v200();
    char v201 = Siri_Nlu_External_UserDialogAct.hasRejected.getter();
    uint64_t v202 = *(void (**)(uint64_t, uint64_t, uint64_t))(v198 + 16);
    v202(v333, v199, v196);
    if (v201) {
      char v203 = 1;
    }
    else {
      char v203 = Siri_Nlu_External_UserDialogAct.hasCancelled.getter();
    }
    uint64_t v204 = v334;
    uint64_t v110 = *(void *)(v351 + 8);
    uint64_t v205 = v355;
    OUTLINED_FUNCTION_17_0();
    ((void (*)(void))v110)();
    v202(v204, v199, v205);
    if (v203)
    {
      OUTLINED_FUNCTION_17_0();
      ((void (*)(void))v110)();
      uint64_t v206 = v197;
LABEL_94:
      uint64_t v208 = v339;
      uint64_t v209 = v332;
      uint64_t v210 = v374;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v339 + 16))(v332, v375, v374);
      v211 = (void (*)(long long *, void))Siri_Nlu_External_UserParse.userDialogActs.modify();
      uint64_t v1 = (void (*)(void))v206;
      specialized RangeReplaceableCollection.removeFirst()(v331);
      OUTLINED_FUNCTION_17_0();
      ((void (*)(void))v110)();
      v211(&v380, 0);
      OUTLINED_FUNCTION_17_0();
      ((void (*)(void))v110)();
      uint64_t v212 = outlined destroy of CorrectionsParse(v375, (void (*)(void))type metadata accessor for CorrectionsUSOParse);
      OUTLINED_FUNCTION_27(v212, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v208 + 32))(v206, v209, v210);
      __swift_storeEnumTagSinglePayload(v206, 0, 1, v210);
      char v135 = 0;
      OUTLINED_FUNCTION_63();
      unint64_t v119 = 0x1EBC69000;
      goto LABEL_117;
    }
    char v207 = Siri_Nlu_External_UserDialogAct.hasWantedToUndo.getter();
    OUTLINED_FUNCTION_17_0();
    ((void (*)(void))v110)();
    uint64_t v206 = v197;
    if (v207) {
      goto LABEL_94;
    }
    OUTLINED_FUNCTION_17_0();
    ((void (*)(void))v110)();
    unint64_t v119 = 0x1EBC69000uLL;
  }
  if (*(void *)(v119 + 2064) != -1) {
    swift_once();
  }
  uint64_t v223 = OUTLINED_FUNCTION_19_0();
  uint64_t v1 = (void (*)(void))qword_1EBC69B90;
  if (!qword_1EBC69B90
    || (uint64_t v224 = static CorrectionsEngine.inverseDirectInvocation,
        uint64_t v225 = qword_1EBC69B98,
        static CorrectionsEngine.inverseDirectInvocation == 0xD000000000000024)
    && qword_1EBC69B90 == 0x80000001C9DD08A0
    || (OUTLINED_FUNCTION_57(), uint64_t v223 = _stringCompareWithSmolCheck(_:_:expecting:)(), (v223 & 1) != 0))
  {
    OUTLINED_FUNCTION_27(v223, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
LABEL_111:
    char v226 = 0;
    char v227 = 0;
LABEL_112:
    uint64_t v228 = v337;
    goto LABEL_113;
  }
  type metadata accessor for CorrectionsEngine();
  *(void *)&long long v380 = v224;
  *((void *)&v380 + 1) = v1;
  uint64_t v381 = v225;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (static CorrectionsEngine.isCrossAlarmTimerDomain(invocation:incomingParse:)())
  {
    uint64_t v285 = v376;
    outlined destroy of CorrectionsCustomizing?(v376, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    uint64_t v286 = OUTLINED_FUNCTION_57();
    uint64_t v1 = (void (*)(void))v285;
    outlined consume of CorrectionsDirectInvocation?(v286, v287);
    goto LABEL_111;
  }
  OUTLINED_FUNCTION_28();
  uint64_t v289 = *(void *)(v288 + 16);
  swift_bridgeObjectRelease();
  if (v289 == 1)
  {
    OUTLINED_FUNCTION_28();
    uint64_t v290 = v330;
    specialized Collection.first.getter(v291, v330);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_21_0(v290, 1, v355);
    if (v114)
    {
      outlined destroy of CorrectionsCustomizing?(v290, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
    }
    else
    {
      OUTLINED_FUNCTION_38();
      uint64_t v292 = v329;
      OUTLINED_FUNCTION_25();
      v293();
      unint64_t v294 = static CorrectionsEngine.tasks(from:)(v292);
      unint64_t v295 = v294;
      if (v294 >> 62)
      {
        if (_CocoaArrayWrapper.endIndex.getter())
        {
LABEL_183:
          if ((v295 & 0xC000000000000001) != 0)
          {
            MEMORY[0x1CB78E9C0](0, v295);
          }
          else
          {
            if (!*(void *)((v295 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_224;
            }
            swift_retain();
          }
          swift_bridgeObjectRelease();
          if (one-time initialization token for deleteVerbStrings == -1)
          {
LABEL_187:
            v296 = (void *)static CorrectionsConstants.deleteVerbStrings;
            swift_bridgeObjectRetain();
            uint64_t v297 = UsoTask.verbString.getter();
            char v227 = specialized Sequence<>.contains(_:)(v297, v298, v296);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_release();
            uint64_t v299 = OUTLINED_FUNCTION_23();
            v300(v299);
            unint64_t v119 = 0x1EBC69000;
            goto LABEL_194;
          }
LABEL_224:
          swift_once();
          goto LABEL_187;
        }
      }
      else if (*(void *)((v294 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_183;
      }
      swift_bridgeObjectRelease();
      uint64_t v301 = OUTLINED_FUNCTION_23();
      v302(v301);
    }
  }
  char v227 = 0;
LABEL_194:
  if (!v225)
  {
    uint64_t v311 = OUTLINED_FUNCTION_57();
    uint64_t v313 = outlined consume of CorrectionsDirectInvocation?(v311, v312);
    OUTLINED_FUNCTION_27(v313, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    char v226 = 0;
    goto LABEL_112;
  }
  swift_bridgeObjectRetain();
  uint64_t v303 = OUTLINED_FUNCTION_57();
  outlined consume of CorrectionsDirectInvocation?(v303, v304);
  specialized Dictionary.subscript.getter(1651664246, 0xE400000000000000, v225, &v380);
  swift_bridgeObjectRelease();
  if (!v382)
  {
    outlined destroy of CorrectionsCustomizing?((uint64_t)&v380, &demangling cache variable for type metadata for Any?);
    goto LABEL_202;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_202:
    OUTLINED_FUNCTION_24();
    uint64_t v228 = v337;
    outlined destroy of CorrectionsCustomizing?((uint64_t)v1, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    char v226 = 0;
LABEL_113:
    uint64_t v229 = v375;
    uint64_t v230 = v374;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v339 + 16))(v228, v375, v374);
    outlined destroy of CorrectionsParse(v229, (void (*)(void))type metadata accessor for CorrectionsUSOParse);
    __swift_storeEnumTagSinglePayload(v228, 0, 1, v230);
    outlined init with take of Siri_Nlu_External_UserParse?(v228, (uint64_t)v1);
    uint64_t v110 = 7;
    if (v227 & 1) != 0 || (v226) {
      goto LABEL_97;
    }
    char v135 = 0;
LABEL_116:
    OUTLINED_FUNCTION_63();
    goto LABEL_117;
  }
  uint64_t v1 = v378;
  uint64_t v305 = v379;
  OUTLINED_FUNCTION_28();
  uint64_t v306 = v328;
  specialized Collection.first.getter(v307, v328);
  swift_bridgeObjectRelease();
  uint64_t v308 = OUTLINED_FUNCTION_21_0(v306, 1, v355);
  if (v114)
  {
    OUTLINED_FUNCTION_27(v308, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    swift_bridgeObjectRelease();
    v309 = &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?;
    uint64_t v310 = v306;
LABEL_228:
    outlined destroy of CorrectionsCustomizing?(v310, v309);
    char v226 = 0;
    goto LABEL_112;
  }
  v371 = (void (*)(void))v305;
  v314 = v1;
  OUTLINED_FUNCTION_38();
  uint64_t v1 = v327;
  OUTLINED_FUNCTION_25();
  v315();
  unint64_t v316 = static CorrectionsEngine.tasks(from:)((uint64_t)v1);
  unint64_t v317 = v316;
  if (!(v316 >> 62))
  {
    if (*(void *)((v316 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_205;
    }
LABEL_226:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_0();
    v324();
    OUTLINED_FUNCTION_24();
    goto LABEL_227;
  }
  if (!_CocoaArrayWrapper.endIndex.getter()) {
    goto LABEL_226;
  }
LABEL_205:
  if ((v317 & 0xC000000000000001) != 0)
  {
    MEMORY[0x1CB78E9C0](0, v317);
LABEL_208:
    swift_bridgeObjectRelease();
    uint64_t v1 = v371;
    if (v314 == (void (*)(void))0x6574656C6564 && v371 == (void (*)(void))0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_24();
    }
    else
    {
      char v319 = OUTLINED_FUNCTION_34();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_24();
      if ((v319 & 1) == 0)
      {
        swift_release();
        OUTLINED_FUNCTION_10_0();
        v320();
        v309 = &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?;
LABEL_227:
        uint64_t v310 = (uint64_t)v1;
        goto LABEL_228;
      }
    }
    if (UsoTask.verbString.getter() == 0x657461647075 && v321 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      char v226 = 1;
    }
    else
    {
      char v226 = OUTLINED_FUNCTION_34();
      swift_bridgeObjectRelease();
    }
    swift_release();
    OUTLINED_FUNCTION_12_0();
    v323();
    outlined destroy of CorrectionsCustomizing?((uint64_t)v1, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    goto LABEL_112;
  }
  if (*(void *)((v317 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
    goto LABEL_208;
  }
  __break(1u);
}

uint64_t specialized RangeReplaceableCollection.removeFirst()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  uint64_t result = MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  if (!*(void *)(*v1 + 16))
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  specialized Collection.first.getter(*v1, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  if (result != 1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, v7, v9);
    if (*(void *)(v8 + 16)) {
      return specialized Array.replaceSubrange<A>(_:with:)(0, 1);
    }
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t UndoAction.init(directInvocation:isExclusive:parseExludingUndoUserDialogActs:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(void *)(a4 + 16) = v6;
  *(unsigned char *)(a4 + 24) = a2;
  uint64_t v7 = a4 + *(int *)(type metadata accessor for UndoAction() + 24);
  return outlined init with take of Siri_Nlu_External_UserParse?(a3, v7);
}

Swift::Bool __swiftcall CorrectionsEngine.isUndoPossible(context:)(SiriCorrections::CorrectionsContext_optional *context)
{
  OUTLINED_FUNCTION_37();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x1F4188790](v5, v6);
  OUTLINED_FUNCTION_17();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for Date();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13, v14);
  OUTLINED_FUNCTION_22_0();
  uint64_t v16 = *v3;
  uint64_t v15 = v3[1];
  uint64_t v18 = v3[2];
  uint64_t v17 = v3[3];
  if (one-time initialization token for parseStoredTime != -1) {
    swift_once();
  }
  uint64_t v19 = __swift_project_value_buffer(v4, (uint64_t)static CorrectionsEngine.parseStoredTime);
  OUTLINED_FUNCTION_19_0();
  outlined init with copy of CorrectionsCustomizing?(v19, v9, (uint64_t *)&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_21_0(v9, 1, v10);
  if (v40)
  {
    outlined destroy of CorrectionsCustomizing?(v9, (uint64_t *)&demangling cache variable for type metadata for Date?);
  }
  else
  {
    OUTLINED_FUNCTION_25();
    v20();
    if (one-time initialization token for inverseDirectInvocation != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_19_0();
    if (qword_1EBC69B90)
    {
      Date.timeIntervalSinceNow.getter();
      if (v21 < -30.0)
      {
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v22 = type metadata accessor for Logger();
        uint64_t v23 = (void *)OUTLINED_FUNCTION_9_0(v22, (uint64_t)static Logger.logger);
        os_log_type_t v24 = static os_log_type_t.debug.getter();
        if (!OUTLINED_FUNCTION_35(v24)) {
          goto LABEL_15;
        }
        *(_WORD *)OUTLINED_FUNCTION_7_1() = 0;
        uint64_t v27 = "[CorrectionsEngine.isUndoPossible] undo action has gone stale.";
LABEL_14:
        OUTLINED_FUNCTION_59(&dword_1C9DB7000, v25, v26, v27);
        OUTLINED_FUNCTION_1_2();
LABEL_15:

        OUTLINED_FUNCTION_29();
        v28();
        goto LABEL_22;
      }
      if (v15 == 1) {
        goto LABEL_27;
      }
      if (one-time initialization token for context != -1) {
        swift_once();
      }
      uint64_t v36 = (void *)static CorrectionsEngine.context;
      OUTLINED_FUNCTION_19_0();
      uint64_t v37 = v36[1];
      if (v37 == 1)
      {
LABEL_27:
        OUTLINED_FUNCTION_29();
        v38();
        goto LABEL_22;
      }
      uint64_t v39 = v36[3];
      if (v39)
      {
        if (!v17) {
          goto LABEL_47;
        }
        BOOL v40 = v36[2] == v18 && v39 == v17;
        if (!v40)
        {
          if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
            goto LABEL_47;
          }
          uint64_t v37 = v36[1];
          if (v37 == 1) {
            goto LABEL_46;
          }
        }
      }
      else if (v17)
      {
        goto LABEL_47;
      }
      if (v37)
      {
        if (v15)
        {
          BOOL v41 = *v36 == v16 && v37 == v15;
          if (v41 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            goto LABEL_27;
          }
        }
        goto LABEL_47;
      }
LABEL_46:
      swift_bridgeObjectRelease();
      if (!v15) {
        goto LABEL_27;
      }
LABEL_47:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v42 = type metadata accessor for Logger();
      uint64_t v23 = (void *)OUTLINED_FUNCTION_9_0(v42, (uint64_t)static Logger.logger);
      os_log_type_t v43 = static os_log_type_t.debug.getter();
      if (!OUTLINED_FUNCTION_35(v43)) {
        goto LABEL_15;
      }
      *(_WORD *)OUTLINED_FUNCTION_7_1() = 0;
      uint64_t v27 = "[CorrectionsEngine.isUndoPossible] Correction is not possible with the given context.";
      goto LABEL_14;
    }
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v10);
  }
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v29 = type metadata accessor for Logger();
  uint64_t v30 = (void *)OUTLINED_FUNCTION_9_0(v29, (uint64_t)static Logger.logger);
  os_log_type_t v31 = static os_log_type_t.debug.getter();
  if (OUTLINED_FUNCTION_4_3(v31))
  {
    uint64_t v32 = (_WORD *)OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_13_0(v32);
    OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v33, v34, "[CorrectionsEngine.isUndoPossible] nothing to undo.");
    OUTLINED_FUNCTION_6_2();
  }

LABEL_22:
  OUTLINED_FUNCTION_39();
  return result;
}

Swift::Void __swiftcall CorrectionsEngine.commit()()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_9_0(v0, (uint64_t)static Logger.logger);
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (OUTLINED_FUNCTION_4_3(v2))
  {
    uint64_t v3 = (_WORD *)OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_13_0(v3);
    OUTLINED_FUNCTION_2_3(&dword_1C9DB7000, v4, v5, "[CorrectionsEngine.commit] clearing corrections context");
    OUTLINED_FUNCTION_6_2();
  }

  if (one-time initialization token for inverseDirectInvocation != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_48();
  uint64_t v6 = static CorrectionsEngine.inverseDirectInvocation;
  uint64_t v7 = qword_1EBC69B90;
  qword_1EBC69B90 = 0;
  qword_1EBC69B98 = 0;
  static CorrectionsEngine.inverseDirectInvocation = 0;
  outlined consume of CorrectionsDirectInvocation?(v6, v7);
  if (one-time initialization token for context != -1) {
    swift_once();
  }
  uint64_t v8 = static CorrectionsEngine.context;
  OUTLINED_FUNCTION_48();
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  *(_OWORD *)uint64_t v8 = xmmword_1C9DD0190;
  *(_OWORD *)(v8 + 16) = 0u;
  *(_OWORD *)(v8 + 32) = 0u;
  *(_OWORD *)(v8 + 48) = 0u;
  outlined consume of CorrectionsContext?(v9, v10);
}

uint64_t CorrectionsEngine.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CorrectionsEngine.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t protocol witness for Corrections.checkCorrection(input:) in conformance CorrectionsEngine()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 104))();
}

uint64_t protocol witness for Corrections.setUndoInvocation(directInvocation:context:) in conformance CorrectionsEngine()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t protocol witness for Corrections.checkUndo(input:context:correctionsOutcome:) in conformance CorrectionsEngine()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

uint64_t UndoAction.directInvocation.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t UndoAction.isExclusive.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t UndoAction.parseExludingUndoUserDialogActs.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UndoAction();
  return outlined init with copy of CorrectionsCustomizing?(v1 + *(int *)(v3 + 24), a1, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
}

uint64_t UndoAction.init(directInvocation:isExclusive:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(void *)(a3 + 16) = v4;
  *(unsigned char *)(a3 + 24) = a2;
  uint64_t v5 = a3 + *(int *)(type metadata accessor for UndoAction() + 24);
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserParse();
  return __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, uint64_t a4)
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
        goto LABEL_24;
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
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Siri_Nlu_External_UserDialogAct>);
  uint64_t v10 = *(void *)(type metadata accessor for Siri_Nlu_External_UserDialogAct() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for Siri_Nlu_External_UserDialogAct() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v18, a4);
  }
  return (uint64_t)v13;
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
    uint64_t v8 = *(void *)(type metadata accessor for Siri_Nlu_External_UserDialogAct() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
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
    uint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
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
    uint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
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
    uint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
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

uint64_t specialized UnsafeMutablePointer.moveInitialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return MEMORY[0x1F4186420](v8, v9, v10, v7);
  }
  if (a3 < a1
    || (uint64_t result = type metadata accessor for Siri_Nlu_External_UserDialogAct(),
        a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
    return MEMORY[0x1F4186428](a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return MEMORY[0x1F4186420](v8, v9, v10, v7);
  }
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
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

{
  uint64_t v3;

  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

uint64_t specialized UnsafeMutablePointer.initialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    type metadata accessor for UsoEntity();
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

{
  BOOL v3;
  uint64_t result;
  uint64_t vars8;

  if (a2 < 0 || (a3 + 40 * a2 > a1 ? (BOOL v3 = a1 + 40 * a2 > a3) : (BOOL v3 = 0), v3))
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

uint64_t specialized Array.replaceSubrange<A>(_:with:)(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(type metadata accessor for Siri_Nlu_External_UserDialogAct() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  unint64_t v15 = v13 + v14 * v6;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v16 = *(void *)(v4 + 16);
  if (__OFSUB__(v16, a2)) {
    goto LABEL_22;
  }
  uint64_t result = specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13 + v14 * a2, v16 - a2, v15);
  uint64_t v17 = *(void *)(v4 + 16);
  BOOL v18 = __OFADD__(v17, v8);
  uint64_t v19 = v17 - v7;
  if (!v18)
  {
    *(void *)(v4 + 16) = v19;
LABEL_16:
    *uint64_t v2 = v4;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t specialized Array.replaceSubrange<A>(_:with:)(uint64_t result, int64_t a2, uint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  int64_t v5 = *v3;
  int64_t v6 = *((void *)*v3 + 2);
  if (v6 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v7 = result;
  int64_t v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v10 > *((void *)v5 + 3) >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    int64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v13, 1, (uint64_t)v5);
  }
  uint64_t v14 = (uint64_t)&v5[40 * v7 + 32];
  uint64_t result = swift_arrayDestroy();
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v15 = *((void *)v5 + 2);
  if (__OFSUB__(v15, a2)) {
    goto LABEL_22;
  }
  uint64_t result = (uint64_t)specialized UnsafeMutablePointer.moveInitialize(from:count:)(&v5[40 * a2 + 32], v15 - a2, (char *)(v14 + 40));
  uint64_t v16 = *((void *)v5 + 2);
  BOOL v17 = __OFADD__(v16, v9);
  uint64_t v18 = v16 + v9;
  if (!v17)
  {
    *((void *)v5 + 2) = v18;
LABEL_16:
    long long v19 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)uint64_t v14 = *(_OWORD *)a3;
    *(_OWORD *)(v14 + 16) = v19;
    *(unsigned char *)(v14 + 32) = *(unsigned char *)(a3 + 32);
    *BOOL v3 = v5;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

unint64_t specialized Array._checkSubscript(_:wasNativeTypeChecked:)(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
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
    int64_t v10 = (void *)(v9 + 16 * v6);
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

void (*specialized protocol witness for Collection.subscript.read in conformance [A](uint64_t **a1, unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

void protocol witness for Collection.subscript.read in conformance [A]specialized (void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*specialized Array.subscript.read(uint64_t *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = a3 & 0xC000000000000001;
  specialized Array._checkSubscript(_:wasNativeTypeChecked:)(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    uint64_t v7 = MEMORY[0x1CB78E9C0](a2, a3);
  }
  else {
    uint64_t v7 = swift_retain();
  }
  *a1 = v7;
  return Array.subscript.readspecialized ;
}

uint64_t Array.subscript.readspecialized ()
{
  return swift_release();
}

uint64_t specialized Array._copyContents(initializing:)(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          lazy protocol witness table accessor for type [UsoEntity] and conformance [A]();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoEntity]);
            int64_t v10 = specialized protocol witness for Collection.subscript.read in conformance [A](v13, i, a3);
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t **, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        specialized UnsafeMutablePointer.initialize(from:count:)((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [UsoEntity] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [UsoEntity] and conformance [A];
  if (!lazy protocol witness table cache variable for type [UsoEntity] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UsoEntity]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UsoEntity] and conformance [A]);
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

uint64_t outlined init with take of CorrectionsCustomizing(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined consume of CorrectionsDirectInvocation?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined consume of CorrectionsContext?(uint64_t a1, uint64_t a2)
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

uint64_t outlined init with copy of CorrectionsParse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CorrectionsParse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for UndoAction()
{
  uint64_t result = type metadata singleton initialization cache for UndoAction;
  if (!type metadata singleton initialization cache for UndoAction) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t outlined init with take of Siri_Nlu_External_UserParse?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of CorrectionsUSOParse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CorrectionsUSOParse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CorrectionsParse(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12_0();
  v3();
  return a1;
}

uint64_t outlined destroy of CorrectionsCustomizing?(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12_0();
  v3();
  return a1;
}

uint64_t lazy protocol witness table accessor for type Siri_Nlu_External_CorrectionOutcome.CorrectionType and conformance Siri_Nlu_External_CorrectionOutcome.CorrectionType(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Siri_Nlu_External_CorrectionOutcome.CorrectionType();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with copy of CorrectionsCustomizing?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = OUTLINED_FUNCTION_2_1();
  v5(v4);
  return a2;
}

uint64_t method lookup function for CorrectionsEngine(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CorrectionsEngine);
}

uint64_t dispatch thunk of static CorrectionsEngine.shared()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CorrectionsEngine.checkCorrection(input:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of CorrectionsEngine.checkCorrection(input:customizations:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of CorrectionsEngine.setUndoInvocation(directInvocation:context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CorrectionsEngine.checkUndo(input:context:correctionsOutcome:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of CorrectionsEngine.isUndoPossible(context:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of CorrectionsEngine.commit()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

void *initializeBufferWithCopyOfBuffer for UndoAction(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  long long v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *long long v3 = *a2;
    long long v3 = (void *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserParse();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
      memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for UndoAction(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UserParse();
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for UndoAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = type metadata accessor for Siri_Nlu_External_UserParse();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for UndoAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserParse();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for UndoAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for Siri_Nlu_External_UserParse();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for UndoAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserParse();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for UndoAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C9DCD0CC);
}

uint64_t sub_1C9DCD0CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for UndoAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C9DCD16C);
}

uint64_t sub_1C9DCD16C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void type metadata completion function for UndoAction()
{
  type metadata accessor for Siri_Nlu_External_UserParse?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for Siri_Nlu_External_UserParse?()
{
  if (!lazy cache variable for type metadata for Siri_Nlu_External_UserParse?)
  {
    type metadata accessor for Siri_Nlu_External_UserParse();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Siri_Nlu_External_UserParse?);
    }
  }
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

void *assignWithCopy for ModifiedNode(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *type metadata accessor for ModifiedNode()
{
  return &unk_1F241A460;
}

uint64_t destroy for CorrectionCandidateTask()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CorrectionCandidateTask(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CorrectionCandidateTask(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for CorrectionCandidateTask(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionCandidateTask(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CorrectionCandidateTask(uint64_t result, int a2, int a3)
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

void *type metadata accessor for CorrectionCandidateTask()
{
  return &unk_1F241A4E0;
}

void OUTLINED_FUNCTION_1_3()
{
  uint64_t v1 = *(void *)(v0 - 288);
  *(void *)(v0 - 152) = *(void *)(v0 - 320);
  *(void *)(v0 - 144) = v1;
  uint64_t v2 = *(void *)(v0 - 312);
  *(void *)(v0 - 136) = *(void *)(v0 - 328);
  *(void *)(v0 - 128) = v2;
  uint64_t v3 = *(void *)(v0 - 392);
  *(void *)(v0 - 120) = *(void *)(v0 - 400);
  *(void *)(v0 - 112) = v3;
  uint64_t v4 = *(void *)(v0 - 376);
  *(void *)(v0 - 104) = *(void *)(v0 - 384);
  *(void *)(v0 - 96) = v4;
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_3_3()
{
  *(void *)(v1 - 256) = v0;
}

BOOL OUTLINED_FUNCTION_4_3(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_6_2()
{
  JUMPOUT(0x1CB78F000);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return Logger.logObject.getter();
}

_WORD *OUTLINED_FUNCTION_13_0(_WORD *result)
{
  *__n128 result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_14_0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_21_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return *(void *)(v0 - 656);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(v2 - 264);
  return outlined destroy of CorrectionsCustomizing?(v4, a2);
}

void OUTLINED_FUNCTION_28()
{
  JUMPOUT(0x1CB78E470);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

BOOL OUTLINED_FUNCTION_35(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1)
{
  return a1 - 8;
}

void OUTLINED_FUNCTION_44(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)(v1 - 416) = a1 + 16;
  *(void *)(v1 - 432) = v2;
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease();
}

void (*OUTLINED_FUNCTION_47())(void *a1)
{
  return specialized protocol witness for Collection.subscript.read in conformance [A]((uint64_t **)(v2 - 240), v1, v0);
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_beginAccess();
}

char *OUTLINED_FUNCTION_49()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 1, v0);
}

void OUTLINED_FUNCTION_51(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 - 312);
  *(void *)(a1 + 32) = *(void *)(v1 - 320);
  *(void *)(a1 + 40) = v2;
}

uint64_t OUTLINED_FUNCTION_54()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_57()
{
  return v0;
}

void OUTLINED_FUNCTION_59(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_60()
{
  *(void *)(v2 + 8 * v1) = v0;
}

uint64_t OUTLINED_FUNCTION_61()
{
  return v0 - 240;
}

uint64_t OUTLINED_FUNCTION_62()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t dispatch thunk of Corrections.checkCorrection(input:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of Corrections.setUndoInvocation(directInvocation:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of Corrections.checkUndo(input:context:correctionsOutcome:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t ReferenceResolutionUtils.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ReferenceResolutionUtils.resolveReference(usoEntity:)()
{
  uint64_t v153 = type metadata accessor for RREntity();
  OUTLINED_FUNCTION_0();
  uint64_t v139 = v0;
  MEMORY[0x1F4188790](v1, v2);
  OUTLINED_FUNCTION_5_3();
  uint64_t v137 = v3;
  OUTLINED_FUNCTION_13_1();
  uint64_t v143 = type metadata accessor for RRCandidate();
  OUTLINED_FUNCTION_0();
  uint64_t v138 = v4;
  MEMORY[0x1F4188790](v5, v6);
  OUTLINED_FUNCTION_15_0();
  uint64_t v135 = v7;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v8, v9);
  uint64_t v140 = (char *)&v131 - v10;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v11, v12);
  uint64_t v141 = (char *)&v131 - v13;
  OUTLINED_FUNCTION_13_1();
  uint64_t v14 = type metadata accessor for RRResult();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17, v18);
  OUTLINED_FUNCTION_15_0();
  unint64_t v144 = v19;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v20, v21);
  uint64_t v145 = (char *)&v131 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RRFilter?);
  MEMORY[0x1F4188790](v23 - 8, v24);
  OUTLINED_FUNCTION_5_3();
  uint64_t v150 = v25;
  OUTLINED_FUNCTION_13_1();
  unint64_t v151 = (void (*)(void, void))type metadata accessor for RRQuery();
  OUTLINED_FUNCTION_0();
  uint64_t v148 = v26;
  MEMORY[0x1F4188790](v27, v28);
  OUTLINED_FUNCTION_5_3();
  uint64_t v146 = v29;
  uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<RRResult, Error>);
  MEMORY[0x1F4188790](v147, v30);
  OUTLINED_FUNCTION_15_0();
  os_log_type_t v149 = v31;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v32, v33);
  uint64_t v152 = (uint64_t)&v131 - v34;
  OUTLINED_FUNCTION_13_1();
  uint64_t v35 = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_0();
  uint64_t v37 = v36;
  MEMORY[0x1F4188790](v38, v39);
  BOOL v41 = (char *)&v131 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v42 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  type metadata accessor for ReferenceResolutionClient();
  uint64_t v43 = ReferenceResolutionClient.__allocating_init()();
  if ((dispatch thunk of ReferenceResolutionClient.hasReference(usoEntity:)() & 1) == 0)
  {
    swift_release();
LABEL_24:
    uint64_t v101 = MEMORY[0x1E4FBC860];
    goto LABEL_30;
  }
  uint64_t v133 = v16;
  uint64_t v132 = v14;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v44 = type metadata accessor for Logger();
  uint64_t v45 = __swift_project_value_buffer(v44, (uint64_t)static Logger.logger);
  swift_retain_n();
  uint64_t v134 = v45;
  uint64_t v46 = Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.debug.getter();
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v142 = v35;
  uint64_t v136 = v37;
  if (v48)
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    v154[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v49 = 136315138;
    uint64_t v50 = UsoTask.verbString.getter();
    uint64_t v52 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v51, v154);
    OUTLINED_FUNCTION_9_1(v52);
    uint64_t v35 = v142;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9DB7000, v46, v47, "[ReferenceResolutionUtils.resolveReference] Reference resolver detects a reference in entity %s", v49, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    uint64_t v37 = v136;
    OUTLINED_FUNCTION_1_2();
  }
  else
  {

    swift_release_n();
  }
  UsoTask.verbString.getter();
  type metadata accessor for UsoEntityBuilder();
  swift_allocObject();
  uint64_t v53 = (uint8_t *)UsoEntityBuilder.init(valueTypeString:)();
  uint64_t v54 = MEMORY[0x1CB78E5E0]();
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = v146;
    *uint64_t v146 = v54;
    uint64_t v57 = v148;
    uint64_t v58 = v151;
    (*(void (**)(uint64_t *, void, void (*)(void, void)))(v148 + 104))(v56, *MEMORY[0x1E4FA3DF8], v151);
    uint64_t v59 = type metadata accessor for RRFilter();
    uint64_t v60 = v150;
    __swift_storeEnumTagSinglePayload(v150, 1, 1, v59);
    uint64_t v131 = v55;
    swift_retain();
    uint64_t v61 = v152;
    dispatch thunk of ReferenceResolutionClient.resolve(reference:filter:)();
    outlined destroy of RRFilter?(v60, &demangling cache variable for type metadata for RRFilter?);
    uint64_t v62 = v56;
    uint64_t v63 = v61;
    (*(void (**)(uint64_t *, void))(v57 + 8))(v62, v58);
    uint64_t v64 = v149;
    outlined init with copy of Result<RRResult, Error>(v61, (uint64_t)v149);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v148 = v43;
      id v65 = *v64;
      id v66 = *v64;
      id v67 = v65;
      uint64_t v68 = OUTLINED_FUNCTION_7_2();
      os_log_type_t v69 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v68, v69))
      {
        OUTLINED_FUNCTION_11();
        v154[0] = OUTLINED_FUNCTION_11_0();
        uint64_t v146 = (uint64_t *)v41;
        *(_DWORD *)uint64_t v53 = 136315138;
        swift_getErrorValue();
        uint64_t v70 = Error.localizedDescription.getter();
        uint64_t v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v70, v71, v154);
        OUTLINED_FUNCTION_5_4(v72);
        BOOL v41 = (char *)v146;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1C9DB7000, v68, v69, "[ReferenceResolutionUtils.resolveReference] SRR failed %s", v53, 0xCu);
        swift_arrayDestroy();
        uint64_t v63 = v152;
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_1_2();
      }
      else
      {
      }
      uint64_t v35 = v142;
      uint64_t v37 = v136;
LABEL_23:
      swift_release();
      swift_release();
      swift_release();
      outlined destroy of RRFilter?(v63, &demangling cache variable for type metadata for Result<RRResult, Error>);
      goto LABEL_24;
    }
    uint64_t v78 = v133;
    uint64_t v79 = v132;
    (*(void (**)(char *, id *, uint64_t))(v133 + 32))(v145, v64, v132);
    uint64_t v80 = v144;
    (*(void (**)(void))(v78 + 16))();
    int v81 = (*(uint64_t (**)(uint8_t *, uint64_t))(v78 + 88))(v80, v79);
    uint64_t v37 = v136;
    if (v81 == *MEMORY[0x1E4FA3E30])
    {
      uint64_t v147 = (uint64_t)v53;
      uint64_t v148 = v43;
      uint64_t v146 = (uint64_t *)v41;
      uint64_t v82 = OUTLINED_FUNCTION_6_3();
      v83(v82);
      uint64_t v84 = v138;
      uint64_t v85 = v80;
      uint64_t v86 = v141;
      uint64_t v87 = v143;
      (*(void (**)(char *, uint8_t *, uint64_t))(v138 + 32))(v141, v85, v143);
      (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v140, v86, v87);
      uint64_t v88 = OUTLINED_FUNCTION_7_2();
      os_log_type_t v89 = static os_log_type_t.debug.getter();
      int v90 = v89;
      if (os_log_type_enabled(v88, v89))
      {
        LODWORD(v150) = v90;
        uint64_t v91 = (uint8_t *)OUTLINED_FUNCTION_11();
        os_log_type_t v149 = (id *)swift_slowAlloc();
        v154[0] = (uint64_t)v149;
        unint64_t v144 = v91;
        *(_DWORD *)uint64_t v91 = 136315138;
        unint64_t v151 = (void (*)(void, void))(v91 + 4);
        uint64_t v92 = v137;
        RRCandidate.entity.getter();
        RREntity.usoEntity.getter();
        uint64_t v93 = v139;
        (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v92, v153);
        uint64_t v94 = UsoEntity.debugString.getter();
        uint64_t v95 = v37;
        unint64_t v97 = v96;
        swift_release();
        uint64_t v98 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v94, v97, v154);
        OUTLINED_FUNCTION_9_1(v98);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v37 = v95;
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_12_1(*(void *)(v84 + 8));
        v99();
        _os_log_impl(&dword_1C9DB7000, v88, (os_log_type_t)v150, "[ReferenceResolutionUtils.resolveReference] found match %s", v144, 0xCu);
        swift_arrayDestroy();
        uint64_t v35 = v142;
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_1_2();

        uint64_t v100 = v153;
      }
      else
      {
        OUTLINED_FUNCTION_12_1(*(void *)(v84 + 8));
        v108();

        uint64_t v100 = v153;
        uint64_t v92 = v137;
        uint64_t v93 = v139;
      }
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      uint64_t v109 = swift_allocObject();
      *(_OWORD *)(v109 + 16) = xmmword_1C9DD01A0;
      uint64_t v110 = v141;
      RRCandidate.entity.getter();
      uint64_t v111 = RREntity.usoEntity.getter();
      (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v92, v100);
      *(void *)(v109 + 32) = v111;
      v154[0] = v109;
      specialized Array._endMutation()();
      uint64_t v101 = v154[0];
      swift_release();
      swift_release();
      swift_release();
      v151(v110, v143);
      uint64_t v112 = OUTLINED_FUNCTION_2_4();
      v113(v112);
      outlined destroy of RRFilter?(v152, &demangling cache variable for type metadata for Result<RRResult, Error>);
      BOOL v41 = (char *)v146;
    }
    else
    {
      if (v81 != *MEMORY[0x1E4FA3E38])
      {
        uint64_t v116 = OUTLINED_FUNCTION_7_2();
        os_log_type_t v117 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v116, v117))
        {
          unint64_t v118 = (uint8_t *)swift_slowAlloc();
          uint64_t v147 = (uint64_t)v53;
          *(_WORD *)unint64_t v118 = 0;
          _os_log_impl(&dword_1C9DB7000, v116, v117, "[ReferenceResolutionUtils.resolveReference] Failed to find match", v118, 2u);
          OUTLINED_FUNCTION_1_2();
        }

        unint64_t v119 = *(void (**)(char *, uint64_t))(v133 + 8);
        v119(v145, v79);
        v119((char *)v144, v79);
        goto LABEL_23;
      }
      uint64_t v147 = (uint64_t)v53;
      uint64_t v148 = v43;
      uint64_t v102 = OUTLINED_FUNCTION_6_3();
      v103(v102);
      uint64_t v104 = *(void *)v80;
      swift_bridgeObjectRetain();
      unsigned int v105 = OUTLINED_FUNCTION_7_2();
      os_log_type_t v106 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v105, v106))
      {
        uint64_t v107 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v107 = 134217984;
        v154[0] = *(void *)(v104 + 16);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C9DB7000, v105, v106, "[ReferenceResolutionUtils.resolveReference] found plural match, number of matches %ld", v107, 0xCu);
        OUTLINED_FUNCTION_1_2();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      uint64_t v120 = v139;
      uint64_t v121 = *(void *)(v104 + 16);
      if (v121)
      {
        uint64_t v146 = (uint64_t *)v41;
        v154[0] = MEMORY[0x1E4FBC860];
        specialized ContiguousArray.reserveCapacity(_:)();
        unint64_t v122 = *(void (**)(void, void))(v138 + 16);
        uint64_t v123 = *(unsigned __int8 *)(v138 + 80);
        unint64_t v144 = (uint8_t *)v104;
        uint64_t v124 = v104 + ((v123 + 32) & ~v123);
        uint64_t v150 = *(void *)(v138 + 72);
        unint64_t v151 = v122;
        os_log_type_t v149 = (id *)(v120 + 8);
        char v125 = (void (**)(uint64_t, uint64_t))(v138 + 8);
        uint64_t v126 = v143;
        uint64_t v127 = v137;
        uint64_t v128 = v135;
        do
        {
          ((void (*)(uint64_t, uint64_t, uint64_t))v151)(v128, v124, v126);
          RRCandidate.entity.getter();
          RREntity.usoEntity.getter();
          ((void (*)(uint64_t, uint64_t))*v149)(v127, v153);
          (*v125)(v128, v126);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          v124 += v150;
          --v121;
        }
        while (v121);
        uint64_t v101 = v154[0];
        swift_release();
        swift_release();
        swift_release();
        uint64_t v37 = v136;
        BOOL v41 = (char *)v146;
        uint64_t v63 = v152;
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        uint64_t v101 = MEMORY[0x1E4FBC860];
      }
      uint64_t v129 = OUTLINED_FUNCTION_2_4();
      v130(v129);
      outlined destroy of RRFilter?(v63, &demangling cache variable for type metadata for Result<RRResult, Error>);
      swift_bridgeObjectRelease();
      uint64_t v35 = v142;
    }
  }
  else
  {
    swift_retain_n();
    uint64_t v73 = OUTLINED_FUNCTION_7_2();
    os_log_type_t v74 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v73, v74))
    {
      OUTLINED_FUNCTION_11();
      v154[0] = OUTLINED_FUNCTION_11_0();
      uint64_t v148 = v43;
      *(_DWORD *)uint64_t v53 = 136315138;
      uint64_t v75 = UsoTask.verbString.getter();
      uint64_t v77 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v75, v76, v154);
      OUTLINED_FUNCTION_5_4(v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9DB7000, v73, v74, "[ReferenceResolutionUtils.resolveReference] Failed to create query entity for %s", v53, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v35 = v142;
    swift_release();
    swift_release();
    uint64_t v101 = MEMORY[0x1E4FBC860];
  }
LABEL_30:
  id v114 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(char *, uint64_t))(v37 + 8))(v41, v35);
  return v101;
}

uint64_t ReferenceResolutionUtils.deinit()
{
  return v0;
}

uint64_t ReferenceResolutionUtils.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t ReferenceResolutionUtils.init()()
{
  return v0;
}

uint64_t outlined init with copy of Result<RRResult, Error>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<RRResult, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of RRFilter?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for ReferenceResolutionUtils()
{
  return self;
}

uint64_t method lookup function for ReferenceResolutionUtils(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ReferenceResolutionUtils);
}

uint64_t dispatch thunk of ReferenceResolutionUtils.resolveReference(usoEntity:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 80))();
}

uint64_t dispatch thunk of ReferenceResolutionUtils.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return *(void *)(v0 - 208);
}

uint64_t OUTLINED_FUNCTION_5_4(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_9_1(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  *(void *)(v1 - 192) = v0;
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_12_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 160) = a1;
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return 0;
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1F40E4550]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1F40E4D48]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x1F40E53B0]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x1F40E53C8]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier()
{
  return MEMORY[0x1F4154E78]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x1F4154F58]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.modify()
{
  return MEMORY[0x1F4154F90]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.getter()
{
  return MEMORY[0x1F4154F98]();
}

uint64_t Siri_Nlu_External_UserParse.correctionOutcome.getter()
{
  return MEMORY[0x1F4154FB8]();
}

uint64_t static Siri_Nlu_External_UserParse.== infix(_:_:)()
{
  return MEMORY[0x1F4154FD8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserParse()
{
  return MEMORY[0x1F4155018]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter()
{
  return MEMORY[0x1F41550A0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasAccepted.getter()
{
  return MEMORY[0x1F41550B8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasRejected.getter()
{
  return MEMORY[0x1F41550C8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasCancelled.getter()
{
  return MEMORY[0x1F41550D8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return MEMORY[0x1F4155100]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasWantedToUndo.getter()
{
  return MEMORY[0x1F4155110]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasWantedToProceed.getter()
{
  return MEMORY[0x1F4155128]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x1F4155150]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return MEMORY[0x1F41551F8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return MEMORY[0x1F4155210]();
}

uint64_t type metadata accessor for Siri_Nlu_External_CorrectionOutcome.CorrectionType()
{
  return MEMORY[0x1F41552D0]();
}

uint64_t Siri_Nlu_External_CorrectionOutcome.type.getter()
{
  return MEMORY[0x1F41552D8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_CorrectionOutcome()
{
  return MEMORY[0x1F41552E0]();
}

uint64_t static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)()
{
  return MEMORY[0x1F41554D0]();
}

uint64_t UsoExpression.operandAsValue.getter()
{
  return MEMORY[0x1F4155E00]();
}

uint64_t UsoExpression.operatorAsString.getter()
{
  return MEMORY[0x1F4155E08]();
}

uint64_t UsoEntityBuilder.init(valueTypeString:)()
{
  return MEMORY[0x1F4156140]();
}

uint64_t type metadata accessor for UsoEntityBuilder()
{
  return MEMORY[0x1F4156148]();
}

uint64_t static UsoConversionUtils.convertGraphToTasks(graph:)()
{
  return MEMORY[0x1F41562E0]();
}

uint64_t static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)()
{
  return MEMORY[0x1F41565F8]();
}

uint64_t static Name.primitiveString.getter()
{
  return MEMORY[0x1F41573A0]();
}

uint64_t static Name.primitiveInteger.getter()
{
  return MEMORY[0x1F41573A8]();
}

uint64_t Name.value.getter()
{
  return MEMORY[0x1F41573D0]();
}

uint64_t type metadata accessor for Name()
{
  return MEMORY[0x1F41573D8]();
}

uint64_t UsoTask.verbString.getter()
{
  return MEMORY[0x1F4157550]();
}

uint64_t UsoTask.baseEntityAsString.getter()
{
  return MEMORY[0x1F4157558]();
}

uint64_t UsoTask.arguments.getter()
{
  return MEMORY[0x1F4157560]();
}

uint64_t dispatch thunk of UsoValue.getAsEntity()()
{
  return MEMORY[0x1F41575A8]();
}

uint64_t dispatch thunk of UsoValue.getAsExpression()()
{
  return MEMORY[0x1F41575B8]();
}

uint64_t UsoEntity.debugString.getter()
{
  return MEMORY[0x1F41582B8]();
}

uint64_t UsoEntity.attributes.getter()
{
  return MEMORY[0x1F4157680]();
}

uint64_t UsoEntity.valueTypeString.getter()
{
  return MEMORY[0x1F4157698]();
}

uint64_t type metadata accessor for UsoEntity()
{
  return MEMORY[0x1F41576B0]();
}

uint64_t dispatch thunk of ReferenceResolutionClient.hasReference(usoEntity:)()
{
  return MEMORY[0x1F4158228]();
}

uint64_t dispatch thunk of ReferenceResolutionClient.resolve(reference:filter:)()
{
  return MEMORY[0x1F4158250]();
}

uint64_t ReferenceResolutionClient.__allocating_init()()
{
  return MEMORY[0x1F4158268]();
}

uint64_t type metadata accessor for ReferenceResolutionClient()
{
  return MEMORY[0x1F4158270]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x1F4188510]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x1F4188568]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x1F4188578]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x1F4188580]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1F4188670]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t RRCandidate.entity.getter()
{
  return MEMORY[0x1F41582D8]();
}

uint64_t type metadata accessor for RRCandidate()
{
  return MEMORY[0x1F41582E0]();
}

uint64_t type metadata accessor for RRQuery()
{
  return MEMORY[0x1F4158310]();
}

uint64_t RREntity.usoEntity.getter()
{
  return MEMORY[0x1F4158368]();
}

uint64_t type metadata accessor for RREntity()
{
  return MEMORY[0x1F4158370]();
}

uint64_t type metadata accessor for RRFilter()
{
  return MEMORY[0x1F4158378]();
}

uint64_t type metadata accessor for RRResult()
{
  return MEMORY[0x1F4158380]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1F40E6000]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x1F4183358]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1F4183838]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1F40E6190]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1F4183880]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x1F4183898]();
  result._uint64_t object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1F41839B0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x1F4188708]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x1F4188710]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x1F4188718]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x1F4188720]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x1F4188758]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1F4184820]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1F4184978]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1F4185050]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x1F41851A0](isUnique, capacity);
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185298]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1F4185350]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185398]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1F41854C8](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1F4185528]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1F4185568]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1F4185690]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x1F410ACB8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}