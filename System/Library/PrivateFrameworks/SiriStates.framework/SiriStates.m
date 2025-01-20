id one-time initialization function for abstract()
{
  id result;

  type metadata accessor for CallState();
  result = CallState.__allocating_init(name:parent:eventHandler:)(0x7463617274736241, 0xE800000000000000, 0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.abstract, 0);
  static CallState.abstract = (uint64_t)result;
  return result;
}

{
  id result;

  type metadata accessor for State();
  result = State.__allocating_init(name:parent:eventHandler:)(0x7463617274736241, 0xE800000000000000, 0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.abstract, 0);
  static State.abstract = (uint64_t)result;
  return result;
}

{
  id result;

  type metadata accessor for SharedState();
  result = SharedState.__allocating_init(name:parent:eventHandler:)(0x7463617274736241, 0xE800000000000000, 0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.abstract, 0);
  static SharedState.abstract = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static CallState.abstract()
{
  return 1;
}

uint64_t *CallState.abstract.unsafeMutableAddressor()
{
  if (one-time initialization token for abstract != -1) {
    swift_once();
  }
  return &static CallState.abstract;
}

id static CallState.abstract.getter()
{
  return static CallState.abstract.getter(&one-time initialization token for abstract, (void **)&static CallState.abstract);
}

uint64_t *State.abstract.unsafeMutableAddressor()
{
  if (one-time initialization token for abstract != -1) {
    swift_once();
  }
  return &static State.abstract;
}

id static State.abstract.getter()
{
  return static CallState.abstract.getter(&one-time initialization token for abstract, (void **)&static State.abstract);
}

uint64_t static CallState.handleForAbstractState<A, B>(event:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 2, 2, a1);
}

uint64_t *SharedState.abstract.unsafeMutableAddressor()
{
  if (one-time initialization token for abstract != -1) {
    swift_once();
  }
  return &static SharedState.abstract;
}

id static SharedState.abstract.getter()
{
  return static CallState.abstract.getter(&one-time initialization token for abstract, (void **)&static SharedState.abstract);
}

id static CallState.abstract.getter(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  v3 = *a2;
  return v3;
}

id one-time initialization function for passive()
{
  type metadata accessor for SharedState();
  v0 = (void *)*SharedState.mirroring.unsafeMutableAddressor();
  id v1 = v0;
  id result = SharedState.__allocating_init(name:parent:eventHandler:)(0x65766973736150, 0xE700000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static SharedState.passive, 0);
  static SharedState.passive = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static SharedState.passive(uint64_t a1)
{
  if (a1 == 6 || a1 == 4) {
    return 1;
  }
  if (a1 != 3) {
    return 0;
  }
  id v1 = (void *)*SharedState.preparingToServe.unsafeMutableAddressor();
  id v2 = v1;
  return (uint64_t)v1;
}

uint64_t *SharedState.passive.unsafeMutableAddressor()
{
  if (one-time initialization token for passive != -1) {
    swift_once();
  }
  return &static SharedState.passive;
}

id static SharedState.passive.getter()
{
  if (one-time initialization token for passive != -1) {
    swift_once();
  }
  v0 = (void *)static SharedState.passive;
  return v0;
}

id one-time initialization function for resting()
{
  type metadata accessor for State();
  v0 = (void *)*State.attending.unsafeMutableAddressor();
  id v1 = v0;
  id result = State.__allocating_init(name:parent:eventHandler:)(0x676E6974736552, 0xE700000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.resting, 0);
  static State.resting = (uint64_t)result;
  return result;
}

void *implicit closure #1 in variable initialization expression of static State.resting(uint64_t a1)
{
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) != 0xC) {
    return 0;
  }
  id v1 = (void *)*State.available.unsafeMutableAddressor();
  id v2 = v1;
  return v1;
}

uint64_t *State.resting.unsafeMutableAddressor()
{
  if (one-time initialization token for resting != -1) {
    swift_once();
  }
  return &static State.resting;
}

id static State.resting.getter()
{
  if (one-time initialization token for resting != -1) {
    swift_once();
  }
  v0 = (void *)static State.resting;
  return v0;
}

uint64_t variable initialization expression of SharedClient.delegate()
{
  return 0;
}

uint64_t SharedClient.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____SRSTSharedClient_delegate;
  swift_beginAccess();
  return MEMORY[0x223C6C570](v1);
}

uint64_t SharedClient.delegate.setter()
{
  return swift_unknownObjectRelease();
}

uint64_t key path getter for SharedClient.delegate : SharedClient@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x70))();
  *a2 = result;
  return result;
}

uint64_t key path setter for SharedClient.delegate : SharedClient(uint64_t a1, void **a2)
{
  id v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x78);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*SharedClient.delegate.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SRSTSharedClient_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C6C570](v5);
  return SharedClient.delegate.modify;
}

void SharedClient.delegate.modify(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t property wrapper backing initializer of SharedClient.currentState()
{
  return Published.init(initialValue:)();
}

uint64_t SharedClient.currentState.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SharedClient.currentState.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t key path getter for SharedClient.currentState : SharedClient@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x88))();
  *a2 = result;
  return result;
}

uint64_t key path setter for SharedClient.currentState : SharedClient(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & **a2) + 0x90);
  id v4 = *a1;
  return v3(v2);
}

uint64_t (*SharedClient.currentState.modify(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

uint64_t key path getter for SharedClient.$currentState : SharedClient(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xA0))();
}

uint64_t key path setter for SharedClient.$currentState : SharedClient(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedState?>.Publisher);
  MEMORY[0x270FA5388](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0xA8))(v7);
}

uint64_t SharedClient.$currentState.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTSharedClient__currentState, &demangling cache variable for type metadata for Published<SharedState?>);
}

uint64_t SharedClient.$currentState.setter(uint64_t a1)
{
  return SharedClient.$currentState.setter(a1, &demangling cache variable for type metadata for Published<SharedState?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTSharedClient__currentState, &demangling cache variable for type metadata for Published<SharedState?>);
}

uint64_t (*SharedClient.$currentState.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedState?>.Publisher);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____SRSTSharedClient__currentState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedState?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

uint64_t property wrapper backing initializer of SharedClient.mostRecentEvent()
{
  return Published.init(initialValue:)();
}

uint64_t key path getter for SharedClient.mostRecentEvent : SharedClient@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xB8))();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t key path setter for SharedClient.mostRecentEvent : SharedClient(uint64_t a1, void **a2)
{
  return (*(uint64_t (**)(void, void))((*MEMORY[0x263F8EED0] & **a2) + 0xC0))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t SharedClient.mostRecentEvent.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SharedClient.mostRecentEvent.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*SharedClient.mostRecentEvent.modify(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

void SharedClient.currentState.modify(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t variable initialization expression of SharedClient._mostRecentEvent()
{
  return 0;
}

uint64_t key path getter for SharedClient.$mostRecentEvent : SharedClient(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xD0))();
}

uint64_t key path setter for SharedClient.$mostRecentEvent : SharedClient(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedEvent?>.Publisher);
  MEMORY[0x270FA5388](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0xD8))(v7);
}

uint64_t SharedClient.$mostRecentEvent.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTSharedClient__mostRecentEvent, &demangling cache variable for type metadata for Published<SharedEvent?>);
}

uint64_t SharedClient.$currentState.getter(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t SharedClient.$mostRecentEvent.setter(uint64_t a1)
{
  return SharedClient.$currentState.setter(a1, &demangling cache variable for type metadata for Published<SharedEvent?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTSharedClient__mostRecentEvent, &demangling cache variable for type metadata for Published<SharedEvent?>);
}

uint64_t SharedClient.$currentState.setter(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*SharedClient.$mostRecentEvent.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedEvent?>.Publisher);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____SRSTSharedClient__mostRecentEvent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedEvent?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

void SharedClient.$currentState.modify(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

unint64_t SharedClient.mostRecentEventName.getter()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
  if (v2) {
    return 0;
  }
  else {
    return SharedEvent.name.getter(v1);
  }
}

uint64_t variable initialization expression of SharedClient.stopped()
{
  return 0;
}

void SharedClient.dispatchEvent(_:)(uint64_t a1)
{
  type metadata accessor for NotificationCenterHelper();
  uint64_t v3 = a1;
  unint64_t v2 = lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent();
  static NotificationCenterHelper.dispatch<A>(_:)((uint64_t)&v3, (uint64_t)&type metadata for SharedEvent, v2);
}

id SharedClient.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  size_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*((unsigned char *)v1 + OBJC_IVAR____SRSTSharedClient_stopped) & 1) == 0)
  {
    uint64_t v7 = type metadata accessor for SharedClient();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedClient and conformance SharedClient, (void (*)(uint64_t))type metadata accessor for SharedClient);
    static Clientele.remove<A>(_:)((uint64_t)v1, v7);
    uint64_t v8 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_220960000, v9, v10, "Deinit called for SharedClient", v11, 2u);
      MEMORY[0x223C6C510](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    type metadata accessor for OS_dispatch_queue();
    *(void *)(swift_allocObject() + 16) = v1;
    id v12 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
  v13 = (objc_class *)type metadata accessor for SharedClient();
  v15.receiver = v1;
  v15.super_class = v13;
  return objc_msgSendSuper2(&v15, sel_dealloc);
}

void @objc closure #1 in variable initialization expression of static SharedClient.handleStateTransititionNotification(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a1;
  id v8 = a3;
  id v9 = a5;
  specialized closure #1 in variable initialization expression of static SharedClient.handleStateTransititionNotification(a2, (uint64_t)a3);
}

uint64_t (**SharedClient.handleStateTransititionNotification.unsafeMutableAddressor())()
{
  return static SharedClient.handleStateTransititionNotification;
}

uint64_t (*static SharedClient.handleStateTransititionNotification.getter())()
{
  return static SharedClient.handleStateTransititionNotification[0];
}

uint64_t static SharedClient.handleStateTransititionNotification.setter(uint64_t (*a1)())
{
  uint64_t result = swift_beginAccess();
  static SharedClient.handleStateTransititionNotification[0] = a1;
  return result;
}

uint64_t (*static SharedClient.handleStateTransititionNotification.modify())()
{
  return static SharedClient.handleStateTransititionNotification.modify;
}

void @objc closure #1 in variable initialization expression of static SharedClient.handleEventNotification(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a1;
  id v8 = a3;
  id v9 = a5;
  specialized closure #1 in variable initialization expression of static SharedClient.handleEventNotification(a2, (uint64_t)a3);
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

unint64_t lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent()
{
  unint64_t result = lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent;
  if (!lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent;
  if (!lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent;
  if (!lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent;
  if (!lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent);
  }
  return result;
}

uint64_t type metadata accessor for SharedClient()
{
  uint64_t result = type metadata singleton initialization cache for SharedClient;
  if (!type metadata singleton initialization cache for SharedClient) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  unint64_t result = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  }
  return result;
}

uint64_t sub_22096506C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t (**SharedClient.handleEventNotification.unsafeMutableAddressor())()
{
  return &static SharedClient.handleEventNotification;
}

uint64_t (*static SharedClient.handleEventNotification.getter())()
{
  return static SharedClient.handleEventNotification;
}

uint64_t static SharedClient.handleEventNotification.setter(uint64_t (*a1)())
{
  uint64_t result = swift_beginAccess();
  static SharedClient.handleEventNotification = a1;
  return result;
}

uint64_t (*static SharedClient.handleEventNotification.modify())()
{
  return static SharedClient.handleEventNotification.modify;
}

id SharedClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SharedClient.init()()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  v61 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedEvent?>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  id v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedState?>);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  objc_super v15 = &v0[OBJC_IVAR____SRSTSharedClient__currentState];
  uint64_t v73 = 0;
  v16 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedState?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v14, v10);
  v17 = &v16[OBJC_IVAR____SRSTSharedClient__mostRecentEvent];
  uint64_t v73 = 0;
  LOBYTE(v74) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedEvent?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v17, v9, v5);
  v16[OBJC_IVAR____SRSTSharedClient_stopped] = 0;

  v18 = (objc_class *)type metadata accessor for SharedClient();
  v72.receiver = v16;
  v72.super_class = v18;
  id v19 = objc_msgSendSuper2(&v72, sel_init);
  lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedClient and conformance SharedClient, (void (*)(uint64_t))type metadata accessor for SharedClient);
  id v20 = v19;
  v21 = (const void *)static Clientele.add<A>(_:)((uint64_t)v20, (uint64_t)v18);
  uint64_t v22 = *SharedState.allStates.unsafeMutableAddressor();
  uint64_t v63 = v1;
  uint64_t v62 = v2;
  id v60 = v20;
  if ((v22 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for SharedState();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedState and conformance NSObject, (void (*)(uint64_t))type metadata accessor for SharedState);
    Set.Iterator.init(_cocoa:)();
    uint64_t v22 = v73;
    v67 = v74;
    uint64_t v23 = v75;
    uint64_t v24 = v76;
    unint64_t v25 = v77;
  }
  else
  {
    uint64_t v26 = -1 << *(unsigned char *)(v22 + 32);
    uint64_t v27 = *(void *)(v22 + 56);
    v67 = (void *)(v22 + 56);
    uint64_t v23 = ~v26;
    uint64_t v28 = -v26;
    if (v28 < 64) {
      uint64_t v29 = ~(-1 << v28);
    }
    else {
      uint64_t v29 = -1;
    }
    unint64_t v25 = v29 & v27;
    swift_bridgeObjectRetain();
    uint64_t v24 = 0;
  }
  uint64_t v65 = v22 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v59 = v23;
  int64_t v66 = (unint64_t)(v23 + 64) >> 6;
  uint64_t v64 = MEMORY[0x263F8EE50] + 8;
  if (v22 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v25)
    {
      uint64_t v30 = (v25 - 1) & v25;
      unint64_t v31 = __clz(__rbit64(v25)) | (v24 << 6);
      uint64_t v32 = v24;
      goto LABEL_27;
    }
    int64_t v35 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      return;
    }
    if (v35 >= v66) {
      goto LABEL_30;
    }
    unint64_t v36 = v67[v35];
    uint64_t v32 = v24 + 1;
    if (!v36)
    {
      uint64_t v32 = v24 + 2;
      if (v24 + 2 >= v66) {
        goto LABEL_30;
      }
      unint64_t v36 = v67[v32];
      if (!v36)
      {
        uint64_t v32 = v24 + 3;
        if (v24 + 3 >= v66) {
          goto LABEL_30;
        }
        unint64_t v36 = v67[v32];
        if (!v36)
        {
          uint64_t v32 = v24 + 4;
          if (v24 + 4 >= v66) {
            goto LABEL_30;
          }
          unint64_t v36 = v67[v32];
          if (!v36) {
            break;
          }
        }
      }
    }
LABEL_26:
    uint64_t v30 = (v36 - 1) & v36;
    unint64_t v31 = __clz(__rbit64(v36)) + (v32 << 6);
LABEL_27:
    id v34 = *(id *)(*(void *)(v22 + 48) + 8 * v31);
    if (!v34) {
      goto LABEL_30;
    }
    while (1)
    {
      CFNotificationCenterRef value = darwinNotificationCenter.unsafeMutableAddressor()->value;
      swift_beginAccess();
      v39 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static SharedClient.handleStateTransititionNotification[0];
      type metadata accessor for NotificationCenterHelper();
      v69 = (ValueMetadata *)type metadata accessor for SharedState();
      uint64_t v70 = lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedState and conformance SharedState, (void (*)(uint64_t))type metadata accessor for SharedState);
      v68[0] = v34;
      v40 = value;
      id v41 = v34;
      v42 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v40, v21, v39, v42, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      uint64_t v24 = v32;
      unint64_t v25 = v30;
      if ((v22 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      uint64_t v33 = __CocoaSet.Iterator.next()();
      if (v33)
      {
        uint64_t v71 = v33;
        type metadata accessor for SharedState();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v34 = (id)v68[0];
        swift_unknownObjectRelease();
        uint64_t v32 = v24;
        uint64_t v30 = v25;
        if (v34) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  uint64_t v37 = v24 + 5;
  while (v66 != v37)
  {
    unint64_t v36 = v67[v37++];
    if (v36)
    {
      uint64_t v32 = v37 - 1;
      goto LABEL_26;
    }
  }
LABEL_30:
  outlined consume of Set<SharedState>.Iterator._Variant();
  v67 = static SharedEvent.allCases.getter();
  uint64_t v43 = v67[2];
  if (v43)
  {
    type metadata accessor for NotificationCenterHelper();
    v44 = v67 + 4;
    v45 = darwinNotificationCenter.unsafeMutableAddressor();
    swift_beginAccess();
    unint64_t v46 = lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent();
    do
    {
      uint64_t v47 = *v44++;
      CFNotificationCenterRef v48 = v45->value;
      v49 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static SharedClient.handleEventNotification;
      v69 = &type metadata for SharedEvent;
      uint64_t v70 = v46;
      v68[0] = v47;
      v50 = v48;
      v51 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v50, v21, v49, v51, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v43;
    }
    while (v43);
  }
  swift_bridgeObjectRelease();
  uint64_t v52 = Logger.framework.unsafeMutableAddressor();
  uint64_t v53 = v62;
  v54 = v61;
  uint64_t v55 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v52, v63);
  v56 = Logger.logObject.getter();
  os_log_type_t v57 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_220960000, v56, v57, "SharedClient added Darwin observers", v58, 2u);
    MEMORY[0x223C6C510](v58, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v55);
}

Swift::Void __swiftcall SharedClient.stopClient()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____SRSTSharedClient_stopped;
  if ((v1[OBJC_IVAR____SRSTSharedClient_stopped] & 1) == 0)
  {
    uint64_t v8 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_220960000, v9, v10, "#SiriStates stopping client", v11, 2u);
      MEMORY[0x223C6C510](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v1[v7] = 1;
    uint64_t v12 = type metadata accessor for SharedClient();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedClient and conformance SharedClient, (void (*)(uint64_t))type metadata accessor for SharedClient);
    static Clientele.remove<A>(_:)((uint64_t)v1, v12);
    type metadata accessor for OS_dispatch_queue();
    *(void *)(swift_allocObject() + 16) = v1;
    uint64_t v13 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
}

uint64_t protocol witness for ClientProtocol.delegate.getter in conformance SharedClient@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x70))();
  *a1 = result;
  return result;
}

uint64_t protocol witness for ClientProtocol.delegate.setter in conformance SharedClient(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x78))(*a1);
}

uint64_t (*protocol witness for ClientProtocol.delegate.modify in conformance SharedClient(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x80))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

uint64_t protocol witness for ClientProtocol.currentState.getter in conformance SharedClient@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x88))();
  *a1 = result;
  return result;
}

uint64_t protocol witness for ClientProtocol.currentState.setter in conformance SharedClient(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x90))(*a1);
}

uint64_t (*protocol witness for ClientProtocol.currentState.modify in conformance SharedClient(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x98))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

uint64_t protocol witness for ClientProtocol.mostRecentEvent.getter in conformance SharedClient@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xB8))();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return result;
}

uint64_t protocol witness for ClientProtocol.mostRecentEvent.setter in conformance SharedClient(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))((*MEMORY[0x263F8EED0] & *v1) + 0xC0))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t (*protocol witness for ClientProtocol.mostRecentEvent.modify in conformance SharedClient(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xC8))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

void protocol witness for ClientProtocol.delegate.modify in conformance SharedClient(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

id protocol witness for ClientProtocol.init() in conformance SharedClient()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t protocol witness for ClientProtocol.dispatchEvent(_:) in conformance SharedClient(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x108))(*a1);
}

uint64_t outlined destroy of weak SharedClientDelegate?(uint64_t a1)
{
  return a1;
}

uint64_t outlined consume of Set<SharedState>.Iterator._Variant()
{
  return swift_release();
}

uint64_t lazy protocol witness table accessor for type SharedClient and conformance SharedClient(unint64_t *a1, void (*a2)(uint64_t))
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

void partial apply for closure #1 in SharedClient.deinit()
{
  id v1 = *(const void **)(v0 + 16);
  type metadata accessor for NotificationCenterHelper();
  static NotificationCenterHelper.removeEveryObserver(_:)(v1);
}

uint64_t associated type witness table accessor for ClientProtocol.StateType : StateProtocol in SharedClient()
{
  return lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedState and conformance SharedState, (void (*)(uint64_t))type metadata accessor for SharedState);
}

uint64_t ObjC metadata update function for SharedClient()
{
  return type metadata accessor for SharedClient();
}

void type metadata completion function for SharedClient()
{
  type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<SharedState?>, &demangling cache variable for type metadata for SharedState?);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<SharedEvent?>, &demangling cache variable for type metadata for SharedEvent?);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for SharedClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SharedClient);
}

uint64_t dispatch thunk of SharedClient.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SharedClient.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SharedClient.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SharedClient.currentState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SharedClient.currentState.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SharedClient.currentState.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SharedClient.$currentState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SharedClient.$currentState.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SharedClient.$currentState.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of SharedClient.mostRecentEvent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SharedClient.mostRecentEvent.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x263F8EED0] & *v2) + 0xC0))(a1, a2 & 1);
}

uint64_t dispatch thunk of SharedClient.mostRecentEvent.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SharedClient.$mostRecentEvent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SharedClient.$mostRecentEvent.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SharedClient.$mostRecentEvent.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SharedClient.mostRecentEventName.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SharedClient.dispatchEvent(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SharedClient.stopClient()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
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

void type metadata accessor for Published<SharedState?>(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = type metadata accessor for Published();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
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
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
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

void specialized closure #1 in variable initialization expression of static SharedClient.handleStateTransititionNotification(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  int64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v46 - v11;
  type metadata accessor for NotificationCenterHelper();
  uint64_t v13 = (char *)type metadata accessor for SharedState();
  uint64_t v14 = lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedState and conformance SharedState, (void (*)(uint64_t))type metadata accessor for SharedState);
  static NotificationCenterHelper.state<A>(from:)(a2, v13, v14, (uint64_t)&v55);
  objc_super v15 = v55;
  if (v55)
  {
    uint64_t v16 = Logger.framework.unsafeMutableAddressor();
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v51 = v16;
    uint64_t v52 = v5 + 16;
    v50 = v17;
    ((void (*)(char *))v17)(v12);
    v18 = v15;
    id v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.info.getter();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v53 = v15;
    if (v21)
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v48 = v5;
      uint64_t v24 = v23;
      uint64_t v55 = (void *)v23;
      uint64_t v47 = v9;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v49 = v4;
      unint64_t v46 = v22 + 4;
      unint64_t v25 = (char *)v18 + OBJC_IVAR____SRSTSharedState_name;
      uint64_t v26 = a1;
      uint64_t v27 = v18;
      uint64_t v29 = *(uint64_t *)((char *)&v18->isa + OBJC_IVAR____SRSTSharedState_name);
      unint64_t v28 = *((void *)v25 + 1);
      swift_bridgeObjectRetain();
      uint64_t v30 = v29;
      v18 = v27;
      a1 = v26;
      uint64_t v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v28, (uint64_t *)&v55);
      uint64_t v4 = v49;
      int64_t v9 = v47;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_220960000, v19, v20, "SharedClient received valid state transition: %s", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v31 = v24;
      uint64_t v5 = v48;
      MEMORY[0x223C6C510](v31, -1, -1);
      MEMORY[0x223C6C510](v22, -1, -1);
    }
    else
    {
    }
    uint64_t v32 = *(void (**)(char *, uint64_t))(v5 + 8);
    v32(v12, v4);
    uint64_t v33 = type metadata accessor for SharedClient();
    uint64_t v34 = lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedClient and conformance SharedClient, (void (*)(uint64_t))type metadata accessor for SharedClient);
    int64_t v35 = (void *)static Clientele.contains<A>(_:)(a1, v33, v34);
    if (v35)
    {
      unint64_t v36 = v35;
      uint64_t v37 = (void *)MEMORY[0x263F8EED0];
      v38 = *(uint64_t (**)(void *))((*MEMORY[0x263F8EED0] & *v35) + 0x90);
      v39 = v18;
      uint64_t v40 = v38(v53);
      id v41 = (void *)(*(uint64_t (**)(uint64_t))((*v37 & *v36) + 0x70))(v40);
      if (v41)
      {
        objc_msgSend(v41, sel_stateMachineWithClient_didTransitionToState_, v36, v39);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    else
    {
      v50(v9, v51, v4);
      v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_220960000, v42, v43, "Observer for darwin callback handler not found", v44, 2u);
        MEMORY[0x223C6C510](v44, -1, -1);
        v45 = v42;
      }
      else
      {
        v45 = v18;
        v18 = v42;
      }

      v32(v9, v4);
    }
  }
}

void specialized closure #1 in variable initialization expression of static SharedClient.handleEventNotification(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  int64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v40 - v11;
  type metadata accessor for NotificationCenterHelper();
  unint64_t v13 = lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent();
  static NotificationCenterHelper.event<A>(from:)(a2, (char *)&type metadata for SharedEvent, v13, (uint64_t)&v48);
  if ((v49 & 1) == 0)
  {
    uint64_t v46 = a1;
    uint64_t v14 = v48;
    uint64_t v15 = Logger.framework.unsafeMutableAddressor();
    v44 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v44(v12, v15, v4);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.info.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v45 = v14;
    if (v18)
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v43 = v5;
      os_log_type_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v41 = v15;
      uint64_t v22 = v21;
      uint64_t v48 = v21;
      v42 = v9;
      *(_DWORD *)os_log_type_t v20 = 136315138;
      unint64_t v23 = SharedEvent.name.getter(v14);
      uint64_t v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, &v48);
      int64_t v9 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_220960000, v16, v17, "SharedClient received valid event reception: %s", v20, 0xCu);
      swift_arrayDestroy();
      uint64_t v25 = v22;
      uint64_t v15 = v41;
      MEMORY[0x223C6C510](v25, -1, -1);
      uint64_t v26 = v20;
      uint64_t v5 = v43;
      MEMORY[0x223C6C510](v26, -1, -1);
    }

    uint64_t v27 = *(void (**)(char *, uint64_t))(v5 + 8);
    v27(v12, v4);
    uint64_t v28 = type metadata accessor for SharedClient();
    uint64_t v29 = lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedClient and conformance SharedClient, (void (*)(uint64_t))type metadata accessor for SharedClient);
    uint64_t v30 = (void *)static Clientele.contains<A>(_:)(v46, v28, v29);
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = (void *)MEMORY[0x263F8EED0];
      uint64_t v33 = v45;
      uint64_t v34 = (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x263F8EED0] & *v30) + 0xC0))(v45, 0);
      int64_t v35 = (void *)(*(uint64_t (**)(uint64_t))((*v32 & *v31) + 0x70))(v34);
      if (v35)
      {
        unint64_t v36 = v35;
        if (objc_msgSend(v35, sel_respondsToSelector_, sel_stateMachineWithClient_didReceiveEvent_)) {
          objc_msgSend(v36, sel_stateMachineWithClient_didReceiveEvent_, v31, v33);
        }
        swift_unknownObjectRelease();
      }
    }
    else
    {
      v44(v9, v15, v4);
      uint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_220960000, v37, v38, "Observer for darwin callback handler not found", v39, 2u);
        MEMORY[0x223C6C510](v39, -1, -1);
      }

      v27(v9, v4);
    }
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
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

void SharedClient.stopped.setter()
{
}

