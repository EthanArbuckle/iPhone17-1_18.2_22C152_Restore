BOOL OpenPunchoutCommandConverter.supports(sfCommand:)()
{
  self;
  return swift_dynamicCastObjCClass() != 0;
}

id OpenPunchoutCommandConverter.convert(sfCommand:)(void *a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  id v9 = objc_msgSend(a1, sel_punchout);
  if (v9
    && (uint64_t v10 = outlined bridged method (ob) of @objc SFPunchout.bundleIdentifier.getter(v9, (SEL *)&selRef_name), v11))
  {
    v12 = (void *)MEMORY[0x230F77C10](v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v8, sel_setPunchOutName_, v12);

  id v13 = objc_msgSend(a1, sel_punchout);
  if (v13
    && (uint64_t v14 = outlined bridged method (ob) of @objc SFPunchout.bundleIdentifier.getter(v13, (SEL *)&selRef_bundleIdentifier), v15))
  {
    v16 = (void *)MEMORY[0x230F77C10](v14);
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v8, sel_setBundleId_, v16);

  id v17 = objc_msgSend(a1, sel_punchout);
  if (v17 && (uint64_t v18 = outlined bridged method (ob) of @objc SFPunchout.urls.getter(v17)) != 0)
  {
    specialized Collection.first.getter(v18, (uint64_t)v7);
    swift_bridgeObjectRelease();
    uint64_t v19 = type metadata accessor for URL();
    v21 = 0;
    if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v19) != 1)
    {
      URL._bridgeToObjectiveC()(v20);
      v21 = v22;
      (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v7, v19);
    }
  }
  else
  {
    uint64_t v23 = type metadata accessor for URL();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v23);
    v21 = 0;
  }
  objc_msgSend(v8, sel_setPunchOutUri_, v21);

  id v24 = v8;
  UUID.init()();
  uint64_t v25 = UUID.uuidString.getter();
  uint64_t v27 = v26;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  outlined bridged method (mbnn) of @objc SABaseClientBoundCommand.aceId.setter(v25, v27, v24);

  return v24;
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

uint64_t specialized Collection.first.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = type metadata accessor for URL();
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

id protocol witness for SFCommandConverter.convert(sfCommand:) in conformance OpenPunchoutCommandConverter(void *a1)
{
  return OpenPunchoutCommandConverter.convert(sfCommand:)(a1);
}

void outlined bridged method (mbnn) of @objc SABaseClientBoundCommand.aceId.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)MEMORY[0x230F77C10]();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);
}

uint64_t outlined bridged method (ob) of @objc SFPunchout.urls.getter(void *a1)
{
  id v2 = objc_msgSend(a1, sel_urls);

  if (!v2) {
    return 0;
  }
  type metadata accessor for URL();
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined bridged method (ob) of @objc SFPunchout.bundleIdentifier.getter(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

ValueMetadata *type metadata accessor for OpenPunchoutCommandConverter()
{
  return &type metadata for OpenPunchoutCommandConverter;
}

uint64_t (*SFCommandConverter.eraseToAnyConverter()(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v6, v2, a1);
  AnySFCommandConverter.init<A>(wrapped:)((uint64_t)v6, a1, a2);
  return partial apply for closure #1 in AnySFCommandConverter.init<A>(wrapped:);
}

uint64_t (*AnySFCommandConverter.init<A>(wrapped:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  uint64_t v11 = *(void (**)(void))(v7 + 32);
  OUTLINED_FUNCTION_2();
  v11();
  OUTLINED_FUNCTION_2();
  v11();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  OUTLINED_FUNCTION_2();
  v11();
  return partial apply for closure #1 in AnySFCommandConverter.init<A>(wrapped:);
}

uint64_t AnySFCommandConverter.convert.getter(uint64_t a1)
{
  return a1;
}

uint64_t AnySFCommandConverter.supports.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t closure #1 in AnySFCommandConverter.init<A>(wrapped:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getAssociatedTypeWitness();
  uint64_t v8 = swift_dynamicCastUnknownClass();
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 32);
    id v11 = a1;
    a2 = v10(v9, a3, a4);
  }
  else
  {
    lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
    swift_allocError();
    void *v12 = 0;
    swift_willThrow();
  }
  return a2;
}

uint64_t partial apply for closure #1 in AnySFCommandConverter.init<A>(wrapped:)()
{
  OUTLINED_FUNCTION_1();
  return closure #1 in AnySFCommandConverter.init<A>(wrapped:)(v2, v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)), v3, v4);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for closure #2 in AnySFCommandConverter.init<A>(wrapped:)()
{
  OUTLINED_FUNCTION_1();
  return (*(uint64_t (**)(void))(v0 + 24))() & 1;
}

uint64_t dispatch thunk of SFCommandConverter.supports(sfCommand:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SFCommandConverter.convert(sfCommand:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t initializeBufferWithCopyOfBuffer for AnySFCommandConverter(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnySFCommandConverter()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AnySFCommandConverter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AnySFCommandConverter(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
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

_OWORD *assignWithTake for AnySFCommandConverter(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnySFCommandConverter(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AnySFCommandConverter(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AnySFCommandConverter()
{
  return &type metadata for AnySFCommandConverter;
}

unint64_t lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError()
{
  unint64_t result = lazy protocol witness table cache variable for type SnippetCommandError and conformance SnippetCommandError;
  if (!lazy protocol witness table cache variable for type SnippetCommandError and conformance SnippetCommandError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SnippetCommandError and conformance SnippetCommandError);
  }
  return result;
}

uint64_t one-time initialization function for default()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.default);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)static Log.default);
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)static Logger.Category.default);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

{
  uint64_t v0;
  id v1;

  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.Category.default);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.Category.default);
  if (one-time initialization token for defaultOSLog != -1) {
    swift_once();
  }
  uint64_t v1 = (id)static Logger.Category.defaultOSLog;
  return Logger.init(_:)();
}

