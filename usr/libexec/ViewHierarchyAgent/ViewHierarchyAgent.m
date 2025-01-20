uint64_t SystemXPCRequestExecutor.__allocating_init(targetConnection:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return SystemXPCRequestExecutor.init(targetConnection:)(a1, a2);
}

uint64_t SystemXPCRequestExecutor.init(targetConnection:)(uint64_t a1, uint64_t a2)
{
  swift_retain();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  swift_release();
  return v6;
}

uint64_t SystemXPCRequestExecutor.deinit()
{
  swift_retain();
  dispatch thunk of XPCConnection.cancel()();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SystemXPCRequestExecutor.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[10] = v3;
  v4[9] = a3;
  v4[8] = a2;
  v4[7] = a1;
  v4[4] = v4;
  v4[2] = 0;
  v4[3] = 0;
  v4[5] = 0;
  v4[6] = 0;
  uint64_t v5 = type metadata accessor for XPCDictionary();
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  v4[2] = a1;
  v4[3] = a2;
  v4[5] = a3;
  v4[6] = v3;
  return _swift_task_switch(SystemXPCRequestExecutor.performRequest(_:using:), 0);
}

uint64_t SystemXPCRequestExecutor.performRequest(_:using:)()
{
  uint64_t v18 = v0[14];
  uint64_t v16 = v0[13];
  uint64_t v17 = v0[12];
  uint64_t v19 = v0[11];
  v20 = (void *)v0[9];
  uint64_t v15 = v0[8];
  uint64_t v14 = v0[7];
  v0[4] = v0;
  XPCDictionary.init()();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("request", 7uLL, 1);
  ViewHierarchyRequest.data.getter(v14, v15);
  XPCDictionary.subscript.setter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v18, v19);
  id v1 = v20;
  *(void *)(swift_task_alloc() + 16) = v20;
  XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)();
  uint64_t v11 = v13[14];
  uint64_t v8 = v13[13];
  uint64_t v9 = v13[11];
  uint64_t v10 = v13[10];
  id v6 = (id)v13[9];
  uint64_t v7 = v13[12];
  swift_task_dealloc();

  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v13[15] = v2;
  v13[16] = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v2(v8, v9);
  Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("performRequest(_:using:)", 0x18uLL, 1);
  v13[17] = v3._object;
  swift_retain();
  uint64_t v12 = swift_task_alloc();
  v13[18] = v12;
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = v11;
  v4 = (void *)swift_task_alloc();
  v13[19] = v4;
  void *v4 = v13[4];
  v4[1] = SystemXPCRequestExecutor.performRequest(_:using:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v21, 0, 0, v3._countAndFlagsBits, v3._object, partial apply for closure #2 in SystemXPCRequestExecutor.performRequest(_:using:), v12, (char *)&type metadata for () + 8);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  v4 = *v1;
  *(void *)(v4 + 32) = *v1;
  *(void *)(v4 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = SystemXPCRequestExecutor.performRequest(_:using:);
  }
  else
  {
    swift_task_dealloc();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v2 = SystemXPCRequestExecutor.performRequest(_:using:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  void (*v1)(void);
  uint64_t (*v2)(void);
  uint64_t v4;

  id v1 = *(void (**)(void))(v0 + 120);
  *(void *)(v0 + 32) = v0;
  v1();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v0 + 32) + 8);
  return v2();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  v4 = (void (*)(uint64_t, uint64_t))v0[15];
  uint64_t v5 = v0[14];
  Swift::String v3 = v0[11];
  v0[4] = v0;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  v4(v5, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0[4] + 8);
  return v1();
}

uint64_t closure #1 in SystemXPCRequestExecutor.performRequest(_:using:)(void *a1, void *a2)
{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fd", 2uLL, 1);
  unsigned int fd = [a2 fileDescriptor];
  uint64_t v6 = String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_fd(a1, (const char *)(v6 + 32), fd);
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t partial apply for closure #1 in SystemXPCRequestExecutor.performRequest(_:using:)(void *a1)
{
  return closure #1 in SystemXPCRequestExecutor.performRequest(_:using:)(a1, *(void **)(v1 + 16));
}

uint64_t closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = a1;
  uint64_t v9 = a2;
  uint64_t v11 = a3;
  v7[1] = 0;
  v20 = partial apply for closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:);
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
  uint64_t v15 = *(void *)(v19 - 8);
  uint64_t v16 = v19 - 8;
  uint64_t v13 = v15;
  uint64_t v14 = *(void *)(v15 + 64);
  unint64_t v8 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v18 = (char *)v7 - v8;
  uint64_t v25 = type metadata accessor for XPCDictionary();
  uint64_t v22 = *(void *)(v25 - 8);
  uint64_t v23 = v25 - 8;
  unint64_t v10 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v12);
  v24 = (char *)v7 - v10;
  uint64_t v29 = v3;
  uint64_t v28 = v4;
  uint64_t v27 = v5;
  uint64_t v26 = *(void *)(v4 + 16);
  swift_retain();
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, v11, v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v12, v19);
  unint64_t v17 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v21 + v17, v18, v19);
  dispatch thunk of XPCConnection.send(message:replyHandler:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v25);
  return swift_release();
}

uint64_t partial apply for closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1)
{
  return closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = a1;
  uint64_t v13 = a2;
  uint64_t v20 = 0;
  uint64_t v19 = 0;
  uint64_t v21 = 0;
  uint64_t v8 = type metadata accessor for XPCError();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = v8 - 8;
  unint64_t v11 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)v7 - v11;
  uint64_t v21 = (char *)v7 - v11;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  unint64_t v15 = (*(void *)(*(void *)(v16 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v14);
  unint64_t v17 = (char *)v7 - v15;
  uint64_t v20 = v2;
  uint64_t v19 = v3;
  outlined init with copy of Result<XPCDictionary, XPCError>(v2, (uint64_t)v7 - v15);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v17, v8);
    uint64_t v21 = v12;
    lazy protocol witness table accessor for type XPCError and conformance XPCError();
    v7[0] = swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v6, v12, v8);
    v7[1] = &v18;
    uint64_t v18 = v7[0];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
    CheckedContinuation.resume(throwing:)();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
    CheckedContinuation.resume<>()();
    uint64_t v4 = type metadata accessor for XPCDictionary();
    return (*(uint64_t (**)(char *))(*(void *)(v4 - 8) + 8))(v17);
  }
}

uint64_t CheckedContinuation.resume<>()()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t protocol witness for RequestExecutor.performRequest(_:using:) in conformance SystemXPCRequestExecutor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  void *v4 = *(void *)(v6 + 16);
  v4[1] = protocol witness for RequestExecutor.performRequest(_:using:) in conformance SystemXPCRequestExecutor;
  return SystemXPCRequestExecutor.performRequest(_:using:)(a1, a2, a3);
}

uint64_t protocol witness for RequestExecutor.performRequest(_:using:) in conformance SystemXPCRequestExecutor()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = *v1;
  uint64_t v5 = v2 + 16;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)v5 + 8);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)v5 + 8);
  }
  return v3();
}

uint64_t type metadata accessor for SystemXPCRequestExecutor()
{
  return self;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t sub_100005290()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>)
                 - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
  uint64_t v3 = v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));

  return closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(a1, v3);
}

uint64_t outlined init with copy of Result<XPCDictionary, XPCError>(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = type metadata accessor for XPCError();
  }
  else {
    uint64_t v2 = type metadata accessor for XPCDictionary();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  swift_storeEnumTagMultiPayload();
  return a2;
}

unint64_t lazy protocol witness table accessor for type XPCError and conformance XPCError()
{
  uint64_t v2 = lazy protocol witness table cache variable for type XPCError and conformance XPCError;
  if (!lazy protocol witness table cache variable for type XPCError and conformance XPCError)
  {
    type metadata accessor for XPCError();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type XPCError and conformance XPCError);
    return WitnessTable;
  }
  return v2;
}

uint64_t ViewHierarchyAgentError.errorDescription.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Invalid file descriptor received", 0x20uLL, 1)._countAndFlagsBits;
      break;
    case 2:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to connect to TargetHub, another connection already exists", 0x41uLL, 1)._countAndFlagsBits;
      break;
    case 3:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to connect to TargetHub, connection timed out", 0x34uLL, 1)._countAndFlagsBits;
      break;
    default:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Invalid request", 0xFuLL, 1)._countAndFlagsBits;
      break;
  }
  return countAndFlagsBits;
}

BOOL static ViewHierarchyAgentError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t ViewHierarchyAgentError.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t ViewHierarchyAgentError.hashValue.getter()
{
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError;
  if (!lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError;
  if (!lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError;
  if (!lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError);
    return WitnessTable;
  }
  return v2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ViewHierarchyAgentError(char *a1, char *a2)
{
  return static ViewHierarchyAgentError.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance ViewHierarchyAgentError()
{
  return ViewHierarchyAgentError.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ViewHierarchyAgentError()
{
  return ViewHierarchyAgentError.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ViewHierarchyAgentError(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for LocalizedError.errorDescription.getter in conformance ViewHierarchyAgentError()
{
  return ViewHierarchyAgentError.errorDescription.getter(*v0);
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance ViewHierarchyAgentError()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance ViewHierarchyAgentError()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance ViewHierarchyAgentError()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t protocol witness for Error._domain.getter in conformance ViewHierarchyAgentError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance ViewHierarchyAgentError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance ViewHierarchyAgentError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance ViewHierarchyAgentError()
{
  return Error._getEmbeddedNSError()();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ViewHierarchyAgentError(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFC) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 3) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 4;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ViewHierarchyAgentError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFC)
  {
    unsigned int v5 = ((a3 + 3) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFC)
  {
    unsigned int v4 = ((a2 - 253) >> 8) + 1;
    *result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *result = a2 + 3;
    }
  }
  return result;
}

uint64_t getEnumTag for ViewHierarchyAgentError(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for ViewHierarchyAgentError(unsigned char *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ViewHierarchyAgentError()
{
  return &type metadata for ViewHierarchyAgentError;
}

unint64_t base witness table accessor for Error in ViewHierarchyAgentError()
{
  return lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
}

unint64_t base witness table accessor for Equatable in ViewHierarchyAgentError()
{
  return lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
}

uint64_t one-time initialization function for logger()
{
  uint64_t v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, logger);
  __swift_project_value_buffer(v1, (uint64_t)logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchy", 0x1AuLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ViewHierarchyAgent", 0x12uLL, 1);
  return Logger.init(subsystem:category:)();
}

uint64_t logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  unsigned int v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t CaptureController.__allocating_init(requestExecutor:)(uint64_t a1)
{
  return CaptureController.init(requestExecutor:)(a1);
}

uint64_t CaptureController.init(requestExecutor:)(uint64_t a1)
{
  uint64_t v70 = a1;
  uint64_t v68 = 0;
  v56 = partial apply for implicit closure #1 in CaptureController.init(requestExecutor:);
  v57 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v59 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v60 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v61 = "Fatal error";
  v62 = "ViewHierarchyAgent/CaptureController.swift";
  uint64_t v106 = 0;
  uint64_t v105 = 0;
  uint64_t v103 = 0;
  uint64_t v63 = type metadata accessor for Logger();
  uint64_t v64 = *(void *)(v63 - 8);
  uint64_t v65 = v63 - 8;
  unint64_t v66 = (*(void *)(v64 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  v67 = (char *)&v26 - v66;
  uint64_t v79 = type metadata accessor for UUID();
  uint64_t v76 = *(void *)(v79 - 8);
  uint64_t v77 = v79 - 8;
  unint64_t v69 = (*(void *)(v76 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v68);
  v78 = (char *)&v26 - v69;
  uint64_t v90 = type metadata accessor for URL();
  uint64_t v87 = *(void *)(v90 - 8);
  uint64_t v88 = v90 - 8;
  uint64_t v72 = *(void *)(v87 + 64);
  unint64_t v71 = (v72 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = __chkstk_darwin(v70);
  v82 = (char *)&v26 - v71;
  unint64_t v73 = (v72 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v1);
  v93 = (char *)&v26 - v73;
  uint64_t v106 = v2;
  uint64_t v105 = v3;
  v74 = v110;
  outlined init with copy of RequestExecutor(v2, (uint64_t)v110);
  outlined init with take of RequestExecutor(v74, (void *)(v89 + 16));
  v84 = &_s10Foundation14LocalizedErrorPAAE10helpAnchorSSSgvg_ptr;
  unsigned int v4 = self;
  v85 = &SystemXPCRequestExecutor;
  id v75 = [v4 defaultManager];
  id v83 = [v75 temporaryDirectory];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  UUID.init()();
  uint64_t v80 = UUID.uuidString.getter();
  uint64_t v81 = v5;
  (*(void (**)(char *, uint64_t))(v76 + 8))(v78, v79);
  URL.appendingPathComponent(_:)();
  int v6 = v93;
  swift_bridgeObjectRelease();
  v92 = *(void (**)(char *, uint64_t))(v87 + 8);
  uint64_t v91 = v87 + 8;
  v92(v82, v90);

  v86 = &SystemXPCRequestExecutor;
  (*(void (**)(uint64_t, char *, uint64_t))(v87 + 32))(v89 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory, v6, v90);
  v109 = 0;
  id v96 = [self v85[10].name];
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v6, (char *)v86[15].ivars + v89, v90);
  URL._bridgeToObjectiveC()(v7);
  id v95 = v8;
  v92(v93, v90);
  id v104 = v109;
  unsigned int v97 = [v96 createDirectoryAtURL:v95 withIntermediateDirectories:1 attributes:0 error:&v104];
  id v94 = v104;
  id v9 = v104;
  uint64_t v10 = v109;
  v109 = v94;

  if ((v97 & 1) == 0)
  {
    while (1)
    {
      id v27 = v109;
      uint64_t v28 = _convertNSErrorToError(_:)();

      swift_willThrow();
      uint64_t v13 = v67;
      uint64_t v46 = 0;
      swift_errorRetain();
      uint64_t v103 = v28;
      uint64_t v14 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v13, v14, v63);
      swift_errorRetain();
      uint64_t v34 = 7;
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = v28;
      v40 = Logger.logObject.getter();
      int v41 = static os_log_type_t.fault.getter();
      v31 = &v101;
      uint64_t v101 = 12;
      unint64_t v29 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v30 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v42 = v102;
      uint64_t v32 = 17;
      uint64_t v51 = swift_allocObject();
      *(unsigned char *)(v51 + 16) = 32;
      uint64_t v44 = swift_allocObject();
      *(unsigned char *)(v44 + 16) = 8;
      uint64_t v33 = 32;
      uint64_t v15 = swift_allocObject();
      uint64_t v16 = v35;
      uint64_t v36 = v15;
      *(void *)(v15 + 16) = v56;
      *(void *)(v15 + 24) = v16;
      uint64_t v17 = swift_allocObject();
      uint64_t v18 = v36;
      uint64_t v45 = v17;
      *(void *)(v17 + 16) = v57;
      *(void *)(v17 + 24) = v18;
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v37 = _allocateUninitializedArray<A>(_:)();
      v38 = v19;
      swift_retain();
      uint64_t v20 = v51;
      uint64_t v21 = v38;
      *v38 = v58;
      v21[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20;
      swift_retain();
      uint64_t v22 = v44;
      uint64_t v23 = v38;
      v38[2] = v59;
      v23[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v22;
      swift_retain();
      v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v45;
      uint64_t v25 = v38;
      v38[4] = v60;
      v25[5] = v24;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v40, (os_log_type_t)v41))
      {
        uint64_t v12 = v46;
        v48 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v49 = createStorage<A>(capacity:type:)(0);
        uint64_t v50 = createStorage<A>(capacity:type:)(1);
        v52 = &v100;
        v100 = v48;
        v53 = &v108;
        uint64_t v108 = v49;
        v54 = &v107;
        uint64_t v107 = v50;
        serialize(_:at:)(2, &v100);
        serialize(_:at:)(1, v52);
        v98 = v58;
        uint64_t v99 = v51;
        closure #1 in osLogInternal(_:log:type:)(&v98, (uint64_t)v52, (uint64_t)v53, (uint64_t)v54);
        uint64_t v55 = v12;
        if (v12)
        {
          __break(1u);
        }
        else
        {
          v98 = v59;
          uint64_t v99 = v44;
          closure #1 in osLogInternal(_:log:type:)(&v98, (uint64_t)&v100, (uint64_t)&v108, (uint64_t)&v107);
          uint64_t v43 = 0;
          v98 = v60;
          uint64_t v99 = v45;
          closure #1 in osLogInternal(_:log:type:)(&v98, (uint64_t)&v100, (uint64_t)&v108, (uint64_t)&v107);
          _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v41, "Failed to remove temporary directory: %s", v48, v42);
          destroyStorage<A>(_:count:)(v49);
          destroyStorage<A>(_:count:)(v50);
          UnsafeMutablePointer.deallocate()();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v64 + 8))(v67, v63);
      implicit closure #1 in default argument 0 of fatalError(_:file:line:)();
      uint64_t vars0 = 26;
      LODWORD(vars8) = 0;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  __swift_destroy_boxed_opaque_existential_1(v70);
  return v89;
}

uint64_t outlined init with copy of RequestExecutor(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

void *outlined init with take of RequestExecutor(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t implicit closure #1 in CaptureController.init(requestExecutor:)()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100006F78()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in CaptureController.init(requestExecutor:)()
{
  return implicit closure #1 in CaptureController.init(requestExecutor:)();
}

uint64_t CaptureController.deinit()
{
  uint64_t v49 = 0;
  uint64_t v44 = partial apply for implicit closure #1 in CaptureController.deinit;
  uint64_t v45 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v74 = 0;
  uint64_t v72 = 0;
  uint64_t v50 = type metadata accessor for Logger();
  uint64_t v51 = *(void *)(v50 - 8);
  uint64_t v52 = v50 - 8;
  unint64_t v53 = (*(void *)(v51 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  v54 = (char *)v21 - v53;
  uint64_t v59 = type metadata accessor for URL();
  uint64_t v57 = *(void *)(v59 - 8);
  uint64_t v58 = v59 - 8;
  unint64_t v55 = (*(void *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v59);
  uint64_t v0 = (char *)v21 - v55;
  v60 = (char *)v21 - v55;
  uint64_t v74 = v1;
  uint64_t v77 = 0;
  id v65 = [self defaultManager];
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v0, v56 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory, v59);
  URL._bridgeToObjectiveC()(v2);
  id v64 = v3;
  v61 = *(void (**)(char *, uint64_t))(v57 + 8);
  uint64_t v62 = v57 + 8;
  v61(v60, v59);
  id v73 = v77;
  unsigned int v66 = [v65 removeItemAtURL:v64 error:&v73];
  id v63 = v73;
  id v4 = v73;
  uint64_t v5 = v77;
  uint64_t v77 = v63;

  if ((v66 & 1) == 0)
  {
    v21[0] = v77;
    uint64_t v27 = _convertNSErrorToError(_:)();

    swift_willThrow();
    int v8 = v54;
    uint64_t v34 = 0;
    swift_errorRetain();
    uint64_t v72 = v27;
    uint64_t v9 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v8, v9, v50);
    swift_errorRetain();
    v21[6] = (id)7;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v27;
    uint64_t v28 = Logger.logObject.getter();
    int v29 = static os_log_type_t.fault.getter();
    v21[3] = &v70;
    uint64_t v70 = 12;
    v21[1] = (id)lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v21[2] = (id)lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v30 = v71;
    v21[4] = (id)17;
    uint64_t v39 = swift_allocObject();
    *(unsigned char *)(v39 + 16) = 32;
    uint64_t v32 = swift_allocObject();
    *(unsigned char *)(v32 + 16) = 8;
    v21[5] = (id)32;
    uint64_t v10 = swift_allocObject();
    uint64_t v11 = v22;
    uint64_t v23 = v10;
    *(void *)(v10 + 16) = v44;
    *(void *)(v10 + 24) = v11;
    uint64_t v12 = swift_allocObject();
    uint64_t v13 = v23;
    uint64_t v33 = v12;
    *(void *)(v12 + 16) = v45;
    *(void *)(v12 + 24) = v13;
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v24 = _allocateUninitializedArray<A>(_:)();
    uint64_t v25 = v14;
    swift_retain();
    uint64_t v15 = v39;
    uint64_t v16 = v25;
    *uint64_t v25 = v46;
    v16[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v15;
    swift_retain();
    uint64_t v17 = v32;
    uint64_t v18 = v25;
    v25[2] = v47;
    v18[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v17;
    swift_retain();
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v33;
    uint64_t v20 = v25;
    v25[4] = v48;
    v20[5] = v19;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v28, (os_log_type_t)v29))
    {
      uint64_t v7 = v34;
      uint64_t v36 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v37 = createStorage<A>(capacity:type:)(0);
      uint64_t v38 = createStorage<A>(capacity:type:)(1);
      v40 = &v69;
      unint64_t v69 = v36;
      int v41 = &v76;
      uint64_t v76 = v37;
      uint32_t v42 = &v75;
      uint64_t v75 = v38;
      serialize(_:at:)(2, &v69);
      serialize(_:at:)(1, v40);
      v67 = v46;
      uint64_t v68 = v39;
      closure #1 in osLogInternal(_:log:type:)(&v67, (uint64_t)v40, (uint64_t)v41, (uint64_t)v42);
      uint64_t v43 = v7;
      if (v7)
      {
        __break(1u);
      }
      else
      {
        v67 = v47;
        uint64_t v68 = v32;
        closure #1 in osLogInternal(_:log:type:)(&v67, (uint64_t)&v69, (uint64_t)&v76, (uint64_t)&v75);
        uint64_t v31 = 0;
        v67 = v48;
        uint64_t v68 = v33;
        closure #1 in osLogInternal(_:log:type:)(&v67, (uint64_t)&v69, (uint64_t)&v76, (uint64_t)&v75);
        _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v29, "Failed to remove temporary directory: %s", v36, v30);
        destroyStorage<A>(_:count:)(v37);
        destroyStorage<A>(_:count:)(v38);
        UnsafeMutablePointer.deallocate()();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v51 + 8))(v54, v50);
    swift_errorRelease();
    swift_errorRelease();
  }
  __swift_destroy_boxed_opaque_existential_1(v56 + 16);
  v61((char *)(v56 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory), v59);
  return v56;
}

uint64_t implicit closure #1 in CaptureController.deinit()
{
  return Error.localizedDescription.getter();
}

uint64_t CaptureController.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t CaptureController.performRequest(_:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[15] = v3;
  v4[14] = a3;
  v4[13] = a2;
  v4[12] = a1;
  v4[9] = v4;
  v4[7] = 0;
  v4[8] = 0;
  v4[10] = 0;
  v4[11] = 0;
  v4[7] = a1;
  v4[8] = a2;
  v4[10] = a3;
  v4[11] = v3;
  return _swift_task_switch(CaptureController.performRequest(_:using:), 0);
}

uint64_t CaptureController.performRequest(_:using:)()
{
  uint64_t v1 = v0[15];
  v0[9] = v0;
  outlined init with copy of RequestExecutor(v1 + 16, (uint64_t)(v0 + 2));
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v8);
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 + 8) + **(int **)(v9 + 8));
  uint64_t v2 = (void *)swift_task_alloc();
  v7[16] = v2;
  *uint64_t v2 = v7[9];
  v2[1] = CaptureController.performRequest(_:using:);
  uint64_t v3 = v7[14];
  uint64_t v4 = v7[13];
  uint64_t v5 = v7[12];
  return v10(v5, v4, v3, v8, v9);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 72) = *v1;
  *(void *)(v4 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = CaptureController.performRequest(_:using:);
  }
  else
  {
    uint64_t v2 = CaptureController.performRequest(_:using:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 72) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 72) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  *(void *)(v0 + 72) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 72) + 8);
  return v1();
}

uint64_t CaptureController.createTemporaryFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v31 = 0;
  uint64_t v30 = 0;
  v5[1] = 0;
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v14 - 8);
  uint64_t v12 = v14 - 8;
  unint64_t v6 = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v13 = (char *)v5 - v6;
  uint64_t v26 = type metadata accessor for URL();
  uint64_t v17 = *(void **)(v26 - 8);
  uint64_t v18 = v26 - 8;
  uint64_t v8 = v17[8];
  unint64_t v7 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v26);
  uint64_t v19 = (char *)v5 - v7;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = __chkstk_darwin((char *)v5 - v7);
  int v29 = (char *)v5 - v9;
  uint64_t v31 = (char *)v5 - v9;
  uint64_t v30 = v10;
  uint64_t v25 = (void (*)(uint64_t, uint64_t))v17[2];
  uint64_t v24 = v17 + 2;
  v25(v1, v10 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory);
  UUID.init()();
  uint64_t v15 = UUID.uuidString.getter();
  uint64_t v16 = v2;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v14);
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  uint64_t v28 = (void (*)(char *, uint64_t))v17[1];
  uint64_t v27 = v17 + 1;
  v28(v19, v26);
  id v22 = [self defaultManager];
  URL.path.getter();
  uint64_t v20 = v3;
  id v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v22 createFileAtPath:v21];

  ((void (*)(uint64_t, char *, uint64_t))v25)(v23, v29, v26);
  return ((uint64_t (*)(char *, uint64_t))v28)(v29, v26);
}

