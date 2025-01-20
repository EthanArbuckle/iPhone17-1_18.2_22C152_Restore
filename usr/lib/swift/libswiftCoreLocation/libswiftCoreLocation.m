unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for CLLocationUpdate()
{
  return &type metadata for CLLocationUpdate;
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance CLMonitor.Events.Iterator()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t getEnumTag for CLMonitor.BeaconIdentityCondition.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unsigned char *destructiveInjectEnumTag for CLMonitor.BeaconIdentityCondition.CodingKeys(unsigned char *result, char a2)
{
  *result = a2;
  return result;
}

id partial apply for closure #2 in CLLocationUpdate.Updates.init(updater:isHistorical:)(uint64_t a1)
{
  return closure #2 in CLLocationUpdate.Updates.init(updater:isHistorical:)(a1, *(void **)(v1 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

ValueMetadata *type metadata accessor for CLLocationUpdate.LiveConfiguration()
{
  return &type metadata for CLLocationUpdate.LiveConfiguration;
}

void type metadata completion function for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(void, ValueMetadata *))
{
  type metadata accessor for AsyncStream<CLLocationUpdate>(319, a4, a5);
  if (v5 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for AsyncStream<CLLocationUpdate>(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, ValueMetadata *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for CLLocationUpdate);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

id CLLocationUpdate.authorizationDenied.getter()
{
  return [*v0 sel_authorizationDenied];
}

void type metadata completion function for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void type metadata completion function for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v0;

  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v0;

  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v0;

  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
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

id closure #2 in CLLocationUpdate.Updates.init(updater:isHistorical:)(uint64_t a1, void *a2)
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)logger);
  unint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2127EE000, v4, v5, "#LocationUpdates terminating", v6, 2u);
    MEMORY[0x216681E40](v6, -1, -1);
  }

  return [a2 pause];
}

void destroy for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  os_log_type_t v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t destroy for CLLocationUpdate.Updates.Iterator(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_release();
}

void thunk for @escaping @callee_guaranteed (@guaranteed CLUpdate?) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void partial apply for closure #1 in CLLocationUpdate.Updates.init(updater:isHistorical:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation);
  char v3 = *(unsigned char *)(v1 + 16);

  closure #1 in CLLocationUpdate.Updates.init(updater:isHistorical:)(a1, v3);
}

uint64_t CLLocationUpdate.Updates.Iterator.next()()
{
  uint64_t v14 = v0;
  uint64_t v1 = *(void **)(v0 + 16);
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)logger);
  id v3 = v1;
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = v7;
    *(_DWORD *)v6 = 136380675;
    *(void *)(v0 + 24) = v1;
    id v8 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLLocationUpdate?);
    uint64_t v9 = String.init<A>(describing:)();
    *(void *)(v0 + 32) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2127EE000, v4, v5, "#LocationUpdates Iterator.next value: %{private}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x216681E40](v7, -1, -1);
    MEMORY[0x216681E40](v6, -1, -1);
  }
  else
  {
  }
  **(void **)(v0 + 40) = v1;
  v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;

  [*(id *)(*(void *)(*(void *)(v0 + 48)+ *(int *)(type metadata accessor for CLLocationUpdate.Updates.Iterator(0) + 20))+ 16) sel_resume];
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
  *uint64_t v1 = v0;
  v1[1] = CLLocationUpdate.Updates.Iterator.next();
  return MEMORY[0x270FA1F70](v0 + 16, v2);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return MEMORY[0x270FA2498](CLLocationUpdate.Updates.Iterator.next(), 0, 0);
}

void static CLLocationUpdate.liveUpdates(_:)(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v2 = *a1;
  CLLocationUpdate.Updates.init(_:configuration:)(0, &v2, a2);
}

void CLLocationUpdate.Updates.init(_:configuration:)(void *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a2;
  if (a1) {
    id v6 = [a1 sel_liveUpdaterWithConfiguration_queue_handler_:v5, 0, 0];
  }
  else {
    id v6 = [self liveUpdaterWithConfiguration:v5 queue:0 handler:0];
  }
  id v7 = v6;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)logger);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v16 = v12;
    *(_DWORD *)v11 = 136315138;
    uint64_t v13 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2127EE000, v9, v10, "#LocationUpdates Creating liveUpdates %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x216681E40](v12, -1, -1);
    MEMORY[0x216681E40](v11, -1, -1);
  }

  if (v7)
  {
    id v15 = v7;
    CLLocationUpdate.Updates.init(updater:isHistorical:)(v15, 0, a3);
  }
  else
  {
    __break(1u);
  }
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

uint64_t lazy protocol witness table accessor for type CLLocationUpdate.Updates.Iterator and conformance CLLocationUpdate.Updates.Iterator(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t CLLocationUpdate.Updates.init(updater:isHistorical:)@<X0>(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v39 = a2;
  uint64_t v37 = a3;
  v38 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation.BufferingPolicy);
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation);
  uint64_t v36 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v36 + 64);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  os_log_type_t v10 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v36 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F580], v3);
  static AsyncStream.makeStream(of:bufferingPolicy:)();
  uint64_t v17 = v3;
  uint64_t v18 = v14;
  uint64_t v19 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  v20 = *(void (**)(uint64_t, char *, uint64_t))(v18 + 16);
  uint64_t v21 = v37;
  uint64_t v40 = v13;
  v41 = v16;
  v22 = v16;
  uint64_t v23 = v36;
  v20(v37, v22, v13);
  uint64_t v24 = type metadata accessor for CLLocationUpdate.Updates(0);
  v25 = v38;
  *(void *)(v21 + *(int *)(v24 + 20)) = v38;
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v10, v12, v7);
  unint64_t v26 = (*(unsigned __int8 *)(v23 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = v39;
  (*(void (**)(unint64_t, char *, uint64_t))(v23 + 32))(v27 + v26, v10, v7);
  aBlock[4] = partial apply for closure #1 in CLLocationUpdate.Updates.init(updater:isHistorical:);
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CLUpdate?) -> ();
  aBlock[3] = &block_descriptor_1;
  v28 = _Block_copy(aBlock);
  id v29 = v25;
  swift_retain();
  swift_release();
  [v29 setHandler:v28];
  _Block_release(v28);
  swift_release();
  *(void *)(swift_allocObject() + 16) = v29;
  id v30 = v29;
  AsyncStream.Continuation.onTermination.setter();
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v31 = type metadata accessor for Logger();
  __swift_project_value_buffer(v31, (uint64_t)logger);
  v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_2127EE000, v32, v33, "#LocationUpdates successfully created", v34, 2u);
    MEMORY[0x216681E40](v34, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v41, v40);
}

void closure #1 in CLLocationUpdate.Updates.init(updater:isHistorical:)(void *a1, char a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation.YieldResult);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (!a1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation);
      AsyncStream.Continuation.finish()();
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v8 = type metadata accessor for Logger();
      __swift_project_value_buffer(v8, (uint64_t)logger);
      os_log_t v22 = (os_log_t)Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v9))
      {
        os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v10 = 0;
        _os_log_impl(&dword_2127EE000, v22, v9, "#LocationUpdates Historical updates has finished iterating. Ending iteration.", v10, 2u);
        MEMORY[0x216681E40](v10, -1, -1);
      }
      os_log_t v11 = v22;

      return;
    }
  }
  else if (!a1)
  {
    __break(1u);
    return;
  }
  uint64_t v24 = (uint64_t)a1;
  id v12 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  __swift_project_value_buffer(v13, (uint64_t)logger);
  id v14 = v12;
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v24 = v18;
    *(_DWORD *)uint64_t v17 = 136380675;
    id v23 = [v14 sel_location];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLLocation?);
    uint64_t v19 = String.init<A>(describing:)();
    id v23 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2127EE000, v15, v16, "#LocationUpdates yielding an Update: %{private}s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x216681E40](v18, -1, -1);
    MEMORY[0x216681E40](v17, -1, -1);
  }
  else
  {
  }
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
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

id CLLocationUpdate.Updates.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)logger);
  size_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2127EE000, v5, v6, "#LocationUpdates makeAsyncIterator", v7, 2u);
    MEMORY[0x216681E40](v7, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  AsyncStream.makeAsyncIterator()();
  id v10 = *(id *)(v2 + *(int *)(type metadata accessor for CLLocationUpdate.Updates(0) + 20));
  type metadata accessor for _CLUpdaterAdapter();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v10;
  *(void *)(a1 + *(int *)(type metadata accessor for CLLocationUpdate.Updates.Iterator(0) + 20)) = v8;

  return v10;
}

uint64_t type metadata accessor for CLMonitor.Events(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
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

uint64_t type metadata accessor for CLLocationUpdate.Updates(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLLocationUpdate.Updates);
}

uint64_t type metadata accessor for _CLUpdaterAdapter()
{
  return self;
}

uint64_t type metadata accessor for CLLocationUpdate.Updates.Iterator(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLLocationUpdate.Updates.Iterator);
}

uint64_t _CLUpdaterAdapter.__deallocating_deinit()
{
  [*(id *)(v0 + 16) pause];

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance CLLocationUpdate.Updates.Iterator(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = protocol witness for AsyncIteratorProtocol.next() in conformance CLMonitor.Events.Iterator;
  v4[5] = a1;
  v4[6] = v1;
  return MEMORY[0x270FA2498](CLLocationUpdate.Updates.Iterator.next(), 0, 0);
}

uint64_t CLBeaconIdentityConstraint.major.getter()
{
  return CLBeaconIdentityConstraint.major.getter((SEL *)&selRef_major);
}

uint64_t CLBeaconIdentityConstraint.minor.getter()
{
  return CLBeaconIdentityConstraint.major.getter((SEL *)&selRef_minor);
}

uint64_t CLBeaconIdentityConstraint.major.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  unint64_t v3 = v2;
  if (v2)
  {
    unsigned int v4 = [v2 unsignedShortValue];
  }
  else
  {
    unsigned int v4 = 0;
  }
  return v4 | ((v3 == 0) << 16);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CLLocationCoordinate2D(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CLLocationCoordinate2D(uint64_t result, int a2, int a3)
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

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
}

void type metadata accessor for related decl 'e' for CLError(uint64_t a1)
{
}

void *protocol witness for OptionSet.init(rawValue:) in conformance CLClientDiagnosticMask@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id protocol witness for _BridgedStoredNSError._nsError.getter in conformance related decl 'e' for CLError()
{
  return *v0;
}

uint64_t protocol witness for _BridgedStoredNSError.init(_nsError:) in conformance related decl 'e' for CLError@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t protocol witness for static CustomNSError.errorDomain.getter in conformance related decl 'e' for CLError()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t protocol witness for CustomNSError.errorCode.getter in conformance related decl 'e' for CLError(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);

  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t protocol witness for CustomNSError.errorUserInfo.getter in conformance related decl 'e' for CLError(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);

  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t protocol witness for _ObjectiveCBridgeableError.init(_bridgedNSError:) in conformance related decl 'e' for CLError(void *a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);
  id v5 = a1;

  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance related decl 'e' for CLError()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance related decl 'e' for CLError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);

  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance related decl 'e' for CLError()
{
  return Hasher._finalize()();
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance CLError@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CLError(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t protocol witness for Error._domain.getter in conformance related decl 'e' for CLError(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t protocol witness for Error._code.getter in conformance related decl 'e' for CLError(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t protocol witness for Error._userInfo.getter in conformance related decl 'e' for CLError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance related decl 'e' for CLError(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);

  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance related decl 'e' for CLError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);

  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t base witness table accessor for Equatable in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);
}

uint64_t base witness table accessor for Error in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);
}

uint64_t lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t base witness table accessor for CustomNSError in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);
}

uint64_t base witness table accessor for _ObjectiveCBridgeableError in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);
}

uint64_t base witness table accessor for Hashable in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : _ErrorCodeProtocol in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLError and conformance CLError, type metadata accessor for CLError);
}

void type metadata accessor for CLError(uint64_t a1)
{
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : RawRepresentable in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLError and conformance CLError, type metadata accessor for CLError);
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

uint64_t base witness table accessor for Equatable in CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLError and conformance CLError, type metadata accessor for CLError);
}

uint64_t associated type witness table accessor for _ErrorCodeProtocol._ErrorType : _BridgedStoredNSError in CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, type metadata accessor for related decl 'e' for CLError);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CLError(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t objcConditionToSwifty(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v36[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if (a1)
  {
    self;
    uint64_t v9 = (void *)swift_dynamicCastObjCClass();
    if (v9)
    {
      [v9 sel_altitude];
      uint64_t v11 = v10;
      outlined destroy of CLMonitor.Event?(a2, &demangling cache variable for type metadata for CLCondition?);
      uint64_t v37 = &type metadata for CLMonitor.MinimumAltitudeCondition;
      unint64_t v38 = lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition();
      v36[0] = v11;
      outlined init with take of CLCondition?((uint64_t)v36, a2);
    }
    self;
    uint64_t v12 = swift_dynamicCastObjCClass();
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      id v14 = a1;
      id v15 = [v13 sel_UUID];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      id v16 = [v13 sel_major];
      uint64_t v17 = v16;
      if (v16)
      {
        HIDWORD(v35) = [v16 unsignedShortValue];
      }
      else
      {
        HIDWORD(v35) = 0;
      }
      id v18 = [v13 sel_minor];
      uint64_t v19 = v18;
      if (v18)
      {
        unsigned __int16 v20 = (unsigned __int16)[v18 unsignedShortValue];

        outlined destroy of CLMonitor.Event?(a2, &demangling cache variable for type metadata for CLCondition?);
      }
      else
      {
        outlined destroy of CLMonitor.Event?(a2, &demangling cache variable for type metadata for CLCondition?);

        unsigned __int16 v20 = 0;
      }
      BOOL v21 = v19 == 0;
      BOOL v22 = v17 == 0;
      uint64_t v23 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
      uint64_t v37 = (ValueMetadata *)v23;
      unint64_t v38 = lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition and conformance CLMonitor.BeaconIdentityCondition, (void (*)(uint64_t))type metadata accessor for CLMonitor.BeaconIdentityCondition);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
      (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 32))(boxed_opaque_existential_1, v8, v4);
      v25 = (char *)boxed_opaque_existential_1 + *(int *)(v23 + 20);
      *(_WORD *)v25 = WORD2(v35);
      v25[2] = v22;
      unint64_t v26 = (char *)boxed_opaque_existential_1 + *(int *)(v23 + 24);
      *(_WORD *)unint64_t v26 = v20;
      v26[2] = v21;
      outlined init with take of CLCondition?((uint64_t)v36, a2);
    }
    self;
    uint64_t result = swift_dynamicCastObjCClass();
    if (result)
    {
      uint64_t v27 = (void *)result;
      id v28 = a1;
      [v27 center];
      uint64_t v30 = v29;
      uint64_t v32 = v31;
      [v27 radius];
      uint64_t v34 = v33;

      outlined destroy of CLMonitor.Event?(a2, &demangling cache variable for type metadata for CLCondition?);
      uint64_t v37 = &type metadata for CLMonitor.CircularGeographicCondition;
      unint64_t v38 = lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition();
      v36[0] = v30;
      v36[1] = v32;
      v36[2] = v34;
      return outlined init with take of CLCondition?((uint64_t)v36, a2);
    }
  }
  return result;
}