uint64_t Logger.Category.default.unsafeMutableAddressor()
{
  return Logger.Category.default.unsafeMutableAddressor(&one-time initialization token for default, (uint64_t)static Logger.Category.default);
}

uint64_t Log.default.unsafeMutableAddressor()
{
  return Logger.Category.default.unsafeMutableAddressor(&one-time initialization token for default, (uint64_t)static Log.default);
}

uint64_t Logger.Category.default.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Log.default.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.default.getter(&one-time initialization token for default, (uint64_t)static Log.default, a1);
}

void *Logger.subsystem.unsafeMutableAddressor()
{
  return &static Logger.subsystem;
}

unint64_t static Logger.subsystem.getter()
{
  return 0xD000000000000012;
}

uint64_t one-time initialization function for defaultOSLog()
{
  type metadata accessor for OS_os_log();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  static Logger.Category.defaultOSLog = result;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.Category.default.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.default.getter(&one-time initialization token for default, (uint64_t)static Logger.Category.default, a1);
}

uint64_t static Log.default.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

void Logger.logAndCrash(_:file:line:)(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  unint64_t v3 = v2;
  swift_bridgeObjectRetain_n();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v1, v3, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22CEB5000, v4, v5, "%{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F78110](v7, -1, -1);
    MEMORY[0x230F78110](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t static Logger.generateSignpostID()()
{
  if (one-time initialization token for defaultOSLog != -1) {
    swift_once();
  }
  id v0 = (id)static Logger.Category.defaultOSLog;
  return OSSignpostID.init(log:)();
}

uint64_t static Logger.begin(_:)()
{
  if (one-time initialization token for defaultOSLog != -1) {
    swift_once();
  }
  id v0 = (id)static Logger.Category.defaultOSLog;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  OUTLINED_FUNCTION_1_0();
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t (*static Logger.begin<A>(_:andWrap:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1)
{
  uint64_t v28 = a6;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v9 = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v15 = &v26[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v14);
  id v17 = &v26[-v16];
  if (one-time initialization token for defaultOSLog != -1) {
    swift_once();
  }
  id v18 = (id)static Logger.Category.defaultOSLog;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  int v27 = a3;
  uint64_t v19 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32);
  v19(v15, v17, v9);
  unint64_t v20 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v28;
  v19((unsigned char *)(v21 + v20), v15, v9);
  unint64_t v22 = v21 + ((v20 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v22 = a1;
  *(void *)(v22 + 8) = a2;
  *(unsigned char *)(v22 + 16) = v27;
  uint64_t v23 = (void *)(v21 + ((v20 + v13 + 31) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v24 = v30;
  *uint64_t v23 = v29;
  v23[1] = v24;
  swift_retain();
  return partial apply for closure #1 in static Logger.begin<A>(_:andWrap:);
}

uint64_t closure #1 in static Logger.begin<A>(_:andWrap:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  if (one-time initialization token for defaultOSLog != -1) {
    swift_once();
  }
  os_signpost(_:dso:log:name:signpostID:)();
  return a6(a1);
}

uint64_t static Logger.end(_:_:)()
{
  static os_signpost_type_t.end.getter();
  if (one-time initialization token for defaultOSLog != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_0();
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static Logger.event(_:)()
{
  uint64_t v0 = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  os_log_type_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.event.getter();
  if (one-time initialization token for defaultOSLog != -1) {
    swift_once();
  }
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v0);
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

uint64_t sub_22CEB88D8()
{
  uint64_t v1 = type metadata accessor for OSSignpostID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 31) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t partial apply for closure #1 in static Logger.begin<A>(_:andWrap:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for OSSignpostID() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  uint64_t v6 = v1 + v4;
  uint64_t v7 = v1 + ((v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = *(void *)v7;
  uint64_t v9 = *(void *)(v7 + 8);
  uint64_t v10 = *(uint64_t (**)(uint64_t))(v1 + ((v5 + 31) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *(unsigned __int8 *)(v7 + 16);
  return closure #1 in static Logger.begin<A>(_:andWrap:)(a1, v6, v8, v9, v11, v10);
}

void type metadata accessor for Log()
{
}

void type metadata accessor for Logger.Category()
{
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Logger.Signpost(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Logger.Signpost(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 16) = 0;
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

void type metadata accessor for Logger.Signpost()
{
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

void (*SFCommandExecutor.eraseToAnyExecutor()(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  int64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v7, v2, a1);
  AnySFCommandExecutor.init<A>(wrapped:)((uint64_t)v7, a1, a2);
  return partial apply for closure #1 in AnySFCommandExecutor.init<A>(wrapped:);
}

void (*AnySFCommandExecutor.init<A>(wrapped:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  uint64_t v12 = *(void (**)(void))(v7 + 32);
  OUTLINED_FUNCTION_2();
  v12();
  OUTLINED_FUNCTION_2();
  v12();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  OUTLINED_FUNCTION_2();
  v12();
  return partial apply for closure #1 in AnySFCommandExecutor.init<A>(wrapped:);
}

uint64_t AnySFCommandExecutor.execute.getter(uint64_t a1)
{
  return a1;
}

uint64_t AnySFCommandExecutor.supports.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

void closure #1 in AnySFCommandExecutor.init<A>(wrapped:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getAssociatedTypeWitness();
  uint64_t v7 = swift_dynamicCastUnknownClass();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 24);
    id v10 = a1;
    v9(v8, a3, a4);
  }
  else
  {
    lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
    swift_allocError();
    *uint64_t v11 = 0;
    swift_willThrow();
  }
}

void partial apply for closure #1 in AnySFCommandExecutor.init<A>(wrapped:)()
{
  OUTLINED_FUNCTION_1();
  closure #1 in AnySFCommandExecutor.init<A>(wrapped:)(v2, v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)), v3, v4);
}

uint64_t partial apply for closure #2 in AnySFCommandExecutor.init<A>(wrapped:)()
{
  OUTLINED_FUNCTION_1();
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t dispatch thunk of SFCommandExecutor.supports(sfCommand:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of SFCommandExecutor.execute(sfCommand:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

ValueMetadata *type metadata accessor for AnySFCommandExecutor()
{
  return &type metadata for AnySFCommandExecutor;
}

BOOL BeginMapsRoutingExecutor.supports(sfCommand:)()
{
  return swift_dynamicCastObjCClass() != 0;
}

void BeginMapsRoutingExecutor.execute(sfCommand:)(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = BeginMapsRoutingExecutor.buildMapItem(from:)(a1);
  if (v6)
  {
    uint64_t v7 = v6;
    BeginMapsRoutingExecutor.buildLaunchOptions(sfCommand:)(a1);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    unsigned __int8 v9 = objc_msgSend(v7, sel_openInMapsWithLaunchOptions_, isa);

    if (v9)
    {
      if (one-time initialization token for default != -1) {
        swift_once();
      }
      uint64_t v10 = __swift_project_value_buffer(v2, (uint64_t)static Log.default);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
      id v11 = a1;
      uint64_t v12 = Logger.logObject.getter();
      int v13 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v12, (os_log_type_t)v13))
      {
        int v29 = v13;
        os_log_t v30 = v12;
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        uint64_t v32 = v28;
        *(_DWORD *)uint64_t v14 = 136315138;
        if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v11))
        {
          uint64_t v15 = Dictionary.description.getter();
          int v27 = v14;
          uint64_t v16 = v15;
          unint64_t v18 = v17;
          swift_bridgeObjectRelease();
          uint64_t v19 = v16;
          uint64_t v14 = v27;
        }
        else
        {
          unint64_t v18 = 0xE90000000000003ELL;
          uint64_t v19 = 0x64696C61766E693CLL;
        }
        uint64_t v31 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v18, &v32);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        os_log_t v24 = v30;
        _os_log_impl(&dword_22CEB5000, v30, (os_log_type_t)v29, "Successfully Started Navigation via SFCommand:\n    %s", v14, 0xCu);
        uint64_t v25 = v28;
        swift_arrayDestroy();
        MEMORY[0x230F78110](v25, -1, -1);
        MEMORY[0x230F78110](v14, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    else
    {
      lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
      uint64_t v22 = swift_allocError();
      OUTLINED_FUNCTION_1_1(v22, v23);
    }
  }
  else
  {
    lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
    uint64_t v20 = swift_allocError();
    OUTLINED_FUNCTION_1_1(v20, v21);
  }
}

id BeginMapsRoutingExecutor.buildMapItem(from:)(void *a1)
{
  uint64_t v2 = outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.mapsData.getter(a1);
  unint64_t v4 = v3;
  type metadata accessor for MKMapItem();
  outlined copy of Data?(v2, v4);
  id v5 = @nonobjc MKMapItem.init(serializedPlace:)(v2, v4);
  if (v5)
  {
    id v6 = v5;
    OUTLINED_FUNCTION_0_1();
  }
  else
  {
    id v7 = objc_msgSend(a1, sel_location);
    if (v7
      && (uint64_t v8 = v7,
          objc_msgSend(v7, sel_lat),
          double v10 = v9,
          v8,
          (id v11 = objc_msgSend(a1, sel_location)) != 0))
    {
      uint64_t v12 = v11;
      objc_msgSend(v11, sel_lng);
      double v14 = v13;

      id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A50]), sel_initWithLatitude_longitude_, v10, v14);
      id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10960]), sel_initWithCLLocation_, v15);
      id v6 = v16;
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.name.getter(a1);
        if (v19)
        {
          uint64_t v20 = (void *)MEMORY[0x230F77C10](v18);
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v20 = 0;
        }
        objc_msgSend(v17, sel_setName_, v20);
        OUTLINED_FUNCTION_0_1();
      }
      else
      {
        OUTLINED_FUNCTION_0_1();
      }
    }
    else
    {
      OUTLINED_FUNCTION_0_1();
      return 0;
    }
  }
  return v6;
}

uint64_t BeginMapsRoutingExecutor.buildLaunchOptions(sfCommand:)(void *a1)
{
  if (objc_msgSend(a1, sel_shouldSearchDirectionsAlongCurrentRoute))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22CEBCB80;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v3;
    *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 48) = 1;
    *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 88) = v4;
    *(void *)(inited + 120) = MEMORY[0x263F8D6C8];
    *(void *)(inited + 96) = 0;
  }
  else
  {
    objc_msgSend(a1, sel_directionsMode);
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_22CEBCB70;
    *(void *)(v8 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v8 + 40) = v9;
    *(void *)(v8 + 72) = MEMORY[0x263F8D310];
    *(void *)(v8 + 48) = v5;
    *(void *)(v8 + 56) = v7;
  }
  return Dictionary.init(dictionaryLiteral:)();
}

id @nonobjc MKMapItem.init(serializedPlace:)(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(a1, a2);
  }
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_mapItemWithSerializedPlaceData_, isa);

  return v5;
}

