ValueMetadata *type metadata accessor for OSSignpostID()
{
  return &type metadata for OSSignpostID;
}

uint64_t static os_signpost_type_t.event.getter()
{
  return 0;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t getEnumTag for OSLogFloatFormatting.Notation(unsigned __int8 *a1)
{
  return *a1;
}

id Logger.logObject.getter()
{
  return *v0;
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return 1;
}

uint64_t static os_signpost_type_t.end.getter()
{
  return 2;
}

uint64_t static os_log_type_t.default.getter()
{
  return 0;
}

uint64_t static os_log_type_t.debug.getter()
{
  return 2;
}

id OSSignposter.logHandle.getter()
{
  return *v0;
}

uint64_t OSSignpostID.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t static os_log_type_t.info.getter()
{
  return 1;
}

ValueMetadata *type metadata accessor for OSSignposter()
{
  return &type metadata for OSSignposter;
}

ValueMetadata *type metadata accessor for OSSignpostError()
{
  return &type metadata for OSSignpostError;
}

void OSSignpostIntervalState.signpostID.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

uint64_t OSSignpostIntervalState.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 25, 7);
}

uint64_t checkForErrorAndConsumeState(state:)@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 24);
  *(unsigned char *)(result + 24) = 0;
  *a2 = v2;
  return result;
}

uint64_t OSSignposter.init(logHandle:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)(void *a1, char a2)
{
  *(void *)(v2 + 16) = *a1;
  *(unsigned char *)(v2 + 24) = a2;
  return v2;
}

uint64_t static os_log_type_t.error.getter()
{
  return 16;
}

void *static OSSignpostID.exclusive.getter@<X0>(void *a1@<X8>)
{
  return static OSSignpostID.exclusive.getter(&one-time initialization token for exclusive, &static OSSignpostID.exclusive, a1);
}

id Logger.init()@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)static OS_os_log.default;
  *a1 = static OS_os_log.default;

  return v2;
}

id one-time initialization function for default()
{
  id result = (id)_swift_os_log_default();
  static OS_os_log.default = (uint64_t)result;
  return result;
}

uint64_t _swift_os_log_default()
{
  uint64_t v0 = MEMORY[0x1E4F14500];
  id v1 = MEMORY[0x1E4F14500];
  return v0;
}

os_log_t OS_os_log.init(subsystem:category:)()
{
  uint64_t v0 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v1 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  os_log_t v2 = os_log_create((const char *)(v0 + 32), (const char *)(v1 + 32));
  swift_release();
  swift_release();
  return v2;
}

{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;

  uint64_t v0 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v1 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  os_log_t v2 = os_log_create((const char *)(v0 + 32), (const char *)(v1 + 32));
  swift_release();
  swift_release();
  return v2;
}

void *static OSSignpostID.exclusive.getter@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*result != -1) {
    id result = (void *)swift_once();
  }
  *a3 = *a2;
  return result;
}

id static OS_os_log.default.getter()
{
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static OS_os_log.default;

  return v0;
}

uint64_t OSSignposter.init(subsystem:category:)@<X0>(os_log_t *a1@<X8>)
{
  uint64_t v2 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v3 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  os_log_t v4 = os_log_create((const char *)(v2 + 32), (const char *)(v3 + 32));
  swift_release();
  uint64_t result = swift_release();
  *a1 = v4;
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  uint64_t result;

  uint64_t v2 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v3 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  os_log_t v4 = os_log_create((const char *)(v2 + 32), (const char *)(v3 + 32));
  swift_release();
  uint64_t result = swift_release();
  *a1 = v4;
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

BOOL OSSignposter.isEnabled.getter()
{
  return os_signpost_enabled(*v0);
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return self;
}

void OSSignpostID.init(log:object:)(NSObject *a1@<X0>, const void *a2@<X1>, os_signpost_id_t *a3@<X8>)
{
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(a1, a2);
  swift_unknownObjectRelease();

  *a3 = v5;
}

BOOL OS_os_log.signpostsEnabled.getter()
{
  return os_signpost_enabled(v0);
}

void OSSignpostID.init(log:)(NSObject *a1@<X0>, os_signpost_id_t *a2@<X8>)
{
  os_signpost_id_t v4 = os_signpost_id_generate(a1);

  *a2 = v4;
}

uint64_t Logger.init(subsystem:category:)@<X0>(os_log_t *a1@<X8>)
{
  uint64_t v2 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v3 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  os_log_t v4 = os_log_create((const char *)(v2 + 32), (const char *)(v3 + 32));
  swift_release();
  uint64_t result = swift_release();
  *a1 = v4;
  return result;
}

uint64_t os_log(_:dso:log:_:_:)(os_log_type_t a1, uint64_t a2, os_log_t oslog, char *a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t result = os_log_type_enabled(oslog, a1);
  if (result)
  {
    uint64_t v15 = _swift_os_log_return_address();
    MEMORY[0x1F4188790]();
    if ((a6 & 1) == 0)
    {
      if (a4)
      {
        if ((a5 & 0x8000000000000000) == 0)
        {
          swift_bridgeObjectRetain();
          specialized withVaList<A>(_:_:)(a7, a2, v15, oslog, a1, a4);
          return swift_bridgeObjectRelease();
        }
        _fatalErrorMessage(_:_:file:line:flags:)();
        __break(1u);
      }
      goto LABEL_14;
    }
    if ((unint64_t)a4 >> 32 || WORD1(a4) > 0x10u || (a4 & 0xFFFFF800) == 0xD800)
    {
LABEL_14:
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    return _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a4, (uint64_t (*)(uint64_t *))partial apply for closure #1 in os_log(_:dso:log:_:_:));
  }
  return result;
}

void os_signpost(_:dso:log:name:signpostID:)(unsigned __int8 a1, uint64_t a2, os_log_t log, unint64_t a4, uint64_t a5, char a6, uint64_t *a7)
{
  uint64_t v13 = *a7;
  if (one-time initialization token for invalid != -1) {
    swift_once();
  }
  if (v13 != static OSSignpostID.invalid)
  {
    if (one-time initialization token for null != -1) {
      swift_once();
    }
    uint64_t v14 = static OSSignpostID.null;
    if (os_signpost_enabled(log) && v13 != v14)
    {
      uint64_t v15 = _swift_os_log_return_address();
      MEMORY[0x1F4188790](v15);
      if ((a6 & 1) == 0)
      {
        if (a4)
        {
          if ((a5 & 0x8000000000000000) == 0)
          {
            _swift_os_signpost(a2, v16, log, a1, a4, v13);
            return;
          }
          _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        goto LABEL_20;
      }
      if (HIDWORD(a4) || WORD1(a4) > 0x10u || (a4 & 0xFFFFF800) == 0xD800)
      {
LABEL_20:
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return;
      }
      _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a4, (uint64_t (*)(uint64_t *))partial apply for closure #1 in os_signpost(_:dso:log:name:signpostID:));
    }
  }
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)(uint64_t result, uint64_t a2, os_log_t log, unint64_t a4, uint64_t a5, char a6, uint64_t *a7, char *a8, uint64_t a9, char a10, uint64_t a11)
{
  unsigned __int8 v17 = result;
  uint64_t v18 = *a7;
  if (one-time initialization token for invalid != -1) {
    uint64_t result = swift_once();
  }
  if (v18 != static OSSignpostID.invalid)
  {
    if (one-time initialization token for null != -1) {
      swift_once();
    }
    uint64_t v19 = static OSSignpostID.null;
    uint64_t result = os_signpost_enabled(log);
    if (result)
    {
      if (v18 != v19)
      {
        uint64_t v21 = a5;
        _swift_os_log_return_address();
        MEMORY[0x1F4188790](&v21);
        if (a6)
        {
          if (!HIDWORD(a4) && WORD1(a4) <= 0x10u && (a4 & 0xFFFFF800) != 0xD800) {
            return _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a4, (uint64_t (*)(uint64_t *))partial apply for closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:));
          }
        }
        else if (a4)
        {
          if ((v21 & 0x8000000000000000) == 0) {
            return closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(a4, a8, a9, a10, a11, a2, v20, log, v17, v18);
          }
          _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        uint64_t result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(uint64_t a1, char *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, unsigned __int8 a9, uint64_t a10)
{
  if ((a4 & 1) == 0)
  {
    if (a2)
    {
      if ((a3 & 0x8000000000000000) == 0)
      {
        swift_bridgeObjectRetain();
        specialized withVaList<A>(_:_:)(a5, a6, a7, a8, a9, a1, a10, a2);
        return swift_bridgeObjectRelease();
      }
      goto LABEL_10;
    }
LABEL_9:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_10:
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_11;
  }
  if (!((unint64_t)a2 >> 32))
  {
    if (WORD1(a2) <= 0x10u && (a2 & 0xFFFFF800) != 0xD800) {
      return _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a2, (uint64_t (*)(uint64_t *))partial apply for closure #1 in closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:));
    }
    goto LABEL_9;
  }
LABEL_11:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned __int8 a5, uint64_t a6, uint64_t a7, char *a8)
{
  type metadata accessor for __VaListBuilder();
  v9 = (void *)swift_allocObject();
  v9[2] = 8;
  v9[3] = 0;
  v10 = v9 + 3;
  v9[4] = 0;
  v9[5] = 0;
  uint64_t v11 = *(void *)(a1 + 16);
  if (!v11)
  {
LABEL_26:
    v28 = (_DWORD *)__VaListBuilder.va_list()();
    _swift_os_signpost_with_format(a2, a3, a4, a5, a6, a7, a8, v28);

    return swift_release();
  }
  uint64_t v12 = 0;
  uint64_t v13 = a1 + 32;
  while (1)
  {
    outlined init with copy of CVarArg(v13 + 40 * v12, (uint64_t)v37);
    __swift_project_boxed_opaque_existential_1(v37, v37[3]);
    uint64_t v14 = dispatch thunk of CVarArg._cVarArgEncoding.getter();
    uint64_t v15 = *v10;
    uint64_t v16 = *(void *)(v14 + 16);
    BOOL v17 = __OFADD__(*v10, v16);
    uint64_t v18 = *v10 + v16;
    if (v17) {
      break;
    }
    uint64_t v19 = v14;
    uint64_t v20 = v9[4];
    if (v20 >= v18) {
      goto LABEL_19;
    }
    if (v20 + 0x4000000000000000 < 0) {
      goto LABEL_29;
    }
    uint64_t v21 = (char *)v9[5];
    if (2 * v20 > v18) {
      uint64_t v18 = 2 * v20;
    }
    v9[4] = v18;
    if ((unint64_t)(v18 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_30;
    }
    v22 = (char *)swift_slowAlloc();
    v9[5] = v22;
    if (v21)
    {
      if (v15 < 0) {
        goto LABEL_32;
      }
      if (v22 != v21 || v22 >= &v21[8 * v15]) {
        memmove(v22, v21, 8 * v15);
      }
      __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_19:
      v22 = (char *)v9[5];
    }
    if (!v22) {
      goto LABEL_31;
    }
    uint64_t v24 = *(void *)(v19 + 16);
    if (v24)
    {
      v25 = (uint64_t *)(v19 + 32);
      uint64_t v26 = *v10;
      while (1)
      {
        uint64_t v27 = *v25++;
        *(void *)&v22[8 * v26] = v27;
        uint64_t v26 = *v10 + 1;
        if (__OFADD__(*v10, 1)) {
          break;
        }
        uint64_t *v10 = v26;
        if (!--v24) {
          goto LABEL_3;
        }
      }
      __break(1u);
      break;
    }
LABEL_3:
    ++v12;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    if (v12 == v11) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_32:

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t os_log(_:dso:log:type:_:)(char *a1, uint64_t a2, char a3, uint64_t a4, os_log_t oslog, os_log_type_t a6, uint64_t a7)
{
  uint64_t result = os_log_type_enabled(oslog, a6);
  if (result)
  {
    uint64_t v15 = _swift_os_log_return_address();
    MEMORY[0x1F4188790](v15);
    if ((a3 & 1) == 0)
    {
      if (a1)
      {
        if ((a2 & 0x8000000000000000) == 0)
        {
          swift_bridgeObjectRetain();
          specialized withVaList<A>(_:_:)(a7, a4, v15, oslog, a6, a1);
          return swift_bridgeObjectRelease();
        }
        _fatalErrorMessage(_:_:file:line:flags:)();
        __break(1u);
      }
      goto LABEL_14;
    }
    if ((unint64_t)a1 >> 32 || WORD1(a1) > 0x10u || (a1 & 0xFFFFF800) == 0xD800)
    {
LABEL_14:
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    return _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a1, (uint64_t (*)(uint64_t *))partial apply for closure #1 in os_log(_:dso:log:type:_:));
  }
  return result;
}

uint64_t _swift_os_log_return_address()
{
  return *(void *)(vars0 + 8);
}

uint64_t specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned __int8 a5, char *a6)
{
  type metadata accessor for __VaListBuilder();
  v7 = (void *)swift_allocObject();
  v7[2] = 8;
  v7[3] = 0;
  v8 = v7 + 3;
  v7[4] = 0;
  v7[5] = 0;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_26:
    uint64_t v26 = (_DWORD *)__VaListBuilder.va_list()();
    _swift_os_log(a2, a3, a4, a5, a6, v26);

    return swift_release();
  }
  uint64_t v10 = 0;
  uint64_t v11 = a1 + 32;
  while (1)
  {
    outlined init with copy of CVarArg(v11 + 40 * v10, (uint64_t)v33);
    __swift_project_boxed_opaque_existential_1(v33, v33[3]);
    uint64_t v12 = dispatch thunk of CVarArg._cVarArgEncoding.getter();
    uint64_t v13 = *v8;
    uint64_t v14 = *(void *)(v12 + 16);
    BOOL v15 = __OFADD__(*v8, v14);
    uint64_t v16 = *v8 + v14;
    if (v15) {
      break;
    }
    uint64_t v17 = v12;
    uint64_t v18 = v7[4];
    if (v18 >= v16) {
      goto LABEL_19;
    }
    if (v18 + 0x4000000000000000 < 0) {
      goto LABEL_29;
    }
    uint64_t v19 = (char *)v7[5];
    if (2 * v18 > v16) {
      uint64_t v16 = 2 * v18;
    }
    v7[4] = v16;
    if ((unint64_t)(v16 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_30;
    }
    uint64_t v20 = (char *)swift_slowAlloc();
    v7[5] = v20;
    if (v19)
    {
      if (v13 < 0) {
        goto LABEL_32;
      }
      if (v20 != v19 || v20 >= &v19[8 * v13]) {
        memmove(v20, v19, 8 * v13);
      }
      __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_19:
      uint64_t v20 = (char *)v7[5];
    }
    if (!v20) {
      goto LABEL_31;
    }
    uint64_t v22 = *(void *)(v17 + 16);
    if (v22)
    {
      v23 = (uint64_t *)(v17 + 32);
      uint64_t v24 = *v8;
      while (1)
      {
        uint64_t v25 = *v23++;
        *(void *)&v20[8 * v24] = v25;
        uint64_t v24 = *v8 + 1;
        if (__OFADD__(*v8, 1)) {
          break;
        }
        uint64_t *v8 = v24;
        if (!--v22) {
          goto LABEL_3;
        }
      }
      __break(1u);
      break;
    }
LABEL_3:
    ++v10;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
    if (v10 == v9) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_32:

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
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

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void _swift_os_log(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char *a5, _DWORD *a6)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = *__error();
  uint64_t v16 = 0x1000000000000;
  uint64_t v14 = v17;
  uint64_t v15 = 0x36200000000;
  if (_os_log_encode(v17, a5, a6, v10, (uint64_t)&v14))
  {
    _os_log_pack_size();
    uint64_t v11 = (char *)&v13 - ((MEMORY[0x1F4188790]() + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = (void *)_os_log_pack_fill();
    *((void *)v11 + 4) = a2;
    memcpy(v12, v17, v15);
    os_log_pack_send();
  }
}

uint64_t _os_log_encode(_WORD *a1, char *__s, _DWORD *a3, int a4, uint64_t a5)
{
  uint64_t v5 = a5;
  v72 = a3;
  int v71 = a4;
  __int16 __src = 0;
  if ((*(_WORD *)(a5 + 20) & 2) == 0)
  {
    uint64_t v7 = *(unsigned int *)(a5 + 8);
    if ((*(char *)(a5 + 22) + *(_DWORD *)(a5 + 12) - v7 - 1) <= 1)
    {
      os_trace_blob_add_slow(a5, &__src, 2uLL);
    }
    else
    {
      *(_WORD *)(*(void *)a5 + v7) = __src;
      unsigned int v8 = *(_DWORD *)(a5 + 8) + 2;
      *(_DWORD *)(a5 + 8) = v8;
      if (!*(unsigned char *)(a5 + 22)) {
        *(unsigned char *)(*(void *)a5 + v8) = 0;
      }
    }
  }
  for (i = strchr(__s, 37); i; i = strchr(v11, 37))
  {
    int v10 = i + 1;
    if (i[1] == 37)
    {
      uint64_t v11 = i + 2;
    }
    else
    {
      __int16 v69 = 0;
      int v68 = 0;
      if (HIBYTE(__src) == 48) {
        break;
      }
      int v12 = 0;
      uint64_t v13 = 0;
      int v14 = 0;
      uint64_t v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = __src;
      while (2)
      {
        uint64_t v19 = *v10;
        switch(*v10)
        {
          case '@':
            if (v17 == 2)
            {
              v41 = v72;
              v72 += 2;
              LODWORD(v67) = *v41;
              __int16 v69 = 1024;
              _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v67);
              ++HIBYTE(__src);
              LOBYTE(v18) = __src;
            }
            LOBYTE(__src) = v18 | 2;
            v42 = (uint64_t *)v72;
            v72 += 2;
            uint64_t v67 = *v42;
            char v43 = 64;
            goto LABEL_97;
          case 'A':
          case 'E':
          case 'F':
          case 'G':
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            if (v17 == 2)
            {
              v32 = v72;
              v72 += 2;
              LODWORD(v67) = *v32;
              __int16 v69 = 1024;
              _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v67);
              ++HIBYTE(__src);
              char v33 = v69;
            }
            else
            {
              char v33 = 0;
            }
            if (v16 == 2)
            {
              LOBYTE(v69) = v33 & 0xF;
              HIBYTE(v69) = 4;
              v36 = v72;
              v72 += 2;
              int v68 = *v36;
              _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v68);
              ++HIBYTE(__src);
            }
            char v37 = v15 & 0xF;
            v38 = (uint64_t *)v72;
            v72 += 2;
            uint64_t v67 = *v38;
            goto LABEL_98;
          case 'B':
          case 'D':
          case 'H':
          case 'I':
          case 'J':
          case 'K':
          case 'M':
          case 'N':
          case 'O':
          case 'Q':
          case 'R':
          case 'S':
          case 'T':
          case 'U':
          case 'V':
          case 'W':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
          case ']':
          case '^':
          case '_':
          case 'b':
          case 'k':
          case 'n':
          case 'q':
          case 'r':
          case 'v':
          case 'w':
          case 'y':
            goto LABEL_16;
          case 'C':
            if (v17 == 2)
            {
              v44 = v72;
              v72 += 2;
              LODWORD(v67) = *v44;
              __int16 v69 = 1024;
              _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v67);
              ++HIBYTE(__src);
              char v45 = v69;
            }
            else
            {
              char v45 = 0;
            }
            if (v16 == 2)
            {
              LOBYTE(v69) = v45 & 0xF;
              HIBYTE(v69) = 4;
              v51 = v72;
              v72 += 2;
              int v68 = *v51;
              _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v68);
              ++HIBYTE(__src);
            }
LABEL_85:
            v52 = v72;
            v72 += 2;
            LODWORD(v67) = *v52;
            LOBYTE(v69) = v15 & 0xF;
            char v53 = 4;
            goto LABEL_99;
          case 'L':
            uint64_t v13 = 1;
            goto LABEL_55;
          case 'P':
            if (v17 == 2)
            {
              v46 = v72;
              v72 += 2;
              LODWORD(v67) = *v46;
              __int16 v69 = 1024;
              _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v67);
              ++HIBYTE(__src);
              char v47 = v69;
              if (!v16) {
                goto LABEL_96;
              }
            }
            else
            {
              char v47 = 0;
              if (!v16) {
                goto LABEL_96;
              }
            }
            LOBYTE(v69) = v47 & 0xF | 0x10;
            HIBYTE(v69) = 4;
            if (v16 == 2)
            {
              v61 = v72;
              v72 += 2;
              int v68 = *v61;
            }
            else
            {
              LOBYTE(v69) = v15 & 0xF | 0x10;
            }
            _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v68);
            ++HIBYTE(__src);
LABEL_96:
            LOBYTE(__src) = __src | 2;
            v62 = (uint64_t *)v72;
            v72 += 2;
            uint64_t v67 = *v62;
            char v43 = 48;
LABEL_97:
            char v37 = v43 & 0xF0 | v15 & 0xF;
LABEL_98:
            LOBYTE(v69) = v37;
            char v53 = 8;
LABEL_99:
            HIBYTE(v69) = v53;
            v48 = &v67;
LABEL_100:
            _os_log_encode_arg(v5, (unsigned __int8 *)&v69, v48);
            char v60 = HIBYTE(__src) + 1;
            goto LABEL_101;
          case 'X':
          case 'c':
          case 'd':
          case 'i':
          case 'o':
          case 'u':
          case 'x':
            if (v17 == 2)
            {
              v34 = v72;
              v72 += 2;
              LODWORD(v67) = *v34;
              __int16 v69 = 1024;
              _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v67);
              ++HIBYTE(__src);
              char v35 = v69;
            }
            else
            {
              char v35 = 0;
            }
            if (v16 == 2)
            {
              LOBYTE(v69) = v35 & 0xF;
              HIBYTE(v69) = 4;
              v39 = v72;
              v72 += 2;
              int v68 = *v39;
              _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v68);
              ++HIBYTE(__src);
            }
            switch(v14)
            {
              case -2:
              case -1:
              case 0:
                goto LABEL_85;
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
                goto LABEL_68;
              default:
                uint64_t result = 0;
                break;
            }
            return result;
          case 'h':
            --v14;
            goto LABEL_55;
          case 'j':
            int v14 = 4;
            goto LABEL_55;
          case 'l':
            ++v14;
            goto LABEL_55;
          case 'm':
            HIBYTE(v69) = 4;
            LOBYTE(v69) = v15 & 0xF;
            v48 = (uint64_t *)&v71;
            goto LABEL_100;
          case 'p':
LABEL_68:
            v40 = (uint64_t *)v72;
            v72 += 2;
            uint64_t v67 = *v40;
            char v37 = v15 & 0xF;
            goto LABEL_98;
          case 's':
            if (v17 == 2)
            {
              v49 = v72;
              v72 += 2;
              LODWORD(v67) = *v49;
              __int16 v69 = 1024;
              _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v67);
              ++HIBYTE(__src);
              char v50 = v69;
              if (!v16) {
                goto LABEL_90;
              }
            }
            else
            {
              char v50 = 0;
              if (!v16)
              {
LABEL_90:
                char v54 = v15;
                goto LABEL_93;
              }
            }
            LOBYTE(v69) = v50 & 0xF | 0x10;
            HIBYTE(v69) = 4;
            if (v16 == 2)
            {
              v55 = v72;
              v72 += 2;
              int v68 = *v55;
            }
            else
            {
              LOBYTE(v69) = v15 & 0xF | 0x10;
            }
            char v54 = v15;
            _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v68);
            ++HIBYTE(__src);
            char v50 = v69;
LABEL_93:
            LOBYTE(__src) = __src | 2;
            LOBYTE(v69) = v50 & 0xF | 0x20;
            v56 = (void **)v72;
            v72 += 2;
            v57 = *v56;
            uint64_t v67 = 0;
            id v58 = v57;
            uint64_t v67 = [v58 UTF8String];
            LOBYTE(v69) = v69 & 0xF0 | v54 & 0xF;
            HIBYTE(v69) = 8;
            _os_log_encode_arg(v5, (unsigned __int8 *)&v69, &v67);
            char v59 = HIBYTE(__src);

            char v60 = v59 + 1;
LABEL_101:
            HIBYTE(__src) = v60;
LABEL_102:
            uint64_t v11 = v10;
            break;
          case 't':
            int v14 = 5;
            goto LABEL_55;
          case 'z':
            int v14 = 3;
            goto LABEL_55;
          case '{':
            uint64_t v20 = v15;
            uint64_t v21 = v10 + 1;
            uint64_t v22 = 1;
            while (2)
            {
              if (v10[v22])
              {
                if (v10[v22] != 125)
                {
                  ++v22;
                  continue;
                }
                int v65 = v17;
                int v66 = v16;
                uint64_t v25 = v13;
                uint64_t v26 = v5;
                uint64_t v27 = v22 - 1;
                if (v22 - 1 >= 9) {
                  size_t v28 = 9;
                }
                else {
                  size_t v28 = v22 - 1;
                }
                int v29 = strncmp(v10 + 1, "sensitive", v28);
                v10 += v22;
                if (v29)
                {
                  if (v27 >= 7) {
                    size_t v30 = 7;
                  }
                  else {
                    size_t v30 = v22 - 1;
                  }
                  if (!strncmp(v21, "private", v30))
                  {
                    v18 |= 1u;
                    LOBYTE(__src) = v18;
                    uint64_t v15 = v20 | 1;
                  }
                  else
                  {
                    if (v27 >= 6) {
                      size_t v31 = 6;
                    }
                    else {
                      size_t v31 = v22 - 1;
                    }
                    if (!strncmp(v21, "public", v31)) {
                      uint64_t v15 = v20 | 2;
                    }
                    else {
                      uint64_t v15 = v20;
                    }
                  }
                  uint64_t v5 = v26;
                }
                else
                {
                  v18 |= 1u;
                  LOBYTE(__src) = v18;
                  uint64_t v15 = v20 | 5;
                  uint64_t v5 = v26;
                }
                uint64_t v13 = v25;
                int v17 = v65;
                int v16 = v66;
              }
              else
              {
                uint64_t v15 = v20;
              }
              break;
            }
            goto LABEL_55;
          default:
            if (v19 > 0x2E) {
              goto LABEL_16;
            }
            if (((1 << *v10) & 0x288900000000) != 0) {
              goto LABEL_55;
            }
            if (v19 == 42)
            {
              int v17 = 2;
              if (v10[1] != 46) {
                goto LABEL_55;
              }
              ++v10;
LABEL_29:
              int v23 = v10[1];
              if (v23 == 42)
              {
                int v16 = 2;
                ++v10;
              }
              else
              {
                unsigned int v24 = v23 - 48;
                if ((v23 - 48) <= 9)
                {
                  do
                  {
                    int v12 = v24 + 10 * v12;
                    int v68 = v12;
                    unsigned int v24 = v10[2] - 48;
                    ++v10;
                  }
                  while (v24 < 0xA);
                }
                if (v12 >= 1025)
                {
                  int v12 = 1024;
                  int v68 = 1024;
                }
                int v16 = 1;
              }
              goto LABEL_55;
            }
            if (v19 == 46) {
              goto LABEL_29;
            }
LABEL_16:
            if ((v19 - 48) >= 0xA) {
              goto LABEL_102;
            }
LABEL_55:
            ++v10;
            continue;
        }
        break;
      }
    }
  }
  *a1 = __src;
  return 1;
}

uint64_t _os_log_encode_arg(uint64_t result, unsigned __int8 *__src, void *a3)
{
  uint64_t v5 = result;
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    uint64_t v6 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v6 - 1) <= 1)
    {
      uint64_t result = os_trace_blob_add_slow(result, __src, 2uLL);
    }
    else
    {
      *(_WORD *)(*(void *)result + v6) = *(_WORD *)__src;
      unsigned int v7 = *(_DWORD *)(result + 8) + 2;
      *(_DWORD *)(result + 8) = v7;
      if (!*(unsigned char *)(result + 22)) {
        *(unsigned char *)(*(void *)result + v7) = 0;
      }
    }
  }
  if ((*(_WORD *)(v5 + 20) & 2) == 0)
  {
    size_t v8 = __src[1];
    uint64_t v9 = *(unsigned int *)(v5 + 8);
    if (*(char *)(v5 + 22) + *(_DWORD *)(v5 + 12) - (int)v9 - 1 < v8)
    {
      return os_trace_blob_add_slow(v5, a3, v8);
    }
    else
    {
      uint64_t result = (uint64_t)memcpy((void *)(*(void *)v5 + v9), a3, v8);
      unsigned int v10 = *(_DWORD *)(v5 + 8) + v8;
      *(_DWORD *)(v5 + 8) = v10;
      if (!*(unsigned char *)(v5 + 22)) {
        *(unsigned char *)(*(void *)v5 + v10) = 0;
      }
    }
  }
  return result;
}