CoreLocation::CLMonitor::MinimumAltitudeCondition __swiftcall CLMonitor.MinimumAltitudeCondition.init(altitude:)(CoreLocation::CLMonitor::MinimumAltitudeCondition altitude)
{
  v1->altitude = altitude.altitude;
  return altitude;
}

CoreLocation::CLMonitor::CircularGeographicCondition __swiftcall CLMonitor.CircularGeographicCondition.init(center:radius:)(__C::CLLocationCoordinate2D center, Swift::Double radius)
{
  *uint64_t v2 = center.latitude;
  v2[1] = center.longitude;
  v2[2] = radius;
  result.center.longitude = center.longitude;
  result.center.latitude = center.latitude;
  result.radius = radius;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance CLMonitor.Options()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CLMonitor.Options()
{
  return RawRepresentable<>.encode(to:)();
}

void protocol witness for SetAlgebra.init() in conformance CLMonitor.Options(void *a1@<X8>)
{
  *a1 = 0;
}

void *protocol witness for SetAlgebra.union(_:) in conformance CLMonitor.Options@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *protocol witness for SetAlgebra.intersection(_:) in conformance CLMonitor.Options@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance CLMonitor.Options@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance CLMonitor.Options(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *protocol witness for SetAlgebra.remove(_:) in conformance CLMonitor.Options@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance CLMonitor.Options@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *protocol witness for SetAlgebra.formUnion(_:) in conformance CLMonitor.Options(void *result)
{
  *v1 |= *result;
  return result;
}

void *protocol witness for SetAlgebra.formIntersection(_:) in conformance CLMonitor.Options(void *result)
{
  *v1 &= *result;
  return result;
}

void *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance CLMonitor.Options(void *result)
{
  *v1 ^= *result;
  return result;
}

void *protocol witness for SetAlgebra.subtracting(_:) in conformance CLMonitor.Options@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance CLMonitor.Options(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance CLMonitor.Options(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance CLMonitor.Options(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance CLMonitor.Options()
{
  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance CLMonitor.Options(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *protocol witness for SetAlgebra.subtract(_:) in conformance CLMonitor.Options(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x64757469676E6F6CLL;
    }
    else {
      uint64_t v3 = 0x737569646172;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE900000000000065;
    }
    else {
      unint64_t v4 = 0xE600000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x64757469676E6F6CLL;
      }
      else {
        uint64_t v6 = 0x737569646172;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE900000000000065;
      }
      else {
        unint64_t v7 = 0xE600000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE800000000000000;
    uint64_t v3 = 0x656475746974616CLL;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE800000000000000;
  if (v3 != 0x656475746974616CLL)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t specialized == infix<A>(_:_:)(char a1, unsigned __int8 a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v2 = 0x726F6A616DLL;
    }
    else {
      uint64_t v2 = 0x726F6E696DLL;
    }
    unint64_t v3 = 0xE500000000000000;
    int v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1) {
        uint64_t v5 = 0x726F6A616DLL;
      }
      else {
        uint64_t v5 = 0x726F6E696DLL;
      }
      unint64_t v6 = 0xE500000000000000;
      if (v2 != v5) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0xE400000000000000;
    uint64_t v2 = 1684632949;
    int v4 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0xE400000000000000;
  if (v2 != 1684632949)
  {
LABEL_15:
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6) {
    goto LABEL_15;
  }
  char v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance CLMonitor.Options@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, CLMonitor.Record>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of CLCondition?(v4, (uint64_t)&v18, &demangling cache variable for type metadata for (String, CLMonitor.Record));
    uint64_t v5 = v18;
    uint64_t v6 = v19;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v18, v19);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v9 = v5;
    v9[1] = v6;
    uint64_t v10 = (_OWORD *)(v2[7] + 96 * result);
    long long v11 = v21;
    *uint64_t v10 = v20;
    v10[1] = v11;
    long long v12 = v22;
    long long v13 = v23;
    long long v14 = v25;
    v10[4] = v24;
    v10[5] = v14;
    v10[2] = v12;
    v10[3] = v13;
    uint64_t v15 = v2[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_12;
    }
    v2[2] = v17;
    v4 += 112;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return (unint64_t)v2;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t CLMonitor.identifiers.getter()
{
  id v1 = [*(id *)(v0 + 120) _getMonitoredIdentifiers];
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t CLMonitor.events.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of CLMonitor.Events(v1 + OBJC_IVAR____TtC12CoreLocation9CLMonitor_events, a1);
}

uint64_t outlined init with copy of CLMonitor.Events(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CLMonitor.Events(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for CLMonitor.Events(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLMonitor.Events);
}

void *CLMonitor.Record.lastEvent.getter@<X0>(void *a1@<X8>)
{
  return outlined init with copy of CLMonitor.Event(v1 + 8, a1);
}

void *outlined init with copy of CLMonitor.Event(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t CLMonitor.Record.condition.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of CLCondition(v1 + 56, a1);
}

uint64_t outlined init with copy of CLCondition(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t CLMonitor.Record.init(condition:identifier:options:state:date:monitoringEvent:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, id a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of CLCondition(a1, a8 + 56);
  *(void *)a8 = a4;
  if (a7)
  {
    a7 = a7;
    swift_bridgeObjectRelease();
    outlined init with copy of CLCondition(a1, (uint64_t)v35);
    id v19 = a7;
LABEL_8:

    uint64_t v29 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(a6, v29);
    __swift_destroy_boxed_opaque_existential_1(a1);
    *(void *)&long long v36 = v19;
    uint64_t result = outlined init with take of CLCondition?((uint64_t)v35, (uint64_t)&v36 + 8);
    long long v30 = v37;
    *(_OWORD *)(a8 + 8) = v36;
    *(_OWORD *)(a8 + 24) = v30;
    *(_OWORD *)(a8 + 40) = v38;
    return result;
  }
  uint64_t v31 = a5;
  uint64_t v32 = a6;
  outlined init with copy of CLCondition(a1, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLCondition);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConditionAdapter);
  if (swift_dynamicCast())
  {
    outlined init with take of ConditionAdapter(v33, (uint64_t)&v36);
    uint64_t v20 = *((void *)&v37 + 1);
    uint64_t v21 = v38;
    __swift_project_boxed_opaque_existential_1(&v36, *((uint64_t *)&v37 + 1));
    long long v22 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v21 + 32))(v20, v21);
    uint64_t v23 = type metadata accessor for Date();
    uint64_t v24 = *(void *)(v23 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v18, v32, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v18, 0, 1, v23);
    long long v25 = (void *)MEMORY[0x216681600](a2, a3);
    swift_bridgeObjectRelease();
    Class isa = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v18, 1, v23) != 1)
    {
      Class isa = Date._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v18, v23);
    }
    id v27 = objc_allocWithZone(MEMORY[0x263F00A98]);
    id v19 = [v27 initWithIdentifier:v25 refinement:v22 state:v31 date:isa diagnostics:0];

    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
    uint64_t result = outlined init with copy of CLCondition(a1, (uint64_t)v35);
    if (v19)
    {
      a6 = v32;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v34 = 0;
    memset(v33, 0, sizeof(v33));
    swift_bridgeObjectRelease();
    outlined destroy of CLMonitor.Event?((uint64_t)v33, &demangling cache variable for type metadata for ConditionAdapter?);
    uint64_t result = outlined init with copy of CLCondition(a1, (uint64_t)v35);
  }
  __break(1u);
  return result;
}

uint64_t CLMonitor.Event.refinement.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of CLCondition?(v1 + 8, a1, &demangling cache variable for type metadata for CLCondition?);
}

uint64_t CLMonitor.Event.identifier.getter()
{
  id v1 = [*v0 sel_identifier];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

id CLMonitor.Event.state.getter()
{
  return [*v0 sel_state];
}

void CLMonitor.Event.date.getter()
{
  id v1 = [*v0 sel_date];
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

id CLMonitor.Event.authorizationDenied.getter()
{
  return [*v0 sel_authorizationDenied];
}

id CLMonitor.Event.authorizationDeniedGlobally.getter()
{
  return [*v0 sel_authorizationDeniedGlobally];
}

id CLMonitor.Event.authorizationRestricted.getter()
{
  return [*v0 sel_authorizationRestricted];
}

id CLMonitor.Event.insufficientlyInUse.getter()
{
  return [*v0 sel_insufficientlyInUse];
}

id CLMonitor.Event.accuracyLimited.getter()
{
  return [*v0 sel_accuracyLimited];
}

id CLMonitor.Event.conditionUnsupported.getter()
{
  return [*v0 sel_conditionUnsupported];
}

id CLMonitor.Event.conditionLimitExceeded.getter()
{
  return [*v0 sel_conditionLimitExceeded];
}

id CLMonitor.Event.persistenceUnavailable.getter()
{
  return [*v0 sel_persistenceUnavailable];
}

id CLMonitor.Event.serviceSessionRequired.getter()
{
  return [*v0 sel_serviceSessionRequired];
}

id CLMonitor.Event.authorizationRequestInProgress.getter()
{
  return [*v0 sel_authorizationRequestInProgress];
}

uint64_t CLMonitor.Events.Iterator.next()(uint64_t a1)
{
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = v1;
  return MEMORY[0x270FA2498](CLMonitor.Events.Iterator.next(), 0, 0);
}

uint64_t CLMonitor.Events.Iterator.next()()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = type metadata accessor for CLMonitor.Events.Iterator(0);
  uint64_t v3 = *(int *)(v2 + 20);
  *(_DWORD *)(v0 + 144) = v3;
  outlined init with copy of CLCondition?(v1 + v3, v0 + 64, &demangling cache variable for type metadata for CLMonitor.Event?);
  if (*(void *)(v0 + 64))
  {
    uint64_t v4 = *(void *)(v0 + 120);
    long long v5 = *(_OWORD *)(v0 + 80);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v0 + 32) = v5;
    *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 96);
    long long v11 = (uint64_t (*)(uint64_t))(*(void *)(v4 + *(int *)(v2 + 24)) + **(int **)(v4 + *(int *)(v2 + 24)));
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v6;
    void *v6 = v0;
    v6[1] = CLMonitor.Events.Iterator.next();
    return v11(v0 + 16);
  }
  else
  {
    outlined destroy of CLMonitor.Event?(v0 + 64, &demangling cache variable for type metadata for CLMonitor.Event?);
    char v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v8;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
    *char v8 = v0;
    v8[1] = CLMonitor.Events.Iterator.next();
    uint64_t v10 = *(void *)(v0 + 112);
    return MEMORY[0x270FA1F70](v10, v9);
  }
}

{
  uint64_t v1;

  swift_task_dealloc();
  return MEMORY[0x270FA2498](CLMonitor.Events.Iterator.next(), 0, 0);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  outlined destroy of CLMonitor.Event(v0 + 16);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  *uint64_t v1 = v0;
  v1[1] = CLMonitor.Events.Iterator.next();
  uint64_t v3 = *(void *)(v0 + 112);
  return MEMORY[0x270FA1F70](v3, v2);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return MEMORY[0x270FA2498](CLMonitor.Events.Iterator.next(), 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined assign with copy of CLMonitor.Event?(*(void *)(v0 + 112), *(void *)(v0 + 120) + *(int *)(v0 + 144));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for CLMonitor.Events.Iterator(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLMonitor.Events.Iterator);
}

uint64_t outlined assign with copy of CLMonitor.Event?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLMonitor.Event?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CLMonitor.Event(uint64_t a1)
{
  return a1;
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance CLMonitor.Events.Iterator(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = protocol witness for AsyncIteratorProtocol.next() in conformance CLMonitor.Events.Iterator;
  v4[14] = a1;
  v4[15] = v1;
  return MEMORY[0x270FA2498](CLMonitor.Events.Iterator.next(), 0, 0);
}

uint64_t _s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a3;
  v5[5] = a4;
  v5[3] = a2;
  char v7 = (void *)swift_task_alloc();
  v5[6] = v7;
  *char v7 = v5;
  v7[1] = _s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  v7[14] = a1;
  v7[15] = v4;
  return MEMORY[0x270FA2498](CLMonitor.Events.Iterator.next(), 0, 0);
}

uint64_t _s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  uint64_t v2 = (void *)*v1;
  v2[7] = v0;
  swift_task_dealloc();
  if (v0)
  {
    if (v2[3])
    {
      swift_getObjectType();
      uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v5 = v4;
    }
    else
    {
      uint64_t v3 = 0;
      uint64_t v5 = 0;
    }
    return MEMORY[0x270FA2498](_s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY1_, v3, v5);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v2[1];
    return v6();
  }
}

uint64_t _s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY1_()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void *)v0[5];
  v0[2] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  swift_willThrowTypedImpl();
  *uint64_t v2 = v1;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t CLMonitor.Events.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  AsyncStream.makeAsyncIterator()();
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for CLMonitor.Events(0) + 28));
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  uint64_t v6 = type metadata accessor for CLMonitor.Events.Iterator(0);
  char v7 = (_OWORD *)(a1 + *(int *)(v6 + 20));
  v7[1] = 0u;
  v7[2] = 0u;
  *char v7 = 0u;
  uint64_t v8 = (void *)(a1 + *(int *)(v6 + 24));
  *uint64_t v8 = v5;
  v8[1] = v4;

  return swift_retain();
}

uint64_t CLMonitor.Events.init(_:_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v25 = a2;
  unint64_t v26 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation?);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation.BufferingPolicy);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocBox();
  uint64_t v15 = v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  uint64_t v27 = v15;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F8F580], v9);
  AsyncStream.init(_:bufferingPolicy:_:)();
  outlined init with copy of CLCondition?(v15, (uint64_t)v8, &demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation?);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v8, 1, v16);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    id v19 = (int *)type metadata accessor for CLMonitor.Events(0);
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a4 + v19[5], v8, v16);
    uint64_t v20 = v25;
    uint64_t v21 = v26;
    *(void *)(a4 + v19[6]) = v26;
    long long v22 = (void *)(a4 + v19[7]);
    void *v22 = v20;
    v22[1] = a3;
    aBlock[4] = partial apply for closure #2 in CLMonitor.Events.init(_:_:);
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CLMonitor, @guaranteed CLMonitoringEvent) -> ();
    aBlock[3] = &block_descriptor_54;
    uint64_t v23 = _Block_copy(aBlock);
    id v24 = v21;
    swift_retain();
    swift_retain();
    swift_release();
    [v24 setEventHandler:v23];
    swift_release();

    _Block_release(v23);
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in CLMonitor.Events.init(_:_:)(uint64_t a1, uint64_t a2)
{
  outlined destroy of CLMonitor.Event?(a2, &demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation?);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(a2, 0, 1, v4);
}