void protocol witness for SFCommandExecutor.execute(sfCommand:) in conformance BeginMapsRoutingExecutor(void *a1)
{
}

uint64_t outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.mapsData.getter(void *a1)
{
  id v1 = objc_msgSend(a1, sel_mapsData);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.name.getter(void *a1)
{
  id v1 = objc_msgSend(a1, sel_name);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(void *a1)
{
  id v1 = objc_msgSend(a1, sel_dictionaryRepresentation);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

unint64_t type metadata accessor for MKMapItem()
{
  unint64_t result = lazy cache variable for type metadata for MKMapItem;
  if (!lazy cache variable for type metadata for MKMapItem)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for MKMapItem);
  }
  return result;
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

ValueMetadata *type metadata accessor for BeginMapsRoutingExecutor()
{
  return &type metadata for BeginMapsRoutingExecutor;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return outlined consume of Data?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1, void *a2)
{
  *a2 = 2;
  return swift_willThrow();
}

id specialized closure #1 in AnySFCommandConverter.init<A>(wrapped:)(id a1)
{
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = a1;
    a1 = OpenPunchoutCommandConverter.convert(sfCommand:)(v3);
  }
  else
  {
    lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
    swift_allocError();
    void *v5 = 0;
    swift_willThrow();
  }
  return a1;
}

BOOL specialized closure #2 in AnySFCommandConverter.init<A>(wrapped:)()
{
  return swift_dynamicCastObjCClass() != 0;
}

void specialized closure #1 in AnySFCommandExecutor.init<A>(wrapped:)(void *a1)
{
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = a1;
    BeginMapsRoutingExecutor.execute(sfCommand:)(v3);
  }
  else
  {
    lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
    swift_allocError();
    void *v5 = 0;
    swift_willThrow();
  }
}

