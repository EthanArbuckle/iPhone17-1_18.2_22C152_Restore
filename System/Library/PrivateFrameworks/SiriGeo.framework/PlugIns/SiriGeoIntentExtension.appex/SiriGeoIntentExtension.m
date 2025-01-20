id one-time initialization function for deleteParkingLocationHandler(uint64_t a1)
{
  return one-time initialization function for deleteParkingLocationHandler(a1, (uint64_t (*)(void))&type metadata accessor for INDeleteParkingLocationIntentHandler, &static IntentHandler.deleteParkingLocationHandler);
}

id one-time initialization function for retrieveParkingLocationHandler(uint64_t a1)
{
  return one-time initialization function for deleteParkingLocationHandler(a1, (uint64_t (*)(void))&type metadata accessor for INRetrieveParkingLocationIntentHandler, &static IntentHandler.retrieveParkingLocationHandler);
}

id one-time initialization function for saveParkingLocationHandler(uint64_t a1)
{
  return one-time initialization function for deleteParkingLocationHandler(a1, (uint64_t (*)(void))&type metadata accessor for INSaveParkingLocationIntentHandler, &static IntentHandler.saveParkingLocationHandler);
}

id one-time initialization function for shareETAHandler(uint64_t a1)
{
  return one-time initialization function for deleteParkingLocationHandler(a1, (uint64_t (*)(void))&type metadata accessor for INShareETAIntentHandler, &static IntentHandler.shareETAHandler);
}

id one-time initialization function for stopShareETAHandler(uint64_t a1)
{
  return one-time initialization function for deleteParkingLocationHandler(a1, (uint64_t (*)(void))&type metadata accessor for INStopShareETAIntentHandler, &static IntentHandler.stopShareETAHandler);
}

id one-time initialization function for deleteParkingLocationHandler(uint64_t a1, uint64_t (*a2)(void), void *a3)
{
  id result = [objc_allocWithZone((Class)a2(0)) init];
  *a3 = result;
  return result;
}

uint64_t variable initialization expression of IntentHandler.logObject()
{
  return OS_os_log.init(subsystem:category:)();
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

id IntentHandler.logObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC22SiriGeoIntentExtension13IntentHandler_logObject);
}

uint64_t IntentHandler.handler(for:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  v4 = *(NSObject **)(v2 + OBJC_IVAR____TtC22SiriGeoIntentExtension13IntentHandler_logObject);
  id v5 = a1;
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v6))
  {
    v18 = a2;
    v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)v7 = 136315138;
    id v8 = v5;
    id v9 = [v8 description];
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;

    uint64_t v13 = v10;
    a2 = v18;
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v12, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v6, "IntentHandler intent : %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    if (one-time initialization token for saveParkingLocationHandler != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for INSaveParkingLocationIntentHandler();
    v15 = &static IntentHandler.saveParkingLocationHandler;
  }
  else
  {
    self;
    if (swift_dynamicCastObjCClass())
    {
      if (one-time initialization token for deleteParkingLocationHandler != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for INDeleteParkingLocationIntentHandler();
      v15 = &static IntentHandler.deleteParkingLocationHandler;
    }
    else
    {
      self;
      if (swift_dynamicCastObjCClass())
      {
        if (one-time initialization token for retrieveParkingLocationHandler != -1) {
          swift_once();
        }
        uint64_t v14 = type metadata accessor for INRetrieveParkingLocationIntentHandler();
        v15 = &static IntentHandler.retrieveParkingLocationHandler;
      }
      else
      {
        self;
        if (swift_dynamicCastObjCClass())
        {
          if (one-time initialization token for shareETAHandler != -1) {
            swift_once();
          }
          uint64_t v14 = type metadata accessor for INShareETAIntentHandler();
          v15 = &static IntentHandler.shareETAHandler;
        }
        else
        {
          self;
          if (!swift_dynamicCastObjCClass())
          {
            _assertionFailure(_:_:file:line:flags:)();
            __break(1u);
            return _objc_retain_x1();
          }
          if (one-time initialization token for stopShareETAHandler != -1) {
            swift_once();
          }
          uint64_t v14 = type metadata accessor for INStopShareETAIntentHandler();
          v15 = &static IntentHandler.stopShareETAHandler;
        }
      }
    }
  }
  uint64_t v16 = *v15;
  a2[3] = v14;
  *a2 = v16;

  return _objc_retain_x1();
}

id IntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id IntentHandler.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC22SiriGeoIntentExtension13IntentHandler_logObject;
  type metadata accessor for OS_os_log();
  uint64_t v2 = v0;
  *(void *)&v0[v1] = OS_os_log.init(subsystem:category:)();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v4, "init");
}

id IntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
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
  uint64_t v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
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

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
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
    return &_swiftEmptyArrayStorage;
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

uint64_t static UsoRequest.makeSDAForPromptForContactValue()()
{
  uint64_t v0 = type metadata accessor for Siri_Nlu_External_SystemPrompted();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  unint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v9 - v5;
  type metadata accessor for UsoTaskBuilder_noVerb_common_Person();
  swift_allocObject();
  uint64_t v7 = UsoTaskBuilder_noVerb_common_Person.init()();
  type metadata accessor for UsoEntityBuilder_common_Person();
  swift_allocObject();
  UsoEntityBuilder_common_Person.init()();
  dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)();
  static Siri_Nlu_External_SystemPrompted.from(_:)(v7, (uint64_t)v6);
  Siri_Nlu_External_SystemDialogAct.init()();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  Siri_Nlu_External_SystemDialogAct.prompted.setter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  swift_release();
  return swift_release();
}

uint64_t static Siri_Nlu_External_SystemPrompted.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return static Siri_Nlu_External_SystemPrompted.from(_:)(a1, (void (*)(uint64_t))&Siri_Nlu_External_SystemPrompted.init(), (void (*)(char *))&Siri_Nlu_External_SystemPrompted.target.setter, a2);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemPrompted, (void (*)(uint64_t))&Siri_Nlu_External_SystemDialogAct.init(), (void (*)(char *))&Siri_Nlu_External_SystemDialogAct.prompted.setter);
}

uint64_t outlined init with copy of Siri_Nlu_External_UsoGraph?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static UsoRequest.makeSDAForYesNoCancel()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v25 = type metadata accessor for Siri_Nlu_External_SystemOffered();
  uint64_t v1 = *(void *)(v25 - 8);
  uint64_t v2 = __chkstk_darwin(v25);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v23 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v23 - v8;
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserCancelled();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserAccepted();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v24 = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v23 - v17;
  Siri_Nlu_External_UserDialogAct.init()();
  Siri_Nlu_External_UserAccepted.init()();
  Siri_Nlu_External_UserDialogAct.accepted.setter();
  Siri_Nlu_External_UserCancelled.init()();
  Siri_Nlu_External_UserDialogAct.cancelled.setter();
  Siri_Nlu_External_SystemOffered.init()();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  Siri_Nlu_External_SystemOffered.offeredAct.setter();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  uint64_t v20 = v25;
  v19(v7, v9, v25);
  Siri_Nlu_External_SystemDialogAct.init()();
  v19(v4, v7, v20);
  Siri_Nlu_External_SystemDialogAct.offered.setter();
  v21 = *(void (**)(char *, uint64_t))(v1 + 8);
  v21(v7, v20);
  v21(v9, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v24);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemOffered:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemOffered, (void (*)(uint64_t))&Siri_Nlu_External_SystemDialogAct.init(), (void (*)(char *))&Siri_Nlu_External_SystemDialogAct.offered.setter);
}

uint64_t Siri_Nlu_External_SystemGaveOptions.init(choices:)()
{
  return Siri_Nlu_External_SystemGaveOptions.choices.setter();
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(gaveOptions:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemGaveOptions, (void (*)(uint64_t))&Siri_Nlu_External_SystemDialogAct.init(), (void (*)(char *))&Siri_Nlu_External_SystemDialogAct.gaveOptions.setter);
}

uint64_t Siri_Nlu_External_UserDialogAct.init(_:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserStatedTask, (void (*)(uint64_t))&Siri_Nlu_External_UserDialogAct.init(), (void (*)(char *))&Siri_Nlu_External_UserDialogAct.userStatedTask.setter);
}