uint64_t closure #2 in CLMonitor.Events.init(_:_:)(uint64_t a1, void *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation.YieldResult);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_projectBox();
  id v11 = [a2 sel_refinement];
  objcConditionToSwifty(_:)(v11, (uint64_t)&v41);

  uint64_t v40 = a2;
  uint64_t v12 = one-time initialization token for logger;
  id v13 = a2;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  __swift_project_value_buffer(v14, (uint64_t)logger);
  id v15 = v13;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  int v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    int v37 = v18;
    id v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    long long v38 = v9;
    v39[0] = v36;
    *(_DWORD *)id v19 = 136315138;
    v34[1] = v19 + 4;
    uint64_t v35 = v19;
    id v20 = v15;
    id v21 = [v20 sel_description];
    uint64_t v22 = v7;
    uint64_t v23 = v5;
    uint64_t v24 = v6;
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v27 = v26;

    uint64_t v28 = v25;
    uint64_t v6 = v24;
    uint64_t v5 = v23;
    uint64_t v7 = v22;
    v39[6] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v27, v39);
    uint64_t v9 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    uint64_t v29 = v35;
    _os_log_impl(&dword_2127EE000, v16, (os_log_type_t)v37, "#MonitorActor received event: %s", v35, 0xCu);
    uint64_t v30 = v36;
    swift_arrayDestroy();
    MEMORY[0x216681E40](v30, -1, -1);
    MEMORY[0x216681E40](v29, -1, -1);
  }
  else
  {
  }
  swift_beginAccess();
  outlined init with copy of CLCondition?(v10, (uint64_t)v5, &demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation?);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48))(v5, 1, v31);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    outlined init with copy of CLMonitor.Event((uint64_t)&v40, v39);
    AsyncStream.Continuation.yield(_:)();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    outlined destroy of CLMonitor.Event((uint64_t)&v40);
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v5, v31);
  }
  return result;
}

void thunk for @escaping @callee_guaranteed (@guaranteed CLMonitor, @guaranteed CLMonitoringEvent) -> ()(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, id))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, v6);
  swift_release();
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance CLMonitor.Events@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  AsyncStream.makeAsyncIterator()();
  uint64_t v5 = (uint64_t *)(v2 + *(int *)(a1 + 28));
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v8 = type metadata accessor for CLMonitor.Events.Iterator(0);
  uint64_t v9 = (_OWORD *)(a2 + *(int *)(v8 + 20));
  v9[1] = 0u;
  v9[2] = 0u;
  *uint64_t v9 = 0u;
  uint64_t v10 = (void *)(a2 + *(int *)(v8 + 24));
  *uint64_t v10 = v7;
  v10[1] = v6;
  swift_retain();

  return outlined destroy of CLMonitor.Events(v2);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:);
  unint64_t result = specialized CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:)(*a1, v3);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE800000000000000;
  unint64_t v4 = 0xE900000000000065;
  uint64_t v5 = 0x64757469676E6F6CLL;
  if (v2 != 1)
  {
    uint64_t v5 = 0x737569646172;
    unint64_t v4 = 0xE600000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x656475746974616CLL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  uint64_t v1 = 0x64757469676E6F6CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x737569646172;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x656475746974616CLL;
  }
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:);
  unint64_t result = specialized CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:)(a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

double CLMonitor.CircularGeographicCondition.center.getter()
{
  return *(double *)v0;
}

double CLMonitor.CircularGeographicCondition.radius.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t CLMonitor.CircularGeographicCondition.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CLMonitor.CircularGeographicCondition.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    v17[15] = 0;
    KeyedDecodingContainer.decode(_:forKey:)();
    CLLocationDegrees v10 = v9;
    v17[14] = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    CLLocationDegrees v12 = v11;
    v17[13] = 2;
    KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v15 = v14;
    CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v10, v12);
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    *(CLLocationCoordinate2D *)a2 = v16;
    *(void *)(a2 + 16) = v15;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys);
  }
  return result;
}

uint64_t CLMonitor.CircularGeographicCondition.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CLMonitor.CircularGeographicCondition.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v11 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    char v10 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v9 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

id protocol witness for ConditionAdapter.to() in conformance CLMonitor.CircularGeographicCondition()
{
  double v1 = *v0;
  double v2 = v0[1];
  double v3 = v0[2];
  id v4 = objc_allocWithZone(MEMORY[0x263F00A20]);

  return [v4 initWithCenter:v1 radius:v2];
}

uint64_t protocol witness for Decodable.init(from:) in conformance CLMonitor.CircularGeographicCondition@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CLMonitor.CircularGeographicCondition.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CLMonitor.CircularGeographicCondition(void *a1)
{
  return CLMonitor.CircularGeographicCondition.encode(to:)(a1);
}

uint64_t CLMonitor.add(_:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CLMonitor.add(_:identifier:assuming:)(a1, a2, a3, 0);
}

uint64_t CLMonitor.add(_:identifier:assuming:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for Date();
  MEMORY[0x270FA5388](v10 - 8);
  CLLocationDegrees v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v13 = *(void *)(v4 + 112);
  if (*(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v14 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if (v15)
    {
      outlined init with copy of CLMonitor.Record(*(void *)(v13 + 56) + 96 * v14, (uint64_t)&v29);
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v29 + 1))
    {
      CLLocationCoordinate2D v16 = &demangling cache variable for type metadata for CLMonitor.Record?;
      os_log_type_t v17 = &v29;
      return outlined destroy of CLMonitor.Event?((uint64_t)v17, v16);
    }
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
  }
  outlined destroy of CLMonitor.Event?((uint64_t)&v29, &demangling cache variable for type metadata for CLMonitor.Record?);
  outlined init with copy of CLCondition(a1, (uint64_t)v28);
  swift_bridgeObjectRetain_n();
  Date.init()();
  CLMonitor.Record.init(condition:identifier:options:state:date:monitoringEvent:)((uint64_t)v28, a2, a3, 0, a4, (uint64_t)v12, 0, (uint64_t)&v29);
  swift_beginAccess();
  specialized Dictionary.subscript.setter((uint64_t)&v29, a2, a3);
  swift_endAccess();
  outlined init with copy of CLCondition(a1, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLCondition);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConditionAdapter);
  if (swift_dynamicCast())
  {
    outlined init with take of ConditionAdapter(v26, (uint64_t)&v29);
    int v18 = *(void **)(v5 + 120);
    uint64_t v19 = *((void *)&v30 + 1);
    uint64_t v20 = v31;
    __swift_project_boxed_opaque_existential_1(&v29, *((uint64_t *)&v30 + 1));
    id v21 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 32);
    id v22 = v18;
    uint64_t v23 = (void *)v21(v19, v20);
    uint64_t v24 = (void *)MEMORY[0x216681600](a2, a3);
    [v22 addConditionForMonitoring:v23 identifier:v24 options:0 assumedState:a4];

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v29);
  }
  uint64_t v27 = 0;
  memset(v26, 0, sizeof(v26));
  CLLocationCoordinate2D v16 = &demangling cache variable for type metadata for ConditionAdapter?;
  os_log_type_t v17 = v26;
  return outlined destroy of CLMonitor.Event?((uint64_t)v17, v16);
}

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 8))
  {
    long long v6 = *(_OWORD *)(a1 + 48);
    v12[2] = *(_OWORD *)(a1 + 32);
    uint64_t v12[3] = v6;
    long long v7 = *(_OWORD *)(a1 + 80);
    v12[4] = *(_OWORD *)(a1 + 64);
    v12[5] = v7;
    long long v8 = *(_OWORD *)(a1 + 16);
    v12[0] = *(_OWORD *)a1;
    v12[1] = v8;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v3;
    *double v3 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v12, a2, a3, isUniquelyReferenced_nonNull_native);
    *double v3 = v11;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    outlined destroy of CLMonitor.Event?(a1, &demangling cache variable for type metadata for CLMonitor.Record?);
    specialized Dictionary._Variant.removeValue(forKey:)(a2, a3, v12);
    swift_bridgeObjectRelease();
    return outlined destroy of CLMonitor.Event?((uint64_t)v12, &demangling cache variable for type metadata for CLMonitor.Record?);
  }
}

Swift::Void __swiftcall CLMonitor.remove(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  specialized Dictionary._Variant.removeValue(forKey:)(countAndFlagsBits, (uint64_t)object, v6);
  outlined destroy of CLMonitor.Event?((uint64_t)v6, &demangling cache variable for type metadata for CLMonitor.Record?);
  swift_endAccess();
  id v4 = *(id *)(v1 + 120);
  uint64_t v5 = (void *)MEMORY[0x216681600](countAndFlagsBits, object);
  [v4 removeConditionFromMonitoringWithIdentifier:v5];
}