BOOL specialized closure #2 in AnySFCommandExecutor.init<A>(wrapped:)()
{
  return swift_dynamicCastObjCClass() != 0;
}

uint64_t SnippetCommandExecutor.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SnippetCommandExecutor.init()()
{
  return v0;
}

double one-time initialization function for converters(uint64_t a1)
{
  return one-time initialization function for converters(a1, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnySFCommandConverter>, (uint64_t)partial apply for specialized closure #1 in AnySFCommandConverter.init<A>(wrapped:), (uint64_t)partial apply for specialized closure #2 in AnySFCommandConverter.init<A>(wrapped:), &static SnippetCommandExecutor.converters);
}

uint64_t *SnippetCommandExecutor.converters.unsafeMutableAddressor()
{
  if (one-time initialization token for converters != -1) {
    swift_once();
  }
  return &static SnippetCommandExecutor.converters;
}

uint64_t static SnippetCommandExecutor.converters.getter()
{
  return static SnippetCommandExecutor.converters.getter(&one-time initialization token for converters);
}

double one-time initialization function for executors(uint64_t a1)
{
  return one-time initialization function for converters(a1, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnySFCommandExecutor>, (uint64_t)partial apply for specialized closure #1 in AnySFCommandExecutor.init<A>(wrapped:), (uint64_t)partial apply for specialized closure #2 in AnySFCommandExecutor.init<A>(wrapped:), &static SnippetCommandExecutor.executors);
}

double one-time initialization function for converters(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v8 + 16) = xmmword_22CEBCB70;
  *(void *)(v8 + 32) = a3;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = a4;
  *(void *)(v8 + 56) = 0;
  *a5 = v8;
  return result;
}

uint64_t *SnippetCommandExecutor.executors.unsafeMutableAddressor()
{
  if (one-time initialization token for executors != -1) {
    swift_once();
  }
  return &static SnippetCommandExecutor.executors;
}

uint64_t static SnippetCommandExecutor.executors.getter()
{
  return static SnippetCommandExecutor.converters.getter(&one-time initialization token for executors);
}

uint64_t static SnippetCommandExecutor.converters.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t SnippetCommandExecutor.execute(sfCommand:)(uint64_t a1)
{
  if (one-time initialization token for executors != -1) {
    swift_once();
  }
  uint64_t v3 = static SnippetCommandExecutor.executors;
  uint64_t v4 = *(void *)(static SnippetCommandExecutor.executors + 16);
  if (v4)
  {
    swift_bridgeObjectRetain_n();
    id v5 = (uint64_t *)(v3 + 56);
    while (1)
    {
      uint64_t v7 = (uint64_t (*)(uint64_t))*(v5 - 1);
      uint64_t v6 = *v5;
      uint64_t v9 = *(v5 - 3);
      uint64_t v8 = *(v5 - 2);
      swift_retain();
      swift_retain();
      if (v7(a1)) {
        break;
      }
      swift_release();
      swift_release();
      v5 += 4;
      if (!--v4)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t))(*(void *)v1 + 112))(a1, v9, v8, v7, v6);
    swift_release();
    return swift_release();
  }
  else
  {
LABEL_8:
    double v10 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 96);
    return v10(a1);
  }
}