void _swift_os_signpost_with_format(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, _DWORD *a8)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  int v12 = *__error();
  uint64_t v19 = 0x1000000000362;
  int v17 = v20;
  uint64_t v18 = 0x36200000000;
  if (a7) {
    uint64_t v13 = a7;
  }
  else {
    uint64_t v13 = "";
  }
  if (_os_log_encode(v20, v13, a8, v12, (uint64_t)&v17))
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = (char *)&v17 - ((MEMORY[0x1F4188790](v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    int v16 = (void *)_os_signpost_pack_fill();
    *((void *)v15 + 4) = a2;
    memcpy(v16, v20, v18);
    _os_signpost_pack_send();
  }
}

void _swift_os_signpost(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

uint64_t Logger.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void *OSSignposter.init(logger:)@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t OSSignpostID.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for OSAllocatedUnfairLock()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t static os_log_type_t.fault.getter()
{
  return 17;
}

uint64_t static OSLogIntegerFormatting.decimal.getter()
{
  char v0 = default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)();
  return static OSLogIntegerFormatting.decimal(explicitPositiveSign:)(v0 & 1);
}

uint64_t static OSLogIntegerFormatting.decimal(explicitPositiveSign:)(char a1)
{
  uint64_t v2 = 10;
  char v3 = a1 & 1;
  char v4 = 0;
  char v5 = 0;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined destroy of OSLogIntegerFormatting((uint64_t)&v2);
  return 10;
}

uint64_t outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t outlined destroy of OSLogIntegerFormatting(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  return a1;
}

uint64_t default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)()
{
  return 0;
}

uint64_t type metadata instantiation function for OSAllocatedUnfairLock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void one-time initialization function for null()
{
  static OSSignpostID.null = 0;
}

void one-time initialization function for invalid()
{
  static OSSignpostID.invalid = -1;
}

void one-time initialization function for exclusive()
{
  static OSSignpostID.exclusive = 0xEEEEB0B5B2B2EEEELL;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostID(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *static OSSignpostID.null.getter@<X0>(void *a1@<X8>)
{
  return static OSSignpostID.exclusive.getter(&one-time initialization token for null, &static OSSignpostID.null, a1);
}

ValueMetadata *type metadata accessor for OS_os_log.Category()
{
  return &type metadata for OS_os_log.Category;
}

uint64_t static OS_os_log.Category.pointsOfInterest.getter@<X0>(void *a1@<X8>)
{
  return static OS_os_log.Category.pointsOfInterest.getter(&one-time initialization token for pointsOfInterest, &static OS_os_log.Category.pointsOfInterest, (uint64_t *)algn_1E930D2F8, a1);
}

uint64_t one-time initialization function for pointsOfInterest()
{
  uint64_t result = String.init(cString:)();
  static OS_os_log.Category.pointsOfInterest = result;
  *(void *)algn_1E930D2F8 = v1;
  return result;
}

id one-time initialization function for disabled()
{
  id result = (id)_swift_os_log_disabled();
  static OS_os_log.disabled = (uint64_t)result;
  return result;
}

uint64_t _swift_os_log_disabled()
{
  uint64_t v0 = MEMORY[0x1E4F14508];
  id v1 = MEMORY[0x1E4F14508];
  return v0;
}

uint64_t static OS_os_log.Category.pointsOfInterest.getter@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;

  return swift_bridgeObjectRetain();
}

id static OS_os_log.disabled.getter()
{
  if (one-time initialization token for disabled != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static OS_os_log.disabled;

  return v0;
}

void os_trace_blob_destroy_slow(uint64_t a1)
{
  id v1 = *(void **)a1;
  *(void *)a1 = 3954044928;
  *(_WORD *)(a1 + 20) = 0;
  free(v1);
}

void *os_trace_blob_detach(uint64_t a1, void *a2)
{
  __int16 v2 = *(_WORD *)(a1 + 20);
  char v3 = *(const void **)a1;
  *(void *)a1 = 3954044928;
  *(_WORD *)(a1 + 20) = 0;
  if (a2) {
    *a2 = *(unsigned int *)(a1 + 8);
  }
  if ((v2 & 1) == 0)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 8);
    if (*(unsigned char *)(a1 + 22)) {
      size_t v5 = v4;
    }
    else {
      size_t v5 = v4 + 1;
    }
    uint64_t v6 = _os_trace_malloc(v5);
    memcpy(v6, v3, v5);
    return v6;
  }
  return (void *)v3;
}

size_t os_trace_blob_add_slow(uint64_t a1, void *__src, size_t __n)
{
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0;
  }
  size_t v3 = __n;
  unsigned int v6 = *(_DWORD *)(a1 + 12);
  size_t v7 = *(char *)(a1 + 22) + v6 - *(_DWORD *)(a1 + 8) - 1;
  if (v7 < __n)
  {
    if (v6 < *(_DWORD *)(a1 + 16)) {
      size_t v7 = os_trace_blob_grow(a1, __n);
    }
    if (v7 < v3)
    {
      *(_WORD *)(a1 + 20) |= 2u;
      size_t v3 = v7;
    }
  }
  memcpy((void *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), __src, v3);
  unsigned int v8 = *(_DWORD *)(a1 + 8) + v3;
  *(_DWORD *)(a1 + 8) = v8;
  if (!*(unsigned char *)(a1 + 22)) {
    *(unsigned char *)(*(void *)a1 + v8) = 0;
  }
  return v3;
}

uint64_t os_trace_blob_grow(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  if (*(unsigned char *)(a1 + 22)) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = v3 + 1;
  }
  size_t v5 = v4 + a2;
  if (__CFADD__(v4, a2) || HIDWORD(v5))
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    unsigned int v7 = *(_DWORD *)(a1 + 16);
  }
  else
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((v6 & 0x80000000) != 0)
    {
      unsigned int v7 = *(_DWORD *)(a1 + 16);
    }
    else
    {
      if (2 * v6 > v5) {
        LODWORD(v5) = 2 * v6;
      }
      if (*(_DWORD *)(a1 + 16) >= v5) {
        unsigned int v7 = v5;
      }
      else {
        unsigned int v7 = *(_DWORD *)(a1 + 16);
      }
    }
  }
  if (v7 > v6)
  {
    unsigned int v8 = *(void **)a1;
    if (*(_WORD *)(a1 + 20))
    {
      while (1)
      {
        unsigned int v10 = malloc_type_realloc(v8, v7, 0x70A02AF0uLL);
        if (v10) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }
      *(void *)a1 = v10;
    }
    else
    {
      uint64_t v9 = _os_trace_malloc(v7);
      *(void *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }
    *(_DWORD *)(a1 + 12) = v7;
  }
  return v7 - v4;
}

void *_os_trace_malloc(size_t a1)
{
  for (size_t i = a1; ; a1 = i)
  {
    id result = malloc_type_malloc(a1, 0xE7D9D2F0uLL);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

uint64_t _os_trace_temporary_resource_shortage()
{
  return sleep(1u);
}

uint64_t _swift_os_log_reportError()
{
  return MEMORY[0x1F4186768]();
}

uint64_t OSLogFloatFormatting.explicitPositiveSign.getter()
{
  return *v0;
}

uint64_t OSLogFloatFormatting.explicitPositiveSign.setter(uint64_t result)
{
  *id v1 = result;
  return result;
}

uint64_t (*OSLogFloatFormatting.explicitPositiveSign.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogFloatFormatting.uppercase.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t OSLogFloatFormatting.uppercase.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*OSLogFloatFormatting.uppercase.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t key path getter for OSLogFloatFormatting.precision : OSLogFloatFormatting@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    unsigned int v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  }
  else
  {
    unsigned int v6 = 0;
    uint64_t v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v5;

  return outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
}

uint64_t key path setter for OSLogFloatFormatting.precision : OSLogFloatFormatting(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    unsigned int v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@out Int);
  }
  else
  {
    unsigned int v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(void *)(a2 + 8);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
  uint64_t result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(v7);
  *(void *)(a2 + 8) = v6;
  *(void *)(a2 + 16) = v5;
  return result;
}

uint64_t OSLogFloatFormatting.precision.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v1);
  return v1;
}

uint64_t OSLogFloatFormatting.precision.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(*(void *)(v2 + 8));
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*OSLogFloatFormatting.precision.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

BOOL static OSLogFloatFormatting.Notation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OSLogFloatFormatting.Notation.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int OSLogFloatFormatting.Notation.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OSLogFloatFormatting.Notation(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance OSLogFloatFormatting.Notation()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance OSLogFloatFormatting.Notation()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OSLogFloatFormatting.Notation()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void OSLogFloatFormatting.notation.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 24);
}

unsigned char *OSLogFloatFormatting.notation.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 24) = *result;
  return result;
}

uint64_t (*OSLogFloatFormatting.notation.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogFloatFormatting.init(explicitPositiveSign:uppercase:precision:notation:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned char *a5@<X4>, uint64_t a6@<X8>)
{
  *(unsigned char *)a6 = result;
  *(unsigned char *)(a6 + 1) = a2;
  *(void *)(a6 + 8) = a3;
  *(void *)(a6 + 16) = a4;
  *(unsigned char *)(a6 + 24) = *a5;
  return result;
}

uint64_t static OSLogFloatFormatting.fixed.getter()
{
  return static OSLogFloatFormatting.fixed.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(void, void))static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:));
}

uint64_t static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  return static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)(a1 & 1, a2 & 1, 1, a3);
}

uint64_t outlined init with copy of OSLogFloatFormatting(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined destroy of OSLogFloatFormatting(uint64_t a1)
{
  if (*(void *)(a1 + 8)) {
    swift_release();
  }
  return a1;
}

uint64_t static OSLogFloatFormatting.fixed(precision:explicitPositiveSign:uppercase:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return static OSLogFloatFormatting.fixed(precision:explicitPositiveSign:uppercase:)(a1, a2, a3 & 1, a4 & 1, 1, a5);
}

uint64_t static OSLogFloatFormatting.hex.getter()
{
  return static OSLogFloatFormatting.fixed.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(void, void))static OSLogFloatFormatting.hex(explicitPositiveSign:uppercase:));
}

uint64_t static OSLogFloatFormatting.fixed.getter(uint64_t (*a1)(void), uint64_t (*a2)(void), uint64_t (*a3)(void, void))
{
  char v5 = a1();
  char v6 = a2();
  return a3(v5 & 1, v6 & 1);
}

uint64_t static OSLogFloatFormatting.hex(explicitPositiveSign:uppercase:)@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  return static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)(a1 & 1, a2 & 1, 0, a3);
}

uint64_t static OSLogFloatFormatting.exponential.getter()
{
  return static OSLogFloatFormatting.fixed.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(void, void))static OSLogFloatFormatting.exponential(explicitPositiveSign:uppercase:));
}

uint64_t static OSLogFloatFormatting.exponential(explicitPositiveSign:uppercase:)@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  return static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)(a1 & 1, a2 & 1, 2, a3);
}

uint64_t static OSLogFloatFormatting.exponential(precision:explicitPositiveSign:uppercase:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return static OSLogFloatFormatting.fixed(precision:explicitPositiveSign:uppercase:)(a1, a2, a3 & 1, a4 & 1, 2, a5);
}

uint64_t static OSLogFloatFormatting.hybrid.getter()
{
  return static OSLogFloatFormatting.fixed.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(void, void))static OSLogFloatFormatting.hybrid(explicitPositiveSign:uppercase:));
}

uint64_t static OSLogFloatFormatting.hybrid(explicitPositiveSign:uppercase:)@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  return static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)(a1 & 1, a2 & 1, 3, a3);
}

uint64_t static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X8>)
{
  char v10 = a3;
  v6[0] = a1 & 1;
  v6[1] = a2 & 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  char v9 = v10;
  outlined init with copy of OSLogFloatFormatting((uint64_t)v6, a4);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  return outlined destroy of OSLogFloatFormatting((uint64_t)v6);
}

uint64_t static OSLogFloatFormatting.hybrid(precision:explicitPositiveSign:uppercase:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return static OSLogFloatFormatting.fixed(precision:explicitPositiveSign:uppercase:)(a1, a2, a3 & 1, a4 & 1, 3, a5);
}

uint64_t static OSLogFloatFormatting.fixed(precision:explicitPositiveSign:uppercase:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X8>)
{
  swift_retain();
  char v17 = a5;
  v13[0] = a3 & 1;
  v13[1] = a4 & 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a1);
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  char v16 = a5;
  outlined init with copy of OSLogFloatFormatting((uint64_t)v13, a6);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a1);
  return outlined destroy of OSLogFloatFormatting((uint64_t)v13);
}

uint64_t static OSLogFloatFormatting._formatStringLengthModifier<A>(_:)()
{
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  }
  else {
    return 0;
  }
}