uint64_t CLMonitor.record(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t result = swift_beginAccess();
  uint64_t v8 = *(void *)(v3 + 112);
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
    if (v10)
    {
      outlined init with copy of CLMonitor.Record(*(void *)(v8 + 56) + 96 * v9, (uint64_t)a3);
    }
    else
    {
      a3[4] = 0u;
      a3[5] = 0u;
      a3[2] = 0u;
      a3[3] = 0u;
      *a3 = 0u;
      a3[1] = 0u;
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void CLMonitor.update(_:_:)(uint64_t a1, unint64_t a2, void **a3)
{
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v11 = *(void *)(v3 + 112);
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
    if (v13)
    {
      outlined init with copy of CLMonitor.Record(*(void *)(v11 + 56) + 96 * v12, (uint64_t)&v27);
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v27 + 1))
    {
      long long v33[2] = v29;
      v34[0] = v30;
      v34[1] = v31;
      void v34[2] = v32;
      v33[0] = v27;
      v33[1] = v28;
      outlined init with copy of CLCondition((uint64_t)v34 + 8, (uint64_t)v26);
      unint64_t v14 = *a3;
      swift_bridgeObjectRetain_n();
      [v14 sel_state];
      id v15 = [v14 sel_date];
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      outlined init with copy of CLCondition((uint64_t)v26, (uint64_t)v25 + 8);
      *(void *)&long long v23 = 0;
      id v16 = v14;
      swift_bridgeObjectRelease();
      outlined init with copy of CLCondition((uint64_t)v26, (uint64_t)&v27);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      *((void *)&v23 + 1) = v16;
      outlined init with take of CLCondition?((uint64_t)&v27, (uint64_t)v24);
      long long v29 = v24[1];
      long long v30 = v25[0];
      long long v31 = v25[1];
      long long v32 = v25[2];
      long long v27 = v23;
      long long v28 = v24[0];
      swift_beginAccess();
      specialized Dictionary.subscript.setter((uint64_t)&v27, a1, a2);
      swift_endAccess();
      outlined destroy of CLMonitor.Record((uint64_t)v33);
      return;
    }
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
  }
  outlined destroy of CLMonitor.Event?((uint64_t)&v27, &demangling cache variable for type metadata for CLMonitor.Record?);
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for Logger();
  __swift_project_value_buffer(v17, (uint64_t)logger);
  swift_bridgeObjectRetain_n();
  int v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(void *)&v33[0] = v21;
    *(_DWORD *)uint64_t v20 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&long long v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2127EE000, v18, v19, "#MonitorActor update on record that doesn't exist for %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x216681E40](v21, -1, -1);
    MEMORY[0x216681E40](v20, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

uint64_t CLMonitor.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = CLMonitor.__allocating_init(_:);
  return CLMonitor.init(_:)(a1, a2);
}

uint64_t CLMonitor.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t CLMonitor.init(_:)(uint64_t a1, uint64_t a2)
{
  v3[22] = v2;
  type metadata accessor for Date();
  v3[23] = swift_task_alloc();
  type metadata accessor for CLMonitor.Events(0);
  uint64_t v6 = swift_task_alloc();
  v3[24] = v6;
  swift_defaultActor_initialize();
  *(void *)(v2 + 112) = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  uint64_t v7 = self;
  uint64_t v8 = (void *)MEMORY[0x216681600](a1, a2);
  swift_bridgeObjectRelease();
  id v9 = [v7 configWithMonitorName:v8];
  v3[25] = v9;

  uint64_t v10 = swift_allocObject();
  v3[26] = v10;
  swift_weakInit();
  swift_retain_n();
  id v11 = v9;
  CLMonitor.Events.init(_:_:)(v11, (uint64_t)&async function pointer to partial apply for closure #1 in CLMonitor.init(_:), v10, v6);
  outlined init with take of CLMonitor.Events(v6, v2 + OBJC_IVAR____TtC12CoreLocation9CLMonitor_events);
  unint64_t v12 = self;
  v3[2] = v3;
  v3[7] = v3 + 21;
  v3[3] = CLMonitor.init(_:);
  uint64_t v13 = swift_continuation_init();
  v3[10] = MEMORY[0x263EF8330];
  v3[11] = 0x40000000;
  v3[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned CLMonitor) -> () with result type CLMonitor;
  v3[13] = &block_descriptor;
  v3[14] = v13;
  [v12 requestMonitorWithConfiguration:v11 completion:v3 + 10];
  return MEMORY[0x270FA23F0](v3 + 2);
}

uint64_t CLMonitor.init(_:)()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  *(void *)(v1 + 120) = *(void *)(*(void *)v0 + 168);
  return MEMORY[0x270FA2498](CLMonitor.init(_:), v1, 0);
}

void CLMonitor.init(_:)()
{
  uint64_t v35 = v0;
  id v1 = [*(id *)(*(void *)(v0 + 176) + 120) _getMonitoringRecords];
  type metadata accessor for CLMonitoringRecord();
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v3 = 0;
  uint64_t v27 = v2 + 64;
  uint64_t v30 = v2;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(v2 + 64);
  int64_t v28 = (unint64_t)(63 - v5) >> 6;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v31 = (v6 - 1) & v6;
  int64_t v32 = v3;
  for (unint64_t i = __clz(__rbit64(v6)) | (v3 << 6); ; unint64_t i = __clz(__rbit64(v9)) + (v10 << 6))
  {
    unint64_t v12 = (uint64_t *)(*(void *)(v30 + 48) + 16 * i);
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    uint64_t v15 = *(void **)(*(void *)(v30 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    id v16 = v15;
    id v17 = [v16 sel_condition];
    objcConditionToSwifty(_:)(v17, (uint64_t)v33);

    if (!v33[3]) {
      goto LABEL_27;
    }
    uint64_t v18 = *(void *)(v29 + 176);
    uint64_t v19 = *(void *)(v29 + 184);
    swift_bridgeObjectRetain();
    id v20 = [v16 sel_lastEvent];
    id v21 = [v20 sel_state];

    id v22 = [v16 sel_lastEvent];
    id v23 = [v22 sel_date];

    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    CLMonitor.Record.init(condition:identifier:options:state:date:monitoringEvent:)((uint64_t)v33, v14, v13, 0, (uint64_t)v21, v19, [v16 lastEvent], (uint64_t)v34);
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v33[0] = *(void *)(v18 + 112);
    *(void *)(v18 + 112) = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v34, v14, v13, isUniquelyReferenced_nonNull_native);
    *(void *)(v18 + 112) = v33[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();

    unint64_t v6 = v31;
    int64_t v3 = v32;
    if (v31) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v8 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      return;
    }
    if (v8 >= v28) {
      goto LABEL_22;
    }
    unint64_t v9 = *(void *)(v27 + 8 * v8);
    int64_t v10 = v3 + 1;
    if (!v9)
    {
      int64_t v10 = v3 + 2;
      if (v3 + 2 >= v28) {
        goto LABEL_22;
      }
      unint64_t v9 = *(void *)(v27 + 8 * v10);
      if (!v9)
      {
        int64_t v10 = v3 + 3;
        if (v3 + 3 >= v28) {
          goto LABEL_22;
        }
        unint64_t v9 = *(void *)(v27 + 8 * v10);
        if (!v9) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v31 = (v9 - 1) & v9;
    int64_t v32 = v10;
  }
  uint64_t v11 = v3 + 4;
  if (v3 + 4 < v28)
  {
    unint64_t v9 = *(void *)(v27 + 8 * v11);
    if (!v9)
    {
      while (1)
      {
        int64_t v10 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          goto LABEL_26;
        }
        if (v10 >= v28) {
          goto LABEL_22;
        }
        unint64_t v9 = *(void *)(v27 + 8 * v10);
        ++v11;
        if (v9) {
          goto LABEL_18;
        }
      }
    }
    int64_t v10 = v3 + 4;
    goto LABEL_18;
  }
LABEL_22:

  swift_release();
  swift_release();
  swift_beginAccess();
  swift_weakAssign();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(void (**)(void))(v29 + 8);
  uint64_t v26 = *(void *)(v29 + 176);
  v25(v26);
}

uint64_t closure #1 in CLMonitor.init(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return MEMORY[0x270FA2498](closure #1 in CLMonitor.init(_:), 0, 0);
}

uint64_t closure #1 in CLMonitor.init(_:)()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    uint64_t v2 = Strong;
    id v3 = [[*(id **)(v0 + 40) sel_identifier];
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;

    *(void *)(v0 + 64) = v4;
    *(void *)(v0 + 72) = v6;
    return MEMORY[0x270FA2498](closure #1 in CLMonitor.init(_:), v2, 0);
  }
  else
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    __swift_project_value_buffer(v7, (uint64_t)logger);
    int64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v8, v9))
    {
      int64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v10 = 0;
      _os_log_impl(&dword_2127EE000, v8, v9, "#MonitorActor can't update event when self has been dealloc'd", v10, 2u);
      MEMORY[0x216681E40](v10, -1, -1);
    }

    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

{
  uint64_t v0;
  uint64_t v2;

  CLMonitor.update(_:_:)(*(void *)(v0 + 64), *(void *)(v0 + 72), *(void ***)(v0 + 40));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](closure #1 in CLMonitor.init(_:), 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned CLMonitor) -> () with result type CLMonitor(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;

  return MEMORY[0x270FA2400](v2);
}

uint64_t CLMonitor.deinit()
{
  swift_bridgeObjectRelease();

  outlined destroy of CLMonitor.Events(v0 + OBJC_IVAR____TtC12CoreLocation9CLMonitor_events);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t CLMonitor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  outlined destroy of CLMonitor.Events(v0 + OBJC_IVAR____TtC12CoreLocation9CLMonitor_events);
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t CLMonitor.unownedExecutor.getter()
{
  return v0;
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance CLMonitor()
{
  return v0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys(void *a1@<X8>)
{
  *a1 = 0x6564757469746C61;
  a1[1] = 0xE800000000000000;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return 0x6564757469746C61;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  object = string._object;
  v3._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for CodingKey.init(stringValue:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys, v3);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

double CLMonitor.MinimumAltitudeCondition.altitude.getter()
{
  return *(double *)v0;
}

uint64_t CLMonitor.MinimumAltitudeCondition.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CLMonitor.MinimumAltitudeCondition.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v10 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

id protocol witness for ConditionAdapter.to() in conformance CLMonitor.MinimumAltitudeCondition()
{
  double v1 = *v0;
  id v2 = objc_allocWithZone(MEMORY[0x263F00A80]);

  return [v2 initWithAltitude:v1];
}

uint64_t protocol witness for Decodable.init(from:) in conformance CLMonitor.MinimumAltitudeCondition@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return CLMonitor.MinimumAltitudeCondition.init(from:)(a1, a2);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CLMonitor.BeaconIdentityCondition.CodingKeys(char *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CLMonitor.BeaconIdentityCondition.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of CLMonitor.BeaconIdentityCondition.CodingKeys.init(rawValue:);
  unint64_t result = specialized CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:)(*a1, v3);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CLMonitor.BeaconIdentityCondition.CodingKeys(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = 0x726F6A616DLL;
  if (v2 != 1) {
    uint64_t v4 = 0x726F6E696DLL;
  }
  BOOL v5 = v2 == 0;
  if (*v1) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 1684632949;
  }
  if (!v5) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v6;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  uint64_t v1 = 0x726F6A616DLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x726F6E696DLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1684632949;
  }
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance CLMonitor.BeaconIdentityCondition.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &outlined read-only object #0 of CLMonitor.BeaconIdentityCondition.CodingKeys.init(rawValue:);
  unint64_t result = specialized CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:)(a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CLMonitor.BeaconIdentityCondition.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CLMonitor.BeaconIdentityCondition.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CLMonitor.BeaconIdentityCondition.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t CLMonitor.BeaconIdentityCondition.major.getter()
{
  uint64_t v1 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  return *(unsigned __int16 *)(v0 + *(int *)(v1 + 20)) | (*(unsigned __int8 *)(v0 + *(int *)(v1 + 20) + 2) << 16);
}

uint64_t CLMonitor.BeaconIdentityCondition.minor.getter()
{
  uint64_t v1 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  return *(unsigned __int16 *)(v0 + *(int *)(v1 + 24)) | (*(unsigned __int8 *)(v0 + *(int *)(v1 + 24) + 2) << 16);
}

uint64_t CLMonitor.BeaconIdentityCondition.init(uuid:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  uint64_t result = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  uint64_t v6 = a2 + *(int *)(result + 20);
  *(_WORD *)uint64_t v6 = 0;
  *(unsigned char *)(v6 + 2) = 1;
  uint64_t v7 = a2 + *(int *)(result + 24);
  *(_WORD *)uint64_t v7 = 0;
  *(unsigned char *)(v7 + 2) = 1;
  return result;
}

uint64_t CLMonitor.BeaconIdentityCondition.init(uuid:major:)@<X0>(uint64_t a1@<X0>, __int16 a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  uint64_t v8 = a3 + *(int *)(result + 20);
  *(_WORD *)uint64_t v8 = a2;
  *(unsigned char *)(v8 + 2) = 0;
  uint64_t v9 = a3 + *(int *)(result + 24);
  *(_WORD *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 2) = 1;
  return result;
}

uint64_t CLMonitor.BeaconIdentityCondition.init(uuid:major:minor:)@<X0>(uint64_t a1@<X0>, __int16 a2@<W1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t result = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  uint64_t v10 = a4 + *(int *)(result + 20);
  *(_WORD *)uint64_t v10 = a2;
  *(unsigned char *)(v10 + 2) = 0;
  uint64_t v11 = a4 + *(int *)(result + 24);
  *(_WORD *)uint64_t v11 = a3;
  *(unsigned char *)(v11 + 2) = 0;
  return result;
}

uint64_t CLMonitor.BeaconIdentityCondition.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v19 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CLMonitor.BeaconIdentityCondition.CodingKeys>);
  uint64_t v7 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v10 = v7;
    uint64_t v12 = v19;
    uint64_t v11 = v20;
    char v25 = 0;
    lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    char v24 = 1;
    int v22 = KeyedDecodingContainer.decode(_:forKey:)();
    char v23 = 2;
    __int16 v14 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v21);
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v11, v6, v4);
    uint64_t v15 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
    uint64_t v16 = v11 + *(int *)(v15 + 20);
    *(_WORD *)uint64_t v16 = v22;
    *(unsigned char *)(v16 + 2) = 0;
    uint64_t v17 = v11 + *(int *)(v15 + 24);
    *(_WORD *)uint64_t v17 = v14;
    *(unsigned char *)(v17 + 2) = 0;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t CLMonitor.BeaconIdentityCondition.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CLMonitor.BeaconIdentityCondition.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v21 = 0;
  type metadata accessor for UUID();
  lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
    uint64_t v10 = (__int16 *)(v3 + *(int *)(v9 + 20));
    __int16 v11 = *v10;
    LOBYTE(v10) = *((unsigned char *)v10 + 2);
    __int16 v19 = v11;
    char v20 = (char)v10;
    char v18 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UInt16?);
    lazy protocol witness table accessor for type UInt16? and conformance <A> A?();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v12 = (__int16 *)(v3 + *(int *)(v9 + 24));
    __int16 v13 = *v12;
    LOBYTE(v12) = *((unsigned char *)v12 + 2);
    __int16 v16 = v13;
    char v17 = (char)v12;
    v15[15] = 2;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

CLBeaconIdentityCondition __swiftcall CLMonitor.BeaconIdentityCondition.to()()
{
  uint64_t v1 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  uint64_t v2 = (unsigned __int16 *)(v0 + *(int *)(v1 + 20));
  if (v2[1])
  {
    id v3 = objc_allocWithZone(MEMORY[0x263F00A10]);
    v4.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
    uint64_t v5 = (objc_class *)[v3 sel_initWithUUID_:v4.super.isa];
  }
  else
  {
    uint64_t v6 = *v2;
    uint64_t v7 = (unsigned __int16 *)(v0 + *(int *)(v1 + 24));
    if (v7[1])
    {
      id v8 = objc_allocWithZone(MEMORY[0x263F00A10]);
      v4.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
      uint64_t v5 = (objc_class *)[v8 sel_initWithUUID_major_:v4.super.isa:v6];
    }
    else
    {
      uint64_t v9 = *v7;
      id v10 = objc_allocWithZone(MEMORY[0x263F00A10]);
      v4.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
      uint64_t v5 = (objc_class *)[v10 sel_initWithUUID_major_minor_:v4.super.isa:v6:v9];
    }
  }
  v11.super.super.Class isa = v5;

  return v11;
}

uint64_t protocol witness for Decodable.init(from:) in conformance CLMonitor.BeaconIdentityCondition@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CLMonitor.BeaconIdentityCondition.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CLMonitor.BeaconIdentityCondition(void *a1)
{
  return CLMonitor.BeaconIdentityCondition.encode(to:)(a1);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t outlined init with take of ConditionAdapter(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t outlined init with copy of CLMonitor.Record(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
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
        __int16 v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

double specialized Dictionary._Variant.removeValue(forKey:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v17 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      specialized _NativeDictionary.copy()();
      uint64_t v11 = v17;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = (_OWORD *)(*(void *)(v11 + 56) + 96 * v8);
    long long v13 = v12[3];
    a3[2] = v12[2];
    a3[3] = v13;
    long long v14 = v12[5];
    a3[4] = v12[4];
    a3[5] = v14;
    long long v15 = v12[1];
    *a3 = *v12;
    a3[1] = v15;
    specialized _NativeDictionary._delete(at:)(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_2127F7470()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in CLMonitor.init(_:)(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = protocol witness for AsyncIteratorProtocol.next() in conformance CLMonitor.Events.Iterator;
  v4[5] = a1;
  v4[6] = v1;
  return MEMORY[0x270FA2498](closure #1 in CLMonitor.init(_:), 0, 0);
}

uint64_t outlined init with take of CLMonitor.Events(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CLMonitor.Events(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t type metadata accessor for CLMonitoringRecord()
{
  unint64_t result = lazy cache variable for type metadata for CLMonitoringRecord;
  if (!lazy cache variable for type metadata for CLMonitoringRecord)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CLMonitoringRecord);
  }
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, CLMonitor.Record>);
  char v44 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    v43 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v42 = (unint64_t)(v8 + 63) >> 6;
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
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v23 >= v42) {
          goto LABEL_34;
        }
        unint64_t v24 = v43[v23];
        ++v13;
        if (!v24)
        {
          int64_t v13 = v23 + 1;
          if (v23 + 1 >= v42) {
            goto LABEL_34;
          }
          unint64_t v24 = v43[v13];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v42)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (v44)
              {
                uint64_t v41 = 1 << *(unsigned char *)(v5 + 32);
                if (v41 >= 64) {
                  bzero(v43, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v43 = -1 << v41;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v43[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v13 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v42) {
                  goto LABEL_34;
                }
                unint64_t v24 = v43[v13];
                ++v25;
                if (v24) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v25;
          }
        }
LABEL_21:
        unint64_t v10 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v13 << 6);
      }
      uint64_t v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v22);
      uint64_t v28 = *v26;
      uint64_t v27 = v26[1];
      uint64_t v29 = (long long *)(*(void *)(v5 + 56) + 96 * v22);
      if (v44)
      {
        long long v30 = v29[1];
        long long v45 = *v29;
        long long v46 = v30;
        long long v31 = v29[2];
        long long v32 = v29[3];
        long long v33 = v29[5];
        long long v49 = v29[4];
        long long v50 = v33;
        long long v47 = v31;
        long long v48 = v32;
      }
      else
      {
        outlined init with copy of CLMonitor.Record((uint64_t)v29, (uint64_t)&v45);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v34 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v35 = result & ~v34;
      unint64_t v36 = v35 >> 6;
      if (((-1 << v35) & ~*(void *)(v11 + 8 * (v35 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v35) & ~*(void *)(v11 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v37 = 0;
        unint64_t v38 = (unint64_t)(63 - v34) >> 6;
        do
        {
          if (++v36 == v38 && (v37 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v39 = v36 == v38;
          if (v36 == v38) {
            unint64_t v36 = 0;
          }
          v37 |= v39;
          uint64_t v40 = *(void *)(v11 + 8 * v36);
        }
        while (v40 == -1);
        unint64_t v14 = __clz(__rbit64(~v40)) + (v36 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      long long v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *long long v15 = v28;
      v15[1] = v27;
      __int16 v16 = (_OWORD *)(*(void *)(v7 + 56) + 96 * v14);
      long long v17 = v46;
      *__int16 v16 = v45;
      v16[1] = v17;
      long long v18 = v47;
      long long v19 = v48;
      long long v20 = v50;
      v16[4] = v49;
      v16[5] = v20;
      v16[2] = v18;
      v16[3] = v19;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t result = v14 + 96 * v3;
          long long v15 = (const void *)(v14 + 96 * v6);
          if (v3 != v6 || (int64_t v3 = v6, result >= (unint64_t)v15 + 96))
          {
            uint64_t result = (unint64_t)memmove((void *)result, v15, 0x60uLL);
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    __int16 v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    __int16 v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *__int16 v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 96 * v12;
      return outlined assign with take of CLMonitor.Record((uint64_t)a1, v19);
    }
    goto LABEL_13;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_19:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_13:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  int64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *int64_t v23 = a2;
  v23[1] = a3;
  unint64_t v24 = (_OWORD *)(v18[7] + 96 * v12);
  long long v25 = a1[1];
  *unint64_t v24 = *a1;
  v24[1] = v25;
  long long v26 = a1[2];
  long long v27 = a1[3];
  long long v28 = a1[5];
  v24[4] = a1[4];
  v24[5] = v28;
  _OWORD v24[2] = v26;
  v24[3] = v27;
  uint64_t v29 = v18[2];
  BOOL v30 = __OFADD__(v29, 1);
  uint64_t v31 = v29 + 1;
  if (v30)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v18[2] = v31;

  return swift_bridgeObjectRetain();
}

uint64_t outlined destroy of CLMonitor.Events(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CLMonitor.Events(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for CLMonitor.BeaconIdentityCondition(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLMonitor.BeaconIdentityCondition);
}

unint64_t lazy protocol witness table accessor for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type UUID and conformance UUID(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type UInt16? and conformance <A> A?()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt16? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type UInt16? and conformance <A> A?)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for UInt16?);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt16? and conformance <A> A?);
  }
  return result;
}

uint64_t associated type witness table accessor for AsyncIteratorProtocol.Failure : Error in CLMonitor.Events.Iterator()
{
  return MEMORY[0x263F8E4E0];
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in CLMonitor.Events()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type CLMonitor.Events.Iterator and conformance CLMonitor.Events.Iterator, (void (*)(uint64_t))type metadata accessor for CLMonitor.Events.Iterator);
}

uint64_t instantiation function for generic protocol witness table for CLMonitor.CircularGeographicCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CLMonitor.CircularGeographicCondition(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition, (uint64_t (*)(void))lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition);
}

unint64_t lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition()
{
  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CLMonitor.MinimumAltitudeCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CLMonitor.CircularGeographicCondition(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition, (uint64_t (*)(void))lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition);
}

uint64_t instantiation function for generic protocol witness table for CLMonitor.CircularGeographicCondition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition()
{
  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CLMonitor.BeaconIdentityCondition(uint64_t a1)
{
  *(void *)(a1 + 8) = lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition and conformance CLMonitor.BeaconIdentityCondition, (void (*)(uint64_t))type metadata accessor for CLMonitor.BeaconIdentityCondition);
  uint64_t result = lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition and conformance CLMonitor.BeaconIdentityCondition, (void (*)(uint64_t))type metadata accessor for CLMonitor.BeaconIdentityCondition);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t associated type witness table accessor for ConditionAdapter.Condition : CLCondition in CLMonitor.BeaconIdentityCondition()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition and conformance CLMonitor.BeaconIdentityCondition, (void (*)(uint64_t))type metadata accessor for CLMonitor.BeaconIdentityCondition);
}

uint64_t ObjC metadata update function for CLMonitor()
{
  return type metadata accessor for CLMonitor(0);
}

uint64_t type metadata accessor for CLMonitor(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLMonitor);
}

uint64_t type metadata completion function for CLMonitor()
{
  uint64_t result = type metadata accessor for CLMonitor.Events(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CLMonitor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CLMonitor);
}

uint64_t dispatch thunk of CLMonitor.identifiers.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of CLMonitor.add(_:identifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of CLMonitor.add(_:identifier:assuming:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of CLMonitor.remove(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of CLMonitor.record(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of CLMonitor.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 208) + **(int **)(v2 + 208));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = dispatch thunk of CLMonitor.__allocating_init(_:);
  return v8(a1, a2);
}

uint64_t destroy for CLMonitor.Record(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }

  return __swift_destroy_boxed_opaque_existential_1(a1 + 56);
}

uint64_t initializeWithCopy for CLMonitor.Record(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a2 + 16;
  uint64_t v7 = *(void *)(a2 + 40);
  id v8 = v4;
  if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = v9;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8))(v5, v6, v7);
  }
  else
  {
    long long v10 = *(_OWORD *)(v6 + 16);
    *(_OWORD *)uint64_t v5 = *(_OWORD *)v6;
    *(_OWORD *)(v5 + 16) = v10;
    *(void *)(v5 + 32) = *(void *)(v6 + 32);
  }
  long long v11 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 56, a2 + 56);
  return a1;
}