id SnippetCommandExecutor.convert(sfCommand:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  double v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for converters != -1) {
    swift_once();
  }
  uint64_t v11 = static SnippetCommandExecutor.converters;
  uint64_t v12 = *(void *)(static SnippetCommandExecutor.converters + 16);
  uint64_t v32 = v10;
  uint64_t v33 = v5;
  if (v12)
  {
    uint64_t v31 = v7;
    v34 = a2;
    swift_bridgeObjectRetain_n();
    double v13 = (uint64_t *)(v11 + 56);
    while (1)
    {
      id v15 = (uint64_t (*)(void *))*(v13 - 1);
      uint64_t v14 = *v13;
      uint64_t v16 = *(v13 - 3);
      uint64_t v17 = *(v13 - 2);
      swift_retain();
      swift_retain();
      if (v15(a1)) {
        break;
      }
      swift_release();
      swift_release();
      v13 += 4;
      if (!--v12)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v5 = v33;
        a2 = v34;
        uint64_t v7 = v31;
        double v10 = v32;
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease_n();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t (*)(void *), uint64_t))(*(void *)v2 + 104))(a1, v16, v17, v15, v14);
    swift_release();
    OUTLINED_FUNCTION_13();
    return (id)swift_release();
  }
  else
  {
LABEL_8:
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v5, (uint64_t)static Log.default);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v18, v5);
    v34 = a1;
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_10(v20))
    {
      uint64_t v21 = v7;
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = OUTLINED_FUNCTION_17();
      *(_DWORD *)uint64_t v22 = 136315138;
      if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v34))
      {
        uint64_t v23 = Dictionary.description.getter();
        unint64_t v25 = v24;
        swift_bridgeObjectRelease();
      }
      else
      {
        unint64_t v25 = 0xE90000000000003ELL;
        uint64_t v23 = 0x64696C61766E693CLL;
      }
      uint64_t v28 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v25, &v35);
      OUTLINED_FUNCTION_19(v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22CEB5000, v19, v20, "Unable to convert command. Received unsupported SFCommand:\n    %s", v22, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();

      (*(void (**)(char *, uint64_t))(v21 + 8))(v32, v33);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
    }
    *(void *)a2 = v34;
    a2[8] = 1;
    OUTLINED_FUNCTION_13();
    return v29;
  }
}