uint64_t implicit closure #1 in default argument 0 of fatalError(_:file:line:)()
{
  return 0;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

uint64_t createStorage<A>(capacity:type:)(uint64_t a1)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)();
  }
  else {
    return 0;
  }
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

void destroyStorage<A>(_:count:)(uint64_t a1)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)();
    UnsafeMutablePointer.deallocate()();
  }
}

Swift::Void __swiftcall Array._endMutation()()
{
  void *v0 = *v0;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

void *closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v5, a3);
  uint64_t v8 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = specialized _StringGuts._deconstructUTF8<A>(scratch:)((uint64_t)&v17, 0, 0, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  return v11;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }
      else
      {
        int64_t v16 = 0;
      }
      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(v21, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter();
          *uint64_t v17 = a2;
          uint64_t v11 = 0;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          char v22 = v13 & 1;
          char v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    uint64_t v6 = _StringGuts._allocateForDeconstruct()(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  result = _StringObject.sharedUTF8.getter();
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  uint64_t v4 = v6[2];
  specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v4);
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v4, 0);
  specialized Array._endMutation()();
  swift_retain();
  uint64_t v5 = specialized Array.count.getter((uint64_t)v6);
  swift_bridgeObjectRelease();
  result = (void *)v5;
  if (!__OFSUB__(v5, 1)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = String.UTF8View._foreignCount()();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7) {
    return specialized ContiguousArray.init()();
  }
  uint64_t v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v7, 0);
  swift_retain();
  swift_release();
  result = (void *)_StringGuts.copyUTF8(into:)();
  uint64_t v6 = result;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    outlined destroy of String.UTF8View();
    if (v6 == (void *)v7) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = specialized Array.count.getter(*v3);
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }
  return result;
}