{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserWantedToProceed, (void (*)(uint64_t))&Siri_Nlu_External_UserDialogAct.init(), (void (*)(char *))&Siri_Nlu_External_UserDialogAct.wantedToProceed.setter);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(uint64_t a1, uint64_t (*a2)(void), void (*a3)(uint64_t), void (*a4)(char *))
{
  uint64_t v7 = a2(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin();
  uint64_t v11 = (char *)&v13 - v10;
  a3(v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  a4(v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

uint64_t static Siri_Nlu_External_UserDialogAct.from(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v10 - v7;
  static Siri_Nlu_External_UserStatedTask.from(_:)(a1, (uint64_t)&v10 - v7);
  Siri_Nlu_External_UserDialogAct.init()();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t static Siri_Nlu_External_UserStatedTask.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v25 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v26 = (char *)&v24 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v24 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v24 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoBuilderOptions?);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1000076C0;
  *(void *)(v20 + 32) = a1;
  uint64_t v28 = v20;
  specialized Array._endMutation()();
  uint64_t v21 = type metadata accessor for UsoBuilderOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v19, 1, 1, v21);
  swift_retain();
  static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)();
  swift_bridgeObjectRelease();
  outlined destroy of UsoBuilderOptions?((uint64_t)v19, &demangling cache variable for type metadata for UsoBuilderOptions?);
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v16, 0, 1, v3);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v16, (uint64_t)v14);
  Siri_Nlu_External_UserStatedTask.init()();
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v14, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v11, 1, v3) == 1)
  {
    outlined destroy of UsoBuilderOptions?((uint64_t)v14, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of UsoBuilderOptions?((uint64_t)v11, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    v22 = v26;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v26, v11, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v25, v22, v3);
    Siri_Nlu_External_UserStatedTask.task.setter();
    outlined destroy of UsoBuilderOptions?((uint64_t)v14, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v22, v3);
  }
  swift_release();
  return outlined destroy of UsoBuilderOptions?((uint64_t)v16, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t static Siri_Nlu_External_UserDialogAct.from(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  v30 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v31 = (char *)&v29 - v5;
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  v32 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v29 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v29 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v29 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v29 - v22;
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v23, 0, 1, v1);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v23, (uint64_t)v21);
  Siri_Nlu_External_UserStatedTask.init()();
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v21, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v18, 1, v1) == 1)
  {
    outlined destroy of UsoBuilderOptions?((uint64_t)v21, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of UsoBuilderOptions?((uint64_t)v18, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    uint64_t v24 = v31;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v31, v18, v1);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v30, v24, v1);
    Siri_Nlu_External_UserStatedTask.task.setter();
    outlined destroy of UsoBuilderOptions?((uint64_t)v21, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v24, v1);
  }
  uint64_t v25 = v32;
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v26(v12, v14, v6);
  Siri_Nlu_External_UserDialogAct.init()();
  v26(v25, v12, v6);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v7 + 8);
  v27(v12, v6);
  v27(v14, v6);
  return outlined destroy of UsoBuilderOptions?((uint64_t)v23, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t Siri_Nlu_External_UserStatedTask.init(_:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v13 - v10;
  Siri_Nlu_External_UserStatedTask.init()();
  outlined init with copy of Siri_Nlu_External_UsoGraph?(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    outlined destroy of UsoBuilderOptions?(a1, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    return outlined destroy of UsoBuilderOptions?((uint64_t)v4, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    Siri_Nlu_External_UserStatedTask.task.setter();
    outlined destroy of UsoBuilderOptions?(a1, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
}

unint64_t Siri_Nlu_External_UserDialogAct.usoTask.getter()
{
  unint64_t result = static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)();
  unint64_t v1 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v2) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v2)
    {
LABEL_6:
      swift_bridgeObjectRelease();
      return v2;
    }
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_6;
  }
  if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v2 = *(void *)(v1 + 32);
    swift_retain();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t Siri_Nlu_External_UserDialogAct.contactId.getter()
{
  uint64_t v41 = type metadata accessor for Google_Protobuf_StringValue();
  uint64_t v43 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  v40 = (char *)&v36 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1 = type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v36 - v5;
  uint64_t v7 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoEntityIdentifier?);
  __chkstk_darwin(v15 - 8);
  v38 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
  Siri_Nlu_External_UserStatedTask.task.getter();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v17 = Siri_Nlu_External_UsoGraph.identifiers.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v18 = *(void *)(v17 + 16);
  if (!v18)
  {
    uint64_t v32 = 1;
LABEL_15:
    uint64_t v33 = (uint64_t)v38;
    goto LABEL_18;
  }
  uint64_t v36 = v17;
  uint64_t v37 = v2;
  uint64_t v19 = v2 + 16;
  uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
  unint64_t v21 = v17 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
  uint64_t v22 = (void (**)(char *, uint64_t))(v19 - 8);
  v39 = (void (**)(char *, uint64_t))(v43 + 8);
  uint64_t v43 = *(void *)(v19 + 56);
  swift_bridgeObjectRetain();
  uint64_t v23 = v42;
  while (1)
  {
    v20(v6, v21, v1);
    if (Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter() == 0x73746361746E6F43
      && v25 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      v20(v23, (unint64_t)v6, v1);
    }
    else
    {
      char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      v20(v23, (unint64_t)v6, v1);
      if ((v26 & 1) == 0)
      {
        uint64_t v24 = *v22;
        (*v22)(v23, v1);
        goto LABEL_4;
      }
    }
    uint64_t v27 = v40;
    Siri_Nlu_External_UsoEntityIdentifier.namespace.getter();
    uint64_t v28 = Google_Protobuf_StringValue.value.getter();
    uint64_t v30 = v29;
    (*v39)(v27, v41);
    if (v28 == 0x64695F6D657469 && v30 == 0xE700000000000000) {
      break;
    }
    char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t v24 = *v22;
    uint64_t v23 = v42;
    (*v22)(v42, v1);
    if (v31) {
      goto LABEL_17;
    }
LABEL_4:
    v24(v6, v1);
    v21 += v43;
    if (!--v18)
    {
      swift_bridgeObjectRelease();
      uint64_t v32 = 1;
      uint64_t v2 = v37;
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
  (*v22)(v42, v1);
LABEL_17:
  swift_bridgeObjectRelease();
  uint64_t v2 = v37;
  uint64_t v33 = (uint64_t)v38;
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v38, v6, v1);
  uint64_t v32 = 0;
LABEL_18:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v33, v32, 1, v1);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v33, 1, v1) == 1)
  {
    outlined destroy of UsoBuilderOptions?(v33, &demangling cache variable for type metadata for Siri_Nlu_External_UsoEntityIdentifier?);
    return 0;
  }
  else
  {
    uint64_t v34 = Siri_Nlu_External_UsoEntityIdentifier.value.getter();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v33, v1);
  }
  return v34;
}