uint64_t assignWithCopy for CLMonitor.Record(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v7)
    {
      *(void *)(a1 + 40) = v7;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 16, a2 + 16);
      goto LABEL_8;
    }
LABEL_7:
    long long v8 = *(_OWORD *)(a2 + 16);
    long long v9 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v8;
    *(_OWORD *)(a1 + 32) = v9;
    goto LABEL_8;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        long long v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for CLMonitor.Record(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  long long v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for CLMonitor.Record(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CLMonitor.Record(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CLMonitor.Record()
{
  return &type metadata for CLMonitor.Record;
}

uint64_t initializeBufferWithCopyOfBuffer for CLMonitor.Event(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for CLMonitor.Event(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  }
}

void *initializeWithCopy for CLMonitor.Event(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *a1 = *(void *)a2;
  long long v5 = a1 + 1;
  uint64_t v6 = a2 + 8;
  uint64_t v7 = *(void *)(a2 + 32);
  id v8 = v4;
  if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 40);
    a1[4] = v7;
    a1[5] = v9;
    (**(void (***)(void *, uint64_t, uint64_t))(v7 - 8))(v5, v6, v7);
  }
  else
  {
    long long v10 = *(_OWORD *)(v6 + 16);
    *(_OWORD *)long long v5 = *(_OWORD *)v6;
    *((_OWORD *)v5 + 1) = v10;
    v5[4] = *(void *)(v6 + 32);
  }
  return a1;
}

uint64_t assignWithCopy for CLMonitor.Event(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  long long v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v7)
    {
      *(void *)(a1 + 32) = v7;
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 8, a2 + 8);
      return a1;
    }
LABEL_7:
    long long v8 = *(_OWORD *)(a2 + 8);
    long long v9 = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(_OWORD *)(a1 + 8) = v8;
    *(_OWORD *)(a1 + 24) = v9;
    return a1;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
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

uint64_t assignWithTake for CLMonitor.Event(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  if (*(void *)(a1 + 32)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  }
  long long v5 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = v5;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for CLMonitor.Event(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CLMonitor.Event(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CLMonitor.Event()
{
  return &type metadata for CLMonitor.Event;
}

uint64_t *initializeBufferWithCopyOfBuffer for CLMonitor.Events(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[5];
    long long v9 = (char *)v4 + v8;
    long long v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    BOOL v14 = *(void **)((char *)a2 + v12);
    *(uint64_t *)((char *)v4 + v12) = (uint64_t)v14;
    uint64_t v15 = (uint64_t *)((char *)v4 + v13);
    char v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    id v18 = v14;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for CLMonitor.Events(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_release();
}

uint64_t initializeWithCopy for CLMonitor.Events(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = *(void **)(a2 + v11);
  *(void *)(a1 + v11) = v13;
  BOOL v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *BOOL v14 = *v15;
  v14[1] = v16;
  id v17 = v13;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CLMonitor.Events(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = *(void **)(a2 + v11);
  uint64_t v13 = *(void **)(a1 + v11);
  *(void *)(a1 + v11) = v12;
  id v14 = v12;

  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  id v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CLMonitor.Events(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for CLMonitor.Events(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = *(void **)(a1 + v11);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);

  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CLMonitor.Events(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2127F935C);
}

uint64_t sub_2127F935C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for CLMonitor.Events(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2127F948C);
}

uint64_t sub_2127F948C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void type metadata completion function for CLMonitor.Events()
{
  type metadata accessor for AsyncStream<CLMonitor.Event>(319, &lazy cache variable for type metadata for AsyncStream<CLMonitor.Event>, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for AsyncStream<CLMonitor.Event>(319, &lazy cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation, MEMORY[0x263F8F590]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for CLMonitor.Events.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void **)((char *)a2 + v8);
    if (v11)
    {
      *(void *)uint64_t v9 = v11;
      uint64_t v12 = *((void *)v10 + 4);
      id v13 = v11;
      if (v12)
      {
        uint64_t v14 = *((void *)v10 + 5);
        *((void *)v9 + 4) = v12;
        *((void *)v9 + 5) = v14;
        (**(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8))((uint64_t)(v9 + 8), (uint64_t)(v10 + 8), v12);
      }
      else
      {
        long long v17 = *(_OWORD *)(v10 + 24);
        *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
        *(_OWORD *)(v9 + 24) = v17;
        *((void *)v9 + 5) = *((void *)v10 + 5);
      }
    }
    else
    {
      long long v16 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v16;
      *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
    }
    uint64_t v18 = *(int *)(a3 + 24);
    uint64_t v19 = (uint64_t *)((char *)a1 + v18);
    BOOL v20 = (uint64_t *)((char *)a2 + v18);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
  }
  swift_retain();
  return a1;
}

uint64_t destroy for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  if (*(void *)v5)
  {

    if (*(void *)(v5 + 32)) {
      __swift_destroy_boxed_opaque_existential_1(v5 + 8);
    }
  }

  return swift_release();
}

uint64_t initializeWithCopy for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a2 + v7);
  if (v10)
  {
    *(void *)uint64_t v8 = v10;
    uint64_t v11 = *(void *)(v9 + 32);
    id v12 = v10;
    if (v11)
    {
      uint64_t v13 = *(void *)(v9 + 40);
      *(void *)(v8 + 32) = v11;
      *(void *)(v8 + 40) = v13;
      (**(void (***)(uint64_t, uint64_t, uint64_t))(v11 - 8))(v8 + 8, v9 + 8, v11);
    }
    else
    {
      long long v15 = *(_OWORD *)(v9 + 24);
      *(_OWORD *)(v8 + 8) = *(_OWORD *)(v9 + 8);
      *(_OWORD *)(v8 + 24) = v15;
      *(void *)(v8 + 40) = *(void *)(v9 + 40);
    }
  }
  else
  {
    long long v14 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v14;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  }
  uint64_t v16 = *(int *)(a3 + 24);
  long long v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = v18[1];
  *long long v17 = *v18;
  v17[1] = v19;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (long long *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)(a2 + v7);
  if (!v10)
  {
    if (!v11)
    {
      long long v20 = *v9;
      long long v21 = v9[2];
      *(_OWORD *)(v8 + 16) = v9[1];
      *(_OWORD *)(v8 + 32) = v21;
      *(_OWORD *)uint64_t v8 = v20;
      goto LABEL_15;
    }
    *(void *)uint64_t v8 = v11;
    uint64_t v13 = v8 + 8;
    long long v14 = (long long *)((char *)v9 + 8);
    uint64_t v16 = *((void *)v9 + 4);
    id v17 = v11;
    if (v16)
    {
      *(void *)(v8 + 32) = v16;
      *(void *)(v8 + 40) = *((void *)v9 + 5);
      (**(void (***)(uint64_t, uint64_t, uint64_t))(v16 - 8))(v8 + 8, (uint64_t)v9 + 8, v16);
      goto LABEL_15;
    }
LABEL_14:
    long long v22 = *v14;
    long long v23 = v14[1];
    *(void *)(v13 + 32) = *((void *)v14 + 4);
    *(_OWORD *)uint64_t v13 = v22;
    *(_OWORD *)(v13 + 16) = v23;
    goto LABEL_15;
  }
  if (!v11)
  {
    outlined destroy of CLMonitor.Event(v8);
    long long v19 = v9[1];
    long long v18 = v9[2];
    *(_OWORD *)uint64_t v8 = *v9;
    *(_OWORD *)(v8 + 16) = v19;
    *(_OWORD *)(v8 + 32) = v18;
    goto LABEL_15;
  }
  *(void *)uint64_t v8 = v11;
  id v12 = v11;

  uint64_t v13 = v8 + 8;
  long long v14 = (long long *)((char *)v9 + 8);
  uint64_t v15 = *((void *)v9 + 4);
  if (!*(void *)(v8 + 32))
  {
    if (v15)
    {
      *(void *)(v8 + 32) = v15;
      *(void *)(v8 + 40) = *((void *)v9 + 5);
      (**(void (***)(uint64_t, uint64_t))(v15 - 8))(v8 + 8, (uint64_t)v9 + 8);
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (!v15)
  {
    __swift_destroy_boxed_opaque_existential_1(v8 + 8);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(v8 + 8), (uint64_t *)v9 + 1);
LABEL_15:
  uint64_t v24 = *(int *)(a3 + 24);
  long long v25 = (void *)(a1 + v24);
  long long v26 = (void *)(a2 + v24);
  uint64_t v27 = v26[1];
  void *v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  v9[2] = v10[2];
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t assignWithTake for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (_OWORD *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  if (!v10) {
    goto LABEL_7;
  }
  if (!*(void *)v9)
  {
    outlined destroy of CLMonitor.Event(v8);
LABEL_7:
    long long v13 = v9[1];
    *(_OWORD *)uint64_t v8 = *v9;
    *(_OWORD *)(v8 + 16) = v13;
    *(_OWORD *)(v8 + 32) = v9[2];
    goto LABEL_8;
  }
  *(void *)uint64_t v8 = *(void *)v9;

  long long v11 = (char *)v9 + 8;
  if (*(void *)(v8 + 32)) {
    __swift_destroy_boxed_opaque_existential_1(v8 + 8);
  }
  long long v12 = *((_OWORD *)v11 + 1);
  *(_OWORD *)(v8 + 8) = *(_OWORD *)v11;
  *(_OWORD *)(v8 + 24) = v12;
  *(void *)(v8 + 40) = *((void *)v11 + 4);
LABEL_8:
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2127F9D98);
}

uint64_t sub_2127F9D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2127F9E70);
}

uint64_t sub_2127F9E70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void type metadata completion function for CLMonitor.Events.Iterator()
{
  type metadata accessor for AsyncStream<CLMonitor.Event>(319, &lazy cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator, MEMORY[0x263F8F5A8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for AsyncStream<CLMonitor.Event>(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, ValueMetadata *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for CLMonitor.Event);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CLMonitor.CircularGeographicCondition(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CLMonitor.CircularGeographicCondition(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CLMonitor.CircularGeographicCondition()
{
  return &type metadata for CLMonitor.CircularGeographicCondition;
}

ValueMetadata *type metadata accessor for CLMonitor.MinimumAltitudeCondition()
{
  return &type metadata for CLMonitor.MinimumAltitudeCondition;
}

uint64_t *initializeBufferWithCopyOfBuffer for CLMonitor.BeaconIdentityCondition(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    unint64_t v10 = (char *)a1 + v8;
    long long v11 = (char *)a2 + v8;
    *(_WORD *)unint64_t v10 = *(_WORD *)v11;
    v10[2] = v11[2];
    long long v12 = (char *)a1 + v9;
    long long v13 = (char *)a2 + v9;
    *(_WORD *)long long v12 = *(_WORD *)v13;
    v12[2] = v13[2];
  }
  return a1;
}

uint64_t destroy for CLMonitor.BeaconIdentityCondition(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  char v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for CLMonitor.BeaconIdentityCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_WORD *)uint64_t v9 = *(_WORD *)v10;
  *(unsigned char *)(v9 + 2) = *(unsigned char *)(v10 + 2);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(_WORD *)uint64_t v11 = *(_WORD *)v12;
  *(unsigned char *)(v11 + 2) = *(unsigned char *)(v12 + 2);
  return a1;
}

uint64_t assignWithCopy for CLMonitor.BeaconIdentityCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 2);
  *(_WORD *)uint64_t v8 = *(_WORD *)v9;
  *(unsigned char *)(v8 + 2) = v10;
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  char v14 = *(unsigned char *)(v13 + 2);
  *(_WORD *)uint64_t v12 = *(_WORD *)v13;
  *(unsigned char *)(v12 + 2) = v14;
  return a1;
}

uint64_t initializeWithTake for CLMonitor.BeaconIdentityCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_WORD *)uint64_t v9 = *(_WORD *)v10;
  *(unsigned char *)(v9 + 2) = *(unsigned char *)(v10 + 2);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(_WORD *)uint64_t v11 = *(_WORD *)v12;
  *(unsigned char *)(v11 + 2) = *(unsigned char *)(v12 + 2);
  return a1;
}

uint64_t assignWithTake for CLMonitor.BeaconIdentityCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_WORD *)uint64_t v9 = *(_WORD *)v10;
  *(unsigned char *)(v9 + 2) = *(unsigned char *)(v10 + 2);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(_WORD *)uint64_t v11 = *(_WORD *)v12;
  *(unsigned char *)(v11 + 2) = *(unsigned char *)(v12 + 2);
  return a1;
}