unint64_t lazy protocol witness table accessor for type OSLogFloatFormatting.Notation and conformance OSLogFloatFormatting.Notation()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogFloatFormatting.Notation and conformance OSLogFloatFormatting.Notation;
  if (!lazy protocol witness table cache variable for type OSLogFloatFormatting.Notation and conformance OSLogFloatFormatting.Notation)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogFloatFormatting.Notation and conformance OSLogFloatFormatting.Notation);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for OSLogFloatFormatting(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for OSLogFloatFormatting(uint64_t result)
{
  if (*(void *)(result + 8)) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for OSLogFloatFormatting(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 16);
    *(void *)(a1 + 8) = v4;
    *(void *)(a1 + 16) = v5;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  }
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t assignWithCopy for OSLogFloatFormatting(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = (_OWORD *)(a1 + 8);
  char v6 = (_OWORD *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (!*(void *)(a1 + 8))
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a2 + 16);
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v8;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *uint64_t v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
LABEL_8:
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for OSLogFloatFormatting(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = (_OWORD *)(a1 + 8);
  char v6 = (_OWORD *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (!*(void *)(a1 + 8))
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a2 + 16);
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v8;
      goto LABEL_8;
    }
LABEL_7:
    *uint64_t v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v7;
  swift_release();
LABEL_8:
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for OSLogFloatFormatting(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogFloatFormatting(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for OSLogFloatFormatting()
{
  return &type metadata for OSLogFloatFormatting;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OSLogFloatFormatting.Notation(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for OSLogFloatFormatting.Notation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1931D4FCCLL);
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

unsigned char *destructiveInjectEnumTag for OSLogFloatFormatting.Notation(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for OSLogFloatFormatting.Notation()
{
  return &type metadata for OSLogFloatFormatting.Notation;
}

__n128 __swift_memcpy40_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for os_workgroup_join_token_opaque_s(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for os_workgroup_join_token_opaque_s(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

void type metadata accessor for os_workgroup_join_token_opaque_s(uint64_t a1)
{
}

uint64_t sub_1931D5088()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@out Int)()
{
  return thunk for @escaping @callee_guaranteed () -> (@out Int)(*(void (**)(uint64_t *__return_ptr))(v0 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t OSLogFloatFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(uint64_t a1, uint64_t a2, os::OSLogPrivacy a3, uint64_t a4, void *a5)
{
  uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1)._countAndFlagsBits;
  os::OSLogPrivacy v10 = a3;
  v11._uint64_t countAndFlagsBits = a4;
  v11._object = a5;
  if ((unint64_t)concatPrivacyAndAttributes(privacy:attributes:)(v10, v11).value._object)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("{", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    static String.+= infix(_:_:)();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (*(unsigned char *)v5)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("+", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("-", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = *(void *)a2;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(*(void *)a2);
  if (v12)
  {
    swift_release();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("*", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  uint64_t v13 = *(void *)(v5 + 8);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v13);
  if (v13)
  {
    swift_release();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(".*", 2uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  static OSLogFloatFormatting._formatStringLengthModifier<A>(_:)();
  if (!v14)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Float type has unknown length", 0x1DuLL, 1);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    JUMPOUT(0x1931D5614);
  }
  static String.+= infix(_:_:)();
  switch(*(unsigned char *)(v5 + 24))
  {
    case 0:
      if (*(unsigned char *)(v5 + 1)) {
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("A", 1uLL, 1);
      }
      else {
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("a", 1uLL, 1);
      }
      goto LABEL_25;
    case 1:
      if (*(unsigned char *)(v5 + 1)) {
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("F", 1uLL, 1);
      }
      else {
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("f", 1uLL, 1);
      }
      goto LABEL_25;
    case 2:
      if (*(unsigned char *)(v5 + 1)) {
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("E", 1uLL, 1);
      }
      else {
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("e", 1uLL, 1);
      }
      goto LABEL_25;
    case 3:
      if (*(unsigned char *)(v5 + 1)) {
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("G", 1uLL, 1);
      }
      else {
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("g", 1uLL, 1);
      }
LABEL_25:
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    default:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Unknown float notation", 0x16uLL, 1);
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      break;
  }
  swift_bridgeObjectRelease();
  return countAndFlagsBits;
}

uint64_t OSLogInterpolation.appendInterpolation(_:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:), v6, a3, v7._countAndFlagsBits, v7._object);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1931D56E8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  unsigned __int8 v12 = *(unsigned char *)(v6 + 25);
  uint64_t result = maxOSLogArgumentCount.getter();
  if (v12 < result)
  {
    memcpy(__dst, (const void *)v6, sizeof(__dst));
    outlined retain of OSLogInterpolation((uint64_t)__dst);
    os::OSLogPrivacy v14 = (os::OSLogPrivacy)a3;
    v15._uint64_t countAndFlagsBits = a4;
    v15._object = a5;
    OSLogInterpolation.getNSObjectFormatSpecifier(_:_:)(v14, v15);
    outlined release of OSLogInterpolation((uint64_t)__dst);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a3 + 1) != 1)
    {
      os::OSLogPrivacy v16 = (os::OSLogPrivacy)a3;
      OSLogInterpolation.appendMaskArgument(_:)(v16);
    }
    os::OSLogPrivacy v17 = (os::OSLogPrivacy)a3;
    OSLogInterpolation.addNSObjectHeaders(_:)(v17);
    uint64_t result = OSLogArguments.append(_:)(a1, a2);
    unsigned int v18 = *(unsigned __int8 *)(v6 + 25) + 1;
    if ((v18 >> 8))
    {
      __break(1u);
    }
    else
    {
      *(unsigned char *)(v6 + 25) = v18;
      uint64_t v19 = *(void *)(v6 + 48);
      BOOL v20 = __OFADD__(v19, 1);
      uint64_t v21 = v19 + 1;
      char v22 = v20;
      if ((v22 & 1) == 0)
      {
        *(void *)(v6 + 48) = v21;
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

Swift::String __swiftcall OSLogInterpolation.getNSObjectFormatSpecifier(_:_:)(os::OSLogPrivacy a1, Swift::String a2)
{
  object = a2._object;
  uint64_t countAndFlagsBits = a2._countAndFlagsBits;
  Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1);
  os::OSLogPrivacy v6 = a1;
  v7._uint64_t countAndFlagsBits = countAndFlagsBits;
  v7._object = object;
  if ((unint64_t)concatPrivacyAndAttributes(privacy:attributes:)(v6, v7).value._object)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("{", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    static String.+= infix(_:_:)();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("@", 1uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  uint64_t v8 = v5._countAndFlagsBits;
  char v9 = v5._object;
  result._object = v9;
  result._uint64_t countAndFlagsBits = v8;
  return result;
}

Swift::Void __swiftcall OSLogInterpolation.addNSObjectHeaders(_:)(os::OSLogPrivacy a1)
{
  int v2 = v1;
  memcpy(__dst, v1, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  char v13 = 4;
  os::OSLogPrivacy v4 = a1;
  Swift::UInt8 v5 = OSLogInterpolation.getArgumentHeader(privacy:type:)(v4, (os::OSLogInterpolation::ArgumentType)&v13);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v5);
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  OSLogArguments.append(_:)(v12);
  uint64_t v6 = v1[4];
  BOOL v7 = __OFADD__(v6, 10);
  uint64_t v8 = v6 + 10;
  char v9 = v7;
  if (v9)
  {
    __break(1u);
  }
  else
  {
    v1[4] = v8;
    memcpy(v14, v1, sizeof(v14));
    outlined retain of OSLogInterpolation((uint64_t)v14);
    os::OSLogPrivacy v10 = a1;
    Swift::UInt8 v11 = OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(v10, 0);
    outlined release of OSLogInterpolation((uint64_t)v14);
    *((unsigned char *)v2 + 24) = v11;
  }
}

uint64_t outlined retain of OSLogInterpolation(uint64_t a1)
{
  return a1;
}

uint64_t OSLogArguments.append(_:)(uint64_t a1, uint64_t a2)
{
  swift_retain();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  return Array.append(_:)();
}

{
  uint64_t v4;

  swift_retain();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  return Array.append(_:)();
}

{
  uint64_t v4;

  swift_retain();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  return Array.append(_:)();
}

{
  uint64_t v4;

  swift_retain();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  return Array.append(_:)();
}

uint64_t outlined release of OSLogInterpolation(uint64_t a1)
{
  return a1;
}

unint64_t lazy protocol witness table accessor for type UInt8 and conformance UInt8()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt8 and conformance UInt8;
  if (!lazy protocol witness table cache variable for type UInt8 and conformance UInt8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt8 and conformance UInt8);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UInt8 and conformance UInt8;
  if (!lazy protocol witness table cache variable for type UInt8 and conformance UInt8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt8 and conformance UInt8);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
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
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

void partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3)
{
  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
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

BOOL static OSLogPointerFormat.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OSLogPointerFormat.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int OSLogPointerFormat.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:privacy:)(uint64_t a1, uint64_t a2, os::OSLogPointerFormat a3, uint64_t a4)
{
  swift_retain();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  Swift::String v10 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:), v8, (uint64_t)partial apply for implicit closure #2 in OSLogInterpolation.appendInterpolation(_:format:privacy:), v9, a3, a4, v10._countAndFlagsBits, v10._object);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:)(uint64_t (*a1)(void))
{
  uint64_t result = a1();
  if (!result)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t sub_1931D6018()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t partial apply for implicit closure #2 in OSLogInterpolation.appendInterpolation(_:format:privacy:)()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 16))();
  if (v1) {
    return v2 - v1;
  }
  else {
    return 0;
  }
}

uint64_t OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, os::OSLogPointerFormat a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v9 = v8;
  unsigned __int8 v18 = v9[25];
  uint64_t result = maxOSLogArgumentCount.getter();
  if (v18 < result)
  {
    memcpy(__dst, v9, sizeof(__dst));
    outlined retain of OSLogInterpolation((uint64_t)__dst);
    os::OSLogPrivacy v20 = (os::OSLogPrivacy)a6;
    v21._uint64_t countAndFlagsBits = a7;
    v21._object = a8;
    OSLogInterpolation.getPointerFormatSpecifier(_:_:_:)(a5, v20, v21);
    outlined release of OSLogInterpolation((uint64_t)__dst);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a6 + 1) != 1)
    {
      os::OSLogPrivacy v22 = (os::OSLogPrivacy)a6;
      OSLogInterpolation.appendMaskArgument(_:)(v22);
    }
    OSLogInterpolation.appendPrecisionArgument(_:)(a3, a4);
    os::OSLogPrivacy v23 = (os::OSLogPrivacy)a6;
    OSLogInterpolation.addPointerHeaders(_:)(v23);
    uint64_t result = OSLogArguments.append(_:)(a1, a2);
    int v25 = v9[25];
    unsigned int v24 = v9 + 25;
    char v26 = v25 + 1;
    if (((v25 + 1) >> 8)) {
      __break(1u);
    }
    else {
      *unsigned int v24 = v26;
    }
  }
  return result;
}

uint64_t OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, os::OSLogPointerFormat a5, uint64_t a6)
{
  swift_retain();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:), v12, (uint64_t)partial apply for implicit closure #2 in OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:), v13, a5, a6, v14._countAndFlagsBits, v14._object);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t partial apply for implicit closure #2 in OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

Swift::String __swiftcall OSLogInterpolation.getPointerFormatSpecifier(_:_:_:)(os::OSLogPointerFormat a1, os::OSLogPrivacy a2, Swift::String a3)
{
  uint64_t v3 = (unsigned char *)a1;
  BOOL v12 = *(unsigned char *)a1 != 5;
  Swift::String_optional v5 = concatPrivacyAndAttributes(privacy:attributes:)(a2, a3);
  BOOL v6 = v5.value._object != 0;
  BOOL v7 = v12 || v5.value._object != 0;
  if (!v12) {
    BOOL v6 = 0;
  }
  Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1);
  if (v7)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("{", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  switch(*v3)
  {
    case 0:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("network:in6_addr", 0x10uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 1:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("timeval", 7uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 2:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("timespec", 8uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 3:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("uuid_t", 6uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 4:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("network:sockaddr", 0x10uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  if (v6)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(",", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  if (v5.value._object)
  {
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  if (v7)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(".*P", 3uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t countAndFlagsBits = v8._countAndFlagsBits;
  object = v8._object;
  result._object = object;
  result._uint64_t countAndFlagsBits = countAndFlagsBits;
  return result;
}

Swift::Void __swiftcall OSLogInterpolation.addPointerHeaders(_:)(os::OSLogPrivacy a1)
{
  uint64_t v2 = v1;
  memcpy(__dst, v1, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  char v13 = 3;
  os::OSLogPrivacy v4 = a1;
  Swift::UInt8 v5 = OSLogInterpolation.getArgumentHeader(privacy:type:)(v4, (os::OSLogInterpolation::ArgumentType)&v13);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v5);
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  OSLogArguments.append(_:)(v12);
  uint64_t v6 = v1[4];
  BOOL v7 = __OFADD__(v6, 10);
  uint64_t v8 = v6 + 10;
  char v9 = v7;
  if (v9)
  {
    __break(1u);
  }
  else
  {
    v1[4] = v8;
    memcpy(v14, v1, sizeof(v14));
    outlined retain of OSLogInterpolation((uint64_t)v14);
    os::OSLogPrivacy v10 = a1;
    Swift::UInt8 v11 = OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(v10, 0);
    outlined release of OSLogInterpolation((uint64_t)v14);
    *((unsigned char *)v2 + 24) = v11;
  }
}

uint64_t partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1)
{
  (*(void (**)(void))(v1 + 16))();
  uint64_t v3 = *a1 + 8;
  uint64_t result = UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v3;
  return result;
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  (*(void (**)(void))(v1 + 16))();
  uint64_t v3 = *a1 + 8;
  uint64_t result = UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v3;
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogPointerFormat and conformance OSLogPointerFormat()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogPointerFormat and conformance OSLogPointerFormat;
  if (!lazy protocol witness table cache variable for type OSLogPointerFormat and conformance OSLogPointerFormat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogPointerFormat and conformance OSLogPointerFormat);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for OSLogPointerFormat(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OSLogPointerFormat(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1931D6AC0);
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

ValueMetadata *type metadata accessor for OSLogPointerFormat()
{
  return &type metadata for OSLogPointerFormat;
}

void closure #1 in os_signpost(_:dso:log:name:signpostID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unsigned __int8 a6, uint64_t a7)
{
  if (a1)
  {
    _swift_os_signpost(a3, a4, a5, a6, a1, a7);
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, unsigned __int8 a10, uint64_t a11)
{
  if (a1) {
    return closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(a1, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #1 in closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, unsigned __int8 a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    swift_bridgeObjectRetain();
    specialized withVaList<A>(_:_:)(a3, a4, a5, a6, a7, a8, a9, a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, char *a7)
{
  type metadata accessor for __VaListBuilder();
  int v8 = (void *)swift_allocObject();
  v8[2] = 8;
  v8[3] = 0;
  char v9 = v8 + 3;
  v8[4] = 0;
  v8[5] = 0;
  uint64_t v10 = *(void *)(a1 + 16);
  if (!v10)
  {
LABEL_26:
    uint64_t v27 = (_DWORD *)__VaListBuilder.va_list()();
    _swift_os_signpost_with_format(a2, a3, a4, 1, a5, a6, a7, v27);

    return swift_release();
  }
  uint64_t v11 = 0;
  uint64_t v12 = a1 + 32;
  while (1)
  {
    outlined init with copy of CVarArg(v12 + 40 * v11, (uint64_t)v35);
    __swift_project_boxed_opaque_existential_1(v35, v35[3]);
    uint64_t v13 = dispatch thunk of CVarArg._cVarArgEncoding.getter();
    uint64_t v14 = *v9;
    uint64_t v15 = *(void *)(v13 + 16);
    BOOL v16 = __OFADD__(*v9, v15);
    uint64_t v17 = *v9 + v15;
    if (v16) {
      break;
    }
    uint64_t v18 = v13;
    uint64_t v19 = v8[4];
    if (v19 >= v17) {
      goto LABEL_19;
    }
    if (v19 + 0x4000000000000000 < 0) {
      goto LABEL_29;
    }
    os::OSLogPrivacy v20 = (char *)v8[5];
    if (2 * v19 > v17) {
      uint64_t v17 = 2 * v19;
    }
    v8[4] = v17;
    if ((unint64_t)(v17 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_30;
    }
    Swift::String v21 = (char *)swift_slowAlloc();
    v8[5] = v21;
    if (v20)
    {
      if (v14 < 0) {
        goto LABEL_32;
      }
      if (v21 != v20 || v21 >= &v20[8 * v14]) {
        memmove(v21, v20, 8 * v14);
      }
      __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_19:
      Swift::String v21 = (char *)v8[5];
    }
    if (!v21) {
      goto LABEL_31;
    }
    uint64_t v23 = *(void *)(v18 + 16);
    if (v23)
    {
      unsigned int v24 = (uint64_t *)(v18 + 32);
      uint64_t v25 = *v9;
      while (1)
      {
        uint64_t v26 = *v24++;
        *(void *)&v21[8 * v25] = v26;
        uint64_t v25 = *v9 + 1;
        if (__OFADD__(*v9, 1)) {
          break;
        }
        uint64_t *v9 = v25;
        if (!--v23) {
          goto LABEL_3;
        }
      }
      __break(1u);
      break;
    }
LABEL_3:
    ++v11;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    if (v11 == v10) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_32:

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static AnimationFormatString.constructOSLogInterpolation(_:)@<X0>(uint64_t a1@<X8>)
{
  OSLogInterpolation.init(literalCapacity:interpolationCount:)((uint64_t)__src);
  memcpy(v10, __src, sizeof(v10));
  static String.+= infix(_:_:)();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" isAnimation=YES", 0x10uLL, 1);
  static String.+= infix(_:_:)();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v3 = v10[1];
  uint64_t v4 = v10[2];
  char v5 = v10[3];
  char v6 = BYTE1(v10[3]);
  uint64_t v7 = v10[4];
  uint64_t v8 = v10[5];
  uint64_t v9 = v10[6];
  *(void *)a1 = v10[0];
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 25) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  return result;
}

uint64_t AnimationFormatString.OSLogMessage.formatStringPointer.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*AnimationFormatString.OSLogMessage.formatStringPointer.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

void AnimationFormatString.OSLogMessage.init(stringLiteral:)()
{
  static AnimationFormatString.constructOSLogInterpolation(_:)((uint64_t)v0);
  swift_bridgeObjectRelease();
  OSLogMessage.init(stringInterpolation:)(v0, (uint64_t)v1);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v1);
  __break(1u);
}

void protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance AnimationFormatString.OSLogMessage()
{
  static AnimationFormatString.constructOSLogInterpolation(_:)((uint64_t)v0);
  swift_bridgeObjectRelease();
  OSLogMessage.init(stringInterpolation:)(v0, (uint64_t)v1);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v1);
  __break(1u);
}

uint64_t static OSSignpostAnimationBegin.== infix(_:_:)()
{
  return 1;
}

void OSSignpostAnimationBegin.hash(into:)()
{
}

Swift::Int OSSignpostAnimationBegin.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostAnimationBegin()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance OSSignpostAnimationBegin()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance OSSignpostAnimationBegin()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OSSignpostAnimationBegin()
{
  return Hasher._finalize()();
}

uint64_t animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)(uint64_t result, os_log_t log, unint64_t a3, uint64_t a4, char a5, uint64_t *a6, char *a7, uint64_t a8)
{
  uint64_t v14 = result;
  uint64_t v15 = *a6;
  if (one-time initialization token for invalid != -1) {
    uint64_t result = swift_once();
  }
  if (v15 != static OSSignpostID.invalid)
  {
    if (one-time initialization token for null != -1) {
      swift_once();
    }
    uint64_t v16 = static OSSignpostID.null;
    uint64_t result = os_signpost_enabled(log);
    if (result)
    {
      if (v15 != v16)
      {
        uint64_t v17 = _swift_os_log_return_address();
        MEMORY[0x1F4188790](v17);
        if ((a5 & 1) == 0)
        {
          if (a3)
          {
            if ((a4 & 0x8000000000000000) == 0)
            {
              swift_bridgeObjectRetain();
              specialized withVaList<A>(_:_:)(a8, v14, v17, log, a3, v15, a7);
              return swift_bridgeObjectRelease();
            }
            _fatalErrorMessage(_:_:file:line:flags:)();
            __break(1u);
          }
          goto LABEL_20;
        }
        if (HIDWORD(a3) || WORD1(a3) > 0x10u || (a3 & 0xFFFFF800) == 0xD800)
        {
LABEL_20:
          uint64_t result = _assertionFailure(_:_:file:line:flags:)();
          __break(1u);
          return result;
        }
        return _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a3, (uint64_t (*)(uint64_t *))partial apply for closure #1 in animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:));
      }
    }
  }
  return result;
}

uint64_t closure #1 in animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, char *a8)
{
  if (a1)
  {
    swift_bridgeObjectRetain();
    specialized withVaList<A>(_:_:)(a3, a4, a5, a6, a1, a7, a8);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)(int a1, uint64_t a2, os_log_t log, unint64_t a4, uint64_t a5, char a6, uint64_t *a7, char *a8, uint64_t a9)
{
  return animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)(a2, log, a4, a5, a6, a7, a8, a9);
}

uint64_t os_signpost(_:dso:log:name:signpostID:)(int a1, uint64_t a2, os_log_t log, unint64_t a4, uint64_t a5, char a6, uint64_t *a7)
{
  return animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)(a2, log, a4, a5, a6, a7, "isAnimation=YES", MEMORY[0x1E4FBC860]);
}

void *static OSSignpostID.invalid.getter@<X0>(void *a1@<X8>)
{
  return static OSSignpostID.exclusive.getter(&one-time initialization token for invalid, &static OSSignpostID.invalid, a1);
}

BOOL static OSSignpostID.< infix(_:_:)(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL static OSSignpostID.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

void partial apply for closure #1 in os_signpost(_:dso:log:name:signpostID:)(uint64_t a1, uint64_t a2)
{
  closure #1 in os_signpost(_:dso:log:name:signpostID:)(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), *(unsigned char *)(v2 + 40), *(void *)(v2 + 48));
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance OSSignpostID(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance OSSignpostID(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance OSSignpostID(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance OSSignpostID(void *a1, void *a2)
{
  return *a2 < *a1;
}

uint64_t OS_os_log.Category.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for dynamicTracing()
{
  uint64_t result = String.init(cString:)();
  static OS_os_log.Category.dynamicTracing = result;
  *(void *)algn_1E930D3E8 = v1;
  return result;
}

uint64_t static OS_os_log.Category.dynamicTracing.getter@<X0>(void *a1@<X8>)
{
  return static OS_os_log.Category.pointsOfInterest.getter(&one-time initialization token for dynamicTracing, &static OS_os_log.Category.dynamicTracing, (uint64_t *)algn_1E930D3E8, a1);
}

uint64_t one-time initialization function for dynamicStackTracing()
{
  uint64_t result = String.init(cString:)();
  static OS_os_log.Category.dynamicStackTracing = result;
  *(void *)algn_1E930D3F8 = v1;
  return result;
}

uint64_t static OS_os_log.Category.dynamicStackTracing.getter@<X0>(void *a1@<X8>)
{
  return static OS_os_log.Category.pointsOfInterest.getter(&one-time initialization token for dynamicStackTracing, &static OS_os_log.Category.dynamicStackTracing, (uint64_t *)algn_1E930D3F8, a1);
}

uint64_t _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(unsigned int a1, uint64_t (*a2)(uint64_t *))
{
  if (a1 >= 0x80)
  {
    int v4 = (a1 & 0x3F) << 8;
    if (a1 >= 0x800)
    {
      int v5 = (v4 | (a1 >> 6) & 0x3F) << 8;
      int v6 = (((v5 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      unsigned int v2 = (v5 | (a1 >> 12)) + 8487393;
      if (HIWORD(a1)) {
        unsigned int v2 = v6;
      }
    }
    else
    {
      unsigned int v2 = (v4 | (a1 >> 6)) + 33217;
    }
  }
  else
  {
    unsigned int v2 = a1 + 1;
  }
  uint64_t v7 = (v2 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v2) >> 3))));
  return a2(&v7);
}

uint64_t partial apply for closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(a1, a2, *(char **)(v2 + 16), *(void *)(v2 + 24), *(unsigned char *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void **)(v2 + 64), *(unsigned char *)(v2 + 72), *(void *)(v2 + 80));
}

uint64_t partial apply for closure #1 in animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40), *(void *)(v2 + 48), *(char **)(v2 + 56));
}

unint64_t lazy protocol witness table accessor for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage()
{
  unint64_t result = lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage;
  if (!lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage;
  if (!lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage);
  }
  return result;
}

uint64_t associated type witness table accessor for ExpressibleByStringLiteral.StringLiteralType : _ExpressibleByBuiltinStringLiteral in AnimationFormatString.OSLogMessage()
{
  return MEMORY[0x1E4FBB220];
}

uint64_t associated type witness table accessor for ExpressibleByExtendedGraphemeClusterLiteral.ExtendedGraphemeClusterLiteralType : _ExpressibleByBuiltinExtendedGraphemeClusterLiteral in AnimationFormatString.OSLogMessage()
{
  return MEMORY[0x1E4FBB230];
}

uint64_t associated type witness table accessor for ExpressibleByUnicodeScalarLiteral.UnicodeScalarLiteralType : _ExpressibleByBuiltinUnicodeScalarLiteral in AnimationFormatString.OSLogMessage()
{
  return MEMORY[0x1E4FBB228];
}

unint64_t lazy protocol witness table accessor for type OSSignpostAnimationBegin and conformance OSSignpostAnimationBegin()
{
  unint64_t result = lazy protocol witness table cache variable for type OSSignpostAnimationBegin and conformance OSSignpostAnimationBegin;
  if (!lazy protocol witness table cache variable for type OSSignpostAnimationBegin and conformance OSSignpostAnimationBegin)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostAnimationBegin and conformance OSSignpostAnimationBegin);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSSignpostID and conformance OSSignpostID()
{
  unint64_t result = lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID;
  if (!lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnimationFormatString()
{
  return &type metadata for AnimationFormatString;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AnimationFormatString.OSLogMessage(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for AnimationFormatString.OSLogMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)unint64_t result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnimationFormatString.OSLogMessage()
{
  return &type metadata for AnimationFormatString.OSLogMessage;
}

uint64_t getEnumTagSinglePayload for OSSignpostAnimationBegin(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for OSSignpostAnimationBegin(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1931D7C68);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for OSSignpostAnimationBegin()
{
  return &type metadata for OSSignpostAnimationBegin;
}

void *initializeBufferWithCopyOfBuffer for OS_os_log.Category(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for OS_os_log.Category()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for OS_os_log.Category(void *a1, void *a2)
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

void *assignWithTake for OS_os_log.Category(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for OS_os_log.Category(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for OS_os_log.Category(uint64_t result, int a2, int a3)
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

uint64_t partial apply for closure #1 in closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(char *a1, uint64_t a2)
{
  return closure #1 in closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40), *(unsigned char *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64));
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

Swift::Void __swiftcall OSLogInterpolation.appendMaskArgument(_:)(os::OSLogPrivacy a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)&a1.privacy;
  memcpy(__dst, v1, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  static OSLogPrivacy.auto.getter(v17);
  char v16 = 5;
  unsigned int v4 = v17;
  Swift::UInt8 v5 = OSLogInterpolation.getArgumentHeader(privacy:type:)((os::OSLogPrivacy)v4, (os::OSLogInterpolation::ArgumentType)&v16);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v5);
  OSLogArguments.append(_:)(8u);
  uint64_t v6 = v1[4];
  BOOL v7 = __OFADD__(v6, 10);
  uint64_t v8 = v6 + 10;
  char v9 = v7;
  if (v9)
  {
    __break(1u);
    goto LABEL_19;
  }
  v1[4] = v8;
  switch(*(unsigned char *)(v3 + 1))
  {
    case 0:
    case 1:
      uint64_t v10 = 1752392040;
      break;
    case 2:
      uint64_t v10 = 0x656D616E6C69616DLL;
      break;
    case 3:
      uint64_t v10 = 0x726464616C69616DLL;
      break;
    case 4:
      uint64_t v10 = 0x6A6275736C69616DLL;
      break;
    case 5:
      uint64_t v10 = 0x6D6D75736C69616DLL;
      break;
    case 6:
      uint64_t v10 = 0x6F6363616C69616DLL;
      break;
    case 7:
      uint64_t v10 = 0x786F626C69616DLL;
      break;
    case 8:
      uint64_t v10 = 0x7075626D6C69616DLL;
      break;
    case 9:
      uint64_t v10 = 0x617474616C69616DLL;
      break;
    default:
      uint64_t v10 = 1752392040;
      break;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  unint64_t v12 = lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  OSLogArguments.append<A>(_:)((uint64_t)partial apply for closure #1 in OSLogInterpolation.appendMaskArgument(_:), v11, MEMORY[0x1E4FBC538], v12);
  swift_release();
  int v14 = *((unsigned __int8 *)v2 + 25);
  uint64_t v13 = (char *)v2 + 25;
  char v15 = v14 + 1;
  if (((v14 + 1) >> 8))
  {
LABEL_19:
    __break(1u);
    JUMPOUT(0x1931D8050);
  }
  *uint64_t v13 = v15;
}

uint64_t _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](a1);
  char v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(*(void *)(v16 - 8) + 64);
  if (v17 < 0)
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = v13(v12, v12 + v17, (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v8) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v15, a5);
    }
  }
  return result;
}

void OSLogInterpolation.appendPrecisionArgument(_:)(uint64_t a1, uint64_t a2)
{
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1EE3BA220, (uint64_t (*)(void))lazy protocol witness table accessor for type Int and conformance Int, MEMORY[0x1E4FBB550], (uint64_t)_sSiIegd_SiIegr_TRTA_0);
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1EE3BA248, (uint64_t (*)(void))lazy protocol witness table accessor for type Int8 and conformance Int8, MEMORY[0x1E4FBC098], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int8));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1EE3BA270, (uint64_t (*)(void))lazy protocol witness table accessor for type Int16 and conformance Int16, MEMORY[0x1E4FBC0F8], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int16));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1EE3BA298, (uint64_t (*)(void))lazy protocol witness table accessor for type Int32 and conformance Int32, MEMORY[0x1E4FBC150], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int32));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1EE3BA2C0, (uint64_t (*)(void))lazy protocol witness table accessor for type Int64 and conformance Int64, MEMORY[0x1E4FBC1C8], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int64));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1EE3BA2E8, (uint64_t (*)(void))lazy protocol witness table accessor for type UInt and conformance UInt, MEMORY[0x1E4FBB808], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1EE3BA310, (uint64_t (*)(void))lazy protocol witness table accessor for type UInt8 and conformance UInt8, MEMORY[0x1E4FBC358], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt8));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1EE3BA338, (uint64_t (*)(void))lazy protocol witness table accessor for type UInt16 and conformance UInt16, MEMORY[0x1E4FBC450], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt16));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1EE3BA360, (uint64_t (*)(void))lazy protocol witness table accessor for type UInt32 and conformance UInt32, MEMORY[0x1E4FBC4C0], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt32));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1EE3BA388, (uint64_t (*)(void))lazy protocol witness table accessor for type UInt64 and conformance UInt64, MEMORY[0x1E4FBC538], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt64));
}

uint64_t default argument 4 of OSLogInterpolation.appendInteger<A>(_:format:align:privacy:attributes:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t OSLogInterpolation.appendInteger<A>(_:format:align:privacy:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13 = v12;
  char v15 = a4 & 1;
  char v16 = BYTE1(a4) & 1;
  char v17 = BYTE2(a4) & 1;
  unsigned __int8 v20 = *(unsigned char *)(v13 + 25);
  uint64_t result = maxOSLogArgumentCount.getter();
  if (v20 < result)
  {
    LOBYTE(v36) = v15 & 1;
    BYTE1(v36) = v16 & 1;
    BYTE2(v36) = v17 & 1;
    uint64_t v22 = a5;
    os::OSLogPrivacy v23 = (os::OSLogPrivacy)a8;
    OSLogIntegerFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(a11, (uint64_t)a7, v23, a9, a10, a3, v36, a5);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    uint64_t v24 = *a7;
    uint64_t v25 = a7[1];
    outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(*a7);
    if (v24)
    {
      OSLogInterpolation.appendAlignmentArgument(_:)(v24, v25);
      swift_release();
    }
    if (*(unsigned char *)(a8 + 1) != 1)
    {
      os::OSLogPrivacy v26 = (os::OSLogPrivacy)a8;
      OSLogInterpolation.appendMaskArgument(_:)(v26);
    }
    outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v22);
    if (v22)
    {
      OSLogInterpolation.appendPrecisionArgument(_:)(v22, a6);
      swift_release();
    }
    Swift::Int v27 = dispatch thunk of static FixedWidthInteger.bitWidth.getter() >> 3;
    os::OSLogPrivacy v28 = (os::OSLogPrivacy)a8;
    OSLogInterpolation.addIntHeaders(_:_:)(v28, v27);
    uint64_t result = OSLogArguments.append<A>(_:)(a1, a2, a11, a12);
    int v30 = *(unsigned __int8 *)(v13 + 25);
    int v29 = (unsigned char *)(v13 + 25);
    char v31 = v30 + 1;
    if (((v30 + 1) >> 8)) {
      __break(1u);
    }
    else {
      *int v29 = v31;
    }
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(void), uint64_t a11, uint64_t a12)
{
  char v14 = a4 & 1;
  char v15 = BYTE1(a4) & 1;
  char v16 = BYTE2(a4) & 1;
  swift_retain();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  *(void *)(v19 + 24) = a2;
  uint64_t v20 = a10();
  uint64_t v21 = default argument 4 of OSLogInterpolation.appendInteger<A>(_:format:align:privacy:attributes:)();
  LOBYTE(v27) = v14;
  BYTE1(v27) = v15;
  BYTE2(v27) = v16;
  OSLogInterpolation.appendInteger<A>(_:format:align:privacy:attributes:)(a12, v19, a3, v27, a5, a6, a7, a8, v21, v22, a11, v20);
  swift_bridgeObjectRelease();
  return swift_release();
}

void OSLogInterpolation.appendAlignmentArgument(_:)(uint64_t a1, uint64_t a2)
{
}

void OSLogInterpolation.appendPrecisionArgument(_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  memcpy(__dst, (const void *)v5, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  static OSLogPrivacy.auto.getter(v20);
  char v19 = a3;
  uint64_t v10 = v20;
  Swift::UInt8 v11 = OSLogInterpolation.getArgumentHeader(privacy:type:)((os::OSLogPrivacy)v10, (os::OSLogInterpolation::ArgumentType)&v19);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v11);
  OSLogArguments.append(_:)(4u);
  uint64_t v12 = *(void *)(v5 + 32);
  BOOL v13 = __OFADD__(v12, 6);
  uint64_t v14 = v12 + 6;
  char v15 = v13;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v5 + 32) = v14;
    swift_retain();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a1;
    *(void *)(v16 + 24) = a2;
    unint64_t v17 = lazy protocol witness table accessor for type Int32 and conformance Int32();
    OSLogArguments.append<A>(_:)(a5, v16, MEMORY[0x1E4FBC150], v17);
    swift_release();
    unsigned int v18 = *(unsigned __int8 *)(v5 + 25) + 1;
    if (((v18 >> 8) & 1) == 0)
    {
      *(unsigned char *)(v5 + 25) = v18;
      return;
    }
  }
  __break(1u);
}

Swift::Void __swiftcall OSLogInterpolation.addIntHeaders(_:_:)(os::OSLogPrivacy a1, Swift::Int a2)
{
  uint64_t v3 = v2;
  memcpy(__dst, v2, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  char v17 = 0;
  os::OSLogPrivacy v6 = a1;
  Swift::UInt8 v7 = OSLogInterpolation.getArgumentHeader(privacy:type:)(v6, (os::OSLogInterpolation::ArgumentType)&v17);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v7);
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  OSLogArguments.append(_:)(v16);
  Swift::Int v8 = a2 + 2;
  if (__OFADD__(a2, 2))
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = v2[4];
    BOOL v11 = __OFADD__(v10, v8);
    Swift::Int v12 = v10 + v8;
    char v13 = v11;
    if ((v13 & 1) == 0)
    {
      v2[4] = v12;
      memcpy(v18, v2, sizeof(v18));
      outlined retain of OSLogInterpolation((uint64_t)v18);
      os::OSLogPrivacy v14 = a1;
      Swift::UInt8 v15 = OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(v14, 1);
      outlined release of OSLogInterpolation((uint64_t)v18);
      *((unsigned char *)v3 + 24) = v15;
      return;
    }
  }
  __break(1u);
}

uint64_t OSLogArguments.append<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_retain();
  Swift::Int v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = a1;
  v8[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  return Array.append(_:)();
}

void OSLogInterpolation.appendPrecisionAlignCount(_:_:)(uint64_t a1, uint64_t a2, Swift::UInt8 a3)
{
  OSLogArguments.append(_:)(a3);
  OSLogArguments.append(_:)(4u);
  uint64_t v6 = *(void *)(v3 + 32);
  BOOL v7 = __OFADD__(v6, 6);
  uint64_t v8 = v6 + 6;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 32) = v8;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = a1;
    *(void *)(v9 + 24) = a2;
    unint64_t v10 = lazy protocol witness table accessor for type Int32 and conformance Int32();
    swift_retain();
    OSLogArguments.append<A>(_:)((uint64_t)partial apply for closure #1 in OSLogInterpolation.appendPrecisionAlignCount(_:_:), v9, MEMORY[0x1E4FBC150], v10);
    swift_release();
    unsigned int v11 = *(unsigned __int8 *)(v3 + 25) + 1;
    if (((v11 >> 8) & 1) == 0)
    {
      *(unsigned char *)(v3 + 25) = v11;
      return;
    }
  }
  __break(1u);
}

uint64_t sub_1931D8D84()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void partial apply for closure #1 in OSLogInterpolation.appendMaskArgument(_:)(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  unint64_t result = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
  }
  return result;
}

uint64_t _sSiIegd_SiIegr_TRTA_0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int8)@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int8 and conformance Int8()
{
  unint64_t result = lazy protocol witness table cache variable for type Int8 and conformance Int8;
  if (!lazy protocol witness table cache variable for type Int8 and conformance Int8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int8 and conformance Int8);
  }
  return result;
}

uint64_t sub_1931D8F54()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int16)@<X0>(_WORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int16 and conformance Int16()
{
  unint64_t result = lazy protocol witness table cache variable for type Int16 and conformance Int16;
  if (!lazy protocol witness table cache variable for type Int16 and conformance Int16)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int16 and conformance Int16);
  }
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int64)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int64 and conformance Int64()
{
  unint64_t result = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
  }
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
  }
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt8)@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt16)@<X0>(_WORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt16 and conformance UInt16()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt16 and conformance UInt16;
  if (!lazy protocol witness table cache variable for type UInt16 and conformance UInt16)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt16 and conformance UInt16);
  }
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt32)@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
  }
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt64)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *(void *)(a6 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](a1);
  unsigned int v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12(v9);
  unint64_t v13 = dispatch thunk of static FixedWidthInteger.bitWidth.getter();
  if ((v13 & 0x8000000000000000) != 0)
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    unint64_t v14 = *a1 + (v13 >> 3);
    MEMORY[0x1F4188790](v13);
    uint64_t v19 = v15;
    unint64_t v20 = v14;
    _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF((uint64_t)v11, (uint64_t)partial apply for closure #1 in serialize<A>(_:at:), (uint64_t)v18, a6, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4FBC278], v16);
    *a1 = v14;
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, a6);
  }
  return result;
}