uint64_t specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24) >> 1 < result + 1)
  {
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(*(void *)(*(void *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }
  return result;
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(unsigned char *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void specialized Array._endMutation()()
{
  void *v0 = *v0;
}

uint64_t specialized Array.count.getter(uint64_t a1)
{
  return specialized Array._getCount()(a1);
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = a2;
  }
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v5 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v3 = (size_t)v5 + _swift_stdlib_malloc_size(v5);
      swift_retain();
      void v5[2] = a1;
      v5[3] = 2 * (v3 - (void)(v5 + 4));
    }
    else
    {
      swift_retain();
      void v5[2] = a1;
      v5[3] = 2 * v6;
    }
    swift_release();
    return v5;
  }
  else
  {
    swift_retain();
    return &_swiftEmptyArrayStorage;
  }
}

void *specialized ContiguousArray.init()()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, uint64_t a2, char a3, uint64_t a4)
{
  swift_retain();
  uint64_t result = swift_retain();
  uint64_t v15 = *(void *)(a4 + 24) >> 1;
  if (a3)
  {
    if (v15 < a2)
    {
      if ((unsigned __int128)(v15 * (__int128)2) >> 64 != (2 * v15) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v15 < a2) {
        uint64_t v10 = a2;
      }
      else {
        uint64_t v10 = 2 * v15;
      }
    }
    else
    {
      uint64_t v10 = *(void *)(a4 + 24) >> 1;
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  int64_t v9 = *(void *)(a4 + 16);
  if (v10 < v9) {
    uint64_t v8 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v8 = v10;
  }
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v7 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v5 = (size_t)v7 + _swift_stdlib_malloc_size(v7);
      swift_retain();
      void v7[2] = v9;
      v7[3] = 2 * (v5 - (void)(v7 + 4));
    }
    else
    {
      swift_retain();
      void v7[2] = v9;
      v7[3] = 2 * v8;
    }
    swift_release();
    uint64_t v6 = (char *)v7;
  }
  else
  {
    swift_retain();
    uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
  }
  if (a1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v9, v6 + 32);
    *(void *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    specialized UnsafeMutablePointer.initialize(from:count:)((const void *)(a4 + 32), v9, v6 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v6;
}

uint64_t specialized Array._getCount()(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  unsigned char *v4 = a4;
  void *result = v4 + 1;
  return result;
}

uint64_t sub_100009324()
{
  return swift_deallocObject();
}

unsigned char **partial apply for closure #1 in OSLogArguments.append(_:)(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_100009358()
{
  return swift_deallocObject();
}

unsigned char **closure #1 in OSLogArguments.append(_:)partial apply(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_10000938C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000093D8()
{
  return swift_deallocObject();
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _finalizeUninitializedArray<A>(_:)()
{
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

uint64_t sub_100009514()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in CaptureController.deinit()
{
  return implicit closure #1 in CaptureController.deinit();
}

uint64_t sub_10000955C()
{
  return swift_deallocObject();
}

uint64_t sub_100009590()
{
  return swift_deallocObject();
}

uint64_t sub_1000095C4()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100009610()
{
  return swift_deallocObject();
}

void *closure #1 in OSLogArguments.append(_:)partial apply(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

uint64_t ObjC metadata update function for CaptureController()
{
  return type metadata accessor for CaptureController();
}

uint64_t type metadata accessor for CaptureController()
{
  uint64_t v1 = type metadata singleton initialization cache for CaptureController;
  if (!type metadata singleton initialization cache for CaptureController) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t type metadata completion function for CaptureController()
{
  uint64_t updated = type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String.UTF8View()
{
}

Swift::Void __swiftcall enterSandbox()()
{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyAgent", 0x1FuLL, 1);
  String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  char v4 = _set_user_dir_suffix();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    confstr(_:)(65537);
    if (v0)
    {
      String.realpath.getter();
      uint64_t v2 = v1;
      swift_bridgeObjectRelease();
      uint64_t v3 = v2;
    }
    else
    {
      uint64_t v3 = 0;
    }
    if (v3)
    {
      swift_bridgeObjectRelease();
      return;
    }
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Unable to read _CS_DARWIN_USER_TEMP_DIR", 0x27uLL, 1);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Could not create temporary directory.", 0x25uLL, 1);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t confstr(_:)(int a1)
{
  int v5 = a1;
  lazy protocol witness table accessor for type Int and conformance Int();
  lazy protocol witness table accessor for type Int and conformance Int();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  SignedInteger<>.init<A>(_:)();
  v4[0] = Data.init(repeating:count:)();
  v4[1] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  Data.withUnsafeMutableBytes<A>(_:)();
  outlined destroy of Data((uint64_t)v4);
  return v3;
}

uint64_t String.realpath.getter()
{
  swift_bridgeObjectRetain();
  uint64_t v3 = String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  char v4 = realpath_DARWIN_EXTSN((const char *)(v3 + 32), 0);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  uint64_t v1 = String.init(cString:)();
  swift_bridgeObjectRetain();
  UnsafeMutablePointer.deallocate()();
  outlined destroy of String?();
  return v1;
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

uint64_t closure #1 in confstr(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t *a4@<X8>)
{
  if (a1)
  {
    if (a2) {
      uint64_t v8 = a2 - a1;
    }
    else {
      __break(1u);
    }
    if (v8 < 0)
    {
      _fatalErrorMessage(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  uint64_t v7 = (char *)UnsafeMutableBufferPointer.baseAddress.getter();
  lazy protocol witness table accessor for type Int and conformance Int();
  lazy protocol witness table accessor for type Int and conformance Int();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  SignedInteger<>.init<A>(_:)();
  uint64_t result = confstr(a3, v7, v13);
  if (result <= 0)
  {
    *a4 = 0;
    a4[1] = 0;
  }
  else
  {
    if (a1)
    {
      if (a2) {
        uint64_t v6 = a2 - a1;
      }
      else {
        __break(1u);
      }
      if (v6 < 0)
      {
        _fatalErrorMessage(_:_:file:line:flags:)();
        __break(1u);
      }
    }
    uint64_t result = UnsafeMutableBufferPointer.baseAddress.getter();
    if (result)
    {
      uint64_t result = String.init(cString:)();
      *a4 = result;
      a4[1] = v5;
    }
    else
    {
      *a4 = 0;
      a4[1] = 0;
    }
  }
  return result;
}

uint64_t partial apply for closure #1 in confstr(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return closure #1 in confstr(_:)(a1, a2, *(_DWORD *)(v3 + 16), a3);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of Data(uint64_t a1)
{
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_release();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String?()
{
}

uint64_t ViewHierarchyRequest.data.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  char v14 = "Fatal error";
  uint64_t v15 = "Unexpectedly found nil while unwrapping an Optional value";
  int64_t v16 = "ViewHierarchyAgent/ViewHierarchyRequest.swift";
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v19 = type metadata accessor for String.Encoding();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = v19 - 8;
  unint64_t v22 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  char v23 = (char *)v5 - v22;
  uint64_t v26 = __chkstk_darwin(v18);
  uint64_t v27 = v2;
  uint64_t v12 = v18;
  uint64_t v13 = v17;
  uint64_t v9 = v17;
  uint64_t v8 = v18;
  swift_bridgeObjectRetain();
  uint64_t v24 = v8;
  uint64_t v25 = v9;
  static String.Encoding.utf8.getter();
  default argument 1 of String.data(using:allowLossyConversion:)();
  uint64_t v10 = String.data(using:allowLossyConversion:)();
  uint64_t v11 = v3;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
  if ((v11 & 0xF000000000000000) == 0xF000000000000000)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v6 = v10;
    uint64_t v7 = v11;
  }
  v5[1] = v7;
  v5[0] = v6;
  swift_bridgeObjectRelease();
  return v5[0];
}

uint64_t default argument 1 of String.data(using:allowLossyConversion:)()
{
  return 0;
}

void *initializeBufferWithCopyOfBuffer for ViewHierarchyRequest(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  a1[1] = v4;
  return result;
}

uint64_t destroy for ViewHierarchyRequest()
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ViewHierarchyRequest(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  a1[1] = v4;
  return result;
}

void *assignWithCopy for ViewHierarchyRequest(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithTake for ViewHierarchyRequest(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for ViewHierarchyRequest(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v4 = *(_OWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (*(void *)(a1 + 8) < (unint64_t)&_mh_execute_header) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewHierarchyRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_OWORD *)__n128 result = a2 + 0x80000000;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

uint64_t getEnumTag for ViewHierarchyRequest()
{
  return 0;
}

ValueMetadata *type metadata accessor for ViewHierarchyRequest()
{
  return &type metadata for ViewHierarchyRequest;
}

uint64_t default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

void static ViewHierarchyAgent.main()()
{
}

uint64_t sub_10000AC90()
{
  return swift_release();
}

uint64_t *ViewHierarchyAgent.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return &static ViewHierarchyAgent.shared;
}

Swift::Void __swiftcall ViewHierarchyAgent.run()()
{
}

void *one-time initialization function for shared()
{
  type metadata accessor for ViewHierarchyAgent();
  __n128 result = ViewHierarchyAgent.__allocating_init()();
  static ViewHierarchyAgent.shared = (uint64_t)result;
  return result;
}

void *ViewHierarchyAgent.__allocating_init()()
{
  return ViewHierarchyAgent.().init()();
}

void *ViewHierarchyAgent.().init()()
{
  uint64_t v59 = 0;
  uint64_t v45 = 0;
  unint64_t v25 = (*(void *)(*(void *)(type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v35 = (uint64_t)&v25 - v25;
  unint64_t v26 = (*(void *)(*(void *)(type metadata accessor for OS_dispatch_queue.Attributes() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v45);
  uint64_t v34 = (char *)&v25 - v26;
  unint64_t v27 = (*(void *)(*(void *)(type metadata accessor for DispatchQoS() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v45);
  uint64_t v33 = (char *)&v25 - v27;
  uint64_t v59 = v0;
  unint64_t v31 = type metadata accessor for OS_dispatch_queue();
  uint64_t v29 = 19;
  int v52 = 1;
  Swift::String v28 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SystemListenerQueue", 0x13uLL, 1);
  default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v35);
  uint64_t v1 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  Builtin::Word v2 = v29;
  char v3 = v52;
  v58[2] = v1;
  Swift::String v30 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("RemoteListenerQueue", v2, v3 & 1);
  default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v35);
  uint64_t v4 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  char v5 = v52;
  v58[3] = v4;
  Swift::String v32 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("TargetHubListenerQueue", 0x16uLL, v5 & 1);
  default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v35);
  uint64_t v6 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v7 = v58;
  v58[4] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int32, CaptureController));
  uint64_t v36 = _allocateUninitializedArray<A>(_:)();
  type metadata accessor for CaptureController();
  uint64_t v37 = &type metadata for Int32;
  uint64_t v38 = &protocol witness table for Int32;
  v7[11] = Dictionary.init(dictionaryLiteral:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int32, CheckedContinuation<SystemXPCPeerConnection, Error>));
  uint64_t v39 = _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  v7[12] = Dictionary.init(dictionaryLiteral:)();
  uint64_t v47 = type metadata accessor for SystemXPCListenerConnection();
  Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyAgent.xpc", 0x23uLL, v52 & 1);
  uint64_t countAndFlagsBits = v8._countAndFlagsBits;
  object = v8._object;
  id v41 = (id)v58[2];
  id v9 = v41;
  uint64_t v10 = static SystemXPCConnection.machServiceListenerConnection(name:targetQueue:)();
  uint64_t v11 = v58;
  uint64_t v43 = v10;
  uint64_t v44 = v12;

  swift_bridgeObjectRelease();
  uint64_t v13 = v44;
  v11[5] = v43;
  v11[6] = v13;
  type metadata accessor for RemoteXPCListenerConnection();
  Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyAgent.remote", 0x26uLL, v52 & 1);
  uint64_t v46 = v14._countAndFlagsBits;
  uint64_t v49 = v14._object;
  id v48 = (id)v58[3];
  id v15 = v48;
  uint64_t v50 = static RemoteXPCConnection.remoteServiceListenerConnection(serviceName:targetQueue:)();
  uint64_t v51 = v16;

  swift_bridgeObjectRelease();
  uint64_t v17 = v51;
  char v18 = v52;
  uint64_t v19 = v58;
  v58[7] = v50;
  v19[8] = v17;
  Swift::String v20 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyTargetHub.xpc", 0x27uLL, v18 & 1);
  uint64_t v53 = v20._countAndFlagsBits;
  unint64_t v55 = v20._object;
  id v54 = (id)v58[4];
  id v21 = v54;
  uint64_t v56 = static SystemXPCConnection.machServiceListenerConnection(name:targetQueue:)();
  uint64_t v57 = v22;

  swift_bridgeObjectRelease();
  uint64_t v23 = v57;
  __n128 result = v58;
  v58[9] = v56;
  result[10] = v23;
  return result;
}

Swift::Void __swiftcall ViewHierarchyAgent.startSystemListener()()
{
  uint64_t v38 = 0;
  uint64_t v24 = partial apply for closure #1 in ViewHierarchyAgent.startSystemListener();
  id v21 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t v48 = 0;
  uint64_t v22 = 0;
  uint64_t v33 = type metadata accessor for Logger();
  uint64_t v31 = *(void *)(v33 - 8);
  uint64_t v32 = v33 - 8;
  unint64_t v23 = (*(void *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v33);
  uint64_t v29 = (char *)v9 - v23;
  uint64_t v48 = v0;
  Swift::String v28 = *(uint64_t **)(v0 + 40);
  uint64_t v1 = v28;
  uint64_t v26 = *(void *)(v0 + 48);
  swift_retain();
  uint64_t v25 = *v1;
  swift_retain();
  dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)();
  uint64_t v2 = v27;
  swift_release();
  swift_release();
  uint64_t v30 = *(void *)(v2 + 40);
  swift_retain();
  dispatch thunk of XPCConnection.activate()();
  char v3 = v29;
  swift_release();
  uint64_t v4 = logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v3, v4, v33);
  v40 = Logger.logObject.getter();
  int v39 = static os_log_type_t.info.getter();
  uint64_t v36 = &v46;
  uint64_t v46 = 2;
  unint64_t v34 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v35 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v37 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v41 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v40, (os_log_type_t)v39))
  {
    uint64_t v5 = v22;
    uint64_t v11 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v9[2] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v10 = 0;
    uint64_t v12 = createStorage<A>(capacity:type:)(0);
    uint64_t v13 = createStorage<A>(capacity:type:)(v10);
    uint64_t v17 = &v45;
    uint64_t v45 = v11;
    char v18 = &v44;
    uint64_t v44 = v12;
    id v15 = &v43;
    uint64_t v43 = v13;
    unsigned int v14 = 0;
    serialize(_:at:)(0, &v45);
    serialize(_:at:)(v14, v17);
    uint64_t v42 = v41;
    uint64_t v16 = v9;
    __chkstk_darwin(v9);
    uint64_t v6 = v18;
    uint64_t v7 = &v9[-6];
    uint64_t v19 = &v9[-6];
    void v7[2] = v17;
    v7[3] = v6;
    v7[4] = v8;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v5)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v39, "Started SystemXPC listener", v11, v37);
      v9[1] = 0;
      destroyStorage<A>(_:count:)(v12);
      destroyStorage<A>(_:count:)(v13);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v31 + 8))(v29, v33);
}

Swift::Void __swiftcall ViewHierarchyAgent.startRemoteListener()()
{
  uint64_t v38 = 0;
  uint64_t v24 = partial apply for closure #1 in ViewHierarchyAgent.startRemoteListener();
  id v21 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v48 = 0;
  uint64_t v22 = 0;
  uint64_t v33 = type metadata accessor for Logger();
  uint64_t v31 = *(void *)(v33 - 8);
  uint64_t v32 = v33 - 8;
  unint64_t v23 = (*(void *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v33);
  uint64_t v29 = (char *)v9 - v23;
  uint64_t v48 = v0;
  Swift::String v28 = *(uint64_t **)(v0 + 56);
  uint64_t v1 = v28;
  uint64_t v26 = *(void *)(v0 + 64);
  swift_retain();
  uint64_t v25 = *v1;
  swift_retain();
  dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)();
  uint64_t v2 = v27;
  swift_release();
  swift_release();
  uint64_t v30 = *(void *)(v2 + 56);
  swift_retain();
  dispatch thunk of XPCConnection.activate()();
  char v3 = v29;
  swift_release();
  uint64_t v4 = logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v3, v4, v33);
  v40 = Logger.logObject.getter();
  int v39 = static os_log_type_t.info.getter();
  uint64_t v36 = &v46;
  uint64_t v46 = 2;
  unint64_t v34 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v35 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v37 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v41 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v40, (os_log_type_t)v39))
  {
    uint64_t v5 = v22;
    uint64_t v11 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v9[2] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v10 = 0;
    uint64_t v12 = createStorage<A>(capacity:type:)(0);
    uint64_t v13 = createStorage<A>(capacity:type:)(v10);
    uint64_t v17 = &v45;
    uint64_t v45 = v11;
    char v18 = &v44;
    uint64_t v44 = v12;
    id v15 = &v43;
    uint64_t v43 = v13;
    unsigned int v14 = 0;
    serialize(_:at:)(0, &v45);
    serialize(_:at:)(v14, v17);
    uint64_t v42 = v41;
    uint64_t v16 = v9;
    __chkstk_darwin(v9);
    uint64_t v6 = v18;
    uint64_t v7 = &v9[-6];
    uint64_t v19 = &v9[-6];
    void v7[2] = v17;
    v7[3] = v6;
    v7[4] = v8;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v5)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v39, "Started RemoteXPC listener", v11, v37);
      v9[1] = 0;
      destroyStorage<A>(_:count:)(v12);
      destroyStorage<A>(_:count:)(v13);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v31 + 8))(v29, v33);
}

Swift::Void __swiftcall ViewHierarchyAgent.startTargetHubListener()()
{
  uint64_t v38 = 0;
  uint64_t v24 = partial apply for closure #1 in ViewHierarchyAgent.startTargetHubListener();
  id v21 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v48 = 0;
  uint64_t v22 = 0;
  uint64_t v33 = type metadata accessor for Logger();
  uint64_t v31 = *(void *)(v33 - 8);
  uint64_t v32 = v33 - 8;
  unint64_t v23 = (*(void *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v33);
  uint64_t v29 = (char *)v9 - v23;
  uint64_t v48 = v0;
  Swift::String v28 = *(uint64_t **)(v0 + 72);
  uint64_t v1 = v28;
  uint64_t v26 = *(void *)(v0 + 80);
  swift_retain();
  uint64_t v25 = *v1;
  swift_retain();
  dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)();
  uint64_t v2 = v27;
  swift_release();
  swift_release();
  uint64_t v30 = *(void *)(v2 + 72);
  swift_retain();
  dispatch thunk of XPCConnection.activate()();
  char v3 = v29;
  swift_release();
  uint64_t v4 = logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v3, v4, v33);
  v40 = Logger.logObject.getter();
  int v39 = static os_log_type_t.info.getter();
  uint64_t v36 = &v46;
  uint64_t v46 = 2;
  unint64_t v34 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v35 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v37 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v41 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v40, (os_log_type_t)v39))
  {
    uint64_t v5 = v22;
    uint64_t v11 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v9[2] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v10 = 0;
    uint64_t v12 = createStorage<A>(capacity:type:)(0);
    uint64_t v13 = createStorage<A>(capacity:type:)(v10);
    uint64_t v17 = &v45;
    uint64_t v45 = v11;
    char v18 = &v44;
    uint64_t v44 = v12;
    id v15 = &v43;
    uint64_t v43 = v13;
    unsigned int v14 = 0;
    serialize(_:at:)(0, &v45);
    serialize(_:at:)(v14, v17);
    uint64_t v42 = v41;
    uint64_t v16 = v9;
    __chkstk_darwin(v9);
    uint64_t v6 = v18;
    uint64_t v7 = &v9[-6];
    uint64_t v19 = &v9[-6];
    void v7[2] = v17;
    v7[3] = v6;
    v7[4] = v8;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v5)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v39, "Started Targethub listener", v11, v37);
      v9[1] = 0;
      destroyStorage<A>(_:count:)(v12);
      destroyStorage<A>(_:count:)(v13);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v31 + 8))(v29, v33);
}