uint64_t getEnumTagSinglePayload for CLMonitor.BeaconIdentityCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2127FA4C0);
}

uint64_t sub_2127FA4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CLMonitor.BeaconIdentityCondition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2127FA540);
}

uint64_t sub_2127FA540(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata completion function for CLMonitor.BeaconIdentityCondition()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *type metadata accessor for CLMonitor.Options()
{
  return &unk_26C3BA108;
}

void *type metadata accessor for CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  return &unk_26C3B9DB8;
}

uint64_t getEnumTagSinglePayload for CLMonitor.MinimumAltitudeCondition.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for CLMonitor.MinimumAltitudeCondition.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2127FA760);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return 0;
}

void *type metadata accessor for CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return &unk_26C3B9E60;
}

uint64_t getEnumTagSinglePayload for CLMonitor.BeaconIdentityCondition.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CLMonitor.BeaconIdentityCondition.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2127FA8FCLL);
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

void *type metadata accessor for CLMonitor.CircularGeographicCondition.CodingKeys()
{
  return &unk_26C3B9F30;
}

unint64_t lazy protocol witness table accessor for type CLMonitor.Options and conformance CLMonitor.Options()
{
  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options;
  if (!lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options;
  if (!lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options;
  if (!lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options;
  if (!lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options);
  }
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, CLMonitor.Record>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
    unint64_t result = (void *)swift_release();
LABEL_28:
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t v31 = v1;
  unint64_t result = (void *)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    uint64_t v5 = *(void *)(v2 + 16);
  }
  int64_t v10 = 0;
  *(void *)(v4 + 16) = v5;
  uint64_t v11 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v14) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v7 + 8 * v28);
    ++v10;
    if (!v29)
    {
      int64_t v10 = v28 + 1;
      if (v28 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v7 + 8 * v10);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v29 - 1) & v29;
    unint64_t v16 = __clz(__rbit64(v29)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    long long v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v16);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = 96 * v16;
    outlined init with copy of CLMonitor.Record(*(void *)(v2 + 56) + 96 * v16, (uint64_t)v32);
    long long v22 = (void *)(*(void *)(v4 + 48) + v17);
    void *v22 = v20;
    v22[1] = v19;
    long long v23 = (_OWORD *)(*(void *)(v4 + 56) + v21);
    long long v24 = v32[1];
    *long long v23 = v32[0];
    long long v25 = v32[2];
    long long v26 = v32[3];
    long long v27 = v32[5];
    v23[4] = v32[4];
    v23[5] = v27;
    v23[2] = v25;
    v23[3] = v26;
    v23[1] = v24;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v14)
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    unint64_t v1 = v31;
    goto LABEL_28;
  }
  unint64_t v29 = *(void *)(v7 + 8 * v30);
  if (v29)
  {
    int64_t v10 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v7 + 8 * v10);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

unint64_t specialized CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:)(Swift::String string, Swift::OpaquePointer cases)
{
  object = string._object;
  v3._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease();
  if (v5 >= 3) {
    return 3;
  }
  else {
    return v5;
  }
}

uint64_t outlined init with take of CLCondition?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLCondition?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CLMonitor.Record(uint64_t a1)
{
  return a1;
}

uint64_t outlined assign with take of CLMonitor.Record(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t partial apply for closure #1 in CLMonitor.Events.init(_:_:)(uint64_t a1)
{
  return closure #1 in CLMonitor.Events.init(_:_:)(a1, *(void *)(v1 + 16));
}

uint64_t partial apply for closure #2 in CLMonitor.Events.init(_:_:)(uint64_t a1, void *a2)
{
  return closure #2 in CLMonitor.Events.init(_:_:)(a1, a2);
}

uint64_t outlined destroy of CLMonitor.Event?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with copy of CLCondition?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t related decl 'e' for CLError.alternateRegion.getter(uint64_t a1)
{
  *(void *)&long long v8 = a1;
  type metadata accessor for related decl 'e' for CLError(0);
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError();
  uint64_t v1 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v1 + 16) && (unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v9 + 1))
  {
    type metadata accessor for CLRegion();
    if (swift_dynamicCast()) {
      return v7;
    }
    else {
      return 0;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v8);
    return 0;
  }
}

unint64_t lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError()
{
  unint64_t result = lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError;
  if (!lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError)
  {
    type metadata accessor for related decl 'e' for CLError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError);
  }
  return result;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for CLRegion()
{
  unint64_t result = lazy cache variable for type metadata for CLRegion;
  if (!lazy cache variable for type metadata for CLRegion)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CLRegion);
  }
  return result;
}

uint64_t CLServiceSession.__allocating_init(authorization:)(unsigned __int8 *a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = *a1;
  *(void *)(v2 + 24) = 0;
  id v4 = [self sel_disconnectedSessionRequiringAuthorization_:v3];
  *(void *)(v2 + 16) = v4;
  type metadata accessor for CLServiceSession.Diagnostics(0);
  swift_allocObject();
  id v5 = v4;
  uint64_t v6 = specialized CLServiceSession.Diagnostics.init(_:)(v5);

  *(void *)(v2 + 24) = v6;
  return v2;
}

uint64_t CLServiceSession.init(authorization:)(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *a1;
  *(void *)(v2 + 24) = 0;
  id v4 = [self sel_disconnectedSessionRequiringAuthorization_:v3];
  *(void *)(v2 + 16) = v4;
  type metadata accessor for CLServiceSession.Diagnostics(0);
  swift_allocObject();
  id v5 = v4;
  uint64_t v6 = specialized CLServiceSession.Diagnostics.init(_:)(v5);

  *(void *)(v2 + 24) = v6;
  swift_release();
  return v2;
}

uint64_t type metadata accessor for CLServiceSession.Diagnostics(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLServiceSession.Diagnostics);
}

uint64_t CLServiceSession.__allocating_init(authorization:fullAccuracyPurposeKey:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = *a1;
  *(void *)(v6 + 24) = 0;
  long long v8 = self;
  long long v9 = (void *)MEMORY[0x216681600](a2, a3);
  swift_bridgeObjectRelease();
  id v10 = [v8 sel_disconnectedSessionRequiringAuthorization_fullAccuracyPurposeKey_:v7, v9];

  *(void *)(v6 + 16) = v10;
  type metadata accessor for CLServiceSession.Diagnostics(0);
  swift_allocObject();
  id v11 = v10;
  uint64_t v12 = specialized CLServiceSession.Diagnostics.init(_:)(v11);

  *(void *)(v6 + 24) = v12;
  return v6;
}

uint64_t CLServiceSession.init(authorization:fullAccuracyPurposeKey:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *a1;
  *(void *)(v4 + 24) = 0;
  long long v8 = self;
  long long v9 = (void *)MEMORY[0x216681600](a2, a3);
  swift_bridgeObjectRelease();
  id v10 = [v8 sel_disconnectedSessionRequiringAuthorization_fullAccuracyPurposeKey_:v7, v9];

  *(void *)(v4 + 16) = v10;
  type metadata accessor for CLServiceSession.Diagnostics(0);
  swift_allocObject();
  id v11 = v10;
  uint64_t v12 = specialized CLServiceSession.Diagnostics.init(_:)(v11);

  *(void *)(v4 + 24) = v12;
  swift_release();
  return v4;
}

void thunk for @escaping @callee_guaranteed (@guaranteed CLServiceSessionDiagnostic) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

Swift::Void __swiftcall CLServiceSession.invalidate()()
{
  [*(id *)(v0 + 16) sel_invalidate];
}

uint64_t CLServiceSession.deinit()
{
  swift_release();
  return v0;
}

uint64_t CLServiceSession.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t CLLocationManager.serviceSession()()
{
  return CLLocationManager.serviceSession()(1);
}

uint64_t CLLocationManager.privilegedServiceSession()()
{
  return CLLocationManager.serviceSession()(2);
}

uint64_t CLLocationManager.serviceSession()(uint64_t a1)
{
  type metadata accessor for CLServiceSession();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 24) = 0;
  id v4 = self;
  id v5 = v1;
  id v6 = [v4 sessionWithLocationManager:v5 authorizationRequirement:a1 fullAccuracyPurposeKey:0 queue:0 handler:0];
  *(void *)(v3 + 16) = v6;
  type metadata accessor for CLServiceSession.Diagnostics(0);
  swift_allocObject();
  id v7 = v6;
  uint64_t v8 = specialized CLServiceSession.Diagnostics.init(_:)(v7);

  *(void *)(v3 + 24) = v8;
  return v3;
}

id CLServiceSession.Diagnostic.authorizationDenied.getter()
{
  return [*v0 sel_authorizationDenied];
}

id CLServiceSession.Diagnostic.authorizationDeniedGlobally.getter()
{
  return [*v0 sel_authorizationDeniedGlobally];
}

id CLServiceSession.Diagnostic.authorizationRestricted.getter()
{
  return [*v0 sel_authorizationRestricted];
}

id CLServiceSession.Diagnostic.insufficientlyInUse.getter()
{
  return [*v0 sel_insufficientlyInUse];
}

id CLServiceSession.Diagnostic.fullAccuracyDenied.getter()
{
  return [*v0 sel_fullAccuracyDenied];
}

id CLServiceSession.Diagnostic.alwaysAuthorizationDenied.getter()
{
  return [*v0 sel_alwaysAuthorizationDenied];
}

id CLServiceSession.Diagnostic.serviceSessionRequired.getter()
{
  return [*v0 sel_serviceSessionRequired];
}

id CLServiceSession.Diagnostic.authorizationRequestInProgress.getter()
{
  return [*v0 sel_authorizationRequestInProgress];
}

uint64_t CLServiceSession.Diagnostics.Iterator.next()(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  *uint64_t v3 = v1;
  v3[1] = CLServiceSession.Diagnostics.Iterator.next();
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t CLServiceSession.Diagnostics.Iterator.next()()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance CLServiceSession.Diagnostics.Iterator(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  *uint64_t v3 = v1;
  v3[1] = protocol witness for AsyncIteratorProtocol.next() in conformance CLServiceSession.Diagnostics.Iterator;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t CLServiceSession.Diagnostics.makeAsyncIterator()()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)logger);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2127EE000, v1, v2, "#serviceSession makeAsyncIterator", v3, 2u);
    MEMORY[0x216681E40](v3, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>);
  return AsyncStream.makeAsyncIterator()();
}

void closure #1 in CLServiceSession.Diagnostics.init(_:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation.YieldResult);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = a1;
  id v6 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)logger);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_2127EE000, v8, v9, "#serviceSession yielding a Diagnostic", v10, 2u);
    MEMORY[0x216681E40](v10, -1, -1);
  }
}

id closure #2 in CLServiceSession.Diagnostics.init(_:)(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)logger);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2127EE000, v4, v5, "#serviceSession terminating", v6, 2u);
    MEMORY[0x216681E40](v6, -1, -1);
  }

  uint64_t v7 = *(void **)(a2 + OBJC_IVAR____TtCC12CoreLocation16CLServiceSession11Diagnostics_serviceSession);

  return [v7 invalidate];
}

uint64_t CLServiceSession.Diagnostics.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC12CoreLocation16CLServiceSession11Diagnostics_stream;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t CLServiceSession.Diagnostics.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC12CoreLocation16CLServiceSession11Diagnostics_stream;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance CLServiceSession.Diagnostics()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)logger);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2127EE000, v1, v2, "#serviceSession makeAsyncIterator", v3, 2u);
    MEMORY[0x216681E40](v3, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>);
  AsyncStream.makeAsyncIterator()();

  return swift_release();
}

uint64_t CLServiceSession.diagnostics.getter()
{
  uint64_t v1 = v0;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)logger);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl(&dword_2127EE000, v3, v4, "#serviceSession creating a Diagnostics AsyncSequence", v5, 2u);
    MEMORY[0x216681E40](v5, -1, -1);
  }

  uint64_t result = *(void *)(v1 + 24);
  if (result)
  {
    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL static CLServiceSession.AuthorizationRequirement.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void CLServiceSession.AuthorizationRequirement.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int CLServiceSession.AuthorizationRequirement.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CLServiceSession.AuthorizationRequirement(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CLServiceSession.AuthorizationRequirement()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CLServiceSession.AuthorizationRequirement()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CLServiceSession.AuthorizationRequirement()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t specialized CLServiceSession.Diagnostics.init(_:)(void *a1)
{
  long long v33 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation.BufferingPolicy);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  os_log_type_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation);
  uint64_t v31 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v31 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v30 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  int64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F580], v1);
  static AsyncStream.makeStream(of:bufferingPolicy:)();
  unint64_t v15 = v4;
  uint64_t v16 = v32;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v15, v1);
  uint64_t v34 = v12;
  uint64_t v35 = v11;
  uint64_t v17 = v11;
  uint64_t v18 = v5;
  uint64_t v19 = v31;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v16 + OBJC_IVAR____TtCC12CoreLocation16CLServiceSession11Diagnostics_stream, v14, v17);
  uint64_t v20 = v33;
  *(void *)(v16 + OBJC_IVAR____TtCC12CoreLocation16CLServiceSession11Diagnostics_serviceSession) = v33;
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v8, v10, v18);
  unint64_t v21 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v22 + v21, v8, v18);
  aBlock[4] = partial apply for closure #1 in CLServiceSession.Diagnostics.init(_:);
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CLServiceSessionDiagnostic) -> ();
  aBlock[3] = &block_descriptor_0;
  long long v23 = _Block_copy(aBlock);
  id v24 = v20;
  swift_release();
  [v24 setHandler:v23];
  _Block_release(v23);

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)logger);
  long long v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v26, v27))
  {
    int64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v28 = 0;
    _os_log_impl(&dword_2127EE000, v26, v27, "#serviceSession successfully created", v28, 2u);
    MEMORY[0x216681E40](v28, -1, -1);
  }

  swift_retain();
  AsyncStream.Continuation.onTermination.setter();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v18);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v35);
  return v16;
}