uint64_t sub_1931D9468()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t partial apply for closure #1 in OSLogArguments.append<A>(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v3[4], v3[5], v3[2]);
}

uint64_t partial apply for closure #1 in OSLogInterpolation.appendPrecisionAlignCount(_:_:)@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    *a1 = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t closure #1 in os_log(_:dso:log:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))
{
  if (a1)
  {
    swift_bridgeObjectRetain();
    a8(a3, a4, a5, a6, a7, a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t partial apply for closure #1 in os_log(_:dso:log:_:_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in os_log(_:dso:log:_:_:)(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))specialized withVaList<A>(_:_:));
}

void OS_LOG_TYPE_DEFAULT.getter()
{
}

void OS_LOG_TYPE_INFO.getter()
{
}

void OS_LOG_TYPE_DEBUG.getter()
{
}

void OS_LOG_TYPE_ERROR.getter()
{
}

void OS_LOG_TYPE_FAULT.getter()
{
}

uint64_t partial apply for closure #1 in os_log(_:dso:log:type:_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in os_log(_:dso:log:_:_:)(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))specialized withVaList<A>(_:_:));
}

uint64_t partial apply for closure #1 in os_log(_:dso:log:_:_:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))
{
  return closure #1 in os_log(_:dso:log:_:_:)(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void **)(v3 + 40), *(unsigned __int8 *)(v3 + 48), a3);
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  swift_retain();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  OSLogInterpolation.appendInterpolation(_:format:align:privacy:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:), v10, a3, a4, a5);
  return swift_release();
}

{
  uint64_t v10;
  Swift::String v11;

  swift_retain();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  unsigned int v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:format:align:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:), v10, a3, a4, a5, v11._countAndFlagsBits, v11._object);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1931D98D8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

double partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)()
{
  return (*(float (**)(void))(v0 + 16))();
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:align:privacy:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v8 = v7;
  unsigned __int8 v16 = *(unsigned char *)(v8 + 25);
  uint64_t result = maxOSLogArgumentCount.getter();
  if (v16 < result)
  {
    lazy protocol witness table accessor for type Double and conformance Double();
    os::OSLogPrivacy v18 = (os::OSLogPrivacy)a5;
    OSLogFloatFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(MEMORY[0x1E4FBB3D0], (uint64_t)a4, v18, a6, a7);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    uint64_t v19 = *a4;
    uint64_t v20 = a4[1];
    outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v19);
    if (v19)
    {
      OSLogInterpolation.appendAlignmentArgument(_:)(v19, v20);
      swift_release();
    }
    if (*(unsigned char *)(a5 + 1) != 1)
    {
      os::OSLogPrivacy v21 = (os::OSLogPrivacy)a5;
      OSLogInterpolation.appendMaskArgument(_:)(v21);
    }
    uint64_t v22 = *(void *)(a3 + 8);
    uint64_t v23 = *(void *)(a3 + 16);
    outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v22);
    if (v22)
    {
      OSLogInterpolation.appendPrecisionArgument(_:)(v22, v23);
      swift_release();
    }
    os::OSLogPrivacy v24 = (os::OSLogPrivacy)a5;
    OSLogInterpolation.addDoubleHeaders(_:)(v24);
    uint64_t result = OSLogArguments.append(_:)(a1, a2);
    int v26 = *(unsigned __int8 *)(v8 + 25);
    uint64_t v25 = (unsigned char *)(v8 + 25);
    char v27 = v26 + 1;
    if (((v26 + 1) >> 8)) {
      __break(1u);
    }
    else {
      unsigned char *v25 = v27;
    }
  }
  return result;
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

Swift::Void __swiftcall OSLogInterpolation.addDoubleHeaders(_:)(os::OSLogPrivacy a1)
{
  uint64_t v2 = v1;
  memcpy(__dst, v1, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  char v13 = 0;
  os::OSLogPrivacy v4 = a1;
  Swift::UInt8 v5 = OSLogInterpolation.getArgumentHeader(privacy:type:)(v4, (os::OSLogInterpolation::ArgumentType)&v13);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v5);
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  OSLogArguments.append(_:)(v12);
  uint64_t v6 = v1[4];
  BOOL v7 = __OFADD__(v6, 10);
  uint64_t v8 = v6 + 10;
  char v9 = v7;
  if (v9)
  {
    __break(1u);
  }
  else
  {
    v1[4] = v8;
    memcpy(v14, v1, sizeof(v14));
    outlined retain of OSLogInterpolation((uint64_t)v14);
    os::OSLogPrivacy v10 = a1;
    Swift::UInt8 v11 = OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(v10, 1);
    outlined release of OSLogInterpolation((uint64_t)v14);
    *((unsigned char *)v2 + 24) = v11;
  }
}

unint64_t lazy protocol witness table accessor for type Double and conformance Double()
{
  unint64_t result = lazy protocol witness table cache variable for type Double and conformance Double;
  if (!lazy protocol witness table cache variable for type Double and conformance Double)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Double and conformance Double);
  }
  return result;
}

uint64_t OSLogIntegerFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(uint64_t a1, uint64_t a2, os::OSLogPrivacy a3, uint64_t a4, void *a5, uint64_t a6, int a7, uint64_t a8)
{
  char v22 = a7 & 1;
  char v12 = BYTE1(a7) & 1;
  char v13 = BYTE2(a7) & 1;
  char v15 = dispatch thunk of static BinaryInteger.isSigned.getter();
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a8);
  BOOL v16 = (v15 & 1) != 0 && a6 != 10;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a8);
  if (v16)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Signed integers must be formatted using .decimal", 0x30uLL, 1);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  LOBYTE(v25) = v22 & 1;
  HIBYTE(v25) = v12 & 1;
  uint64_t v26 = OSLogIntegerFormatting._prefix.getter(a6, v25);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  os::OSLogPrivacy v17 = a3;
  v18._uint64_t countAndFlagsBits = a4;
  v18._object = a5;
  if ((unint64_t)concatPrivacyAndAttributes(privacy:attributes:)(v17, v18).value._object)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("{", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    static String.+= infix(_:_:)();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (v22)
  {
    if (dispatch thunk of static BinaryInteger.isSigned.getter())
    {
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("+", 1uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("+", 1uLL, 1)._countAndFlagsBits;
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      uint64_t v26 = countAndFlagsBits;
    }
  }
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("-", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  uint64_t v19 = *(void *)a2;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(*(void *)a2);
  if (v19)
  {
    swift_release();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("*", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a8);
  if (a8)
  {
    swift_release();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(".*", 2uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  static OSLogIntegerFormatting.formatSpecifierLengthModifier<A>(_:)();
  if (v20)
  {
    static String.+= infix(_:_:)();
    switch(a6)
    {
      case 10:
        if (dispatch thunk of static BinaryInteger.isSigned.getter()) {
          String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("d", 1uLL, 1);
        }
        else {
          String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("u", 1uLL, 1);
        }
        break;
      case 8:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("o", 1uLL, 1);
        static String.+= infix(_:_:)();
        swift_bridgeObjectRelease();
        goto LABEL_31;
      case 16:
        if (v13) {
          String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("X", 1uLL, 1);
        }
        else {
          String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("x", 1uLL, 1);
        }
        break;
      default:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("radix must be 10, 8 or 16", 0x19uLL, 1);
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        goto LABEL_31;
    }
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
LABEL_31:
    swift_bridgeObjectRelease();
    return v26;
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Integer type has unknown byte length", 0x24uLL, 1);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t OSLogIntegerFormatting.radix.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*OSLogIntegerFormatting.radix.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogIntegerFormatting.explicitPositiveSign.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t OSLogIntegerFormatting.explicitPositiveSign.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 8) = result;
  return result;
}

uint64_t (*OSLogIntegerFormatting.explicitPositiveSign.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogIntegerFormatting.includePrefix.getter(uint64_t a1, unsigned int a2)
{
  return (a2 >> 8) & 1;
}

uint64_t OSLogIntegerFormatting.includePrefix.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 9) = result;
  return result;
}

uint64_t (*OSLogIntegerFormatting.includePrefix.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogIntegerFormatting.uppercase.getter(uint64_t a1, unsigned int a2)
{
  return HIWORD(a2) & 1;
}

uint64_t OSLogIntegerFormatting.uppercase.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 10) = result;
  return result;
}

uint64_t (*OSLogIntegerFormatting.uppercase.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t key path getter for OSLogIntegerFormatting.minDigits : OSLogIntegerFormatting@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  if (v3)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v5;

  return outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
}

uint64_t key path setter for OSLogIntegerFormatting.minDigits : OSLogIntegerFormatting(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@out Int);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(void *)(a2 + 16);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
  uint64_t result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(v7);
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t OSLogIntegerFormatting.minDigits.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t OSLogIntegerFormatting.minDigits.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(*(void *)(v2 + 16));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*OSLogIntegerFormatting.minDigits.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t static OSLogIntegerFormatting.decimal(explicitPositiveSign:minDigits:)(char a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  uint64_t v7 = 10;
  char v8 = a1 & 1;
  char v9 = 0;
  char v10 = 0;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined destroy of OSLogIntegerFormatting((uint64_t)&v7);
  return 10;
}

uint64_t static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:minDigits:)(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  return static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:minDigits:)(a1 & 1, a2 & 1, a3 & 1, a4, a5, 16);
}

uint64_t static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:)(char a1, char a2, char a3)
{
  return static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:)(a1 & 1, a2 & 1, a3 & 1, 16);
}

uint64_t static OSLogIntegerFormatting.hex.getter()
{
  return static OSLogIntegerFormatting.hex.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(void, void, void))static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:));
}

uint64_t static OSLogIntegerFormatting.octal(explicitPositiveSign:includePrefix:uppercase:minDigits:)(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  return static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:minDigits:)(a1 & 1, a2 & 1, a3 & 1, a4, a5, 8);
}

uint64_t static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:minDigits:)(char a1, char a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_retain();
  uint64_t v13 = a6;
  char v14 = a1 & 1;
  char v15 = a2 & 1;
  char v16 = a3 & 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  uint64_t v17 = a4;
  uint64_t v18 = a5;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined destroy of OSLogIntegerFormatting((uint64_t)&v13);
  return a6;
}

uint64_t static OSLogIntegerFormatting.octal(explicitPositiveSign:includePrefix:uppercase:)(char a1, char a2, char a3)
{
  return static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:)(a1 & 1, a2 & 1, a3 & 1, 8);
}

uint64_t static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:)(char a1, char a2, char a3, uint64_t a4)
{
  uint64_t v6 = a4;
  char v7 = a1 & 1;
  char v8 = a2 & 1;
  char v9 = a3 & 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined destroy of OSLogIntegerFormatting((uint64_t)&v6);
  return a4;
}

uint64_t static OSLogIntegerFormatting.octal.getter()
{
  return static OSLogIntegerFormatting.hex.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(void, void, void))static OSLogIntegerFormatting.octal(explicitPositiveSign:includePrefix:uppercase:));
}

uint64_t static OSLogIntegerFormatting.hex.getter(uint64_t (*a1)(void), uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t (*a4)(void, void, void))
{
  char v7 = a1();
  LOBYTE(a2) = a2();
  char v8 = a3();
  return a4(v7 & 1, a2 & 1, v8 & 1);
}

uint64_t OSLogIntegerFormatting._prefix.getter(uint64_t a1, __int16 a2)
{
  if ((a2 & 0x100) == 0) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  }
  switch(a1)
  {
    case 2:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("0b", 2uLL, 1)._countAndFlagsBits;
    case 8:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("0o", 2uLL, 1)._countAndFlagsBits;
    case 16:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("0x", 2uLL, 1)._countAndFlagsBits;
    default:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  }
}

uint64_t static OSLogIntegerFormatting.formatSpecifierLengthModifier<A>(_:)()
{
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hh", 2uLL, 1)._countAndFlagsBits;
  }
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("h", 1uLL, 1)._countAndFlagsBits;
  }
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  }
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("l", 1uLL, 1)._countAndFlagsBits;
  }
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype()) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ll", 2uLL, 1)._countAndFlagsBits;
  }
  return 0;
}

uint64_t destroy for OSLogIntegerFormatting(uint64_t result)
{
  if (*(void *)(result + 16)) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for OSLogIntegerFormatting(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_WORD *)(a1 + 9) = *(_WORD *)(a2 + 9);
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v3;
    *(void *)(a1 + 24) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  return a1;
}