id one-time initialization function for ongoingCall()
{
  type metadata accessor for CallState();
  unint64_t v0 = (void *)*CallState.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = CallState.__allocating_init(name:parent:eventHandler:)(0x43676E696F676E4FLL, 0xEB000000006C6C61, v0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.ongoingCall, 0);
  static CallState.ongoingCall = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static CallState.ongoingCall(uint64_t a1)
{
  id v1 = 0;
  switch(a1)
  {
    case 0:
    case 2:
    case 10:
      return 1;
    case 1:
    case 3:
    case 6:
    case 11:
      uint64_t v2 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 4:
    case 5:
      uint64_t v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 8:
      uint64_t v2 = (id *)CallState.onHoldCall.unsafeMutableAddressor();
LABEL_6:
      id v1 = *v2;
      id v3 = *v2;
      break;
    default:
      return (uint64_t)v1;
  }
  return (uint64_t)v1;
}

uint64_t static CallState.handleForOngoingCallState(event:)(uint64_t a1)
{
  uint64_t v1 = 1;
  switch(a1)
  {
    case 0:
    case 2:
    case 10:
      return v1;
    case 1:
    case 3:
    case 6:
    case 11:
      uint64_t v2 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 4:
    case 5:
      uint64_t v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 8:
      uint64_t v2 = (id *)CallState.onHoldCall.unsafeMutableAddressor();
LABEL_6:
      uint64_t v1 = (uint64_t)*v2;
      id v3 = *v2;
      break;
    default:
      uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t *CallState.ongoingCall.unsafeMutableAddressor()
{
  if (one-time initialization token for ongoingCall != -1) {
    swift_once();
  }
  return &static CallState.ongoingCall;
}

id static CallState.ongoingCall.getter()
{
  if (one-time initialization token for ongoingCall != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static CallState.ongoingCall;
  return v0;
}

id one-time initialization function for responding()
{
  type metadata accessor for State();
  unint64_t v0 = (void *)*State.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = State.__allocating_init(name:parent:eventHandler:)(0x69646E6F70736552, 0xEA0000000000676ELL, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.responding, 0);
  static State.responding = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.responding(uint64_t a1)
{
  if (a1 == 13)
  {
    id v1 = (id *)State.available.unsafeMutableAddressor();
  }
  else if (a1 == 7)
  {
    id v1 = (id *)State.postResponse.unsafeMutableAddressor();
  }
  else
  {
    if (a1) {
      return 0;
    }
    id v1 = (id *)State.analyzing.unsafeMutableAddressor();
  }
  id v2 = *v1;
  id v3 = *v1;
  return v2;
}

uint64_t *State.responding.unsafeMutableAddressor()
{
  if (one-time initialization token for responding != -1) {
    swift_once();
  }
  return &static State.responding;
}

id static State.responding.getter()
{
  if (one-time initialization token for responding != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static State.responding;
  return v0;
}

__CFNotificationCenter *one-time initialization function for darwinNotificationCenter()
{
  id result = CFNotificationCenterGetDarwinNotifyCenter();
  darwinNotificationCenter.CFNotificationCenterRef value = result;
  return result;
}

CFNotificationCenterRef_optional *darwinNotificationCenter.unsafeMutableAddressor()
{
  if (one-time initialization token for darwinNotificationCenter != -1) {
    swift_once();
  }
  return &darwinNotificationCenter;
}

Swift::String *eventDispatchNotificationNamePrefix.unsafeMutableAddressor()
{
  return &eventDispatchNotificationNamePrefix;
}

Swift::String *stateTransitionNotificationNamePrefix.unsafeMutableAddressor()
{
  return &stateTransitionNotificationNamePrefix;
}

Swift::String *eventReceivedNotificationNamePrefix.unsafeMutableAddressor()
{
  return &eventReceivedNotificationNamePrefix;
}

Swift::String *unknownNotificationName.unsafeMutableAddressor()
{
  return &unknownNotificationName;
}

unint64_t SharedEvent.init(rawValue:)(unint64_t a1)
{
  return specialized SharedEvent.init(rawValue:)(a1);
}

void *static SharedEvent.allCases.getter()
{
  return &outlined read-only object #0 of static SharedEvent.allCases.getter;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SharedEvent(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SharedEvent()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SharedEvent()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SharedEvent()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance SharedEvent@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = specialized SharedEvent.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SharedEvent(void *a1@<X8>)
{
  *a1 = *v1;
}

void protocol witness for static CaseIterable.allCases.getter in conformance SharedEvent(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static SharedEvent.allCases.getter;
}

unint64_t specialized SharedEvent.init(rawValue:)(unint64_t result)
{
  if (result > 9) {
    return 0;
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for SharedEvent(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent();
  *(void *)(a1 + 8) = result;
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type [SharedEvent] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [SharedEvent] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SharedEvent] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SharedEvent]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SharedEvent] and conformance [A]);
  }
  return result;
}

ValueMetadata *type metadata accessor for SharedEvent()
{
  return &type metadata for SharedEvent;
}

id one-time initialization function for micMutedCall()
{
  type metadata accessor for CallState();
  unint64_t v0 = (void *)*CallState.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = CallState.__allocating_init(name:parent:eventHandler:)(0x646574754D63694DLL, 0xEC0000006C6C6143, v0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.micMutedCall, 0);
  static CallState.micMutedCall = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static CallState.micMutedCall(uint64_t a1)
{
  id v1 = 0;
  switch(a1)
  {
    case 0:
    case 2:
    case 7:
    case 10:
      id v2 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 1:
    case 3:
    case 11:
      return 1;
    case 4:
    case 5:
      id v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 8:
      id v2 = (id *)CallState.onHoldCall.unsafeMutableAddressor();
LABEL_6:
      id v1 = *v2;
      id v3 = *v2;
      break;
    default:
      return (uint64_t)v1;
  }
  return (uint64_t)v1;
}

uint64_t static CallState.handleForMicMutedCallState(event:)(uint64_t a1)
{
  uint64_t v1 = 1;
  switch(a1)
  {
    case 0:
    case 2:
    case 7:
    case 10:
      id v2 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 1:
    case 3:
    case 11:
      return v1;
    case 4:
    case 5:
      id v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 8:
      id v2 = (id *)CallState.onHoldCall.unsafeMutableAddressor();
LABEL_6:
      uint64_t v1 = (uint64_t)*v2;
      id v3 = *v2;
      break;
    default:
      uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t *CallState.micMutedCall.unsafeMutableAddressor()
{
  if (one-time initialization token for micMutedCall != -1) {
    swift_once();
  }
  return &static CallState.micMutedCall;
}

id static CallState.micMutedCall.getter()
{
  if (one-time initialization token for micMutedCall != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static CallState.micMutedCall;
  return v0;
}

id one-time initialization function for noCall()
{
  type metadata accessor for CallState();
  unint64_t v0 = (void *)*CallState.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = CallState.__allocating_init(name:parent:eventHandler:)(0x6C6C61436F4ELL, 0xE600000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.noCall, 0);
  static CallState.noCall = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static CallState.noCall(uint64_t a1)
{
  switch(a1)
  {
    case 0:
    case 2:
      id v1 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_4;
    case 1:
    case 3:
      id v1 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
LABEL_4:
      id v2 = *v1;
      id v3 = *v1;
      break;
    default:
      id v2 = 0;
      break;
  }
  return v2;
}

id static CallState.handleForNoCallState(event:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
    case 2:
      id v1 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_4;
    case 1:
    case 3:
      id v1 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
LABEL_4:
      id v2 = *v1;
      id v3 = *v1;
      break;
    default:
      id v2 = 0;
      break;
  }
  return v2;
}

uint64_t *CallState.noCall.unsafeMutableAddressor()
{
  if (one-time initialization token for noCall != -1) {
    swift_once();
  }
  return &static CallState.noCall;
}

id static CallState.noCall.getter()
{
  if (one-time initialization token for noCall != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static CallState.noCall;
  return v0;
}

id one-time initialization function for mirroring()
{
  type metadata accessor for SharedState();
  unint64_t v0 = (void *)*SharedState.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = SharedState.__allocating_init(name:parent:eventHandler:)(0x6E69726F7272694DLL, 0xE900000000000067, v0, (uint64_t)implicit closure #1 in variable initialization expression of static SharedState.mirroring, 0);
  static SharedState.mirroring = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static SharedState.mirroring(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 1;
    case 5:
      id v1 = (id *)SharedState.serving.unsafeMutableAddressor();
      break;
    case 1:
      id v1 = (id *)SharedState.unshared.unsafeMutableAddressor();
      break;
    default:
      return 0;
  }
  id v2 = *v1;
  id v3 = *v1;
  return (uint64_t)v2;
}

uint64_t *SharedState.mirroring.unsafeMutableAddressor()
{
  if (one-time initialization token for mirroring != -1) {
    swift_once();
  }
  return &static SharedState.mirroring;
}

id static SharedState.mirroring.getter()
{
  if (one-time initialization token for mirroring != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static SharedState.mirroring;
  return v0;
}

uint64_t dispatch thunk of EventProtocol.init(name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of EventProtocol.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static EventProtocol.enterEvent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static EventProtocol.exitEvent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static EventProtocol.initialEvent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

id one-time initialization function for available()
{
  type metadata accessor for State();
  unint64_t v0 = (void *)*State.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = State.__allocating_init(name:parent:eventHandler:)(0x6C62616C69617641, 0xE900000000000065, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.available, 0);
  static State.available = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.available(uint64_t a1)
{
  if (a1)
  {
    if (a1 != 4) {
      return 0;
    }
    id v1 = (id *)State.disabled.unsafeMutableAddressor();
  }
  else
  {
    id v1 = (id *)State.analyzing.unsafeMutableAddressor();
  }
  id v2 = *v1;
  id v3 = *v1;
  return v2;
}

uint64_t *State.available.unsafeMutableAddressor()
{
  if (one-time initialization token for available != -1) {
    swift_once();
  }
  return &static State.available;
}

id static State.available.getter()
{
  if (one-time initialization token for available != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static State.available;
  return v0;
}

id one-time initialization function for onHoldCall()
{
  type metadata accessor for CallState();
  unint64_t v0 = (void *)*CallState.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = CallState.__allocating_init(name:parent:eventHandler:)(0x6143646C6F486E4FLL, 0xEA00000000006C6CLL, v0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.onHoldCall, 0);
  static CallState.onHoldCall = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static CallState.onHoldCall(unint64_t a1)
{
  id v1 = 0;
  if (a1 <= 0xB)
  {
    if (((1 << a1) & 0x605) != 0)
    {
      id v2 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_8;
    }
    if (((1 << a1) & 0x80A) != 0)
    {
      id v2 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
LABEL_8:
      id v1 = *v2;
      id v3 = *v2;
      return v1;
    }
    if (((1 << a1) & 0x30) != 0)
    {
      id v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_8;
    }
  }
  return v1;
}

id static CallState.handleForOnHoldCallState(event:)(unint64_t a1)
{
  id v1 = 0;
  if (a1 <= 0xB)
  {
    if (((1 << a1) & 0x605) != 0)
    {
      id v2 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_8;
    }
    if (((1 << a1) & 0x80A) != 0)
    {
      id v2 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
LABEL_8:
      id v1 = *v2;
      id v3 = *v2;
      return v1;
    }
    if (((1 << a1) & 0x30) != 0)
    {
      id v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_8;
    }
  }
  return v1;
}

uint64_t *CallState.onHoldCall.unsafeMutableAddressor()
{
  if (one-time initialization token for onHoldCall != -1) {
    swift_once();
  }
  return &static CallState.onHoldCall;
}

id static CallState.onHoldCall.getter()
{
  if (one-time initialization token for onHoldCall != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static CallState.onHoldCall;
  return v0;
}

uint64_t CallEvent.init(name:)(uint64_t a1, uint64_t a2)
{
  return specialized CallEvent.init(name:)(a1, a2);
}

uint64_t CallEvent.name.getter(uint64_t a1)
{
  uint64_t result = 0x6C61437472617473;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      return 0xD000000000000011;
    case 2:
      return 0x6C6C61436E696F6ALL;
    case 3:
      return 0xD000000000000010;
    case 4:
      return 0x6C6143657661656CLL;
    case 5:
      return 0x6C6C6143646E65;
    case 6:
      unsigned int v3 = 1702131053;
      goto LABEL_15;
    case 7:
      return 0x61436574756D6E75;
    case 8:
      unsigned int v3 = 1684828008;
LABEL_15:
      uint64_t result = v3 | 0x6C6C614300000000;
      break;
    case 9:
      uint64_t result = 0x6143646C6F686E75;
      break;
    case 10:
      uint64_t result = 0x6143686374697773;
      break;
    case 11:
      uint64_t result = 0xD000000000000013;
      break;
    case 12:
      uint64_t result = 1953069157;
      break;
    case 13:
      uint64_t result = 0x7265746E65;
      break;
    case 14:
      uint64_t result = 0x6C616974696E69;
      break;
    default:
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      JUMPOUT(0x220968BD0);
  }
  return result;
}

void *CallEvent.exitEvent.unsafeMutableAddressor()
{
  return &static CallEvent.exitEvent;
}

uint64_t static CallEvent.exitEvent.getter()
{
  return 12;
}

void *CallEvent.enterEvent.unsafeMutableAddressor()
{
  return &static CallEvent.enterEvent;
}

uint64_t static CallEvent.enterEvent.getter()
{
  return 13;
}

void *CallEvent.initialEvent.unsafeMutableAddressor()
{
  return &static CallEvent.initialEvent;
}

uint64_t static CallEvent.initialEvent.getter()
{
  return 14;
}

uint64_t protocol witness for EventProtocol.init(name:) in conformance CallEvent@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = specialized CallEvent.init(name:)(a1, a2);
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = v5 & 1;
  return result;
}

uint64_t protocol witness for EventProtocol.name.getter in conformance CallEvent()
{
  return CallEvent.name.getter(*v0);
}

void protocol witness for static EventProtocol.enterEvent.getter in conformance CallEvent(void *a1@<X8>)
{
  *a1 = 13;
}

void protocol witness for static EventProtocol.exitEvent.getter in conformance CallEvent(void *a1@<X8>)
{
  *a1 = 12;
}

void protocol witness for static EventProtocol.initialEvent.getter in conformance CallEvent(void *a1@<X8>)
{
  *a1 = 14;
}

uint64_t Event.init(name:)(uint64_t a1, uint64_t a2)
{
  return specialized Event.init(name:)(a1, a2);
}

unint64_t Event.name.getter(uint64_t a1)
{
  unint64_t result = 0x72656767697274;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
    case 2:
      unint64_t result = 0x6F69746E65747461;
      break;
    case 3:
      unint64_t result = 0x656C62616E65;
      break;
    case 4:
      unint64_t result = 0x656C6261736964;
      break;
    case 5:
      unint64_t result = 0x4372656767697274;
      break;
    case 6:
      unint64_t result = 0x655274696D627573;
      break;
    case 7:
      unint64_t result = 0x6449656D6F636562;
      break;
    case 8:
      unint64_t result = 0x636F72506C696166;
      break;
    case 9:
      unint64_t result = 0x52746E6573657270;
      break;
    case 10:
      unint64_t result = 0x71655274726F6261;
      break;
    case 11:
      unint64_t result = 0x5474756F656D6974;
      break;
    case 12:
      unint64_t result = 0xD000000000000013;
      break;
    case 13:
      unint64_t result = 0x7373696D736964;
      break;
    case 14:
      unint64_t result = 1953069157;
      break;
    case 15:
      unint64_t result = 0x7265746E65;
      break;
    case 16:
      unint64_t result = 0x6C616974696E69;
      break;
    default:
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      JUMPOUT(0x220968EE4);
  }
  return result;
}

void *Event.exitEvent.unsafeMutableAddressor()
{
  return &static Event.exitEvent;
}

uint64_t static Event.exitEvent.getter()
{
  return 14;
}

void *Event.enterEvent.unsafeMutableAddressor()
{
  return &static Event.enterEvent;
}

uint64_t static Event.enterEvent.getter()
{
  return 15;
}

void *Event.initialEvent.unsafeMutableAddressor()
{
  return &static Event.initialEvent;
}

uint64_t static Event.initialEvent.getter()
{
  return 16;
}

uint64_t protocol witness for EventProtocol.init(name:) in conformance Event@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = specialized Event.init(name:)(a1, a2);
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = v5 & 1;
  return result;
}

unint64_t protocol witness for EventProtocol.name.getter in conformance Event()
{
  return Event.name.getter(*v0);
}

void protocol witness for static EventProtocol.enterEvent.getter in conformance Event(void *a1@<X8>)
{
  *a1 = 15;
}

void protocol witness for static EventProtocol.initialEvent.getter in conformance Event(void *a1@<X8>)
{
  *a1 = 16;
}

uint64_t SharedEvent.init(name:)(uint64_t a1, uint64_t a2)
{
  return specialized SharedEvent.init(name:)(a1, a2);
}

unint64_t SharedEvent.name.getter(uint64_t a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
    case 6:
      unint64_t result = 0xD000000000000016;
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    case 7:
      unint64_t result = 1953069157;
      break;
    case 8:
      unint64_t result = 0x7265746E65;
      break;
    case 9:
      unint64_t result = 0x6C616974696E69;
      break;
    default:
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      JUMPOUT(0x2209690F8);
  }
  return result;
}

void *SharedEvent.exitEvent.unsafeMutableAddressor()
{
  return &static SharedEvent.exitEvent;
}

uint64_t static SharedEvent.exitEvent.getter()
{
  return 7;
}

void *SharedEvent.enterEvent.unsafeMutableAddressor()
{
  return &static SharedEvent.enterEvent;
}

uint64_t static SharedEvent.enterEvent.getter()
{
  return 8;
}

void *SharedEvent.initialEvent.unsafeMutableAddressor()
{
  return &static SharedEvent.initialEvent;
}

uint64_t static SharedEvent.initialEvent.getter()
{
  return 9;
}

uint64_t protocol witness for EventProtocol.init(name:) in conformance SharedEvent@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = specialized SharedEvent.init(name:)(a1, a2);
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = v5 & 1;
  return result;
}

unint64_t protocol witness for EventProtocol.name.getter in conformance SharedEvent()
{
  return SharedEvent.name.getter(*v0);
}

void protocol witness for static EventProtocol.enterEvent.getter in conformance SharedEvent(void *a1@<X8>)
{
  *a1 = 8;
}

void protocol witness for static EventProtocol.exitEvent.getter in conformance SharedEvent(void *a1@<X8>)
{
  *a1 = 7;
}

void protocol witness for static EventProtocol.initialEvent.getter in conformance SharedEvent(void *a1@<X8>)
{
  *a1 = 9;
}

uint64_t specialized CallEvent.init(name:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C61437472617473 && a2 == 0xE90000000000006CLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000220984480 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6C61436E696F6ALL && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000220984460 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C6143657661656CLL && a2 == 0xE90000000000006CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6C6C6143646E65 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C6C61436574756DLL && a2 == 0xEB0000000063694DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x61436574756D6E75 && a2 == 0xED000063694D6C6CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6C6C6143646C6F68 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6143646C6F686E75 && a2 == 0xEA00000000006C6CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6143686374697773 && a2 == 0xEB00000000736C6CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000220984440 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 1953069157 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x7265746E65 && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x6C616974696E69 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 14;
    }
    else {
      return 0;
    }
  }
}

uint64_t specialized Event.init(name:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x72656767697274 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69746E65747461 && a2 == 0xED00006E6961476ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F69746E65747461 && a2 == 0xED000073736F4C6ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C62616E65 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656C6261736964 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4372656767697274 && a2 == 0xED000074696D6D6FLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x655274696D627573 && a2 == 0xED00007473657571 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6449656D6F636562 && a2 == 0xEA0000000000656CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x636F72506C696166 && a2 == 0xEE00676E69737365 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x52746E6573657270 && a2 == 0xEF65736E6F707365 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x71655274726F6261 && a2 == 0xEC00000074736575 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x5474756F656D6974 && a2 == 0xEB000000006E7275 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002209844A0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x7373696D736964 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 1953069157 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x7265746E65 && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0x6C616974696E69 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 16;
    }
    else {
      return 0;
    }
  }
}

uint64_t specialized SharedEvent.init(name:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000017 && a2 == 0x8000000220984580
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000220984560 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000220984540 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000220984520 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000220984500 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000002209844E0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002209844C0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 1953069157 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x7265746E65 && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6C616974696E69 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 9;
    }
    else {
      return 0;
    }
  }
}

unint64_t instantiation function for generic protocol witness table for CallEvent(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type CallEvent and conformance CallEvent();
  *(void *)(a1 + 8) = result;
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table accessor for type CallEvent and conformance CallEvent();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CallEvent and conformance CallEvent()
{
  unint64_t result = lazy protocol witness table cache variable for type CallEvent and conformance CallEvent;
  if (!lazy protocol witness table cache variable for type CallEvent and conformance CallEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CallEvent and conformance CallEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CallEvent and conformance CallEvent;
  if (!lazy protocol witness table cache variable for type CallEvent and conformance CallEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CallEvent and conformance CallEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CallEvent and conformance CallEvent;
  if (!lazy protocol witness table cache variable for type CallEvent and conformance CallEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CallEvent and conformance CallEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CallEvent and conformance CallEvent;
  if (!lazy protocol witness table cache variable for type CallEvent and conformance CallEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CallEvent and conformance CallEvent);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for Event(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type Event and conformance Event();
  *(void *)(a1 + 8) = result;
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table accessor for type Event and conformance Event();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Event and conformance Event()
{
  unint64_t result = lazy protocol witness table cache variable for type Event and conformance Event;
  if (!lazy protocol witness table cache variable for type Event and conformance Event)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Event and conformance Event);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Event and conformance Event;
  if (!lazy protocol witness table cache variable for type Event and conformance Event)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Event and conformance Event);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Event and conformance Event;
  if (!lazy protocol witness table cache variable for type Event and conformance Event)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Event and conformance Event);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Event and conformance Event;
  if (!lazy protocol witness table cache variable for type Event and conformance Event)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Event and conformance Event);
  }
  return result;
}

id one-time initialization function for postResponse()
{
  type metadata accessor for State();
  unint64_t v0 = (void *)*State.attending.unsafeMutableAddressor();
  id v1 = v0;
  id result = State.__allocating_init(name:parent:eventHandler:)(0x7365522D74736F50, 0xED000065736E6F70, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.postResponse, 0);
  static State.postResponse = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.postResponse(uint64_t a1)
{
  switch(a1)
  {
    case 9:
      id v1 = (id *)State.responding.unsafeMutableAddressor();
      break;
    case 13:
      id v1 = (id *)State.available.unsafeMutableAddressor();
      break;
    case 11:
      id v1 = (id *)State.resting.unsafeMutableAddressor();
      break;
    default:
      return 0;
  }
  id v2 = *v1;
  id v3 = *v1;
  return v2;
}

uint64_t *State.postResponse.unsafeMutableAddressor()
{
  if (one-time initialization token for postResponse != -1) {
    swift_once();
  }
  return &static State.postResponse;
}

id static State.postResponse.getter()
{
  if (one-time initialization token for postResponse != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static State.postResponse;
  return v0;
}

uint64_t key path getter for CallState.parent : CallState@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return key path getter for CallState.parent : CallState(a1, &OBJC_IVAR____SRSTCallState_parent, a2);
}

uint64_t key path setter for CallState.parent : CallState()
{
  return key path setter for CallState.parent : CallState();
}

{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t CallState.parent.getter()
{
  return CallState.parent.getter(&OBJC_IVAR____SRSTCallState_parent);
}

void CallState.parent.setter(void *a1)
{
}

{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

uint64_t (*CallState.parent.modify(void *a1))()
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SRSTCallState_parent;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C6C570](v5);
  return CallState.parent.modify;
}

uint64_t CallState.description.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____SRSTCallState_name);
  swift_bridgeObjectRetain();
  return v1;
}

id CallState.__allocating_init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.__allocating_init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTCallState_parent, &OBJC_IVAR____SRSTCallState_name, &OBJC_IVAR____SRSTCallState_eventHandler);
}

id CallState.init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTCallState_parent, &OBJC_IVAR____SRSTCallState_name, &OBJC_IVAR____SRSTCallState_eventHandler);
}

uint64_t CallState.isEqual(_:)(uint64_t a1)
{
  return CallState.isEqual(_:)(a1, &OBJC_IVAR____SRSTCallState_name);
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t CallState.hash.getter()
{
  return CallState.hash.getter();
}

{
  lazy protocol witness table accessor for type String and conformance String();
  return StringProtocol.hash.getter();
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

id CallState.makeProxy()()
{
  return CallState.makeProxy()(type metadata accessor for CallStateProxy, &OBJC_IVAR____SRSTCallStateProxy_state);
}

id CallStateProxy.__allocating_init(_:)(uint64_t a1)
{
  return CallStateProxy.__allocating_init(_:)(a1, &OBJC_IVAR____SRSTCallStateProxy_state);
}

uint64_t type metadata accessor for CallStateProxy()
{
  return self;
}

void CallState.init()()
{
}

id CallStateProxy.state.getter()
{
  return *(id *)(v0 + OBJC_IVAR____SRSTCallStateProxy_state);
}

id CallStateProxy.init(_:)(uint64_t a1)
{
  return CallStateProxy.init(_:)(a1, &OBJC_IVAR____SRSTCallStateProxy_state);
}

uint64_t CallStateProxy.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return CallStateProxy.init(from:)(a1);
}

uint64_t CallStateProxy.init(from:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  char v6 = v1;
  id v7 = v5;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_deallocPartialClassInstance();
    return (uint64_t)v7;
  }
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  uint64_t v9 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  uint64_t v11 = v10;
  CallState.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v12 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v12, v9, (uint64_t)v11, (void (*)(void))type metadata accessor for CallState, &lazy protocol witness table cache variable for type CallState and conformance NSObject, (void (*)(void))type metadata accessor for CallState, &OBJC_IVAR____SRSTCallState_name);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    swift_bridgeObjectRelease();
    *(void *)&v6[OBJC_IVAR____SRSTCallStateProxy_state] = v14;

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    v18.receiver = v6;
    v18.super_class = ObjectType;
    id v7 = objc_msgSendSuper2(&v18, sel_init);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return (uint64_t)v7;
  }
  _StringGuts.grow(_:)(67);
  v15._object = (void *)0x8000000220984600;
  v15._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v15);
  v16._countAndFlagsBits = v9;
  v16._object = v11;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0xD000000000000026;
  v17._object = (void *)0x8000000220984620;
  String.append(_:)(v17);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
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

uint64_t static CallState.named(_:)(uint64_t a1, uint64_t a2)
{
  CallState.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v4, a1, a2, (void (*)(void))type metadata accessor for CallState, &lazy protocol witness table cache variable for type CallState and conformance NSObject, (void (*)(void))type metadata accessor for CallState, &OBJC_IVAR____SRSTCallState_name);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t CallStateProxy.encode(to:)(void *a1)
{
  return CallStateProxy.encode(to:)(a1);
}

{
  unsigned char v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  swift_bridgeObjectRetain();
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

void CallStateProxy.init()()
{
}

uint64_t protocol witness for Decodable.init(from:) in conformance CallStateProxy@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for Decodable.init(from:) in conformance CallStateProxy(a1, (uint64_t (*)(uint64_t))CallStateProxy.init(from:), a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CallStateProxy(void *a1)
{
  return protocol witness for Encodable.encode(to:) in conformance CallStateProxy(a1);
}

{
  unsigned char v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  swift_bridgeObjectRetain();
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

id protocol witness for ProxyProtocol.state.getter in conformance CallStateProxy@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(*v1 + OBJC_IVAR____SRSTCallStateProxy_state);
  *a1 = v2;
  return v2;
}

uint64_t CallStateProxy.isEqual(_:)(uint64_t a1)
{
  return CallStateProxy.isEqual(_:)(a1, &OBJC_IVAR____SRSTCallStateProxy_state);
}

uint64_t @objc CallState.isEqual(_:)(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = a1;
  }
  char v8 = a4(v10);

  outlined destroy of Any?((uint64_t)v10);
  return v8 & 1;
}

uint64_t CallStateProxy.hash.getter()
{
  return CallStateProxy.hash.getter();
}

{
  lazy protocol witness table accessor for type String and conformance String();
  return StringProtocol.hash.getter();
}

uint64_t CallState.handle(event:)()
{
  return (*(uint64_t (**)(void))(v0 + OBJC_IVAR____SRSTCallState_eventHandler))();
}

uint64_t protocol witness for StateProtocol.parent.getter in conformance CallState@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for StateProtocol.parent.getter in conformance CallState(&OBJC_IVAR____SRSTCallState_parent, a1);
}

uint64_t protocol witness for StateProtocol.name.getter in conformance CallState(uint64_t a1, uint64_t a2)
{
  return protocol witness for StateProtocol.name.getter in conformance CallState(a1, a2, &OBJC_IVAR____SRSTCallState_name);
}

uint64_t protocol witness for StateProtocol.handle(event:) in conformance CallState@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for StateProtocol.handle(event:) in conformance CallState(a1, &OBJC_IVAR____SRSTCallState_eventHandler, a2);
}

id protocol witness for StateProtocol.makeProxy() in conformance CallState@<X0>(void *a1@<X8>)
{
  return protocol witness for StateProtocol.makeProxy() in conformance CallState(type metadata accessor for CallStateProxy, &OBJC_IVAR____SRSTCallStateProxy_state, a1);
}

uint64_t protocol witness for static StateProtocol.named(_:) in conformance CallState@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  CallState.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v6, a1, a2, (void (*)(void))type metadata accessor for CallState, &lazy protocol witness table cache variable for type CallState and conformance NSObject, (void (*)(void))type metadata accessor for CallState, &OBJC_IVAR____SRSTCallState_name);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v8;
  return result;
}

uint64_t key path getter for State.parent : State@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return key path getter for CallState.parent : CallState(a1, &OBJC_IVAR____SRSTState_parent, a2);
}

uint64_t key path setter for State.parent : State()
{
  return key path setter for CallState.parent : CallState();
}

uint64_t State.parent.getter()
{
  return CallState.parent.getter(&OBJC_IVAR____SRSTState_parent);
}

void State.parent.setter(void *a1)
{
}

uint64_t (*State.parent.modify(void *a1))()
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SRSTState_parent;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C6C570](v5);
  return CallState.parent.modify;
}

uint64_t State.description.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____SRSTState_name);
  swift_bridgeObjectRetain();
  return v1;
}

id State.__allocating_init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.__allocating_init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTState_parent, &OBJC_IVAR____SRSTState_name, &OBJC_IVAR____SRSTState_eventHandler);
}

id State.init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTState_parent, &OBJC_IVAR____SRSTState_name, &OBJC_IVAR____SRSTState_eventHandler);
}

uint64_t State.isEqual(_:)(uint64_t a1)
{
  return CallState.isEqual(_:)(a1, &OBJC_IVAR____SRSTState_name);
}

uint64_t State.hash.getter()
{
  return CallState.hash.getter();
}

id State.makeProxy()()
{
  return CallState.makeProxy()(type metadata accessor for StateProxy, &OBJC_IVAR____SRSTStateProxy_state);
}

id StateProxy.__allocating_init(_:)(uint64_t a1)
{
  return CallStateProxy.__allocating_init(_:)(a1, &OBJC_IVAR____SRSTStateProxy_state);
}

void State.init()()
{
}

id StateProxy.state.getter()
{
  return *(id *)(v0 + OBJC_IVAR____SRSTStateProxy_state);
}

id StateProxy.init(_:)(uint64_t a1)
{
  return CallStateProxy.init(_:)(a1, &OBJC_IVAR____SRSTStateProxy_state);
}

uint64_t StateProxy.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StateProxy.init(from:)(a1);
}

uint64_t StateProxy.init(from:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v6 = v1;
  id v7 = v5;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_deallocPartialClassInstance();
    return (uint64_t)v7;
  }
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  uint64_t v9 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  uint64_t v11 = v10;
  State.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v12 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v12, v9, (uint64_t)v11, (void (*)(void))type metadata accessor for State, &lazy protocol witness table cache variable for type State and conformance NSObject, (void (*)(void))type metadata accessor for State, &OBJC_IVAR____SRSTState_name);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    swift_bridgeObjectRelease();
    *(void *)&v6[OBJC_IVAR____SRSTStateProxy_state] = v14;

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    v18.receiver = v6;
    v18.super_class = ObjectType;
    id v7 = objc_msgSendSuper2(&v18, sel_init);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return (uint64_t)v7;
  }
  _StringGuts.grow(_:)(67);
  v15._object = (void *)0x8000000220984600;
  v15._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v15);
  v16._countAndFlagsBits = v9;
  v16._object = v11;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0xD000000000000026;
  v17._object = (void *)0x8000000220984620;
  String.append(_:)(v17);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static State.named(_:)(uint64_t a1, uint64_t a2)
{
  State.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v4, a1, a2, (void (*)(void))type metadata accessor for State, &lazy protocol witness table cache variable for type State and conformance NSObject, (void (*)(void))type metadata accessor for State, &OBJC_IVAR____SRSTState_name);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t StateProxy.encode(to:)(void *a1)
{
  return CallStateProxy.encode(to:)(a1);
}

id StateProxy.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void StateProxy.init()()
{
}

uint64_t protocol witness for Decodable.init(from:) in conformance StateProxy@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for Decodable.init(from:) in conformance CallStateProxy(a1, (uint64_t (*)(uint64_t))StateProxy.init(from:), a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance StateProxy(void *a1)
{
  return protocol witness for Encodable.encode(to:) in conformance CallStateProxy(a1);
}

id protocol witness for ProxyProtocol.state.getter in conformance StateProxy@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(*v1 + OBJC_IVAR____SRSTStateProxy_state);
  *a1 = v2;
  return v2;
}