void SnippetCommandExecutor.convert(sfCommand:with:)(void *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v10 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = OUTLINED_FUNCTION_6();
  uint64_t v15 = a2(v14);
  if (v4)
  {
    v73[0] = v4;
    id v16 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if (swift_dynamicCast())
    {
      id v17 = v72;
      if ((unint64_t)(v72 - 1) >= 2)
      {
        if (v72)
        {

          if (one-time initialization token for default != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v10, (uint64_t)static Log.default);
          swift_retain();
          swift_retain();
          outlined copy of SnippetCommandError(v72);
          swift_retain();
          swift_retain();
          outlined copy of SnippetCommandError(v72);
          v54 = Logger.logObject.getter();
          os_log_type_t v55 = static os_log_type_t.error.getter();
          if (OUTLINED_FUNCTION_10(v55))
          {
            uint64_t v56 = OUTLINED_FUNCTION_12();
            uint64_t v69 = OUTLINED_FUNCTION_16();
            *(_DWORD *)uint64_t v56 = 136315394;
            v70 = a2;
            uint64_t v71 = a3;
            OUTLINED_FUNCTION_5();
            swift_retain();
            uint64_t v57 = String.init<A>(describing:)();
            v70 = (uint64_t (*)(void))getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v57, v58, &v69);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            OUTLINED_FUNCTION_4();
            OUTLINED_FUNCTION_3();
            swift_bridgeObjectRelease();
            *(_WORD *)(v56 + 12) = 2080;
            if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v17))
            {
              Dictionary.description.getter();
              swift_bridgeObjectRelease();
            }
            a4 = v67;
            v70 = (uint64_t (*)(void))OUTLINED_FUNCTION_14();
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            outlined consume of SnippetCommandError(v17);
            outlined consume of SnippetCommandError(v17);
            _os_log_impl(&dword_22CEB5000, v54, v55, "Converter: %s Is not able to support the SFCommand:\n    %s.\nReturning Exception: SnippetCommandError.unsupportedSFCommand", (uint8_t *)v56, 0x16u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_1_2();
            OUTLINED_FUNCTION_1_2();
          }
          else
          {
            OUTLINED_FUNCTION_4();
            OUTLINED_FUNCTION_3();
            outlined consume of SnippetCommandError(v72);
            outlined consume of SnippetCommandError(v72);
          }

          *(void *)a4 = v17;
        }
        else
        {

          if (one-time initialization token for default != -1) {
            uint64_t v42 = swift_once();
          }
          id v43 = OUTLINED_FUNCTION_15(v42, (uint64_t)static Log.default);
          swift_retain_n();
          swift_retain_n();
          id v44 = v43;
          v45 = Logger.logObject.getter();
          os_log_type_t v46 = static os_log_type_t.error.getter();
          if (OUTLINED_FUNCTION_10(v46))
          {
            uint64_t v47 = OUTLINED_FUNCTION_12();
            uint64_t v69 = OUTLINED_FUNCTION_16();
            *(_DWORD *)uint64_t v47 = 136315394;
            v70 = a2;
            uint64_t v71 = a3;
            OUTLINED_FUNCTION_5();
            swift_retain();
            uint64_t v48 = OUTLINED_FUNCTION_20();
            v70 = (uint64_t (*)(void))getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v49, &v69);
            OUTLINED_FUNCTION_7();
            OUTLINED_FUNCTION_4();
            OUTLINED_FUNCTION_3();
            swift_bridgeObjectRelease();
            *(_WORD *)(v47 + 12) = 2080;
            if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v44))
            {
              Dictionary.description.getter();
              swift_bridgeObjectRelease();
            }
            a4 = v67;
            v70 = (uint64_t (*)(void))OUTLINED_FUNCTION_14();
            OUTLINED_FUNCTION_7();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_22CEB5000, v45, v46, "Converter: %s Did not receive the expected SFCommand Type.\nReceived command of type: %s.\nReturning Exception: SnippetCommandError.unableToCastCommandToExpectedType", (uint8_t *)v47, 0x16u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_1_2();
            OUTLINED_FUNCTION_1_2();
          }
          else
          {

            OUTLINED_FUNCTION_4();
            OUTLINED_FUNCTION_3();
          }
          *(void *)a4 = 0;
        }
        *(unsigned char *)(a4 + 8) = 1;

        goto LABEL_41;
      }
      outlined consume of SnippetCommandError(v72);
    }
    uint64_t v68 = a4;

    if (one-time initialization token for default != -1) {
      uint64_t v18 = swift_once();
    }
    id v19 = OUTLINED_FUNCTION_15(v18, (uint64_t)static Log.default);
    id v20 = v4;
    swift_retain();
    swift_retain();
    id v21 = v19;
    id v22 = v4;
    swift_retain();
    swift_retain();
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = OUTLINED_FUNCTION_17();
      v73[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315650;
      v70 = a2;
      uint64_t v71 = a3;
      OUTLINED_FUNCTION_5();
      swift_retain();
      uint64_t v26 = OUTLINED_FUNCTION_20();
      uint64_t v28 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, (uint64_t *)v73);
      OUTLINED_FUNCTION_8(v28);
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_3();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v21))
      {
        Dictionary.description.getter();
        OUTLINED_FUNCTION_18();
      }
      uint64_t v50 = OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_2_1(v50);

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 22) = 2080;
      OUTLINED_FUNCTION_21();
      uint64_t v51 = Error.localizedDescription.getter();
      uint64_t v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v52, (uint64_t *)v73);
      OUTLINED_FUNCTION_2_1(v53);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22CEB5000, v23, v24, "Converter: %s Threw an Exception for:\n    %s\nError:\n    %s", (uint8_t *)v25, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {

      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_3();
    }
    *(void *)uint64_t v68 = 1;
    *(unsigned char *)(v68 + 8) = 1;
LABEL_41:
    OUTLINED_FUNCTION_13();
    return;
  }
  int v29 = (void *)v15;
  uint64_t v66 = v12;
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v10, (uint64_t)static Log.default);
  uint64_t v30 = OUTLINED_FUNCTION_11();
  v31(v30);
  id v32 = a1;
  id v33 = v29;
  id v34 = v32;
  id v35 = v33;
  v36 = Logger.logObject.getter();
  os_log_type_t v37 = static os_log_type_t.info.getter();
  if (!OUTLINED_FUNCTION_10(v37))
  {

    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v5, v10);