uint64_t assignWithCopy for OSLogIntegerFormatting(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(unsigned char *)(a1 + 10) = *(unsigned char *)(a2 + 10);
  uint64_t v3 = (_OWORD *)(a1 + 16);
  uint64_t v5 = (_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 16);
  if (!*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v7;
      swift_retain();
      return a1;
    }
LABEL_7:
    *uint64_t v3 = *v5;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v6;
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

uint64_t assignWithTake for OSLogIntegerFormatting(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(unsigned char *)(a1 + 10) = *(unsigned char *)(a2 + 10);
  long long v3 = (_OWORD *)(a1 + 16);
  uint64_t v5 = (_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 16);
  if (!*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v7;
      return a1;
    }
LABEL_7:
    *long long v3 = *v5;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OSLogIntegerFormatting(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogIntegerFormatting(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogIntegerFormatting()
{
  return &type metadata for OSLogIntegerFormatting;
}

uint64_t sub_1931DB154()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t static OSLogPrivacy.auto.getter@<X0>(unsigned char *a1@<X8>)
{
  return static OSLogPrivacy.auto.getter(3, a1);
}

BOOL OSLogPrivacy.hasMask.getter()
{
  return *(unsigned char *)(v0 + 1) != 1;
}

uint64_t OSLogPrivacy.maskValue.getter()
{
  if ((*(unsigned char *)(v0 + 1) - 2) > 7u) {
    return 1752392040;
  }
  else {
    return *(void *)&aMailnamemailad[8 * (char)(*(unsigned char *)(v0 + 1) - 2)];
  }
}

BOOL static OSLogPrivacy.PrivacyOption.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OSLogPrivacy.PrivacyOption.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

void OSLogPrivacy.privacy.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *OSLogPrivacy.privacy.setter(unsigned char *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t (*OSLogPrivacy.privacy.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

void OSLogPrivacy.mask.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

unsigned char *OSLogPrivacy.mask.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 1) = *result;
  return result;
}

uint64_t (*OSLogPrivacy.mask.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

os::OSLogPrivacy __swiftcall OSLogPrivacy.init(privacy:mask:)(os::OSLogPrivacy::PrivacyOption privacy, os::OSLogPrivacy::Mask mask)
{
  *uint64_t v2 = *(unsigned char *)privacy;
  v2[1] = *(unsigned char *)mask;
  result.privacy = privacy;
  return result;
}

uint64_t static OSLogPrivacy.public.getter@<X0>(unsigned char *a1@<X8>)
{
  return static OSLogPrivacy.auto.getter(1, a1);
}

uint64_t static OSLogPrivacy.private.getter@<X0>(unsigned char *a1@<X8>)
{
  return static OSLogPrivacy.auto.getter(0, a1);
}

char *static OSLogPrivacy.private(mask:)@<X0>(char *a1@<X0>, unsigned char *a2@<X8>)
{
  return static OSLogPrivacy.private(mask:)(a1, 0, a2);
}

uint64_t static OSLogPrivacy.sensitive.getter@<X0>(unsigned char *a1@<X8>)
{
  return static OSLogPrivacy.auto.getter(2, a1);
}

uint64_t static OSLogPrivacy.auto.getter@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = result;
  a2[1] = 1;
  return result;
}

unsigned char *static OSLogPrivacy.mail(_:)@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  switch(*result)
  {
    case 0:
      char v2 = 2;
      break;
    case 1:
      char v2 = 3;
      break;
    case 2:
      char v2 = 4;
      break;
    case 3:
      char v2 = 5;
      break;
    case 4:
      char v2 = 6;
      break;
    case 5:
      char v2 = 7;
      break;
    case 6:
      char v2 = 8;
      break;
    case 7:
      char v2 = 9;
      break;
    default:
      char v2 = 1;
      break;
  }
  *a2 = 2;
  a2[1] = v2;
  return result;
}

char *static OSLogPrivacy.sensitive(mask:)@<X0>(char *a1@<X0>, unsigned char *a2@<X8>)
{
  return static OSLogPrivacy.private(mask:)(a1, 2, a2);
}

char *static OSLogPrivacy.auto(mask:)@<X0>(char *a1@<X0>, unsigned char *a2@<X8>)
{
  return static OSLogPrivacy.private(mask:)(a1, 3, a2);
}

char *static OSLogPrivacy.private(mask:)@<X0>(char *result@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  char v3 = *result;
  *a3 = a2;
  a3[1] = v3;
  return result;
}

uint64_t OSLogPrivacy.argumentFlag.getter()
{
  switch(*v0)
  {
    case 0:
      return 1;
    case 1:
      return 2;
    case 2:
      return 5;
  }
  return 0;
}

BOOL OSLogPrivacy.isAtleastPrivate.getter()
{
  return *v0 != 1 && *v0 != 3;
}

BOOL OSLogPrivacy.needsPrivacySpecifier.getter()
{
  return !v0[1] || *v0 != 3;
}

uint64_t OSLogPrivacy.privacySpecifier.getter()
{
  BOOL v1 = v0[1] != 1;
  BOOL v5 = *v0 == 3;
  if (*v0 == 3 && v0[1] == 1) {
    return 0;
  }
  if (*v0)
  {
    if (*v0 == 1)
    {
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("public", 6uLL, 1)._countAndFlagsBits;
    }
    else
    {
      if (*v0 == 2) {
        uint64_t v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sensitive", 9uLL, 1)._countAndFlagsBits;
      }
      else {
        uint64_t v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
      }
      uint64_t countAndFlagsBits = v3;
    }
  }
  else
  {
    uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("private", 7uLL, 1)._countAndFlagsBits;
  }
  if (v1)
  {
    if (!v5)
    {
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(",", 1uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
    }
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mask.", 5uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    switch(v0[1])
    {
      case 2:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailname", 8uLL, 1);
        break;
      case 3:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailaddr", 8uLL, 1);
        break;
      case 4:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailsubj", 8uLL, 1);
        break;
      case 5:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailsumm", 8uLL, 1);
        break;
      case 6:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailacco", 8uLL, 1);
        break;
      case 7:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailbox", 7uLL, 1);
        break;
      case 8:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailmbup", 8uLL, 1);
        break;
      case 9:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailatta", 8uLL, 1);
        break;
      default:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hash", 4uLL, 1);
        break;
    }
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  return countAndFlagsBits;
}

uint64_t OSLogPrivacy.maskSpecifier.getter()
{
  uint64_t result = 0x6A6275736C69616DLL;
  switch(*(unsigned char *)(v0 + 1))
  {
    case 2:
      return 0x656D616E6C69616DLL;
    case 3:
      return 0x726464616C69616DLL;
    case 4:
      return result;
    case 5:
      char v2 = "mailsumm";
      goto LABEL_10;
    case 6:
      char v2 = "mailacco";
      goto LABEL_10;
    case 7:
      char v2 = "mailbox";
      Builtin::Word v3 = 7;
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v2, v3, 1)._countAndFlagsBits;
    case 8:
      char v2 = "mailmbup";
      goto LABEL_10;
    case 9:
      char v2 = "mailatta";
LABEL_10:
      Builtin::Word v3 = 8;
      break;
    default:
      char v2 = "hash";
      Builtin::Word v3 = 4;
      break;
  }
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v2, v3, 1)._countAndFlagsBits;
}

unint64_t lazy protocol witness table accessor for type OSLogPrivacy.PrivacyOption and conformance OSLogPrivacy.PrivacyOption()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogPrivacy.PrivacyOption and conformance OSLogPrivacy.PrivacyOption;
  if (!lazy protocol witness table cache variable for type OSLogPrivacy.PrivacyOption and conformance OSLogPrivacy.PrivacyOption)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogPrivacy.PrivacyOption and conformance OSLogPrivacy.PrivacyOption);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogPrivacy.Mask and conformance OSLogPrivacy.Mask()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogPrivacy.Mask and conformance OSLogPrivacy.Mask;
  if (!lazy protocol witness table cache variable for type OSLogPrivacy.Mask and conformance OSLogPrivacy.Mask)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogPrivacy.Mask and conformance OSLogPrivacy.Mask);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogPrivacy._MailMask and conformance OSLogPrivacy._MailMask()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogPrivacy._MailMask and conformance OSLogPrivacy._MailMask;
  if (!lazy protocol witness table cache variable for type OSLogPrivacy._MailMask and conformance OSLogPrivacy._MailMask)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogPrivacy._MailMask and conformance OSLogPrivacy._MailMask);
  }
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OSLogPrivacy(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 65283 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65283 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65283;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65283;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65283;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogPrivacy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65283 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65283 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 253) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 253;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1931DBD08);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogPrivacy()
{
  return &type metadata for OSLogPrivacy;
}

unsigned char *storeEnumTagSinglePayload for OSLogPrivacy.PrivacyOption(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1931DBE0CLL);
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

ValueMetadata *type metadata accessor for OSLogPrivacy.PrivacyOption()
{
  return &type metadata for OSLogPrivacy.PrivacyOption;
}

uint64_t getEnumTagSinglePayload for OSLogPrivacy.Mask(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OSLogPrivacy.Mask(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x1931DBFA0);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogPrivacy.Mask()
{
  return &type metadata for OSLogPrivacy.Mask;
}

uint64_t getEnumTagSinglePayload for OSLogPrivacy._MailMask(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OSLogPrivacy._MailMask(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x1931DC134);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogPrivacy._MailMask()
{
  return &type metadata for OSLogPrivacy._MailMask;
}

Swift::UInt32 __swiftcall OS_os_workgroup.copyPort()()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  mach_port_t mach_port_out = 0;
  if (!os_workgroup_copy_port(v0, &mach_port_out)) {
    return mach_port_out;
  }
  _StringGuts.grow(_:)(48);
  swift_bridgeObjectRelease();
  v2._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  Swift::UInt32 result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

OS_os_workgroup_optional __swiftcall OS_os_workgroup.init(port:name:)(Swift::UInt32 port, Swift::String_optional name)
{
  if (name.value._object)
  {
    uint64_t v3 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    uint64_t v4 = os_workgroup_create_with_port((const char *)(v3 + 32), port);
    swift_release();
    if (v4) {
  }
    }
  else
  {
    uint64_t v4 = os_workgroup_create_with_port(0, port);
  }
  unsigned int v6 = (objc_class *)v4;
  result.value.super.super.isa = v6;
  result.is_nil = v5;
  return result;
}

OS_os_workgroup_optional __swiftcall OS_os_workgroup.copy(name:)(Swift::String_optional name)
{
  if (name.value._object)
  {
    MEMORY[0x1F4188790](name.value._countAndFlagsBits);
    v6[2] = v1;
    os_workgroup_t v4 = (os_workgroup_t)specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))partial apply for closure #1 in OS_os_workgroup.copy(name:), (uint64_t)v6, v2, v3);
  }
  else
  {
    os_workgroup_t v4 = os_workgroup_create_with_workgroup(0, v1);
  }
  result.value.super.super.isa = (Class)v4;
  result.is_nil = v5;
  return result;
}

os_workgroup_t partial apply for closure #1 in OS_os_workgroup.copy(name:)@<X0>(const char *a1@<X0>, os_workgroup_t *a2@<X8>)
{
  os_workgroup_t result = os_workgroup_create_with_workgroup(a1, *(os_workgroup_t *)(v2 + 16));
  *a2 = result;
  return result;
}

void *specialized String.withCString<A>(_:)(void *(*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_os_workgroup?);
    os_workgroup_t result = (void *)_StringGuts._slowWithCString<A>(_:)();
    if (!v4) {
      return (void *)v12[3];
    }
  }
  else
  {
    MEMORY[0x1F4188790](a1);
    if ((a4 & 0x2000000000000000) != 0)
    {
      v12[0] = a3;
      v12[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      os_workgroup_t result = a1(&v11, v12);
      if (!v4) {
        return (void *)v11;
      }
    }
    else
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v9 = a3 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v8 = _StringObject.sharedUTF8.getter();
      }
      return _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5So15OS_os_workgroupCSg_Tg507_sSRys4f5VGxs5e32_pIgyrzo_ACxsAD_pIegyrzr_lTRSo15h1_i1_J7CSg_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v8, v9, (void *(*)(uint64_t *__return_ptr))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
    }
  }
  return result;
}

uint64_t OS_os_workgroup.join()@<X0>(os_workgroup_join_token_opaque_s *a1@<X8>)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(&token_out, 0, sizeof(token_out));
  uint64_t result = os_workgroup_join(v1, &token_out);
  if (result)
  {
    _StringGuts.grow(_:)(38);
    swift_bridgeObjectRelease();
    v4._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v4);
    swift_bridgeObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *a1 = token_out;
  }
  return result;
}

void OS_os_workgroup.leave(token:)(os_workgroup_join_token_opaque_s *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  os_workgroup_join_token_opaque_s v2 = *a1;
  os_workgroup_leave(v1, &v2);
}

Swift::Void __swiftcall OS_os_workgroup.cancel()()
{
  os_workgroup_cancel(v0);
}

BOOL OS_os_workgroup.isCancelled.getter()
{
  return os_workgroup_testcancel(v0);
}

uint64_t OS_os_workgroup.maxParallelThreads.getter()
{
  return os_workgroup_max_parallel_threads(v0, 0);
}

uint64_t OS_os_workgroup.setWorkingArena(arena:max_workers:destruct:)(void *arena, uint32_t max_workers, os_workgroup_working_arena_destructor_t destructor)
{
  uint64_t result = os_workgroup_set_working_arena(v3, arena, max_workers, destructor);
  if (result)
  {
    _StringGuts.grow(_:)(45);
    swift_bridgeObjectRelease();
    v5._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void *OS_os_workgroup.workingArena.getter()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  os_workgroup_index index_out = 0;
  return os_workgroup_get_working_arena(v0, &index_out);
}

Swift::Void __swiftcall OS_os_workgroup.start(at:deadline:)(Swift::UInt64 at, Swift::UInt64 deadline)
{
  if (os_workgroup_interval_start(v2, at, deadline, 0))
  {
    _StringGuts.grow(_:)(54);
    v3._object = (void *)0x80000001931E75A0;
    v3._uint64_t countAndFlagsBits = 0xD000000000000034;
    String.append(_:)(v3);
    v4._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v4);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

Swift::Void __swiftcall OS_os_workgroup.updateDeadline(deadline:)(Swift::UInt64 deadline)
{
  if (os_workgroup_interval_update(v1, deadline, 0))
  {
    _StringGuts.grow(_:)(66);
    v2._object = (void *)0x80000001931E75E0;
    v2._uint64_t countAndFlagsBits = 0xD000000000000040;
    String.append(_:)(v2);
    v3._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v3);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

Swift::Void __swiftcall OS_os_workgroup.finish()()
{
  if (os_workgroup_interval_finish(v0, 0))
  {
    _StringGuts.grow(_:)(55);
    v1._object = (void *)0x80000001931E7630;
    v1._uint64_t countAndFlagsBits = 0xD000000000000035;
    String.append(_:)(v1);
    v2._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v2);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

OS_os_workgroup_parallel_optional __swiftcall OS_os_workgroup_parallel.init(name:)(Swift::String_optional name)
{
  if (name.value._object)
  {
    uint64_t v1 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    Swift::String v2 = os_workgroup_parallel_create((const char *)(v1 + 32), 0);
    swift_release();
    if (v2) {
  }
    }
  else
  {
    Swift::String v2 = os_workgroup_parallel_create(0, 0);
  }
  Swift::String v4 = (objc_class *)v2;
  result.value.super.super.super.isa = v4;
  result.is_nil = v3;
  return result;
}

ValueMetadata *type metadata accessor for OS_os_workgroup.JoinToken()
{
  return &type metadata for OS_os_workgroup.JoinToken;
}

void *_sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5So15OS_os_workgroupCSg_Tg507_sSRys4f5VGxs5e32_pIgyrzo_ACxsAD_pIegyrzr_lTRSo15h1_i1_J7CSg_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr))
{
  if (a1 && a2 < 0)
  {
    OS_os_workgroup_parallel_optional result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    OS_os_workgroup_parallel_optional result = a3(&v5);
    if (!v3) {
      return (void *)v5;
    }
  }
  return result;
}

void *partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)@<X0>(void *a1@<X8>)
{
  OS_os_workgroup_parallel_optional result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t OSLogInterpolation.appendInteger<A>(_:format:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, long long *a7, __int16 *a8, uint64_t a9, uint64_t a10)
{
  char v10 = *((unsigned char *)a7 + 16);
  __int16 v11 = *a8;
  long long v14 = *a7;
  char v15 = v10;
  __int16 v13 = v11;
  return OSLogInterpolation.appendInteger<A>(_:format:align:privacy:attributes:)(a1, a2, a3, a4 & 0x10101, a5, a6, (uint64_t *)&v14, (uint64_t)&v13, 0, (void *)0xE000000000000000, a9, a10);
}

Swift::String __swiftcall OSLogInterpolation.getNSObjectFormatSpecifier(_:)(os::OSLogPrivacy a1)
{
  __int16 v7 = **(_WORD **)&a1.privacy;
  uint64_t v1 = &v7;
  v2._uint64_t countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  Swift::String v5 = OSLogInterpolation.getNSObjectFormatSpecifier(_:_:)((os::OSLogPrivacy)v1, v2);
  object = v5._object;
  uint64_t countAndFlagsBits = v5._countAndFlagsBits;
  result._object = object;
  result._uint64_t countAndFlagsBits = countAndFlagsBits;
  return result;
}

Swift::String __swiftcall OSLogInterpolation.getPointerFormatSpecifier(_:_:)(os::OSLogPointerFormat a1, os::OSLogPrivacy a2)
{
  uint64_t v2 = OSLogInterpolation.getPointerFormatSpecifier(_:_:)((char *)a1, *(__int16 **)&a2.privacy, (uint64_t (*)(char *, __int16 *, void, unint64_t))OSLogInterpolation.getPointerFormatSpecifier(_:_:_:));
  result._object = v3;
  result._uint64_t countAndFlagsBits = v2;
  return result;
}

uint64_t OSLogInterpolation.getStringFormatSpecifier(_:_:)(long long *a1, __int16 *a2)
{
  char v2 = *((unsigned char *)a1 + 16);
  __int16 v3 = *a2;
  long long v7 = *a1;
  char v8 = v2;
  __int16 v6 = v3;
  Swift::String v4 = &v6;
  return OSLogInterpolation.getStringFormatSpecifier(_:_:_:)((uint64_t)&v7, (os::OSLogPrivacy)v4, 0, (void *)0xE000000000000000);
}

Swift::String __swiftcall OSLogInterpolation.getExtendedFormatSpecifier(_:_:)(os::OSLogInt32ExtendedFormat a1, os::OSLogPrivacy a2)
{
  uint64_t v2 = OSLogInterpolation.getPointerFormatSpecifier(_:_:)((char *)a1, *(__int16 **)&a2.privacy, (uint64_t (*)(char *, __int16 *, void, unint64_t))OSLogInterpolation.getExtendedFormatSpecifier(_:_:_:));
  result._object = v3;
  result._uint64_t countAndFlagsBits = v2;
  return result;
}

uint64_t OSLogInterpolation.getPointerFormatSpecifier(_:_:)(char *a1, __int16 *a2, uint64_t (*a3)(char *, __int16 *, void, unint64_t))
{
  __int16 v3 = *a2;
  char v6 = *a1;
  __int16 v5 = v3;
  return a3(&v6, &v5, 0, 0xE000000000000000);
}

uint64_t OSLogIntegerFormatting.formatSpecifier<A>(for:align:privacy:)(uint64_t a1, long long *a2, __int16 *a3, uint64_t a4, int a5, uint64_t a6)
{
  char v6 = *((unsigned char *)a2 + 16);
  __int16 v7 = *a3;
  long long v11 = *a2;
  char v12 = v6;
  __int16 v10 = v7;
  char v8 = &v10;
  return OSLogIntegerFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(a1, (uint64_t)&v11, (os::OSLogPrivacy)v8, 0, (void *)0xE000000000000000, a4, a5 & 0x10101, a6);
}

uint64_t OSLogFloatFormatting.formatSpecifier<A>(for:align:privacy:)(uint64_t a1, long long *a2, __int16 *a3)
{
  char v4 = *((unsigned char *)a2 + 16);
  __int16 v5 = *a3;
  char v6 = v3[1];
  char v7 = v3[24];
  char v13 = *v3;
  char v14 = v6;
  long long v15 = *(_OWORD *)(v3 + 8);
  char v16 = v7;
  long long v11 = *a2;
  char v12 = v4;
  __int16 v10 = v5;
  char v8 = &v10;
  return OSLogFloatFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(a1, (uint64_t)&v11, (os::OSLogPrivacy)v8, 0, (void *)0xE000000000000000);
}

uint64_t serialize(_:at:using:)(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t *a4)
{
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, a4);
  uint64_t v5 = *a3 + 8;
  uint64_t result = UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a3 = v5;
  return result;
}

id static OSSignposter.disabled.getter@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for disabled != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)static OS_os_log.disabled;
  *a1 = static OS_os_log.disabled;

  return v2;
}

id OSSignposter.init()@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)static OS_os_log.default;
  *a1 = static OS_os_log.default;

  return v2;
}