uint64_t StateProxy.isEqual(_:)(uint64_t a1)
{
  return CallStateProxy.isEqual(_:)(a1, &OBJC_IVAR____SRSTStateProxy_state);
}

uint64_t StateProxy.hash.getter()
{
  return CallStateProxy.hash.getter();
}

uint64_t State.handle(event:)()
{
  return (*(uint64_t (**)(void))(v0 + OBJC_IVAR____SRSTState_eventHandler))();
}

uint64_t protocol witness for StateProtocol.parent.getter in conformance State@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for StateProtocol.parent.getter in conformance CallState(&OBJC_IVAR____SRSTState_parent, a1);
}

uint64_t protocol witness for StateProtocol.name.getter in conformance State(uint64_t a1, uint64_t a2)
{
  return protocol witness for StateProtocol.name.getter in conformance CallState(a1, a2, &OBJC_IVAR____SRSTState_name);
}

uint64_t protocol witness for StateProtocol.handle(event:) in conformance State@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for StateProtocol.handle(event:) in conformance CallState(a1, &OBJC_IVAR____SRSTState_eventHandler, a2);
}

id protocol witness for StateProtocol.makeProxy() in conformance State@<X0>(void *a1@<X8>)
{
  return protocol witness for StateProtocol.makeProxy() in conformance CallState(type metadata accessor for StateProxy, &OBJC_IVAR____SRSTStateProxy_state, a1);
}

uint64_t protocol witness for static StateProtocol.named(_:) in conformance State@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  State.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v6, a1, a2, (void (*)(void))type metadata accessor for State, &lazy protocol witness table cache variable for type State and conformance NSObject, (void (*)(void))type metadata accessor for State, &OBJC_IVAR____SRSTState_name);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v8;
  return result;
}

uint64_t key path getter for SharedState.parent : SharedState@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return key path getter for CallState.parent : CallState(a1, &OBJC_IVAR____SRSTSharedState_parent, a2);
}

uint64_t key path getter for CallState.parent : CallState@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1 + *a2;
  swift_beginAccess();
  uint64_t result = MEMORY[0x223C6C570](v4);
  *a3 = result;
  return result;
}

uint64_t key path setter for SharedState.parent : SharedState()
{
  return key path setter for CallState.parent : CallState();
}

uint64_t SharedState.parent.getter()
{
  return CallState.parent.getter(&OBJC_IVAR____SRSTSharedState_parent);
}

uint64_t CallState.parent.getter(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x223C6C570](v2);
}

void SharedState.parent.setter(void *a1)
{
}

uint64_t (*SharedState.parent.modify(void *a1))()
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SRSTSharedState_parent;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C6C570](v5);
  return CallState.parent.modify;
}

void CallState.parent.modify(id **a1, char a2)
{
  id v3 = *a1;
  id v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if (a2)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();
  }
  free(v3);
}

id @objc CallState.name.getter(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (uint64_t *)(a1 + *a3);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)MEMORY[0x223C6BB50](v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t SharedState.description.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____SRSTSharedState_name);
  swift_bridgeObjectRetain();
  return v1;
}

id SharedState.__allocating_init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.__allocating_init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTSharedState_parent, &OBJC_IVAR____SRSTSharedState_name, &OBJC_IVAR____SRSTSharedState_eventHandler);
}

id CallState.__allocating_init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  Swift::String v16 = (char *)objc_allocWithZone(v8);
  swift_unknownObjectWeakInit();
  Swift::String v17 = &v16[*a7];
  *(void *)Swift::String v17 = a1;
  *((void *)v17 + 1) = a2;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  objc_super v18 = &v16[*a8];
  *(void *)objc_super v18 = a4;
  *((void *)v18 + 1) = a5;
  v21.receiver = v16;
  v21.super_class = v8;
  id v19 = objc_msgSendSuper2(&v21, sel_init);

  return v19;
}

id SharedState.init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTSharedState_parent, &OBJC_IVAR____SRSTSharedState_name, &OBJC_IVAR____SRSTSharedState_eventHandler);
}

id CallState.init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  Swift::String v17 = &v8[*a7];
  *(void *)Swift::String v17 = a1;
  *((void *)v17 + 1) = a2;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  objc_super v18 = &v8[*a8];
  *(void *)objc_super v18 = a4;
  *((void *)v18 + 1) = a5;
  v21.receiver = v8;
  v21.super_class = ObjectType;
  id v19 = objc_msgSendSuper2(&v21, sel_init);

  return v19;
}

uint64_t SharedState.isEqual(_:)(uint64_t a1)
{
  return CallState.isEqual(_:)(a1, &OBJC_IVAR____SRSTSharedState_name);
}

uint64_t CallState.isEqual(_:)(uint64_t a1, void *a2)
{
  swift_getObjectType();
  outlined init with copy of Any?(a1, (uint64_t)v11);
  if (!v12)
  {
    outlined destroy of Any?((uint64_t)v11);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    char v8 = 0;
    return v8 & 1;
  }
  uint64_t v5 = &v10[*a2];
  uint64_t v6 = (void *)(v2 + *a2);
  if (*(void *)v5 == *v6 && *((void *)v5 + 1) == v6[1])
  {

    char v8 = 1;
  }
  else
  {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  return v8 & 1;
}

uint64_t @objc CallState.hash.getter()
{
  return StringProtocol.hash.getter();
}

uint64_t SharedState.hash.getter()
{
  return CallState.hash.getter();
}

id SharedState.makeProxy()()
{
  return CallState.makeProxy()(type metadata accessor for SharedStateProxy, &OBJC_IVAR____SRSTSharedStateProxy_state);
}

id CallState.makeProxy()(uint64_t (*a1)(void), void *a2)
{
  uint64_t v4 = (objc_class *)a1();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[*a2] = v2;
  v8.receiver = v5;
  v8.super_class = v4;
  id v6 = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id SharedStateProxy.__allocating_init(_:)(uint64_t a1)
{
  return CallStateProxy.__allocating_init(_:)(a1, &OBJC_IVAR____SRSTSharedStateProxy_state);
}

id CallStateProxy.__allocating_init(_:)(uint64_t a1, void *a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[*a2] = a1;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id @objc CallState.makeProxy()(void *a1, uint64_t a2, uint64_t (*a3)(void), void *a4)
{
  id v6 = (objc_class *)a3();
  objc_super v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[*a4] = a1;
  v11.receiver = v7;
  v11.super_class = v6;
  id v8 = a1;
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  return v9;
}

void SharedState.init()()
{
}

uint64_t @objc CallState.__ivar_destroyer()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  return swift_release();
}

id SharedStateProxy.state.getter()
{
  return *(id *)(v0 + OBJC_IVAR____SRSTSharedStateProxy_state);
}

id SharedStateProxy.init(_:)(uint64_t a1)
{
  return CallStateProxy.init(_:)(a1, &OBJC_IVAR____SRSTSharedStateProxy_state);
}

id CallStateProxy.init(_:)(uint64_t a1, void *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[*a2] = a1;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id @objc CallStateProxy.init(_:)(char *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&a1[*a4] = a3;
  v10.receiver = a1;
  v10.super_class = ObjectType;
  id v8 = a3;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t SharedStateProxy.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SharedStateProxy.init(from:)(a1);
}

uint64_t SharedStateProxy.init(from:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  id v6 = v1;
  id v7 = v5;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_deallocPartialClassInstance();
    return (uint64_t)v7;
  }
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  uint64_t v9 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  objc_super v11 = v10;
  SharedState.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v12 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v12, v9, (uint64_t)v11, (void (*)(void))type metadata accessor for SharedState, &lazy protocol witness table cache variable for type SharedState and conformance NSObject, (void (*)(void))type metadata accessor for SharedState, &OBJC_IVAR____SRSTSharedState_name);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    swift_bridgeObjectRelease();
    *(void *)&v6[OBJC_IVAR____SRSTSharedStateProxy_state] = v14;

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    v18.receiver = v6;
    v18.super_class = ObjectType;
    id v7 = objc_msgSendSuper2(&v18, sel_init);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return (uint64_t)v7;
  }
  _StringGuts.grow(_:)(67);
  v15._object = (void *)0x8000000220984600;
  v15._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v15);
  v16._countAndFlagsBits = v9;
  v16._object = v11;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0xD000000000000026;
  v17._object = (void *)0x8000000220984620;
  String.append(_:)(v17);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static SharedState.named(_:)(uint64_t a1, uint64_t a2)
{
  SharedState.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v4, a1, a2, (void (*)(void))type metadata accessor for SharedState, &lazy protocol witness table cache variable for type SharedState and conformance NSObject, (void (*)(void))type metadata accessor for SharedState, &OBJC_IVAR____SRSTSharedState_name);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t SharedStateProxy.encode(to:)(void *a1)
{
  return CallStateProxy.encode(to:)(a1);
}

void SharedStateProxy.init()()
{
}

id CallState.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for Decodable.init(from:) in conformance SharedStateProxy@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for Decodable.init(from:) in conformance CallStateProxy(a1, (uint64_t (*)(uint64_t))SharedStateProxy.init(from:), a2);
}

uint64_t protocol witness for Decodable.init(from:) in conformance CallStateProxy@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  id v8 = objc_allocWithZone(v3);
  uint64_t result = a2(a1);
  if (!v4) {
    *a3 = result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SharedStateProxy(void *a1)
{
  return protocol witness for Encodable.encode(to:) in conformance CallStateProxy(a1);
}

id protocol witness for ProxyProtocol.state.getter in conformance SharedStateProxy@<X0>(void *a1@<X8>)
{
  objc_super v2 = *(void **)(*v1 + OBJC_IVAR____SRSTSharedStateProxy_state);
  *a1 = v2;
  return v2;
}

uint64_t SharedStateProxy.isEqual(_:)(uint64_t a1)
{
  return CallStateProxy.isEqual(_:)(a1, &OBJC_IVAR____SRSTSharedStateProxy_state);
}

uint64_t CallStateProxy.isEqual(_:)(uint64_t a1, void *a2)
{
  swift_getObjectType();
  outlined init with copy of Any?(a1, (uint64_t)v8);
  if (!v9)
  {
    outlined destroy of Any?((uint64_t)v8);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v5 = 0;
    return v5 & 1;
  }
  type metadata accessor for NSObject();
  id v4 = *(id *)&v7[*a2];
  char v5 = static NSObject.== infix(_:_:)();

  return v5 & 1;
}

uint64_t @objc CallStateProxy.hash.getter()
{
  return StringProtocol.hash.getter();
}

uint64_t SharedStateProxy.hash.getter()
{
  return CallStateProxy.hash.getter();
}

uint64_t SharedState.handle(event:)()
{
  return (*(uint64_t (**)(void))(v0 + OBJC_IVAR____SRSTSharedState_eventHandler))();
}

uint64_t protocol witness for StateProtocol.parent.getter in conformance SharedState@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for StateProtocol.parent.getter in conformance CallState(&OBJC_IVAR____SRSTSharedState_parent, a1);
}

uint64_t protocol witness for StateProtocol.parent.getter in conformance CallState@<X0>(void *a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *v2 + *a1;
  swift_beginAccess();
  uint64_t result = MEMORY[0x223C6C570](v4);
  *a2 = result;
  return result;
}

uint64_t protocol witness for StateProtocol.name.getter in conformance SharedState(uint64_t a1, uint64_t a2)
{
  return protocol witness for StateProtocol.name.getter in conformance CallState(a1, a2, &OBJC_IVAR____SRSTSharedState_name);
}

uint64_t protocol witness for StateProtocol.name.getter in conformance CallState(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*v3 + *a3);
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t protocol witness for StateProtocol.handle(event:) in conformance SharedState@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for StateProtocol.handle(event:) in conformance CallState(a1, &OBJC_IVAR____SRSTSharedState_eventHandler, a2);
}

uint64_t protocol witness for StateProtocol.handle(event:) in conformance CallState@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(*v3 + *a2))(*a1);
  *a3 = result;
  return result;
}

id protocol witness for StateProtocol.makeProxy() in conformance SharedState@<X0>(void *a1@<X8>)
{
  return protocol witness for StateProtocol.makeProxy() in conformance CallState(type metadata accessor for SharedStateProxy, &OBJC_IVAR____SRSTSharedStateProxy_state, a1);
}

id protocol witness for StateProtocol.makeProxy() in conformance CallState@<X0>(uint64_t (*a1)(void)@<X2>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v6 = *v3;
  id v7 = (objc_class *)a1();
  id v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[*a2] = v6;
  v11.receiver = v8;
  v11.super_class = v7;
  id v9 = v6;
  id result = objc_msgSendSuper2(&v11, sel_init);
  *a3 = result;
  return result;
}

uint64_t protocol witness for static StateProtocol.named(_:) in conformance SharedState@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  SharedState.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v6, a1, a2, (void (*)(void))type metadata accessor for SharedState, &lazy protocol witness table cache variable for type SharedState and conformance NSObject, (void (*)(void))type metadata accessor for SharedState, &OBJC_IVAR____SRSTSharedState_name);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v8;
  return result;
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

unint64_t type metadata accessor for NSObject()
{
  unint64_t result = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  }
  return result;
}

uint64_t type metadata accessor for StateProxy()
{
  return self;
}

void specialized Sequence.first(where:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), unint64_t *a5, void (*a6)(void), void *a7)
{
  uint64_t v9 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    a4();
    lazy protocol witness table accessor for type CallState and conformance CallState(a5, a6);
    Set.Iterator.init(_cocoa:)();
    uint64_t v9 = v33;
    uint64_t v31 = v34;
    uint64_t v13 = v35;
    uint64_t v14 = v36;
    unint64_t v15 = v37;
  }
  else
  {
    uint64_t v16 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v31 = a1 + 56;
    uint64_t v17 = ~v16;
    uint64_t v18 = -v16;
    if (v18 < 64) {
      uint64_t v19 = ~(-1 << v18);
    }
    else {
      uint64_t v19 = -1;
    }
    unint64_t v15 = v19 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v13 = v17;
    uint64_t v14 = 0;
  }
  int64_t v30 = (unint64_t)(v13 + 64) >> 6;
  if (v9 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v15)
  {
    uint64_t v20 = (v15 - 1) & v15;
    unint64_t v21 = __clz(__rbit64(v15)) | (v14 << 6);
    uint64_t v22 = v14;
    goto LABEL_29;
  }
  int64_t v24 = v14 + 1;
  if (!__OFADD__(v14, 1))
  {
    if (v24 < v30)
    {
      unint64_t v25 = *(void *)(v31 + 8 * v24);
      uint64_t v22 = v14 + 1;
      if (v25) {
        goto LABEL_28;
      }
      uint64_t v22 = v14 + 2;
      if (v14 + 2 >= v30) {
        goto LABEL_37;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v22);
      if (v25) {
        goto LABEL_28;
      }
      uint64_t v22 = v14 + 3;
      if (v14 + 3 >= v30) {
        goto LABEL_37;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v22);
      if (v25) {
        goto LABEL_28;
      }
      uint64_t v22 = v14 + 4;
      if (v14 + 4 >= v30) {
        goto LABEL_37;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v22);
      if (v25)
      {
LABEL_28:
        uint64_t v20 = (v25 - 1) & v25;
        unint64_t v21 = __clz(__rbit64(v25)) + (v22 << 6);
LABEL_29:
        unint64_t v23 = (char *)*(id *)(*(void *)(v9 + 48) + 8 * v21);
        if (v23)
        {
          do
          {
            uint64_t v27 = &v23[*a7];
            BOOL v28 = *(void *)v27 == a2 && *((void *)v27 + 1) == a3;
            if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              break;
            }

            uint64_t v14 = v22;
            unint64_t v15 = v20;
            if ((v9 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (!__CocoaSet.Iterator.next()()) {
              break;
            }
            a4();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            unint64_t v23 = v38;
            swift_unknownObjectRelease();
            uint64_t v22 = v14;
            uint64_t v20 = v15;
          }
          while (v38);
        }
        goto LABEL_37;
      }
      uint64_t v22 = v14 + 5;
      if (v14 + 5 < v30)
      {
        unint64_t v25 = *(void *)(v31 + 8 * v22);
        if (!v25)
        {
          uint64_t v26 = v14 + 6;
          while (v30 != v26)
          {
            unint64_t v25 = *(void *)(v31 + 8 * v26++);
            if (v25)
            {
              uint64_t v22 = v26 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_37;
        }
        goto LABEL_28;
      }
    }
LABEL_37:
    outlined consume of Set<SharedState>.Iterator._Variant();
    return;
  }
  __break(1u);
}

uint64_t type metadata accessor for SharedStateProxy()
{
  return self;
}

uint64_t associated type witness table accessor for ProxyProtocol.StateType : StateProtocol in CallStateProxy()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type CallState and conformance CallState, (void (*)(void))type metadata accessor for CallState);
}

uint64_t type metadata accessor for CallState()
{
  return self;
}

uint64_t instantiation function for generic protocol witness table for CallStateProxy(uint64_t a1)
{
  *(void *)(a1 + 8) = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type CallStateProxy and conformance CallStateProxy, (void (*)(void))type metadata accessor for CallStateProxy);
  uint64_t result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type CallStateProxy and conformance CallStateProxy, (void (*)(void))type metadata accessor for CallStateProxy);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t associated type witness table accessor for StateProtocol.ProxyType : ProxyProtocol in CallState()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type CallStateProxy and conformance CallStateProxy, (void (*)(void))type metadata accessor for CallStateProxy);
}

uint64_t instantiation function for generic protocol witness table for CallState(uint64_t a1)
{
  uint64_t result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type CallState and conformance NSObject, (void (*)(void))type metadata accessor for CallState);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t associated type witness table accessor for ProxyProtocol.StateType : StateProtocol in StateProxy()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type State and conformance State, (void (*)(void))type metadata accessor for State);
}

uint64_t type metadata accessor for State()
{
  return self;
}

uint64_t instantiation function for generic protocol witness table for StateProxy(uint64_t a1)
{
  *(void *)(a1 + 8) = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type StateProxy and conformance StateProxy, (void (*)(void))type metadata accessor for StateProxy);
  uint64_t result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type StateProxy and conformance StateProxy, (void (*)(void))type metadata accessor for StateProxy);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t associated type witness table accessor for StateProtocol.ProxyType : ProxyProtocol in State()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type StateProxy and conformance StateProxy, (void (*)(void))type metadata accessor for StateProxy);
}

uint64_t instantiation function for generic protocol witness table for State(uint64_t a1)
{
  uint64_t result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type State and conformance NSObject, (void (*)(void))type metadata accessor for State);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t associated type witness table accessor for ProxyProtocol.StateType : StateProtocol in SharedStateProxy()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type SharedState and conformance SharedState, (void (*)(void))type metadata accessor for SharedState);
}

uint64_t type metadata accessor for SharedState()
{
  return self;
}

uint64_t instantiation function for generic protocol witness table for SharedStateProxy(uint64_t a1)
{
  *(void *)(a1 + 8) = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type SharedStateProxy and conformance SharedStateProxy, (void (*)(void))type metadata accessor for SharedStateProxy);
  uint64_t result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type SharedStateProxy and conformance SharedStateProxy, (void (*)(void))type metadata accessor for SharedStateProxy);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t associated type witness table accessor for StateProtocol.ProxyType : ProxyProtocol in SharedState()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type SharedStateProxy and conformance SharedStateProxy, (void (*)(void))type metadata accessor for SharedStateProxy);
}

uint64_t instantiation function for generic protocol witness table for SharedState(uint64_t a1)
{
  uint64_t result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type SharedState and conformance NSObject, (void (*)(void))type metadata accessor for SharedState);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type CallState and conformance CallState(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for CallState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CallState);
}

uint64_t dispatch thunk of CallState.__allocating_init(name:parent:eventHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for CallStateProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CallStateProxy);
}

uint64_t dispatch thunk of CallStateProxy.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CallStateProxy.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t method lookup function for State(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for State);
}

uint64_t dispatch thunk of State.__allocating_init(name:parent:eventHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for StateProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StateProxy);
}

uint64_t dispatch thunk of StateProxy.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of StateProxy.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t method lookup function for SharedState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SharedState);
}

uint64_t dispatch thunk of SharedState.__allocating_init(name:parent:eventHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for SharedStateProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SharedStateProxy);
}

uint64_t dispatch thunk of SharedStateProxy.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SharedStateProxy.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id one-time initialization function for preparingToServe()
{
  type metadata accessor for SharedState();
  uint64_t v0 = (void *)*SharedState.mirroring.unsafeMutableAddressor();
  id v1 = v0;
  id result = SharedState.__allocating_init(name:parent:eventHandler:)(0xD000000000000010, 0x8000000220984870, v0, (uint64_t)implicit closure #1 in variable initialization expression of static SharedState.preparingToServe, 0);
  static SharedState.preparingToServe = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static SharedState.preparingToServe(uint64_t a1)
{
  if (a1 == 3) {
    return 1;
  }
  if (a1 != 4 && a1 != 6) {
    return 0;
  }
  id v1 = (void *)*SharedState.passive.unsafeMutableAddressor();
  id v2 = v1;
  return (uint64_t)v1;
}

uint64_t *SharedState.preparingToServe.unsafeMutableAddressor()
{
  if (one-time initialization token for preparingToServe != -1) {
    swift_once();
  }
  return &static SharedState.preparingToServe;
}

id static SharedState.preparingToServe.getter()
{
  if (one-time initialization token for preparingToServe != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static SharedState.preparingToServe;
  return v0;
}

id one-time initialization function for unshared()
{
  type metadata accessor for SharedState();
  uint64_t v0 = (void *)*SharedState.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = SharedState.__allocating_init(name:parent:eventHandler:)(0x6465726168736E55, 0xE800000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static SharedState.unshared, 0);
  static SharedState.unshared = (uint64_t)result;
  return result;
}

void *implicit closure #1 in variable initialization expression of static SharedState.unshared(uint64_t a1)
{
  if (a1) {
    return 0;
  }
  id v1 = (void *)*SharedState.passive.unsafeMutableAddressor();
  id v2 = v1;
  return v1;
}

uint64_t *SharedState.unshared.unsafeMutableAddressor()
{
  if (one-time initialization token for unshared != -1) {
    swift_once();
  }
  return &static SharedState.unshared;
}

id static SharedState.unshared.getter()
{
  if (one-time initialization token for unshared != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static SharedState.unshared;
  return v0;
}

id one-time initialization function for listening()
{
  type metadata accessor for State();
  uint64_t v0 = (void *)*State.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = State.__allocating_init(name:parent:eventHandler:)(0x6E696E657473694CLL, 0xE900000000000067, v0, (uint64_t)variable initialization expression of SharedClient.delegate, 0);
  static State.listening = (uint64_t)result;
  return result;
}

uint64_t static State.handleForListeningState(event:)()
{
  return 0;
}

uint64_t *State.listening.unsafeMutableAddressor()
{
  if (one-time initialization token for listening != -1) {
    swift_once();
  }
  return &static State.listening;
}

id static State.listening.getter()
{
  if (one-time initialization token for listening != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static State.listening;
  return v0;
}

uint64_t dispatch thunk of ClientProtocol.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ClientProtocol.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ClientProtocol.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of ClientProtocol.currentState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ClientProtocol.currentState.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ClientProtocol.currentState.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of ClientProtocol.mostRecentEvent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of ClientProtocol.mostRecentEvent.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of ClientProtocol.mostRecentEvent.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of ClientProtocol.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of ClientProtocol.dispatchEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t CallServer.currentState.getter()
{
  return CallServer.currentState.getter(&OBJC_IVAR____SRSTCallServer_stateMachine);
}

id CallServer.__deallocating_deinit()
{
  return CallServer.__deallocating_deinit("Deinit called for CallServer", (uint64_t)&unk_26D227138, (void (*)(void))partial apply for closure #1 in SharedClient.deinit, (uint64_t (*)(void))type metadata accessor for CallServer);
}

uint64_t sub_22096E038()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t type metadata accessor for CallServer()
{
  return self;
}

id CallServer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t CallServer.init()()
{
  uint64_t ObjectType = swift_getObjectType();
  InstrumentationManager.sharedLogger.unsafeMutableAddressor();
  id v1 = *(uint64_t (**)(uint64_t))(ObjectType + 128);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_deallocPartialClassInstance();
  return v3;
}

char *CallServer.__allocating_init(instrumentationManager:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return CallServer.init(instrumentationManager:)(a1);
}

char *CallServer.init(instrumentationManager:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallState>.Publisher);
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v3, v4);
  int64_t v30 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____SRSTCallServer_stateMachineObserver] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StateMachine<CallState>);
  uint64_t v6 = v1;
  uint64_t v7 = swift_retain();
  uint64_t v31 = a1;
  *(void *)&v6[OBJC_IVAR____SRSTCallServer_stateMachine] = StateMachine<>.init(instrumentationManager:)(v7);

  uint64_t v8 = (objc_class *)type metadata accessor for CallServer();
  v37.receiver = v6;
  v37.super_class = v8;
  uint64_t v9 = (char *)objc_msgSendSuper2(&v37, sel_init);
  uint64_t v34 = static CallEvent.allCases.getter();
  uint64_t v10 = v34[2];
  if (v10)
  {
    objc_super v11 = v34 + 4;
    uint64_t v12 = darwinNotificationCenter.unsafeMutableAddressor();
    do
    {
      uint64_t v13 = *v11++;
      uint64_t v14 = v12->value;
      unint64_t v15 = eventDispatchNotificationNamePrefix.unsafeMutableAddressor();
      uint64_t countAndFlagsBits = v15->_countAndFlagsBits;
      object = v15->_object;
      swift_bridgeObjectRetain();
      uint64_t v18 = CallEvent.name.getter(v13);
      uint64_t v20 = v19;
      uint64_t v35 = countAndFlagsBits;
      uint64_t v36 = object;
      swift_bridgeObjectRetain();
      v21._uint64_t countAndFlagsBits = v18;
      v21._object = v20;
      String.append(_:)(v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v22 = (__CFString *)MEMORY[0x223C6BB50](v35, v36);
      swift_bridgeObjectRelease();
      CFNotificationCenterAddObserver(v14, v9, (CFNotificationCallback)@objc closure #1 in CallServer.init(instrumentationManager:), v22, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v10;
    }
    while (v10);
  }
  swift_bridgeObjectRelease();
  unint64_t v23 = *(void (**)(uint64_t))(**(void **)&v9[OBJC_IVAR____SRSTCallServer_stateMachine] + 160);
  uint64_t v24 = swift_retain();
  unint64_t v25 = v30;
  v23(v24);
  swift_release();
  lazy protocol witness table accessor for type Published<CallState>.Publisher and conformance Published<A>.Publisher(&lazy protocol witness table cache variable for type Published<CallState>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<CallState>.Publisher);
  uint64_t v26 = v33;
  uint64_t v27 = Publisher<>.sink(receiveValue:)();
  swift_release();

  (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v26);
  *(void *)&v9[OBJC_IVAR____SRSTCallServer_stateMachineObserver] = v27;
  swift_release();
  return v9;
}

void @objc closure #1 in CallServer.init(instrumentationManager:)(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a1;
  id v9 = a3;
  id v10 = a5;
  specialized closure #1 in CallServer.init(instrumentationManager:)(a2, (uint64_t)a3, "CallServer received valid event dispatch: %s", "CallServer posting darwin notification for event reception", &OBJC_IVAR____SRSTCallServer_stateMachine, (uint64_t (*)(uint64_t, void *))CallEvent.init(name:));
}

void closure #2 in CallServer.init(instrumentationManager:)(void **a1)
{
  closure #2 in CallServer.init(instrumentationManager:)(a1, &OBJC_IVAR____SRSTCallState_name, "CallServer posting darwin notification for state transition state=%s");
}

uint64_t Server.currentState.getter()
{
  return CallServer.currentState.getter(&OBJC_IVAR____SRSTServer_stateMachine);
}

id Server.__deallocating_deinit()
{
  return CallServer.__deallocating_deinit("Deinit called for Server", (uint64_t)&unk_26D227160, (void (*)(void))partial apply for closure #1 in SharedClient.deinit, (uint64_t (*)(void))type metadata accessor for Server);
}

uint64_t Server.init()()
{
  uint64_t ObjectType = swift_getObjectType();
  InstrumentationManager.sharedLogger.unsafeMutableAddressor();
  id v1 = *(uint64_t (**)(uint64_t))(ObjectType + 128);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_deallocPartialClassInstance();
  return v3;
}

char *Server.__allocating_init(instrumentationManager:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return Server.init(instrumentationManager:)(a1);
}

char *Server.init(instrumentationManager:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State>.Publisher);
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v3, v4);
  int64_t v30 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____SRSTServer_stateMachineObserver] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StateMachine<State>);
  uint64_t v6 = v1;
  uint64_t v7 = swift_retain();
  uint64_t v31 = a1;
  *(void *)&v6[OBJC_IVAR____SRSTServer_stateMachine] = StateMachine<>.init(instrumentationManager:)(v7);

  id v8 = (objc_class *)type metadata accessor for Server();
  v37.receiver = v6;
  v37.super_class = v8;
  id v9 = (char *)objc_msgSendSuper2(&v37, sel_init);
  uint64_t v34 = static Event.allCases.getter();
  uint64_t v10 = v34[2];
  if (v10)
  {
    objc_super v11 = v34 + 4;
    uint64_t v12 = darwinNotificationCenter.unsafeMutableAddressor();
    do
    {
      uint64_t v13 = *v11++;
      uint64_t v14 = v12->value;
      unint64_t v15 = eventDispatchNotificationNamePrefix.unsafeMutableAddressor();
      uint64_t countAndFlagsBits = v15->_countAndFlagsBits;
      object = v15->_object;
      swift_bridgeObjectRetain();
      unint64_t v18 = Event.name.getter(v13);
      uint64_t v20 = v19;
      uint64_t v35 = countAndFlagsBits;
      uint64_t v36 = object;
      swift_bridgeObjectRetain();
      v21._uint64_t countAndFlagsBits = v18;
      v21._object = v20;
      String.append(_:)(v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v22 = (__CFString *)MEMORY[0x223C6BB50](v35, v36);
      swift_bridgeObjectRelease();
      CFNotificationCenterAddObserver(v14, v9, (CFNotificationCallback)@objc closure #1 in Server.init(instrumentationManager:), v22, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v10;
    }
    while (v10);
  }
  swift_bridgeObjectRelease();
  unint64_t v23 = *(void (**)(uint64_t))(**(void **)&v9[OBJC_IVAR____SRSTServer_stateMachine] + 160);
  uint64_t v24 = swift_retain();
  unint64_t v25 = v30;
  v23(v24);
  swift_release();
  lazy protocol witness table accessor for type Published<CallState>.Publisher and conformance Published<A>.Publisher(&lazy protocol witness table cache variable for type Published<State>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<State>.Publisher);
  uint64_t v26 = v33;
  uint64_t v27 = Publisher<>.sink(receiveValue:)();
  swift_release();

  (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v26);
  *(void *)&v9[OBJC_IVAR____SRSTServer_stateMachineObserver] = v27;
  swift_release();
  return v9;
}

void @objc closure #1 in Server.init(instrumentationManager:)(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a1;
  id v9 = a3;
  id v10 = a5;
  specialized closure #1 in CallServer.init(instrumentationManager:)(a2, (uint64_t)a3, "Server received valid event dispatch: %s", "Server posting darwin notification for event reception", &OBJC_IVAR____SRSTServer_stateMachine, (uint64_t (*)(uint64_t, void *))Event.init(name:));
}

void closure #2 in Server.init(instrumentationManager:)(void **a1)
{
  closure #2 in CallServer.init(instrumentationManager:)(a1, &OBJC_IVAR____SRSTState_name, "Server posting darwin notification for state transition state=%s");
}

id @objc CallServer.currentState.getter(char *a1, uint64_t a2, void *a3)
{
  void (*v3)(id *__return_ptr);
  char *v4;
  id v5;
  id v7;
  uint64_t vars8;

  uint64_t v3 = *(void (**)(id *__return_ptr))(**(void **)&a1[*a3] + 136);
  uint64_t v4 = a1;
  v3(&v7);

  uint64_t v5 = v7;
  return v5;
}

uint64_t SharedServer.currentState.getter()
{
  return CallServer.currentState.getter(&OBJC_IVAR____SRSTSharedServer_stateMachine);
}

uint64_t CallServer.currentState.getter(void *a1)
{
  (*(void (**)(uint64_t *__return_ptr))(**(void **)(v1 + *a1) + 136))(&v3);
  return v3;
}

id SharedServer.__deallocating_deinit()
{
  return CallServer.__deallocating_deinit("Deinit called for SharedServer", (uint64_t)&unk_26D227188, (void (*)(void))partial apply for closure #1 in SharedClient.deinit, (uint64_t (*)(void))type metadata accessor for SharedServer);
}

id CallServer.__deallocating_deinit(const char *a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(void))
{
  id v8 = v4;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = Logger.framework.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v14, v9);
  unint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = a3;
    unint64_t v18 = a4;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_220960000, v15, v16, a1, v19, 2u);
    uint64_t v20 = v19;
    a4 = v18;
    a3 = v17;
    MEMORY[0x223C6C510](v20, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  type metadata accessor for OS_dispatch_queue();
  *(void *)(swift_allocObject() + 16) = v8;
  id v21 = v8;
  static OS_dispatch_queue.executeOnMain<A>(_:)(a3);
  uint64_t v22 = swift_release();
  unint64_t v23 = (objc_class *)a4(v22);
  v25.receiver = v21;
  v25.super_class = v23;
  return objc_msgSendSuper2(&v25, sel_dealloc);
}

uint64_t @objc CallServer.__ivar_destroyer()
{
  swift_release();
  return swift_release();
}

uint64_t SharedServer.init()()
{
  uint64_t ObjectType = swift_getObjectType();
  InstrumentationManager.sharedLogger.unsafeMutableAddressor();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(ObjectType + 128);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_deallocPartialClassInstance();
  return v3;
}

char *SharedServer.__allocating_init(instrumentationManager:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return SharedServer.init(instrumentationManager:)(a1);
}

char *SharedServer.init(instrumentationManager:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedState>.Publisher);
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v3, v4);
  int64_t v30 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____SRSTSharedServer_stateMachineObserver] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StateMachine<SharedState>);
  uint64_t v6 = v1;
  uint64_t v7 = swift_retain();
  uint64_t v31 = a1;
  *(void *)&v6[OBJC_IVAR____SRSTSharedServer_stateMachine] = StateMachine<>.init(instrumentationManager:)(v7);

  id v8 = (objc_class *)type metadata accessor for SharedServer();
  v37.receiver = v6;
  v37.super_class = v8;
  uint64_t v9 = (char *)objc_msgSendSuper2(&v37, sel_init);
  uint64_t v34 = static SharedEvent.allCases.getter();
  uint64_t v10 = v34[2];
  if (v10)
  {
    uint64_t v11 = v34 + 4;
    uint64_t v12 = darwinNotificationCenter.unsafeMutableAddressor();
    do
    {
      uint64_t v13 = *v11++;
      uint64_t v14 = v12->value;
      unint64_t v15 = eventDispatchNotificationNamePrefix.unsafeMutableAddressor();
      uint64_t countAndFlagsBits = v15->_countAndFlagsBits;
      object = v15->_object;
      swift_bridgeObjectRetain();
      unint64_t v18 = SharedEvent.name.getter(v13);
      uint64_t v20 = v19;
      uint64_t v35 = countAndFlagsBits;
      uint64_t v36 = object;
      swift_bridgeObjectRetain();
      v21._uint64_t countAndFlagsBits = v18;
      v21._object = v20;
      String.append(_:)(v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v22 = (__CFString *)MEMORY[0x223C6BB50](v35, v36);
      swift_bridgeObjectRelease();
      CFNotificationCenterAddObserver(v14, v9, (CFNotificationCallback)@objc closure #1 in SharedServer.init(instrumentationManager:), v22, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v10;
    }
    while (v10);
  }
  swift_bridgeObjectRelease();
  unint64_t v23 = *(void (**)(uint64_t))(**(void **)&v9[OBJC_IVAR____SRSTSharedServer_stateMachine] + 160);
  uint64_t v24 = swift_retain();
  objc_super v25 = v30;
  v23(v24);
  swift_release();
  lazy protocol witness table accessor for type Published<CallState>.Publisher and conformance Published<A>.Publisher(&lazy protocol witness table cache variable for type Published<SharedState>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<SharedState>.Publisher);
  uint64_t v26 = v33;
  uint64_t v27 = Publisher<>.sink(receiveValue:)();
  swift_release();

  (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v26);
  *(void *)&v9[OBJC_IVAR____SRSTSharedServer_stateMachineObserver] = v27;
  swift_release();
  return v9;
}

void @objc closure #1 in SharedServer.init(instrumentationManager:)(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a1;
  id v9 = a3;
  id v10 = a5;
  specialized closure #1 in CallServer.init(instrumentationManager:)(a2, (uint64_t)a3, "SharedServer received valid event dispatch: %s", "SharedServer posting darwin notification for event reception", &OBJC_IVAR____SRSTSharedServer_stateMachine, (uint64_t (*)(uint64_t, void *))SharedEvent.init(name:));
}