uint64_t type metadata accessor for ViewHierarchyAgent()
{
  return self;
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  uint64_t v2 = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = a1;
  uint64_t v12 = a2;
  uint64_t v11 = partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener();
  uint64_t v20 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  unint64_t v14 = (*(void *)(*(void *)(v15 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = (uint64_t *)((char *)&v7 - v14);
  uint64_t v20 = (uint64_t *)__chkstk_darwin(v13);
  uint64_t v19 = v2;
  outlined init with copy of Result<XPCPeerConnection, XPCError>(v20, (uint64_t *)((char *)&v7 - v14));
  if (swift_getEnumCaseMultiPayload() == 1) {
    return outlined destroy of Result<XPCPeerConnection, XPCError>((uint64_t)v16);
  }
  uint64_t v4 = (void *)*v16;
  uint64_t v10 = v4;
  uint64_t v8 = v16[1];
  uint64_t v17 = v4;
  uint64_t v18 = v8;
  uint64_t v7 = *v4;
  swift_retain();
  swift_retain();
  uint64_t v5 = (void *)swift_allocObject();
  uint64_t v6 = v8;
  id v9 = v5;
  void v5[2] = v12;
  v5[3] = v4;
  v5[4] = v6;
  dispatch thunk of XPCPeerConnection.setEventHandler(_:)();
  swift_release();
  swift_retain();
  dispatch thunk of XPCConnection.activate()();
  swift_release();
  return swift_release();
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1)
{
  return closure #1 in ViewHierarchyAgent.startSystemListener()(a1, v1);
}

uint64_t closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v83 = a1;
  uint64_t v80 = a2;
  uint64_t v81 = a3;
  uint64_t v82 = a4;
  uint64_t v65 = 0;
  id v54 = partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener();
  unint64_t v55 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v56 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v97 = 0;
  uint64_t v96 = 0;
  uint64_t v94 = 0;
  uint64_t v95 = 0;
  uint64_t v99 = 0;
  uint64_t v59 = 0;
  v98 = 0;
  uint64_t v60 = type metadata accessor for Logger();
  uint64_t v61 = *(void *)(v60 - 8);
  uint64_t v62 = v60 - 8;
  unint64_t v63 = (*(void *)(v61 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  id v64 = (char *)v25 - v63;
  uint64_t v66 = type metadata accessor for XPCError();
  uint64_t v68 = *(void *)(v66 - 8);
  uint64_t v67 = v66 - 8;
  uint64_t v69 = v68;
  uint64_t v70 = *(void *)(v68 + 64);
  unint64_t v71 = (v70 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v65);
  uint64_t v72 = (char *)v25 - v71;
  unint64_t v73 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  uint64_t v74 = (char *)v25 - v73;
  uint64_t v99 = (char *)v25 - v73;
  uint64_t v75 = type metadata accessor for XPCDictionary();
  uint64_t v76 = *(void *)(v75 - 8);
  uint64_t v77 = v75 - 8;
  unint64_t v78 = (*(void *)(v76 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v75);
  uint64_t v79 = (char *)v25 - v78;
  v98 = (char *)v25 - v78;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  unint64_t v84 = (*(void *)(*(void *)(v85 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v83);
  v86 = (char *)v25 - v84;
  uint64_t v97 = v6;
  uint64_t v96 = v7;
  uint64_t v94 = v8;
  uint64_t v95 = v9;
  outlined init with copy of Result<XPCDictionary, XPCError>(v6, (uint64_t)v25 - v84);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = v64;
    uint64_t v33 = v69;
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
    uint64_t v35 = v68 + 32;
    v36(v74, v86, v66);
    uint64_t v99 = v74;
    uint64_t v12 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v11, v12, v60);
    (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v72, v74, v66);
    unint64_t v34 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    uint64_t v43 = 7;
    uint64_t v44 = swift_allocObject();
    v36((char *)(v44 + v34), v72, v66);
    int v52 = Logger.logObject.getter();
    int v53 = static os_log_type_t.default.getter();
    int v39 = &v92;
    uint64_t v92 = 12;
    unint64_t v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v38 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v40 = v93;
    uint64_t v41 = 17;
    uint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 32;
    uint64_t v47 = swift_allocObject();
    *(unsigned char *)(v47 + 16) = 8;
    uint64_t v42 = 32;
    uint64_t v13 = swift_allocObject();
    uint64_t v14 = v44;
    uint64_t v45 = v13;
    *(void *)(v13 + 16) = v54;
    *(void *)(v13 + 24) = v14;
    uint64_t v15 = swift_allocObject();
    uint64_t v16 = v45;
    uint64_t v49 = v15;
    *(void *)(v15 + 16) = v55;
    *(void *)(v15 + 24) = v16;
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v48 = _allocateUninitializedArray<A>(_:)();
    uint64_t v50 = v17;
    swift_retain();
    uint64_t v18 = v46;
    uint64_t v19 = v50;
    *uint64_t v50 = v56;
    v19[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18;
    swift_retain();
    uint64_t v20 = v47;
    id v21 = v50;
    v50[2] = v57;
    v21[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20;
    swift_retain();
    uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v49;
    unint64_t v23 = v50;
    v50[4] = v58;
    v23[5] = v22;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v52, (os_log_type_t)v53))
    {
      uint64_t v24 = v59;
      uint64_t v26 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v25[3] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v27 = createStorage<A>(capacity:type:)(0);
      uint64_t v28 = createStorage<A>(capacity:type:)(1);
      uint64_t v29 = &v91;
      uint64_t v91 = v26;
      uint64_t v30 = &v90;
      uint64_t v90 = v27;
      uint64_t v31 = &v89;
      uint64_t v89 = v28;
      serialize(_:at:)(2, &v91);
      serialize(_:at:)(1, v29);
      uint64_t v87 = v56;
      uint64_t v88 = v46;
      closure #1 in osLogInternal(_:log:type:)(&v87, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31);
      uint64_t v32 = v24;
      if (v24)
      {
        __break(1u);
      }
      else
      {
        uint64_t v87 = v57;
        uint64_t v88 = v47;
        closure #1 in osLogInternal(_:log:type:)(&v87, (uint64_t)&v91, (uint64_t)&v90, (uint64_t)&v89);
        v25[1] = 0;
        uint64_t v87 = v58;
        uint64_t v88 = v49;
        closure #1 in osLogInternal(_:log:type:)(&v87, (uint64_t)&v91, (uint64_t)&v90, (uint64_t)&v89);
        _os_log_impl((void *)&_mh_execute_header, v52, (os_log_type_t)v53, "SystemXPCPeerConnection received an error: %s", v26, v40);
        destroyStorage<A>(_:count:)(v27);
        destroyStorage<A>(_:count:)(v28);
        UnsafeMutablePointer.deallocate()();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v61 + 8))(v64, v60);
    return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v74, v66);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v79, v86, v75);
    v98 = v79;
    swift_retain();
    ViewHierarchyAgent.handleMessage(_:from:)((uint64_t)v79, v81, v82);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v79, v75);
  }
}

uint64_t ViewHierarchyAgent.handleMessage(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v154 = a1;
  uint64_t v158 = a2;
  uint64_t v155 = a3;
  uint64_t v137 = 0;
  v124 = partial apply for implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:);
  v125 = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0;
  v126 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v127 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v128 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v129 = "Fatal error";
  v130 = "Unexpectedly found nil while unwrapping an Optional value";
  v131 = "ViewHierarchyAgent/ViewHierarchyAgent.swift";
  v132 = &async function pointer to partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:);
  v133 = closure #1 in osLogInternal(_:log:type:)partial apply;
  v185 = 0;
  uint64_t v184 = 0;
  uint64_t v182 = 0;
  uint64_t v183 = 0;
  uint64_t v181 = 0;
  uint64_t v179 = 0;
  uint64_t v180 = 0;
  uint64_t v134 = 0;
  uint64_t v171 = 0;
  uint64_t v172 = 0;
  uint64_t v159 = 0;
  unint64_t v135 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  v136 = (char *)&v50 - v135;
  uint64_t v138 = type metadata accessor for Logger();
  uint64_t v139 = *(void *)(v138 - 8);
  uint64_t v140 = v138 - 8;
  unint64_t v141 = (*(void *)(v139 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v137);
  v142 = (char *)&v50 - v141;
  unint64_t v143 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  v144 = (char *)&v50 - v143;
  uint64_t v145 = type metadata accessor for XPCDictionary();
  uint64_t v147 = *(void *)(v145 - 8);
  uint64_t v146 = v145 - 8;
  uint64_t v148 = v147;
  uint64_t v149 = *(void *)(v147 + 64);
  unint64_t v150 = (v149 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v145);
  v151 = (char *)&v50 - v150;
  v185 = (char *)&v50 - v150;
  unint64_t v152 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v6);
  v153 = (char *)&v50 - v152;
  unint64_t v156 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = __chkstk_darwin(v158);
  uint64_t v157 = (uint64_t)&v50 - v156;
  uint64_t v184 = v9;
  uint64_t v182 = v8;
  uint64_t v183 = v10;
  uint64_t v181 = v3;
  swift_retain();
  if (v158)
  {
    uint64_t v121 = v158;
    uint64_t v122 = v155;
    uint64_t v116 = v155;
    uint64_t v117 = v158;
    uint64_t v179 = v158;
    uint64_t v180 = v155;
    object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("action", 6uLL, 1)._object;
    uint64_t v119 = XPCDictionary.subscript.getter();
    uint64_t v120 = v11;
    if (v11)
    {
      uint64_t v114 = v119;
      uint64_t v115 = v120;
      uint64_t v111 = v120;
      uint64_t v110 = v119;
      uint64_t v171 = v119;
      uint64_t v172 = v120;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      Swift::String v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("performRequest", 0xEuLL, 1);
      uint64_t countAndFlagsBits = v12._countAndFlagsBits;
      v112 = v12._object;
      swift_bridgeObjectRetain();
      uint64_t v169 = v110;
      uint64_t v170 = v111;
      int v113 = static String.== infix(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v113)
      {
        swift_bridgeObjectRelease();
        uint64_t v13 = type metadata accessor for TaskPriority();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v157, 1);
        swift_retain();
        swift_retain();
        uint64_t v106 = v148;
        (*(void (**)(char *, uint64_t, uint64_t))(v147 + 16))(v153, v154, v145);
        unint64_t v107 = (*(unsigned __int8 *)(v106 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v106 + 80);
        uint64_t v14 = (void *)swift_allocObject();
        uint64_t v15 = v123;
        uint64_t v16 = v117;
        uint64_t v17 = v116;
        unint64_t v18 = v107;
        uint64_t v19 = v147;
        uint64_t v20 = v153;
        uint64_t v21 = v145;
        uint64_t v108 = v14;
        v14[2] = 0;
        v14[3] = 0;
        v14[4] = v15;
        v14[5] = v16;
        v14[6] = v17;
        (*(void (**)(char *, char *, uint64_t))(v19 + 32))((char *)v14 + v18, v20, v21);
        _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v157, (uint64_t)v132, (uint64_t)v108, (uint64_t)&type metadata for () + 8);
        swift_release();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        Swift::String v104 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("finish", 6uLL, 1);
        swift_bridgeObjectRetain();
        uint64_t v167 = v110;
        uint64_t v168 = v111;
        int v105 = static String.== infix(_:_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v105)
        {
          uint64_t v22 = v134;
          swift_bridgeObjectRelease();
          ViewHierarchyAgent.finish(_:)();
          uint64_t v103 = v22;
          if (v22)
          {
            uint64_t v53 = v103;
            swift_errorRetain();
            uint64_t v159 = v53;
            XPCDictionary.createReply()();
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v147 + 48))(v136, 1, v145) == 1)
            {
              char v46 = 2;
              uint64_t v47 = 172;
              LODWORD(v48) = 0;
              _assertionFailure(_:_:file:line:flags:)();
              __break(1u);
            }
            (*(void (**)(char *, char *, uint64_t))(v147 + 32))(v151, v136, v145);
            Swift::String v50 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("error", 5uLL, 1);
            swift_getErrorValue();
            Error.localizedDescription.getter();
            XPCDictionary.subscript.setter();
            swift_retain();
            (*(void (**)(char *, char *, uint64_t))(v147 + 16))(v153, v151, v145);
            dispatch thunk of XPCConnection.send(message:)();
            int v52 = *(void (**)(char *, uint64_t))(v147 + 8);
            uint64_t v51 = v147 + 8;
            v52(v153, v145);
            swift_release();
            v52(v151, v145);
            swift_errorRelease();
            swift_errorRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_retain();
          dispatch thunk of XPCConnection.cancel()();
          unint64_t v23 = v144;
          swift_release();
          uint64_t v24 = logger.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v139 + 16))(v23, v24, v138);
          swift_bridgeObjectRetain();
          uint64_t v91 = 32;
          uint64_t v92 = 7;
          uint64_t v25 = swift_allocObject();
          uint64_t v26 = v111;
          uint64_t v93 = v25;
          *(void *)(v25 + 16) = v110;
          *(void *)(v25 + 24) = v26;
          uint64_t v101 = Logger.logObject.getter();
          int v102 = static os_log_type_t.error.getter();
          uint64_t v88 = &v165;
          uint64_t v165 = 12;
          unint64_t v86 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          unint64_t v87 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          uint32_t v89 = v166;
          uint64_t v90 = 17;
          uint64_t v95 = swift_allocObject();
          *(unsigned char *)(v95 + 16) = 32;
          uint64_t v96 = swift_allocObject();
          *(unsigned char *)(v96 + 16) = 8;
          uint64_t v27 = swift_allocObject();
          uint64_t v28 = v93;
          uint64_t v94 = v27;
          *(void *)(v27 + 16) = v124;
          *(void *)(v27 + 24) = v28;
          uint64_t v29 = swift_allocObject();
          uint64_t v30 = v94;
          uint64_t v98 = v29;
          *(void *)(v29 + 16) = v125;
          *(void *)(v29 + 24) = v30;
          uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          uint64_t v97 = _allocateUninitializedArray<A>(_:)();
          uint64_t v99 = v31;
          swift_retain();
          uint64_t v32 = v95;
          uint64_t v33 = v99;
          *uint64_t v99 = v126;
          v33[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v32;
          swift_retain();
          uint64_t v34 = v96;
          uint64_t v35 = v99;
          v99[2] = v127;
          v35[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v34;
          swift_retain();
          uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v98;
          unint64_t v37 = v99;
          v99[4] = v128;
          v37[5] = v36;
          _finalizeUninitializedArray<A>(_:)();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v101, (os_log_type_t)v102))
          {
            uint64_t v38 = v134;
            uint64_t v79 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            uint64_t v80 = createStorage<A>(capacity:type:)(0);
            uint64_t v81 = createStorage<A>(capacity:type:)(1);
            uint64_t v82 = &v164;
            v164 = v79;
            uint64_t v83 = &v163;
            uint64_t v163 = v80;
            unint64_t v84 = &v162;
            uint64_t v162 = v81;
            serialize(_:at:)(2, &v164);
            serialize(_:at:)(1, v82);
            v160 = v126;
            uint64_t v161 = v95;
            closure #1 in osLogInternal(_:log:type:)(&v160, (uint64_t)v82, (uint64_t)v83, (uint64_t)v84);
            uint64_t v85 = v38;
            if (v38)
            {
              __break(1u);
            }
            else
            {
              v160 = v127;
              uint64_t v161 = v96;
              closure #1 in osLogInternal(_:log:type:)(&v160, (uint64_t)&v164, (uint64_t)&v163, (uint64_t)&v162);
              uint64_t v77 = 0;
              v160 = v128;
              uint64_t v161 = v98;
              closure #1 in osLogInternal(_:log:type:)(&v160, (uint64_t)&v164, (uint64_t)&v163, (uint64_t)&v162);
              _os_log_impl((void *)&_mh_execute_header, v101, (os_log_type_t)v102, "Failed to handle message with action %s", v79, v89);
              destroyStorage<A>(_:count:)(v80);
              destroyStorage<A>(_:count:)(v81);
              UnsafeMutablePointer.deallocate()();
              swift_release();
              swift_release();
              swift_release();
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }

          (*(void (**)(char *, uint64_t))(v139 + 8))(v144, v138);
        }
      }
      swift_bridgeObjectRelease();
      return swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v76 = XPCDictionary.underlyingConnection.getter();
      if (v76)
      {
        uint64_t v75 = v76;
        uint64_t v74 = v76;
        dispatch thunk of XPCConnection.cancel()();
        swift_release();
      }
      uint32_t v40 = v142;
      uint64_t v41 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v139 + 16))(v40, v41, v138);
      uint64_t v72 = Logger.logObject.getter();
      int v71 = static os_log_type_t.error.getter();
      uint64_t v69 = &v177;
      uint64_t v177 = 2;
      unint64_t v67 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v68 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v70 = v178;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v73 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v72, (os_log_type_t)v71))
      {
        uint64_t v42 = v134;
        uint64_t v57 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v56 = 0;
        uint64_t v58 = createStorage<A>(capacity:type:)(0);
        uint64_t v59 = createStorage<A>(capacity:type:)(v56);
        unint64_t v63 = &v176;
        v176 = v57;
        id v64 = &v175;
        uint64_t v175 = v58;
        uint64_t v61 = &v174;
        uint64_t v174 = v59;
        unsigned int v60 = 0;
        serialize(_:at:)(0, &v176);
        serialize(_:at:)(v60, v63);
        uint64_t v173 = v73;
        uint64_t v62 = &v50;
        __chkstk_darwin(&v50);
        uint64_t v43 = v64;
        uint64_t v44 = &v50 - 3;
        uint64_t v65 = &v50 - 3;
        v44[1]._uint64_t countAndFlagsBits = (uint64_t)v63;
        v44[1]._object = v43;
        v44[2]._uint64_t countAndFlagsBits = v45;
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v42)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl((void *)&_mh_execute_header, v72, (os_log_type_t)v71, "Failed to handle message without action", v57, v70);
          uint64_t v54 = 0;
          destroyStorage<A>(_:count:)(v58);
          destroyStorage<A>(_:count:)(v59);
          UnsafeMutablePointer.deallocate()();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v139 + 8))(v142, v138);
      return swift_release();
    }
  }
  else
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("A message received over an XPC connection should have an underlying connection", 0x4EuLL, 1);
    uint64_t v48 = 147;
    int v49 = 0;
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()()
{
  return Error.localizedDescription.getter();
}