LABEL_33:
    *(void *)a4 = v35;
    *(unsigned char *)(a4 + 8) = 0;
    goto LABEL_41;
  }
  os_log_type_t v65 = v37;
  uint64_t v38 = OUTLINED_FUNCTION_12();
  v70 = (uint64_t (*)(void))OUTLINED_FUNCTION_16();
  *(_DWORD *)uint64_t v38 = 136315394;
  if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v34))
  {
    uint64_t v39 = Dictionary.description.getter();
    unint64_t v41 = v40;
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v41 = 0xE90000000000003ELL;
    uint64_t v39 = 0x64696C61766E693CLL;
  }
  v73[0] = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v41, (uint64_t *)&v70);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  *(_WORD *)(v38 + 12) = 2080;
  id v59 = objc_msgSend(v35, sel_dictionary);
  if (v59)
  {
    v60 = v59;
    id v61 = objc_msgSend(v59, sel_description);

    uint64_t v62 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v64 = v63;

    v73[0] = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v62, v64, (uint64_t *)&v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22CEB5000, v36, v65, "Successfully converted SFCommand:\n    %s\nto AceCommand:\n    %s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();

    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v5, v10);
    a4 = v67;
    goto LABEL_33;
  }

  __break(1u);
}

void SnippetCommandExecutor.execute(sfCommand:with:)(void *a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_6();
  a2(v11);
  if (v4)
  {
    v56[0] = v4;
    id v12 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v50 = a4;
    if (!swift_dynamicCast())
    {
LABEL_5:

      if (one-time initialization token for default != -1) {
        uint64_t v13 = swift_once();
      }
      id v14 = OUTLINED_FUNCTION_15(v13, (uint64_t)static Log.default);
      id v15 = v4;
      swift_retain();
      swift_retain();
      id v16 = v14;
      id v17 = v4;
      swift_retain();
      swift_retain();
      uint64_t v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = OUTLINED_FUNCTION_17();
        v56[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 136315650;
        uint64_t v53 = a2;
        uint64_t v54 = a3;
        OUTLINED_FUNCTION_5();
        swift_retain();
        uint64_t v21 = OUTLINED_FUNCTION_20();
        uint64_t v23 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, (uint64_t *)v56);
        OUTLINED_FUNCTION_8(v23);
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_3();
        swift_bridgeObjectRelease();
        *(_WORD *)(v20 + 12) = 2080;
        if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v16))
        {
          Dictionary.description.getter();
          OUTLINED_FUNCTION_18();
        }
        uint64_t v43 = OUTLINED_FUNCTION_22();
        OUTLINED_FUNCTION_2_1(v43);

        swift_bridgeObjectRelease();
        *(_WORD *)(v20 + 22) = 2080;
        OUTLINED_FUNCTION_21();
        uint64_t v44 = Error.localizedDescription.getter();
        uint64_t v46 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v45, (uint64_t *)v56);
        OUTLINED_FUNCTION_2_1(v46);
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_22CEB5000, v18, v19, "Executor: %s Threw an Exception for:\n    %s\nError:\n    %s", (uint8_t *)v20, 0x20u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_1_2();
      }
      else
      {

        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_3();
      }
      *(void *)uint64_t v50 = 2;
      *(unsigned char *)(v50 + 8) = 1;
      goto LABEL_30;
    }
    if (v55)
    {
      outlined consume of SnippetCommandError(v55);
      goto LABEL_5;
    }

    if (one-time initialization token for default != -1) {
      uint64_t v35 = swift_once();
    }
    id v36 = OUTLINED_FUNCTION_15(v35, (uint64_t)static Log.default);
    swift_retain_n();
    swift_retain_n();
    id v37 = v36;
    uint64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_10(v39))
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v52 = OUTLINED_FUNCTION_16();
      *(_DWORD *)uint64_t v40 = 136315394;
      uint64_t v53 = a2;
      uint64_t v54 = a3;
      OUTLINED_FUNCTION_5();
      swift_retain();
      uint64_t v41 = OUTLINED_FUNCTION_20();
      uint64_t v53 = (void (*)(void))getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v42, &v52);
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_3();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2080;
      if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v37))
      {
        Dictionary.description.getter();
        swift_bridgeObjectRelease();
      }
      uint64_t v53 = (void (*)(void))OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_7();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22CEB5000, v38, v39, "Executor: %s Did not receive the expected SFCommand Type.\nReceived command of type: %s.\nReturning Exception: SnippetCommandError.unableToCastCommandToExpectedType", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {

      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_3();
    }
    *(void *)a4 = 0;
    *(unsigned char *)(a4 + 8) = 1;
  }
  else
  {
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v9, (uint64_t)static Log.default);
    uint64_t v24 = OUTLINED_FUNCTION_11();
    v25(v24);
    id v26 = a1;
    unint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v51 = a4;
      int v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = (void (*)(void))OUTLINED_FUNCTION_17();
      *(_DWORD *)int v29 = 136315138;
      if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v26))
      {
        uint64_t v30 = Dictionary.description.getter();
        unint64_t v32 = v31;
        swift_bridgeObjectRelease();
      }
      else
      {
        unint64_t v32 = 0xE90000000000003ELL;
        uint64_t v30 = 0x64696C61766E693CLL;
      }
      uint64_t v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v32, (uint64_t *)&v53);
      OUTLINED_FUNCTION_19(v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22CEB5000, v27, v28, "Successfully executed SFCommand:\n    %s", v29, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();

      uint64_t v48 = OUTLINED_FUNCTION_9();
      v49(v48);
      a4 = v51;
    }
    else
    {

      uint64_t v33 = OUTLINED_FUNCTION_9();
      v34(v33);
    }
    *(void *)a4 = 0;
    *(unsigned char *)(a4 + 8) = 2;
  }