void closure #2 in SharedServer.init(instrumentationManager:)(void **a1)
{
  closure #2 in CallServer.init(instrumentationManager:)(a1, &OBJC_IVAR____SRSTSharedState_name, "SharedServer posting darwin notification for state transition state=%s");
}

void closure #2 in CallServer.init(instrumentationManager:)(void **a1, void *a2, const char *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  id v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  uint64_t v12 = Logger.framework.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v13 = v11;
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v36 = v6;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v35 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v38 = v18;
    v33[1] = v17 + 4;
    uint64_t v34 = a3;
    uint64_t v19 = (uint64_t *)&v13[*a2];
    uint64_t v20 = v13;
    uint64_t v21 = *v19;
    unint64_t v22 = v19[1];
    swift_bridgeObjectRetain();
    uint64_t v37 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v13 = v20;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220960000, v14, v15, v34, v17, 0xCu);
    uint64_t v23 = v35;
    swift_arrayDestroy();
    MEMORY[0x223C6C510](v23, -1, -1);
    MEMORY[0x223C6C510](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  uint64_t v24 = darwinNotificationCenter.unsafeMutableAddressor()->value;
  objc_super v25 = stateTransitionNotificationNamePrefix.unsafeMutableAddressor();
  uint64_t countAndFlagsBits = v25->_countAndFlagsBits;
  object = v25->_object;
  BOOL v28 = (uint64_t *)&v13[*a2];
  uint64_t v29 = *v28;
  int64_t v30 = (void *)v28[1];
  uint64_t v38 = countAndFlagsBits;
  v39 = object;
  swift_bridgeObjectRetain();
  v31._uint64_t countAndFlagsBits = v29;
  v31._object = v30;
  String.append(_:)(v31);
  uint64_t v32 = (__CFString *)MEMORY[0x223C6BB50](v38, v39);
  swift_bridgeObjectRelease();
  CFNotificationCenterPostNotification(v24, v32, 0, 0, 1u);
}

uint64_t type metadata accessor for Server()
{
  return self;
}

uint64_t type metadata accessor for SharedServer()
{
  return self;
}

uint64_t lazy protocol witness table accessor for type Published<CallState>.Publisher and conformance Published<A>.Publisher(unint64_t *a1, uint64_t *a2)
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

uint64_t method lookup function for CallServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CallServer);
}

uint64_t dispatch thunk of CallServer.currentState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CallServer.__allocating_init(instrumentationManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t method lookup function for Server(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Server);
}

uint64_t dispatch thunk of Server.currentState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of Server.__allocating_init(instrumentationManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t method lookup function for SharedServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SharedServer);
}

uint64_t dispatch thunk of SharedServer.currentState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SharedServer.__allocating_init(instrumentationManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

void specialized closure #1 in CallServer.init(instrumentationManager:)(void *a1, uint64_t a2, const char *a3, const char *a4, void *a5, uint64_t (*a6)(uint64_t, void *))
{
  v80 = a6;
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11, v13);
  uint64_t v16 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v14, v17);
  uint64_t v20 = (char *)&v70 - v19;
  MEMORY[0x270FA5388](v18, v21);
  uint64_t v23 = (char *)&v70 - v22;
  if (!a2)
  {
    uint64_t v45 = unknownNotificationName.unsafeMutableAddressor();
    uint64_t countAndFlagsBits = v45->_countAndFlagsBits;
    unint64_t object = (unint64_t)v45->_object;
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  uint64_t v76 = a3;
  unint64_t v77 = a4;
  uint64_t v24 = v11;
  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v81 = a1;
  uint64_t v86 = v25;
  v87 = v26;
  uint64_t v27 = eventDispatchNotificationNamePrefix.unsafeMutableAddressor();
  BOOL v28 = v27->_object;
  uint64_t v84 = v27->_countAndFlagsBits;
  v85 = v28;
  uint64_t v82 = 0;
  unint64_t v83 = 0xE000000000000000;
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v29 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  unint64_t v31 = v30;
  swift_bridgeObjectRelease();
  if (!v81)
  {
    swift_bridgeObjectRelease();
    uint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t object = v48;
    uint64_t v11 = v24;
LABEL_7:
    uint64_t v49 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, v49, v11);
    swift_bridgeObjectRetain();
    v50 = Logger.logObject.getter();
    os_log_type_t v51 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v79 = v12;
      uint64_t v52 = countAndFlagsBits;
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v86 = v54;
      *(_DWORD *)uint64_t v53 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v84 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v52, object, &v86);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_220960000, v50, v51, "Event dispatch darwin notification was malformed: %s", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C6C510](v54, -1, -1);
      MEMORY[0x223C6C510](v53, -1, -1);

      (*(void (**)(char *, uint64_t))(v79 + 8))(v16, v11);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
    }
    return;
  }
  uint64_t v78 = v29;
  uint64_t v75 = a5;
  uint64_t v32 = Logger.framework.unsafeMutableAddressor();
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v33(v23, v32, v24);
  swift_bridgeObjectRetain_n();
  uint64_t v34 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.info.getter();
  BOOL v36 = os_log_type_enabled(v34, v35);
  v74 = (void *)v31;
  if (v36)
  {
    uint64_t v79 = v12;
    uint64_t v37 = swift_slowAlloc();
    objc_super v72 = v33;
    uint64_t v38 = (uint8_t *)v37;
    uint64_t v39 = swift_slowAlloc();
    uint64_t v71 = v24;
    uint64_t v40 = v39;
    uint64_t v86 = v39;
    uint64_t v73 = v32;
    *(_DWORD *)uint64_t v38 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v84 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v78, v31, &v86);
    uint64_t v41 = v79;
    uint64_t v32 = v73;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_220960000, v34, v35, v76, v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C6C510](v40, -1, -1);
    v42 = v38;
    uint64_t v33 = v72;
    MEMORY[0x223C6C510](v42, -1, -1);

    uint64_t v43 = *(void (**)(char *, uint64_t))(v41 + 8);
    uint64_t v44 = v71;
    v43(v23, v71);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v43 = *(void (**)(char *, uint64_t))(v12 + 8);
    v43(v23, v24);
    uint64_t v44 = v24;
  }
  uint64_t v55 = (char *)v81;
  v33(v20, v32, v44);
  v56 = Logger.logObject.getter();
  os_log_type_t v57 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_220960000, v56, v57, v77, v58, 2u);
    MEMORY[0x223C6C510](v58, -1, -1);
  }

  v43(v20, v44);
  uint64_t v59 = darwinNotificationCenter.unsafeMutableAddressor()->value;
  id v60 = eventReceivedNotificationNamePrefix.unsafeMutableAddressor();
  uint64_t v62 = v60->_countAndFlagsBits;
  v61 = v60->_object;
  uint64_t v86 = v62;
  v87 = v61;
  swift_bridgeObjectRetain();
  uint64_t v63 = v78;
  v64._uint64_t countAndFlagsBits = v78;
  uint64_t v65 = v74;
  v64._unint64_t object = v74;
  String.append(_:)(v64);
  int64_t v66 = (__CFString *)MEMORY[0x223C6BB50](v86, v87);
  swift_bridgeObjectRelease();
  CFNotificationCenterPostNotification(v59, v66, 0, 0, 1u);

  uint64_t v67 = *(void *)&v55[*v75];
  uint64_t v68 = v80(v63, v65);
  if (v69)
  {
    __break(1u);
  }
  else
  {
    uint64_t v86 = v68;
    (*(void (**)(uint64_t *))(*(void *)v67 + 216))(&v86);
  }
}

id one-time initialization function for disabled()
{
  type metadata accessor for State();
  uint64_t v0 = (void *)*State.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = State.__allocating_init(name:parent:eventHandler:)(0x64656C6261736944, 0xE800000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.disabled, 0);
  static State.disabled = (uint64_t)result;
  return result;
}

void *implicit closure #1 in variable initialization expression of static State.disabled(uint64_t a1)
{
  if (a1 != 3) {
    return 0;
  }
  id v1 = *(void **)State.available.unsafeMutableAddressor();
  id v2 = v1;
  return v1;
}

uint64_t *State.disabled.unsafeMutableAddressor()
{
  if (one-time initialization token for disabled != -1) {
    swift_once();
  }
  return &static State.disabled;
}

id static State.disabled.getter()
{
  if (one-time initialization token for disabled != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static State.disabled;
  return v0;
}

id one-time initialization function for analyzing()
{
  type metadata accessor for State();
  uint64_t v0 = (void *)*State.listening.unsafeMutableAddressor();
  id v1 = v0;
  id result = State.__allocating_init(name:parent:eventHandler:)(0x6E697A796C616E41, 0xE900000000000067, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.analyzing, 0);
  static State.analyzing = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.analyzing(uint64_t a1)
{
  id v1 = 0;
  switch(a1)
  {
    case 5:
      id v2 = (id *)State.understanding.unsafeMutableAddressor();
      goto LABEL_5;
    case 7:
      id v2 = (id *)State.postResponse.unsafeMutableAddressor();
      goto LABEL_5;
    case 10:
    case 13:
      id v2 = (id *)State.available.unsafeMutableAddressor();
LABEL_5:
      id v1 = *v2;
      id v3 = *v2;
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t *State.analyzing.unsafeMutableAddressor()
{
  if (one-time initialization token for analyzing != -1) {
    swift_once();
  }
  return &static State.analyzing;
}

id static State.analyzing.getter()
{
  if (one-time initialization token for analyzing != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static State.analyzing;
  return v0;
}

uint64_t one-time initialization function for allStates()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220983790;
  id v1 = State.abstract.unsafeMutableAddressor();
  id v2 = (void *)*v1;
  *(void *)(inited + 32) = *v1;
  id v3 = v2;
  uint64_t v4 = State.disabled.unsafeMutableAddressor();
  uint64_t v5 = (void *)*v4;
  *(void *)(inited + 40) = *v4;
  id v6 = v5;
  uint64_t v7 = State.available.unsafeMutableAddressor();
  uint64_t v8 = (void *)*v7;
  *(void *)(inited + 48) = *v7;
  id v9 = v8;
  id v10 = State.listening.unsafeMutableAddressor();
  uint64_t v11 = (void *)*v10;
  *(void *)(inited + 56) = *v10;
  id v12 = v11;
  uint64_t v13 = State.analyzing.unsafeMutableAddressor();
  uint64_t v14 = (void *)*v13;
  *(void *)(inited + 64) = *v13;
  id v15 = v14;
  uint64_t v16 = State.understanding.unsafeMutableAddressor();
  uint64_t v17 = (void *)*v16;
  *(void *)(inited + 72) = *v16;
  id v18 = v17;
  uint64_t v19 = State.processing.unsafeMutableAddressor();
  uint64_t v20 = (void *)*v19;
  *(void *)(inited + 80) = *v19;
  id v21 = v20;
  uint64_t v22 = State.responding.unsafeMutableAddressor();
  uint64_t v23 = (void *)*v22;
  *(void *)(inited + 88) = *v22;
  id v24 = v23;
  uint64_t v25 = State.attending.unsafeMutableAddressor();
  uint64_t v26 = (void *)*v25;
  *(void *)(inited + 96) = *v25;
  id v27 = v26;
  BOOL v28 = State.postResponse.unsafeMutableAddressor();
  uint64_t v29 = (void *)*v28;
  *(void *)(inited + 104) = *v28;
  id v30 = v29;
  unint64_t v31 = State.resting.unsafeMutableAddressor();
  uint64_t v32 = (void *)*v31;
  *(void *)(inited + 112) = *v31;
  specialized Array._endMutation()();
  if (inited >> 62)
  {
    id v37 = v32;
    swift_bridgeObjectRetain();
    uint64_t v38 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v38) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v36 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  uint64_t v33 = *(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v34 = v32;
  if (!v33) {
    goto LABEL_5;
  }
LABEL_3:
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  uint64_t v36 = v35;
LABEL_6:
  uint64_t result = swift_bridgeObjectRelease();
  static State.allStates = v36;
  return result;
}

{
  unint64_t inited;
  uint64_t *v1;
  void *v2;
  id v3;
  uint64_t *v4;
  void *v5;
  id v6;
  uint64_t *v7;
  void *v8;
  id v9;
  uint64_t *v10;
  void *v11;
  id v12;
  uint64_t *v13;
  void *v14;
  id v15;
  uint64_t *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2209837A0;
  id v1 = SharedState.abstract.unsafeMutableAddressor();
  id v2 = (void *)*v1;
  *(void *)(inited + 32) = *v1;
  id v3 = v2;
  uint64_t v4 = SharedState.unshared.unsafeMutableAddressor();
  uint64_t v5 = (void *)*v4;
  *(void *)(inited + 40) = *v4;
  id v6 = v5;
  uint64_t v7 = SharedState.mirroring.unsafeMutableAddressor();
  uint64_t v8 = (void *)*v7;
  *(void *)(inited + 48) = *v7;
  id v9 = v8;
  id v10 = SharedState.passive.unsafeMutableAddressor();
  uint64_t v11 = (void *)*v10;
  *(void *)(inited + 56) = *v10;
  id v12 = v11;
  uint64_t v13 = SharedState.preparingToServe.unsafeMutableAddressor();
  uint64_t v14 = (void *)*v13;
  *(void *)(inited + 64) = *v13;
  id v15 = v14;
  uint64_t v16 = SharedState.serving.unsafeMutableAddressor();
  uint64_t v17 = (void *)*v16;
  *(void *)(inited + 72) = *v16;
  specialized Array._endMutation()();
  if (inited >> 62)
  {
    uint64_t v22 = v17;
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_3;
    }
LABEL_5:
    id v21 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  id v18 = *(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v19 = v17;
  if (!v18) {
    goto LABEL_5;
  }
LABEL_3:
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  id v21 = v20;
LABEL_6:
  uint64_t result = swift_bridgeObjectRelease();
  static SharedState.allStates = v21;
  return result;
}

{
  unint64_t inited;
  uint64_t *v1;
  void *v2;
  id v3;
  uint64_t *v4;
  void *v5;
  id v6;
  uint64_t *v7;
  void *v8;
  id v9;
  uint64_t *v10;
  void *v11;
  id v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220983D60;
  id v1 = CallState.abstract.unsafeMutableAddressor();
  id v2 = (void *)*v1;
  *(void *)(inited + 32) = *v1;
  id v3 = v2;
  uint64_t v4 = CallState.noCall.unsafeMutableAddressor();
  uint64_t v5 = (void *)*v4;
  *(void *)(inited + 40) = *v4;
  id v6 = v5;
  uint64_t v7 = CallState.ongoingCall.unsafeMutableAddressor();
  uint64_t v8 = (void *)*v7;
  *(void *)(inited + 48) = *v7;
  id v9 = v8;
  id v10 = CallState.onHoldCall.unsafeMutableAddressor();
  uint64_t v11 = (void *)*v10;
  *(void *)(inited + 56) = *v10;
  id v12 = v11;
  uint64_t v13 = CallState.micMutedCall.unsafeMutableAddressor();
  uint64_t v14 = (void *)*v13;
  *(void *)(inited + 64) = *v13;
  specialized Array._endMutation()();
  if (inited >> 62)
  {
    uint64_t v19 = v14;
    swift_bridgeObjectRetain();
    uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_3;
    }
LABEL_5:
    id v18 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  id v15 = *(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v16 = v14;
  if (!v15) {
    goto LABEL_5;
  }
LABEL_3:
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  id v18 = v17;
LABEL_6:
  uint64_t result = swift_bridgeObjectRelease();
  static CallState.allStates = v18;
  return result;
}

uint64_t *State.allStates.unsafeMutableAddressor()
{
  if (one-time initialization token for allStates != -1) {
    swift_once();
  }
  return &static State.allStates;
}

uint64_t static State.allStates.getter()
{
  if (one-time initialization token for allStates != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t StateMachine<>.init(instrumentationManager:)(uint64_t a1)
{
  if (one-time initialization token for allStates != -1) {
    swift_once();
  }
  uint64_t v3 = static State.allStates;
  swift_bridgeObjectRetain();
  id v7 = (id)*State.available.unsafeMutableAddressor();
  uint64_t v4 = *(uint64_t (**)(uint64_t, id *, uint64_t))(v1 + 208);
  id v5 = v7;
  return v4(v3, &v7, a1);
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, id *, uint64_t);
  id v5;
  id v7;

  if (one-time initialization token for allStates != -1) {
    swift_once();
  }
  uint64_t v3 = static SharedState.allStates;
  swift_bridgeObjectRetain();
  id v7 = (id)*SharedState.unshared.unsafeMutableAddressor();
  uint64_t v4 = *(uint64_t (**)(uint64_t, id *, uint64_t))(v1 + 208);
  id v5 = v7;
  return v4(v3, &v7, a1);
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, id *, uint64_t);
  id v5;
  id v7;

  if (one-time initialization token for allStates != -1) {
    swift_once();
  }
  uint64_t v3 = static CallState.allStates;
  swift_bridgeObjectRetain();
  id v7 = (id)*CallState.noCall.unsafeMutableAddressor();
  uint64_t v4 = *(uint64_t (**)(uint64_t, id *, uint64_t))(v1 + 208);
  id v5 = v7;
  return v4(v3, &v7, a1);
}

void specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<State>);
      uint64_t v3 = static _SetStorage.allocate(capacity:)();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      uint64_t v9 = MEMORY[0x223C6BDD0](v8, v1);
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v11 = v9;
      Swift::Int v12 = NSObject._rawHashValue(seed:)(*(void *)(v3 + 40));
      uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        type metadata accessor for State();
        id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          unint64_t v1 = v41;
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = static NSObject.== infix(_:_:)();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
      }
      *(void *)(v7 + 8 * v15) = v17 | v16;
      *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_38;
      }
      *(void *)(v3 + 16) = v24;
LABEL_12:
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    Swift::Int v26 = *(void *)(v3 + 40);
    id v27 = *(id *)(v1 + 32 + 8 * v25);
    Swift::Int v28 = NSObject._rawHashValue(seed:)(v26);
    uint64_t v29 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      type metadata accessor for State();
      id v34 = *(id *)(*(void *)(v3 + 48) + 8 * v30);
      char v35 = static NSObject.== infix(_:_:)();

      if (v35) {
        goto LABEL_24;
      }
      uint64_t v36 = ~v29;
      unint64_t v30 = (v30 + 1) & v36;
      unint64_t v31 = v30 >> 6;
      uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
      uint64_t v33 = 1 << v30;
      if ((v32 & (1 << v30)) != 0)
      {
        while (1)
        {
          id v37 = *(id *)(*(void *)(v3 + 48) + 8 * v30);
          char v38 = static NSObject.== infix(_:_:)();

          if (v38) {
            break;
          }
          unint64_t v30 = (v30 + 1) & v36;
          unint64_t v31 = v30 >> 6;
          uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
          uint64_t v33 = 1 << v30;
          if ((v32 & (1 << v30)) == 0) {
            goto LABEL_32;
          }
        }
LABEL_24:

        uint64_t v5 = v43;
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v5 = v43;
    }
    *(void *)(v7 + 8 * v31) = v33 | v32;
    *(void *)(*(void *)(v3 + 48) + 8 * v30) = v27;
    uint64_t v39 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_39;
    }
    *(void *)(v3 + 16) = v40;
LABEL_25:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  Swift::Int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  Swift::Int v26;
  id v27;
  Swift::Int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char v35;
  uint64_t v36;
  id v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;

  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<SharedState>);
      uint64_t v3 = static _SetStorage.allocate(capacity:)();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      uint64_t v9 = MEMORY[0x223C6BDD0](v8, v1);
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v11 = v9;
      Swift::Int v12 = NSObject._rawHashValue(seed:)(*(void *)(v3 + 40));
      uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        type metadata accessor for SharedState();
        id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          unint64_t v1 = v41;
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = static NSObject.== infix(_:_:)();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
      }
      *(void *)(v7 + 8 * v15) = v17 | v16;
      *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_38;
      }
      *(void *)(v3 + 16) = v24;
LABEL_12:
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    Swift::Int v26 = *(void *)(v3 + 40);
    id v27 = *(id *)(v1 + 32 + 8 * v25);
    Swift::Int v28 = NSObject._rawHashValue(seed:)(v26);
    uint64_t v29 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      type metadata accessor for SharedState();
      id v34 = *(id *)(*(void *)(v3 + 48) + 8 * v30);
      char v35 = static NSObject.== infix(_:_:)();

      if (v35) {
        goto LABEL_24;
      }
      uint64_t v36 = ~v29;
      unint64_t v30 = (v30 + 1) & v36;
      unint64_t v31 = v30 >> 6;
      uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
      uint64_t v33 = 1 << v30;
      if ((v32 & (1 << v30)) != 0)
      {
        while (1)
        {
          id v37 = *(id *)(*(void *)(v3 + 48) + 8 * v30);
          char v38 = static NSObject.== infix(_:_:)();

          if (v38) {
            break;
          }
          unint64_t v30 = (v30 + 1) & v36;
          unint64_t v31 = v30 >> 6;
          uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
          uint64_t v33 = 1 << v30;
          if ((v32 & (1 << v30)) == 0) {
            goto LABEL_32;
          }
        }
LABEL_24:

        uint64_t v5 = v43;
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v5 = v43;
    }
    *(void *)(v7 + 8 * v31) = v33 | v32;
    *(void *)(*(void *)(v3 + 48) + 8 * v30) = v27;
    uint64_t v39 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_39;
    }
    *(void *)(v3 + 16) = v40;
LABEL_25:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  Swift::Int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  Swift::Int v26;
  id v27;
  Swift::Int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char v35;
  uint64_t v36;
  id v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;

  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<CallState>);
      uint64_t v3 = static _SetStorage.allocate(capacity:)();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      uint64_t v9 = MEMORY[0x223C6BDD0](v8, v1);
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v11 = v9;
      Swift::Int v12 = NSObject._rawHashValue(seed:)(*(void *)(v3 + 40));
      uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        type metadata accessor for CallState();
        id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          unint64_t v1 = v41;
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = static NSObject.== infix(_:_:)();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
      }
      *(void *)(v7 + 8 * v15) = v17 | v16;
      *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_38;
      }
      *(void *)(v3 + 16) = v24;
LABEL_12:
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    Swift::Int v26 = *(void *)(v3 + 40);
    id v27 = *(id *)(v1 + 32 + 8 * v25);
    Swift::Int v28 = NSObject._rawHashValue(seed:)(v26);
    uint64_t v29 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      type metadata accessor for CallState();
      id v34 = *(id *)(*(void *)(v3 + 48) + 8 * v30);
      char v35 = static NSObject.== infix(_:_:)();

      if (v35) {
        goto LABEL_24;
      }
      uint64_t v36 = ~v29;
      unint64_t v30 = (v30 + 1) & v36;
      unint64_t v31 = v30 >> 6;
      uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
      uint64_t v33 = 1 << v30;
      if ((v32 & (1 << v30)) != 0)
      {
        while (1)
        {
          id v37 = *(id *)(*(void *)(v3 + 48) + 8 * v30);
          char v38 = static NSObject.== infix(_:_:)();

          if (v38) {
            break;
          }
          unint64_t v30 = (v30 + 1) & v36;
          unint64_t v31 = v30 >> 6;
          uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
          uint64_t v33 = 1 << v30;
          if ((v32 & (1 << v30)) == 0) {
            goto LABEL_32;
          }
        }
LABEL_24:

        uint64_t v5 = v43;
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v5 = v43;
    }
    *(void *)(v7 + 8 * v31) = v33 | v32;
    *(void *)(*(void *)(v3 + 48) + 8 * v30) = v27;
    uint64_t v39 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_39;
    }
    *(void *)(v3 + 16) = v40;
LABEL_25:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t *SharedState.allStates.unsafeMutableAddressor()
{
  if (one-time initialization token for allStates != -1) {
    swift_once();
  }
  return &static SharedState.allStates;
}