uint64_t closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1, uint64_t a2)
{
  uint64_t v79 = a1;
  uint64_t v78 = a2;
  uint64_t v63 = 0;
  uint64_t v56 = partial apply for implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener();
  uint64_t v57 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v59 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  unsigned int v60 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v61 = partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener();
  uint64_t v93 = 0;
  uint64_t v92 = 0;
  uint64_t v94 = 0;
  uint64_t v62 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v64 = type metadata accessor for Logger();
  uint64_t v65 = *(void *)(v64 - 8);
  uint64_t v66 = v64 - 8;
  unint64_t v67 = (*(void *)(v65 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  unint64_t v68 = (char *)v23 - v67;
  uint64_t v69 = type metadata accessor for XPCError();
  uint64_t v71 = *(void *)(v69 - 8);
  uint64_t v70 = v69 - 8;
  uint64_t v72 = v71;
  uint64_t v73 = *(void *)(v71 + 64);
  unint64_t v74 = (v73 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v69);
  uint64_t v75 = (char *)v23 - v74;
  unint64_t v76 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v23 - v74);
  uint64_t v77 = (char *)v23 - v76;
  uint64_t v94 = (char *)v23 - v76;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  unint64_t v80 = (*(void *)(*(void *)(v81 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = (uint64_t *)__chkstk_darwin(v79);
  uint64_t v82 = (char *)v23 - v80;
  uint64_t v93 = v3;
  uint64_t v92 = v4;
  outlined init with copy of Result<XPCPeerConnection, XPCError>(v3, (void *)((char *)v23 - v80));
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = v68;
    uint64_t v31 = v72;
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
    uint64_t v33 = v71 + 32;
    v34(v77, v82, v69);
    uint64_t v94 = v77;
    uint64_t v10 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v9, v10, v64);
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v75, v77, v69);
    unint64_t v32 = (*(unsigned __int8 *)(v31 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
    uint64_t v41 = 7;
    uint64_t v42 = swift_allocObject();
    v34((char *)(v42 + v32), v75, v69);
    Swift::String v50 = Logger.logObject.getter();
    int v51 = static os_log_type_t.debug.getter();
    unint64_t v37 = &v90;
    uint64_t v90 = 12;
    unint64_t v35 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v38 = v91;
    uint64_t v39 = 17;
    uint64_t v44 = swift_allocObject();
    *(unsigned char *)(v44 + 16) = 32;
    uint64_t v45 = swift_allocObject();
    *(unsigned char *)(v45 + 16) = 8;
    uint64_t v40 = 32;
    uint64_t v11 = swift_allocObject();
    uint64_t v12 = v42;
    uint64_t v43 = v11;
    *(void *)(v11 + 16) = v56;
    *(void *)(v11 + 24) = v12;
    uint64_t v13 = swift_allocObject();
    uint64_t v14 = v43;
    uint64_t v47 = v13;
    *(void *)(v13 + 16) = v57;
    *(void *)(v13 + 24) = v14;
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v46 = _allocateUninitializedArray<A>(_:)();
    uint64_t v48 = v15;
    swift_retain();
    uint64_t v16 = v44;
    uint64_t v17 = v48;
    uint8_t *v48 = v58;
    v17[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v16;
    swift_retain();
    uint64_t v18 = v45;
    uint64_t v19 = v48;
    v48[2] = v59;
    v19[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18;
    swift_retain();
    uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v47;
    uint64_t v21 = v48;
    v48[4] = v60;
    v21[5] = v20;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v50, (os_log_type_t)v51))
    {
      uint64_t v22 = v62;
      uint64_t v24 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v23[2] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v25 = createStorage<A>(capacity:type:)(0);
      uint64_t v26 = createStorage<A>(capacity:type:)(1);
      uint64_t v27 = &v89;
      uint32_t v89 = v24;
      uint64_t v28 = &v88;
      uint64_t v88 = v25;
      uint64_t v29 = &v87;
      uint64_t v87 = v26;
      serialize(_:at:)(2, &v89);
      serialize(_:at:)(1, v27);
      uint64_t v85 = v58;
      uint64_t v86 = v44;
      closure #1 in osLogInternal(_:log:type:)(&v85, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29);
      uint64_t v30 = v22;
      if (v22)
      {
        __break(1u);
      }
      else
      {
        uint64_t v85 = v59;
        uint64_t v86 = v45;
        closure #1 in osLogInternal(_:log:type:)(&v85, (uint64_t)&v89, (uint64_t)&v88, (uint64_t)&v87);
        v23[0] = 0;
        uint64_t v85 = v60;
        uint64_t v86 = v47;
        closure #1 in osLogInternal(_:log:type:)(&v85, (uint64_t)&v89, (uint64_t)&v88, (uint64_t)&v87);
        _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v51, "%s", v24, v38);
        destroyStorage<A>(_:count:)(v25);
        destroyStorage<A>(_:count:)(v26);
        UnsafeMutablePointer.deallocate()();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v65 + 8))(v68, v64);
    return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v77, v69);
  }
  else
  {
    uint64_t v5 = *(void **)v82;
    uint64_t v55 = v5;
    uint64_t v53 = *((void *)v82 + 1);
    uint64_t v83 = v5;
    uint64_t v84 = v53;
    uint64_t v52 = *v5;
    swift_retain();
    swift_retain();
    uint64_t v6 = (void *)swift_allocObject();
    uint64_t v7 = v53;
    uint64_t v54 = v6;
    v6[2] = v78;
    v6[3] = v5;
    v6[4] = v7;
    dispatch thunk of XPCPeerConnection.setEventHandler(_:)();
    swift_release();
    swift_retain();
    dispatch thunk of XPCConnection.activate()();
    swift_release();
    return swift_release();
  }
}

uint64_t closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v83 = a1;
  uint64_t v80 = a2;
  uint64_t v81 = a3;
  uint64_t v82 = a4;
  uint64_t v65 = 0;
  uint64_t v54 = partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener();
  uint64_t v55 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v56 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v97 = 0;
  uint64_t v96 = 0;
  uint64_t v94 = 0;
  uint64_t v95 = 0;
  uint64_t v99 = 0;
  uint64_t v59 = 0;
  uint64_t v98 = 0;
  uint64_t v60 = type metadata accessor for Logger();
  uint64_t v61 = *(void *)(v60 - 8);
  uint64_t v62 = v60 - 8;
  unint64_t v63 = (*(void *)(v61 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v64 = (char *)v25 - v63;
  uint64_t v66 = type metadata accessor for XPCError();
  uint64_t v68 = *(void *)(v66 - 8);
  uint64_t v67 = v66 - 8;
  uint64_t v69 = v68;
  uint64_t v70 = *(void *)(v68 + 64);
  unint64_t v71 = (v70 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v65);
  uint64_t v72 = (char *)v25 - v71;
  unint64_t v73 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  unint64_t v74 = (char *)v25 - v73;
  uint64_t v99 = (char *)v25 - v73;
  uint64_t v75 = type metadata accessor for XPCDictionary();
  uint64_t v76 = *(void *)(v75 - 8);
  uint64_t v77 = v75 - 8;
  unint64_t v78 = (*(void *)(v76 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v75);
  uint64_t v79 = (char *)v25 - v78;
  uint64_t v98 = (char *)v25 - v78;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  unint64_t v84 = (*(void *)(*(void *)(v85 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v83);
  uint64_t v86 = (char *)v25 - v84;
  uint64_t v97 = v6;
  uint64_t v96 = v7;
  uint64_t v94 = v8;
  uint64_t v95 = v9;
  outlined init with copy of Result<XPCDictionary, XPCError>(v6, (uint64_t)v25 - v84);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = v64;
    uint64_t v33 = v69;
    unint64_t v36 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
    uint64_t v35 = v68 + 32;
    v36(v74, v86, v66);
    uint64_t v99 = v74;
    uint64_t v12 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v11, v12, v60);
    (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v72, v74, v66);
    unint64_t v34 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    uint64_t v43 = 7;
    uint64_t v44 = swift_allocObject();
    v36((char *)(v44 + v34), v72, v66);
    uint64_t v52 = Logger.logObject.getter();
    int v53 = static os_log_type_t.default.getter();
    uint64_t v39 = &v92;
    uint64_t v92 = 12;
    unint64_t v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v38 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v40 = v93;
    uint64_t v41 = 17;
    uint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 32;
    uint64_t v47 = swift_allocObject();
    *(unsigned char *)(v47 + 16) = 8;
    uint64_t v42 = 32;
    uint64_t v13 = swift_allocObject();
    uint64_t v14 = v44;
    uint64_t v45 = v13;
    *(void *)(v13 + 16) = v54;
    *(void *)(v13 + 24) = v14;
    uint64_t v15 = swift_allocObject();
    uint64_t v16 = v45;
    uint64_t v49 = v15;
    *(void *)(v15 + 16) = v55;
    *(void *)(v15 + 24) = v16;
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v48 = _allocateUninitializedArray<A>(_:)();
    Swift::String v50 = v17;
    swift_retain();
    uint64_t v18 = v46;
    uint64_t v19 = v50;
    *Swift::String v50 = v56;
    v19[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18;
    swift_retain();
    uint64_t v20 = v47;
    uint64_t v21 = v50;
    v50[2] = v57;
    v21[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20;
    swift_retain();
    uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v49;
    unint64_t v23 = v50;
    v50[4] = v58;
    v23[5] = v22;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v52, (os_log_type_t)v53))
    {
      uint64_t v24 = v59;
      uint64_t v26 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v25[3] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v27 = createStorage<A>(capacity:type:)(0);
      uint64_t v28 = createStorage<A>(capacity:type:)(1);
      uint64_t v29 = &v91;
      uint32_t v91 = v26;
      uint64_t v30 = &v90;
      uint64_t v90 = v27;
      uint64_t v31 = &v89;
      uint64_t v89 = v28;
      serialize(_:at:)(2, &v91);
      serialize(_:at:)(1, v29);
      uint64_t v87 = v56;
      uint64_t v88 = v46;
      closure #1 in osLogInternal(_:log:type:)(&v87, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31);
      uint64_t v32 = v24;
      if (v24)
      {
        __break(1u);
      }
      else
      {
        uint64_t v87 = v57;
        uint64_t v88 = v47;
        closure #1 in osLogInternal(_:log:type:)(&v87, (uint64_t)&v91, (uint64_t)&v90, (uint64_t)&v89);
        v25[1] = 0;
        uint64_t v87 = v58;
        uint64_t v88 = v49;
        closure #1 in osLogInternal(_:log:type:)(&v87, (uint64_t)&v91, (uint64_t)&v90, (uint64_t)&v89);
        _os_log_impl((void *)&_mh_execute_header, v52, (os_log_type_t)v53, "RemoteXPCPeerConnection received an error: %s", v26, v40);
        destroyStorage<A>(_:count:)(v27);
        destroyStorage<A>(_:count:)(v28);
        UnsafeMutablePointer.deallocate()();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v61 + 8))(v64, v60);
    return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v74, v66);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v79, v86, v75);
    uint64_t v98 = v79;
    swift_retain();
    ViewHierarchyAgent.handleMessage(_:from:)((uint64_t)v79, v81, v82);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v79, v75);
  }
}

uint64_t implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  return Error.localizedDescription.getter();
}

uint64_t implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  return Error.localizedDescription.getter();
}

uint64_t closure #1 in ViewHierarchyAgent.startTargetHubListener()(uint64_t a1, uint64_t a2)
{
  uint64_t v135 = a1;
  uint64_t v134 = a2;
  int v105 = closure #1 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
  uint64_t v106 = partial apply for implicit closure #3 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
  unint64_t v107 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int32);
  uint64_t v108 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v109 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v110 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
  uint64_t v111 = partial apply for closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
  v112 = partial apply for implicit closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
  int v113 = thunk for @escaping @callee_guaranteed () -> (@unowned Int32)partial apply;
  uint64_t v114 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v115 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v116 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  uint64_t v117 = "Fatal error";
  v118 = "ViewHierarchyAgent/ViewHierarchyAgent.swift";
  uint64_t v163 = 0;
  uint64_t v162 = 0;
  uint64_t v161 = 0;
  uint64_t v159 = 0;
  uint64_t v160 = 0;
  uint64_t v158 = 0;
  uint64_t v119 = 0;
  int v156 = 0;
  uint64_t v120 = type metadata accessor for Logger();
  uint64_t v121 = *(void *)(v120 - 8);
  uint64_t v122 = v120 - 8;
  unint64_t v123 = (*(void *)(v121 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v120);
  v124 = (char *)v39 - v123;
  unint64_t v125 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v39 - v123);
  v126 = (char *)v39 - v125;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>?);
  unint64_t v127 = (*(void *)(*(void *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  uint64_t v128 = (uint64_t)v39 - v127;
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  uint64_t v130 = *(void *)(v129 - 8);
  uint64_t v131 = v129 - 8;
  unint64_t v132 = (*(void *)(v130 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v129);
  v133 = (char *)v39 - v132;
  uint64_t v163 = (char *)v39 - v132;
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  unint64_t v136 = (*(void *)(*(void *)(v137 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (uint64_t *)__chkstk_darwin(v135);
  uint64_t v138 = (void *)((char *)v39 - v136);
  uint64_t v162 = v4;
  uint64_t v161 = v5;
  outlined init with copy of Result<XPCPeerConnection, XPCError>(v4, (void *)((char *)v39 - v136));
  if (swift_getEnumCaseMultiPayload() == 1) {
    return outlined destroy of Result<XPCPeerConnection, XPCError>((uint64_t)v138);
  }
  uint64_t v103 = *v138;
  uint64_t v7 = v138[1];
  uint64_t v159 = v103;
  uint64_t v160 = v7;
  swift_retain();
  type metadata accessor for SystemXPCPeerConnection();
  uint64_t v104 = swift_dynamicCastClass();
  if (v104)
  {
    uint64_t v102 = v104;
  }
  else
  {
    uint64_t v101 = 0;
    swift_release();
    uint64_t v102 = v101;
  }
  uint64_t v100 = v102;
  if (v102)
  {
    uint64_t v99 = v100;
    uint64_t v8 = v119;
    uint64_t v97 = v100;
    uint64_t v158 = v100;
    uint64_t result = dispatch thunk of XPCConnection.withUnsafeUnderlyingConnection<A>(_:)();
    uint64_t v98 = v8;
    if (v8)
    {
      __break(1u);
    }
    else
    {
      int v94 = v157;
      int v156 = v157;
      uint64_t v95 = &v155;
      int v155 = v157;
      uint64_t v96 = &v154;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]);
      Dictionary.removeValue(forKey:)();
      swift_endAccess();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v130 + 48))(v128, 1, v129) == 1)
      {
        outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(v128);
        dispatch thunk of XPCConnection.cancel()();
        uint64_t v9 = v126;
        uint64_t v10 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v9, v10, v120);
        uint64_t v83 = 7;
        uint64_t v84 = swift_allocObject();
        *(_DWORD *)(v84 + 16) = v94;
        uint64_t v92 = Logger.logObject.getter();
        int v93 = static os_log_type_t.error.getter();
        uint64_t v79 = &v152;
        uint64_t v152 = 8;
        unint64_t v77 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v78 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v80 = v153;
        uint64_t v81 = 17;
        uint64_t v86 = swift_allocObject();
        *(unsigned char *)(v86 + 16) = 0;
        uint64_t v87 = swift_allocObject();
        *(unsigned char *)(v87 + 16) = 4;
        uint64_t v82 = 32;
        uint64_t v11 = swift_allocObject();
        uint64_t v12 = v84;
        uint64_t v85 = v11;
        *(void *)(v11 + 16) = v106;
        *(void *)(v11 + 24) = v12;
        uint64_t v13 = swift_allocObject();
        uint64_t v14 = v85;
        uint64_t v89 = v13;
        *(void *)(v13 + 16) = v107;
        *(void *)(v13 + 24) = v14;
        uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v88 = _allocateUninitializedArray<A>(_:)();
        uint64_t v90 = v15;
        swift_retain();
        uint64_t v16 = v86;
        uint64_t v17 = v90;
        *uint64_t v90 = v108;
        v17[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v16;
        swift_retain();
        uint64_t v18 = v87;
        uint64_t v19 = v90;
        v90[2] = v109;
        v19[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18;
        swift_retain();
        uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v89;
        uint64_t v21 = v90;
        v90[4] = v110;
        v21[5] = v20;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v92, (os_log_type_t)v93))
        {
          uint64_t v38 = v98;
          uint64_t v41 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          v39[2] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v40 = 0;
          uint64_t v42 = createStorage<A>(capacity:type:)(0);
          uint64_t v43 = createStorage<A>(capacity:type:)(v40);
          uint64_t v44 = &v151;
          v151 = v41;
          uint64_t v45 = &v150;
          uint64_t v150 = v42;
          uint64_t v46 = &v149;
          uint64_t v149 = v43;
          serialize(_:at:)(0, &v151);
          serialize(_:at:)(1, v44);
          uint64_t v147 = v108;
          uint64_t v148 = v86;
          closure #1 in osLogInternal(_:log:type:)(&v147, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46);
          uint64_t v47 = v38;
          if (v38)
          {
            __break(1u);
          }
          else
          {
            uint64_t v147 = v109;
            uint64_t v148 = v87;
            closure #1 in osLogInternal(_:log:type:)(&v147, (uint64_t)&v151, (uint64_t)&v150, (uint64_t)&v149);
            v39[1] = 0;
            uint64_t v147 = v110;
            uint64_t v148 = v89;
            closure #1 in osLogInternal(_:log:type:)(&v147, (uint64_t)&v151, (uint64_t)&v150, (uint64_t)&v149);
            _os_log_impl((void *)&_mh_execute_header, v92, (os_log_type_t)v93, "Received XPC connection from pid %d which we were not expecting", v41, v80);
            v39[0] = 0;
            destroyStorage<A>(_:count:)(v42);
            destroyStorage<A>(_:count:)(v43);
            UnsafeMutablePointer.deallocate()();
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v121 + 8))(v126, v120);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v130 + 32))(v133, v128, v129);
        swift_retain();
        uint64_t v66 = 7;
        uint64_t v22 = swift_allocObject();
        int v23 = v94;
        uint64_t v59 = v22;
        *(void *)(v22 + 16) = v134;
        *(_DWORD *)(v22 + 24) = v23;
        dispatch thunk of SystemXPCPeerConnection.setEventHandler(_:)();
        swift_release();
        dispatch thunk of XPCConnection.activate()();
        swift_retain();
        uint64_t v146 = v97;
        CheckedContinuation.resume(returning:)();
        uint64_t v24 = v124;
        uint64_t v25 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v24, v25, v120);
        uint64_t v67 = swift_allocObject();
        *(_DWORD *)(v67 + 16) = v94;
        uint64_t v75 = Logger.logObject.getter();
        int v76 = static os_log_type_t.default.getter();
        uint64_t v62 = &v144;
        uint64_t v144 = 8;
        unint64_t v60 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v61 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v63 = v145;
        uint64_t v64 = 17;
        uint64_t v69 = swift_allocObject();
        *(unsigned char *)(v69 + 16) = 0;
        uint64_t v70 = swift_allocObject();
        *(unsigned char *)(v70 + 16) = 4;
        uint64_t v65 = 32;
        uint64_t v26 = swift_allocObject();
        uint64_t v27 = v67;
        uint64_t v68 = v26;
        *(void *)(v26 + 16) = v112;
        *(void *)(v26 + 24) = v27;
        uint64_t v28 = swift_allocObject();
        uint64_t v29 = v68;
        uint64_t v72 = v28;
        *(void *)(v28 + 16) = v113;
        *(void *)(v28 + 24) = v29;
        uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v71 = _allocateUninitializedArray<A>(_:)();
        unint64_t v73 = v30;
        swift_retain();
        uint64_t v31 = v69;
        uint64_t v32 = v73;
        *unint64_t v73 = v114;
        v32[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v31;
        swift_retain();
        uint64_t v33 = v70;
        unint64_t v34 = v73;
        v73[2] = v115;
        v34[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v33;
        swift_retain();
        uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v72;
        unint64_t v36 = v73;
        v73[4] = v116;
        v36[5] = v35;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v75, (os_log_type_t)v76))
        {
          uint64_t v37 = v98;
          uint64_t v52 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v51 = 0;
          uint64_t v53 = createStorage<A>(capacity:type:)(0);
          uint64_t v54 = createStorage<A>(capacity:type:)(v51);
          uint64_t v55 = &v143;
          unint64_t v143 = v52;
          uint64_t v56 = &v142;
          uint64_t v142 = v53;
          uint64_t v57 = &v141;
          uint64_t v141 = v54;
          serialize(_:at:)(0, &v143);
          serialize(_:at:)(1, v55);
          uint64_t v139 = v114;
          uint64_t v140 = v69;
          closure #1 in osLogInternal(_:log:type:)(&v139, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57);
          uint64_t v58 = v37;
          if (v37)
          {
            __break(1u);
          }
          else
          {
            uint64_t v139 = v115;
            uint64_t v140 = v70;
            closure #1 in osLogInternal(_:log:type:)(&v139, (uint64_t)&v143, (uint64_t)&v142, (uint64_t)&v141);
            uint64_t v49 = 0;
            uint64_t v139 = v116;
            uint64_t v140 = v72;
            closure #1 in osLogInternal(_:log:type:)(&v139, (uint64_t)&v143, (uint64_t)&v142, (uint64_t)&v141);
            _os_log_impl((void *)&_mh_execute_header, v75, (os_log_type_t)v76, "Established XPC connection to TargetBub on pid %d", v52, v63);
            uint64_t v48 = 0;
            destroyStorage<A>(_:count:)(v53);
            destroyStorage<A>(_:count:)(v54);
            UnsafeMutablePointer.deallocate()();
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v121 + 8))(v124, v120);
        (*(void (**)(char *, uint64_t))(v130 + 8))(v133, v129);
      }
      swift_release();
      return swift_release();
    }
  }
  else
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Peer should be a SystemXPCConnection", 0x24uLL, 1);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in closure #1 in ViewHierarchyAgent.startTargetHubListener()@<X0>(_xpc_connection_s *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = xpc_connection_get_pid(a1);
  *a2 = result;
  return result;
}