uint64_t type metadata accessor for CLServiceSession()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type CLServiceSession.Diagnostics.Iterator and conformance CLServiceSession.Diagnostics.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type CLServiceSession.Diagnostics.Iterator and conformance CLServiceSession.Diagnostics.Iterator;
  if (!lazy protocol witness table cache variable for type CLServiceSession.Diagnostics.Iterator and conformance CLServiceSession.Diagnostics.Iterator)
  {
    type metadata accessor for CLServiceSession.Diagnostics.Iterator(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLServiceSession.Diagnostics.Iterator and conformance CLServiceSession.Diagnostics.Iterator);
  }
  return result;
}

uint64_t type metadata accessor for CLServiceSession.Diagnostics.Iterator(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLServiceSession.Diagnostics.Iterator);
}

unint64_t lazy protocol witness table accessor for type CLServiceSession.AuthorizationRequirement and conformance CLServiceSession.AuthorizationRequirement()
{
  unint64_t result = lazy protocol witness table cache variable for type CLServiceSession.AuthorizationRequirement and conformance CLServiceSession.AuthorizationRequirement;
  if (!lazy protocol witness table cache variable for type CLServiceSession.AuthorizationRequirement and conformance CLServiceSession.AuthorizationRequirement)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLServiceSession.AuthorizationRequirement and conformance CLServiceSession.AuthorizationRequirement);
  }
  return result;
}

uint64_t method lookup function for CLServiceSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CLServiceSession);
}

uint64_t dispatch thunk of CLServiceSession.__allocating_init(authorization:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of CLServiceSession.__allocating_init(authorization:fullAccuracyPurposeKey:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for CLServiceSession.Diagnostic()
{
  return &type metadata for CLServiceSession.Diagnostic;
}

uint64_t ObjC metadata update function for CLServiceSession.Diagnostics()
{
  return type metadata accessor for CLServiceSession.Diagnostics(0);
}

void type metadata completion function for CLServiceSession.Diagnostics()
{
  type metadata accessor for AsyncStream<CLServiceSession.Diagnostic>(319, &lazy cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for CLServiceSession.Diagnostics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CLServiceSession.Diagnostics);
}

uint64_t initializeBufferWithCopyOfBuffer for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for CLServiceSession.Diagnostics.Iterator(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2127FCE84);
}

uint64_t sub_2127FCE84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2127FCF08);
}

uint64_t sub_2127FCF08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void type metadata completion function for CLServiceSession.Diagnostics.Iterator()
{
  type metadata accessor for AsyncStream<CLServiceSession.Diagnostic>(319, &lazy cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator, MEMORY[0x263F8F5A8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for AsyncStream<CLServiceSession.Diagnostic>(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, ValueMetadata *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for CLServiceSession.Diagnostic);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for CLServiceSession.AuthorizationRequirement(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2127FD140);
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

ValueMetadata *type metadata accessor for CLServiceSession.AuthorizationRequirement()
{
  return &type metadata for CLServiceSession.AuthorizationRequirement;
}

uint64_t sub_2127FD178()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void partial apply for closure #1 in CLServiceSession.Diagnostics.init(_:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation);

  closure #1 in CLServiceSession.Diagnostics.init(_:)(a1);
}

id partial apply for closure #2 in CLServiceSession.Diagnostics.init(_:)(uint64_t a1)
{
  return closure #2 in CLServiceSession.Diagnostics.init(_:)(a1, v1);
}

const char *one-time initialization function for CLLocationCoordinate2DInNSValueObjCType()
{
  unint64_t result = closure #1 in variable initialization expression of CLLocationCoordinate2DInNSValueObjCType();
  CLLocationCoordinate2DInNSValueObjCType = (uint64_t)result;
  return result;
}

const char *closure #1 in variable initialization expression of CLLocationCoordinate2DInNSValueObjCType()
{
  uint64_t v0 = Selector.init(_:)();
  type metadata accessor for NSValue();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v2 = (uint64_t (*)(void *, uint64_t, double, double))[ObjCClassFromMetadata sel_methodForSelector:v0];
  if (v2)
  {
    id v3 = (id)v2(ObjCClassFromMetadata, v0, 0.0, 0.0);
    id v4 = [v3 objCType];
    id v5 = v3;
    return (const char *)v4;
  }
  else
  {
    type metadata accessor for CLLocationCoordinate2D(0);
    return "{CLLocationCoordinate2D=dd}";
  }
}

NSValue __swiftcall CLLocationCoordinate2D._bridgeToObjectiveC()()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = v0;
  uint64_t v4 = v1;
  if (one-time initialization token for CLLocationCoordinate2DInNSValueObjCType != -1) {
    swift_once();
  }
  return (NSValue)[objc_allocWithZone(MEMORY[0x263F08D40]) initWithBytes:&v3 objCType:CLLocationCoordinate2DInNSValueObjCType];
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CLLocationCoordinate2D()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  long long v2 = *v0;
  if (one-time initialization token for CLLocationCoordinate2DInNSValueObjCType != -1) {
    swift_once();
  }
  return [objc_allocWithZone(MEMORY[0x263F08D40]) initWithBytes:&v2 objCType:CLLocationCoordinate2DInNSValueObjCType];
}

void protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CLLocationCoordinate2D(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(double *)a2 = specialized static CLLocationCoordinate2D._unconditionallyBridgeFromObjectiveC(_:)(a1);
  *(void *)(a2 + 8) = v3;
}

double specialized static CLLocationCoordinate2D._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = (const char *)[v3 objCType];
  if (one-time initialization token for CLLocationCoordinate2DInNSValueObjCType != -1) {
    swift_once();
  }
  if (strcmp(v4, (const char *)CLLocationCoordinate2DInNSValueObjCType)) {
    __break(1u);
  }
  *(_OWORD *)uint64_t v6 = 0uLL;
  [v3 sel_getValue_:v6];
  double result = v6[0];
  *(_OWORD *)a2 = *(_OWORD *)v6;
  *(unsigned char *)(a2 + 16) = 0;
  return result;
}

BOOL specialized static CLLocationCoordinate2D._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = (const char *)[v3 objCType];
  if (one-time initialization token for CLLocationCoordinate2DInNSValueObjCType != -1) {
    swift_once();
  }
  int v5 = strcmp(v4, (const char *)CLLocationCoordinate2DInNSValueObjCType);
  long long v6 = 0uLL;
  if (!v5)
  {
    long long v8 = 0uLL;
    [v3 setValue:&v8 forKey:@"foo"];
    long long v6 = v8;
  }
  BOOL result = v5 == 0;
  *(_OWORD *)a2 = v6;
  *(unsigned char *)(a2 + 16) = v5 != 0;
  return result;
}

double specialized static CLLocationCoordinate2D._unconditionallyBridgeFromObjectiveC(_:)(void *a1)
{
  v4[2] = *MEMORY[0x263EF8340];
  if (!a1) {
LABEL_7:
  }
    __break(1u);
  id v1 = a1;
  long long v2 = (const char *)[v1 objCType];
  if (one-time initialization token for CLLocationCoordinate2DInNSValueObjCType != -1) {
    swift_once();
  }
  if (strcmp(v2, (const char *)CLLocationCoordinate2DInNSValueObjCType))
  {
    __break(1u);
    goto LABEL_7;
  }
  v4[0] = 0;
  v4[1] = 0;
  [v1 sel_getValue_:v4];
  return *(double *)v4;
}

unint64_t type metadata accessor for NSValue()
{
  unint64_t result = lazy cache variable for type metadata for NSValue;
  if (!lazy cache variable for type metadata for NSValue)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSValue);
  }
  return result;
}

id CLLocationUpdate.location.getter()
{
  id v1 = [*v0 sel_location];

  return v1;
}

id CLLocationUpdate.isStationary.getter()
{
  return [*v0 sel_isStationary];
}

id CLLocationUpdate.stationary.getter()
{
  return [*v0 sel_stationary];
}

id CLLocationUpdate.authorizationDeniedGlobally.getter()
{
  return [*v0 sel_authorizationDeniedGlobally];
}

id CLLocationUpdate.authorizationRestricted.getter()
{
  return [*v0 sel_authorizationRestricted];
}

id CLLocationUpdate.insufficientlyInUse.getter()
{
  return [*v0 sel_insufficientlyInUse];
}

id CLLocationUpdate.locationUnavailable.getter()
{
  return [*v0 sel_locationUnavailable];
}

id CLLocationUpdate.accuracyLimited.getter()
{
  return [*v0 sel_accuracyLimited];
}

id CLLocationUpdate.serviceSessionRequired.getter()
{
  return [*v0 sel_serviceSessionRequired];
}

id CLLocationUpdate.authorizationRequestInProgress.getter()
{
  return [*v0 sel_authorizationRequestInProgress];
}

BOOL static CLLocationUpdate.LiveConfiguration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void CLLocationUpdate.LiveConfiguration.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int CLLocationUpdate.LiveConfiguration.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void static CLLocationUpdate.historicalUpdates(interestInterval:maxSampleCount:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  char v7 = a3 & 1;
  uint64_t v8 = type metadata accessor for DateInterval();
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v10, a1);
  CLLocationUpdate.Updates.init(_:interestInterval:maxSampleCount:)(0, v10, a2, v7, a4);
}

void CLLocationUpdate.Updates.init(_:interestInterval:maxSampleCount:)(void *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for DateInterval();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v14 = a1;
    v15.super.Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
    if (a4) {
      uint64_t v16 = 0x7FFFFFFFLL;
    }
    else {
      uint64_t v16 = a3;
    }
    if (v16 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (v16 <= 0x7FFFFFFF)
    {
      Class isa = v15.super.isa;
      id v38 = [v14 sel_historicalUpdaterWithDateInterval_sampleCount_queue_handler_:v15.super.isa];

      goto LABEL_14;
    }
    __break(1u);
    goto LABEL_23;
  }
  Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
  if (a4) {
    uint64_t v18 = 0x7FFFFFFFLL;
  }
  else {
    uint64_t v18 = a3;
  }
  uint64_t v19 = self;
  if (v18 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v18 > 0x7FFFFFFF)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v38 = [v19 historicalUpdaterWithDateInterval:v18 sampleCount:0 queue:0 handler:0];
LABEL_14:
  uint64_t v35 = a3;

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v36 = a5;
  uint64_t v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)logger);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, a2, v10);
  unint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  BOOL v23 = os_log_type_enabled(v21, v22);
  id v37 = a1;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v34 = a2;
    uint64_t v25 = v24;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v41 = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    lazy protocol witness table accessor for type CLLocationUpdate.Updates.Iterator and conformance CLLocationUpdate.Updates.Iterator(&lazy protocol witness table cache variable for type DateInterval and conformance DateInterval, MEMORY[0x263F062D0]);
    uint64_t v27 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v39 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v28, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v29 = *(void (**)(char *, uint64_t))(v11 + 8);
    v29(v13, v10);
    *(_WORD *)(v25 + 12) = 2080;
    uint64_t v39 = v35;
    char v40 = a4 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int?);
    uint64_t v30 = String.init<A>(describing:)();
    uint64_t v39 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2127EE000, v21, v22, "#LocationUpdates Creating historicalUpdates with interestInterval: %s, maxSampleCount: %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x216681E40](v26, -1, -1);
    uint64_t v32 = v25;
    a2 = v34;
    MEMORY[0x216681E40](v32, -1, -1);
  }
  else
  {
    unint64_t v29 = *(void (**)(char *, uint64_t))(v11 + 8);
    v29(v13, v10);
  }

  if (v38)
  {
    id v33 = v38;
    CLLocationUpdate.Updates.init(updater:isHistorical:)(v33, 1, v36);

    v29(a2, v10);
    return;
  }
LABEL_25:
  __break(1u);
}

void static CLLocationUpdate.historicalUpdates(center:radius:interestInterval:maxSampleCount:)(uint64_t a1@<X0>, double a2@<X1>, char a3@<W2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>)
{
  int v13 = a3 & 1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v17 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of DateInterval?(a1, (uint64_t)v16);
  CLLocationUpdate.Updates.init(_:center:radius:interestInterval:maxSampleCount:)(0, (uint64_t)v16, a2, v13, a4, a5, a6, a7);
}

uint64_t outlined init with copy of DateInterval?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void CLLocationUpdate.Updates.init(_:center:radius:interestInterval:maxSampleCount:)(void *a1@<X0>, uint64_t a2@<X1>, double a3@<X2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>)
{
  uint64_t v57 = a5;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  uint64_t v15 = MEMORY[0x270FA5388](v56);
  v55 = &v51[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = &v51[-v18];
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  os_log_type_t v22 = &v51[-v21];
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = &v51[-v23];
  id v58 = a1;
  if (a1)
  {
    uint64_t v25 = *(void *)&a3;
    int v26 = a4;
    outlined init with copy of DateInterval?(a2, (uint64_t)&v51[-v23]);
    uint64_t v27 = type metadata accessor for DateInterval();
    uint64_t v28 = *(void *)(v27 - 8);
    int v29 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v28 + 48))(v24, 1, v27);
    id v30 = v58;
    Class isa = 0;
    if (v29 != 1)
    {
      Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
      (*(void (**)(unsigned char *, uint64_t))(v28 + 8))(v24, v27);
    }
    if (v26) {
      uint64_t v32 = 0x7FFFFFFFLL;
    }
    else {
      uint64_t v32 = v25;
    }
    if (v32 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (v32 <= 0x7FFFFFFF)
    {
      a4 = v26;
      a3 = *(double *)&v25;
      id v33 = [v30 sel_historicalUpdaterWithDateInterval_sampleCount_queue_handler_:isa];

      goto LABEL_18;
    }
    __break(1u);
    goto LABEL_27;
  }
  outlined init with copy of DateInterval?(a2, (uint64_t)v22);
  uint64_t v34 = type metadata accessor for DateInterval();
  uint64_t v35 = *(void *)(v34 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v35 + 48))(v22, 1, v34) != 1)
  {
    Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
    (*(void (**)(unsigned char *, uint64_t))(v35 + 8))(v22, v34);
  }
  if (a4) {
    uint64_t v36 = 0x7FFFFFFFLL;
  }
  else {
    uint64_t v36 = *(void *)&a3;
  }
  id v37 = self;
  if (v36 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v36 > 0x7FFFFFFF)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v33 = [v37 _historicalUpdaterWithCenter:isa radius:v36 dateInterval:0 sampleCount:0 queue:a6 handler:a7];