uint64_t static SharedState.allStates.getter()
{
  if (one-time initialization token for allStates != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

id one-time initialization function for serving()
{
  type metadata accessor for SharedState();
  uint64_t v0 = (void *)*SharedState.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = SharedState.__allocating_init(name:parent:eventHandler:)(0x676E6976726553, 0xE700000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static SharedState.serving, 0);
  static SharedState.serving = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static SharedState.serving(uint64_t a1)
{
  switch(a1)
  {
    case 5:
      return 1;
    case 2:
      id v1 = (id *)SharedState.passive.unsafeMutableAddressor();
      break;
    case 1:
      id v1 = (id *)SharedState.unshared.unsafeMutableAddressor();
      break;
    default:
      return 0;
  }
  id v2 = *v1;
  id v3 = *v1;
  return (uint64_t)v2;
}

uint64_t *SharedState.serving.unsafeMutableAddressor()
{
  if (one-time initialization token for serving != -1) {
    swift_once();
  }
  return &static SharedState.serving;
}

id static SharedState.serving.getter()
{
  if (one-time initialization token for serving != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static SharedState.serving;
  return v0;
}

uint64_t Client.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____SRSTClient_delegate;
  swift_beginAccess();
  return MEMORY[0x223C6C570](v1);
}

uint64_t Client.delegate.setter()
{
  return swift_unknownObjectRelease();
}

uint64_t key path getter for Client.delegate : Client@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x70))();
  *a2 = result;
  return result;
}

uint64_t key path setter for Client.delegate : Client(uint64_t a1, void **a2)
{
  id v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x78);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*Client.delegate.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SRSTClient_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C6C570](v5);
  return SharedClient.delegate.modify;
}

uint64_t property wrapper backing initializer of Client.currentState()
{
  return Published.init(initialValue:)();
}

uint64_t Client.currentState.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t Client.currentState.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t key path getter for Client.currentState : Client@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x88))();
  *a2 = result;
  return result;
}

uint64_t key path setter for Client.currentState : Client(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & **a2) + 0x90);
  id v4 = *a1;
  return v3(v2);
}

uint64_t (*Client.currentState.modify(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

uint64_t key path getter for Client.$currentState : Client(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xA0))();
}

uint64_t key path setter for Client.$currentState : Client(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State?>.Publisher);
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0xA8))(v7);
}

uint64_t Client.$currentState.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTClient__currentState, &demangling cache variable for type metadata for Published<State?>);
}

uint64_t Client.$currentState.setter(uint64_t a1)
{
  return Client.$currentState.setter(a1, &demangling cache variable for type metadata for Published<State?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTClient__currentState, &demangling cache variable for type metadata for Published<State?>);
}

uint64_t (*Client.$currentState.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State?>.Publisher);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____SRSTClient__currentState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

uint64_t property wrapper backing initializer of Client.mostRecentEvent()
{
  return Published.init(initialValue:)();
}

uint64_t key path getter for Client.mostRecentEvent : Client@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xB8))();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t key path setter for Client.mostRecentEvent : Client(uint64_t a1, void **a2)
{
  return (*(uint64_t (**)(void, void))((*MEMORY[0x263F8EED0] & **a2) + 0xC0))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t Client.mostRecentEvent.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t Client.mostRecentEvent.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*Client.mostRecentEvent.modify(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

uint64_t key path getter for Client.$mostRecentEvent : Client(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xD0))();
}

uint64_t key path setter for Client.$mostRecentEvent : Client(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Event?>.Publisher);
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0xD8))(v7);
}

uint64_t Client.$mostRecentEvent.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTClient__mostRecentEvent, &demangling cache variable for type metadata for Published<Event?>);
}

uint64_t Client.$mostRecentEvent.setter(uint64_t a1)
{
  return Client.$currentState.setter(a1, &demangling cache variable for type metadata for Published<Event?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTClient__mostRecentEvent, &demangling cache variable for type metadata for Published<Event?>);
}

uint64_t Client.$currentState.setter(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*Client.$mostRecentEvent.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Event?>.Publisher);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____SRSTClient__mostRecentEvent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Event?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

unint64_t Client.mostRecentEventName.getter()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
  if (v2) {
    return 0;
  }
  else {
    return Event.name.getter(v1);
  }
}

void Client.dispatchEvent(_:)(uint64_t a1)
{
  type metadata accessor for NotificationCenterHelper();
  uint64_t v3 = a1;
  unint64_t v2 = lazy protocol witness table accessor for type Event and conformance Event();
  static NotificationCenterHelper.dispatch<A>(_:)((uint64_t)&v3, (uint64_t)&type metadata for Event, v2);
}

id Client.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  size_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*((unsigned char *)v1 + OBJC_IVAR____SRSTClient_stopped) & 1) == 0)
  {
    uint64_t v7 = type metadata accessor for Client();
    lazy protocol witness table accessor for type Client and conformance Client(&lazy protocol witness table cache variable for type Client and conformance Client, (void (*)(uint64_t))type metadata accessor for Client);
    static Clientele.remove<A>(_:)((uint64_t)v1, v7);
    uint64_t v8 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_220960000, v9, v10, "Deinit called for Client", v11, 2u);
      MEMORY[0x223C6C510](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    type metadata accessor for OS_dispatch_queue();
    *(void *)(swift_allocObject() + 16) = v1;
    id v12 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
  uint64_t v13 = (objc_class *)type metadata accessor for Client();
  v15.receiver = v1;
  v15.super_class = v13;
  return objc_msgSendSuper2(&v15, sel_dealloc);
}

void @objc closure #1 in variable initialization expression of static Client.handleStateTransititionNotification(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a1;
  id v8 = a3;
  id v9 = a5;
  specialized closure #1 in variable initialization expression of static Client.handleStateTransititionNotification(a2, (uint64_t)a3);
}

uint64_t (**Client.handleStateTransititionNotification.unsafeMutableAddressor())()
{
  return static Client.handleStateTransititionNotification;
}

uint64_t (*static Client.handleStateTransititionNotification.getter())()
{
  return static Client.handleStateTransititionNotification[0];
}

uint64_t static Client.handleStateTransititionNotification.setter(uint64_t (*a1)())
{
  uint64_t result = swift_beginAccess();
  static Client.handleStateTransititionNotification[0] = a1;
  return result;
}

uint64_t (*static Client.handleStateTransititionNotification.modify())()
{
  return static SharedClient.handleStateTransititionNotification.modify;
}

void @objc closure #1 in variable initialization expression of static Client.handleEventNotification(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a1;
  id v8 = a3;
  id v9 = a5;
  specialized closure #1 in variable initialization expression of static Client.handleEventNotification(a2, (uint64_t)a3);
}

uint64_t type metadata accessor for Client()
{
  uint64_t result = type metadata singleton initialization cache for Client;
  if (!type metadata singleton initialization cache for Client) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_220972580()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t (**Client.handleEventNotification.unsafeMutableAddressor())()
{
  return &static Client.handleEventNotification;
}

uint64_t (*static Client.handleEventNotification.getter())()
{
  return static Client.handleEventNotification;
}

uint64_t static Client.handleEventNotification.setter(uint64_t (*a1)())
{
  uint64_t result = swift_beginAccess();
  static Client.handleEventNotification = a1;
  return result;
}

uint64_t (*static Client.handleEventNotification.modify())()
{
  return static SharedClient.handleEventNotification.modify;
}

id Client.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void Client.init()()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  v61 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Event?>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  id v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State?>);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  unint64_t v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  objc_super v15 = &v0[OBJC_IVAR____SRSTClient__currentState];
  uint64_t v73 = 0;
  uint64_t v16 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for State?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v14, v10);
  uint64_t v17 = &v16[OBJC_IVAR____SRSTClient__mostRecentEvent];
  uint64_t v73 = 0;
  LOBYTE(v74) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Event?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v17, v9, v5);
  v16[OBJC_IVAR____SRSTClient_stopped] = 0;

  id v18 = (objc_class *)type metadata accessor for Client();
  v72.receiver = v16;
  v72.super_class = v18;
  id v19 = objc_msgSendSuper2(&v72, sel_init);
  lazy protocol witness table accessor for type Client and conformance Client(&lazy protocol witness table cache variable for type Client and conformance Client, (void (*)(uint64_t))type metadata accessor for Client);
  id v20 = v19;
  id v21 = (const void *)static Clientele.add<A>(_:)((uint64_t)v20, (uint64_t)v18);
  uint64_t v22 = *State.allStates.unsafeMutableAddressor();
  uint64_t v63 = v1;
  uint64_t v62 = v2;
  id v60 = v20;
  if ((v22 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for State();
    lazy protocol witness table accessor for type Client and conformance Client(&lazy protocol witness table cache variable for type State and conformance NSObject, (void (*)(uint64_t))type metadata accessor for State);
    Set.Iterator.init(_cocoa:)();
    uint64_t v22 = v73;
    uint64_t v67 = v74;
    uint64_t v23 = v75;
    uint64_t v24 = v76;
    unint64_t v25 = v77;
  }
  else
  {
    uint64_t v26 = -1 << *(unsigned char *)(v22 + 32);
    uint64_t v27 = *(void *)(v22 + 56);
    uint64_t v67 = (void *)(v22 + 56);
    uint64_t v23 = ~v26;
    uint64_t v28 = -v26;
    if (v28 < 64) {
      uint64_t v29 = ~(-1 << v28);
    }
    else {
      uint64_t v29 = -1;
    }
    unint64_t v25 = v29 & v27;
    swift_bridgeObjectRetain();
    uint64_t v24 = 0;
  }
  uint64_t v65 = v22 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v59 = v23;
  int64_t v66 = (unint64_t)(v23 + 64) >> 6;
  uint64_t v64 = MEMORY[0x263F8EE50] + 8;
  if (v22 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v25)
    {
      uint64_t v30 = (v25 - 1) & v25;
      unint64_t v31 = __clz(__rbit64(v25)) | (v24 << 6);
      uint64_t v32 = v24;
      goto LABEL_27;
    }
    int64_t v35 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      return;
    }
    if (v35 >= v66) {
      goto LABEL_30;
    }
    unint64_t v36 = v67[v35];
    uint64_t v32 = v24 + 1;
    if (!v36)
    {
      uint64_t v32 = v24 + 2;
      if (v24 + 2 >= v66) {
        goto LABEL_30;
      }
      unint64_t v36 = v67[v32];
      if (!v36)
      {
        uint64_t v32 = v24 + 3;
        if (v24 + 3 >= v66) {
          goto LABEL_30;
        }
        unint64_t v36 = v67[v32];
        if (!v36)
        {
          uint64_t v32 = v24 + 4;
          if (v24 + 4 >= v66) {
            goto LABEL_30;
          }
          unint64_t v36 = v67[v32];
          if (!v36) {
            break;
          }
        }
      }
    }
LABEL_26:
    uint64_t v30 = (v36 - 1) & v36;
    unint64_t v31 = __clz(__rbit64(v36)) + (v32 << 6);
LABEL_27:
    id v34 = *(id *)(*(void *)(v22 + 48) + 8 * v31);
    if (!v34) {
      goto LABEL_30;
    }
    while (1)
    {
      CFNotificationCenterRef value = darwinNotificationCenter.unsafeMutableAddressor()->value;
      swift_beginAccess();
      uint64_t v39 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static Client.handleStateTransititionNotification[0];
      type metadata accessor for NotificationCenterHelper();
      char v69 = (ValueMetadata *)type metadata accessor for State();
      uint64_t v70 = lazy protocol witness table accessor for type Client and conformance Client(&lazy protocol witness table cache variable for type State and conformance State, (void (*)(uint64_t))type metadata accessor for State);
      v68[0] = v34;
      uint64_t v40 = value;
      id v41 = v34;
      uint64_t v42 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v40, v21, v39, v42, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      uint64_t v24 = v32;
      unint64_t v25 = v30;
      if ((v22 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      uint64_t v33 = __CocoaSet.Iterator.next()();
      if (v33)
      {
        uint64_t v71 = v33;
        type metadata accessor for State();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v34 = (id)v68[0];
        swift_unknownObjectRelease();
        uint64_t v32 = v24;
        uint64_t v30 = v25;
        if (v34) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  uint64_t v37 = v24 + 5;
  while (v66 != v37)
  {
    unint64_t v36 = v67[v37++];
    if (v36)
    {
      uint64_t v32 = v37 - 1;
      goto LABEL_26;
    }
  }
LABEL_30:
  outlined consume of Set<SharedState>.Iterator._Variant();
  uint64_t v67 = static Event.allCases.getter();
  uint64_t v43 = v67[2];
  if (v43)
  {
    type metadata accessor for NotificationCenterHelper();
    uint64_t v44 = v67 + 4;
    uint64_t v45 = darwinNotificationCenter.unsafeMutableAddressor();
    swift_beginAccess();
    unint64_t v46 = lazy protocol witness table accessor for type Event and conformance Event();
    do
    {
      uint64_t v47 = *v44++;
      CFNotificationCenterRef v48 = v45->value;
      uint64_t v49 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static Client.handleEventNotification;
      char v69 = &type metadata for Event;
      uint64_t v70 = v46;
      v68[0] = v47;
      v50 = v48;
      os_log_type_t v51 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v50, v21, v49, v51, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v43;
    }
    while (v43);
  }
  swift_bridgeObjectRelease();
  uint64_t v52 = Logger.framework.unsafeMutableAddressor();
  uint64_t v53 = v62;
  uint64_t v54 = v61;
  uint64_t v55 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v52, v63);
  v56 = Logger.logObject.getter();
  os_log_type_t v57 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_220960000, v56, v57, "Client added Darwin observers", v58, 2u);
    MEMORY[0x223C6C510](v58, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v55);
}

Swift::Void __swiftcall Client.stopClient()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____SRSTClient_stopped;
  if ((v1[OBJC_IVAR____SRSTClient_stopped] & 1) == 0)
  {
    uint64_t v8 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_220960000, v9, v10, "#SiriStates stopping client", v11, 2u);
      MEMORY[0x223C6C510](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v1[v7] = 1;
    uint64_t v12 = type metadata accessor for Client();
    lazy protocol witness table accessor for type Client and conformance Client(&lazy protocol witness table cache variable for type Client and conformance Client, (void (*)(uint64_t))type metadata accessor for Client);
    static Clientele.remove<A>(_:)((uint64_t)v1, v12);
    type metadata accessor for OS_dispatch_queue();
    *(void *)(swift_allocObject() + 16) = v1;
    uint64_t v13 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
}

uint64_t protocol witness for ClientProtocol.delegate.getter in conformance Client@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x70))();
  *a1 = result;
  return result;
}

uint64_t protocol witness for ClientProtocol.delegate.setter in conformance Client(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x78))(*a1);
}

uint64_t (*protocol witness for ClientProtocol.delegate.modify in conformance Client(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x80))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

uint64_t protocol witness for ClientProtocol.currentState.getter in conformance Client@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x88))();
  *a1 = result;
  return result;
}

uint64_t protocol witness for ClientProtocol.currentState.setter in conformance Client(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x90))(*a1);
}

uint64_t (*protocol witness for ClientProtocol.currentState.modify in conformance Client(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x98))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

uint64_t protocol witness for ClientProtocol.mostRecentEvent.getter in conformance Client@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xB8))();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return result;
}

uint64_t protocol witness for ClientProtocol.mostRecentEvent.setter in conformance Client(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))((*MEMORY[0x263F8EED0] & *v1) + 0xC0))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t (*protocol witness for ClientProtocol.mostRecentEvent.modify in conformance Client(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xC8))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

uint64_t protocol witness for ClientProtocol.dispatchEvent(_:) in conformance Client(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x108))(*a1);
}

uint64_t lazy protocol witness table accessor for type Client and conformance Client(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t associated type witness table accessor for ClientProtocol.StateType : StateProtocol in Client()
{
  return lazy protocol witness table accessor for type Client and conformance Client(&lazy protocol witness table cache variable for type State and conformance State, (void (*)(uint64_t))type metadata accessor for State);
}

uint64_t ObjC metadata update function for Client()
{
  return type metadata accessor for Client();
}

void type metadata completion function for Client()
{
  type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<State?>, &demangling cache variable for type metadata for State?);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<Event?>, &demangling cache variable for type metadata for Event?);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for Client(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Client);
}

uint64_t dispatch thunk of Client.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of Client.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of Client.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of Client.currentState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of Client.currentState.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of Client.currentState.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of Client.$currentState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of Client.$currentState.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of Client.$currentState.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of Client.mostRecentEvent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of Client.mostRecentEvent.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x263F8EED0] & *v2) + 0xC0))(a1, a2 & 1);
}

uint64_t dispatch thunk of Client.mostRecentEvent.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of Client.$mostRecentEvent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of Client.$mostRecentEvent.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of Client.$mostRecentEvent.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of Client.mostRecentEventName.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of Client.dispatchEvent(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of Client.stopClient()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

void specialized closure #1 in variable initialization expression of static Client.handleStateTransititionNotification(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  id v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v46 - v11;
  type metadata accessor for NotificationCenterHelper();
  uint64_t v13 = (char *)type metadata accessor for State();
  uint64_t v14 = lazy protocol witness table accessor for type Client and conformance Client(&lazy protocol witness table cache variable for type State and conformance State, (void (*)(uint64_t))type metadata accessor for State);
  static NotificationCenterHelper.state<A>(from:)(a2, v13, v14, (uint64_t)&v55);
  objc_super v15 = v55;
  if (v55)
  {
    uint64_t v16 = Logger.framework.unsafeMutableAddressor();
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v51 = v16;
    uint64_t v52 = v5 + 16;
    v50 = v17;
    ((void (*)(char *))v17)(v12);
    id v18 = v15;
    id v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.info.getter();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v53 = v15;
    if (v21)
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v48 = v5;
      uint64_t v24 = v23;
      uint64_t v55 = (void *)v23;
      uint64_t v47 = v9;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v49 = v4;
      unint64_t v46 = v22 + 4;
      unint64_t v25 = (char *)v18 + OBJC_IVAR____SRSTState_name;
      uint64_t v26 = a1;
      uint64_t v27 = v18;
      uint64_t v29 = *(uint64_t *)((char *)&v18->isa + OBJC_IVAR____SRSTState_name);
      unint64_t v28 = *((void *)v25 + 1);
      swift_bridgeObjectRetain();
      uint64_t v30 = v29;
      id v18 = v27;
      a1 = v26;
      uint64_t v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v28, (uint64_t *)&v55);
      uint64_t v4 = v49;
      id v9 = v47;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_220960000, v19, v20, "Client received valid state transition: %s", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v31 = v24;
      uint64_t v5 = v48;
      MEMORY[0x223C6C510](v31, -1, -1);
      MEMORY[0x223C6C510](v22, -1, -1);
    }
    else
    {
    }
    uint64_t v32 = *(void (**)(char *, uint64_t))(v5 + 8);
    v32(v12, v4);
    uint64_t v33 = type metadata accessor for Client();
    uint64_t v34 = lazy protocol witness table accessor for type Client and conformance Client(&lazy protocol witness table cache variable for type Client and conformance Client, (void (*)(uint64_t))type metadata accessor for Client);
    int64_t v35 = (void *)static Clientele.contains<A>(_:)(a1, v33, v34);
    if (v35)
    {
      unint64_t v36 = v35;
      uint64_t v37 = (void *)MEMORY[0x263F8EED0];
      char v38 = *(uint64_t (**)(void *))((*MEMORY[0x263F8EED0] & *v35) + 0x90);
      uint64_t v39 = v18;
      uint64_t v40 = v38(v53);
      id v41 = (void *)(*(uint64_t (**)(uint64_t))((*v37 & *v36) + 0x70))(v40);
      if (v41)
      {
        objc_msgSend(v41, sel_stateMachineWithClient_didTransitionToState_, v36, v39);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    else
    {
      v50(v9, v51, v4);
      uint64_t v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl(&dword_220960000, v42, v43, "Observer for darwin callback handler not found", v44, 2u);
        MEMORY[0x223C6C510](v44, -1, -1);
        uint64_t v45 = v42;
      }
      else
      {
        uint64_t v45 = v18;
        id v18 = v42;
      }

      v32(v9, v4);
    }
  }
}

void specialized closure #1 in variable initialization expression of static Client.handleEventNotification(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  id v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v40 - v11;
  type metadata accessor for NotificationCenterHelper();
  unint64_t v13 = lazy protocol witness table accessor for type Event and conformance Event();
  static NotificationCenterHelper.event<A>(from:)(a2, (char *)&type metadata for Event, v13, (uint64_t)&v48);
  if ((v49 & 1) == 0)
  {
    uint64_t v46 = a1;
    uint64_t v14 = v48;
    uint64_t v15 = Logger.framework.unsafeMutableAddressor();
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v44(v12, v15, v4);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.info.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v45 = v14;
    if (v18)
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v43 = v5;
      os_log_type_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v41 = v15;
      uint64_t v22 = v21;
      uint64_t v48 = v21;
      uint64_t v42 = v9;
      *(_DWORD *)os_log_type_t v20 = 136315138;
      unint64_t v23 = Event.name.getter(v14);
      uint64_t v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, &v48);
      id v9 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_220960000, v16, v17, "Client received valid event reception: %s", v20, 0xCu);
      swift_arrayDestroy();
      uint64_t v25 = v22;
      uint64_t v15 = v41;
      MEMORY[0x223C6C510](v25, -1, -1);
      uint64_t v26 = v20;
      uint64_t v5 = v43;
      MEMORY[0x223C6C510](v26, -1, -1);
    }

    uint64_t v27 = *(void (**)(char *, uint64_t))(v5 + 8);
    v27(v12, v4);
    uint64_t v28 = type metadata accessor for Client();
    uint64_t v29 = lazy protocol witness table accessor for type Client and conformance Client(&lazy protocol witness table cache variable for type Client and conformance Client, (void (*)(uint64_t))type metadata accessor for Client);
    uint64_t v30 = (void *)static Clientele.contains<A>(_:)(v46, v28, v29);
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = (void *)MEMORY[0x263F8EED0];
      uint64_t v33 = v45;
      uint64_t v34 = (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x263F8EED0] & *v30) + 0xC0))(v45, 0);
      int64_t v35 = (void *)(*(uint64_t (**)(uint64_t))((*v32 & *v31) + 0x70))(v34);
      if (v35)
      {
        unint64_t v36 = v35;
        if (objc_msgSend(v35, sel_respondsToSelector_, sel_stateMachineWithClient_didReceiveEvent_)) {
          objc_msgSend(v36, sel_stateMachineWithClient_didReceiveEvent_, v31, v33);
        }
        swift_unknownObjectRelease();
      }
    }
    else
    {
      v44(v9, v15, v4);
      uint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl(&dword_220960000, v37, v38, "Observer for darwin callback handler not found", v39, 2u);
        MEMORY[0x223C6C510](v39, -1, -1);
      }

      v27(v9, v4);
    }
  }
}

uint64_t dispatch thunk of StateProtocol.parent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of StateProtocol.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of StateProtocol.handle(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of StateProtocol.makeProxy()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of static StateProtocol.named(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of static StateProtocol.allStates.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of ProxyProtocol.state.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t type metadata instantiation function for EventHandlerResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata completion function for EventHandlerResult()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for EventHandlerResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  unint64_t v9 = v8;
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v11 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v11 > 0xFFFE)
      {
        uint64_t v10 = 4;
      }
      else
      {
        BOOL v12 = v11 != 0;
        BOOL v13 = v11 >= 0xFF;
        uint64_t v10 = 2;
        if (!v13) {
          uint64_t v10 = v12;
        }
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    unint64_t v9 = v10 + v8;
  }
  uint64_t v14 = *(_DWORD *)(v6 + 80);
  if (v14 <= 7 && v9 <= 0x18 && (*(_DWORD *)(v6 + 80) & 0x100000) == 0)
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
    {
      if (v7 <= 1)
      {
        if (v8 <= 3)
        {
          unsigned int v19 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
          if (v19 > 0xFFFE)
          {
            uint64_t v18 = 4;
          }
          else
          {
            BOOL v20 = v19 != 0;
            BOOL v13 = v19 >= 0xFF;
            uint64_t v18 = 2;
            if (!v13) {
              uint64_t v18 = v20;
            }
          }
        }
        else
        {
          uint64_t v18 = 1;
        }
        v8 += v18;
      }
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
    }
  }
  else
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  return a1;
}

uint64_t destroy for EventHandlerResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 2, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *initializeWithCopy for EventHandlerResult(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        unsigned int v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          uint64_t v9 = 4;
        }
        else
        {
          BOOL v11 = v10 != 0;
          BOOL v12 = v10 >= 0xFF;
          uint64_t v9 = 2;
          if (!v12) {
            uint64_t v9 = v11;
          }
        }
      }
      else
      {
        uint64_t v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *assignWithCopy for EventHandlerResult(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 2, v5);
  int v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      unsigned int v10 = *(_DWORD *)(v6 + 84);
      size_t v11 = *(void *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          uint64_t v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        unsigned int v15 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v15 > 0xFFFE)
        {
          uint64_t v12 = 4;
        }
        else
        {
          BOOL v16 = v15 != 0;
          BOOL v17 = v15 >= 0xFF;
          uint64_t v12 = 2;
          if (!v17) {
            uint64_t v12 = v16;
          }
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = *(void (**)(void *, uint64_t))(v6 + 8);
      uint64_t v13 = v6 + 8;
      v14(a1, v5);
      unsigned int v10 = *(_DWORD *)(v13 + 76);
      size_t v11 = *(void *)(v13 + 56);
      if (v10 <= 1)
      {
        if (v11 > 3) {
          goto LABEL_5;
        }
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
  }
  return a1;
}

void *initializeWithTake for EventHandlerResult(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        unsigned int v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          uint64_t v9 = 4;
        }
        else
        {
          BOOL v11 = v10 != 0;
          BOOL v12 = v10 >= 0xFF;
          uint64_t v9 = 2;
          if (!v12) {
            uint64_t v9 = v11;
          }
        }
      }
      else
      {
        uint64_t v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *assignWithTake for EventHandlerResult(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 2, v5);
  int v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      unsigned int v10 = *(_DWORD *)(v6 + 84);
      size_t v11 = *(void *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          uint64_t v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        unsigned int v15 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v15 > 0xFFFE)
        {
          uint64_t v12 = 4;
        }
        else
        {
          BOOL v16 = v15 != 0;
          BOOL v17 = v15 >= 0xFF;
          uint64_t v12 = 2;
          if (!v17) {
            uint64_t v12 = v16;
          }
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = *(void (**)(void *, uint64_t))(v6 + 8);
      uint64_t v13 = v6 + 8;
      v14(a1, v5);
      unsigned int v10 = *(_DWORD *)(v13 + 76);
      size_t v11 = *(void *)(v13 + 56);
      if (v10 <= 1)
      {
        if (v11 > 3) {
          goto LABEL_5;
        }
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for EventHandlerResult(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 2;
  uint64_t v7 = *(void *)(v4 + 64);
  if (v5 <= 1)
  {
    unsigned int v6 = 0;
    if (v7 <= 3)
    {
      unsigned int v9 = (~(-1 << (8 * v7)) - v5 + 2) >> (8 * v7);
      if (v9 > 0xFFFE)
      {
        uint64_t v8 = 4;
      }
      else
      {
        BOOL v10 = v9 != 0;
        BOOL v11 = v9 >= 0xFF;
        uint64_t v8 = 2;
        if (!v11) {
          uint64_t v8 = v10;
        }
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
    v7 += v8;
  }
  if (!a2) {
    return 0;
  }
  int v12 = a2 - v6;
  if (a2 <= v6) {
    goto LABEL_30;
  }
  char v13 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v15 = ((v12 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      int v14 = *(_DWORD *)((char *)a1 + v7);
      if (!v14) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v15 > 0xFF)
    {
      int v14 = *(unsigned __int16 *)((char *)a1 + v7);
      if (!*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v15 < 2)
    {
LABEL_30:
      if (v6)
      {
        unsigned int v19 = (*(uint64_t (**)(void))(v4 + 48))();
        if (v19 >= 3) {
          return v19 - 2;
        }
        else {
          return 0;
        }
      }
      return 0;
    }
  }
  int v14 = *((unsigned __int8 *)a1 + v7);
  if (!*((unsigned char *)a1 + v7)) {
    goto LABEL_30;
  }
LABEL_20:
  int v16 = (v14 - 1) << v13;
  if (v7 > 3) {
    int v16 = 0;
  }
  if (v7)
  {
    if (v7 <= 3) {
      int v17 = v7;
    }
    else {
      int v17 = 4;
    }
    switch(v17)
    {
      case 2:
        int v18 = *a1;
        break;
      case 3:
        int v18 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v18 = *(_DWORD *)a1;
        break;
      default:
        int v18 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v18 = 0;
  }
  return v6 + (v18 | v16) + 1;
}

void storeEnumTagSinglePayload for EventHandlerResult(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  unsigned int v8 = v7 - 2;
  size_t v9 = *(void *)(v6 + 64);
  if (v7 <= 1)
  {
    unsigned int v8 = 0;
    if (v9 <= 3)
    {
      unsigned int v11 = (~(-1 << (8 * v9)) - v7 + 2) >> (8 * v9);
      if (v11 > 0xFFFE)
      {
        uint64_t v10 = 4;
      }
      else
      {
        BOOL v12 = v11 != 0;
        BOOL v13 = v11 >= 0xFF;
        uint64_t v10 = 2;
        if (!v13) {
          uint64_t v10 = v12;
        }
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    v9 += v10;
  }
  BOOL v13 = a3 >= v8;
  unsigned int v14 = a3 - v8;
  if (v14 != 0 && v13)
  {
    if (v9 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v16 = ~v8 + a2;
    if (v9 < 4)
    {
      int v17 = (v16 >> (8 * v9)) + 1;
      if (v9)
      {
        int v19 = v16 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if (v9 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v9 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v9] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v9] = v17;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v9] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 2:
      *(_WORD *)&a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x2209751C4);
    case 4:
      *(_DWORD *)&a1[v9] = 0;
      goto LABEL_29;
    default:
LABEL_29:
      if (a2)
      {
LABEL_30:
        BOOL v20 = *(void (**)(void))(v6 + 56);
        v20();
      }
      return;
  }
}

uint64_t getEnumTag for EventHandlerResult(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 48))(a1, 2);
}

uint64_t destructiveInjectEnumTag for EventHandlerResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 56))(a1, a2, 2);
}

uint64_t type metadata accessor for EventHandlerResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t StateMachine.states.getter()
{
  return swift_bridgeObjectRetain();
}

id variable initialization expression of StateMachine.backingStateMachine()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F385D8]);
  return objc_msgSend(v0, sel_init);
}

uint64_t property wrapper backing initializer of StateMachine.currentState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  Published.init(wrappedValue:)((uint64_t)v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t Published.init(wrappedValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  Published.init(initialValue:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t key path getter for StateMachine.currentState : <A>StateMachine<A>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 136))();
}

uint64_t key path setter for StateMachine.currentState : <A>StateMachine<A>(uint64_t a1, uint64_t a2)
{
  MEMORY[0x270FA5388](a1, a1);
  uint64_t v4 = (char *)&v7 - v3;
  (*(void (**)(char *))(v5 + 16))((char *)&v7 - v3);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 144))(v4);
}