uint64_t UsoIdentifierAppBundle.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000015;
  }
  else {
    return 0x73746361746E6F43;
  }
}

uint64_t UsoIdentifierNamespace.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x64695F6D657469;
  }
  if (a1 == 1) {
    return 0xD000000000000012;
  }
  return 0x6369746E616D6573;
}

uint64_t outlined destroy of UsoBuilderOptions?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t static Siri_Nlu_External_UserWantedToProceed.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return static Siri_Nlu_External_SystemPrompted.from(_:)(a1, (void (*)(uint64_t))&Siri_Nlu_External_UserWantedToProceed.init(), (void (*)(char *))&Siri_Nlu_External_UserWantedToProceed.reference.setter, a2);
}

uint64_t static Siri_Nlu_External_SystemPrompted.from(_:)@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, void (*a3)(char *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v29 = a3;
  uint64_t v30 = a2;
  uint64_t v31 = a4;
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v28 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoBuilderOptions?);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v28 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v28 - v21;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1000076C0;
  *(void *)(v23 + 32) = a1;
  uint64_t v32 = v23;
  specialized Array._endMutation()();
  uint64_t v24 = type metadata accessor for UsoBuilderOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v13, 1, 1, v24);
  swift_retain();
  static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)();
  swift_bridgeObjectRelease();
  outlined destroy of UsoBuilderOptions?((uint64_t)v13, &demangling cache variable for type metadata for UsoBuilderOptions?);
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v22, 0, 1, v5);
  uint64_t v25 = outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v22, (uint64_t)v20);
  v30(v25);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v20, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v17, 1, v5) == 1)
  {
    outlined destroy of UsoBuilderOptions?((uint64_t)v20, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of UsoBuilderOptions?((uint64_t)v17, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v10, v17, v5);
    char v26 = v28;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v28, v10, v5);
    v29(v26);
    outlined destroy of UsoBuilderOptions?((uint64_t)v20, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  return outlined destroy of UsoBuilderOptions?((uint64_t)v22, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t static Siri_Nlu_External_SystemOffered.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v18[0] = a1;
  v18[1] = a2;
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v18 - v7;
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v18 - v14;
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v16(v8, (char *)v18[0], v2);
  Siri_Nlu_External_UserDialogAct.init()();
  v16(v6, v8, v2);
  Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  Siri_Nlu_External_SystemOffered.init()();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  Siri_Nlu_External_SystemOffered.offeredAct.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

SiriGeoIntentExtension::UsoIdentifierAppBundle_optional __swiftcall UsoIdentifierAppBundle.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierAppBundle.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = SiriGeoIntentExtension_UsoIdentifierAppBundle_siriNL;
  }
  else {
    v4.value = SiriGeoIntentExtension_UsoIdentifierAppBundle_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UsoIdentifierAppBundle(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = UsoIdentifierAppBundle.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == UsoIdentifierAppBundle.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UsoIdentifierAppBundle()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierAppBundle.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UsoIdentifierAppBundle()
{
  return specialized RawRepresentable<>.hash(into:)();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UsoIdentifierAppBundle()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierAppBundle.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UsoIdentifierAppBundle@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierAppBundle.init(rawValue:), *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UsoIdentifierAppBundle@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UsoIdentifierAppBundle.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UsoIdentifierNamespace(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = UsoIdentifierNamespace.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == UsoIdentifierNamespace.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UsoIdentifierNamespace()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierNamespace.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UsoIdentifierNamespace()
{
  UsoIdentifierNamespace.rawValue.getter(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UsoIdentifierNamespace()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierNamespace.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UsoIdentifierNamespace@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized UsoIdentifierNamespace.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UsoIdentifierNamespace@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UsoIdentifierNamespace.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t specialized UsoIdentifierNamespace.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierNamespace.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle()
{
  unint64_t result = lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle;
  if (!lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace()
{
  unint64_t result = lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace;
  if (!lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace);
  }
  return result;
}

ValueMetadata *type metadata accessor for UsoRequest()
{
  return &type metadata for UsoRequest;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UsoIdentifierAppBundle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UsoIdentifierAppBundle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006D84);
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

uint64_t getEnumTag for UsoIdentifierAppBundle(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for UsoIdentifierAppBundle(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UsoIdentifierAppBundle()
{
  return &type metadata for UsoIdentifierAppBundle;
}

uint64_t getEnumTagSinglePayload for UsoIdentifierNamespace(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UsoIdentifierNamespace(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006F30);
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

unsigned char *destructiveInjectEnumTag for UsoIdentifierNamespace(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UsoIdentifierNamespace()
{
  return &type metadata for UsoIdentifierNamespace;
}

uint64_t Siri_Nlu_External_UsoGraph.identifiers.getter()
{
  return Siri_Nlu_External_UsoGraph.identifiers.getter();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return type metadata accessor for Siri_Nlu_External_UsoGraph();
}

uint64_t Siri_Nlu_External_UserAccepted.init()()
{
  return Siri_Nlu_External_UserAccepted.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserAccepted()
{
  return type metadata accessor for Siri_Nlu_External_UserAccepted();
}

uint64_t Siri_Nlu_External_SystemOffered.offeredAct.setter()
{
  return Siri_Nlu_External_SystemOffered.offeredAct.setter();
}

uint64_t Siri_Nlu_External_SystemOffered.init()()
{
  return Siri_Nlu_External_SystemOffered.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemOffered()
{
  return type metadata accessor for Siri_Nlu_External_SystemOffered();
}

uint64_t Siri_Nlu_External_UserCancelled.init()()
{
  return Siri_Nlu_External_UserCancelled.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserCancelled()
{
  return type metadata accessor for Siri_Nlu_External_UserCancelled();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.setter()
{
  return Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
}

uint64_t Siri_Nlu_External_UserDialogAct.wantedToProceed.setter()
{
  return Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
}

uint64_t Siri_Nlu_External_UserDialogAct.accepted.setter()
{
  return Siri_Nlu_External_UserDialogAct.accepted.setter();
}

uint64_t Siri_Nlu_External_UserDialogAct.cancelled.setter()
{
  return Siri_Nlu_External_UserDialogAct.cancelled.setter();
}

uint64_t Siri_Nlu_External_UserDialogAct.init()()
{
  return Siri_Nlu_External_UserDialogAct.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return type metadata accessor for Siri_Nlu_External_UserDialogAct();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemPrompted()
{
  return type metadata accessor for Siri_Nlu_External_SystemPrompted();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return Siri_Nlu_External_UserStatedTask.task.getter();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.setter()
{
  return Siri_Nlu_External_UserStatedTask.task.setter();
}

uint64_t Siri_Nlu_External_UserStatedTask.init()()
{
  return Siri_Nlu_External_UserStatedTask.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return type metadata accessor for Siri_Nlu_External_UserStatedTask();
}

uint64_t Siri_Nlu_External_SystemDialogAct.offered.setter()
{
  return Siri_Nlu_External_SystemDialogAct.offered.setter();
}

uint64_t Siri_Nlu_External_SystemDialogAct.prompted.setter()
{
  return Siri_Nlu_External_SystemDialogAct.prompted.setter();
}

uint64_t Siri_Nlu_External_SystemDialogAct.init()()
{
  return Siri_Nlu_External_SystemDialogAct.init()();
}

uint64_t Siri_Nlu_External_SystemGaveOptions.choices.setter()
{
  return Siri_Nlu_External_SystemGaveOptions.choices.setter();
}

uint64_t Siri_Nlu_External_SystemGaveOptions.init()()
{
  return Siri_Nlu_External_SystemGaveOptions.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserWantedToProceed()
{
  return type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter()
{
  return Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.value.getter()
{
  return Siri_Nlu_External_UsoEntityIdentifier.value.getter();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.namespace.getter()
{
  return Siri_Nlu_External_UsoEntityIdentifier.namespace.getter();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier()
{
  return type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier();
}

uint64_t static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)();
}

uint64_t static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)()
{
  return static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
}

uint64_t dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)();
}

uint64_t static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)()
{
  return static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)();
}

uint64_t type metadata accessor for UsoBuilderOptions()
{
  return type metadata accessor for UsoBuilderOptions();
}

uint64_t UsoEntityBuilder_common_Person.init()()
{
  return UsoEntityBuilder_common_Person.init()();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Person()
{
  return type metadata accessor for UsoEntityBuilder_common_Person();
}

uint64_t UsoTaskBuilder_noVerb_common_Person.init()()
{
  return UsoTaskBuilder_noVerb_common_Person.init()();
}

uint64_t type metadata accessor for UsoTaskBuilder_noVerb_common_Person()
{
  return type metadata accessor for UsoTaskBuilder_noVerb_common_Person();
}

uint64_t Google_Protobuf_StringValue.value.getter()
{
  return Google_Protobuf_StringValue.value.getter();
}

uint64_t type metadata accessor for Google_Protobuf_StringValue()
{
  return type metadata accessor for Google_Protobuf_StringValue();
}

uint64_t type metadata accessor for INShareETAIntentHandler()
{
  return type metadata accessor for INShareETAIntentHandler();
}

uint64_t type metadata accessor for INStopShareETAIntentHandler()
{
  return type metadata accessor for INStopShareETAIntentHandler();
}

uint64_t type metadata accessor for INSaveParkingLocationIntentHandler()
{
  return type metadata accessor for INSaveParkingLocationIntentHandler();
}

uint64_t type metadata accessor for INDeleteParkingLocationIntentHandler()
{
  return type metadata accessor for INDeleteParkingLocationIntentHandler();
}

uint64_t type metadata accessor for INRetrieveParkingLocationIntentHandler()
{
  return type metadata accessor for INRetrieveParkingLocationIntentHandler();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
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

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
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

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}