LABEL_30:
  OUTLINED_FUNCTION_13();
}

uint64_t SnippetCommandExecutor.deinit()
{
  return v0;
}

uint64_t SnippetCommandExecutor.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t protocol witness for Error._domain.getter in conformance SnippetCommandError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance SnippetCommandError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance SnippetCommandError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance SnippetCommandError()
{
  return MEMORY[0x270F9FB30]();
}

void outlined consume of SnippetCommandError(id a1)
{
  if ((unint64_t)a1 >= 3) {
}
  }

id outlined copy of SnippetCommandError(id result)
{
  if ((unint64_t)result >= 3) {
    return result;
  }
  return result;
}

uint64_t type metadata accessor for SnippetCommandExecutor()
{
  return self;
}

uint64_t method lookup function for SnippetCommandExecutor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SnippetCommandExecutor);
}

uint64_t dispatch thunk of SnippetCommandExecutor.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SnippetCommandExecutor.execute(sfCommand:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of SnippetCommandExecutor.convert(sfCommand:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of SnippetCommandExecutor.convert(sfCommand:with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of SnippetCommandExecutor.execute(sfCommand:with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t initializeBufferWithCopyOfBuffer for ExecutionResult(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  outlined copy of ExecutionResult(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

id outlined copy of ExecutionResult(id result, char a2)
{
  if (a2 == 1) {
    return outlined copy of SnippetCommandError(result);
  }
  if (!a2) {
    return result;
  }
  return result;
}

void destroy for ExecutionResult(uint64_t a1)
{
}

void outlined consume of ExecutionResult(id a1, char a2)
{
  if (a2 == 1)
  {
    outlined consume of SnippetCommandError(a1);
  }
  else if (!a2)
  {
  }
}

uint64_t assignWithCopy for ExecutionResult(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  outlined copy of ExecutionResult(*(id *)a2, v4);
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v3;
  char v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  outlined consume of ExecutionResult(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)double result = v2;
  return result;
}

uint64_t assignWithTake for ExecutionResult(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  char v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  outlined consume of ExecutionResult(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionResult(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 2) {
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

uint64_t storeEnumTagSinglePayload for ExecutionResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)double result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for ExecutionResult(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t destructiveInjectEnumTag for ExecutionResult(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)double result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ExecutionResult()
{
  return &type metadata for ExecutionResult;
}

void *initializeBufferWithCopyOfBuffer for SnippetCommandError(void *a1, void **a2)
{
  unsigned int v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for SnippetCommandError(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for SnippetCommandError(void **a1, void **a2)
{
  unsigned int v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *double result = *a2;
  return result;
}

void **assignWithTake for SnippetCommandError(void **a1, unint64_t *a2)
{
  unsigned int v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for SnippetCommandError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SnippetCommandError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)double result = 0;
    *(_DWORD *)double result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)double result = a2 + 2;
    }
  }
  return result;
}

uint64_t getEnumTag for SnippetCommandError(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *destructiveInjectEnumTag for SnippetCommandError(void *result, int a2)
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
  *double result = v2;
  return result;
}

ValueMetadata *type metadata accessor for SnippetCommandError()
{
  return &type metadata for SnippetCommandError;
}

void partial apply for specialized closure #1 in AnySFCommandExecutor.init<A>(wrapped:)(void *a1)
{
}

id partial apply for specialized closure #1 in AnySFCommandConverter.init<A>(wrapped:)(void *a1)
{
  return specialized closure #1 in AnySFCommandConverter.init<A>(wrapped:)(a1);
}

void OUTLINED_FUNCTION_1_2()
{
  JUMPOUT(0x230F78110);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return MEMORY[0x270FA0528](v0, 2);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return MEMORY[0x270FA0528](v0, 2);
}

uint64_t OUTLINED_FUNCTION_5()
{
  *(void *)(v1 - 120) = *(void *)(v1 - 192);
  *(void *)(v1 - 112) = v0;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_10(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  *(void *)(v1 - 184) = v0;
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v1, v0, (uint64_t *)(v2 - 176));
}

id OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v3, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return String.init<A>(describing:)();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return MEMORY[0x270FA0348](v0, v1 - 144, v1 - 168);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v1, v0, (uint64_t *)(v2 - 96));
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
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

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x270FA2E30]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x270F9D060]();
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

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}