void StateMachine.currentState.didset(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v8 = (char *)&v15 - v7;
  size_t v9 = (void *)v2[3];
  (*(void (**)(uint64_t))(v3 + 136))(v6);
  uint64_t v10 = (void *)((char *)v2 + *(void *)(*v2 + 120));
  swift_beginAccess();
  uint64_t v11 = *v10;
  unint64_t v12 = type metadata accessor for CUState();
  uint64_t v13 = *(void *)(*(void *)(v3 + 88) + 8);
  swift_bridgeObjectRetain();
  MEMORY[0x223C6BB30](&v15, v8, v11, v4, v12, v13);
  swift_bridgeObjectRelease();
  unsigned int v14 = v15;
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    objc_msgSend(v9, sel_transitionToState_, v14);
  }
  else
  {
    __break(1u);
  }
}

uint64_t StateMachine.currentState.getter()
{
  return swift_release();
}

uint64_t sub_220975840()
{
  return 16;
}

__n128 sub_22097584C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t StateMachine.currentState.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  specialized StateMachine.currentState.setter(a1, a2);
  uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v4 + 80) - 8) + 8);
  return v5(a1);
}

void (*StateMachine.currentState.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  StateMachine.currentState.getter();
  return StateMachine.currentState.modify;
}

void StateMachine.currentState.modify(uint64_t a1, char a2)
{
}

uint64_t key path getter for StateMachine.$currentState : <A>StateMachine<A>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 160))();
}

uint64_t key path setter for StateMachine.$currentState : <A>StateMachine<A>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Published.Publisher();
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)&v10 - v6;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v10 - v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 168))(v7);
}

uint64_t StateMachine.$currentState.getter()
{
  return swift_endAccess();
}

uint64_t StateMachine.$currentState.setter(uint64_t a1)
{
  specialized StateMachine.$currentState.setter(a1);
  uint64_t v2 = type metadata accessor for Published.Publisher();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

void (*StateMachine.$currentState.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = type metadata accessor for Published.Publisher();
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  StateMachine.$currentState.getter();
  return StateMachine.$currentState.modify;
}

void StateMachine.$currentState.modify(uint64_t a1, char a2)
{
}

void StateMachine.currentState.modify(uint64_t a1, char a2, void (*a3)(void *))
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)(*(void *)a1 + 24);
  size_t v6 = *(void **)(*(void *)a1 + 32);
  uint64_t v7 = *(void *)(*(void *)a1 + 8);
  uint64_t v8 = *(void *)(*(void *)a1 + 16);
  if (a2)
  {
    (*(void (**)(void, void *, uint64_t))(v8 + 16))(*(void *)(*(void *)a1 + 24), v6, v7);
    a3(v5);
    size_t v9 = *(void (**)(void *, uint64_t))(v8 + 8);
    v9(v5, v7);
    v9(v6, v7);
  }
  else
  {
    a3(*(void **)(*(void *)a1 + 32));
    (*(void (**)(void *, uint64_t))(v8 + 8))(v6, v7);
  }
  free(v6);
  free(v5);
  free(v4);
}

uint64_t variable initialization expression of StateMachine.stateMapping()
{
  type metadata accessor for CUState();
  return Dictionary.init()();
}

uint64_t *StateMachine.__allocating_init(states:initialState:instrumentationManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  swift_allocObject();
  uint64_t v8 = specialized StateMachine.init(states:initialState:instrumentationManager:)(a1, a2, a3);
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v4 + 80) - 8) + 8))(a2);
  return v8;
}

uint64_t *StateMachine.init(states:initialState:instrumentationManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *v3;
  size_t v6 = specialized StateMachine.init(states:initialState:instrumentationManager:)(a1, a2, a3);
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v5 + 80) - 8) + 8))(a2);
  return v6;
}

id *StateMachine.deinit()
{
  objc_msgSend(v0[3], sel_invalidate);
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0 + *((void *)*v0 + 14);
  uint64_t v2 = type metadata accessor for Published();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t StateMachine.__deallocating_deinit()
{
  StateMachine.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

void StateMachine.dispatchEvent(_:)()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24);
  uint64_t v4 = swift_checkMetadataState();
  uint64_t v5 = v3(v4, AssociatedConformanceWitness);
  uint64_t v7 = v6;
  id v8 = objc_allocWithZone(MEMORY[0x263F385D0]);
  size_t v9 = (void *)MEMORY[0x223C6BB50](v5, v7);
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithName_userInfo_, v9, 0);

  objc_msgSend(v1, sel_dispatchEvent_, v10);
}

uint64_t StateMachine.constructStateMapping()()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v77 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = v77;
  uint64_t v3 = type metadata accessor for Optional();
  uint64_t v73 = *(void (***)(char *, uint64_t))(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3, v4);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v5, v8);
  uint64_t v11 = (char *)&v51 - v10;
  uint64_t v12 = *(void *)(v2 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v9, v14);
  uint64_t v64 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15, v16);
  uint64_t v76 = (char *)&v51 - v17;
  uint64_t v18 = v0 + *(void *)(v1 + 120);
  swift_beginAccess();
  unint64_t v19 = type metadata accessor for CUState();
  uint64_t v75 = v0;
  uint64_t v20 = *(void *)(v1 + 88);
  uint64_t v21 = *(void *)(v20 + 8);
  uint64_t v22 = swift_bridgeObjectRetain();
  uint64_t v65 = v21;
  uint64_t v23 = MEMORY[0x223C6BB00](v22, v77, v19, v21);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v23)
  {
    uint64_t v71 = v13;
    uint64_t v25 = v73;
    uint64_t v63 = v20;
    uint64_t v62 = v18;
    uint64_t v26 = *(void *)(v75 + 16);
    uint64_t v81 = v26;
    swift_bridgeObjectRetain_n();
    uint64_t v27 = v77;
    uint64_t v28 = Set.count.getter();
    swift_bridgeObjectRelease();
    if (v28 < 1)
    {
      return swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v59 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
      uint64_t v72 = v12 + 32;
      uint64_t v58 = v63 + 48;
      uint64_t v73 = v25 + 1;
      uint64_t v57 = v63 + 56;
      uint64_t v56 = v12 + 16;
      uint64_t v55 = v71 + 7;
      uint64_t v54 = v80;
      uint64_t v53 = v12 + 8;
      uint64_t v71 = type metadata accessor for Set();
      uint64_t v70 = 0;
      uint64_t v29 = v76;
      uint64_t v61 = v3;
      id v60 = v7;
      unint64_t v74 = v19;
      uint64_t v52 = v11;
      while (1)
      {
        aBlock[0] = v26;
        swift_bridgeObjectRetain();
        swift_getWitnessTable();
        uint64_t v30 = v70;
        Sequence.first(where:)();
        swift_bridgeObjectRelease();
        if ((*v59)(v11, 1, v27) == 1) {
          break;
        }
        uint64_t v67 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
        v67(v29, v11, v27);
        uint64_t v31 = v63;
        (*(void (**)(uint64_t, uint64_t))(v63 + 48))(v27, v63);
        _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #2 in StateMachine.constructStateMapping(), v75, MEMORY[0x263F8E628], v19, v32, (uint64_t)aBlock);
        uint64_t v70 = v30;
        char v69 = *v73;
        v69(v7, v3);
        uint64_t v33 = (void *)aBlock[0];
        uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 56))(v27, v31);
        uint64_t v36 = v35;
        id v37 = objc_allocWithZone(MEMORY[0x263F385C8]);
        id v38 = v33;
        id v68 = v38;
        uint64_t v39 = (void *)MEMORY[0x223C6BB50](v34, v36);
        swift_bridgeObjectRelease();
        id v66 = objc_msgSend(v37, sel_initWithName_parent_, v39, v38);

        uint64_t v40 = swift_allocObject();
        swift_weakInit();
        uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
        uint64_t v42 = v64;
        v41(v64, v76, v77);
        unint64_t v43 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
        unint64_t v44 = (v55 + v43) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v45 = swift_allocObject();
        *(void *)(v45 + 16) = v77;
        *(void *)(v45 + 24) = v31;
        uint64_t v11 = v52;
        v67((char *)(v45 + v43), v42, v77);
        *(void *)(v45 + v44) = v40;
        v80[2] = partial apply for closure #3 in StateMachine.constructStateMapping();
        v80[3] = v45;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        v80[0] = thunk for @escaping @callee_guaranteed (@guaranteed CUStateEvent) -> (@unowned CUStateResult);
        v80[1] = &block_descriptor;
        uint64_t v46 = _Block_copy(aBlock);
        swift_release();
        id v47 = v66;
        objc_msgSend(v66, sel_setEventHandler_, v46);
        _Block_release(v46);
        v41(v42, v76, v77);
        uint64_t v7 = v60;
        id v78 = v47;
        swift_beginAccess();
        type metadata accessor for Dictionary();
        id v48 = v47;
        uint64_t v29 = v76;
        uint64_t v27 = v77;
        Dictionary.subscript.setter();
        swift_endAccess();
        Set.remove(_:)();

        uint64_t v3 = v61;
        v69(v7, v61);
        (*(void (**)(char *, uint64_t))(v12 + 8))(v29, v27);
        uint64_t v26 = v81;
        swift_bridgeObjectRetain();
        uint64_t v49 = Set.count.getter();
        swift_bridgeObjectRelease();
        BOOL v50 = v49 <= 0;
        unint64_t v19 = v74;
        if (v50) {
          return swift_bridgeObjectRelease();
        }
      }
      (*v73)(v11, v3);
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  return result;
}

uint64_t closure #1 in StateMachine.constructStateMapping()(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v34 = (char *)&v29 - v7;
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v33 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v13);
  uint64_t v15 = (char *)&v29 - v14;
  uint64_t v16 = *(void *)(v4 + 88);
  uint64_t v31 = *(void (**)(uint64_t))(v16 + 48);
  uint64_t v32 = v16;
  v31(v5);
  uint64_t v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
  int v17 = v30(v15, 1, v5);
  uint64_t v18 = v15;
  unint64_t v19 = v34;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v18, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v19, a1, v5);
  if (v17 == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v19, v5);
    return 1;
  }
  uint64_t v21 = v32;
  uint64_t v22 = v33;
  ((void (*)(uint64_t, uint64_t))v31)(v5, v32);
  uint64_t result = v30(v22, 1, v5);
  if (result != 1)
  {
    unint64_t v24 = (uint64_t *)((char *)a2 + *(void *)(*a2 + 120));
    swift_beginAccess();
    uint64_t v25 = *v24;
    unint64_t v26 = type metadata accessor for CUState();
    uint64_t v27 = *(void *)(v21 + 8);
    swift_bridgeObjectRetain();
    MEMORY[0x223C6BB30](&v35, v22, v25, v5, v26, v27);
    swift_bridgeObjectRelease();
    uint64_t v28 = *(void (**)(char *, uint64_t))(v6 + 8);
    v28(v19, v5);
    BOOL v20 = v35 != 0;
    if (v35) {

    }
    v28(v22, v5);
    return v20;
  }
  __break(1u);
  return result;
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v27 = a5;
  uint64_t v28 = a2;
  uint64_t v30 = a4;
  uint64_t v29 = a1;
  uint64_t v26 = *(void *)(a3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v10, v16);
  unint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17, v20);
  uint64_t v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v23 + 16))(v22, v6);
  uint64_t v24 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v22, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v22, v14);
    v29(v19, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v27, v12, a3);
    }
    uint64_t v24 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(a6, v24, 1);
}

uint64_t closure #3 in StateMachine.constructStateMapping()(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v73 = a3;
  uint64_t v75 = a2;
  uint64_t v77 = *(void *)(a4 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v70 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v71 = (char *)&v69 - v12;
  MEMORY[0x270FA5388](v11, v13);
  uint64_t v15 = (char *)&v69 - v14;
  uint64_t v76 = type metadata accessor for EventHandlerResult();
  uint64_t v78 = *(void *)(v76 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v76, v16);
  unint64_t v19 = (char *)&v69 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17, v20);
  uint64_t v79 = (char *)&v69 - v21;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v23 = type metadata accessor for Optional();
  uint64_t v25 = MEMORY[0x270FA5388](v23 - 8, v24);
  char v69 = (char *)&v69 - v26;
  uint64_t v27 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v25, v28);
  uint64_t v30 = (char *)&v69 - v29;
  id v72 = a1;
  id v31 = objc_msgSend(a1, sel_name);
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v34 = v33;

  uint64_t v74 = v27;
  if (v32 == 0x7265746E65 && v34 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    id v35 = v15;
LABEL_5:
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(AssociatedTypeWitness, AssociatedConformanceWitness);
    goto LABEL_6;
  }
  char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  id v35 = v15;
  if (v36) {
    goto LABEL_5;
  }
  id v52 = objc_msgSend(v72, sel_name);
  uint64_t v53 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v55 = v54;

  if (v53 == 1953069157 && v55 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    id v35 = v15;
LABEL_16:
    uint64_t v57 = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t, uint64_t))(v57 + 40))(AssociatedTypeWitness, v57);
    goto LABEL_6;
  }
  char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  id v35 = v15;
  if (v56) {
    goto LABEL_16;
  }
  id v58 = objc_msgSend(v72, sel_name);
  uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v61 = v60;

  if (v59 == 0x6C616974696E69 && v61 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    id v35 = v15;
LABEL_25:
    uint64_t v63 = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t, uint64_t))(v63 + 48))(AssociatedTypeWitness, v63);
    goto LABEL_6;
  }
  char v62 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  id v35 = v15;
  if (v62) {
    goto LABEL_25;
  }
  id v64 = objc_msgSend(v72, sel_name);
  id v72 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v66 = v65;

  uint64_t v67 = swift_getAssociatedConformanceWitness();
  id v68 = v69;
  (*(void (**)(id, uint64_t, uint64_t, uint64_t))(v67 + 16))(v72, v66, AssociatedTypeWitness, v67);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48))(v68, 1, AssociatedTypeWitness);
  if (result == 1)
  {
    __break(1u);
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v30, v68, AssociatedTypeWitness);
LABEL_6:
  uint64_t v39 = v76;
  uint64_t v38 = v77;
  uint64_t v40 = v79;
  (*(void (**)(char *, uint64_t, uint64_t))(a5 + 64))(v30, a4, a5);
  uint64_t v41 = v78;
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v19, v40, v39);
  int v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48))(v19, 2, a4);
  if (v42)
  {
    if (v42 == 1)
    {
      (*(void (**)(char *, uint64_t))(v41 + 8))(v79, v39);
      (*(void (**)(char *, uint64_t))(v74 + 8))(v30, AssociatedTypeWitness);
      return 1;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v79, v39);
    goto LABEL_18;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v35, v19, a4);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v45 = v35;
  if (!Strong)
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v35, a4);
    (*(void (**)(char *, uint64_t))(v78 + 8))(v79, v39);
LABEL_18:
    (*(void (**)(char *, uint64_t))(v74 + 8))(v30, AssociatedTypeWitness);
    return 2;
  }
  uint64_t v46 = Strong;
  id v47 = v71;
  (*(void (**)(void))(*(void *)Strong + 136))();
  id v48 = v70;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v70, v45, a4);
  (*(void (**)(char *))(*(void *)v46 + 144))(v48);
  uint64_t v49 = *(void *)(v46 + *(void *)(*(void *)v46 + 128));
  uint64_t v50 = mach_absolute_time();
  (*(void (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t))(*(void *)v49 + 168))(v47, v45, v30, v50, a4, a5);
  uint64_t v51 = *(void (**)(char *, uint64_t))(v38 + 8);
  v51(v47, a4);
  v51(v45, a4);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v79, v39);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v30, AssociatedTypeWitness);
  swift_release();
  return 2;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed CUStateEvent) -> (@unowned CUStateResult)(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = v3();
  swift_release();

  return v5;
}

void specialized StateMachine.currentState.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)v2 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v7 = (char *)v12 - v6;
  v12[2] = v4;
  uint64_t v13 = *(void *)(v8 + 88);
  uint64_t v9 = v13;
  swift_getKeyPath();
  v12[0] = v4;
  v12[1] = v9;
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  swift_retain();
  uint64_t v10 = static Published.subscript.setter();
  StateMachine.currentState.didset(v10, v11);
}

uint64_t specialized StateMachine.$currentState.setter(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Published.Publisher();
  MEMORY[0x270FA5388](v2, v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - v4, a1);
  swift_beginAccess();
  type metadata accessor for Published();
  Published.projectedValue.setter();
  return swift_endAccess();
}

unint64_t type metadata accessor for CUState()
{
  unint64_t result = lazy cache variable for type metadata for CUState;
  if (!lazy cache variable for type metadata for CUState)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CUState);
  }
  return result;
}

uint64_t *specialized StateMachine.init(states:initialState:instrumentationManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = a2;
  uint64_t v6 = *v3;
  uint64_t v7 = *(void *)(*v3 + 80);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v10 = (char *)&v24[-1] - v9;
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F385D8]), sel_init);
  v3[3] = (uint64_t)v11;
  uint64_t v12 = *(void *)(*v3 + 120);
  unint64_t v13 = type metadata accessor for CUState();
  uint64_t v14 = *(void *)(*(void *)(v6 + 88) + 8);
  *(uint64_t *)((char *)v3 + v12) = Dictionary.init()();
  v3[2] = a1;
  uint64_t v15 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v23, v7);
  swift_beginAccess();
  property wrapper backing initializer of StateMachine.currentState((uint64_t)v10, v7);
  swift_endAccess();
  *(uint64_t *)((char *)v3 + *(void *)(*v3 + 128)) = a3;
  swift_retain();
  StateMachine.constructStateMapping()();
  uint64_t v16 = (uint64_t *)((char *)v3 + *(void *)(*v3 + 120));
  swift_beginAccess();
  v24[1] = *v16;
  type metadata accessor for Dictionary.Values();
  id v17 = v11;
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  Array.init<A>(_:)();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setStates_, isa);

  unint64_t v19 = *(void (**)(void))(*v3 + 136);
  id v20 = (id)v3[3];
  v19();
  swift_beginAccess();
  MEMORY[0x223C6BB30](v24, v10, *v16, v7, v13, v14);
  uint64_t v21 = (void *)v24[0];
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v7);
  objc_msgSend(v20, sel_setInitialState_, v21);

  objc_msgSend((id)v3[3], sel_start);
  return v3;
}

uint64_t sub_220977EBC()
{
  return 16;
}

__n128 sub_220977EC8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_220977ED4()
{
  return 16;
}

__n128 sub_220977EE0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t type metadata instantiation function for StateMachine()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t type metadata completion function for StateMachine()
{
  uint64_t result = type metadata accessor for Published();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for StateMachine()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for StateMachine(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StateMachine);
}

uint64_t dispatch thunk of StateMachine.currentState.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of StateMachine.currentState.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of StateMachine.currentState.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of StateMachine.$currentState.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of StateMachine.$currentState.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of StateMachine.$currentState.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of StateMachine.__allocating_init(states:initialState:instrumentationManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of StateMachine.dispatchEvent(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t partial apply for closure #1 in StateMachine.constructStateMapping()(uint64_t a1)
{
  return closure #1 in StateMachine.constructStateMapping()(a1, v1) & 1;
}

uint64_t partial apply for closure #2 in StateMachine.constructStateMapping()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v6 = (uint64_t *)((char *)v2 + *(void *)(*v2 + 120));
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t v8 = *(void *)(v5 + 80);
  unint64_t v9 = type metadata accessor for CUState();
  uint64_t v10 = *(void *)(*(void *)(v5 + 88) + 8);
  swift_bridgeObjectRetain();
  MEMORY[0x223C6BB30](&v12, a1, v7, v8, v9, v10);
  uint64_t result = swift_bridgeObjectRelease();
  if (v12) {
    *a2 = v12;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_220978214()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22097824C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();
  return MEMORY[0x270FA0238](v0, v5 + 8, v4);
}

uint64_t partial apply for closure #3 in StateMachine.constructStateMapping()(void *a1)
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80);
  return closure #3 in StateMachine.constructStateMapping()(a1, v1 + v2, *(void *)(v1+ ((*(void *)(*(void *)(*(void *)(v1 + 16) - 8) + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + 16), *(void *)(v1 + 24));
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

void StateMachine.stateMapping.setter()
{
}

void static OS_dispatch_queue.executeOnMain<A>(_:)(void (*a1)(void))
{
  if (objc_msgSend(self, sel_isMainThread))
  {
    a1();
  }
  else
  {
    type metadata accessor for OS_dispatch_queue();
    uint64_t v2 = (void *)static OS_dispatch_queue.main.getter();
    MEMORY[0x270FA5388](v2, v3);
    OS_dispatch_queue.sync<A>(execute:)();
  }
}

uint64_t partial apply for closure #1 in static OS_dispatch_queue.executeOnMain<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

void static NotificationCenterHelper.dispatch<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1, a2);
  unint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v43 - v11;
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13, v15);
  id v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = Logger.framework.unsafeMutableAddressor();
  uint64_t v48 = v14;
  uint64_t v49 = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v18, v13);
  unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v19(v12, a1, a2);
  v19(v9, a1, a2);
  id v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.info.getter();
  int v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v47 = a1;
    uint64_t v24 = v23;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v51 = v46;
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v44 = v24 + 4;
    os_log_t v45 = v20;
    swift_getDynamicType();
    uint64_t v25 = _typeName(_:qualified:)();
    uint64_t v50 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v26, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    LODWORD(v44) = v22;
    uint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
    v27(v12, a2);
    *(_WORD *)(v24 + 12) = 2080;
    uint64_t v28 = (*(uint64_t (**)(uint64_t))(a3 + 24))(a2);
    uint64_t v50 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v27(v9, a2);
    os_log_t v30 = v45;
    _os_log_impl(&dword_220960000, v45, (os_log_type_t)v44, "Client posting darwin notification for event dispatch type=%s, event: %s", (uint8_t *)v24, 0x16u);
    uint64_t v31 = v46;
    swift_arrayDestroy();
    MEMORY[0x223C6C510](v31, -1, -1);
    MEMORY[0x223C6C510](v24, -1, -1);
  }
  else
  {
    uint64_t v32 = *(void (**)(char *, uint64_t))(v6 + 8);
    v32(v12, a2);
    v32(v9, a2);
  }
  (*(void (**)(char *, uint64_t))(v48 + 8))(v17, v49);
  uint64_t v33 = darwinNotificationCenter.unsafeMutableAddressor()->value;
  uint64_t v34 = eventDispatchNotificationNamePrefix.unsafeMutableAddressor();
  uint64_t countAndFlagsBits = v34->_countAndFlagsBits;
  unint64_t object = v34->_object;
  id v37 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 24);
  swift_bridgeObjectRetain();
  uint64_t v38 = v37(a2, a3);
  uint64_t v40 = v39;
  uint64_t v51 = countAndFlagsBits;
  id v52 = object;
  swift_bridgeObjectRetain();
  v41._uint64_t countAndFlagsBits = v38;
  v41._unint64_t object = v40;
  String.append(_:)(v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v42 = (__CFString *)MEMORY[0x223C6BB50](v51, v52);
  swift_bridgeObjectRelease();
  CFNotificationCenterPostNotification(v33, v42, 0, 0, 1u);
}

void static NotificationCenterHelper.removeEveryObserver(_:)(const void *a1)
{
  CFNotificationCenterRef value = darwinNotificationCenter.unsafeMutableAddressor()->value;
  CFNotificationCenterRemoveEveryObserver(value, a1);
}

uint64_t static NotificationCenterHelper.notifcationName(for:)(void *a1)
{
  uint64_t v2 = eventReceivedNotificationNamePrefix.unsafeMutableAddressor();
  uint64_t countAndFlagsBits = v2->_countAndFlagsBits;
  unint64_t object = v2->_object;
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
  swift_bridgeObjectRetain();
  uint64_t v8 = v7(v5, v6);
  uint64_t v10 = v9;
  swift_bridgeObjectRetain();
  v11._uint64_t countAndFlagsBits = v8;
  v11._unint64_t object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = MEMORY[0x223C6BB50](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
  return v12;
}

{
  Swift::String *v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  uint64_t v12;

  uint64_t v2 = stateTransitionNotificationNamePrefix.unsafeMutableAddressor();
  uint64_t countAndFlagsBits = v2->_countAndFlagsBits;
  unint64_t object = v2->_object;
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 56);
  swift_bridgeObjectRetain();
  uint64_t v8 = v7(v5, v6);
  uint64_t v10 = v9;
  swift_bridgeObjectRetain();
  v11._uint64_t countAndFlagsBits = v8;
  v11._unint64_t object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = MEMORY[0x223C6BB50](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t static NotificationCenterHelper.state<A>(from:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v13 = (char *)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v14);
  uint64_t v53 = (char *)v49 - v15;
  uint64_t v16 = type metadata accessor for Optional();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v18);
  id v20 = (char *)v49 - v19;
  if (a1 && (v58 = 0, unint64_t v59 = 0, static String._conditionallyBridgeFromObjectiveC(_:result:)(), (v21 = v59) != 0))
  {
    uint64_t v51 = a4;
    uint64_t v52 = v8;
    uint64_t v22 = v58;
    uint64_t v23 = stateTransitionNotificationNamePrefix.unsafeMutableAddressor();
    unint64_t object = v23->_object;
    uint64_t countAndFlagsBits = v23->_countAndFlagsBits;
    uint64_t v57 = object;
    uint64_t v54 = 0;
    unint64_t v55 = 0xE000000000000000;
    lazy protocol witness table accessor for type String and conformance String();
    uint64_t v25 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    (*(void (**)(uint64_t))(a3 + 80))(v25);
    swift_bridgeObjectRelease();
    uint64_t v26 = *((void *)a2 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, char *))(v26 + 48))(v20, 1, a2) == 1)
    {
      uint64_t v50 = v22;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
      uint64_t v27 = Logger.framework.unsafeMutableAddressor();
      uint64_t v28 = v9;
      unint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
      uint64_t v31 = v52;
      os_log_t v30 = v53;
      v29(v53, v27, v52);
      swift_bridgeObjectRetain();
      uint64_t v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = v28;
        id v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        uint64_t v58 = v36;
        *(_DWORD *)id v35 = 136315138;
        v49[1] = v35 + 4;
        swift_bridgeObjectRetain();
        uint64_t countAndFlagsBits = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v21, &v58);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_220960000, v32, v33, "State transition darwin notification was malformed: %s", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C6C510](v36, -1, -1);
        MEMORY[0x223C6C510](v35, -1, -1);

        (*(void (**)(char *, uint64_t))(v34 + 8))(v53, v31);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v31);
      }
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(v26 + 56))(v51, 1, 1, a2);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v48 = v51;
      (*(void (**)(uint64_t, char *, char *))(v26 + 32))(v51, v20, a2);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, char *))(v26 + 56))(v48, 0, 1, a2);
    }
  }
  else
  {
    uint64_t v37 = Logger.framework.unsafeMutableAddressor();
    uint64_t v38 = v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v37, v8);
    uint64_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v52 = v8;
      Swift::String v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v51 = v38;
      uint64_t v43 = v42;
      uint64_t v58 = v42;
      uint64_t v53 = a2;
      *(_DWORD *)Swift::String v41 = 136315138;
      uint64_t v44 = unknownNotificationName.unsafeMutableAddressor();
      uint64_t v46 = v44->_countAndFlagsBits;
      unint64_t v45 = (unint64_t)v44->_object;
      swift_bridgeObjectRetain();
      uint64_t countAndFlagsBits = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v45, &v58);
      a2 = v53;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_220960000, v39, v40, "State transition darwin notification was malformed: %s", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C6C510](v43, -1, -1);
      MEMORY[0x223C6C510](v41, -1, -1);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v13, v52);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v8);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(*((void *)a2 - 1) + 56))(a4, 1, 1, a2);
  }
}

uint64_t static NotificationCenterHelper.event<A>(from:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v14);
  uint64_t v52 = (char *)&v50 - v15;
  uint64_t v16 = type metadata accessor for Optional();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v18);
  id v20 = (char *)&v50 - v19;
  if (a1 && (v58 = 0, unint64_t v59 = 0, static String._conditionallyBridgeFromObjectiveC(_:result:)(), (v21 = v59) != 0))
  {
    uint64_t v51 = v8;
    uint64_t v53 = a4;
    uint64_t v22 = v58;
    uint64_t v23 = eventReceivedNotificationNamePrefix.unsafeMutableAddressor();
    unint64_t object = v23->_object;
    uint64_t countAndFlagsBits = v23->_countAndFlagsBits;
    uint64_t v57 = object;
    uint64_t v54 = 0;
    unint64_t v55 = 0xE000000000000000;
    lazy protocol witness table accessor for type String and conformance String();
    uint64_t v25 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    (*(void (**)(uint64_t))(a3 + 16))(v25);
    uint64_t v26 = *((void *)a2 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, char *))(v26 + 48))(v20, 1, a2) == 1)
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
      uint64_t v27 = Logger.framework.unsafeMutableAddressor();
      uint64_t v28 = v9;
      unint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
      uint64_t v31 = v51;
      os_log_t v30 = v52;
      v29(v52, v27, v51);
      swift_bridgeObjectRetain();
      uint64_t v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = v28;
        id v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        uint64_t v58 = v36;
        *(_DWORD *)id v35 = 136315138;
        uint64_t v50 = v35 + 4;
        swift_bridgeObjectRetain();
        uint64_t countAndFlagsBits = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v21, &v58);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_220960000, v32, v33, "Event reception darwin notification was malformed: %s", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C6C510](v36, -1, -1);
        MEMORY[0x223C6C510](v35, -1, -1);

        (*(void (**)(char *, uint64_t))(v34 + 8))(v52, v51);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v31);
      }
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(v26 + 56))(v53, 1, 1, a2);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v49 = v53;
      (*(void (**)(uint64_t, char *, char *))(v26 + 32))(v53, v20, a2);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, char *))(v26 + 56))(v49, 0, 1, a2);
    }
  }
  else
  {
    uint64_t v37 = Logger.framework.unsafeMutableAddressor();
    uint64_t v38 = v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v37, v8);
    uint64_t v39 = Logger.logObject.getter();
    uint64_t v40 = v8;
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v41))
    {
      uint64_t v53 = a4;
      uint64_t v42 = swift_slowAlloc();
      uint64_t v51 = v40;
      uint64_t v43 = (uint8_t *)v42;
      uint64_t v44 = swift_slowAlloc();
      uint64_t v58 = v44;
      uint64_t v52 = a2;
      *(_DWORD *)uint64_t v43 = 136315138;
      unint64_t v45 = unknownNotificationName.unsafeMutableAddressor();
      uint64_t v47 = v45->_countAndFlagsBits;
      unint64_t v46 = (unint64_t)v45->_object;
      swift_bridgeObjectRetain();
      uint64_t countAndFlagsBits = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v47, v46, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      a4 = v53;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_220960000, v39, v41, "Event reception darwin notification was malformed: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C6C510](v44, -1, -1);
      MEMORY[0x223C6C510](v43, -1, -1);

      (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v51);
      a2 = v52;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v40);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(*((void *)a2 - 1) + 56))(a4, 1, 1, a2);
  }
}