uint64_t closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v69 = a1;
  uint64_t v67 = a2;
  int v68 = a3;
  uint64_t v65 = 0;
  uint64_t v54 = partial apply for implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
  uint64_t v55 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v56 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  int v93 = 0;
  uint64_t v92 = 0;
  uint64_t v91 = 0;
  int v90 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = type metadata accessor for Logger();
  uint64_t v61 = *(void *)(v60 - 8);
  uint64_t v62 = v60 - 8;
  unint64_t v63 = (*(void *)(v61 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v60);
  uint64_t v64 = (char *)v23 - v63;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  unint64_t v66 = (*(void *)(*(void *)(v79 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v65);
  uint64_t v80 = (uint64_t)v23 - v66;
  uint64_t v70 = type metadata accessor for XPCError();
  uint64_t v72 = *(void *)(v70 - 8);
  uint64_t v71 = v70 - 8;
  uint64_t v73 = v72;
  uint64_t v75 = *(void *)(v72 + 64);
  unint64_t v74 = (v75 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v69);
  int v76 = (char *)v23 - v74;
  unint64_t v77 = (v75 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v3);
  unint64_t v78 = (char *)v23 - v77;
  int v93 = (char *)v23 - v77;
  uint64_t v92 = v4;
  uint64_t v91 = v5;
  int v90 = v6;
  outlined init with copy of Result<XPCDictionary, XPCError>(v4, v7);
  if (swift_getEnumCaseMultiPayload() != 1) {
    return outlined destroy of Result<XPCDictionary, XPCError>(v80);
  }
  uint64_t v33 = v73;
  unint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 32);
  uint64_t v35 = v72 + 32;
  v36(v78, v80, v70);
  uint64_t v31 = &v89;
  int v89 = v68;
  uint64_t v32 = &v88;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CaptureController]);
  Dictionary.removeValue(forKey:)();
  uint64_t v9 = v64;
  swift_endAccess();
  swift_release();
  uint64_t v10 = logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v9, v10, v60);
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v76, v78, v70);
  unint64_t v34 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v43 = 7;
  uint64_t v44 = swift_allocObject();
  v36((char *)(v44 + v34), (uint64_t)v76, v70);
  uint64_t v52 = Logger.logObject.getter();
  int v53 = static os_log_type_t.default.getter();
  uint64_t v39 = &v86;
  uint64_t v86 = 12;
  unint64_t v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v38 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v40 = v87;
  uint64_t v41 = 17;
  uint64_t v46 = swift_allocObject();
  *(unsigned char *)(v46 + 16) = 32;
  uint64_t v47 = swift_allocObject();
  *(unsigned char *)(v47 + 16) = 8;
  uint64_t v42 = 32;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v44;
  uint64_t v45 = v11;
  *(void *)(v11 + 16) = v54;
  *(void *)(v11 + 24) = v12;
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = v45;
  uint64_t v49 = v13;
  *(void *)(v13 + 16) = v55;
  *(void *)(v13 + 24) = v14;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v48 = _allocateUninitializedArray<A>(_:)();
  uint64_t v50 = v15;
  swift_retain();
  uint64_t v16 = v46;
  uint64_t v17 = v50;
  *uint64_t v50 = v56;
  v17[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v16;
  swift_retain();
  uint64_t v18 = v47;
  uint64_t v19 = v50;
  v50[2] = v57;
  v19[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18;
  swift_retain();
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v49;
  uint64_t v21 = v50;
  v50[4] = v58;
  v21[5] = v20;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v52, (os_log_type_t)v53))
  {
    uint64_t v22 = v59;
    uint64_t v24 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v23[2] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v25 = createStorage<A>(capacity:type:)(0);
    uint64_t v26 = createStorage<A>(capacity:type:)(1);
    uint64_t v27 = &v85;
    uint64_t v85 = v24;
    uint64_t v28 = &v84;
    uint64_t v84 = v25;
    uint64_t v29 = &v83;
    uint64_t v83 = v26;
    serialize(_:at:)(2, &v85);
    serialize(_:at:)(1, v27);
    uint64_t v81 = v56;
    uint64_t v82 = v46;
    closure #1 in osLogInternal(_:log:type:)(&v81, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29);
    uint64_t v30 = v22;
    if (v22)
    {
      __break(1u);
    }
    else
    {
      uint64_t v81 = v57;
      uint64_t v82 = v47;
      closure #1 in osLogInternal(_:log:type:)(&v81, (uint64_t)&v85, (uint64_t)&v84, (uint64_t)&v83);
      v23[0] = 0;
      uint64_t v81 = v58;
      uint64_t v82 = v49;
      closure #1 in osLogInternal(_:log:type:)(&v81, (uint64_t)&v85, (uint64_t)&v84, (uint64_t)&v83);
      _os_log_impl((void *)&_mh_execute_header, v52, (os_log_type_t)v53, "TargetHubXPCPeerConnection received an error: %s", v24, v40);
      destroyStorage<A>(_:count:)(v25);
      destroyStorage<A>(_:count:)(v26);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  (*(void (**)(char *, uint64_t))(v61 + 8))(v64, v60);
  return (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v78, v70);
}

uint64_t implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  return Error.localizedDescription.getter();
}

uint64_t closure #1 in ViewHierarchyAgent.handleMessage(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[13] = a7;
  v7[12] = a5;
  v7[7] = v7;
  v7[8] = 0;
  v7[5] = 0;
  v7[6] = 0;
  v7[9] = 0;
  v7[10] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  v7[14] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for XPCDictionary();
  v7[15] = v9;
  v7[16] = *(void *)(v9 - 8);
  v7[17] = swift_task_alloc();
  v7[18] = swift_task_alloc();
  v7[8] = a4;
  v7[5] = a5;
  v7[6] = a6;
  v7[9] = a7;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v12 + 152) = v10;
  *uint64_t v10 = *(void *)(v12 + 56);
  v10[1] = closure #1 in ViewHierarchyAgent.handleMessage(_:from:);
  return ViewHierarchyAgent.performRequest(connection:message:)(a5, a6, a7);
}

uint64_t closure #1 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 56) = *v1;
  *(void *)(v4 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(closure #1 in ViewHierarchyAgent.handleMessage(_:from:), 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v4 + 56) + 8);
    return v2();
  }
}

{
  void *v0;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  uint64_t v9 = v0[20];
  uint64_t v10 = v0[16];
  uint64_t v12 = v0[15];
  uint64_t v11 = v0[14];
  v0[7] = v0;
  swift_errorRetain();
  v0[10] = v9;
  XPCDictionary.createReply()();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v12) == 1) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v4 = v8[18];
  uint64_t v5 = v8[17];
  int v6 = v8[15];
  uint64_t v3 = v8[16];
  (*(void (**)(void))(v3 + 32))();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("error", 5uLL, 1);
  swift_getErrorValue();
  Error.localizedDescription.getter();
  XPCDictionary.subscript.setter();
  swift_retain();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v5, v6);
  dispatch thunk of XPCConnection.send(message:)();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v7(v4, v6);
  swift_release();
  v7(v5, v6);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v8[7] + 8);
  return v2();
}

uint64_t ViewHierarchyAgent.performRequest(connection:message:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 152) = v3;
  *(void *)(v4 + 144) = a3;
  *(void *)(v4 + 136) = a1;
  *(void *)(v4 + 96) = v4;
  *(void *)(v4 + 64) = 0;
  *(void *)(v4 + 72) = 0;
  *(void *)(v4 + 104) = 0;
  *(void *)(v4 + 112) = 0;
  *(_DWORD *)(v4 + 344) = 0;
  *(void *)(v4 + 80) = 0;
  *(void *)(v4 + 88) = 0;
  *(void *)(v4 + 120) = 0;
  *(void *)(v4 + 128) = 0;
  *(_DWORD *)(v4 + 360) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  *(void *)(v4 + 160) = swift_task_alloc();
  uint64_t v5 = type metadata accessor for XPCDictionary();
  *(void *)(v4 + 168) = v5;
  *(void *)(v4 + 176) = *(void *)(v5 - 8);
  *(void *)(v4 + 184) = swift_task_alloc();
  *(void *)(v4 + 192) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for URL();
  *(void *)(v4 + 200) = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  *(void *)(v4 + 208) = v8;
  *(void *)(v4 + 216) = *(void *)(v8 + 64);
  *(void *)(v4 + 224) = swift_task_alloc();
  *(void *)(v4 + 232) = swift_task_alloc();
  *(void *)(v4 + 240) = swift_task_alloc();
  *(void *)(v4 + 248) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  *(void *)(v4 + 256) = swift_task_alloc();
  *(void *)(v4 + 264) = swift_task_alloc();
  *(void *)(v4 + 272) = swift_task_alloc();
  *(void *)(v4 + 64) = a1;
  *(void *)(v4 + 72) = a2;
  *(void *)(v4 + 104) = a3;
  *(void *)(v4 + 112) = v3;
  return _swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0);
}

uint64_t ViewHierarchyAgent.performRequest(connection:message:)()
{
  *(void *)(v0 + 96) = v0;
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pid", 3uLL, 1);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  XPCDictionary.subscript.getter();
  int v8 = *(_DWORD *)(v0 + 348);
  if ((*(unsigned char *)(v0 + 352) & 1) != 0
    || (*(_DWORD *)(v7 + 344) = v8,
        swift_bridgeObjectRelease(),
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("request", 7uLL, 1),
        uint64_t v6 = XPCDictionary.subscript.getter(),
        *(void *)(v7 + 280) = v6,
        (*(void *)(v7 + 288) = v1) == 0))
  {
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    swift_allocError();
    unsigned char *v4 = 0;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v7 + 96) + 8);
    return v5();
  }
  else
  {
    *(void *)(v7 + 80) = v6;
    *(void *)(v7 + 88) = v1;
    swift_bridgeObjectRelease();
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v7 + 296) = v2;
    *uint64_t v2 = *(void *)(v7 + 96);
    v2[1] = ViewHierarchyAgent.performRequest(connection:message:);
    return ViewHierarchyAgent.captureController(for:)(v8);
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  unsigned char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  void *v20;
  Swift::Int32 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(void);
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;

  uint64_t v1 = v0[38];
  v0[12] = v0;
  v0[15] = v1;
  swift_retain();
  type metadata accessor for SystemXPCConnection();
  if (swift_dynamicCastClass())
  {
    swift_release();
    uint64_t v2 = *(void *)(v28 + 312);
    uint64_t result = XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)();
    if (v2) {
      return result;
    }
    uint64_t v21 = *(_DWORD *)(v28 + 356);
    *(_DWORD *)(v28 + 360) = v21;
    if (v21 > 0)
    {
      uint64_t v20 = *(void **)(v28 + 272);
      uint64_t v19 = *(const void **)(v28 + 264);
      uint64_t v18 = *(void *)(v28 + 200);
      uint64_t v17 = *(void *)(v28 + 208);
      type metadata accessor for NSFileHandle();
      *(NSFileHandle *)(v28 + 128) = NSFileHandle.__allocating_init(fileDescriptor:closeOnDealloc:)(v21, 1);
      (*(void (**)(const void *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v19, 1, 1, v18);
      outlined init with take of URL?(v19, v20);
      goto LABEL_9;
    }
    lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    swift_allocError();
    *uint64_t v5 = 1;
    swift_willThrow();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    uint64_t v4 = *(void *)(v28 + 312);
    uint64_t v24 = *(void *)(v28 + 248);
    uint64_t v26 = *(void *)(v28 + 240);
    int v23 = *(void *)(v28 + 200);
    uint64_t v22 = *(void *)(v28 + 208);
    CaptureController.createTemporaryFile()(v24);
    type metadata accessor for NSFileHandle();
    uint64_t v25 = *(void (**)(void))(v22 + 16);
    ((void (*)(uint64_t, uint64_t, uint64_t))v25)(v26, v24, v23);
    uint64_t v27 = @nonobjc NSFileHandle.__allocating_init(forWritingTo:)(v26);
    if (!v4)
    {
      uint64_t v14 = *(void **)(v28 + 272);
      uint64_t v13 = *(const void **)(v28 + 264);
      uint64_t v16 = *(void *)(v28 + 248);
      uint64_t v15 = *(void *)(v28 + 200);
      uint64_t v12 = *(void *)(v28 + 208);
      *(void *)(v28 + 128) = v27;
      v25();
      (*(void (**)(const void *, void, uint64_t, uint64_t))(v12 + 56))(v13, 0, 1, v15);
      outlined init with take of URL?(v13, v14);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v15);
LABEL_9:
      uint64_t v10 = *(void *)(v28 + 288);
      swift_bridgeObjectRetain();
      uint64_t v11 = *(void **)(v28 + 128);
      *(void *)(v28 + 320) = v11;
      uint64_t v6 = v11;
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v28 + 328) = v7;
      *uint64_t v7 = *(void *)(v28 + 96);
      v7[1] = ViewHierarchyAgent.performRequest(connection:message:);
      int v8 = *(void *)(v28 + 280);
      return CaptureController.performRequest(_:using:)(v8, v10, (uint64_t)v11);
    }
    (*(void (**)(void, void))(*(void *)(v28 + 208) + 8))(*(void *)(v28 + 248), *(void *)(v28 + 200));
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(v28 + 96) + 8);
  return v9();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 96) = *v1;
  *(void *)(v4 + 336) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = ViewHierarchyAgent.performRequest(connection:message:);
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v2 = ViewHierarchyAgent.performRequest(connection:message:);
  }
  return _swift_task_switch(v2, 0);
}

{
  void *v0;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void (*v12)(unint64_t, uint64_t, uint64_t);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v21 = v0[22];
  int v23 = v0[21];
  uint64_t v22 = v0[20];
  v0[12] = v0;
  XPCDictionary.createReply()();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v22, 1, v23) == 1) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  (*(void (**)(void, void, void))(*(void *)(v20 + 176) + 32))(*(void *)(v20 + 192), *(void *)(v20 + 160), *(void *)(v20 + 168));
  swift_retain();
  type metadata accessor for RemoteXPCPeerConnection();
  if (swift_dynamicCastClass())
  {
    swift_release();
    uint64_t v19 = *(void **)(v20 + 256);
    uint64_t v18 = *(void *)(v20 + 200);
    uint64_t v17 = *(void *)(v20 + 208);
    outlined init with copy of URL?(*(const void **)(v20 + 272), v19);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v19, 1, v18) == 1)
    {
      outlined destroy of URL?(*(void *)(v20 + 256));
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Should have a temporary file!", 0x1DuLL, 1);
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v15 = *(void *)(v20 + 232);
    uint64_t v11 = *(void *)(v20 + 224);
    uint64_t v16 = *(void *)(v20 + 200);
    uint64_t v9 = *(void *)(v20 + 208);
    uint64_t v12 = *(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32);
    ((void (*)(uint64_t, void))v12)(v15, *(void *)(v20 + 256));
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ft", 2uLL, 1);
    URL.path.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v11, v15, v16);
    uint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v13 = swift_allocObject();
    v12(v13 + v10, v11, v16);
    *(void *)(v20 + 48) = partial apply for closure #2 in ViewHierarchyAgent.performRequest(connection:message:);
    *(void *)(v20 + 56) = v13;
    *(void *)(v20 + 16) = _NSConcreteStackBlock;
    *(_DWORD *)(v20 + 24) = 1107296256;
    *(_DWORD *)(v20 + 28) = 0;
    *(void *)(v20 + 32) = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
    *(void *)(v20 + 40) = &block_descriptor;
    uint64_t v14 = _Block_copy((const void *)(v20 + 16));
    swift_release();
    String.utf8CString.getter();
    swift_retain();
    swift_release();
    swift_retain();
    swift_bridgeObjectRelease();
    xpc_file_transfer_create_with_path();
    swift_unknownObjectRelease();
    _Block_release(v14);
    swift_bridgeObjectRelease();
    XPCDictionary.subscript.setter();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v15, v16);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = *(void *)(v20 + 272);
  uint64_t v7 = *(void *)(v20 + 192);
  int v8 = *(void *)(v20 + 184);
  uint64_t v4 = *(void *)(v20 + 168);
  uint64_t v3 = *(void *)(v20 + 176);
  swift_retain();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v8, v7, v4);
  dispatch thunk of XPCConnection.send(message:)();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v5(v8, v4);
  swift_release();
  v5(v7, v4);
  outlined destroy of URL?(v6);

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v20 + 96) + 8);
  return v2();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 96) = v0;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 96) + 8);
  return v1();
}