void OSSignposter.emitEvent(_:id:_:)(unint64_t a1, uint64_t a2, char a3, uint64_t a4, const void *a5)
{
  id v9 = OSSignposter.logHandle.getter();
  static os_signpost_type_t.event.getter();
  memcpy(__dst, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  uint64_t v10 = __dst[0];
  long long v11 = (void *)__dst[1];
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)__dst);
  v12._uint64_t countAndFlagsBits = v10;
  v12._object = v11;
  id(_:)(v12);
  swift_bridgeObjectRelease();
  memcpy(v26, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v26);
  char v27 = v26[24];
  outlined release of OSLogInterpolation((uint64_t)v26);
  memcpy(v24, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v24);
  char v25 = v24[25];
  outlined release of OSLogInterpolation((uint64_t)v24);
  OSLogMessage.bufferSize.getter();
  memcpy(v23, a5, sizeof(v23));
  outlined retain of OSLogInterpolation((uint64_t)v23);
  outlined release of OSLogInterpolation((uint64_t)v23);
  memcpy(v22, a5, sizeof(v22));
  outlined retain of OSLogInterpolation((uint64_t)v22);
  outlined release of OSLogInterpolation((uint64_t)v22);
  memcpy(v19, a5, sizeof(v19));
  outlined retain of OSLogInterpolation((uint64_t)v19);
  uint64_t v20 = v19[2];
  outlined retain of OSLogArguments((uint64_t)&v20);
  outlined release of OSLogInterpolation((uint64_t)v19);
  outlined retain of OSLogArguments((uint64_t)&v20);
  uint64_t v21 = v20;
  outlined release of OSLogArguments((uint64_t)&v20);
  uint64_t v13 = OS_os_log.signpostsEnabled.getter();
  if (v13)
  {
    char v18 = v27;
    char v17 = v25;
    if ((a3 & 1) == 0)
    {
      if (a1) {
        unint64_t v15 = a1;
      }
      else {
        unint64_t v15 = 0;
      }
      uint64_t v14 = v15;
      if (v15)
      {
        if (a2 < 0)
        {
          uint64_t v14 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v14, &v16);
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      uint64_t v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      uint64_t v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF) {
      goto LABEL_20;
    }
    do
    {
      uint64_t v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1F4188790](v13);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
  outlined release of OSLogArguments((uint64_t)&v21);
  swift_bridgeObjectRelease();
LABEL_14:
}

void OSSignposter.emitEvent(_:id:)(unint64_t a1, uint64_t a2, char a3, os_signpost_id_t *a4)
{
  char v8 = OSSignposter.logHandle.getter();
  os_signpost_type_t v9 = static os_signpost_type_t.event.getter();
  uint64_t v10 = OS_os_log.signpostsEnabled.getter();
  if (v10)
  {
    unsigned __int8 v36 = 0;
    unsigned __int8 v35 = 0;
    if ((a3 & 1) == 0)
    {
      if (a1) {
        unint64_t v27 = a1;
      }
      else {
        unint64_t v27 = 0;
      }
      uint64_t v11 = v27;
      if (v27)
      {
        if (a2 < 0)
        {
          uint64_t v11 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v11, (uint64_t *)&v34);
LABEL_13:
        Swift::String v12 = v34;
        v33[1] = (os_signpost_id_t)"";
        unsigned int v21 = v36;
        unsigned int v22 = v35;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v13 = _allocateUninitializedArray<A>(_:)();
        uint64_t v14 = v8;
        v33[0] = *a4;
        char v25 = &v20;
        MEMORY[0x1F4188790](v14);
        uint64_t v26 = "";
        v31[1] = (unsigned char *)2;
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        os::OSLogPrivacy v24 = v12;
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        HIDWORD(v20) = v32;
        unint64_t v15 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v16 = createStorage<A>(capacity:type:)(0);
        uint64_t v17 = createStorage<A>(capacity:type:)(0);
        uint64_t v23 = v15;
        v31[0] = v15;
        uint64_t v30 = v16;
        uint64_t v29 = v17;
        serialize(_:at:)(v21, v31);
        uint64_t v18 = serialize(_:at:)(v22, v31);
        uint64_t v28 = v13;
        MEMORY[0x1F4188790](v18);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        uint64_t v19 = v23;
        closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v23, HIDWORD(v20), v8, v9, v33, v24, v26);
        destroyStorage<A>(_:count:)(v16);
        destroyStorage<A>(_:count:)(v17);
        MEMORY[0x1996FA1C0](v19, MEMORY[0x1E4FBC358]);

        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      uint64_t v10 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      uint64_t v10 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF) {
      goto LABEL_20;
    }
    do
    {
      uint64_t v10 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1F4188790](v10);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
LABEL_14:
}

uint64_t OSSignposter.beginInterval(_:id:_:)(unint64_t a1, uint64_t a2, char a3, uint64_t *a4, const void *a5)
{
  id v9 = OSSignposter.logHandle.getter();
  static os_signpost_type_t.begin.getter();
  memcpy(__dst, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  uint64_t v10 = __dst[0];
  uint64_t v11 = (void *)__dst[1];
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)__dst);
  v12._uint64_t countAndFlagsBits = v10;
  v12._object = v11;
  id(_:)(v12);
  swift_bridgeObjectRelease();
  memcpy(v30, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v30);
  char v31 = v30[24];
  outlined release of OSLogInterpolation((uint64_t)v30);
  memcpy(v28, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v28);
  char v29 = v28[25];
  outlined release of OSLogInterpolation((uint64_t)v28);
  OSLogMessage.bufferSize.getter();
  memcpy(v27, a5, sizeof(v27));
  outlined retain of OSLogInterpolation((uint64_t)v27);
  outlined release of OSLogInterpolation((uint64_t)v27);
  memcpy(v26, a5, sizeof(v26));
  outlined retain of OSLogInterpolation((uint64_t)v26);
  outlined release of OSLogInterpolation((uint64_t)v26);
  memcpy(v23, a5, sizeof(v23));
  outlined retain of OSLogInterpolation((uint64_t)v23);
  uint64_t v24 = v23[2];
  outlined retain of OSLogArguments((uint64_t)&v24);
  outlined release of OSLogInterpolation((uint64_t)v23);
  outlined retain of OSLogArguments((uint64_t)&v24);
  uint64_t v25 = v24;
  outlined release of OSLogArguments((uint64_t)&v24);
  uint64_t v13 = OS_os_log.signpostsEnabled.getter();
  if (v13)
  {
    char v21 = v31;
    char v20 = v29;
    if ((a3 & 1) == 0)
    {
      if (a1) {
        unint64_t v18 = a1;
      }
      else {
        unint64_t v18 = 0;
      }
      uint64_t v14 = v18;
      if (v18)
      {
        if (a2 < 0)
        {
          uint64_t v14 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v14, &v19);
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      uint64_t v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      uint64_t v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF) {
      goto LABEL_20;
    }
    do
    {
      uint64_t v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1F4188790](v13);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
  outlined release of OSLogArguments((uint64_t)&v25);
  swift_bridgeObjectRelease();
LABEL_14:

  type metadata accessor for OSSignpostIntervalState();
  uint64_t v22 = *a4;
  char v15 = protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostAnimationBegin();
  return OSSignpostIntervalState.__allocating_init(id:isOpen:)(&v22, v15 & 1);
}

uint64_t OSSignpostIntervalState.__allocating_init(id:isOpen:)(void *a1, char a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = *a1;
  *(unsigned char *)(result + 24) = a2;
  return result;
}

uint64_t OSSignposter.beginInterval(_:id:)(unint64_t a1, uint64_t a2, char a3, os_signpost_id_t *a4)
{
  return OSSignposter.beginInterval(_:id:)(a1, a2, a3, a4, "", (uint64_t)closure #1 in emitSignpost<A>(preamble:argumentCount:bufferSize:objectCount:stringCount:argumentClosures:signpostTask:)partial apply);
}

uint64_t OSSignposter.beginAnimationInterval(_:id:)(unint64_t a1, uint64_t a2, char a3, os_signpost_id_t *a4)
{
  return OSSignposter.beginInterval(_:id:)(a1, a2, a3, a4, "isAnimation=YES", (uint64_t)closure #1 in emitSignpost<A>(preamble:argumentCount:bufferSize:objectCount:stringCount:argumentClosures:signpostTask:)partial apply);
}

uint64_t OSSignposter.beginInterval(_:id:)(unint64_t a1, uint64_t a2, char a3, os_signpost_id_t *a4, char *a5, uint64_t a6)
{
  char v31 = a4;
  uint64_t v11 = OSSignposter.logHandle.getter();
  int v12 = static os_signpost_type_t.begin.getter();
  uint64_t v13 = v11;
  uint64_t v14 = OS_os_log.signpostsEnabled.getter();
  if (v14)
  {
    uint64_t v40 = a6;
    unsigned __int8 v51 = 0;
    unsigned __int8 v50 = 0;
    if ((a3 & 1) == 0)
    {
      if (a1) {
        unint64_t v41 = a1;
      }
      else {
        unint64_t v41 = 0;
      }
      uint64_t v17 = v41;
      if (v41)
      {
        if (a2 < 0)
        {
          uint64_t v17 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v17, (uint64_t *)&v49);
        int v18 = v12;
        char v15 = v31;
LABEL_13:
        uint64_t v19 = v49;
        v48 = a5;
        uint64_t v16 = v13;
        char v20 = v48;
        unsigned int v33 = v51;
        unsigned int v34 = v50;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v21 = _allocateUninitializedArray<A>(_:)();
        uint64_t v22 = v13;
        os_signpost_id_t v47 = *v15;
        v38 = &v30;
        MEMORY[0x1F4188790](v22);
        v39 = v20;
        v45[1] = (unsigned char *)2;
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        int v35 = v18;
        char v37 = v19;
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v32 = v46;
        uint64_t v23 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v24 = createStorage<A>(capacity:type:)(0);
        uint64_t v25 = createStorage<A>(capacity:type:)(0);
        unsigned __int8 v36 = v23;
        v45[0] = v23;
        uint64_t v44 = v24;
        uint64_t v43 = v25;
        serialize(_:at:)(v33, v45);
        uint64_t v26 = serialize(_:at:)(v34, v45);
        uint64_t v42 = v21;
        MEMORY[0x1F4188790](v26);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        unint64_t v27 = v36;
        closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v36, v32, v16, (os_signpost_type_t)v35, &v47, v37, v39);
        destroyStorage<A>(_:count:)(v24);
        destroyStorage<A>(_:count:)(v25);
        MEMORY[0x1996FA1C0](v27, MEMORY[0x1E4FBC358]);

        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      uint64_t v14 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      uint64_t v14 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF) {
      goto LABEL_20;
    }
    do
    {
      uint64_t v14 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1F4188790](v14);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    int v18 = v12;
    char v15 = v31;
    goto LABEL_13;
  }
  char v15 = v31;
  uint64_t v16 = v11;
LABEL_14:

  type metadata accessor for OSSignpostIntervalState();
  v52[0] = *v15;
  char v28 = protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostAnimationBegin();
  return OSSignpostIntervalState.__allocating_init(id:isOpen:)(v52, v28 & 1);
}

uint64_t OSSignposter.beginAnimationInterval(_:id:_:)(unint64_t a1, uint64_t a2, char a3, uint64_t *a4, const void *a5)
{
  id v10 = OSSignposter.logHandle.getter();
  static os_signpost_type_t.begin.getter();
  memcpy(__dst, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)__dst);
  Swift::String v20 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  static String.+= infix(_:_:)();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" isAnimation=YES", 0x10uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v28, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v28);
  char v29 = v28[24];
  outlined release of OSLogInterpolation((uint64_t)v28);
  memcpy(v26, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v26);
  char v27 = v26[25];
  outlined release of OSLogInterpolation((uint64_t)v26);
  OSLogMessage.bufferSize.getter();
  memcpy(v25, a5, sizeof(v25));
  outlined retain of OSLogInterpolation((uint64_t)v25);
  outlined release of OSLogInterpolation((uint64_t)v25);
  memcpy(v24, a5, sizeof(v24));
  outlined retain of OSLogInterpolation((uint64_t)v24);
  outlined release of OSLogInterpolation((uint64_t)v24);
  memcpy(v21, a5, sizeof(v21));
  outlined retain of OSLogInterpolation((uint64_t)v21);
  uint64_t v22 = v21[2];
  outlined retain of OSLogArguments((uint64_t)&v22);
  outlined release of OSLogInterpolation((uint64_t)v21);
  outlined retain of OSLogArguments((uint64_t)&v22);
  uint64_t v23 = v22;
  outlined release of OSLogArguments((uint64_t)&v22);
  uint64_t v11 = OS_os_log.signpostsEnabled.getter();
  if (v11)
  {
    char v18 = v29;
    char v17 = v27;
    if ((a3 & 1) == 0)
    {
      if (a1) {
        unint64_t v15 = a1;
      }
      else {
        unint64_t v15 = 0;
      }
      uint64_t v12 = v15;
      if (v15)
      {
        if (a2 < 0)
        {
          uint64_t v12 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v12, &v16);
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      uint64_t v11 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      uint64_t v11 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF) {
      goto LABEL_20;
    }
    do
    {
      uint64_t v11 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1F4188790](v11);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
  outlined release of OSLogArguments((uint64_t)&v23);
  swift_bridgeObjectRelease();
LABEL_14:

  type metadata accessor for OSSignpostIntervalState();
  uint64_t v19 = *a4;
  char v13 = protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostAnimationBegin();
  return OSSignpostIntervalState.__allocating_init(id:isOpen:)(&v19, v13 & 1);
}

void OSSignposter.endInterval(_:_:_:)(unint64_t a1, uint64_t a2, char a3, uint64_t a4, const void *a5)
{
  id v8 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter(&v19);
  static os_signpost_type_t.end.getter();
  swift_retain();
  memcpy(__dst, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  uint64_t v9 = __dst[0];
  id v10 = (void *)__dst[1];
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)__dst);
  v11._uint64_t countAndFlagsBits = v9;
  v11._object = v10;
  id(_:)(v11);
  swift_bridgeObjectRelease();
  memcpy(v27, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v27);
  char v28 = v27[24];
  outlined release of OSLogInterpolation((uint64_t)v27);
  memcpy(v25, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v25);
  char v26 = v25[25];
  outlined release of OSLogInterpolation((uint64_t)v25);
  OSLogMessage.bufferSize.getter();
  memcpy(v24, a5, sizeof(v24));
  outlined retain of OSLogInterpolation((uint64_t)v24);
  outlined release of OSLogInterpolation((uint64_t)v24);
  memcpy(v23, a5, sizeof(v23));
  outlined retain of OSLogInterpolation((uint64_t)v23);
  outlined release of OSLogInterpolation((uint64_t)v23);
  memcpy(v20, a5, sizeof(v20));
  outlined retain of OSLogInterpolation((uint64_t)v20);
  uint64_t v21 = v20[2];
  outlined retain of OSLogArguments((uint64_t)&v21);
  outlined release of OSLogInterpolation((uint64_t)v20);
  outlined retain of OSLogArguments((uint64_t)&v21);
  uint64_t v22 = v21;
  outlined release of OSLogArguments((uint64_t)&v21);
  uint64_t v12 = OS_os_log.signpostsEnabled.getter();
  if (v12)
  {
    char v18 = v28;
    char v17 = v26;
    if ((a3 & 1) == 0)
    {
      if (a1) {
        unint64_t v15 = a1;
      }
      else {
        unint64_t v15 = 0;
      }
      uint64_t v13 = v15;
      if (v15)
      {
        if (a2 < 0)
        {
          uint64_t v13 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v13, &v16);
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      uint64_t v12 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      uint64_t v12 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF) {
      goto LABEL_20;
    }
    do
    {
      uint64_t v12 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1F4188790](v12);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
  outlined release of OSLogArguments((uint64_t)&v22);
  swift_bridgeObjectRelease();
LABEL_14:
  swift_release();
}

void OSSignposter.endInterval(_:_:)(unint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  id v8 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter(v42);
  os_signpost_type_t v9 = static os_signpost_type_t.end.getter();
  swift_retain();
  uint64_t v10 = OS_os_log.signpostsEnabled.getter();
  if ((v10 & 1) == 0) {
    goto LABEL_19;
  }
  unsigned __int8 v41 = 0;
  unsigned __int8 v40 = 0;
  if (a3) {
    goto LABEL_20;
  }
  if (a1) {
    unint64_t v30 = a1;
  }
  else {
    unint64_t v30 = 0;
  }
  uint64_t v11 = v30;
  if (!v30)
  {
    uint64_t v10 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_20:
    if (a1 > 0xFFFFFFFF)
    {
      uint64_t v10 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF) {
      goto LABEL_25;
    }
    do
    {
      uint64_t v10 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_25:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1F4188790](v10);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
  if (a2 < 0)
  {
    uint64_t v11 = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  closure #1 in _globalStringTablePointerOfStaticString(_:)(v11, (uint64_t *)&v39);
LABEL_13:
  uint64_t v12 = v39;
  v38 = "";
  swift_retain();
  if (a4)
  {
    checkForErrorAndConsumeState(state:)(a4, &v31);
    if ((v31 & 1) == 0)
    {
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("[Error] Interval already ended", 0x1EuLL, 1);
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    swift_release();
  }
  uint64_t v13 = (char *)v38;
  unsigned int v25 = v41;
  HIDWORD(v22) = v40;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v14 = _allocateUninitializedArray<A>(_:)();
  unint64_t v15 = v8;
  os_signpost_id_t v37 = v42[0];
  char v28 = &v22;
  MEMORY[0x1F4188790](v15);
  char v29 = v13;
  v35[1] = (unsigned char *)2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  char v27 = v12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v24 = v36;
  uint64_t v16 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  uint64_t v17 = createStorage<A>(capacity:type:)(0);
  uint64_t v18 = createStorage<A>(capacity:type:)(0);
  char v26 = v16;
  v35[0] = v16;
  uint64_t v34 = v17;
  uint64_t v33 = v18;
  serialize(_:at:)(v25, v35);
  uint64_t v19 = serialize(_:at:)(HIDWORD(v22), v35);
  uint64_t v23 = v14;
  uint64_t v32 = v14;
  MEMORY[0x1F4188790](v19);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  Sequence.forEach(_:)();
  uint64_t v20 = v17;
  uint64_t v21 = v26;
  closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v26, v24, v8, v9, &v37, v27, v29);
  destroyStorage<A>(_:count:)(v20);
  destroyStorage<A>(_:count:)(v18);
  MEMORY[0x1996FA1C0](v21, MEMORY[0x1E4FBC358]);

  swift_bridgeObjectRelease();
LABEL_19:
  swift_release();
}

void OSSignposter.withIntervalSignpost<A>(_:id:_:around:)(unint64_t a1, uint64_t a2, char a3, int a4, void *__src)
{
  memcpy(__dst, __src, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)__dst);
  memcpy(v18, __src, sizeof(v18));
  outlined retain of OSLogInterpolation((uint64_t)v18);
  outlined release of OSLogInterpolation((uint64_t)v18);
  memcpy(v17, __src, sizeof(v17));
  outlined retain of OSLogInterpolation((uint64_t)v17);
  outlined release of OSLogInterpolation((uint64_t)v17);
  OSLogMessage.bufferSize.getter();
  memcpy(v16, __src, sizeof(v16));
  outlined retain of OSLogInterpolation((uint64_t)v16);
  outlined release of OSLogInterpolation((uint64_t)v16);
  memcpy(v15, __src, sizeof(v15));
  outlined retain of OSLogInterpolation((uint64_t)v15);
  outlined release of OSLogInterpolation((uint64_t)v15);
  memcpy(v13, __src, sizeof(v13));
  outlined retain of OSLogInterpolation((uint64_t)v13);
  uint64_t v14 = v13[2];
  outlined retain of OSLogArguments((uint64_t)&v14);
  outlined release of OSLogInterpolation((uint64_t)v13);
  outlined retain of OSLogArguments((uint64_t)&v14);
  void __dst[8] = v14;
  uint64_t v9 = outlined release of OSLogArguments((uint64_t)&v14);
  if (a3) {
    goto LABEL_12;
  }
  if (a1) {
    unint64_t v11 = a1;
  }
  else {
    unint64_t v11 = 0;
  }
  uint64_t v10 = v11;
  if (!v11) {
    goto LABEL_11;
  }
  if (a2 < 0)
  {
    uint64_t v10 = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  closure #1 in _globalStringTablePointerOfStaticString(_:)(v10, &v12);
  while (1)
  {
    __break(1u);
LABEL_11:
    uint64_t v9 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_12:
    if (a1 > 0xFFFFFFFF)
    {
      uint64_t v9 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 >= 0xD800 && a1 <= 0xDFFF) {
      break;
    }
LABEL_17:
    if (a1 > 0x10FFFF) {
      break;
    }
    MEMORY[0x1F4188790](v9);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
  }
  uint64_t v9 = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  goto LABEL_17;
}

uint64_t OSSignposter.withIntervalSignpost<A>(_:id:around:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = v7;
  uint64_t v13 = MEMORY[0x1F4188790](a1);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v19 & 1) == 0)
  {
    if (a1) {
      unint64_t v45 = a1;
    }
    else {
      unint64_t v45 = 0;
    }
    uint64_t v20 = v45;
    if (v45)
    {
      if (v14 < 0)
      {
        LODWORD(v34) = 0;
        uint64_t v33 = 1343;
        LOBYTE(v32) = 2;
        uint64_t v20 = _fatalErrorMessage(_:_:file:line:flags:)();
        __break(1u);
      }
      uint64_t v42 = v8;
      uint64_t v43 = v16;
      uint64_t v44 = v15;
      closure #1 in _globalStringTablePointerOfStaticString(_:)(v20, &v53);
      goto LABEL_11;
    }
    LODWORD(v34) = 0;
    uint64_t v33 = 136;
    LOBYTE(v32) = 2;
    uint64_t v13 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (a1 > 0xFFFFFFFF)
  {
    LODWORD(v34) = 0;
    uint64_t v33 = 3455;
    LOBYTE(v32) = 2;
    uint64_t v13 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (a1 < 0xD800 || a1 > 0xDFFF) {
    goto LABEL_18;
  }
  do
  {
    LODWORD(v34) = 0;
    uint64_t v33 = 148;
    LOBYTE(v32) = 2;
    uint64_t v13 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_18:
    ;
  }
  while (a1 > 0x10FFFF);
  uint64_t v43 = v16;
  uint64_t v44 = v15;
  uint64_t v36 = (uint64_t)&v36;
  MEMORY[0x1F4188790](v13);
  uint64_t v34 = closure #1 in _globalStringTablePointerOfStaticString(_:);
  uint64_t v35 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
  Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
  uint64_t v42 = v8;
LABEL_11:
  uint64_t v21 = v53;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v22 = _allocateUninitializedArray<A>(_:)();
  uint64_t v23 = outlined init with copy of OSSignposter(v9, (uint64_t)v52);
  uint64_t v51 = *a4;
  unsigned __int8 v40 = &v36;
  MEMORY[0x1F4188790](v23);
  v39 = &v36 - 10;
  *(&v36 - 8) = a7;
  *(&v36 - 7) = (uint64_t)v52;
  *(&v36 - 6) = (uint64_t)&v51;
  *(&v36 - 5) = v21;
  v49[1] = (unsigned char *)2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v37 = v50;
  uint32_t v24 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  uint64_t v25 = createStorage<A>(capacity:type:)(0);
  uint64_t v26 = createStorage<A>(capacity:type:)(0);
  v38 = v24;
  v49[0] = v24;
  uint64_t v48 = v25;
  uint64_t v47 = v26;
  serialize(_:at:)(0, v49);
  uint64_t v27 = serialize(_:at:)(0, v49);
  uint64_t v28 = v22;
  uint64_t v46 = v22;
  char v29 = (uint8_t *)&v36;
  MEMORY[0x1F4188790](v27);
  uint64_t v32 = v49;
  uint64_t v33 = (uint64_t)&v48;
  uint64_t v34 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))&v47;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  uint64_t v30 = v42;
  Sequence.forEach(_:)();
  if (v30)
  {
    __break(1u);
  }
  else
  {
    uint64_t v41 = v28;
    char v29 = v38;
    partial apply for closure #1 in OSSignposter.withIntervalSignpost<A>(_:id:around:)(v38, v37);
  }
  destroyStorage<A>(_:count:)(v25);
  destroyStorage<A>(_:count:)(v26);
  MEMORY[0x1996FA1C0](v29, MEMORY[0x1E4FBC358]);
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v44, v18, a7);
  outlined destroy of OSSignposter((uint64_t)v52);
  return swift_bridgeObjectRelease();
}

void closure #1 in OSSignposter.withIntervalSignpost<A>(_:id:around:)(uint8_t *a1, uint32_t a2, id *a3, os_signpost_id_t *a4, const char *a5, const char *a6, void (*a7)(void))
{
  os_signpost_id_t v12 = *a4;
  uint64_t v13 = *a3;
  _os_signpost_emit_with_name_impl(&dword_1931D0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, a5, a6, a1, a2);
  a7();
  if (!v14) {
    _os_signpost_emit_with_name_impl(&dword_1931D0000, v13, OS_SIGNPOST_INTERVAL_END, v12, a5, a6, a1, a2);
  }
}

os_signpost_id_t OSSignposter.makeSignpostID()@<X0>(os_signpost_id_t *a1@<X8>)
{
  os_signpost_id_t result = os_signpost_id_generate(*v1);
  *a1 = result;
  return result;
}

os_signpost_id_t OSSignposter.makeSignpostID(from:)@<X0>(void *ptr@<X0>, os_signpost_id_t *a2@<X8>)
{
  os_signpost_id_t result = os_signpost_id_make_with_pointer(*v2, ptr);
  *a2 = result;
  return result;
}

BOOL static OSSignpostError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void OSSignpostError.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int OSSignpostError.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t static OSSignpostIntervalState.beginState(id:)(uint64_t *a1)
{
  uint64_t v1 = *a1;
  type metadata accessor for OSSignpostIntervalState();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v1;
  *(unsigned char *)(result + 24) = 1;
  return result;
}

uint64_t OSSignpostIntervalState.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x6E65704F7369;
  }
  else {
    return 0x74736F706E676973;
  }
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance OSSignpostIntervalState.CodingKeys()
{
  return OSSignpostIntervalState.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance OSSignpostIntervalState.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized OSSignpostIntervalState.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance OSSignpostIntervalState.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance OSSignpostIntervalState.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance OSSignpostIntervalState.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance OSSignpostIntervalState.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t OSSignpostIntervalState.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  OSSignpostIntervalState.init(from:)(a1);
  return v2;
}

uint64_t OSSignpostIntervalState.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<OSSignpostIntervalState.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    type metadata accessor for OSSignpostIntervalState();
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v13 = 0;
    *(void *)(v1 + 16) = KeyedDecodingContainer.decode(_:forKey:)();
    char v12 = 1;
    char v10 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)(v3 + 24) = v10 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t OSSignpostIntervalState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<OSSignpostIntervalState.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t OSSignpostIntervalState._hasValue(id:isOpen:)(void *a1, int a2)
{
  if (*(void *)(v2 + 16) == *a1) {
    return (*(unsigned __int8 *)(v2 + 24) ^ a2 ^ 1) & 1;
  }
  else {
    return 0;
  }
}

uint64_t OSSignpostIntervalState.deinit()
{
  return v0;
}

uint64_t protocol witness for Decodable.init(from:) in conformance OSSignpostIntervalState@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for OSSignpostIntervalState();
  uint64_t v5 = swift_allocObject();
  uint64_t result = OSSignpostIntervalState.init(from:)(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance OSSignpostIntervalState(void *a1)
{
  return OSSignpostIntervalState.encode(to:)(a1);
}

Swift::String __swiftcall id(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  uint64_t v3 = countAndFlagsBits;
  uint64_t v4 = object;
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t outlined retain of OSLogArguments(uint64_t a1)
{
  return a1;
}

uint64_t outlined release of OSLogArguments(uint64_t a1)
{
  return a1;
}

void closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(uint8_t *buf, uint32_t size, os_log_t log, os_signpost_type_t a4, os_signpost_id_t *a5, char *name, char *format)
{
}

uint64_t closure #1 in _globalStringTablePointerOfStaticString(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
  }
  else
  {
    Swift::String result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t partial apply for closure #1 in StaticString.withUTF8Buffer<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A]);
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

uint64_t closure #1 in emitSignpost<A>(preamble:argumentCount:bufferSize:objectCount:stringCount:argumentClosures:signpostTask:)partial apply(uint64_t (**a1)(void, void, void))
{
  return closure #1 in emitSignpost<A>(preamble:argumentCount:bufferSize:objectCount:stringCount:argumentClosures:signpostTask:)partial apply(a1);
}

{
  void *v1;

  return (*a1)(v1[2], v1[3], v1[4]);
}

uint64_t outlined init with copy of OSSignposter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined destroy of OSSignposter(uint64_t a1)
{
  return a1;
}

void partial apply for closure #1 in OSSignposter.withIntervalSignpost<A>(_:id:around:)(uint8_t *a1, uint32_t a2)
{
  closure #1 in OSSignposter.withIntervalSignpost<A>(_:id:around:)(a1, a2, *(id **)(v2 + 24), *(os_signpost_id_t **)(v2 + 32), *(const char **)(v2 + 40), *(const char **)(v2 + 48), *(void (**)(void))(v2 + 56));
}

unint64_t lazy protocol witness table accessor for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys;
  if (!lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys;
  if (!lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys;
  if (!lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys;
  if (!lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSSignpostError and conformance OSSignpostError()
{
  unint64_t result = lazy protocol witness table cache variable for type OSSignpostError and conformance OSSignpostError;
  if (!lazy protocol witness table cache variable for type OSSignpostError and conformance OSSignpostError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostError and conformance OSSignpostError);
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for OSSignpostError(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

uint64_t method lookup function for OSSignpostIntervalState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for OSSignpostIntervalState);
}

uint64_t dispatch thunk of OSSignpostIntervalState.__allocating_init(id:isOpen:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of OSSignpostIntervalState.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of OSSignpostIntervalState.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of OSSignpostIntervalState._hasValue(id:isOpen:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t getEnumTagSinglePayload for OSSignpostError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for OSSignpostError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1931E0A94);
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

ValueMetadata *type metadata accessor for OSSignpostIntervalState.CodingKeys()
{
  return &type metadata for OSSignpostIntervalState.CodingKeys;
}

uint64_t specialized OSSignpostIntervalState.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x74736F706E676973 && a2 == 0xEA00000000004449;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65704F7369 && a2 == 0xE600000000000000)
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

uint64_t closure #1 in StaticString.withUTF8Buffer<A>(_:)partial apply()
{
  return partial apply for closure #1 in StaticString.withUTF8Buffer<A>(_:)();
}

Swift::String_optional __swiftcall concatPrivacyAndAttributes(privacy:attributes:)(os::OSLogPrivacy privacy, Swift::String attributes)
{
  object = attributes._object;
  uint64_t countAndFlagsBits = attributes._countAndFlagsBits;
  BOOL v4 = OSLogPrivacy.needsPrivacySpecifier.getter();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  char v5 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  char v6 = v5 ^ 1;
  if (!v4) {
    char v6 = 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = countAndFlagsBits;
  char v13 = object;
  if (v6)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(",", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  OSLogPrivacy.privacySpecifier.getter();
  if (v7)
  {
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  char v8 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    outlined destroy of String((uint64_t)&v12);
    uint64_t v9 = 0;
    char v10 = 0;
  }
  else
  {
    uint64_t v9 = v12;
    char v10 = v13;
  }
  result.value._object = v10;
  result.value._uint64_t countAndFlagsBits = v9;
  return result;
}

uint64_t maxOSLogArgumentCount.getter()
{
  return 48;
}

Swift::UInt8 __swiftcall OSLogInterpolation.getArgumentHeader(privacy:type:)(os::OSLogPrivacy privacy, os::OSLogInterpolation::ArgumentType type)
{
  char v2 = OSLogInterpolation.ArgumentType.rawValue.getter();
  return OSLogPrivacy.argumentFlag.getter() | (16 * v2);
}

Swift::Void __swiftcall OSLogArguments.append(_:)(Swift::UInt8 a1)
{
  *(unsigned char *)(swift_allocObject() + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  Array.append(_:)();
}

Swift::UInt8 __swiftcall OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(os::OSLogPrivacy privacy, Swift::Bool isScalar)
{
  BOOL v3 = isScalar;
  uint64_t v4 = *(void *)&privacy.privacy;
  Swift::UInt8 v5 = *(unsigned char *)(v2 + 24);
  Swift::UInt8 v8 = v5;
  if (OSLogPrivacy.isAtleastPrivate.getter()) {
    Swift::UInt8 v8 = v5 | 1;
  }
  if (!v3 || *(unsigned char *)(v4 + 1) != 1) {
    v8 |= 2u;
  }
  return v8;
}

uint64_t OSLogInterpolation.init(literalCapacity:interpolationCount:)@<X0>(uint64_t a1@<X8>)
{
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  uint64_t result = OSLogArguments.init()();
  *(Swift::String *)a1 = v2;
  *(void *)(a1 + 16) = result;
  *(unsigned char *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 25) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  return result;
}

uint64_t OSLogMessage.init(stringInterpolation:)@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  outlined retain of OSLogInterpolation((uint64_t)a1);
  memcpy(__dst, a1, sizeof(__dst));
  uint64_t v4 = __dst[0];
  uint64_t v5 = __dst[1];
  uint64_t v6 = __dst[2];
  char v7 = __dst[3];
  char v8 = BYTE1(__dst[3]);
  uint64_t v9 = __dst[4];
  uint64_t v10 = __dst[5];
  uint64_t v11 = __dst[6];
  uint64_t result = outlined release of OSLogInterpolation((uint64_t)a1);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 25) = v8;
  *(void *)(a2 + 32) = v9;
  *(void *)(a2 + 40) = v10;
  *(void *)(a2 + 48) = v11;
  return result;
}

uint64_t OSLogMessage.bufferSize.getter()
{
  memcpy(v3, v0, sizeof(v3));
  outlined retain of OSLogInterpolation((uint64_t)v3);
  uint64_t v4 = v3[4];
  outlined release of OSLogInterpolation((uint64_t)v3);
  uint64_t result = v4 + 2;
  if (__OFADD__(v4, 2)) {
    __break(1u);
  }
  return result;
}

uint64_t createStorage<A>(capacity:type:)(uint64_t result)
{
  if (result) {
    return static UnsafeMutablePointer.allocate(capacity:)();
  }
  return result;
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  Swift::String v2 = *a2;
  *Swift::String v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t destroyStorage<A>(_:count:)(uint64_t result)
{
  if (result)
  {
    UnsafeMutablePointer.deinitialize(count:)();
    JUMPOUT(0x1996FA1C0);
  }
  return result;
}

uint64_t OSLogInterpolation.formatString.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t OSLogInterpolation.formatString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *Swift::String v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*OSLogInterpolation.formatString.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogInterpolation.arguments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t OSLogInterpolation.arguments.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*OSLogInterpolation.arguments.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

unint64_t OSLogInterpolation.ArgumentType.rawValue.getter()
{
  return 0x70403020100uLL >> (8 * *v0);
}

BOOL static OSLogInterpolation.ArgumentType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OSLogInterpolation.ArgumentType.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int OSLogInterpolation.ArgumentType.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t OSLogInterpolation.preamble.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t OSLogInterpolation.preamble.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t (*OSLogInterpolation.preamble.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogInterpolation.privateBitMask.getter()
{
  return 1;
}

uint64_t OSLogInterpolation.nonScalarBitMask.getter()
{
  return 2;
}

uint64_t OSLogInterpolation.argumentCount.getter()
{
  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t OSLogInterpolation.argumentCount.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 25) = result;
  return result;
}

uint64_t (*OSLogInterpolation.argumentCount.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogInterpolation.totalBytesForSerializingArguments.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t OSLogInterpolation.totalBytesForSerializingArguments.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*OSLogInterpolation.totalBytesForSerializingArguments.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogInterpolation.stringArgumentCount.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t OSLogInterpolation.stringArgumentCount.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t (*OSLogInterpolation.stringArgumentCount.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogInterpolation.objectArgumentCount.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t OSLogInterpolation.objectArgumentCount.setter(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

uint64_t (*OSLogInterpolation.objectArgumentCount.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogArguments.init()()
{
  return _allocateUninitializedArray<A>(_:)();
}

Swift::Void __swiftcall OSLogInterpolation.appendLiteral(_:)(Swift::String a1)
{
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
}

uint64_t String.percentEscapedString.getter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  Swift::String v8 = Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1);
  lazy protocol witness table accessor for type String and conformance String();
  default argument 1 of Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)();
  uint64_t v4 = Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)();
  outlined destroy of Character((uint64_t)&v8);
  uint64_t v7 = v4;
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%%", 2uLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Substring]);
  lazy protocol witness table accessor for type [Substring] and conformance [A]();
  lazy protocol witness table accessor for type Substring and conformance Substring();
  uint64_t v5 = Sequence<>.joined(separator:)();
  outlined destroy of [Substring]((uint64_t)&v7);
  swift_bridgeObjectRelease();
  return v5;
}

double protocol witness for StringInterpolationProtocol.init(literalCapacity:interpolationCount:) in conformance OSLogInterpolation@<D0>(uint64_t a1@<X8>)
{
  OSLogInterpolation.init(literalCapacity:interpolationCount:)((uint64_t)v4);
  long long v2 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v2;
  double result = *(double *)&v5;
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = v6;
  return result;
}

void protocol witness for StringInterpolationProtocol.appendLiteral(_:) in conformance OSLogInterpolation(Swift::String *a1)
{
}

uint64_t default argument 1 of Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t OSLogMessage.interpolation.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of OSLogInterpolation(v1, a1);
}

uint64_t OSLogMessage.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  OSLogInterpolation.init(literalCapacity:interpolationCount:)((uint64_t)__src);
  memcpy(v16, __src, 0x38uLL);
  v6._uint64_t countAndFlagsBits = a1;
  v6._object = a2;
  OSLogInterpolation.appendLiteral(_:)(v6);
  v16[7] = v16[0];
  v16[8] = v16[1];
  v16[9] = v16[2];
  __int16 v17 = v16[3];
  uint64_t v18 = v16[4];
  uint64_t v19 = v16[5];
  uint64_t v20 = v16[6];
  uint64_t v7 = v16[0];
  uint64_t v8 = v16[1];
  uint64_t v9 = v16[2];
  char v10 = v16[3];
  char v11 = BYTE1(v16[3]);
  uint64_t v12 = v16[4];
  uint64_t v13 = v16[5];
  uint64_t v14 = v16[6];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v7;
  *(void *)(a3 + 8) = v8;
  *(void *)(a3 + 16) = v9;
  *(unsigned char *)(a3 + 24) = v10;
  *(unsigned char *)(a3 + 25) = v11;
  *(void *)(a3 + 32) = v12;
  *(void *)(a3 + 40) = v13;
  *(void *)(a3 + 48) = v14;
  return result;
}

double protocol witness for ExpressibleByStringInterpolation.init(stringInterpolation:) in conformance OSLogMessage@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v3;
  v9[2] = *(_OWORD *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  OSLogMessage.init(stringInterpolation:)(v9, (uint64_t)v6);
  long long v4 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v4;
  double result = *(double *)&v7;
  *(_OWORD *)(a2 + 32) = v7;
  *(void *)(a2 + 48) = v8;
  return result;
}

double protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance OSLogMessage@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  OSLogMessage.init(stringLiteral:)(*(void *)a1, *(void **)(a1 + 8), (uint64_t)v5);
  long long v3 = v5[1];
  *(_OWORD *)a2 = v5[0];
  *(_OWORD *)(a2 + 16) = v3;
  double result = *(double *)&v6;
  *(_OWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 48) = v7;
  return result;
}

uint64_t OSLogArguments.argumentClosures.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*OSLogArguments.argumentClosures.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t sub_1931E18BC()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

unsigned char **partial apply for closure #1 in OSLogArguments.append(_:)(unsigned char **result)
{
  long long v2 = *result;
  *long long v2 = *(unsigned char *)(v1 + 16);
  *uint64_t result = v2 + 1;
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

uint64_t outlined destroy of Character(uint64_t a1)
{
  return a1;
}

unint64_t lazy protocol witness table accessor for type [Substring] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [Substring] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Substring] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Substring]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Substring] and conformance [A]);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Substring and conformance Substring()
{
  unint64_t result = lazy protocol witness table cache variable for type Substring and conformance Substring;
  if (!lazy protocol witness table cache variable for type Substring and conformance Substring)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Substring and conformance Substring);
  }
  return result;
}

uint64_t outlined destroy of [Substring](uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Substring]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of OSLogInterpolation(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t lazy protocol witness table accessor for type OSLogInterpolation.ArgumentType and conformance OSLogInterpolation.ArgumentType()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogInterpolation.ArgumentType and conformance OSLogInterpolation.ArgumentType;
  if (!lazy protocol witness table cache variable for type OSLogInterpolation.ArgumentType and conformance OSLogInterpolation.ArgumentType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogInterpolation.ArgumentType and conformance OSLogInterpolation.ArgumentType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogMessage and conformance OSLogMessage()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage;
  if (!lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage;
  if (!lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage;
  if (!lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogInterpolation and conformance OSLogInterpolation()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogInterpolation and conformance OSLogInterpolation;
  if (!lazy protocol witness table cache variable for type OSLogInterpolation and conformance OSLogInterpolation)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogInterpolation and conformance OSLogInterpolation);
  }
  return result;
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

ValueMetadata *type metadata accessor for OSLogInterpolation()
{
  return &type metadata for OSLogInterpolation;
}

unsigned char *storeEnumTagSinglePayload for OSLogInterpolation.ArgumentType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1931E1D98);
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

ValueMetadata *type metadata accessor for OSLogInterpolation.ArgumentType()
{
  return &type metadata for OSLogInterpolation.ArgumentType;
}

uint64_t destroy for OSLogInterpolation()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for OSLogInterpolation(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for OSLogInterpolation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t assignWithTake for OSLogInterpolation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for OSLogInterpolation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogInterpolation(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogMessage()
{
  return &type metadata for OSLogMessage;
}

ValueMetadata *type metadata accessor for OSLogArguments()
{
  return &type metadata for OSLogArguments;
}

uint64_t outlined destroy of String(uint64_t a1)
{
  return a1;
}

uint64_t OSAllocatedUnfairLockFlags.rawValue.getter()
{
  return *v0;
}

uint64_t OSAllocatedUnfairLockFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static OSAllocatedUnfairLockFlags.adaptiveSpin.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t OSAllocatedUnfairLockFlags._translatedValue.getter()
{
  return (*v0 == 2) << 18;
}

_DWORD *protocol witness for OptionSet.init(rawValue:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance OSAllocatedUnfairLockFlags(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void protocol witness for SetAlgebra.init() in conformance OSAllocatedUnfairLockFlags(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *protocol witness for SetAlgebra.union(_:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.intersection(_:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *a1, int *a2)
{
  int v3 = *a2;
  int v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

_DWORD *protocol witness for SetAlgebra.remove(_:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(_DWORD *)a2 = v3;
  *(unsigned char *)(a2 + 4) = v3 == 0;
  return result;
}

int *protocol witness for SetAlgebra.update(with:) in conformance OSAllocatedUnfairLockFlags@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = *v2;
  *v2 |= *result;
  int v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *result)
{
  *v1 |= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *result)
{
  *v1 &= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *result)
{
  *v1 ^= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance OSAllocatedUnfairLockFlags(_DWORD *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance OSAllocatedUnfairLockFlags(_DWORD *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance OSAllocatedUnfairLockFlags(_DWORD *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance OSAllocatedUnfairLockFlags()
{
  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance OSAllocatedUnfairLockFlags(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

_DWORD *protocol witness for SetAlgebra.subtract(_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    int v4 = 0;
    int v5 = (int *)(a1 + 32);
    do
    {
      int v7 = *v5++;
      int v6 = v7;
      if ((v7 & ~v4) == 0) {
        int v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    int v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

BOOL static OSAllocatedUnfairLock.Ownership.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void OSAllocatedUnfairLock.Ownership.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int OSAllocatedUnfairLock.Ownership.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OSAllocatedUnfairLock<A>.Ownership(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static OSAllocatedUnfairLock.Ownership.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance OSAllocatedUnfairLock<A>.Ownership()
{
  return OSAllocatedUnfairLock.Ownership.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance OSAllocatedUnfairLock<A>.Ownership(uint64_t a1)
{
  OSAllocatedUnfairLock.Ownership.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OSAllocatedUnfairLock<A>.Ownership()
{
  Hasher.init(_seed:)();
  OSAllocatedUnfairLock.Ownership.hash(into:)((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags;
  if (!lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags;
  if (!lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags;
  if (!lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags;
  if (!lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in OSAllocatedUnfairLock<A>.Ownership()
{
  return swift_getWitnessTable();
}

ValueMetadata *type metadata accessor for OSAllocatedUnfairLockFlags()
{
  return &type metadata for OSAllocatedUnfairLockFlags;
}

uint64_t type metadata instantiation function for OSAllocatedUnfairLock.Ownership(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 8);
}

unsigned char *storeEnumTagSinglePayload for OSAllocatedUnfairLock.Ownership(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1931E25F0);
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

uint64_t type metadata accessor for OSAllocatedUnfairLock.Ownership()
{
  return __swift_instantiateGenericMetadata();
}

void Logger.log(_:)(long long *a1)
{
}

void Logger.log(level:_:)(uint64_t a1, long long *a2)
{
  Logger.logObject.getter();
  long long v3 = *a2;
  long long v4 = a2[1];
  long long v5 = a2[2];
  uint64_t v35 = *((void *)a2 + 6);
  v34[2] = v5;
  v34[1] = v4;
  v34[0] = v3;
  outlined retain of OSLogInterpolation((uint64_t)v34);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v34);
  long long v6 = *a2;
  long long v7 = a2[1];
  long long v8 = a2[2];
  uint64_t v33 = *((void *)a2 + 6);
  v32[2] = v8;
  v32[1] = v7;
  v32[0] = v6;
  outlined retain of OSLogInterpolation((uint64_t)v32);
  outlined release of OSLogInterpolation((uint64_t)v32);
  long long v9 = *a2;
  long long v10 = a2[1];
  long long v11 = a2[2];
  uint64_t v31 = *((void *)a2 + 6);
  v30[2] = v11;
  v30[1] = v10;
  v30[0] = v9;
  outlined retain of OSLogInterpolation((uint64_t)v30);
  outlined release of OSLogInterpolation((uint64_t)v30);
  OSLogMessage.bufferSize.getter();
  long long v12 = *a2;
  long long v13 = a2[1];
  long long v14 = a2[2];
  uint64_t v29 = *((void *)a2 + 6);
  v28[2] = v14;
  v28[1] = v13;
  v28[0] = v12;
  outlined retain of OSLogInterpolation((uint64_t)v28);
  outlined release of OSLogInterpolation((uint64_t)v28);
  long long v15 = *a2;
  long long v16 = a2[1];
  long long v17 = a2[2];
  uint64_t v27 = *((void *)a2 + 6);
  v26[2] = v17;
  v26[1] = v16;
  v26[0] = v15;
  outlined retain of OSLogInterpolation((uint64_t)v26);
  outlined release of OSLogInterpolation((uint64_t)v26);
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  long long v18 = *a2;
  long long v19 = a2[1];
  long long v20 = a2[2];
  uint64_t v24 = *((void *)a2 + 6);
  long long v23 = v20;
  long long v22 = v19;
  long long v21 = v18;
  outlined retain of OSLogInterpolation((uint64_t)&v21);
  v25[0] = v22;
  outlined retain of OSLogArguments((uint64_t)v25);
  outlined release of OSLogInterpolation((uint64_t)&v21);
  outlined retain of OSLogArguments((uint64_t)v25);
  v25[1] = v25[0];
  outlined release of OSLogArguments((uint64_t)v25);
  __break(1u);
}

void Logger.trace(_:)(long long *a1)
{
}

void Logger.debug(_:)(long long *a1)
{
}

void Logger.info(_:)(long long *a1)
{
}

void Logger.notice(_:)(long long *a1)
{
}

void Logger.warning(_:)(long long *a1)
{
}

void Logger.error(_:)(long long *a1)
{
}

void Logger.critical(_:)(long long *a1)
{
}

void Logger.fault(_:)(long long *a1)
{
}

void Logger.log(_:)(long long *a1, void (*a2)(id))
{
  id v4 = Logger.logObject.getter();
  a2(v4);
  long long v5 = *a1;
  long long v6 = a1[1];
  long long v7 = a1[2];
  uint64_t v37 = *((void *)a1 + 6);
  v36[2] = v7;
  v36[1] = v6;
  v36[0] = v5;
  outlined retain of OSLogInterpolation((uint64_t)v36);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v36);
  long long v8 = *a1;
  long long v9 = a1[1];
  long long v10 = a1[2];
  uint64_t v35 = *((void *)a1 + 6);
  v34[2] = v10;
  v34[1] = v9;
  v34[0] = v8;
  outlined retain of OSLogInterpolation((uint64_t)v34);
  outlined release of OSLogInterpolation((uint64_t)v34);
  long long v11 = *a1;
  long long v12 = a1[1];
  long long v13 = a1[2];
  uint64_t v33 = *((void *)a1 + 6);
  v32[2] = v13;
  v32[1] = v12;
  v32[0] = v11;
  outlined retain of OSLogInterpolation((uint64_t)v32);
  outlined release of OSLogInterpolation((uint64_t)v32);
  OSLogMessage.bufferSize.getter();
  long long v14 = *a1;
  long long v15 = a1[1];
  long long v16 = a1[2];
  uint64_t v31 = *((void *)a1 + 6);
  v30[2] = v16;
  v30[1] = v15;
  v30[0] = v14;
  outlined retain of OSLogInterpolation((uint64_t)v30);
  outlined release of OSLogInterpolation((uint64_t)v30);
  long long v17 = *a1;
  long long v18 = a1[1];
  long long v19 = a1[2];
  uint64_t v29 = *((void *)a1 + 6);
  v28[2] = v19;
  v28[1] = v18;
  v28[0] = v17;
  outlined retain of OSLogInterpolation((uint64_t)v28);
  outlined release of OSLogInterpolation((uint64_t)v28);
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  long long v20 = *a1;
  long long v21 = a1[1];
  long long v22 = a1[2];
  uint64_t v26 = *((void *)a1 + 6);
  long long v25 = v22;
  long long v24 = v21;
  long long v23 = v20;
  outlined retain of OSLogInterpolation((uint64_t)&v23);
  v27[0] = v24;
  outlined retain of OSLogArguments((uint64_t)v27);
  outlined release of OSLogInterpolation((uint64_t)&v23);
  outlined retain of OSLogArguments((uint64_t)v27);
  v27[1] = v27[0];
  outlined release of OSLogArguments((uint64_t)v27);
  __break(1u);
}

void os_log(_:log:_:)(uint64_t a1, uint64_t a2, long long *a3)
{
  long long v4 = *a3;
  long long v5 = a3[1];
  long long v6 = a3[2];
  uint64_t v36 = *((void *)a3 + 6);
  v35[2] = v6;
  v35[1] = v5;
  v35[0] = v4;
  outlined retain of OSLogInterpolation((uint64_t)v35);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v35);
  long long v7 = *a3;
  long long v8 = a3[1];
  long long v9 = a3[2];
  uint64_t v34 = *((void *)a3 + 6);
  v33[2] = v9;
  v33[1] = v8;
  v33[0] = v7;
  outlined retain of OSLogInterpolation((uint64_t)v33);
  outlined release of OSLogInterpolation((uint64_t)v33);
  long long v10 = *a3;
  long long v11 = a3[1];
  long long v12 = a3[2];
  uint64_t v32 = *((void *)a3 + 6);
  v31[2] = v12;
  v31[1] = v11;
  v31[0] = v10;
  outlined retain of OSLogInterpolation((uint64_t)v31);
  outlined release of OSLogInterpolation((uint64_t)v31);
  OSLogMessage.bufferSize.getter();
  long long v13 = *a3;
  long long v14 = a3[1];
  long long v15 = a3[2];
  uint64_t v30 = *((void *)a3 + 6);
  v29[2] = v15;
  v29[1] = v14;
  v29[0] = v13;
  outlined retain of OSLogInterpolation((uint64_t)v29);
  outlined release of OSLogInterpolation((uint64_t)v29);
  long long v16 = *a3;
  long long v17 = a3[1];
  long long v18 = a3[2];
  uint64_t v28 = *((void *)a3 + 6);
  void v27[2] = v18;
  v27[1] = v17;
  v27[0] = v16;
  outlined retain of OSLogInterpolation((uint64_t)v27);
  outlined release of OSLogInterpolation((uint64_t)v27);
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  long long v19 = *a3;
  long long v20 = a3[1];
  long long v21 = a3[2];
  uint64_t v25 = *((void *)a3 + 6);
  long long v24 = v21;
  long long v23 = v20;
  long long v22 = v19;
  outlined retain of OSLogInterpolation((uint64_t)&v22);
  v26[0] = v23;
  outlined retain of OSLogArguments((uint64_t)v26);
  outlined release of OSLogInterpolation((uint64_t)&v22);
  outlined retain of OSLogArguments((uint64_t)v26);
  v26[1] = v26[0];
  outlined release of OSLogArguments((uint64_t)v26);
  __break(1u);
}

uint64_t _checkFormatStringAndBuffer(_:with:)(long long *a1, void (*a2)(void, void, uint64_t, uint64_t))
{
  long long v3 = *a1;
  long long v4 = a1[1];
  long long v5 = a1[2];
  uint64_t v54 = *((void *)a1 + 6);
  v53[2] = v5;
  v53[1] = v4;
  v53[0] = v3;
  outlined retain of OSLogInterpolation((uint64_t)v53);
  long long v6 = v53[0];
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v53);
  long long v7 = *a1;
  long long v8 = a1[1];
  long long v9 = a1[2];
  uint64_t v52 = *((void *)a1 + 6);
  long long v51 = v9;
  long long v50 = v8;
  long long v49 = v7;
  outlined retain of OSLogInterpolation((uint64_t)&v49);
  uint64_t v10 = BYTE8(v50);
  outlined release of OSLogInterpolation((uint64_t)&v49);
  long long v11 = *a1;
  long long v12 = a1[1];
  long long v13 = a1[2];
  uint64_t v48 = *((void *)a1 + 6);
  long long v47 = v13;
  long long v46 = v12;
  long long v45 = v11;
  outlined retain of OSLogInterpolation((uint64_t)&v45);
  uint64_t v14 = BYTE9(v46);
  outlined release of OSLogInterpolation((uint64_t)&v45);
  OSLogMessage.bufferSize.getter();
  long long v15 = *a1;
  long long v16 = a1[1];
  long long v17 = a1[2];
  uint64_t v44 = *((void *)a1 + 6);
  v43[2] = v17;
  v43[1] = v16;
  v43[0] = v15;
  outlined retain of OSLogInterpolation((uint64_t)v43);
  uint64_t v18 = v44;
  outlined release of OSLogInterpolation((uint64_t)v43);
  long long v19 = *a1;
  long long v20 = a1[1];
  long long v21 = a1[2];
  uint64_t v42 = *((void *)a1 + 6);
  long long v41 = v21;
  v40[1] = v20;
  v40[0] = v19;
  outlined retain of OSLogInterpolation((uint64_t)v40);
  uint64_t v22 = *((void *)&v41 + 1);
  outlined release of OSLogInterpolation((uint64_t)v40);
  long long v23 = *a1;
  long long v24 = a1[1];
  long long v25 = a1[2];
  uint64_t v37 = *((void *)a1 + 6);
  long long v36 = v25;
  long long v35 = v24;
  long long v34 = v23;
  outlined retain of OSLogInterpolation((uint64_t)&v34);
  uint64_t v38 = v35;
  outlined retain of OSLogArguments((uint64_t)&v38);
  outlined release of OSLogInterpolation((uint64_t)&v34);
  outlined retain of OSLogArguments((uint64_t)&v38);
  uint64_t v39 = v38;
  outlined release of OSLogArguments((uint64_t)&v38);
  uint64_t v26 = (unsigned char *)static UnsafeMutablePointer.allocate(capacity:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  uint64_t v27 = createStorage<A>(capacity:type:)(v18);
  uint64_t v28 = createStorage<A>(capacity:type:)(v22);
  uint64_t v33 = v26;
  serialize(_:at:)(v10, &v33);
  serialize(_:at:)(v14, &v33);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  Sequence.forEach(_:)();
  uint64_t v29 = UnsafeBufferPointer.init(start:count:)();
  a2(v6, *((void *)&v6 + 1), v29, v30);
  destroyStorage<A>(_:count:)(v27);
  destroyStorage<A>(_:count:)(v28);
  MEMORY[0x1996FA1C0](v26, MEMORY[0x1E4FBC358]);
  outlined release of OSLogArguments((uint64_t)&v39);
  return swift_bridgeObjectRelease();
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@out Int)(void (*a1)(uint64_t *__return_ptr))
{
  a1(&v2);
  return v2;
}

void *static OSLogStringAlignment.none.getter@<X0>(uint64_t a1@<X8>)
{
  char v5 = 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  v3[0] = 0;
  v3[1] = 0;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  char v4 = 1;
  outlined init with copy of OSLogStringAlignment(v3, a1);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  return outlined destroy of OSLogStringAlignment(v3);
}

uint64_t outlined init with copy of OSLogStringAlignment(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  if (*a1)
  {
    uint64_t v5 = a1[1];
    *(void *)a2 = v4;
    *(void *)(a2 + 8) = v5;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
  }
  *(unsigned char *)(a2 + 16) = *((unsigned char *)a1 + 16);
  return a2;
}

void *outlined destroy of OSLogStringAlignment(void *a1)
{
  if (*a1) {
    swift_release();
  }
  return a1;
}

BOOL static OSLogCollectionBound.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void OSLogCollectionBound.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int OSLogCollectionBound.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t key path getter for OSLogStringAlignment.minimumColumnWidth : OSLogStringAlignment@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    long long v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  }
  else
  {
    long long v6 = 0;
    uint64_t v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v5;

  return outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
}

uint64_t key path setter for OSLogStringAlignment.minimumColumnWidth : OSLogStringAlignment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    long long v6 = _sSiIegr_SiIegd_TRTA_0;
  }
  else
  {
    long long v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *a2;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
  uint64_t result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(v7);
  *a2 = (uint64_t)v6;
  a2[1] = v5;
  return result;
}

uint64_t OSLogStringAlignment.minimumColumnWidth.getter()
{
  uint64_t v1 = *v0;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(*v0);
  return v1;
}

uint64_t OSLogStringAlignment.minimumColumnWidth.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(*v2);
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*OSLogStringAlignment.minimumColumnWidth.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

void OSLogStringAlignment.anchor.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *OSLogStringAlignment.anchor.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*OSLogStringAlignment.anchor.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogStringAlignment.init(minimumColumnWidth:anchor:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = *a3;
  return result;
}

void *static OSLogStringAlignment.right(columns:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static OSLogStringAlignment.right(columns:)(a1, a2, 1, a3);
}

void *static OSLogStringAlignment.left(columns:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static OSLogStringAlignment.right(columns:)(a1, a2, 0, a3);
}

void *static OSLogStringAlignment.right(columns:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  swift_retain();
  char v11 = a3 & 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a1);
  v9[0] = a1;
  v9[1] = a2;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  char v10 = a3 & 1;
  outlined init with copy of OSLogStringAlignment(v9, a4);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a1);
  return outlined destroy of OSLogStringAlignment(v9);
}

unint64_t lazy protocol witness table accessor for type OSLogCollectionBound and conformance OSLogCollectionBound()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogCollectionBound and conformance OSLogCollectionBound;
  if (!lazy protocol witness table cache variable for type OSLogCollectionBound and conformance OSLogCollectionBound)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogCollectionBound and conformance OSLogCollectionBound);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for OSLogCollectionBound(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1931E3538);
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

ValueMetadata *type metadata accessor for OSLogCollectionBound()
{
  return &type metadata for OSLogCollectionBound;
}

void *destroy for OSLogStringAlignment(void *result)
{
  if (*result) {
    return (void *)swift_release();
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for OSLogStringAlignment(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithCopy for OSLogStringAlignment(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*(void *)a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  swift_retain();
  swift_release();
LABEL_8:
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for OSLogStringAlignment(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*(void *)a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  swift_release();
LABEL_8:
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for OSLogStringAlignment(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 17)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogStringAlignment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogStringAlignment()
{
  return &type metadata for OSLogStringAlignment;
}

uint64_t sub_1931E37A8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t _sSiIegr_SiIegd_TRTA_0()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v2);
  return v2;
}

uint64_t OSLogInterpolation.getStringFormatSpecifier(_:_:_:)(uint64_t a1, os::OSLogPrivacy a2, uint64_t a3, void *a4)
{
  uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1)._countAndFlagsBits;
  os::OSLogPrivacy v8 = a2;
  v9._uint64_t countAndFlagsBits = a3;
  v9._object = a4;
  if ((unint64_t)concatPrivacyAndAttributes(privacy:attributes:)(v8, v9).value._object)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("{", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    static String.+= infix(_:_:)();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if ((*(unsigned char *)(a1 + 16) & 1) == 0)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("-", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = *(void *)a1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(*(void *)a1);
  if (v10)
  {
    swift_release();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("*", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("s", 1uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  return countAndFlagsBits;
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

uint64_t OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  swift_retain();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:align:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:), v8, a3, a4, v9._countAndFlagsBits, v9._object);
  swift_bridgeObjectRelease();
  return swift_release();
}

{
  uint64_t v8;

  swift_retain();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  OSLogInterpolation.appendInterpolation(_:align:privacy:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:), v8, a3, a4);
  return swift_release();
}

uint64_t sub_1931E3BAC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t vars8;

  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 16))();

  return MEMORY[0x1F4186318](v1, 0);
}

uint64_t OSLogInterpolation.appendInterpolation(_:align:privacy:attributes:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v7 = v6;
  unsigned __int8 v14 = *(unsigned char *)(v7 + 25);
  uint64_t result = maxOSLogArgumentCount.getter();
  if (v14 < result)
  {
    memcpy(__dst, (const void *)v7, sizeof(__dst));
    outlined retain of OSLogInterpolation((uint64_t)__dst);
    os::OSLogPrivacy v16 = (os::OSLogPrivacy)a4;
    OSLogInterpolation.getStringFormatSpecifier(_:_:_:)((uint64_t)a3, v16, a5, a6);
    outlined release of OSLogInterpolation((uint64_t)__dst);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    uint64_t v17 = *a3;
    uint64_t v18 = a3[1];
    outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v17);
    if (v17)
    {
      OSLogInterpolation.appendAlignmentArgument(_:)(v17, v18);
      swift_release();
    }
    if (*(unsigned char *)(a4 + 1) != 1)
    {
      os::OSLogPrivacy v19 = (os::OSLogPrivacy)a4;
      OSLogInterpolation.appendMaskArgument(_:)(v19);
    }
    os::OSLogPrivacy v20 = (os::OSLogPrivacy)a4;
    OSLogInterpolation.addStringHeaders(_:)(v20);
    uint64_t result = OSLogArguments.append(_:)(a1, a2);
    unsigned int v21 = *(unsigned __int8 *)(v7 + 25) + 1;
    if ((v21 >> 8))
    {
      __break(1u);
    }
    else
    {
      *(unsigned char *)(v7 + 25) = v21;
      uint64_t v22 = *(void *)(v7 + 40);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      char v25 = v23;
      if ((v25 & 1) == 0)
      {
        *(void *)(v7 + 40) = v24;
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall OSLogInterpolation.addStringHeaders(_:)(os::OSLogPrivacy a1)
{
  uint64_t v2 = v1;
  memcpy(__dst, v1, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  char v13 = 2;
  os::OSLogPrivacy v4 = a1;
  Swift::UInt8 v5 = OSLogInterpolation.getArgumentHeader(privacy:type:)(v4, (os::OSLogInterpolation::ArgumentType)&v13);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v5);
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  OSLogArguments.append(_:)(v12);
  uint64_t v6 = v1[4];
  BOOL v7 = __OFADD__(v6, 10);
  uint64_t v8 = v6 + 10;
  char v9 = v7;
  if (v9)
  {
    __break(1u);
  }
  else
  {
    v1[4] = v8;
    memcpy(v14, v1, sizeof(v14));
    outlined retain of OSLogInterpolation((uint64_t)v14);
    os::OSLogPrivacy v10 = a1;
    Swift::UInt8 v11 = OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(v10, 0);
    outlined release of OSLogInterpolation((uint64_t)v14);
    *((unsigned char *)v2 + 24) = v11;
  }
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

uint64_t partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || &__dst[__n] > __src && &__src[__n] > __dst)
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
        return MEMORY[0x1E4FBC860];
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
    return MEMORY[0x1E4FBC860];
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
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
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
    os::OSLogPrivacy v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    os::OSLogPrivacy v10 = (char *)MEMORY[0x1E4FBC860];
  }
  Swift::UInt8 v12 = v10 + 32;
  char v13 = (char *)(a4 + 32);
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
  if ((__n & 0x8000000000000000) != 0 || &__dst[__n] > __src && &__src[__n] > __dst)
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
    __int16 __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

Swift::String __swiftcall OSLogInterpolation.getExtendedFormatSpecifier(_:_:_:)(os::OSLogInt32ExtendedFormat a1, os::OSLogPrivacy a2, Swift::String a3)
{
  object = a3._object;
  uint64_t countAndFlagsBits = a3._countAndFlagsBits;
  unint64_t v6 = (unsigned char *)a1;
  Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%{", 2uLL, 1);
  switch(*v6)
  {
    case 0:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("network:in_addr", 0xFuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 1:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("time_t", 6uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 2:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("darwin.errno", 0xCuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 3:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("darwin.mode", 0xBuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 4:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("darwin.signal", 0xDuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 5:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mach.errno", 0xAuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 6:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bitrate", 7uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 7:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("iec-bitrate", 0xBuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 8:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bytes", 5uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 9:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("iec-bytes", 9uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 0xA:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("BOOL", 4uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 0xB:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("BOOL", 4uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  os::OSLogPrivacy v8 = a2;
  v9._uint64_t countAndFlagsBits = countAndFlagsBits;
  v9._object = object;
  if ((unint64_t)concatPrivacyAndAttributes(privacy:attributes:)(v8, v9).value._object)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(",", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}d", 2uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  uint64_t v10 = v7._countAndFlagsBits;
  size_t v11 = v7._object;
  result._object = v11;
  result._uint64_t countAndFlagsBits = v10;
  return result;
}

BOOL static OSLogBoolFormat.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void OSLogBoolFormat.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int OSLogBoolFormat.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL static OSLogIntExtendedFormat.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OSLogIntExtendedFormat.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:privacy:)(uint64_t a1, uint64_t a2, os::OSLogInt32ExtendedFormat a3, uint64_t a4)
{
  swift_retain();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:format:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:), v8, a3, a4, v9._countAndFlagsBits, v9._object);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1931E4CF8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:privacy:attributes:)(uint64_t a1, uint64_t a2, os::OSLogInt32ExtendedFormat a3, uint64_t a4, uint64_t a5, void *a6)
{
  Swift::String v7 = v6;
  unsigned __int8 v14 = v7[25];
  uint64_t result = maxOSLogArgumentCount.getter();
  if (v14 < result)
  {
    memcpy(__dst, v7, sizeof(__dst));
    outlined retain of OSLogInterpolation((uint64_t)__dst);
    os::OSLogPrivacy v16 = (os::OSLogPrivacy)a4;
    v17._uint64_t countAndFlagsBits = a5;
    v17._object = a6;
    OSLogInterpolation.getExtendedFormatSpecifier(_:_:_:)(a3, v16, v17);
    outlined release of OSLogInterpolation((uint64_t)__dst);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a4 + 1) != 1)
    {
      os::OSLogPrivacy v18 = (os::OSLogPrivacy)a4;
      OSLogInterpolation.appendMaskArgument(_:)(v18);
    }
    os::OSLogPrivacy v19 = (os::OSLogPrivacy)a4;
    OSLogInterpolation.addIntHeaders(_:_:)(v19, 4);
    swift_retain();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = a1;
    *(void *)(v20 + 24) = a2;
    unint64_t v21 = lazy protocol witness table accessor for type Int32 and conformance Int32();
    OSLogArguments.append<A>(_:)((uint64_t)_ss5Int32VIegd_ABIegr_TRTA_0, v20, MEMORY[0x1E4FBC150], v21);
    uint64_t result = swift_release();
    int v23 = v7[25];
    uint64_t v22 = v7 + 25;
    char v24 = v23 + 1;
    if (((v23 + 1) >> 8)) {
      __break(1u);
    }
    else {
      unsigned char *v22 = v24;
    }
  }
  return result;
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:privacy:)(uint64_t a1, uint64_t a2, os::OSLogBoolFormat a3, uint64_t a4)
{
  swift_retain();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  memcpy(__dst, v4, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  OSLogInterpolation.getInt32BoolFormat(_:)(a3);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogInterpolation.appendInterpolation(_:format:privacy:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:), v9, (os::OSLogInt32ExtendedFormat)&v11, a4);
  return swift_release();
}

os::OSLogInt32ExtendedFormat __swiftcall OSLogInterpolation.getInt32BoolFormat(_:)(os::OSLogInt32ExtendedFormat result)
{
  if (*(unsigned char *)result) {
    *Swift::UInt v1 = 11;
  }
  else {
    *Swift::UInt v1 = 10;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogBoolFormat and conformance OSLogBoolFormat()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogBoolFormat and conformance OSLogBoolFormat;
  if (!lazy protocol witness table cache variable for type OSLogBoolFormat and conformance OSLogBoolFormat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogBoolFormat and conformance OSLogBoolFormat);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogInt32ExtendedFormat and conformance OSLogInt32ExtendedFormat()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogInt32ExtendedFormat and conformance OSLogInt32ExtendedFormat;
  if (!lazy protocol witness table cache variable for type OSLogInt32ExtendedFormat and conformance OSLogInt32ExtendedFormat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogInt32ExtendedFormat and conformance OSLogInt32ExtendedFormat);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogIntExtendedFormat and conformance OSLogIntExtendedFormat()
{
  unint64_t result = lazy protocol witness table cache variable for type OSLogIntExtendedFormat and conformance OSLogIntExtendedFormat;
  if (!lazy protocol witness table cache variable for type OSLogIntExtendedFormat and conformance OSLogIntExtendedFormat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogIntExtendedFormat and conformance OSLogIntExtendedFormat);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for OSLogBoolFormat(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1931E51ECLL);
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

ValueMetadata *type metadata accessor for OSLogBoolFormat()
{
  return &type metadata for OSLogBoolFormat;
}

uint64_t getEnumTagSinglePayload for OSLogInt32ExtendedFormat(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OSLogInt32ExtendedFormat(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1931E5380);
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

ValueMetadata *type metadata accessor for OSLogInt32ExtendedFormat()
{
  return &type metadata for OSLogInt32ExtendedFormat;
}

unsigned char *storeEnumTagSinglePayload for OSLogIntExtendedFormat(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1931E5484);
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

ValueMetadata *type metadata accessor for OSLogIntExtendedFormat()
{
  return &type metadata for OSLogIntExtendedFormat;
}

uint64_t _ss5Int32VIegd_ABIegr_TRTA_0@<X0>(_DWORD *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int32)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_retain();
  Swift::UInt8 v12 = (void *)swift_allocObject();
  v12[2] = a5;
  void v12[3] = a6;
  void v12[4] = a1;
  v12[5] = a2;
  OSLogInterpolation.appendInterpolation(_:align:privacy:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:), (uint64_t)v12, a3, a4);
  return swift_release();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  uint64_t v5 = (void (*)(void))MEMORY[0x1F4188790](a1);
  BOOL v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5();
  uint64_t v8 = dispatch thunk of CustomStringConvertible.description.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, a3);
  return v8;
}

uint64_t sub_1931E5670()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v0[4], v0[5], v0[2]);
}

uint64_t sub_1931E574C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

Swift::String __swiftcall Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinExtendedGraphemeClusterLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = MEMORY[0x1F4183670](_builtinExtendedGraphemeClusterLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t UnsafeBufferPointer.init(start:count:)()
{
  return MEMORY[0x1F4183850]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1F41838B8]();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = MEMORY[0x1F4183978](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t static String.== infix(_:_:)()
{
  return MEMORY[0x1F4183990]();
}

uint64_t static String.+= infix(_:_:)()
{
  return MEMORY[0x1F4183998]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x1F4183A68]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t Sequence<>.joined(separator:)()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x1F4183D00]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x1F4184420]();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x1F41845F8]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x1F4184618]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1F4184820]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x1F4184950]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x1F4184CC0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t __VaListBuilder.deallocStorage(wordCount:storage:)()
{
  return MEMORY[0x1F4185030]();
}

uint64_t __VaListBuilder.va_list()()
{
  return MEMORY[0x1F4185038]();
}

uint64_t type metadata accessor for __VaListBuilder()
{
  return MEMORY[0x1F4185040]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x1F41850E0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185298]();
}

{
  return MEMORY[0x1F41852A0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185398]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1F4185570]();
}

{
  return MEMORY[0x1F41855D8]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1F4185698]();
}

{
  return MEMORY[0x1F4185700]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x1F4185A28]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
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

uint64_t dispatch thunk of CVarArg._cVarArgEncoding.getter()
{
  return MEMORY[0x1F4185FA0]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t Unicode.Scalar.withUTF8CodeUnits<A>(_:)()
{
  return MEMORY[0x1F41860F8]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x1F40C9FE8]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x1F40C9FF0]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_signpost_pack_fill()
{
  return MEMORY[0x1F40CA068]();
}

uint64_t _os_signpost_pack_send()
{
  return MEMORY[0x1F40CA070]();
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

uint64_t os_log_pack_send()
{
  return MEMORY[0x1F40CD378]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_workgroup_cancel(os_workgroup_t wg)
{
}

int os_workgroup_copy_port(os_workgroup_t wg, mach_port_t *mach_port_out)
{
  return MEMORY[0x1F40CD698](wg, mach_port_out);
}

os_workgroup_t os_workgroup_create_with_port(const char *name, mach_port_t mach_port)
{
  return (os_workgroup_t)MEMORY[0x1F40CD6A8](name, *(void *)&mach_port);
}

os_workgroup_t os_workgroup_create_with_workgroup(const char *name, os_workgroup_t wg)
{
  return (os_workgroup_t)MEMORY[0x1F40CD6B0](name, wg);
}

void *__cdecl os_workgroup_get_working_arena(os_workgroup_t wg, os_workgroup_index *index_out)
{
  return (void *)MEMORY[0x1F40CD6B8](wg, index_out);
}

int os_workgroup_interval_finish(os_workgroup_interval_t wg, os_workgroup_interval_data_t data)
{
  return MEMORY[0x1F40CD6E0](wg, data);
}

int os_workgroup_interval_start(os_workgroup_interval_t wg, uint64_t start, uint64_t deadline, os_workgroup_interval_data_t data)
{
  return MEMORY[0x1F40CD6E8](wg, start, deadline, data);
}

int os_workgroup_interval_update(os_workgroup_interval_t wg, uint64_t deadline, os_workgroup_interval_data_t data)
{
  return MEMORY[0x1F40CD6F0](wg, deadline, data);
}

int os_workgroup_join(os_workgroup_t wg, os_workgroup_join_token_t token_out)
{
  return MEMORY[0x1F40CD6F8](wg, token_out);
}

void os_workgroup_leave(os_workgroup_t wg, os_workgroup_join_token_t token)
{
}

int os_workgroup_max_parallel_threads(os_workgroup_t wg, os_workgroup_mpt_attr_t attr)
{
  return MEMORY[0x1F40CD708](wg, attr);
}

os_workgroup_parallel_t os_workgroup_parallel_create(const char *name, os_workgroup_attr_t attr)
{
  return (os_workgroup_parallel_t)MEMORY[0x1F40CD710](name, attr);
}

int os_workgroup_set_working_arena(os_workgroup_t wg, void *arena, uint32_t max_workers, os_workgroup_working_arena_destructor_t destructor)
{
  return MEMORY[0x1F40CD718](wg, arena, *(void *)&max_workers, destructor);
}

BOOL os_workgroup_testcancel(os_workgroup_t wg)
{
  return MEMORY[0x1F40CD720](wg);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
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

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}