uint64_t NotificationCenterHelper.deinit()
{
  return v0;
}

uint64_t NotificationCenterHelper.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t NotificationCenterHelper.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t NotificationCenterHelper.init()()
{
  return v0;
}

uint64_t type metadata accessor for NotificationCenterHelper()
{
  return self;
}

uint64_t method lookup function for NotificationCenterHelper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NotificationCenterHelper);
}

uint64_t dispatch thunk of NotificationCenterHelper.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t CallEvent.init(rawValue:)(unint64_t a1)
{
  return specialized CallEvent.init(rawValue:)(a1);
}

void *static CallEvent.allCases.getter()
{
  return &outlined read-only object #0 of static CallEvent.allCases.getter;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CallEvent@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = specialized CallEvent.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance CallEvent(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static CallEvent.allCases.getter;
}

unint64_t specialized CallEvent.init(rawValue:)(unint64_t result)
{
  if (result > 0xE) {
    return 0;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [CallEvent] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [CallEvent] and conformance [A];
  if (!lazy protocol witness table cache variable for type [CallEvent] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [CallEvent]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [CallEvent] and conformance [A]);
  }
  return result;
}

ValueMetadata *type metadata accessor for CallEvent()
{
  return &type metadata for CallEvent;
}

uint64_t CallClient.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____SRSTCallClient_delegate;
  swift_beginAccess();
  return MEMORY[0x223C6C570](v1);
}

uint64_t CallClient.delegate.setter()
{
  return swift_unknownObjectRelease();
}

uint64_t key path getter for CallClient.delegate : CallClient@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x70))();
  *a2 = result;
  return result;
}

uint64_t key path setter for CallClient.delegate : CallClient(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x78);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*CallClient.delegate.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SRSTCallClient_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C6C570](v5);
  return SharedClient.delegate.modify;
}

uint64_t property wrapper backing initializer of CallClient.currentState()
{
  return Published.init(initialValue:)();
}

uint64_t CallClient.currentState.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t CallClient.currentState.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t key path getter for CallClient.currentState : CallClient@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x88))();
  *a2 = result;
  return result;
}

uint64_t key path setter for CallClient.currentState : CallClient(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & **a2) + 0x90);
  id v4 = *a1;
  return v3(v2);
}

uint64_t (*CallClient.currentState.modify(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

uint64_t key path getter for CallClient.$currentState : CallClient(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xA0))();
}

uint64_t key path setter for CallClient.$currentState : CallClient(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallState?>.Publisher);
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0xA8))(v7);
}

uint64_t CallClient.$currentState.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTCallClient__currentState, &demangling cache variable for type metadata for Published<CallState?>);
}

uint64_t CallClient.$currentState.setter(uint64_t a1)
{
  return CallClient.$currentState.setter(a1, &demangling cache variable for type metadata for Published<CallState?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTCallClient__currentState, &demangling cache variable for type metadata for Published<CallState?>);
}

uint64_t (*CallClient.$currentState.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallState?>.Publisher);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____SRSTCallClient__currentState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallState?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

uint64_t property wrapper backing initializer of CallClient.mostRecentEvent()
{
  return Published.init(initialValue:)();
}

uint64_t key path getter for CallClient.mostRecentEvent : CallClient@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xB8))();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t key path setter for CallClient.mostRecentEvent : CallClient(uint64_t a1, void **a2)
{
  return (*(uint64_t (**)(void, void))((*MEMORY[0x263F8EED0] & **a2) + 0xC0))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t CallClient.mostRecentEvent.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t CallClient.mostRecentEvent.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*CallClient.mostRecentEvent.modify(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

uint64_t key path getter for CallClient.$mostRecentEvent : CallClient(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xD0))();
}

uint64_t key path setter for CallClient.$mostRecentEvent : CallClient(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallEvent?>.Publisher);
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0xD8))(v7);
}

uint64_t CallClient.$mostRecentEvent.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTCallClient__mostRecentEvent, &demangling cache variable for type metadata for Published<CallEvent?>);
}

uint64_t CallClient.$mostRecentEvent.setter(uint64_t a1)
{
  return CallClient.$currentState.setter(a1, &demangling cache variable for type metadata for Published<CallEvent?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTCallClient__mostRecentEvent, &demangling cache variable for type metadata for Published<CallEvent?>);
}

uint64_t CallClient.$currentState.setter(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*CallClient.$mostRecentEvent.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallEvent?>.Publisher);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____SRSTCallClient__mostRecentEvent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallEvent?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

uint64_t CallClient.mostRecentEventName.getter()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
  if (v2) {
    return 0;
  }
  else {
    return CallEvent.name.getter(v1);
  }
}

void CallClient.dispatchEvent(_:)(uint64_t a1)
{
  type metadata accessor for NotificationCenterHelper();
  uint64_t v3 = a1;
  unint64_t v2 = lazy protocol witness table accessor for type CallEvent and conformance CallEvent();
  static NotificationCenterHelper.dispatch<A>(_:)((uint64_t)&v3, (uint64_t)&type metadata for CallEvent, v2);
}

id CallClient.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  size_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*((unsigned char *)v1 + OBJC_IVAR____SRSTCallClient_stopped) & 1) == 0)
  {
    uint64_t v7 = type metadata accessor for CallClient();
    lazy protocol witness table accessor for type CallClient and conformance CallClient(&lazy protocol witness table cache variable for type CallClient and conformance CallClient, (void (*)(uint64_t))type metadata accessor for CallClient);
    static Clientele.remove<A>(_:)((uint64_t)v1, v7);
    uint64_t v8 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_220960000, v9, v10, "Deinit called for CallClient", v11, 2u);
      MEMORY[0x223C6C510](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    type metadata accessor for OS_dispatch_queue();
    *(void *)(swift_allocObject() + 16) = v1;
    id v12 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
  uint64_t v13 = (objc_class *)type metadata accessor for CallClient();
  v15.receiver = v1;
  v15.super_class = v13;
  return objc_msgSendSuper2(&v15, sel_dealloc);
}

void @objc closure #1 in variable initialization expression of static CallClient.handleStateTransititionNotification(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a1;
  id v8 = a3;
  id v9 = a5;
  specialized closure #1 in variable initialization expression of static CallClient.handleStateTransititionNotification(a2, (uint64_t)a3);
}

uint64_t (**CallClient.handleStateTransititionNotification.unsafeMutableAddressor())()
{
  return static CallClient.handleStateTransititionNotification;
}

uint64_t (*static CallClient.handleStateTransititionNotification.getter())()
{
  return static CallClient.handleStateTransititionNotification[0];
}

uint64_t static CallClient.handleStateTransititionNotification.setter(uint64_t (*a1)())
{
  uint64_t result = swift_beginAccess();
  static CallClient.handleStateTransititionNotification[0] = a1;
  return result;
}

uint64_t (*static CallClient.handleStateTransititionNotification.modify())()
{
  return static SharedClient.handleStateTransititionNotification.modify;
}

void @objc closure #1 in variable initialization expression of static CallClient.handleEventNotification(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a1;
  id v8 = a3;
  id v9 = a5;
  specialized closure #1 in variable initialization expression of static CallClient.handleEventNotification(a2, (uint64_t)a3);
}

uint64_t type metadata accessor for CallClient()
{
  uint64_t result = type metadata singleton initialization cache for CallClient;
  if (!type metadata singleton initialization cache for CallClient) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22097AF4C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t (**CallClient.handleEventNotification.unsafeMutableAddressor())()
{
  return &static CallClient.handleEventNotification;
}

uint64_t (*static CallClient.handleEventNotification.getter())()
{
  return static CallClient.handleEventNotification;
}

uint64_t static CallClient.handleEventNotification.setter(uint64_t (*a1)())
{
  uint64_t result = swift_beginAccess();
  static CallClient.handleEventNotification = a1;
  return result;
}

uint64_t (*static CallClient.handleEventNotification.modify())()
{
  return static SharedClient.handleEventNotification.modify;
}

id CallClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CallClient.init()()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v61 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallEvent?>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  id v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallState?>);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  objc_super v15 = &v0[OBJC_IVAR____SRSTCallClient__currentState];
  uint64_t v73 = 0;
  uint64_t v16 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CallState?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v14, v10);
  uint64_t v17 = &v16[OBJC_IVAR____SRSTCallClient__mostRecentEvent];
  uint64_t v73 = 0;
  LOBYTE(v74) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CallEvent?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v17, v9, v5);
  v16[OBJC_IVAR____SRSTCallClient_stopped] = 0;

  uint64_t v18 = (objc_class *)type metadata accessor for CallClient();
  v72.receiver = v16;
  v72.super_class = v18;
  id v19 = objc_msgSendSuper2(&v72, sel_init);
  lazy protocol witness table accessor for type CallClient and conformance CallClient(&lazy protocol witness table cache variable for type CallClient and conformance CallClient, (void (*)(uint64_t))type metadata accessor for CallClient);
  id v20 = v19;
  unint64_t v21 = (const void *)static Clientele.add<A>(_:)((uint64_t)v20, (uint64_t)v18);
  uint64_t v22 = *CallState.allStates.unsafeMutableAddressor();
  uint64_t v63 = v1;
  uint64_t v62 = v2;
  id v60 = v20;
  if ((v22 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for CallState();
    lazy protocol witness table accessor for type CallClient and conformance CallClient(&lazy protocol witness table cache variable for type CallState and conformance NSObject, (void (*)(uint64_t))type metadata accessor for CallState);
    Set.Iterator.init(_cocoa:)();
    uint64_t v22 = v73;
    uint64_t v67 = v74;
    uint64_t v23 = v75;
    uint64_t v24 = v76;
    unint64_t v25 = v77;
  }
  else
  {
    uint64_t v26 = -1 << *(unsigned char *)(v22 + 32);
    uint64_t v27 = *(void *)(v22 + 56);
    uint64_t v67 = (void *)(v22 + 56);
    uint64_t v23 = ~v26;
    uint64_t v28 = -v26;
    if (v28 < 64) {
      uint64_t v29 = ~(-1 << v28);
    }
    else {
      uint64_t v29 = -1;
    }
    unint64_t v25 = v29 & v27;
    swift_bridgeObjectRetain();
    uint64_t v24 = 0;
  }
  uint64_t v65 = v22 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v59 = v23;
  int64_t v66 = (unint64_t)(v23 + 64) >> 6;
  uint64_t v64 = MEMORY[0x263F8EE50] + 8;
  if (v22 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v25)
    {
      uint64_t v30 = (v25 - 1) & v25;
      unint64_t v31 = __clz(__rbit64(v25)) | (v24 << 6);
      uint64_t v32 = v24;
      goto LABEL_27;
    }
    int64_t v35 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      return;
    }
    if (v35 >= v66) {
      goto LABEL_30;
    }
    unint64_t v36 = v67[v35];
    uint64_t v32 = v24 + 1;
    if (!v36)
    {
      uint64_t v32 = v24 + 2;
      if (v24 + 2 >= v66) {
        goto LABEL_30;
      }
      unint64_t v36 = v67[v32];
      if (!v36)
      {
        uint64_t v32 = v24 + 3;
        if (v24 + 3 >= v66) {
          goto LABEL_30;
        }
        unint64_t v36 = v67[v32];
        if (!v36)
        {
          uint64_t v32 = v24 + 4;
          if (v24 + 4 >= v66) {
            goto LABEL_30;
          }
          unint64_t v36 = v67[v32];
          if (!v36) {
            break;
          }
        }
      }
    }
LABEL_26:
    uint64_t v30 = (v36 - 1) & v36;
    unint64_t v31 = __clz(__rbit64(v36)) + (v32 << 6);
LABEL_27:
    id v34 = *(id *)(*(void *)(v22 + 48) + 8 * v31);
    if (!v34) {
      goto LABEL_30;
    }
    while (1)
    {
      CFNotificationCenterRef value = darwinNotificationCenter.unsafeMutableAddressor()->value;
      swift_beginAccess();
      uint64_t v39 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static CallClient.handleStateTransititionNotification[0];
      type metadata accessor for NotificationCenterHelper();
      char v69 = (ValueMetadata *)type metadata accessor for CallState();
      uint64_t v70 = lazy protocol witness table accessor for type CallClient and conformance CallClient(&lazy protocol witness table cache variable for type CallState and conformance CallState, (void (*)(uint64_t))type metadata accessor for CallState);
      v68[0] = v34;
      uint64_t v40 = value;
      id v41 = v34;
      uint64_t v42 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v40, v21, v39, v42, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      uint64_t v24 = v32;
      unint64_t v25 = v30;
      if ((v22 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      uint64_t v33 = __CocoaSet.Iterator.next()();
      if (v33)
      {
        uint64_t v71 = v33;
        type metadata accessor for CallState();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v34 = (id)v68[0];
        swift_unknownObjectRelease();
        uint64_t v32 = v24;
        uint64_t v30 = v25;
        if (v34) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  uint64_t v37 = v24 + 5;
  while (v66 != v37)
  {
    unint64_t v36 = v67[v37++];
    if (v36)
    {
      uint64_t v32 = v37 - 1;
      goto LABEL_26;
    }
  }
LABEL_30:
  outlined consume of Set<SharedState>.Iterator._Variant();
  uint64_t v67 = static CallEvent.allCases.getter();
  uint64_t v43 = v67[2];
  if (v43)
  {
    type metadata accessor for NotificationCenterHelper();
    uint64_t v44 = v67 + 4;
    unint64_t v45 = darwinNotificationCenter.unsafeMutableAddressor();
    swift_beginAccess();
    unint64_t v46 = lazy protocol witness table accessor for type CallEvent and conformance CallEvent();
    do
    {
      uint64_t v47 = *v44++;
      CFNotificationCenterRef v48 = v45->value;
      uint64_t v49 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static CallClient.handleEventNotification;
      char v69 = &type metadata for CallEvent;
      uint64_t v70 = v46;
      v68[0] = v47;
      uint64_t v50 = v48;
      uint64_t v51 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v50, v21, v49, v51, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v43;
    }
    while (v43);
  }
  swift_bridgeObjectRelease();
  uint64_t v52 = Logger.framework.unsafeMutableAddressor();
  uint64_t v53 = v62;
  uint64_t v54 = v61;
  uint64_t v55 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v52, v63);
  char v56 = Logger.logObject.getter();
  os_log_type_t v57 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v58 = 0;
    _os_log_impl(&dword_220960000, v56, v57, "CallClient added Darwin observers", v58, 2u);
    MEMORY[0x223C6C510](v58, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v55);
}

Swift::Void __swiftcall CallClient.stopClient()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____SRSTCallClient_stopped;
  if ((v1[OBJC_IVAR____SRSTCallClient_stopped] & 1) == 0)
  {
    uint64_t v8 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_220960000, v9, v10, "#SiriStates stopping client", v11, 2u);
      MEMORY[0x223C6C510](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v1[v7] = 1;
    uint64_t v12 = type metadata accessor for CallClient();
    lazy protocol witness table accessor for type CallClient and conformance CallClient(&lazy protocol witness table cache variable for type CallClient and conformance CallClient, (void (*)(uint64_t))type metadata accessor for CallClient);
    static Clientele.remove<A>(_:)((uint64_t)v1, v12);
    type metadata accessor for OS_dispatch_queue();
    *(void *)(swift_allocObject() + 16) = v1;
    uint64_t v13 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
}

uint64_t protocol witness for ClientProtocol.delegate.getter in conformance CallClient@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x70))();
  *a1 = result;
  return result;
}

uint64_t protocol witness for ClientProtocol.delegate.setter in conformance CallClient(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x78))(*a1);
}

uint64_t (*protocol witness for ClientProtocol.delegate.modify in conformance CallClient(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x80))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

uint64_t protocol witness for ClientProtocol.currentState.getter in conformance CallClient@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x88))();
  *a1 = result;
  return result;
}

uint64_t protocol witness for ClientProtocol.currentState.setter in conformance CallClient(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x90))(*a1);
}

uint64_t (*protocol witness for ClientProtocol.currentState.modify in conformance CallClient(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x98))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

uint64_t protocol witness for ClientProtocol.mostRecentEvent.getter in conformance CallClient@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xB8))();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return result;
}

uint64_t protocol witness for ClientProtocol.mostRecentEvent.setter in conformance CallClient(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))((*MEMORY[0x263F8EED0] & *v1) + 0xC0))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t (*protocol witness for ClientProtocol.mostRecentEvent.modify in conformance CallClient(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xC8))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

uint64_t protocol witness for ClientProtocol.dispatchEvent(_:) in conformance CallClient(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x108))(*a1);
}

uint64_t lazy protocol witness table accessor for type CallClient and conformance CallClient(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t associated type witness table accessor for ClientProtocol.StateType : StateProtocol in CallClient()
{
  return lazy protocol witness table accessor for type CallClient and conformance CallClient(&lazy protocol witness table cache variable for type CallState and conformance CallState, (void (*)(uint64_t))type metadata accessor for CallState);
}

uint64_t ObjC metadata update function for CallClient()
{
  return type metadata accessor for CallClient();
}

void type metadata completion function for CallClient()
{
  type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<CallState?>, &demangling cache variable for type metadata for CallState?);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<CallEvent?>, &demangling cache variable for type metadata for CallEvent?);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for CallClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CallClient);
}

uint64_t dispatch thunk of CallClient.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CallClient.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CallClient.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CallClient.currentState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CallClient.currentState.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CallClient.currentState.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CallClient.$currentState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CallClient.$currentState.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CallClient.$currentState.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CallClient.mostRecentEvent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CallClient.mostRecentEvent.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x263F8EED0] & *v2) + 0xC0))(a1, a2 & 1);
}

uint64_t dispatch thunk of CallClient.mostRecentEvent.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CallClient.$mostRecentEvent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CallClient.$mostRecentEvent.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CallClient.$mostRecentEvent.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CallClient.mostRecentEventName.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CallClient.dispatchEvent(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CallClient.stopClient()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

void specialized closure #1 in variable initialization expression of static CallClient.handleStateTransititionNotification(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  id v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v46 - v11;
  type metadata accessor for NotificationCenterHelper();
  uint64_t v13 = (char *)type metadata accessor for CallState();
  uint64_t v14 = lazy protocol witness table accessor for type CallClient and conformance CallClient(&lazy protocol witness table cache variable for type CallState and conformance CallState, (void (*)(uint64_t))type metadata accessor for CallState);
  static NotificationCenterHelper.state<A>(from:)(a2, v13, v14, (uint64_t)&v55);
  objc_super v15 = v55;
  if (v55)
  {
    uint64_t v16 = Logger.framework.unsafeMutableAddressor();
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v51 = v16;
    uint64_t v52 = v5 + 16;
    uint64_t v50 = v17;
    ((void (*)(char *))v17)(v12);
    uint64_t v18 = v15;
    id v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.info.getter();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v53 = v15;
    if (v21)
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v48 = v5;
      uint64_t v24 = v23;
      uint64_t v55 = (void *)v23;
      uint64_t v47 = v9;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v49 = v4;
      unint64_t v46 = v22 + 4;
      unint64_t v25 = (char *)v18 + OBJC_IVAR____SRSTCallState_name;
      uint64_t v26 = a1;
      uint64_t v27 = v18;
      uint64_t v29 = *(uint64_t *)((char *)&v18->isa + OBJC_IVAR____SRSTCallState_name);
      unint64_t v28 = *((void *)v25 + 1);
      swift_bridgeObjectRetain();
      uint64_t v30 = v29;
      uint64_t v18 = v27;
      a1 = v26;
      uint64_t v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v28, (uint64_t *)&v55);
      uint64_t v4 = v49;
      id v9 = v47;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_220960000, v19, v20, "CallClient received valid state transition: %s", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v31 = v24;
      uint64_t v5 = v48;
      MEMORY[0x223C6C510](v31, -1, -1);
      MEMORY[0x223C6C510](v22, -1, -1);
    }
    else
    {
    }
    uint64_t v32 = *(void (**)(char *, uint64_t))(v5 + 8);
    v32(v12, v4);
    uint64_t v33 = type metadata accessor for CallClient();
    uint64_t v34 = lazy protocol witness table accessor for type CallClient and conformance CallClient(&lazy protocol witness table cache variable for type CallClient and conformance CallClient, (void (*)(uint64_t))type metadata accessor for CallClient);
    int64_t v35 = (void *)static Clientele.contains<A>(_:)(a1, v33, v34);
    if (v35)
    {
      unint64_t v36 = v35;
      uint64_t v37 = (void *)MEMORY[0x263F8EED0];
      uint64_t v38 = *(uint64_t (**)(void *))((*MEMORY[0x263F8EED0] & *v35) + 0x90);
      uint64_t v39 = v18;
      uint64_t v40 = v38(v53);
      id v41 = (void *)(*(uint64_t (**)(uint64_t))((*v37 & *v36) + 0x70))(v40);
      if (v41)
      {
        objc_msgSend(v41, sel_stateMachineWithClient_didTransitionToState_, v36, v39);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    else
    {
      v50(v9, v51, v4);
      uint64_t v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl(&dword_220960000, v42, v43, "Observer for darwin callback handler not found", v44, 2u);
        MEMORY[0x223C6C510](v44, -1, -1);
        unint64_t v45 = v42;
      }
      else
      {
        unint64_t v45 = v18;
        uint64_t v18 = v42;
      }

      v32(v9, v4);
    }
  }
}

void specialized closure #1 in variable initialization expression of static CallClient.handleEventNotification(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  id v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v40 - v11;
  type metadata accessor for NotificationCenterHelper();
  unint64_t v13 = lazy protocol witness table accessor for type CallEvent and conformance CallEvent();
  static NotificationCenterHelper.event<A>(from:)(a2, (char *)&type metadata for CallEvent, v13, (uint64_t)&v48);
  if ((v49 & 1) == 0)
  {
    uint64_t v46 = a1;
    uint64_t v14 = v48;
    uint64_t v15 = Logger.framework.unsafeMutableAddressor();
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v44(v12, v15, v4);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.info.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v45 = v14;
    if (v18)
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v43 = v5;
      os_log_type_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v41 = v15;
      uint64_t v22 = v21;
      uint64_t v48 = v21;
      uint64_t v42 = v9;
      *(_DWORD *)os_log_type_t v20 = 136315138;
      uint64_t v23 = CallEvent.name.getter(v14);
      uint64_t v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, &v48);
      id v9 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_220960000, v16, v17, "CallClient received valid event reception: %s", v20, 0xCu);
      swift_arrayDestroy();
      uint64_t v25 = v22;
      uint64_t v15 = v41;
      MEMORY[0x223C6C510](v25, -1, -1);
      uint64_t v26 = v20;
      uint64_t v5 = v43;
      MEMORY[0x223C6C510](v26, -1, -1);
    }

    uint64_t v27 = *(void (**)(char *, uint64_t))(v5 + 8);
    v27(v12, v4);
    uint64_t v28 = type metadata accessor for CallClient();
    uint64_t v29 = lazy protocol witness table accessor for type CallClient and conformance CallClient(&lazy protocol witness table cache variable for type CallClient and conformance CallClient, (void (*)(uint64_t))type metadata accessor for CallClient);
    uint64_t v30 = (void *)static Clientele.contains<A>(_:)(v46, v28, v29);
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = (void *)MEMORY[0x263F8EED0];
      uint64_t v33 = v45;
      uint64_t v34 = (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x263F8EED0] & *v30) + 0xC0))(v45, 0);
      int64_t v35 = (void *)(*(uint64_t (**)(uint64_t))((*v32 & *v31) + 0x70))(v34);
      if (v35)
      {
        unint64_t v36 = v35;
        if (objc_msgSend(v35, sel_respondsToSelector_, sel_stateMachineWithClient_didReceiveEvent_)) {
          objc_msgSend(v36, sel_stateMachineWithClient_didReceiveEvent_, v31, v33);
        }
        swift_unknownObjectRelease();
      }
    }
    else
    {
      v44(v9, v15, v4);
      uint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl(&dword_220960000, v37, v38, "Observer for darwin callback handler not found", v39, 2u);
        MEMORY[0x223C6C510](v39, -1, -1);
      }

      v27(v9, v4);
    }
  }
}

uint64_t one-time initialization function for framework()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.framework);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.framework);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.framework.unsafeMutableAddressor()
{
  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.framework);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.framework.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.framework);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
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

id one-time initialization function for attending()
{
  type metadata accessor for State();
  uint64_t v0 = (void *)*State.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = State.__allocating_init(name:parent:eventHandler:)(0x6E69646E65747441, 0xE900000000000067, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.attending, 0);
  static State.attending = (uint64_t)result;
  return result;
}

void *implicit closure #1 in variable initialization expression of static State.attending(uint64_t a1)
{
  if (a1) {
    return 0;
  }
  id v1 = *(void **)State.analyzing.unsafeMutableAddressor();
  id v2 = v1;
  return v1;
}

uint64_t *State.attending.unsafeMutableAddressor()
{
  if (one-time initialization token for attending != -1) {
    swift_once();
  }
  return &static State.attending;
}

id static State.attending.getter()
{
  if (one-time initialization token for attending != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static State.attending;
  return v0;
}

id one-time initialization function for understanding()
{
  type metadata accessor for State();
  uint64_t v0 = (void *)*State.listening.unsafeMutableAddressor();
  id v1 = v0;
  id result = State.__allocating_init(name:parent:eventHandler:)(0x6174737265646E55, 0xED0000676E69646ELL, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.understanding, 0);
  static State.understanding = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.understanding(uint64_t a1)
{
  id v1 = 0;
  switch(a1)
  {
    case 6:
      id v2 = (id *)State.processing.unsafeMutableAddressor();
      goto LABEL_7;
    case 7:
      id v2 = (id *)State.postResponse.unsafeMutableAddressor();
      goto LABEL_7;
    case 9:
      id v2 = (id *)State.responding.unsafeMutableAddressor();
      goto LABEL_7;
    case 10:
      id v2 = (id *)State.resting.unsafeMutableAddressor();
      goto LABEL_7;
    case 13:
      id v2 = (id *)State.available.unsafeMutableAddressor();
LABEL_7:
      id v1 = *v2;
      id v3 = *v2;
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t *State.understanding.unsafeMutableAddressor()
{
  if (one-time initialization token for understanding != -1) {
    swift_once();
  }
  return &static State.understanding;
}

id static State.understanding.getter()
{
  if (one-time initialization token for understanding != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static State.understanding;
  return v0;
}

uint64_t one-time initialization function for sharedLogger()
{
  id v0 = objc_msgSend(self, sel_sharedStream);
  type metadata accessor for InstrumentationManager();
  swift_allocObject();
  uint64_t v1 = specialized InstrumentationManager.init(_:)((uint64_t)v0);
  uint64_t result = swift_unknownObjectRelease();
  static InstrumentationManager.sharedLogger = v1;
  return result;
}

uint64_t *InstrumentationManager.sharedLogger.unsafeMutableAddressor()
{
  if (one-time initialization token for sharedLogger != -1) {
    swift_once();
  }
  return &static InstrumentationManager.sharedLogger;
}

uint64_t static InstrumentationManager.sharedLogger.getter()
{
  if (one-time initialization token for sharedLogger != -1) {
    swift_once();
  }
  return swift_retain();
}

void *InstrumentationManager.kSRUIFPreferencesDefaultDomain.unsafeMutableAddressor()
{
  return &static InstrumentationManager.kSRUIFPreferencesDefaultDomain;
}

unint64_t static InstrumentationManager.kSRUIFPreferencesDefaultDomain.getter()
{
  return 0xD000000000000019;
}

void *InstrumentationManager.kSRUIFLastStoredUUIDTurnIdentifier.unsafeMutableAddressor()
{
  return &static InstrumentationManager.kSRUIFLastStoredUUIDTurnIdentifier;
}

unint64_t static InstrumentationManager.kSRUIFLastStoredUUIDTurnIdentifier.getter()
{
  return 0xD00000000000001DLL;
}

uint64_t key path getter for InstrumentationManager.currentSessionIdentifier : InstrumentationManager(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 112))();
}

uint64_t key path setter for InstrumentationManager.currentSessionIdentifier : InstrumentationManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 120))(v7);
}

uint64_t InstrumentationManager.currentSessionIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_currentSessionIdentifier;
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t InstrumentationManager.currentSessionIdentifier.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_currentSessionIdentifier;
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*InstrumentationManager.currentSessionIdentifier.modify())()
{
  return static SharedClient.handleEventNotification.modify;
}