{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(void);
  uint64_t v4;
  uint64_t v5;

  uint64_t v1 = *(void **)(v0 + 320);
  uint64_t v4 = *(void *)(v0 + 272);
  *(void *)(v0 + 96) = v0;

  swift_bridgeObjectRelease();
  outlined destroy of URL?(v4);

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v0 + 96) + 8);
  return v2();
}

uint64_t ViewHierarchyAgent.performRequest(connection:message:)(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[12] = *v2;
  v5[38] = a1;
  v5[39] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = ViewHierarchyAgent.performRequest(connection:message:);
  }
  else
  {
    uint64_t v3 = ViewHierarchyAgent.performRequest(connection:message:);
  }
  return _swift_task_switch(v3, 0);
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = type metadata accessor for TaskPriority();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    outlined destroy of TaskPriority?(a1);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  }
  uint64_t v6 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v6)
  {
    swift_getObjectType();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  uint64_t v5 = (void *)swift_allocObject();
  void v5[2] = a4;
  v5[3] = a2;
  v5[4] = a3;
  return swift_task_create();
}

void ViewHierarchyAgent.finish(_:)()
{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pid", 3uLL, 1);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  XPCDictionary.subscript.getter();
  swift_bridgeObjectRelease();
  if (v2)
  {
    lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    swift_allocError();
    unsigned char *v0 = 0;
    swift_willThrow();
  }
  else
  {
    ViewHierarchyAgent.finish(_:)(v1);
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:)()
{
}

uint64_t ViewHierarchyAgent.captureController(for:)(int a1)
{
  *(void *)(v2 + 128) = v1;
  *(_DWORD *)(v2 + 180) = a1;
  *(void *)(v2 + 80) = v2;
  *(_DWORD *)(v2 + 168) = 0;
  *(void *)(v2 + 88) = 0;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(void *)(v2 + 104) = 0;
  *(void *)(v2 + 120) = 0;
  *(_DWORD *)(v2 + 168) = a1;
  *(void *)(v2 + 88) = v1;
  return _swift_task_switch(ViewHierarchyAgent.captureController(for:), 0);
}

uint64_t ViewHierarchyAgent.captureController(for:)()
{
  int v6 = *(_DWORD *)(v0 + 180);
  *(void *)(v0 + 80) = v0;
  swift_beginAccess();
  *(_DWORD *)(v0 + 172) = v6;
  *(void *)(v0 + 136) = type metadata accessor for CaptureController();
  Dictionary.subscript.getter();
  uint64_t v7 = *(void *)(v0 + 96);
  if (v7)
  {
    *(void *)(v5 + 120) = v7;
    swift_endAccess();
    uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)(v5 + 80) + 8);
    return v1(v7);
  }
  else
  {
    swift_endAccess();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v5 + 144) = v3;
    *uint64_t v3 = *(void *)(v5 + 80);
    v3[1] = ViewHierarchyAgent.captureController(for:);
    int v4 = *(_DWORD *)(v5 + 180);
    return ViewHierarchyAgent.establishTargetHubConnection(to:)(v4);
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void v8[5];
  uint64_t v9;
  uint64_t v10;

  uint64_t v9 = v0;
  uint64_t v3 = *(void *)(v0 + 160);
  int v6 = *(void *)(v0 + 152);
  uint64_t v5 = *(_DWORD *)(v0 + 180);
  *(void *)(v0 + 80) = v0;
  *(void *)(v0 + 64) = v6;
  *(void *)(v0 + 72) = v3;
  int v4 = type metadata accessor for SystemXPCRequestExecutor();
  swift_retain();
  void v8[3] = v4;
  v8[4] = &protocol witness table for SystemXPCRequestExecutor;
  v8[0] = SystemXPCRequestExecutor.__allocating_init(targetConnection:)(v6, v3);
  uint64_t v7 = CaptureController.__allocating_init(requestExecutor:)((uint64_t)v8);
  *(void *)(v0 + 104) = v7;
  swift_retain();
  *(void *)(v0 + 112) = v7;
  *(_DWORD *)(v0 + 176) = v5;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CaptureController]);
  Dictionary.subscript.setter();
  swift_endAccess();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 80) + 8);
  return v1(v7);
}

uint64_t ViewHierarchyAgent.captureController(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (void *)*v3;
  v7[10] = *v3;
  v7[19] = a1;
  v7[20] = a2;
  uint64_t v4 = swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v7[10] + 8);
    return v5(v4);
  }
  else
  {
    return _swift_task_switch(ViewHierarchyAgent.captureController(for:), 0);
  }
}

uint64_t closure #1 in ViewHierarchyAgent.performRequest(connection:message:)@<X0>(void *a1@<X0>, unsigned int *a2@<X8>)
{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fd", 2uLL, 1);
  uint64_t v4 = String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  unsigned int v6 = xpc_dictionary_dup_fd(a1, (const char *)(v4 + 32));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = v6;
  *a2 = v6;
  return result;
}

NSFileHandle __swiftcall NSFileHandle.__allocating_init(fileDescriptor:closeOnDealloc:)(Swift::Int32 fileDescriptor, Swift::Bool closeOnDealloc)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (NSFileHandle)@nonobjc NSFileHandle.init(fileDescriptor:closeOnDealloc:)(fileDescriptor, closeOnDealloc);
}

id @nonobjc NSFileHandle.__allocating_init(forWritingTo:)(uint64_t a1)
{
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  uint64_t v9 = v1;
  id ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
  lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>();
  _convertInOutToPointerArgument<A>(_:)();
  id v10 = [ObjCClassFromMetadata fileHandleForWritingToURL:v9 error:v11];
  id v2 = 0;

  if (v10)
  {

    uint64_t v3 = type metadata accessor for URL();
    (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 8))(a1);
    return v10;
  }
  else
  {
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v5 = type metadata accessor for URL();
    (*(void (**)(uint64_t))(*(void *)(v5 - 8) + 8))(a1);
    return (id)v6;
  }
}

uint64_t closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(unsigned int a1, uint64_t a2)
{
  unsigned int v58 = a1;
  uint64_t v60 = a2;
  uint64_t v52 = 0;
  uint64_t v47 = partial apply for implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:);
  uint64_t v48 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v49 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v51 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  int v77 = 0;
  uint64_t v76 = 0;
  uint64_t v74 = 0;
  uint64_t v53 = type metadata accessor for Logger();
  uint64_t v54 = *(void *)(v53 - 8);
  uint64_t v55 = v53 - 8;
  unint64_t v56 = (*(void *)(v54 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v57 = (char *)v24 - v56;
  uint64_t v63 = type metadata accessor for URL();
  uint64_t v61 = *(void *)(v63 - 8);
  uint64_t v62 = v63 - 8;
  unint64_t v59 = (*(void *)(v61 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  int v2 = __chkstk_darwin(v58);
  uint64_t v3 = (char *)v24 - v59;
  uint64_t v64 = (char *)v24 - v59;
  int v77 = v2;
  uint64_t v76 = v4;
  uint64_t v80 = 0;
  id v67 = [self defaultManager];
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v3, v60, v63);
  URL._bridgeToObjectiveC()(v5);
  id v66 = v6;
  (*(void (**)(char *, uint64_t))(v61 + 8))(v64, v63);
  id v75 = v80;
  unsigned int v68 = [v67 removeItemAtURL:v66 error:&v75];
  id v65 = v75;
  id v7 = v75;
  uint64_t v8 = v80;
  uint64_t v80 = v65;

  uint64_t result = v68;
  if ((v68 & 1) == 0)
  {
    v24[0] = v80;
    uint64_t v30 = _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v11 = v57;
    uint64_t v37 = 0;
    swift_errorRetain();
    uint64_t v74 = v30;
    uint64_t v12 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v11, v12, v53);
    swift_errorRetain();
    v24[6] = (id)7;
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v30;
    uint64_t v31 = Logger.logObject.getter();
    int v32 = static os_log_type_t.fault.getter();
    v24[3] = &v72;
    uint64_t v72 = 12;
    v24[1] = (id)lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v24[2] = (id)lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v33 = v73;
    v24[4] = (id)17;
    uint64_t v42 = swift_allocObject();
    *(unsigned char *)(v42 + 16) = 32;
    uint64_t v35 = swift_allocObject();
    *(unsigned char *)(v35 + 16) = 8;
    v24[5] = (id)32;
    uint64_t v13 = swift_allocObject();
    uint64_t v14 = v25;
    uint64_t v26 = v13;
    *(void *)(v13 + 16) = v47;
    *(void *)(v13 + 24) = v14;
    uint64_t v15 = swift_allocObject();
    uint64_t v16 = v26;
    uint64_t v36 = v15;
    *(void *)(v15 + 16) = v48;
    *(void *)(v15 + 24) = v16;
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v27 = _allocateUninitializedArray<A>(_:)();
    uint64_t v28 = v17;
    swift_retain();
    uint64_t v18 = v42;
    uint64_t v19 = v28;
    *uint64_t v28 = v49;
    v19[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18;
    swift_retain();
    uint64_t v20 = v35;
    uint64_t v21 = v28;
    v28[2] = v50;
    v21[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20;
    swift_retain();
    uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v36;
    int v23 = v28;
    v28[4] = v51;
    v23[5] = v22;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v31, (os_log_type_t)v32))
    {
      uint64_t v10 = v37;
      uint64_t v39 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v40 = createStorage<A>(capacity:type:)(0);
      uint64_t v41 = createStorage<A>(capacity:type:)(1);
      uint64_t v43 = &v71;
      uint64_t v71 = v39;
      uint64_t v44 = &v79;
      uint64_t v79 = v40;
      uint64_t v45 = &v78;
      uint64_t v78 = v41;
      serialize(_:at:)(2, &v71);
      serialize(_:at:)(1, v43);
      uint64_t v69 = v49;
      uint64_t v70 = v42;
      closure #1 in osLogInternal(_:log:type:)(&v69, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45);
      uint64_t v46 = v10;
      if (v10)
      {
        __break(1u);
      }
      else
      {
        uint64_t v69 = v50;
        uint64_t v70 = v35;
        closure #1 in osLogInternal(_:log:type:)(&v69, (uint64_t)&v71, (uint64_t)&v79, (uint64_t)&v78);
        uint64_t v34 = 0;
        uint64_t v69 = v51;
        uint64_t v70 = v36;
        closure #1 in osLogInternal(_:log:type:)(&v69, (uint64_t)&v71, (uint64_t)&v79, (uint64_t)&v78);
        _os_log_impl((void *)&_mh_execute_header, v31, (os_log_type_t)v32, "Failed to remove temporary file: %s", v39, v33);
        destroyStorage<A>(_:count:)(v40);
        destroyStorage<A>(_:count:)(v41);
        UnsafeMutablePointer.deallocate()();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v57, v53);
    swift_errorRelease();
    return swift_errorRelease();
  }
  return result;
}

uint64_t implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:)()
{
  return Error.localizedDescription.getter();
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int32) -> ()(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4(a2);
  return swift_release();
}

Swift::Void __swiftcall ViewHierarchyAgent.finish(_:)(Swift::Int32 a1)
{
}

uint64_t ViewHierarchyAgent.establishTargetHubConnection(to:)(int a1)
{
  *(void *)(v2 + 72) = v1;
  *(_DWORD *)(v2 + 128) = a1;
  *(void *)(v2 + 48) = v2;
  *(_DWORD *)(v2 + 120) = 0;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0;
  *(_DWORD *)(v2 + 120) = a1;
  *(void *)(v2 + 56) = v1;
  return _swift_task_switch(ViewHierarchyAgent.establishTargetHubConnection(to:), 0);
}

uint64_t ViewHierarchyAgent.establishTargetHubConnection(to:)()
{
  uint64_t v11 = *(void *)(v0 + 72);
  int v12 = *(_DWORD *)(v0 + 128);
  *(void *)(v0 + 48) = v0;
  *(void *)(v0 + 16) = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  *(void *)(v0 + 24) = v1;
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyTargetHub.Notification.", 0x31uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v2);
  swift_bridgeObjectRelease();
  *(_DWORD *)(v0 + 124) = v12;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  uint64_t v9 = String.init(stringInterpolation:)();
  *(void *)(v0 + 80) = v4;
  *(void *)(v0 + 32) = v9;
  *(void *)(v0 + 40) = v4;
  swift_bridgeObjectRetain();
  uint64_t v10 = String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v10 + 32));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("establishTargetHubConnection(to:)", 0x21uLL, 1);
  *(void *)(v0 + 88) = v5._object;
  swift_retain();
  uint64_t v14 = swift_task_alloc();
  *(void *)(v0 + 96) = v14;
  *(void *)(v14 + 16) = v11;
  *(_DWORD *)(v14 + 24) = v12;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v13 + 104) = v6;
  uint64_t v7 = type metadata accessor for SystemXPCPeerConnection();
  *uint64_t v6 = *(void *)(v13 + 48);
  v6[1] = ViewHierarchyAgent.establishTargetHubConnection(to:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v13 + 64, 0, 0, v5._countAndFlagsBits, v5._object, partial apply for closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:), v14, v7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 48) = *v1;
  *(void *)(v4 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    Swift::String v2 = ViewHierarchyAgent.establishTargetHubConnection(to:);
  }
  else
  {
    swift_task_dealloc();
    swift_release();
    swift_bridgeObjectRelease();
    Swift::String v2 = ViewHierarchyAgent.establishTargetHubConnection(to:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, void *);
  uint64_t v3;
  uint64_t v4;

  *(void *)(v0 + 48) = v0;
  Swift::String v3 = *(void *)(v0 + 64);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(uint64_t, void *))(*(void *)(v0 + 48) + 8);
  return v1(v3, &protocol witness table for SystemXPCPeerConnection);
}

{
  uint64_t v0;
  uint64_t (*v1)();
  uint64_t v3;

  *(void *)(v0 + 48) = v0;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 48) + 8);
  return v1();
}

uint64_t closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:)(uint64_t a1, uint64_t a2, int a3)
{
  return ViewHierarchyAgent.setPendingConnection(_:for:)(a1, a3);
}

uint64_t ViewHierarchyAgent.setPendingConnection(_:for:)(uint64_t a1, int a2)
{
  uint64_t v29 = a1;
  int v33 = a2;
  uint64_t v24 = &async function pointer to partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:);
  uint64_t v44 = 0;
  int v43 = 0;
  uint64_t v42 = 0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  unint64_t v25 = (*(void *)(*(void *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  uint64_t v26 = (uint64_t)v20 - v25;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  uint64_t v34 = *(void *)(v37 - 8);
  uint64_t v35 = v37 - 8;
  unint64_t v27 = (*(void *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v37);
  uint64_t v28 = (char *)v20 - v27;
  unint64_t v30 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v29);
  uint64_t v31 = (char *)v20 - v30;
  unint64_t v32 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v36 = (uint64_t)v20 - v32;
  uint64_t v44 = v6;
  int v43 = v7;
  uint64_t v42 = v2;
  swift_beginAccess();
  v41[1] = v33;
  Dictionary.subscript.getter();
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v36, 1, v37) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v28, v36, v37);
    outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(v36);
    swift_endAccess();
    lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    uint64_t v8 = swift_allocError();
    *uint64_t v9 = 2;
    uint64_t v39 = v8;
    CheckedContinuation.resume(throwing:)();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v37);
  }
  else
  {
    outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(v36);
    swift_endAccess();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v31, v29, v37);
  uint64_t v10 = *(void (**)(char *, void))(v34 + 56);
  unsigned int v21 = 1;
  v10(v31, 0);
  v20[1] = v41;
  v41[0] = v33;
  v20[2] = &v40;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]);
  Dictionary.subscript.setter();
  swift_endAccess();
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, void))(*(void *)(v11 - 8) + 56))(v26, v21);
  swift_retain();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v23;
  int v14 = v33;
  uint64_t v15 = (uint64_t)v24;
  uint64_t v16 = v12;
  uint64_t v17 = v26;
  *(void *)(v16 + 16) = 0;
  *(void *)(v16 + 24) = 0;
  *(void *)(v16 + 32) = v13;
  *(_DWORD *)(v16 + 40) = v14;
  _sScTss5Error_pRs_rlE8detached8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntFZ(v17, v15, v16, (uint64_t)&type metadata for () + 8);
  uint64_t v22 = v18;
  outlined destroy of TaskPriority?(v26);
  return swift_release();
}