LABEL_18:

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v38 = type metadata accessor for Logger();
  __swift_project_value_buffer(v38, (uint64_t)logger);
  outlined init with copy of DateInterval?(a2, (uint64_t)v19);
  uint64_t v39 = Logger.logObject.getter();
  os_log_type_t v40 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    int v52 = a4;
    uint64_t v43 = v42;
    uint64_t v61 = v42;
    *(_DWORD *)uint64_t v41 = 136315906;
    double v59 = a6;
    double v60 = a7;
    type metadata accessor for CLLocationCoordinate2D(0);
    id v53 = v33;
    uint64_t v44 = String.init<A>(describing:)();
    uint64_t v54 = a2;
    double v59 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v45, &v61));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 12) = 2048;
    double v59 = a8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v41 + 22) = 2080;
    outlined init with copy of DateInterval?((uint64_t)v19, (uint64_t)v55);
    uint64_t v46 = String.init<A>(describing:)();
    double v59 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v47, &v61));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of DateInterval?((uint64_t)v19);
    *(_WORD *)(v41 + 32) = 2080;
    double v59 = a3;
    LOBYTE(v60) = v52 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int?);
    uint64_t v48 = String.init<A>(describing:)();
    double v59 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v49, &v61));
    id v33 = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    a2 = v54;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2127EE000, v39, v40, "#LocationUpdates Creating historicalUpdates with center: %s,  with radius: %f, interestInterval: %s, sampleCount: %s", (uint8_t *)v41, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x216681E40](v43, -1, -1);
    MEMORY[0x216681E40](v41, -1, -1);
  }
  else
  {
    outlined destroy of DateInterval?((uint64_t)v19);
  }

  if (v33)
  {
    id v50 = v33;
    CLLocationUpdate.Updates.init(updater:isHistorical:)(v50, 1, v57);

    outlined destroy of DateInterval?(a2);
    return;
  }
LABEL_29:
  __break(1u);
}

uint64_t CLLocationUpdate.Updates.Iterator.next()(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x270FA2498](CLLocationUpdate.Updates.Iterator.next(), 0, 0);
}

uint64_t _s12CoreLocation16CLLocationUpdateV7UpdatesV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a3;
  v5[5] = a4;
  v5[3] = a2;
  char v7 = (void *)swift_task_alloc();
  v5[6] = v7;
  *char v7 = v5;
  v7[1] = _s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  v7[5] = a1;
  v7[6] = v4;
  return MEMORY[0x270FA2498](CLLocationUpdate.Updates.Iterator.next(), 0, 0);
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance CLLocationUpdate.Updates@<X0>(uint64_t a1@<X8>)
{
  CLLocationUpdate.Updates.makeAsyncIterator()(a1);

  return outlined destroy of CLLocationUpdate.Updates(v1);
}

void CLLocationManager.liveUpdates(_:)(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v5 = *a1;
  id v4 = v2;
  CLLocationUpdate.Updates.init(_:configuration:)(v2, &v5, a2);
}

void CLLocationManager.historicalUpdates(interestInterval:maxSampleCount:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  char v8 = a3 & 1;
  uint64_t v9 = type metadata accessor for DateInterval();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, a1);
  id v13 = v4;
  CLLocationUpdate.Updates.init(_:interestInterval:maxSampleCount:)(v4, v11, a2, v8, a4);
}

void CLLocationManager.historicalUpdates(center:radius:interestInterval:maxSampleCount:)(uint64_t a1@<X0>, double a2@<X1>, char a3@<W2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>)
{
  int v14 = a3 & 1;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of DateInterval?(a1, (uint64_t)v17);
  id v18 = v7;
  CLLocationUpdate.Updates.init(_:center:radius:interestInterval:maxSampleCount:)(v7, (uint64_t)v17, a2, v14, a4, a5, a6, a7);
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
  id v13 = a4 + 32;
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

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  id v4 = *result;
  *id v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t lazy protocol witness table accessor for type CLLocationUpdate.LiveConfiguration and conformance CLLocationUpdate.LiveConfiguration()
{
  unint64_t result = lazy protocol witness table cache variable for type CLLocationUpdate.LiveConfiguration and conformance CLLocationUpdate.LiveConfiguration;
  if (!lazy protocol witness table cache variable for type CLLocationUpdate.LiveConfiguration and conformance CLLocationUpdate.LiveConfiguration)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLLocationUpdate.LiveConfiguration and conformance CLLocationUpdate.LiveConfiguration);
  }
  return result;
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in CLLocationUpdate.Updates()
{
  return lazy protocol witness table accessor for type CLLocationUpdate.Updates.Iterator and conformance CLLocationUpdate.Updates.Iterator(&lazy protocol witness table cache variable for type CLLocationUpdate.Updates.Iterator and conformance CLLocationUpdate.Updates.Iterator, (void (*)(uint64_t))type metadata accessor for CLLocationUpdate.Updates.Iterator);
}

uint64_t getEnumTagSinglePayload for CLLocationUpdate.LiveConfiguration(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CLLocationUpdate.LiveConfiguration(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2127FED4CLL);
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

uint64_t *initializeBufferWithCopyOfBuffer for CLLocationUpdate.Updates(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    int64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

uint64_t initializeWithCopy for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t initializeWithTake for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithTake for CLLocationUpdate.Updates(a1, a2, a3, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
}

uint64_t assignWithTake for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2127FF000);
}

uint64_t sub_2127FF000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
}

uint64_t storeEnumTagSinglePayload for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2127FF020);
}

uint64_t sub_2127FF020(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
}

uint64_t *initializeBufferWithCopyOfBuffer for CLLocationUpdate.Updates.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t initializeWithCopy for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithTake for CLLocationUpdate.Updates(a1, a2, a3, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
}

uint64_t initializeWithTake for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2127FF334);
}

uint64_t sub_2127FF334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    id v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v9(a1, a2, v7);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2127FF414);
}

uint64_t sub_2127FF414(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(result - 8);
  if (*(_DWORD *)(v10 + 84) == a3)
  {
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v11(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CLLocationUpdate._LocationUpdater()
{
  return &type metadata for CLLocationUpdate._LocationUpdater;
}

uint64_t outlined destroy of CLLocationUpdate.Updates(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CLLocationUpdate.Updates(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined destroy of DateInterval?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2127FF5A8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 17) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2127FF63C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t CLBackgroundActivitySession.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = [self sel_backgroundActivitySession];
  return v0;
}

uint64_t CLBackgroundActivitySession.init()()
{
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = [self sel_backgroundActivitySession];
  return v0;
}

Swift::Void __swiftcall CLBackgroundActivitySession.invalidate()()
{
  [*(id *)(v0 + 16) invalidate];
}

uint64_t CLBackgroundActivitySession.deinit()
{
  swift_release();
  return v0;
}

uint64_t CLBackgroundActivitySession.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t CLLocationManager.backgroundActivitySession()()
{
  type metadata accessor for CLBackgroundActivitySession();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 16) = [self sessionWithLocationManager:v0 queue:0 handler:0];
  return v1;
}

uint64_t type metadata accessor for CLBackgroundActivitySession()
{
  return self;
}

id CLBackgroundActivitySession.Diagnostic.authorizationDenied.getter()
{
  return [*v0 sel_authorizationDenied];
}

id CLBackgroundActivitySession.Diagnostic.authorizationDeniedGlobally.getter()
{
  return [*v0 sel_authorizationDeniedGlobally];
}

id CLBackgroundActivitySession.Diagnostic.authorizationRestricted.getter()
{
  return [*v0 sel_authorizationRestricted];
}

id CLBackgroundActivitySession.Diagnostic.insufficientlyInUse.getter()
{
  return [*v0 sel_insufficientlyInUse];
}

id CLBackgroundActivitySession.Diagnostic.serviceSessionRequired.getter()
{
  return [*v0 sel_serviceSessionRequired];
}

id CLBackgroundActivitySession.Diagnostic.authorizationRequestInProgress.getter()
{
  return [*v0 sel_authorizationRequestInProgress];
}

uint64_t CLBackgroundActivitySession.Diagnostics.Iterator.next()(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  *uint64_t v3 = v1;
  v3[1] = CLServiceSession.Diagnostics.Iterator.next();
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  *uint64_t v3 = v1;
  v3[1] = protocol witness for AsyncIteratorProtocol.next() in conformance CLServiceSession.Diagnostics.Iterator;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t CLBackgroundActivitySession.Diagnostics.makeAsyncIterator()()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)logger);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2127EE000, v1, v2, "#backgroundActivitySession makeAsyncIterator", v3, 2u);
    MEMORY[0x216681E40](v3, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>);
  return AsyncStream.makeAsyncIterator()();
}

void closure #1 in CLBackgroundActivitySession.Diagnostics.init(_:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation.YieldResult);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = a1;
  id v6 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)logger);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_2127EE000, v8, v9, "#backgroundActivitySession yielding a Diagnostic", v10, 2u);
    MEMORY[0x216681E40](v10, -1, -1);
  }
}

id closure #2 in CLBackgroundActivitySession.Diagnostics.init(_:)(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)logger);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2127EE000, v4, v5, "#backgroundActivitySession terminating", v6, 2u);
    MEMORY[0x216681E40](v6, -1, -1);
  }

  uint64_t v7 = *(void **)(a2 + OBJC_IVAR____TtCC12CoreLocation27CLBackgroundActivitySession11Diagnostics_bas);

  return [v7 invalidate];
}

uint64_t CLBackgroundActivitySession.Diagnostics.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC12CoreLocation27CLBackgroundActivitySession11Diagnostics_stream;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t CLBackgroundActivitySession.Diagnostics.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC12CoreLocation27CLBackgroundActivitySession11Diagnostics_stream;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance CLBackgroundActivitySession.Diagnostics()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)logger);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2127EE000, v1, v2, "#backgroundActivitySession makeAsyncIterator", v3, 2u);
    MEMORY[0x216681E40](v3, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>);
  AsyncStream.makeAsyncIterator()();

  return swift_release();
}

uint64_t CLBackgroundActivitySession.diagnostics.getter()
{
  uint64_t v1 = v0;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)logger);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl(&dword_2127EE000, v3, v4, "#backgroundActivitySession creating a Diagnostics AsyncSequence", v5, 2u);
    MEMORY[0x216681E40](v5, -1, -1);
  }

  if (*(void *)(v1 + 24))
  {
    uint64_t v6 = *(void *)(v1 + 24);
LABEL_9:
    swift_retain();
    return v6;
  }
  uint64_t v7 = *(void **)(v1 + 16);
  type metadata accessor for CLBackgroundActivitySession.Diagnostics(0);
  swift_allocObject();
  id v8 = v7;
  uint64_t v9 = specialized CLBackgroundActivitySession.Diagnostics.init(_:)(v8);

  *(void *)(v1 + 24) = v9;
  uint64_t result = swift_release();
  uint64_t v6 = *(void *)(v1 + 24);
  if (v6)
  {
    swift_retain();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CLBackgroundActivitySession.Diagnostics(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLBackgroundActivitySession.Diagnostics);
}

uint64_t specialized CLBackgroundActivitySession.Diagnostics.init(_:)(void *a1)
{
  id v33 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation.BufferingPolicy);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  os_log_type_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation);
  uint64_t v31 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v31 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v30 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  int v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F580], v1);
  static AsyncStream.makeStream(of:bufferingPolicy:)();
  uint64_t v15 = v4;
  uint64_t v16 = v32;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v15, v1);
  uint64_t v34 = v12;
  uint64_t v35 = v11;
  uint64_t v17 = v11;
  uint64_t v18 = v5;
  uint64_t v19 = v31;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v16 + OBJC_IVAR____TtCC12CoreLocation27CLBackgroundActivitySession11Diagnostics_stream, v14, v17);
  uint64_t v20 = v33;
  *(void *)(v16 + OBJC_IVAR____TtCC12CoreLocation27CLBackgroundActivitySession11Diagnostics_bas) = v33;
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v8, v10, v18);
  unint64_t v21 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v22 + v21, v8, v18);
  aBlock[4] = partial apply for closure #1 in CLBackgroundActivitySession.Diagnostics.init(_:);
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CLServiceSessionDiagnostic) -> ();
  aBlock[3] = &block_descriptor_2;
  uint64_t v23 = _Block_copy(aBlock);
  id v24 = v20;
  swift_release();
  [v24 setHandler:v23];
  _Block_release(v23);

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)logger);
  int v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_2127EE000, v26, v27, "#backgroundActivitySession successfully created", v28, 2u);
    MEMORY[0x216681E40](v28, -1, -1);
  }

  swift_retain();
  AsyncStream.Continuation.onTermination.setter();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v18);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v35);
  return v16;
}

unint64_t lazy protocol witness table accessor for type CLBackgroundActivitySession.Diagnostics.Iterator and conformance CLBackgroundActivitySession.Diagnostics.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type CLBackgroundActivitySession.Diagnostics.Iterator and conformance CLBackgroundActivitySession.Diagnostics.Iterator;
  if (!lazy protocol witness table cache variable for type CLBackgroundActivitySession.Diagnostics.Iterator and conformance CLBackgroundActivitySession.Diagnostics.Iterator)
  {
    type metadata accessor for CLBackgroundActivitySession.Diagnostics.Iterator(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLBackgroundActivitySession.Diagnostics.Iterator and conformance CLBackgroundActivitySession.Diagnostics.Iterator);
  }
  return result;
}

uint64_t type metadata accessor for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLBackgroundActivitySession.Diagnostics.Iterator);
}

uint64_t method lookup function for CLBackgroundActivitySession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CLBackgroundActivitySession);
}

uint64_t dispatch thunk of CLBackgroundActivitySession.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

ValueMetadata *type metadata accessor for CLBackgroundActivitySession.Diagnostic()
{
  return &type metadata for CLBackgroundActivitySession.Diagnostic;
}

uint64_t ObjC metadata update function for CLBackgroundActivitySession.Diagnostics()
{
  return type metadata accessor for CLBackgroundActivitySession.Diagnostics(0);
}

void type metadata completion function for CLBackgroundActivitySession.Diagnostics()
{
  type metadata accessor for AsyncStream<CLBackgroundActivitySession.Diagnostic>(319, &lazy cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for CLBackgroundActivitySession.Diagnostics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CLBackgroundActivitySession.Diagnostics);
}

uint64_t initializeBufferWithCopyOfBuffer for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_212800AD0);
}

uint64_t sub_212800AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_212800B54);
}

uint64_t sub_212800B54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void type metadata completion function for CLBackgroundActivitySession.Diagnostics.Iterator()
{
  type metadata accessor for AsyncStream<CLBackgroundActivitySession.Diagnostic>(319, &lazy cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator, MEMORY[0x263F8F5A8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for AsyncStream<CLBackgroundActivitySession.Diagnostic>(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, ValueMetadata *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for CLBackgroundActivitySession.Diagnostic);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_212800CC0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void partial apply for closure #1 in CLBackgroundActivitySession.Diagnostics.init(_:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation);

  closure #1 in CLBackgroundActivitySession.Diagnostics.init(_:)(a1);
}

id partial apply for closure #2 in CLBackgroundActivitySession.Diagnostics.init(_:)(uint64_t a1)
{
  return closure #2 in CLBackgroundActivitySession.Diagnostics.init(_:)(a1, v1);
}

NSDateInterval __swiftcall DateInterval._bridgeToObjectiveC()()
{
  return (NSDateInterval)MEMORY[0x270EEE2C8]();
}

uint64_t type metadata accessor for DateInterval()
{
  return MEMORY[0x270EEE338]();
}

uint64_t _BridgedStoredNSError.userInfo.getter()
{
  return MEMORY[0x270EEF7E0]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x270EF0C88]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t Selector.init(_:)()
{
  return MEMORY[0x270FA1168]();
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

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
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

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t static AsyncStream.makeStream(of:bufferingPolicy:)()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x270FA1F48]();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2F8]();
}

{
  return MEMORY[0x270F9F348]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F438]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
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

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}