uint64_t InstrumentationManager.stream.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t InstrumentationManager.__allocating_init(_:)(uint64_t a1)
{
  swift_allocObject();
  uint64_t v2 = specialized InstrumentationManager.init(_:)(a1);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t InstrumentationManager.init(_:)(uint64_t a1)
{
  uint64_t v1 = specialized InstrumentationManager.init(_:)(a1);
  swift_unknownObjectRelease();
  return v1;
}

void InstrumentationManager.logStateTransition<A>(previousState:currentState:event:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1, a2);
  v90 = (char *)v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12, v14);
  v93 = (char *)v76 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15, v17);
  v91 = (char *)v76 - v19;
  MEMORY[0x270FA5388](v18, v20);
  uint64_t v22 = (char *)v76 - v21;
  uint64_t v23 = type metadata accessor for Logger();
  uint64_t v95 = *(void *)(v23 - 8);
  uint64_t v96 = v23;
  uint64_t v25 = MEMORY[0x270FA5388](v23, v24);
  uint64_t v27 = (char *)v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25, v28);
  v92 = (char *)v76 - v29;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v32 = MEMORY[0x270FA5388](AssociatedTypeWitness, v31);
  uint64_t v86 = (char *)v76 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32, v34);
  unint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
  uint64_t v87 = v35 + 16;
  v85 = v36;
  v36((char *)v76 - v37, a3, AssociatedTypeWitness);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for any RawRepresentable<Self.RawRepresentable.RawValue == String>);
  uint64_t v88 = AssociatedTypeWitness;
  int v38 = swift_dynamicCast();
  uint64_t v89 = a3;
  uint64_t v94 = a2;
  if (v38)
  {
    uint64_t v82 = a6;
    __swift_project_boxed_opaque_existential_1(v99, v99[3]);
    dispatch thunk of RawRepresentable.rawValue.getter();
    unint64_t v39 = v98;
    uint64_t v83 = v97;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v99);
    uint64_t v40 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v92, v40, v96);
    uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    uint64_t v84 = a1;
    v41(v22, a1, a5);
    v41(v91, v94, a5);
    swift_bridgeObjectRetain();
    uint64_t v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.debug.getter();
    int v44 = v43;
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v45 = swift_slowAlloc();
      os_log_t v79 = v42;
      uint64_t v46 = v45;
      uint64_t v80 = swift_slowAlloc();
      v99[0] = v80;
      *(_DWORD *)uint64_t v46 = 136315906;
      uint64_t v47 = _typeName(_:qualified:)();
      uint64_t v97 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v47, v48, v99);
      v76[2] = &v98;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      unint64_t v77 = v39;
      uint64_t v49 = v82;
      int v78 = v44;
      uint64_t v81 = v27;
      uint64_t v50 = *(uint64_t (**)(uint64_t, uint64_t))(v82 + 56);
      uint64_t v51 = v50(a5, v82);
      uint64_t v97 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v52, v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v53 = *(void (**)(char *, uint64_t))(v11 + 8);
      v53(v22, a5);
      *(_WORD *)(v46 + 22) = 2080;
      v76[1] = v46 + 24;
      uint64_t v54 = v91;
      uint64_t v55 = v50(a5, v49);
      uint64_t v27 = v81;
      uint64_t v97 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v55, v56, v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v53(v54, a5);
      *(_WORD *)(v46 + 32) = 2080;
      unint64_t v57 = v77;
      swift_bridgeObjectRetain();
      uint64_t v97 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v83, v57, v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      os_log_t v58 = v79;
      _os_log_impl(&dword_220960000, v79, (os_log_type_t)v78, "%s transition from=%s to=%s event=%s", (uint8_t *)v46, 0x2Au);
      uint64_t v59 = v80;
      swift_arrayDestroy();
      MEMORY[0x223C6C510](v59, -1, -1);
      MEMORY[0x223C6C510](v46, -1, -1);
    }
    else
    {
      uint64_t v61 = *(void (**)(char *, uint64_t))(v11 + 8);
      v61(v22, a5);
      v61(v91, a5);

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v95 + 8))(v92, v96);
    uint64_t v60 = v84;
  }
  else
  {
    uint64_t v60 = a1;
  }
  uint64_t v62 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v62(v93, v60, a5);
  type metadata accessor for State();
  if (swift_dynamicCast())
  {
    uint64_t v63 = (void *)v99[0];
    v62(v90, v94, a5);
    if (swift_dynamicCast())
    {
      uint64_t v64 = (void *)v99[0];
      v85(v86, v89, v88);
      if (swift_dynamicCast())
      {
        uint64_t v65 = v99[0];
        uint64_t v66 = mach_absolute_time();
        InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:)(v63, v64, v65, v66);

        return;
      }
    }
  }
  uint64_t v67 = Logger.framework.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v27, v67, v96);
  id v68 = Logger.logObject.getter();
  os_log_type_t v69 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v68, v69))
  {
    uint64_t v70 = (uint8_t *)swift_slowAlloc();
    uint64_t v71 = swift_slowAlloc();
    uint64_t v72 = v95;
    uint64_t v73 = v71;
    v99[0] = v71;
    *(_DWORD *)uint64_t v70 = 136315138;
    uint64_t v74 = _typeName(_:qualified:)();
    uint64_t v97 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v74, v75, v99);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220960000, v68, v69, "No SELF state transition support added for type=%s", v70, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C6C510](v73, -1, -1);
    MEMORY[0x223C6C510](v70, -1, -1);

    (*(void (**)(char *, uint64_t))(v72 + 8))(v27, v96);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v95 + 8))(v27, v96);
  }
}

uint64_t InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:)(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v71 = a3;
  uint64_t v73 = a1;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v78 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v9);
  unint64_t v77 = (char *)v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  uint64_t v75 = *(void *)(v11 - 8);
  uint64_t v76 = v11;
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v74 = (char *)v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v14, v15);
  uint64_t v70 = (char *)v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v17, v19);
  uint64_t v22 = (char *)v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20, v23);
  uint64_t v25 = (char *)v64 - v24;
  uint64_t v72 = swift_allocBox();
  uint64_t v27 = v26;
  uint64_t v28 = type metadata accessor for UUID();
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56);
  uint64_t v69 = v27;
  v29(v27, 1, 1, v28);
  uint64_t v30 = *(void **)(v5 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_sruifUserDefaults);
  if (v30
    && (uint64_t v31 = (void *)MEMORY[0x223C6BB50](0xD00000000000001DLL, 0x8000000220984C30),
        id v32 = objc_msgSend(v30, sel_stringForKey_, v31),
        v31,
        v32))
  {
    uint64_t v67 = v8;
    uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v34 = v33;

    uint64_t v35 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v25, v35, v17);
    swift_bridgeObjectRetain_n();
    unint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = swift_slowAlloc();
      uint64_t v65 = a4;
      unint64_t v39 = (uint8_t *)v38;
      uint64_t v40 = swift_slowAlloc();
      uint64_t v66 = a2;
      uint64_t v41 = v40;
      aBlock[0] = v40;
      *(_DWORD *)unint64_t v39 = 136315138;
      v64[1] = v39 + 4;
      swift_bridgeObjectRetain();
      uint64_t v79 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v68, v34, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_220960000, v36, v37, "#SRST RequestLinking turnID retrieved turn=%s", v39, 0xCu);
      swift_arrayDestroy();
      uint64_t v42 = v41;
      a2 = v66;
      MEMORY[0x223C6C510](v42, -1, -1);
      os_log_type_t v43 = v39;
      a4 = v65;
      MEMORY[0x223C6C510](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v25, v17);
    uint64_t v51 = (uint64_t)v70;
    UUID.init(uuidString:)();
    swift_bridgeObjectRelease();
    outlined assign with take of UUID?(v51, v69);
    uint64_t v8 = v67;
  }
  else
  {
    uint64_t v44 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v44, v17);
    uint64_t v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = a4;
      unint64_t v48 = a2;
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl(&dword_220960000, v45, v46, "#SRST RequestLinking turnID not retrieved turn=nil", v49, 2u);
      uint64_t v50 = v49;
      a2 = v48;
      a4 = v47;
      MEMORY[0x223C6C510](v50, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v17);
  }
  unint64_t v52 = *(void **)(v5 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_queue);
  uint64_t v53 = (void *)swift_allocObject();
  uint64_t v55 = v72;
  uint64_t v54 = v73;
  v53[2] = v73;
  v53[3] = a2;
  uint64_t v56 = v71;
  v53[4] = v5;
  v53[5] = v56;
  v53[6] = v55;
  v53[7] = a4;
  aBlock[4] = (uint64_t)partial apply for closure #1 in InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:);
  aBlock[5] = (uint64_t)v53;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = (uint64_t)&block_descriptor_0;
  unint64_t v57 = _Block_copy(aBlock);
  id v58 = v52;
  id v59 = v54;
  id v60 = a2;
  swift_retain();
  swift_retain();
  uint64_t v61 = v74;
  static DispatchQoS.unspecified.getter();
  uint64_t v79 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  uint64_t v62 = v77;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x223C6BCA0](0, v61, v62, v57);
  _Block_release(v57);

  (*(void (**)(char *, uint64_t))(v78 + 8))(v62, v8);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v61, v76);
  swift_release();
  return swift_release();
}

void closure #1 in InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v126 = a6;
  unint64_t v127 = a4;
  uint64_t v133 = a3;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v131 = *(void *)(v6 - 8);
  uint64_t v132 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v6, v7);
  uint64_t v10 = (char *)&v114 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v8, v11);
  v123 = (char *)&v114 - v13;
  MEMORY[0x270FA5388](v12, v14);
  v122 = (char *)&v114 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  uint64_t v18 = MEMORY[0x270FA5388](v16 - 8, v17);
  v125 = (char *)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18, v20);
  uint64_t v22 = (char *)&v114 - v21;
  uint64_t v130 = type metadata accessor for UUID();
  v128 = *(NSObject **)(v130 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v130, v23);
  v121 = (char *)&v114 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v24, v26);
  v124 = (char *)&v114 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27, v29);
  v129 = (char *)&v114 - v31;
  MEMORY[0x270FA5388](v30, v32);
  unint64_t v34 = (char *)&v114 - v33;
  uint64_t v35 = swift_projectBox();
  type metadata accessor for State();
  unint64_t v36 = State.disabled.unsafeMutableAddressor();
  id v37 = (id)*v36;
  char v38 = static NSObject.== infix(_:_:)();

  if (v38) {
    goto LABEL_6;
  }
  id v39 = (id)*v36;
  char v40 = static NSObject.== infix(_:_:)();

  if (v40) {
    goto LABEL_6;
  }
  id v41 = (id)*State.available.unsafeMutableAddressor();
  char v42 = static NSObject.== infix(_:_:)();

  if (v42)
  {
    id v43 = (id)*State.analyzing.unsafeMutableAddressor();
    char v44 = static NSObject.== infix(_:_:)();

    if ((v44 & 1) != 0
      || (id v45 = (id)*State.responding.unsafeMutableAddressor(),
          char v46 = static NSObject.== infix(_:_:)(),
          v45,
          (v46 & 1) != 0))
    {
LABEL_6:
      UUID.init()();
      (*(void (**)(char *))(*(void *)v133 + 120))(v34);
    }
  }
  id v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EF30]), sel_init);
  if (v47)
  {
    unint64_t v48 = v47;
    id v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EF20]), sel_init);
    if (v49)
    {
      uint64_t v50 = v49;
      id v120 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EF28]), sel_init);
      if (v120)
      {
        objc_msgSend(v48, sel_setPreviousState_, specialized InstrumentationManager.mapStateToStateEnum(state:)());
        objc_msgSend(v48, sel_setCurrentState_, specialized InstrumentationManager.mapStateToStateEnum(state:)());
        v119 = v50;
        if (v127 > 0x10) {
          uint64_t v51 = 0;
        }
        else {
          uint64_t v51 = dword_220983D14[v127];
        }
        id v58 = objc_msgSend(v48, sel_setReason_, v51);
        (*(void (**)(id))(*(void *)v133 + 112))(v58);
        id v59 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
        Class isa = UUID._bridgeToObjectiveC()().super.isa;
        id v61 = objc_msgSend(v59, sel_initWithNSUUID_, isa);

        uint64_t v62 = v128;
        uint64_t v64 = v128 + 1;
        uint64_t v63 = (void (*)(char *, uint64_t))v128[1].isa;
        uint64_t v65 = v130;
        v63(v34, v130);
        objc_msgSend(v120, sel_setSessionId_, v61);

        swift_beginAccess();
        outlined init with copy of UUID?(v35, (uint64_t)v22);
        uint64_t v66 = (uint64_t (*)(char *, uint64_t, uint64_t))v62[6].isa;
        if (v66(v22, 1, v65) == 1)
        {
          outlined destroy of UUID?((uint64_t)v22);
          uint64_t v67 = v126;
          uint64_t v68 = v119;
        }
        else
        {
          v118 = v63;
          unint64_t v127 = (unint64_t)v64;
          uint64_t v69 = (void (*)(char *, char *, uint64_t))v62[4].isa;
          uint64_t v70 = v62;
          v69(v129, v22, v65);
          uint64_t v71 = self;
          Class v72 = UUID._bridgeToObjectiveC()().super.isa;
          id v73 = objc_msgSend(v71, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, 20, v72);

          if (v73)
          {
            static UUID._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v74 = v125;
            v69(v125, v34, v65);
            ((void (*)(char *, void, uint64_t, uint64_t))v70[7].isa)(v74, 0, 1, v65);
            int v75 = v66(v74, 1, v65);
            uint64_t v67 = v126;
            uint64_t v68 = v119;
            if (v75 != 1)
            {
              v69(v124, v74, v65);
              id v76 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
              Class v77 = UUID._bridgeToObjectiveC()().super.isa;
              uint64_t v78 = (char *)objc_msgSend(v76, sel_initWithNSUUID_, v77);

              id v79 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
              Class v80 = UUID._bridgeToObjectiveC()().super.isa;
              uint64_t v81 = (char *)objc_msgSend(v79, sel_initWithNSUUID_, v80);

              id v82 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDB8]), sel_init);
              uint64_t v83 = v131;
              if (v82)
              {
                uint64_t v84 = v82;
                v125 = v81;
                id v85 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
                if (v85)
                {
                  uint64_t v86 = v85;
                  id v87 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
                  if (v87)
                  {
                    uint64_t v88 = v87;
                    v123 = v78;
                    objc_msgSend(v86, sel_setUuid_, v78);
                    objc_msgSend(v86, sel_setComponent_, 20);
                    objc_msgSend(v84, sel_setSource_, v86);
                    objc_msgSend(v88, sel_setUuid_, v125);
                    objc_msgSend(v88, sel_setComponent_, 2);
                    objc_msgSend(v84, sel_setTarget_, v88);
                    uint64_t v89 = Logger.framework.unsafeMutableAddressor();
                    v90 = v122;
                    (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v122, v89, v132);
                    v91 = v121;
                    uint64_t v92 = v130;
                    ((void (*)(char *, char *, uint64_t))v128[2].isa)(v121, v124, v130);
                    v93 = Logger.logObject.getter();
                    os_log_type_t v94 = static os_log_type_t.info.getter();
                    v128 = v93;
                    int v117 = v94;
                    if (os_log_type_enabled(v93, v94))
                    {
                      uint64_t v95 = (uint8_t *)swift_slowAlloc();
                      uint64_t v115 = swift_slowAlloc();
                      uint64_t v135 = v115;
                      *(_DWORD *)uint64_t v95 = 136315138;
                      v114 = v95 + 4;
                      v116 = v88;
                      lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
                      uint64_t v96 = dispatch thunk of CustomStringConvertible.description.getter();
                      uint64_t v134 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v96, v97, &v135);
                      UnsafeMutableRawBufferPointer.copyMemory(from:)();
                      swift_bridgeObjectRelease();
                      unint64_t v98 = v91;
                      v99 = v118;
                      v118(v98, v92);
                      v100 = v128;
                      _os_log_impl(&dword_220960000, v128, (os_log_type_t)v117, "#SRST RequestLinking setting srstId=%s", v95, 0xCu);
                      uint64_t v101 = v115;
                      swift_arrayDestroy();
                      MEMORY[0x223C6C510](v101, -1, -1);
                      uint64_t v88 = v116;
                      MEMORY[0x223C6C510](v95, -1, -1);

                      (*(void (**)(char *, uint64_t))(v83 + 8))(v122, v132);
                      uint64_t v92 = v130;
                    }
                    else
                    {
                      v112 = v91;
                      v99 = v118;
                      v118(v112, v92);

                      (*(void (**)(char *, uint64_t))(v83 + 8))(v90, v132);
                    }
                    v113 = v123;
                    objc_msgSend(v120, sel_setSrstId_, v123);
                    objc_msgSend(*(id *)(v133 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_stream), sel_emitMessage_timestamp_, v84, v67);

                    v99(v124, v92);
                    v99(v129, v92);
                    uint64_t v68 = v119;
                    goto LABEL_36;
                  }
                }
                else
                {
                  uint64_t v86 = v84;
                }

                uint64_t v81 = v125;
              }
              uint64_t v102 = Logger.framework.unsafeMutableAddressor();
              v103 = v123;
              uint64_t v104 = v132;
              (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v123, v102, v132);
              v105 = Logger.logObject.getter();
              os_log_type_t v106 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v105, v106))
              {
                v107 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v107 = 0;
                _os_log_impl(&dword_220960000, v105, v106, "#SRST RequestLinking Failed to create RequestLink event for SiriStates", v107, 2u);
                v108 = v107;
                uint64_t v68 = v119;
                MEMORY[0x223C6C510](v108, -1, -1);
              }

              (*(void (**)(char *, uint64_t))(v83 + 8))(v103, v104);
              uint64_t v109 = v130;
              v110 = v118;
              v118(v124, v130);
              v110(v129, v109);
              goto LABEL_36;
            }
          }
          else
          {
            uint64_t v74 = v125;
            ((void (*)(char *, uint64_t, uint64_t, uint64_t))v70[7].isa)(v125, 1, 1, v65);
            uint64_t v67 = v126;
            uint64_t v68 = v119;
          }
          v118(v129, v65);
          outlined destroy of UUID?((uint64_t)v74);
        }
LABEL_36:
        id v111 = v120;
        objc_msgSend(v68, sel_setEventMetadata_, v120);
        objc_msgSend(v68, sel_setStateTransitionEvent_, v48);
        objc_msgSend(*(id *)(v133 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_stream), sel_emitMessage_timestamp_, v68, v67);

        return;
      }
    }
    else
    {
      uint64_t v50 = v48;
    }
  }
  uint64_t v52 = Logger.framework.unsafeMutableAddressor();
  uint64_t v54 = v131;
  uint64_t v53 = v132;
  (*(void (**)(char *, uint64_t, uint64_t))(v131 + 16))(v10, v52, v132);
  uint64_t v55 = Logger.logObject.getter();
  os_log_type_t v56 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v55, v56))
  {
    unint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v57 = 0;
    _os_log_impl(&dword_220960000, v55, v56, "#SRST RequestLinking unable to init SSSchemaProvisionalSiriStateTransitionEvent", v57, 2u);
    MEMORY[0x223C6C510](v57, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v54 + 8))(v10, v53);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t InstrumentationManager.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_currentSessionIdentifier;
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_unknownObjectRelease();
  return v0;
}

uint64_t InstrumentationManager.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_currentSessionIdentifier;
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_unknownObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t specialized InstrumentationManager.init(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v22 = *(void *)(v4 - 8);
  uint64_t v23 = v4;
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v8 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21, v9);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v14 = type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388](v14 - 8, v15);
  *(void *)(v2 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_stream) = a1;
  v20[1] = type metadata accessor for OS_dispatch_queue();
  swift_unknownObjectRetain();
  static DispatchQoS.utility.getter();
  uint64_t v24 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, *MEMORY[0x263F8F130], v21);
  *(void *)(v2 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_queue) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  UUID.init()();
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v2 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_currentSessionIdentifier, v7, v23);
  id v16 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v17 = (void *)MEMORY[0x223C6BB50](0xD000000000000019, 0x8000000220984C10);
  id v18 = objc_msgSend(v16, sel_initWithSuiteName_, v17);

  *(void *)(v2 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_sruifUserDefaults) = v18;
  return v2;
}

uint64_t ObjC metadata update function for InstrumentationManager()
{
  return type metadata accessor for InstrumentationManager();
}

uint64_t type metadata accessor for InstrumentationManager()
{
  uint64_t result = type metadata singleton initialization cache for InstrumentationManager;
  if (!type metadata singleton initialization cache for InstrumentationManager) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for InstrumentationManager()
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

uint64_t method lookup function for InstrumentationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InstrumentationManager);
}

uint64_t dispatch thunk of InstrumentationManager.currentSessionIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of InstrumentationManager.currentSessionIdentifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of InstrumentationManager.currentSessionIdentifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of InstrumentationManager.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of InstrumentationManager.logStateTransition<A>(previousState:currentState:event:timestamp:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t sub_22097FA94()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void partial apply for closure #1 in InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:)()
{
  closure #1 in InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
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

uint64_t outlined assign with take of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t specialized InstrumentationManager.mapStateToStateEnum(state:)()
{
  swift_getObjectType();
  id v0 = (id)*State.abstract.unsafeMutableAddressor();
  char v1 = static NSObject.== infix(_:_:)();

  if (v1) {
    return 0;
  }
  id v3 = (id)*State.analyzing.unsafeMutableAddressor();
  char v4 = static NSObject.== infix(_:_:)();

  if (v4) {
    return 3;
  }
  id v5 = (id)*State.available.unsafeMutableAddressor();
  char v6 = static NSObject.== infix(_:_:)();

  if (v6) {
    return 2;
  }
  id v7 = (id)*State.disabled.unsafeMutableAddressor();
  char v8 = static NSObject.== infix(_:_:)();

  if (v8) {
    return 1;
  }
  id v9 = (id)*State.postResponse.unsafeMutableAddressor();
  char v10 = static NSObject.== infix(_:_:)();

  if (v10) {
    return 8;
  }
  id v11 = (id)*State.processing.unsafeMutableAddressor();
  char v12 = static NSObject.== infix(_:_:)();

  if (v12) {
    return 5;
  }
  id v13 = (id)*State.responding.unsafeMutableAddressor();
  char v14 = static NSObject.== infix(_:_:)();

  if (v14) {
    return 6;
  }
  id v15 = (id)*State.resting.unsafeMutableAddressor();
  char v16 = static NSObject.== infix(_:_:)();

  if (v16) {
    return 7;
  }
  id v17 = (id)*State.understanding.unsafeMutableAddressor();
  char v18 = static NSObject.== infix(_:_:)();

  if (v18) {
    return 4;
  }
  else {
    return 0;
  }
}

uint64_t outlined init with copy of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of UUID?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](unint64_t *a1, uint64_t *a2)
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

id one-time initialization function for processing()
{
  type metadata accessor for State();
  id v0 = (void *)*State.abstract.unsafeMutableAddressor();
  id v1 = v0;
  id result = State.__allocating_init(name:parent:eventHandler:)(0x69737365636F7250, 0xEA0000000000676ELL, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.processing, 0);
  static State.processing = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.processing(uint64_t a1)
{
  id v1 = 0;
  switch(a1)
  {
    case 0:
      uint64_t v2 = (id *)State.analyzing.unsafeMutableAddressor();
      goto LABEL_6;
    case 7:
      uint64_t v2 = (id *)State.postResponse.unsafeMutableAddressor();
      goto LABEL_6;
    case 9:
      uint64_t v2 = (id *)State.responding.unsafeMutableAddressor();
      goto LABEL_6;
    case 13:
      uint64_t v2 = (id *)State.available.unsafeMutableAddressor();
LABEL_6:
      id v1 = *v2;
      id v3 = *v2;
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t *State.processing.unsafeMutableAddressor()
{
  if (one-time initialization token for processing != -1) {
    swift_once();
  }
  return &static State.processing;
}

id static State.processing.getter()
{
  if (one-time initialization token for processing != -1) {
    swift_once();
  }
  id v0 = (void *)static State.processing;
  return v0;
}

uint64_t *CallState.allStates.unsafeMutableAddressor()
{
  if (one-time initialization token for allStates != -1) {
    swift_once();
  }
  return &static CallState.allStates;
}

uint64_t static CallState.allStates.getter()
{
  if (one-time initialization token for allStates != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

unint64_t Event.init(rawValue:)(unint64_t a1)
{
  return specialized Event.init(rawValue:)(a1);
}

void *static Event.allCases.getter()
{
  return &outlined read-only object #0 of static Event.allCases.getter;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Event@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = specialized Event.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance Event(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static Event.allCases.getter;
}

unint64_t specialized Event.init(rawValue:)(unint64_t result)
{
  if (result > 0x10) {
    return 0;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [Event] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [Event] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Event] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Event]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Event] and conformance [A]);
  }
  return result;
}

ValueMetadata *type metadata accessor for Event()
{
  return &type metadata for Event;
}

uint64_t one-time initialization function for lock()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  static Clientele.lock = result;
  return result;
}

void one-time initialization function for pointers()
{
  static Clientele.pointers = MEMORY[0x263F8EE88];
}

uint64_t static Clientele.add<A>(_:)(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for lock != -1) {
    a1 = swift_once();
  }
  uint64_t v2 = MEMORY[0x270FA5388](a1, a2);
  MEMORY[0x270FA5388](v2, v3);
  id v5 = v4 + 4;
  os_unfair_lock_lock(v4 + 4);
  partial apply for specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(&v7);
  os_unfair_lock_unlock(v5);
  return v7;
}

uint64_t partial apply for closure #1 in static Clientele.add<A>(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 32);
  if (one-time initialization token for pointers != -1) {
    swift_once();
  }
  swift_beginAccess();
  specialized Set._Variant.insert(_:)(&v5, v3);
  uint64_t result = swift_endAccess();
  *a1 = v3;
  return result;
}

uint64_t static Clientele.contains<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (one-time initialization token for lock != -1) {
    a1 = swift_once();
  }
  uint64_t v6 = static Clientele.lock;
  MEMORY[0x270FA5388](a1, a2);
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = v5;
  type metadata accessor for Optional();
  OSAllocatedUnfairLock<A>.withLockUnchecked<A>(_:)((uint64_t)partial apply for closure #1 in static Clientele.contains<A>(_:), (uint64_t)v8, v6);
  return v8[7];
}

BOOL specialized Set.contains(_:)(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = static Hasher._hash(seed:_:)();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1;
  }
  uint64_t v9 = ~v5;
  unint64_t v10 = (v6 + 1) & v9;
  if (((*(void *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v11 = *(void *)(v8 + 8 * v10);
    BOOL result = v11 == a1;
    if (v11 == a1) {
      break;
    }
    unint64_t v10 = (v10 + 1) & v9;
  }
  while (((*(void *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  return result;
}

void OSAllocatedUnfairLock<A>.withLockUnchecked<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (os_unfair_lock_s *)(a3 + ((*(unsigned int *)(*(void *)a3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  partial apply for closure #1 in OSAllocatedUnfairLock<A>.withLockUnchecked<A>(_:)();
  os_unfair_lock_unlock(v3);
}

void static Clientele.remove<A>(_:)(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for lock != -1) {
    a1 = swift_once();
  }
  uint64_t v2 = MEMORY[0x270FA5388](a1, a2);
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v5 = v4 + 4;
  os_unfair_lock_lock(v4 + 4);
  partial apply for specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)();
  os_unfair_lock_unlock(v5);
}

uint64_t specialized Set._Variant.insert(_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = static Hasher._hash(seed:_:)();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    specialized _NativeSet.insertNew(_:at:isUnique:)(a2, v9, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(void *)(v10 + 8 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v10 + 8 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<UnsafeMutableRawPointer>);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    uint64_t v27 = v1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64) {
                  bzero((void *)(v2 + 56), 8 * v10);
                }
                else {
                  *uint64_t v6 = v26;
                }
                uint64_t v1 = v27;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      uint64_t result = static Hasher._hash(seed:_:)();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)specialized _NativeSet.copy()();
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v8 = *v3;
  uint64_t result = static Hasher._hash(seed:_:)();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<UnsafeMutableRawPointer>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<UnsafeMutableRawPointer>);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    uint64_t result = static Hasher._hash(seed:_:)();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.remove(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  uint64_t v5 = static Hasher._hash(seed:_:)();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(v4 + 48);
  if (*(void *)(v8 + 8 * v7) != a1)
  {
    uint64_t v9 = ~v6;
    do
    {
      unint64_t v7 = (v7 + 1) & v9;
      if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        return 0;
      }
    }
    while (*(void *)(v8 + 8 * v7) != a1);
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v2;
  uint64_t v14 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    specialized _NativeSet.copy()();
    uint64_t v11 = v14;
  }
  uint64_t v12 = *(void *)(*(void *)(v11 + 48) + 8 * v7);
  specialized _NativeSet._delete(at:)(v7);
  *uint64_t v2 = v14;
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t specialized _NativeSet._delete(at:)(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        uint64_t v10 = *(void *)(v3 + 48);
        uint64_t v11 = (void *)(v10 + 8 * v6);
        uint64_t v12 = static Hasher._hash(seed:_:)() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= v12)
          {
LABEL_16:
            int64_t v15 = (void *)(v10 + 8 * v2);
            if (v2 != v6 || (int64_t v2 = v6, v15 >= v11 + 1))
            {
              *int64_t v15 = *v11;
              int64_t v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v16 = *(void *)(v3 + 16);
  BOOL v17 = __OFSUB__(v16, 1);
  uint64_t v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void *partial apply for specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

void partial apply for closure #1 in static Clientele.contains<A>(_:)(void *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 32);
  if (v3)
  {
    if (one-time initialization token for pointers != -1) {
      swift_once();
    }
    swift_beginAccess();
    BOOL v4 = specialized Set.contains(_:)((uint64_t)v3, static Clientele.pointers);
    uint64_t v5 = 0;
    if (v4)
    {
      id v6 = v3;
      uint64_t v5 = v3;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a1 = v5;
}

uint64_t partial apply for closure #1 in static Clientele.remove<A>(_:)()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (one-time initialization token for pointers != -1) {
    swift_once();
  }
  swift_beginAccess();
  specialized Set._Variant.remove(_:)(v1);
  return swift_endAccess();
}

uint64_t partial apply for specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

ValueMetadata *type metadata accessor for Clientele()
{
  return &type metadata for Clientele;
}

uint64_t partial apply for closure #1 in OSAllocatedUnfairLock<A>.withLockUnchecked<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
    }
  }
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x270EF0C58]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x270EF0C88]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
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

uint64_t Published.init(initialValue:)()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t Published.projectedValue.getter()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t Published.projectedValue.setter()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t static Published.subscript.modify()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t static Published.subscript.getter()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t static Published.subscript.setter()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t type metadata accessor for Published.Publisher()
{
  return MEMORY[0x270EE3DE8]();
}

uint64_t type metadata accessor for Published()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x270EE4008]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t static DispatchQoS.utility.getter()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t Dictionary.count.getter()
{
  return MEMORY[0x270F9D120]();
}

uint64_t type metadata accessor for Dictionary.Values()
{
  return MEMORY[0x270F9D148]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x270F9D208]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x270F9D210]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t Sequence.first(where:)()
{
  return MEMORY[0x270F9D988]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x270F9DA70]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t Set.count.getter()
{
  return MEMORY[0x270F9DF38]();
}

uint64_t Set.remove(_:)()
{
  return MEMORY[0x270F9DF60]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t type metadata accessor for Set()
{
  return MEMORY[0x270F9DFD0]();
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

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270FA1170](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
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

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t StringProtocol.hash.getter()
{
  return MEMORY[0x270EF2550]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x270F9E818]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x270F9E870]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
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

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x270F9F878]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x270F9FC38]();
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

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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