uint64_t closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(v5 + 120) = a5;
  *(void *)(v5 + 64) = a4;
  *(void *)(v5 + 40) = v5;
  *(void *)(v5 + 48) = 0;
  *(_DWORD *)(v5 + 112) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>?);
  *(void *)(v5 + 72) = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  *(void *)(v5 + 80) = v6;
  *(void *)(v5 + 88) = *(void *)(v6 - 8);
  *(void *)(v5 + 96) = swift_task_alloc();
  *(void *)(v5 + 48) = a4;
  *(_DWORD *)(v5 + 112) = a5;
  int v7 = (void *)swift_task_alloc();
  *(void *)(v11 + 104) = v7;
  *int v7 = *(void *)(v11 + 40);
  v7[1] = closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:);
  return static Task<>.sleep(nanoseconds:)(5000000000);
}

uint64_t closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)()
{
  uint64_t v4 = *v1;
  *(void *)(*v1 + 40) = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v4 + 40) + 8);
    return v2();
  }
  else
  {
    return _swift_task_switch(closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:), 0);
  }
}

{
  uint64_t v0;
  int v1;
  uint64_t v2;
  unsigned char *v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  uint64_t v10 = *(void *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 80);
  uint64_t v11 = *(void *)(v0 + 72);
  uint64_t v1 = *(_DWORD *)(v0 + 120);
  *(void *)(v0 + 40) = v0;
  *(_DWORD *)(v0 + 116) = v1;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]);
  Dictionary.removeValue(forKey:)();
  swift_endAccess();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v12) == 1)
  {
    outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(v9[9]);
  }
  else
  {
    int v7 = v9[12];
    uint64_t v8 = v9[10];
    uint64_t v6 = v9[11];
    (*(void (**)(uint64_t, void))(v6 + 32))(v7, v9[9]);
    lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    uint64_t v2 = swift_allocError();
    *uint64_t v3 = 3;
    v9[7] = v2;
    CheckedContinuation.resume(throwing:)();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v9[5] + 8);
  return v4();
}

void _sScTss5Error_pRs_rlE8detached8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntFZ(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a1;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  v33[4] = a4;
  unint64_t v28 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (const void *)__chkstk_darwin(v27);
  uint64_t v29 = (uint64_t)&v6 - v28;
  outlined init with copy of TaskPriority?(v4, (char *)&v6 - v28);
  uint64_t v30 = type metadata accessor for TaskPriority();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = v30 - 8;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v31 + 48))(v29, 1) == 1)
  {
    uint64_t v22 = 0;
    outlined destroy of TaskPriority?(v29);
    uint64_t v23 = v22;
  }
  else
  {
    int v21 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
    uint64_t v23 = v21;
  }
  uint64_t v18 = v23 | 0x1000;
  uint64_t v20 = *(void *)(v25 + 16);
  uint64_t v19 = *(void *)(v25 + 24);
  swift_unknownObjectRetain();
  if (v20)
  {
    uint64_t v16 = v20;
    uint64_t v17 = v19;
    uint64_t v10 = v19;
    uint64_t v11 = v20;
    swift_getObjectType();
    uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v13 = v5;
    swift_unknownObjectRelease();
    uint64_t v14 = v12;
    uint64_t v15 = v13;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  uint64_t v7 = v15;
  uint64_t v8 = v14;
  uint64_t v9 = 0;
  if (v14 != 0 || v15 != 0)
  {
    v33[0] = 0;
    v33[1] = 0;
    v33[2] = v8;
    v33[3] = v7;
    uint64_t v9 = v33;
  }
  uint64_t v6 = swift_task_create();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  Task.init(_:)();
}

void static ViewHierarchyAgent.$main()()
{
}

uint64_t ViewHierarchyAgent.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  outlined destroy of [Int32 : CaptureController]();
  outlined destroy of [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]();
  return v2;
}

uint64_t ViewHierarchyAgent.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

int main(int argc, const char **argv, const char **envp)
{
}

uint64_t sub_100016620()
{
  return 0;
}

id @nonobjc NSFileHandle.init(fileDescriptor:closeOnDealloc:)(uint64_t a1, char a2)
{
  return [v2 initWithFileDescriptor:a1 closeOnDealloc:a2 & 1];
}

uint64_t partial apply for closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

unint64_t lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1)
{
  return closure #1 in ViewHierarchyAgent.startRemoteListener()(a1, v1);
}

uint64_t closure #1 in osLogInternal(_:log:type:)partial apply(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.startTargetHubListener()(uint64_t a1)
{
  return closure #1 in ViewHierarchyAgent.startTargetHubListener()(a1, v1);
}

uint64_t sub_10001682C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:)();
  return result;
}

uint64_t specialized static Array._allocateUninitialized(_:)(uint64_t result)
{
  uint64_t v3 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      type metadata accessor for OS_dispatch_queue.Attributes();
      uint64_t v1 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v1 + 16) = v3;
      uint64_t v2 = (void *)v1;
    }
    else
    {
      swift_retain();
      uint64_t v2 = &_swiftEmptyArrayStorage;
    }
    type metadata accessor for OS_dispatch_queue.Attributes();
    return (uint64_t)v2;
  }
  return result;
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTR(uint64_t a1, int *a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_100016B9C()
{
  return swift_deallocObject();
}

unsigned char **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_100016BD0()
{
  return swift_deallocObject();
}

uint64_t sub_100016C04()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100016C50()
{
  return swift_deallocObject();
}

void *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = a1;
  uint64_t v21 = a6;
  v13[1] = a7;
  uint64_t v14 = partial apply for closure #1 in serialize<A>(_:at:);
  uint64_t v25 = a6;
  uint64_t v18 = *(void *)(a6 - 8);
  uint64_t v19 = a6 - 8;
  v13[0] = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = __chkstk_darwin(a1);
  uint64_t v20 = (uint64_t)v13 - v13[0];
  v8(v7);
  uint64_t v16 = dispatch thunk of static FixedWidthInteger.bitWidth.getter() >> 3;
  uint64_t v23 = *v17;
  uint64_t v24 = v23 + v16;
  _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(v20, v14, (uint64_t)v22, v21, (uint64_t)&type metadata for Never, (uint64_t)&type metadata for () + 8, (uint64_t)&protocol witness table for Never, v15);
  uint64_t v9 = v18;
  uint64_t v10 = v20;
  uint64_t v11 = v21;
  *v17 += v16;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = a2;
  uint64_t v12 = a5;
  uint64_t v13 = a8;
  uint64_t v23 = a4;
  uint64_t v22 = a5;
  uint64_t v21 = a6;
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = a5 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = __chkstk_darwin();
  uint64_t v18 = (char *)&v12 - v16;
  uint64_t v20 = v9 + *(void *)(*(void *)(v10 - 8) + 64);
  uint64_t result = v17();
  uint64_t v19 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v18, v12);
  }
  return result;
}

uint64_t sub_100016F5C()
{
  uint64_t v4 = type metadata accessor for XPCDictionary();
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:)(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = *(void *)(type metadata accessor for XPCDictionary() - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = v1[5];
  uint64_t v11 = v1[6];
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  void *v4 = *(void *)(v6 + 16);
  v4[1] = partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:);
  return closure #1 in ViewHierarchyAgent.handleMessage(_:from:)(a1, v7, v8, v9, v10, v11, (uint64_t)v1 + v12);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

unint64_t type metadata accessor for NSFileHandle()
{
  uint64_t v2 = lazy cache variable for type metadata for NSFileHandle;
  if (!lazy cache variable for type metadata for NSFileHandle)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSFileHandle);
    return ObjCClassMetadata;
  }
  return v2;
}

void *outlined init with take of URL?(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

void *outlined init with copy of URL?(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_1000176A0()
{
  uint64_t v2 = *(void *)(type metadata accessor for URL() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(unsigned int a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));

  return closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(a1, v3);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of DefaultStringInterpolation()
{
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:)(uint64_t a1)
{
  return closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:)(a1, *(void *)(v1 + 16), *(_DWORD *)(v1 + 24));
}

uint64_t outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_100017938()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = *(void *)(v1 + 32);
  int v9 = *(_DWORD *)(v1 + 40);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:);
  return closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)(a1, v6, v7, v8, v9);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TaskPriority();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

void *outlined init with copy of TaskPriority?(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_100017DC0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:)()
{
  return implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:)();
}

uint64_t sub_100017E08()
{
  return swift_deallocObject();
}

uint64_t sub_100017E3C()
{
  return swift_deallocObject();
}

uint64_t sub_100017E70()
{
  return swift_deallocObject();
}

uint64_t sub_100017EBC()
{
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>;
  if (!lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100017F8C()
{
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTA(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v7 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_;
  uint64_t v4 = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu
                                                 + v4))(a1, v7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

void *outlined init with copy of Result<XPCPeerConnection, XPCError>(uint64_t *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = type metadata accessor for XPCError();
    (*(void (**)(void *, uint64_t *))(*(void *)(v3 - 8) + 16))(a2, a1);
  }
  else
  {
    uint64_t v5 = *a1;
    swift_retain();
    uint64_t v2 = a1[1];
    *a2 = v5;
    a2[1] = v2;
  }
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t outlined destroy of Result<XPCPeerConnection, XPCError>(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v1 = type metadata accessor for XPCError();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  }
  else
  {
    swift_release();
  }
  return a1;
}

uint64_t sub_100018368()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  return implicit closure #3 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(*(unsigned int *)(v0 + 16));
}

uint64_t sub_10001839C()
{
  return swift_deallocObject();
}

uint64_t sub_1000183D0()
{
  return swift_deallocObject();
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100018440()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>(_DWORD *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int32)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_10001848C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int32 and conformance Int32();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int32, v4);
}

uint64_t sub_1000185BC()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(uint64_t a1)
{
  return closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(a1, *(void *)(v1 + 16), *(_DWORD *)(v1 + 24));
}

uint64_t sub_100018608()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  return implicit closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(*(unsigned int *)(v0 + 16));
}

uint64_t sub_10001863C()
{
  return swift_deallocObject();
}

uint64_t sub_100018670()
{
  return swift_deallocObject();
}

uint64_t sub_1000186A4()
{
  return swift_deallocObject();
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int32)partial apply@<X0>(_DWORD *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int32)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_1000186F0()
{
  return swift_deallocObject();
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)partial apply(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int32 and conformance Int32();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int32, v4);
}

uint64_t outlined destroy of Result<XPCDictionary, XPCError>(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v1 = type metadata accessor for XPCError();
  }
  else {
    uint64_t v1 = type metadata accessor for XPCDictionary();
  }
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_100018868()
{
  uint64_t v2 = *(void *)(type metadata accessor for XPCError() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  type metadata accessor for XPCError();

  return implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()();
}

uint64_t sub_10001899C()
{
  return swift_deallocObject();
}

uint64_t sub_1000189D0()
{
  return swift_deallocObject();
}

uint64_t sub_100018A04()
{
  return swift_deallocObject();
}

uint64_t sub_100018A50()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in serialize<A>(_:at:)()
{
  return closure #1 in serialize<A>(_:at:)();
}

uint64_t sub_100018ACC()
{
  uint64_t v2 = *(void *)(type metadata accessor for XPCError() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  type metadata accessor for XPCError();

  return implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()();
}

uint64_t sub_100018C00()
{
  return swift_deallocObject();
}

uint64_t sub_100018C34()
{
  return swift_deallocObject();
}

uint64_t sub_100018C68()
{
  return swift_deallocObject();
}

uint64_t sub_100018CB4()
{
  return swift_deallocObject();
}

uint64_t sub_100018D00()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1)
{
  return closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100018D58()
{
  uint64_t v2 = *(void *)(type metadata accessor for XPCError() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  type metadata accessor for XPCError();

  return implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()();
}

uint64_t sub_100018E8C()
{
  return swift_deallocObject();
}

uint64_t sub_100018EC0()
{
  return swift_deallocObject();
}

uint64_t sub_100018EF4()
{
  return swift_deallocObject();
}

uint64_t sub_100018F40()
{
  return swift_deallocObject();
}

uint64_t sub_100018F8C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1)
{
  return closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100018FE4()
{
  uint64_t v2 = *(void *)(type metadata accessor for XPCError() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()()
{
  type metadata accessor for XPCError();

  return implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()();
}

uint64_t sub_100019118()
{
  return swift_deallocObject();
}

uint64_t sub_10001914C()
{
  return swift_deallocObject();
}

uint64_t sub_100019180()
{
  return swift_deallocObject();
}

uint64_t sub_1000191CC()
{
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes()
{
  uint64_t v2 = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.withUnsafeMutableBytes<A>(_:)()
{
  return Data.withUnsafeMutableBytes<A>(_:)();
}

uint64_t Data.init(repeating:count:)()
{
  return Data.init(repeating:count:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
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

uint64_t dispatch thunk of XPCConnection.withUnsafeUnderlyingConnection<A>(_:)()
{
  return dispatch thunk of XPCConnection.withUnsafeUnderlyingConnection<A>(_:)();
}

uint64_t dispatch thunk of XPCConnection.send(message:replyHandler:)()
{
  return dispatch thunk of XPCConnection.send(message:replyHandler:)();
}

uint64_t dispatch thunk of XPCConnection.send(message:)()
{
  return dispatch thunk of XPCConnection.send(message:)();
}

uint64_t dispatch thunk of XPCConnection.cancel()()
{
  return dispatch thunk of XPCConnection.cancel()();
}

uint64_t dispatch thunk of XPCConnection.activate()()
{
  return dispatch thunk of XPCConnection.activate()();
}

uint64_t XPCDictionary.createReply()()
{
  return XPCDictionary.createReply()();
}

uint64_t XPCDictionary.underlyingConnection.getter()
{
  return XPCDictionary.underlyingConnection.getter();
}

uint64_t XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)()
{
  return XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)();
}

uint64_t XPCDictionary.init()()
{
  return XPCDictionary.init()();
}

uint64_t type metadata accessor for XPCDictionary()
{
  return type metadata accessor for XPCDictionary();
}

uint64_t XPCDictionary.subscript.setter()
{
  return XPCDictionary.subscript.setter();
}

{
  return XPCDictionary.subscript.setter();
}

{
  return XPCDictionary.subscript.setter();
}

uint64_t XPCDictionary.subscript.getter()
{
  return XPCDictionary.subscript.getter();
}

{
  return XPCDictionary.subscript.getter();
}

uint64_t dispatch thunk of XPCPeerConnection.setEventHandler(_:)()
{
  return dispatch thunk of XPCPeerConnection.setEventHandler(_:)();
}

uint64_t static RemoteXPCConnection.remoteServiceListenerConnection(serviceName:targetQueue:)()
{
  return static RemoteXPCConnection.remoteServiceListenerConnection(serviceName:targetQueue:)();
}

uint64_t static SystemXPCConnection.machServiceListenerConnection(name:targetQueue:)()
{
  return static SystemXPCConnection.machServiceListenerConnection(name:targetQueue:)();
}

uint64_t type metadata accessor for SystemXPCConnection()
{
  return type metadata accessor for SystemXPCConnection();
}

uint64_t dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)()
{
  return dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)();
}

uint64_t type metadata accessor for RemoteXPCPeerConnection()
{
  return type metadata accessor for RemoteXPCPeerConnection();
}

uint64_t dispatch thunk of SystemXPCPeerConnection.setEventHandler(_:)()
{
  return dispatch thunk of SystemXPCPeerConnection.setEventHandler(_:)();
}

uint64_t type metadata accessor for SystemXPCPeerConnection()
{
  return type metadata accessor for SystemXPCPeerConnection();
}

uint64_t type metadata accessor for RemoteXPCListenerConnection()
{
  return type metadata accessor for RemoteXPCListenerConnection();
}

uint64_t type metadata accessor for SystemXPCListenerConnection()
{
  return type metadata accessor for SystemXPCListenerConnection();
}

uint64_t type metadata accessor for XPCError()
{
  return type metadata accessor for XPCError();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t Dictionary.removeValue(forKey:)()
{
  return Dictionary.removeValue(forKey:)();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t Dictionary.subscript.getter()
{
  return Dictionary.subscript.getter();
}

uint64_t Dictionary.subscript.setter()
{
  return Dictionary.subscript.setter();
}

Swift::Int __swiftcall Hashable._rawHashValue(seed:)(Swift::Int seed)
{
  return Hashable._rawHashValue(seed:)(seed);
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.init(stringInterpolation:)()
{
  return String.init(stringInterpolation:)();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t static String.== infix(_:_:)()
{
  return static String.== infix(_:_:)();
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Sequence.forEach(_:)()
{
  return Sequence.forEach(_:)();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return UnsignedInteger<>.init<A>(_:)();
}

uint64_t SignedInteger<>.init<A>(_:)()
{
  return SignedInteger<>.init<A>(_:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
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

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return UnsafeMutablePointer.deinitialize(count:)();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return static UnsafeMutablePointer.allocate(capacity:)();
}

uint64_t UnsafeMutableBufferPointer.baseAddress.getter()
{
  return UnsafeMutableBufferPointer.baseAddress.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _hashValue<A>(for:)()
{
  return _hashValue<A>(for:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return dispatch thunk of static FixedWidthInteger.bitWidth.getter();
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

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

Swift::Void __swiftcall DefaultStringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t DefaultStringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return _allocateUninitializedArray<A>(_:)();
}

uint64_t _convertInOutToPointerArgument<A>(_:)()
{
  return _convertInOutToPointerArgument<A>(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.combine<A>(_:)()
{
  return Hasher.combine<A>(_:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_main(void)
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
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

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

uint64_t xpc_file_transfer_create_with_path()
{
  return _xpc_file_transfer_create_with_path();
}