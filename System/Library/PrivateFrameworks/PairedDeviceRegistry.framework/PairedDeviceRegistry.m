uint64_t type metadata instantiation function for WeakCollection()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t type metadata instantiation function for WeakCollection.Weak(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for WeakCollection.Weak()
{
  return __swift_instantiateGenericMetadata();
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for WeakCollection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for WeakCollection()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t partial apply for closure #1 in Registry_Impl.bootstrapNotify(_:)()
{
  return closure #1 in Registry_Impl.bootstrapNotify(_:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t closure #1 in Registry_Impl.bootstrapNotify(_:)(unint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  v50 = a4;
  uint64_t v51 = a5;
  uint64_t v52 = a2;
  id v53 = a3;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v55 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v63 = (char *)&v39 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v10 - 8);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_28;
  }
  uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v13)
  {
    unint64_t v14 = 0;
    unint64_t v15 = a1 & 0xC000000000000001;
    uint64_t v44 = a1 & 0xFFFFFFFFFFFFFF8;
    unint64_t v43 = a1 + 32;
    v56 = (unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48);
    v54 = (void (**)(char *, char *, uint64_t))(v42 + 32);
    v61 = (void (**)(char *, uint64_t))(v42 + 8);
    unint64_t v16 = 0x265436000;
    v59 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56);
    unint64_t v41 = (v42 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    unint64_t v40 = a1;
    v49 = v12;
    unint64_t v45 = a1 & 0xC000000000000001;
    uint64_t v46 = v13;
    while (v15)
    {
      v17 = (void *)MEMORY[0x25A2CAA40](v14, a1);
      BOOL v18 = __OFADD__(v14++, 1);
      if (v18) {
        goto LABEL_26;
      }
LABEL_12:
      v19 = v17;
      if (objc_msgSend(v17, sel_respondsToSelector_, *(void *)(v16 + 3856)))
      {
        objc_msgSend(v19, *(SEL *)(v16 + 3856), v52);
        swift_unknownObjectRelease();
      }
      else
      {
        id v60 = v19;
        unint64_t v48 = v14;
        id v20 = objc_msgSend(v53, sel_allPairingIDs);
        uint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v22 = *(void *)(v21 + 16);
        uint64_t v47 = v21;
        if (v22)
        {
          unint64_t v23 = v21 + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80));
          uint64_t v57 = *(void *)(v42 + 72);
          v62 = *(void (**)(char *, unint64_t, uint64_t))(v42 + 16);
          v24 = v61;
          v62(v12, v23, v6);
          while (1)
          {
            v58 = *v59;
            v58(v12, 0, 1, v6);
            if ((*v56)(v12, 1, v6) == 1)
            {
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              a1 = v40;
              unint64_t v15 = v45;
              uint64_t v13 = v46;
              unint64_t v14 = v48;
              unint64_t v16 = 0x265436000uLL;
              goto LABEL_5;
            }
            (*v54)(v63, v12, v6);
            id v37 = v60;
            if (objc_msgSend(v60, sel_respondsToSelector_, sel_registry_added_))
            {
              v25 = v55;
              v26 = (void (*)(char *, char *, uint64_t))v62;
              v62(v55, (unint64_t)v63, v6);
              v27 = (objc_class *)type metadata accessor for Device_Impl();
              v28 = (char *)objc_allocWithZone(v27);
              v26(&v28[OBJC_IVAR___PDRDevice_Impl_uuid_], v25, v6);
              v29 = &v28[OBJC_IVAR___PDRDevice_Impl_registryState];
              id v30 = v53;
              v32 = v50;
              uint64_t v31 = v51;
              *(void *)v29 = v53;
              *((void *)v29 + 1) = v32;
              *((void *)v29 + 2) = v31;
              v64.receiver = v28;
              v64.super_class = v27;
              swift_unknownObjectRetain();
              id v33 = v30;
              id v34 = v32;
              id v35 = objc_msgSendSuper2(&v64, sel_init);
              v36 = *v61;
              v12 = v49;
              (*v61)(v55, v6);
              objc_msgSend(v37, sel_registry_added_, v52, v35);
              swift_unknownObjectRelease();

              v24 = v61;
              v36(v63, v6);
            }
            else
            {
              (*v24)(v63, v6);
            }
            v23 += v57;
            if (!--v22) {
              break;
            }
            v62(v12, v23, v6);
          }
          a1 = v40;
          unint64_t v15 = v45;
          uint64_t v13 = v46;
          unint64_t v14 = v48;
          unint64_t v16 = 0x265436000;
          v58(v12, 1, 1, v6);
        }
        else
        {
          unint64_t v15 = v45;
          uint64_t v13 = v46;
          unint64_t v14 = v48;
          unint64_t v16 = 0x265436000;
          (*v59)(v12, 1, 1, v6);
        }
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
LABEL_5:
      if (v14 == v13) {
        return swift_bridgeObjectRelease();
      }
    }
    if (v14 >= *(void *)(v44 + 16)) {
      goto LABEL_27;
    }
    v17 = (void *)swift_unknownObjectRetain();
    BOOL v18 = __OFADD__(v14++, 1);
    if (!v18) {
      goto LABEL_12;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
  }
  return swift_bridgeObjectRelease();
}

BOOL one-time initialization function for demoModeEnabled()
{
  BOOL result = closure #1 in variable initialization expression of static RegistryCrux.demoModeEnabled();
  static RegistryCrux.demoModeEnabled = result;
  return result;
}

BOOL closure #1 in variable initialization expression of static RegistryCrux.demoModeEnabled()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  type metadata accessor for NotifyState();
  uint64_t inited = swift_initStackObject();
  *(_DWORD *)(inited + 40) = 0;
  *(unsigned char *)(inited + 44) = 1;
  v1 = (void *)MEMORY[0x25A2CA820](0xD000000000000033, 0x800000025871D870);
  uint64_t v2 = (const char *)objc_msgSend(v1, sel_UTF8String);
  id v3 = v1;
  v4 = strdup(v2);
  if (!v4) {
    __break(1u);
  }
  v5 = v4;
  *(void *)(inited + 16) = v4;
  *(void *)(inited + 24) = closure #1 in default argument 1 of NotifyState.init(name:_:);
  *(void *)(inited + 32) = 0;
  val[0] = 0;
  if (!notify_register_check(v4, val))
  {
    int v6 = val[0];
    *(_DWORD *)(inited + 40) = val[0];
    *(unsigned char *)(inited + 44) = 0;
    if (notify_is_valid_token(v6))
    {
      *(void *)val = 0;
      if (notify_is_valid_token(v6))
      {
        notify_get_state(v6, (uint64_t *)val);
        BOOL v7 = *(void *)val != 0;
        if (*(unsigned char *)(inited + 44)) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }
  uint64_t v8 = (__CFString *)MEMORY[0x25A2CA820](0xD000000000000017, 0x800000025871D8B0);
  uint64_t v9 = (__CFString *)MEMORY[0x25A2CA820](0x6D654465726F7453, 0xED000065646F4D6FLL);
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v9, v8, 0);
  swift_retain();

  if (AppBooleanValue)
  {
    uint64_t v11 = (__CFString *)MEMORY[0x25A2CA820](0x6D6172676F725046, 0xEE007265626D754ELL);
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(v11, v8, 0);

    BOOL v7 = AppIntegerValue == 5;
    if ((*(unsigned char *)(inited + 44) & 1) == 0) {
      goto LABEL_9;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    BOOL v7 = 0;
    if (*(unsigned char *)(inited + 44)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  BOOL v7 = 0;
  if (*(unsigned char *)(inited + 44)) {
    goto LABEL_13;
  }
LABEL_9:
  notify_set_state(*(_DWORD *)(inited + 40), v7);
  notify_post(v5);

  swift_release();
  if ((*(unsigned char *)(inited + 44) & 1) == 0)
  {
LABEL_10:
    notify_cancel(*(_DWORD *)(inited + 40));
    *(_DWORD *)(inited + 40) = 0;
    *(unsigned char *)(inited + 44) = 1;
  }
LABEL_11:
  swift_release();
  return v7;
}

uint64_t type metadata accessor for NotifyState()
{
  return self;
}

uint64_t NotifyState.__deallocating_deinit()
{
  free(*(void **)(v0 + 16));
  swift_release();
  return MEMORY[0x270FA0228](v0, 45, 7);
}

id one-time initialization function for sharedInstance_()
{
  uint64_t v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Registry_Impl()), sel_init);
  v0[OBJC_IVAR___PDRRegistry_Impl_amSingleton] = 1;
  id result = objc_msgSend(v0, sel_start);
  static Registry_Impl.sharedInstance_ = (uint64_t)v0;
  return result;
}

{
  unsigned char *v0;
  id result;

  uint64_t v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Registry_Stub()), sel_init);
  v0[OBJC_IVAR___PDRRegistry_Stub_amSingleton] = 1;
  id result = objc_msgSend(v0, sel_start);
  static Registry_Stub.sharedInstance_ = (uint64_t)v0;
  return result;
}

Swift::Void __swiftcall Registry_Impl.start()()
{
  uint64_t v1 = OBJC_IVAR___PDRRegistry_Impl_started_;
  if (*((unsigned char *)v0 + OBJC_IVAR___PDRRegistry_Impl_started_))
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (one-time initialization token for instance != -1) {
      swift_once();
    }
    swift_retain();
    v2.super.isa = v0;
    RegistryCrux.add(registry:)(v2);
    swift_release();
    *((unsigned char *)v0 + v1) = 1;
    if ((*((unsigned char *)v0 + OBJC_IVAR___PDRRegistry_Impl_amSingleton) & 1) == 0)
    {
      uint64_t v3 = static RegistryCrux.instance;
      uint64_t v4 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
      v5 = *(os_unfair_lock_s **)(static RegistryCrux.instance
                                + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
      swift_retain();
      swift_retain();
      os_unfair_lock_lock(v5 + 4);
      swift_release();
      BOOL v7 = *(void **)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
      int v6 = *(void **)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
      uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
      uint64_t v9 = *(os_unfair_lock_s **)(v3 + v4);
      id v10 = v6;
      swift_retain();
      id v11 = v7;
      os_unfair_lock_unlock(v9 + 4);
      swift_release();
      swift_release();
      Registry_Impl.bootstrapNotify(_:)(v11, v6, v8);
    }
  }
}

uint64_t Registry_Impl.bootstrapNotify(_:)(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v27 = a1;
  uint64_t v28 = a3;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v30 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  id v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = OBJC_IVAR___PDRRegistry_Impl_unfairLock;
  uint64_t v13 = *(os_unfair_lock_s **)&v3[OBJC_IVAR___PDRRegistry_Impl_unfairLock];
  swift_retain();
  os_unfair_lock_lock(v13 + 4);
  swift_release();
  aBlock[0] = MEMORY[0x263F8EE78];
  uint64_t v14 = swift_retain();
  specialized WeakCollection.sweep(action:)(v14, aBlock);
  swift_release();
  uint64_t v15 = aBlock[0];
  unint64_t v16 = *(os_unfair_lock_s **)&v4[v12];
  swift_retain();
  os_unfair_lock_unlock(v16 + 4);
  swift_release();
  id v17 = objc_msgSend(v4, sel_callbackQueue);
  BOOL v18 = (void *)swift_allocObject();
  v18[2] = v15;
  v18[3] = v4;
  id v20 = v27;
  uint64_t v19 = v28;
  v18[4] = v27;
  v18[5] = a2;
  v18[6] = v19;
  aBlock[4] = partial apply for closure #1 in Registry_Impl.bootstrapNotify(_:);
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_45;
  uint64_t v21 = _Block_copy(aBlock);
  id v22 = a2;
  unint64_t v23 = v4;
  id v24 = v20;
  static DispatchQoS.unspecified.getter();
  uint64_t v31 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x25A2CA960](0, v11, v8, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v29);
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
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

uint64_t specialized WeakCollection.sweep(action:)(uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 16;
  uint64_t result = swift_beginAccess();
  uint64_t v6 = *(void **)(a1 + 16);
  if (!v6[2]) {
    return result;
  }
  unint64_t v7 = 0;
  while (1)
  {
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v6[v7 + 4], (uint64_t)v14, &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    uint64_t v8 = MEMORY[0x25A2CB450](v14);
    outlined destroy of UUID?((uint64_t)v14, &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    if (v8)
    {
      uint64_t v13 = swift_unknownObjectRetain();
      MEMORY[0x25A2CA880](v13);
      if (*(void *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      uint64_t result = swift_unknownObjectRelease();
      ++v7;
      goto LABEL_9;
    }
    swift_beginAccess();
    uint64_t v9 = *(void **)v4;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)uint64_t v4 = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)v9);
      *(void *)uint64_t v4 = v9;
    }
    unint64_t v11 = v9[2];
    if (v7 >= v11) {
      break;
    }
    unint64_t v12 = v11 - 1;
    outlined destroy of UUID?((uint64_t)&v9[v7 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    if ((uint64_t)(v12 - v7) < 0) {
      goto LABEL_16;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    v9[2] = v12;
    *(void *)uint64_t v4 = v9;
    uint64_t result = swift_endAccess();
LABEL_9:
    uint64_t v6 = *(void **)v4;
    if (v7 >= *(void *)(*(void *)v4 + 16)) {
      return result;
    }
  }
  __break(1u);
LABEL_16:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined init with copy of RegistryState.LoggingInfo?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t initializeWithCopy for WeakCollection.Weak()
{
  return MEMORY[0x270FA05E0]();
}

uint64_t outlined destroy of UUID?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t destroy for WeakCollection.Weak()
{
  return MEMORY[0x270FA05E8]();
}

void Registry_Impl.getActivePairedDeviceIncludingAltAccount()(uint64_t a1)
{
  id v2 = objc_msgSend(v1, sel_getDevicesExcluding_, a1);
  type metadata accessor for PDRDevice();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v5) {
      goto LABEL_6;
    }
  }
  else if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_6:
    swift_bridgeObjectRelease();
    return;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
    MEMORY[0x25A2CAA40](0, v3);
    goto LABEL_6;
  }
  if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v4 = *(id *)(v3 + 32);
    goto LABEL_6;
  }
  __break(1u);
}

Swift::Void __swiftcall RegistryCrux.add(registry:)(PDRRegistry registry)
{
  uint64_t v2 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  unint64_t v3 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registries_);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  outlined init with take of RegistryState.LoggingInfo?((uint64_t)&v11, (uint64_t)v12, &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
  uint64_t v5 = (void *)(v4 + 16);
  swift_beginAccess();
  uint64_t v6 = *(void **)(v4 + 16);
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 16) = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6[2] + 1, 1, (unint64_t)v6);
    void *v5 = v6;
  }
  unint64_t v9 = v6[2];
  unint64_t v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v8 > 1), v9 + 1, 1, (unint64_t)v6);
    void *v5 = v6;
  }
  v6[2] = v9 + 1;
  outlined init with take of RegistryState.LoggingInfo?((uint64_t)v12, (uint64_t)&v6[v9 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
  swift_endAccess();
  swift_release();
  uint64_t v10 = *(os_unfair_lock_s **)(v1 + v2);
  swift_retain();
  os_unfair_lock_unlock(v10 + 4);
  swift_release();
}

uint64_t outlined init with take of RegistryState.LoggingInfo?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t Registry_Impl.add(delegate:)()
{
  uint64_t v1 = OBJC_IVAR___PDRRegistry_Impl_unfairLock;
  uint64_t v2 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR___PDRRegistry_Impl_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  swift_release();
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR___PDRRegistry_Impl_delegates);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  outlined init with take of WeakCollection<PDRRegistryDelegate>.Weak((uint64_t)&v11, (uint64_t)v12);
  uint64_t v4 = (void *)(v3 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void **)(v3 + 16);
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v3 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5[2] + 1, 1, (unint64_t)v5);
    void *v4 = v5;
  }
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v7 > 1), v8 + 1, 1, (unint64_t)v5);
    void *v4 = v5;
  }
  v5[2] = v8 + 1;
  outlined init with take of WeakCollection<PDRRegistryDelegate>.Weak((uint64_t)v12, (uint64_t)&v5[v8 + 4]);
  swift_endAccess();
  swift_release();
  unint64_t v9 = *(os_unfair_lock_s **)(v0 + v1);
  swift_retain();
  os_unfair_lock_unlock(v9 + 4);
  return swift_release();
}

uint64_t outlined init with take of WeakCollection<PDRRegistryDelegate>.Weak(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t initializeWithTake for WeakCollection.Weak()
{
  return MEMORY[0x270FA0608]();
}

void sub_258703D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_258703E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t type metadata accessor for PDRDevice()
{
  unint64_t result = lazy cache variable for type metadata for PDRDevice;
  if (!lazy cache variable for type metadata for PDRDevice)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for PDRDevice);
  }
  return result;
}

id Registry_Impl.init()()
{
  uint64_t v1 = OBJC_IVAR___PDRRegistry_Impl_unfairLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  *(void *)&v0[v1] = v2;
  uint64_t v3 = OBJC_IVAR___PDRRegistry_Impl_delegates;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = MEMORY[0x263F8EE78];
  *(void *)&v0[v3] = v4;
  *(void *)&v0[OBJC_IVAR___PDRRegistry_Impl_lastCompatibilityState] = 0;
  v0[OBJC_IVAR___PDRRegistry_Impl_started_] = 0;
  *(void *)&v0[OBJC_IVAR___PDRRegistry_Impl_status_] = 0;
  v0[OBJC_IVAR___PDRRegistry_Impl_amSingleton] = 0;
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for Registry_Impl();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for Registry_Impl()
{
  return self;
}

id instanceClass()
{
  if (instanceClass_onceToken != -1) {
    dispatch_once(&instanceClass_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)instanceClass_result;
  return v0;
}

uint64_t specialized Registry_Impl.getDevicesExcluding(_:)(uint64_t a1)
{
  uint64_t v50 = a1;
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  v49 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v4 - 8);
  objc_super v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  uint64_t v7 = static RegistryCrux.instance;
  uint64_t v8 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  unint64_t v9 = *(os_unfair_lock_s **)(static RegistryCrux.instance
                            + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v9 + 4);
  swift_release();
  uint64_t v11 = *(void **)(v7 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  uint64_t v10 = *(void **)(v7 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
  uint64_t v47 = *(void *)(v7 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
  unint64_t v48 = v10;
  unint64_t v12 = *(os_unfair_lock_s **)(v7 + v8);
  id v52 = v10;
  swift_retain();
  id v13 = v11;
  os_unfair_lock_unlock(v12 + 4);
  swift_release();
  swift_release();
  id v51 = v13;
  id v14 = objc_msgSend(v51, sel_allPairingIDs);
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v54 = MEMORY[0x263F8EE78];
  uint64_t v16 = *(void *)(v15 + 16);
  uint64_t v17 = v1;
  uint64_t v39 = v15;
  if (v16)
  {
    id v20 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
    uint64_t v19 = v2 + 16;
    BOOL v18 = v20;
    unint64_t v21 = v15 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
    uint64_t v22 = *(void *)(v19 + 56);
    unint64_t v45 = (unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 32);
    uint64_t v46 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v42 = (void (**)(char *, char *, uint64_t))(v19 + 16);
    uint64_t v43 = v22;
    unint64_t v41 = (void (**)(char *, uint64_t))(v19 - 8);
    unint64_t v38 = (v19 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v44 = v19;
    unint64_t v23 = v49;
    v20(v6, (char *)v21, v1);
    while (1)
    {
      v25 = *v46;
      (*v46)(v6, 0, 1, v17);
      if ((*v45)(v6, 1, v17) == 1) {
        goto LABEL_28;
      }
      unint64_t v40 = v25;
      (*v42)(v23, v6, v17);
      uint64_t v26 = (objc_class *)type metadata accessor for Device_Impl();
      uint64_t v27 = v17;
      uint64_t v28 = (char *)objc_allocWithZone(v26);
      v18(&v28[OBJC_IVAR___PDRDevice_Impl_uuid_], v23, v27);
      uint64_t v29 = &v28[OBJC_IVAR___PDRDevice_Impl_registryState];
      id v30 = v51;
      uint64_t v31 = v48;
      *(void *)uint64_t v29 = v51;
      *((void *)v29 + 1) = v31;
      *((void *)v29 + 2) = v47;
      v53.receiver = v28;
      v53.super_class = v26;
      uint64_t v17 = v27;
      id v32 = v30;
      id v33 = v52;
      char v34 = v50;
      id v35 = objc_msgSendSuper2(&v53, sel_init, v38, v39);
      (*v41)(v23, v27);
      if (v34)
      {
        if (!objc_msgSend(v35, sel_isPaired)) {
          goto LABEL_8;
        }
        if ((v34 & 2) != 0)
        {
LABEL_16:
          if (objc_msgSend(v35, sel_isArchived)) {
            goto LABEL_8;
          }
        }
      }
      else if ((v34 & 2) != 0)
      {
        goto LABEL_16;
      }
      if (((v34 & 4) == 0 || objc_msgSend(v35, sel_isActive))
        && ((v34 & 8) == 0 || (objc_msgSend(v35, sel_isActive) & 1) == 0)
        && ((v34 & 0x10) == 0 || objc_msgSend(v35, sel_isSetup))
        && ((v34 & 0x20) == 0 || (objc_msgSend(v35, sel_isAltAccount) & 1) == 0))
      {
        id v24 = v35;
        MEMORY[0x25A2CA880]();
        if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        uint64_t v17 = v27;
      }
LABEL_8:

      v21 += v43;
      if (!--v16)
      {
        v40(v6, 1, 1, v17);
        goto LABEL_28;
      }
      v18(v6, (char *)v21, v17);
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v6, 1, 1, v1);
LABEL_28:
  id v36 = v51;

  swift_bridgeObjectRelease();
  return v54;
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

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, unint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *(void *)(a4 + 24);
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
    uint64_t v8 = *(void *)(a4 + 16);
    if (v7 <= v8) {
      uint64_t v9 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<WeakCollection<PDRRegistryDelegate>.Weak>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = (unint64_t)(v10 + 4);
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = MEMORY[0x263F8EE78] + 32;
      if (result)
      {
LABEL_15:
        if ((unint64_t)v10 < a4 || v13 >= a4 + 32 + 8 * v8)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v10 != (void *)a4)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
          swift_arrayInitWithTakeBackToFront();
        }
        *(void *)(a4 + 16) = 0;
        goto LABEL_26;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v13, a4);
LABEL_26:
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
  unint64_t v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *(void *)(a4 + 24);
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
    uint64_t v8 = *(void *)(a4 + 16);
    if (v7 <= v8) {
      uint64_t v9 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<WeakCollection<PDRRegistry>.Weak>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = (unint64_t)(v10 + 4);
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = MEMORY[0x263F8EE78] + 32;
      if (result)
      {
LABEL_15:
        if ((unint64_t)v10 < a4 || v13 >= a4 + 32 + 8 * v8)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v10 != (void *)a4)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
          swift_arrayInitWithTakeBackToFront();
        }
        *(void *)(a4 + 16) = 0;
        goto LABEL_26;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v13, a4);
LABEL_26:
    swift_bridgeObjectRelease();
    return v10;
  }
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
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
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
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
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
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t __instanceClass_block_invoke()
{
  +[PDRRegistry_Impl supportsWatch];
  uint64_t result = objc_opt_class();
  instanceClass_uint64_t result = result;
  return result;
}

void type metadata accessor for PDRRegistryStatus(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t one-time initialization function for supportWatch()
{
  uint64_t v0 = self;
  uint64_t result = (uint64_t)objc_msgSend(v0, sel_isUIBuild);
  if (result)
  {
    if (one-time initialization token for demoModeEnabled != -1) {
      swift_once();
    }
    if ((static RegistryCrux.demoModeEnabled & 1) == 0)
    {
      uint64_t result = (uint64_t)objc_msgSend(v0, sel_deviceClassString);
      if (!result) {
        goto LABEL_14;
      }
      uint64_t v2 = (void *)result;
      uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v5 = v4;

      if (v3 == 0x6863746157 && v5 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t result = 1;
        goto LABEL_14;
      }
      char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v7 & 1) == 0)
      {
        uint64_t result = (uint64_t)objc_msgSend(v0, sel_amCompanion);
        goto LABEL_14;
      }
    }
    uint64_t result = 1;
  }
LABEL_14:
  static RegistryCrux.supportWatch = result;
  return result;
}

uint64_t type metadata completion function for RegistryCrux.RefreshTimings()
{
  uint64_t result = type metadata accessor for ContinuousClock.Instant();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata completion function for RegistryState.LoggingInfo()
{
  uint64_t result = type metadata accessor for ContinuousClock.Instant();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t partial apply for thunk for @callee_guaranteed () -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void partial apply for closure #2 in RegistryCrux.().init()()
{
  closure #1 in closure #1 in RegistryCrux.().init()(v0, "#refresh Bootstrap sync refresh");
}

void closure #1 in closure #1 in RegistryCrux.().init()(uint64_t a1, const char *a2)
{
  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)static Logs.framework);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl(&dword_258700000, v4, v5, a2, v6, 2u);
    MEMORY[0x25A2CB3A0](v6, -1, -1);
  }

  RegistryCrux.refresh()();
}

uint64_t outlined assign with take of RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2)
{
  uint64_t refreshed = type metadata accessor for RegistryCrux.RefreshTimings(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(refreshed - 8) + 40))(a2, a1, refreshed);
  return a2;
}

void RegistryCrux.assignNewState(_:)(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for ContinuousClock.Instant();
  uint64_t v80 = *(void *)(v8 - 8);
  uint64_t v81 = v8;
  MEMORY[0x270FA5388](v8);
  v78 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t refreshed = type metadata accessor for RegistryCrux.RefreshTimings(0);
  MEMORY[0x270FA5388](refreshed);
  uint64_t v79 = (uint64_t)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  uint64_t v12 = *(os_unfair_lock_s **)(v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v12 + 4);
  swift_release();
  v90[0] = MEMORY[0x263F8EE78];
  uint64_t v13 = swift_retain();
  specialized WeakCollection.sweep(action:)(v13, v90);
  swift_release();
  unint64_t v88 = v90[0];
  id v14 = (void *)(v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  uint64_t v15 = *(void **)(v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  uint64_t v16 = *(void **)(v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
  unint64_t v77 = *(void *)(v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
  *id v14 = a1;
  v14[1] = a2;
  v14[2] = a3;
  uint64_t v17 = *(os_unfair_lock_s **)(v4 + v11);
  swift_retain();
  id v18 = v15;
  id v19 = v16;
  id v20 = a1;
  v87 = a2;
  id v21 = a2;
  id v22 = v18;
  os_unfair_lock_unlock(v17 + 4);
  swift_release();
  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v23 = type metadata accessor for Logger();
  uint64_t v24 = __swift_project_value_buffer(v23, (uint64_t)static Logs.framework);
  swift_retain();
  uint64_t v86 = v24;
  v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  int v27 = v26;
  BOOL v28 = os_log_type_enabled(v25, v26);
  uint64_t v82 = v4;
  uint64_t v84 = a3;
  if (v28)
  {
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 33554944;
    LODWORD(v76) = v27;
    id v83 = v20;
    uint64_t v30 = v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
    swift_beginAccess();
    LOWORD(v90[0]) = *(_WORD *)(v30 + *(int *)(refreshed + 20));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v29 + 6) = 2048;
    uint64_t v75 = v29 + 8;
    uint64_t v31 = v79;
    outlined init with copy of RegistryCrux.RefreshTimings(v30, v79, type metadata accessor for RegistryCrux.RefreshTimings);
    id v32 = v78;
    static ContinuousClock.now.getter();
    ContinuousClock.Instant.duration(to:)();
    (*(void (**)(char *, uint64_t))(v80 + 8))(v32, v81);
    id v20 = v83;
    uint64_t v33 = Duration.components.getter();
    *(double *)&uint64_t v35 = (double)v33 * 1000.0 + (double)v34 * 1.0e-15;
    uint64_t v4 = v82;
    outlined destroy of RegistryCrux.RefreshTimings(v31, type metadata accessor for RegistryCrux.RefreshTimings);
    v90[0] = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_258700000, v25, (os_log_type_t)v76, "#refresh_%hx t%fms New collection swapped in", (uint8_t *)v29, 0x10u);
    MEMORY[0x25A2CB3A0](v29, -1, -1);
  }
  else
  {

    swift_release();
  }
  id v36 = v20;
  id v37 = v21;
  id v38 = v22;
  id v39 = v19;
  unint64_t v40 = v36;
  id v41 = v37;
  swift_retain();
  uint64_t v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.default.getter();
  BOOL v44 = os_log_type_enabled(v42, v43);
  id v83 = v39;
  if (v44)
  {
    uint64_t v45 = v4;
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 33555200;
    uint64_t v47 = v39;
    uint64_t v48 = v45 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
    swift_beginAccess();
    LOWORD(v90[0]) = *(_WORD *)(v48 + *(int *)(refreshed + 20));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    *(_WORD *)(v46 + 6) = 2048;

    v90[0] = v77 & 0x3FFFFFFFFFFFFFFFLL;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v46 + 16) = 2048;
    uint64_t v49 = v84;
    v90[0] = v84 & 0x3FFFFFFFFFFFFFFFLL;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl(&dword_258700000, v42, v43, "#refresh_%hx history %llu -> %llu", (uint8_t *)v46, 0x1Au);
    MEMORY[0x25A2CB3A0](v46, -1, -1);
  }
  else
  {

    swift_release();
    uint64_t v42 = v40;
    uint64_t v49 = v84;
  }

  type metadata accessor for NRMutableDeviceCollection(0, (unint64_t *)&lazy cache variable for type metadata for NRMutableDeviceCollection);
  id v50 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_diffFrom_to_, v38, v40);

  if (v50)
  {
    self;
    uint64_t v51 = swift_dynamicCastObjCClass();
    if (v51)
    {
      id v52 = (void *)v51;
      unint64_t v77 = (unint64_t)v50;
      uint64_t v75 = v88 >> 62;
      id v76 = v38;
      if (v88 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v53 = _CocoaArrayWrapper.endIndex.getter();
        if (v53) {
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v53 = *(void *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v53)
        {
LABEL_13:
          if (v53 < 1)
          {
            __break(1u);
            return;
          }
          uint64_t v54 = 0;
          unint64_t v55 = v88 & 0xC000000000000001;
          do
          {
            if (v55) {
              id v56 = (id)MEMORY[0x25A2CAA40](v54, v88);
            }
            else {
              id v56 = *(id *)(v88 + 8 * v54 + 32);
            }
            uint64_t v57 = v56;
            ++v54;
            type metadata accessor for Registry_Impl();
            swift_dynamicCastClassUnconditional();
            Registry_Impl.notify(deviceColletionDiff:state:)(v52, v40, v87, v49);
          }
          while (v53 != v54);
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v58 = v82;
      swift_retain_n();
      swift_bridgeObjectRetain();
      v59 = Logger.logObject.getter();
      os_log_type_t v60 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = swift_slowAlloc();
        *(_DWORD *)uint64_t v61 = 33555200;
        uint64_t v62 = v58 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
        swift_beginAccess();
        __int16 v63 = *(_WORD *)(v62 + *(int *)(refreshed + 20));
        swift_release();
        LOWORD(v89) = v63;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        *(_WORD *)(v61 + 6) = 2048;
        uint64_t v64 = v62;
        uint64_t v65 = v79;
        outlined init with copy of RegistryCrux.RefreshTimings(v64, v79, type metadata accessor for RegistryCrux.RefreshTimings);
        v66 = v78;
        static ContinuousClock.now.getter();
        ContinuousClock.Instant.duration(to:)();
        (*(void (**)(char *, uint64_t))(v80 + 8))(v66, v81);
        uint64_t v67 = Duration.components.getter();
        double v69 = (double)v67 * 1000.0 + (double)v68 * 1.0e-15;
        outlined destroy of RegistryCrux.RefreshTimings(v65, type metadata accessor for RegistryCrux.RefreshTimings);
        double v89 = v69;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        *(_WORD *)(v61 + 16) = 2048;
        if (v75)
        {
          swift_bridgeObjectRetain();
          uint64_t v70 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v70 = *(void *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        id v38 = v76;
        swift_bridgeObjectRelease();
        double v89 = *(double *)&v70;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_258700000, v59, v60, "#refresh_%hx t%fms %ld Registries informed", (uint8_t *)v61, 0x1Au);
        MEMORY[0x25A2CB3A0](v61, -1, -1);

        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
        swift_release_n();
        swift_bridgeObjectRelease_n();
        id v38 = v76;
      }
      goto LABEL_28;
    }
    swift_unknownObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_28:
  v71 = Logger.logObject.getter();
  os_log_type_t v72 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v71, v72))
  {
    v73 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v73 = 0;
    _os_log_impl(&dword_258700000, v71, v72, "assignNewState complete", v73, 2u);
    MEMORY[0x25A2CB3A0](v73, -1, -1);
  }
}

uint64_t one-time initialization function for framework()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logs.framework);
  __swift_project_value_buffer(v0, (uint64_t)static Logs.framework);
  return Logger.init(subsystem:category:)();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

void specialized WeakCollection.sweep(action:)(uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 16;
  swift_beginAccess();
  os_log_type_t v5 = *(void **)(a1 + 16);
  if (!v5[2]) {
    return;
  }
  unint64_t v6 = 0;
  while (1)
  {
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v5[v6 + 4], (uint64_t)v13, &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    char v7 = (void *)MEMORY[0x25A2CB450](v13);
    outlined destroy of UUID?((uint64_t)v13, &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    if (v7)
    {
      id v12 = v7;
      MEMORY[0x25A2CA880]();
      if (*(void *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();

      ++v6;
      goto LABEL_9;
    }
    swift_beginAccess();
    uint64_t v8 = *(void **)v4;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)uint64_t v4 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v8 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)v8);
      *(void *)uint64_t v4 = v8;
    }
    unint64_t v10 = v8[2];
    if (v6 >= v10) {
      break;
    }
    unint64_t v11 = v10 - 1;
    outlined destroy of UUID?((uint64_t)&v8[v6 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    if ((uint64_t)(v11 - v6) < 0) {
      goto LABEL_16;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    v8[2] = v11;
    *(void *)uint64_t v4 = v8;
    swift_endAccess();
LABEL_9:
    os_log_type_t v5 = *(void **)v4;
    if (v6 >= *(void *)(*(void *)v4 + 16)) {
      return;
    }
  }
  __break(1u);
LABEL_16:
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
}

char *one-time initialization function for instance()
{
  type metadata accessor for RegistryCrux(0);
  swift_allocObject();
  uint64_t result = RegistryCrux.().init()();
  static RegistryCrux.instance = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for RegistryCrux(uint64_t a1)
{
  return type metadata accessor for RegistryCrux(a1, (uint64_t *)&type metadata singleton initialization cache for RegistryCrux);
}

char *RegistryCrux.().init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NRMutableDeviceCollection(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F138], v4);
  static DispatchQoS.unspecified.getter();
  uint64_t v8 = MEMORY[0x263F8EE78];
  aBlock[0] = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  *(void *)(v0 + 24) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v9 = v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
  static ContinuousClock.now.getter();
  uint64_t v10 = *(int *)(type metadata accessor for RegistryCrux.RefreshTimings(0) + 20);
  aBlock[0] = 0;
  MEMORY[0x25A2CB3B0](aBlock, 8);
  *(_WORD *)(v9 + v10) = aBlock[0];
  uint64_t v11 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_lastLoggedInfo;
  uint64_t v12 = type metadata accessor for RegistryState.LoggingInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  uint64_t v14 = swift_allocObject();
  *(_DWORD *)(v14 + 16) = 0;
  *(void *)(v1 + v13) = v14;
  uint64_t v15 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registries_;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>);
  uint64_t v16 = swift_allocObject();
  *(void *)(v1 + v15) = v16;
  *(void *)(v16 + 16) = v8;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_warnedAboutEntitlement_) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_) = 0;
  uint64_t v17 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionSleeper_;
  *(_OWORD *)uint64_t v17 = 0u;
  *(_OWORD *)(v17 + 16) = 0u;
  *(unsigned char *)(v17 + 32) = 1;
  id v18 = (_OWORD *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_serviceShadow_);
  *id v18 = 0u;
  v18[1] = 0u;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___hasInternalDiagnostics) = 2;
  uint64_t v19 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___minElapsedToFireMs;
  *(void *)uint64_t v19 = 0;
  *(unsigned char *)(v19 + 8) = 1;
  uint64_t v20 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___maxElapsedToFireMs;
  *(void *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 8) = 1;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___tailspinsEnabled) = 2;
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F57720]), sel_init);
  uint64_t v22 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_;
  *(void *)uint64_t v22 = v21;
  *(_OWORD *)(v22 + 8) = xmmword_25871BFC0;
  type metadata accessor for NotifyState();
  uint64_t v23 = swift_allocObject();
  *(_DWORD *)(v23 + 40) = 0;
  *(unsigned char *)(v23 + 44) = 1;
  *(void *)(v23 + 24) = closure #1 in default argument 1 of NotifyState.init(name:_:);
  *(void *)(v23 + 32) = 0;
  uint64_t v24 = (void *)MEMORY[0x25A2CA820](0, 0xE000000000000000);
  v25 = (const char *)objc_msgSend(v24, sel_UTF8String);
  id v26 = v24;
  uint64_t result = strdup(v25);
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  *(void *)(v23 + 16) = result;
  *(void *)(v1 + 16) = v23;
  uint64_t v28 = swift_allocObject();
  *(_DWORD *)(v28 + 40) = 0;
  *(unsigned char *)(v28 + 44) = 1;
  swift_retain();
  uint64_t v29 = (void *)MEMORY[0x25A2CA820](0xD00000000000003FLL, 0x800000025871D830);
  uint64_t v30 = (const char *)objc_msgSend(v29, sel_UTF8String);
  id v31 = v29;
  uint64_t result = strdup(v30);
  if (!result)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  *(void *)(v28 + 16) = result;
  *(void *)(v28 + 24) = partial apply for closure #1 in RegistryCrux.().init();
  *(void *)(v28 + 32) = v1;
  *(void *)(v1 + 16) = v28;
  swift_release();
  swift_retain();
  NotifyState.start(bootstrap:)(0);
  swift_release();
  id v32 = *(NSObject **)(v1 + 24);
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = partial apply for closure #2 in RegistryCrux.().init();
  *(void *)(v33 + 24) = v1;
  aBlock[4] = partial apply for thunk for @callee_guaranteed () -> ();
  aBlock[5] = v33;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_144;
  uint64_t v34 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v32, v34);
  _Block_release(v34);
  LOBYTE(v32) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v32)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (one-time initialization token for framework != -1) {
LABEL_9:
  }
    swift_once();
  uint64_t v35 = type metadata accessor for Logger();
  __swift_project_value_buffer(v35, (uint64_t)static Logs.framework);
  id v36 = Logger.logObject.getter();
  os_log_type_t v37 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v36, v37))
  {
    id v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v38 = 0;
    _os_log_impl(&dword_258700000, v36, v37, "RegistryCrux fully initialized and synced", v38, 2u);
    MEMORY[0x25A2CB3A0](v38, -1, -1);
  }
  swift_release();

  return (char *)v1;
}

uint64_t type metadata accessor for NRMutableDeviceCollection(uint64_t a1, unint64_t *a2)
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

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](unint64_t *a1, uint64_t *a2)
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

BOOL NotifyState.start(bootstrap:)(char a1)
{
  uint64_t v2 = v1;
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int out_token = 0;
  uint64_t v8 = *(const char **)(v1 + 16);
  type metadata accessor for OS_dispatch_queue();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F080], v4);
  uint64_t v9 = static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  aBlock[4] = partial apply for closure #1 in NotifyState.start(bootstrap:);
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  aBlock[3] = &block_descriptor;
  uint64_t v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  uint32_t v11 = notify_register_dispatch(v8, &out_token, v9, v10);
  _Block_release(v10);

  if (!v11)
  {
    *(_DWORD *)(v2 + 40) = out_token;
    *(unsigned char *)(v2 + 44) = 0;
    if (a1) {
      (*(void (**)(uint64_t))(v2 + 24))(v2);
    }
  }
  return v11 != 0;
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

uint64_t storeEnumTagSinglePayload for RegistryState.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_258711464);
}

void RegistryCrux.refresh()()
{
  uint64_t v3 = v0;
  uint64_t v143 = *MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for RegistryState.LoggingInfo?);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v128 = (uint64_t)&v120 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v127 = (uint64_t)&v120 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v126 = (uint64_t *)((char *)&v120 - v10);
  MEMORY[0x270FA5388](v9);
  uint64_t v131 = (uint64_t)&v120 - v11;
  v139 = type metadata accessor for RegistryState.LoggingInfo();
  Class isa = v139[-1].isa;
  uint64_t v12 = MEMORY[0x270FA5388](v139);
  uint64_t v133 = (uint64_t)&v120 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v130 = (char *)&v120 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v129 = (void **)((char *)&v120 - v17);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v134 = (uint64_t)&v120 - v19;
  MEMORY[0x270FA5388](v18);
  v138 = (uint64_t *)((char *)&v120 - v20);
  uint64_t v21 = type metadata accessor for ContinuousClock.Instant();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  v140 = (char *)&v120 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t refreshed = type metadata accessor for RegistryCrux.RefreshTimings(0);
  MEMORY[0x270FA5388](refreshed);
  id v26 = (char *)&v120 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for DispatchPredicate();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (uint64_t *)((char *)&v120 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v31 = *(void **)(v3 + 24);
  *uint64_t v30 = v31;
  (*(void (**)(void *, void, uint64_t))(v28 + 104))(v30, *MEMORY[0x263F8F0E0], v27);
  id v32 = v31;
  LOBYTE(v31) = _dispatchPreconditionTest(_:)();
  uint64_t v34 = *(void (**)(void *, uint64_t))(v28 + 8);
  uint64_t v33 = v28 + 8;
  v34(v30, v27);
  if ((v31 & 1) == 0)
  {
    __break(1u);
    goto LABEL_46;
  }
  static ContinuousClock.now.getter();
  uint64_t v35 = *(int *)(refreshed + 20);
  state64[0] = 0;
  MEMORY[0x25A2CB3B0](state64, 8);
  *(_WORD *)&v26[v35] = state64[0];
  uint64_t v33 = v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
  swift_beginAccess();
  outlined assign with take of RegistryCrux.RefreshTimings((uint64_t)v26, v33);
  swift_endAccess();
  uint64_t v36 = mach_absolute_time();
  uint64_t v37 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  id v38 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v38 + 4);
  swift_release();
  uint64_t v39 = 0;
  uint64_t v40 = *(void *)(v3 + 16);
  state64[0] = 0;
  if ((*(unsigned char *)(v40 + 44) & 1) == 0)
  {
    int v41 = *(_DWORD *)(v40 + 40);
    swift_retain();
    if (notify_is_valid_token(v41))
    {
      if (*(unsigned char *)(v40 + 44))
      {
        __break(1u);
        goto LABEL_49;
      }
      notify_get_state(*(_DWORD *)(v40 + 40), state64);
    }
    swift_release();
    uint64_t v39 = state64[0];
  }
  uint64_t v42 = *(os_unfair_lock_s **)(v3 + v37);
  swift_retain();
  os_unfair_lock_unlock(v42 + 4);
  swift_release();
  if (((*(void *)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16) ^ v39) & 0x3FFFFFFFFFFFFFFFLL) != 0)
  {
    uint64_t v137 = refreshed;
    if (v39 > 0)
    {
      uint64_t v121 = v36;
      outlined init with copy of RegistryCrux.RefreshTimings(v33, (uint64_t)v26, type metadata accessor for RegistryCrux.RefreshTimings);
      os_log_type_t v43 = v140;
      static ContinuousClock.now.getter();
      ContinuousClock.Instant.duration(to:)();
      BOOL v44 = *(void (**)(char *, uint64_t))(v22 + 8);
      uint64_t v132 = v21;
      uint64_t v135 = v22 + 8;
      v125 = v44;
      v44(v43, v21);
      uint64_t v45 = Duration.components.getter();
      uint64_t v22 = v46;
      outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v26, type metadata accessor for RegistryCrux.RefreshTimings);
      if ((RegistryCrux.hasInternalDiagnostics.getter() & 1) != 0 && RegistryCrux.tailspinsEnabled.getter())
      {
        id v47 = objc_msgSend(self, sel_instance);
        objc_msgSend(v47, sel_beginFetchIntervalTrace);
      }
      id v123 = RegistryCrux.definitelyFetchRegistryState(oldToken:)(v39);
      v124 = v48;
      uint64_t v122 = v49;
      outlined init with copy of RegistryCrux.RefreshTimings(v33, (uint64_t)v26, type metadata accessor for RegistryCrux.RefreshTimings);
      id v50 = v140;
      static ContinuousClock.now.getter();
      ContinuousClock.Instant.duration(to:)();
      v125(v50, v132);
      uint64_t v51 = Duration.components.getter();
      uint64_t v53 = v52;
      outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v26, type metadata accessor for RegistryCrux.RefreshTimings);
      double v54 = RegistryCrux.minElapsedToFireMs.getter();
      double v55 = RegistryCrux.maxElapsedToFireMs.getter();
      if (v54 <= v55)
      {
        double v56 = v55;
        double v2 = 1.0e-15;
        double v1 = (double)v51 * 1000.0 + (double)v53 * 1.0e-15 - ((double)v45 * 1000.0 + (double)v22 * 1.0e-15);
        id v57 = objc_msgSend(self, sel_instance);
        uint64_t v58 = v57;
        if (v54 > v1 || v1 > v56)
        {
          objc_msgSend(v57, sel_cancelFetchIntervalTrace);
        }
        else
        {
          objc_msgSend(v57, sel_endFetchIntervalTrace);

          RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000016, 0x800000025871D230, state64);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
          swift_dynamicCast();
          objc_msgSend(*(id *)&v142, sel_xpcTriggerTailspinFrom_forApp_, v121, 0);
          swift_unknownObjectRelease();
        }
        uint64_t v22 = v137;
        uint64_t v81 = v138;
        uint64_t v82 = v139;
        if ((*(unsigned char *)(v3
                       + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___hasInternalDiagnostics) & 1) == 0)
        {
LABEL_40:
          if (one-time initialization token for framework == -1)
          {
LABEL_41:
            uint64_t v110 = type metadata accessor for Logger();
            __swift_project_value_buffer(v110, (uint64_t)static Logs.framework);
            swift_retain();
            v111 = Logger.logObject.getter();
            os_log_type_t v112 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v111, v112))
            {
              uint64_t v113 = swift_slowAlloc();
              *(_DWORD *)uint64_t v113 = 33555200;
              LOWORD(v142) = *(_WORD *)(v33 + *(int *)(v22 + 20));
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *(_WORD *)(v113 + 6) = 2048;
              outlined init with copy of RegistryCrux.RefreshTimings(v33, (uint64_t)v26, type metadata accessor for RegistryCrux.RefreshTimings);
              v114 = v140;
              static ContinuousClock.now.getter();
              ContinuousClock.Instant.duration(to:)();
              v125(v114, v132);
              uint64_t v115 = Duration.components.getter();
              double v117 = (double)v115 * 1000.0 + (double)v116 * v2;
              outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v26, type metadata accessor for RegistryCrux.RefreshTimings);
              double v142 = v117;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_release();
              *(_WORD *)(v113 + 16) = 2048;
              double v142 = v1;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              _os_log_impl(&dword_258700000, v111, v112, "#refresh_%hx t%fms definitelyFetchRegistryState complete. %fms", (uint8_t *)v113, 0x1Au);
              MEMORY[0x25A2CB3A0](v113, -1, -1);
            }
            else
            {

              swift_release();
            }
            v118 = v123;
            v119 = v124;
            RegistryCrux.assignNewState(_:)(v123, v124, v122);

            return;
          }
LABEL_47:
          swift_once();
          goto LABEL_41;
        }
        uint64_t v121 = v33;
        id v83 = v124;
        id v84 = v124;
        id v85 = v123;
        RegistryState.LoggingInfo.init(_:)(v85, v83, v122, v81);
        uint64_t v86 = v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_lastLoggedInfo;
        swift_beginAccess();
        uint64_t v87 = v131;
        outlined init with copy of RegistryState.LoggingInfo?(v86, v131, (uint64_t *)&demangling cache variable for type metadata for RegistryState.LoggingInfo?);
        unint64_t v88 = (uint64_t (*)(uint64_t, uint64_t, NSObject *))*((void *)isa + 6);
        double v89 = v82;
        int v90 = v88(v87, 1, v82);
        outlined destroy of UUID?(v87, (uint64_t *)&demangling cache variable for type metadata for RegistryState.LoggingInfo?);
        uint64_t v91 = v134;
        outlined init with copy of RegistryCrux.RefreshTimings((uint64_t)v81, v134, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
        if (v90 == 1)
        {
          outlined destroy of RegistryCrux.RefreshTimings(v91, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
          uint64_t v22 = v137;
          uint64_t v92 = (uint64_t)v130;
          uint64_t v33 = v121;
          goto LABEL_33;
        }
        v93 = v126;
        outlined init with copy of RegistryState.LoggingInfo?(v86, (uint64_t)v126, (uint64_t *)&demangling cache variable for type metadata for RegistryState.LoggingInfo?);
        if (v88((uint64_t)v93, 1, v89) != 1)
        {
          uint64_t v94 = (uint64_t)v93;
          uint64_t v95 = v134;
          char v96 = RegistryState.LoggingInfo.shouldLog(last:)(v93);
          outlined destroy of RegistryCrux.RefreshTimings(v95, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
          outlined destroy of RegistryCrux.RefreshTimings(v94, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
          uint64_t v22 = v137;
          uint64_t v92 = (uint64_t)v130;
          uint64_t v33 = v121;
          if ((v96 & 1) == 0)
          {
LABEL_39:
            outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v81, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
            goto LABEL_40;
          }
LABEL_33:
          uint64_t v97 = v127;
          outlined init with copy of RegistryCrux.RefreshTimings((uint64_t)v81, v127, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
          (*((void (**)(uint64_t, void, uint64_t, NSObject *))isa + 7))(v97, 0, 1, v139);
          uint64_t v98 = v97;
          uint64_t v99 = v128;
          outlined init with take of RegistryState.LoggingInfo?(v98, v128, (uint64_t *)&demangling cache variable for type metadata for RegistryState.LoggingInfo?);
          swift_beginAccess();
          outlined assign with take of RegistryState.LoggingInfo?(v99, v86, (uint64_t *)&demangling cache variable for type metadata for RegistryState.LoggingInfo?);
          swift_endAccess();
          if (one-time initialization token for framework != -1) {
            swift_once();
          }
          uint64_t v100 = type metadata accessor for Logger();
          __swift_project_value_buffer(v100, (uint64_t)static Logs.framework);
          v101 = v129;
          outlined init with copy of RegistryCrux.RefreshTimings((uint64_t)v81, (uint64_t)v129, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
          outlined init with copy of RegistryCrux.RefreshTimings((uint64_t)v81, v92, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
          uint64_t v102 = v133;
          outlined init with copy of RegistryCrux.RefreshTimings((uint64_t)v81, v133, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
          swift_retain();
          v103 = Logger.logObject.getter();
          os_log_type_t v104 = static os_log_type_t.default.getter();
          int v105 = v104;
          v139 = v103;
          if (os_log_type_enabled(v103, v104))
          {
            uint64_t v106 = swift_slowAlloc();
            *(_DWORD *)uint64_t v106 = 33555456;
            LOWORD(v142) = *(_WORD *)(v33 + *(int *)(v22 + 20));
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release();
            *(_WORD *)(v106 + 6) = 2048;
            LODWORD(isa) = v105;
            v107 = *v101;
            outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v101, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
            double v142 = *(double *)&v107;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *(_WORD *)(v106 + 16) = 2048;
            double v108 = *(double *)(v92 + 8);
            outlined destroy of RegistryCrux.RefreshTimings(v92, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
            double v142 = v108;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *(_WORD *)(v106 + 26) = 2048;
            double v109 = *(double *)(v133 + 16);
            outlined destroy of RegistryCrux.RefreshTimings(v133, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
            double v142 = v109;
            uint64_t v22 = v137;
            uint64_t v81 = v138;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            _os_log_impl(&dword_258700000, v139, (os_log_type_t)isa, "#refresh_%hx Device collection info after definitelyFetchRegistryState: %ld total %ld paired %ld active", (uint8_t *)v106, 0x24u);
            MEMORY[0x25A2CB3A0](v106, -1, -1);
          }
          else
          {
            outlined destroy of RegistryCrux.RefreshTimings(v102, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
            outlined destroy of RegistryCrux.RefreshTimings(v92, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
            outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v101, (uint64_t (*)(void))type metadata accessor for RegistryState.LoggingInfo);
            swift_release();
          }

          goto LABEL_39;
        }
LABEL_49:
        __break(1u);
        return;
      }
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    uint64_t v135 = v22;
    id v70 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F57720]), sel_init);
    if (one-time initialization token for framework != -1) {
      swift_once();
    }
    uint64_t v71 = type metadata accessor for Logger();
    __swift_project_value_buffer(v71, (uint64_t)static Logs.framework);
    swift_retain();
    os_log_type_t v72 = Logger.logObject.getter();
    os_log_type_t v73 = static os_log_type_t.default.getter();
    int v74 = v73;
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v75 = (_DWORD *)swift_slowAlloc();
      uint64_t v132 = v21;
      id v76 = v75;
      *uint64_t v75 = 33554944;
      LOWORD(state64[0]) = *(_WORD *)(v33 + *(int *)(v137 + 20));
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *((_WORD *)v76 + 3) = 2048;
      v139 = (v76 + 2);
      outlined init with copy of RegistryCrux.RefreshTimings(v33, (uint64_t)v26, type metadata accessor for RegistryCrux.RefreshTimings);
      unint64_t v77 = v140;
      static ContinuousClock.now.getter();
      LODWORD(v138) = v74;
      ContinuousClock.Instant.duration(to:)();
      (*(void (**)(char *, uint64_t))(v135 + 8))(v77, v132);
      uint64_t v78 = Duration.components.getter();
      double v80 = (double)v78 * 1000.0 + (double)v79 * 1.0e-15;
      outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v26, type metadata accessor for RegistryCrux.RefreshTimings);
      *(double *)state64 = v80;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl(&dword_258700000, v72, (os_log_type_t)v138, "#refresh_%hx t%fms Daemon is idle, creating empty collection", (uint8_t *)v76, 0x10u);
      MEMORY[0x25A2CB3A0](v76, -1, -1);
    }
    else
    {

      swift_release();
    }
    RegistryCrux.assignNewState(_:)(v70, 0, v39);
  }
  else
  {
    if (one-time initialization token for framework != -1) {
      swift_once();
    }
    uint64_t v59 = type metadata accessor for Logger();
    __swift_project_value_buffer(v59, (uint64_t)static Logs.framework);
    swift_retain();
    os_log_type_t v60 = Logger.logObject.getter();
    os_log_type_t v61 = static os_log_type_t.default.getter();
    int v62 = v61;
    if (os_log_type_enabled(v60, v61))
    {
      __int16 v63 = (_DWORD *)swift_slowAlloc();
      uint64_t v64 = refreshed;
      uint64_t v65 = v63;
      _DWORD *v63 = 33554944;
      LOWORD(state64[0]) = *(_WORD *)(v33 + *(int *)(v64 + 20));
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *((_WORD *)v65 + 3) = 2048;
      v138 = (uint64_t *)(v65 + 2);
      v66 = v140;
      LODWORD(v139) = v62;
      outlined init with copy of RegistryCrux.RefreshTimings(v33, (uint64_t)v26, type metadata accessor for RegistryCrux.RefreshTimings);
      static ContinuousClock.now.getter();
      ContinuousClock.Instant.duration(to:)();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v66, v21);
      uint64_t v67 = Duration.components.getter();
      double v69 = (double)v67 * 1000.0 + (double)v68 * 1.0e-15;
      outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v26, type metadata accessor for RegistryCrux.RefreshTimings);
      *(double *)state64 = v69;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl(&dword_258700000, v60, (os_log_type_t)v139, "#refresh_%hx t%fms Refresh appears unnecessary", (uint8_t *)v65, 0x10u);
      MEMORY[0x25A2CB3A0](v65, -1, -1);
    }
    else
    {

      swift_release();
    }
  }
}

uint64_t outlined init with copy of RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of RegistryCrux.RefreshTimings(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for RegistryCrux(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for RegistryCrux.RefreshTimings(uint64_t a1)
{
  return type metadata accessor for RegistryCrux(a1, (uint64_t *)&type metadata singleton initialization cache for RegistryCrux.RefreshTimings);
}

void type metadata completion function for RegistryCrux()
{
  type metadata accessor for RegistryCrux.RefreshTimings(319);
  if (v0 <= 0x3F)
  {
    type metadata accessor for RegistryState.LoggingInfo?();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void type metadata accessor for RegistryState.LoggingInfo?()
{
  if (!lazy cache variable for type metadata for RegistryState.LoggingInfo?)
  {
    type metadata accessor for RegistryState.LoggingInfo();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for RegistryState.LoggingInfo?);
    }
  }
}

uint64_t type metadata accessor for RegistryState.LoggingInfo()
{
  uint64_t result = type metadata singleton initialization cache for RegistryState.LoggingInfo;
  if (!type metadata singleton initialization cache for RegistryState.LoggingInfo) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2587084B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return MEMORY[0x270EF2BB8](v2, v1, a1);
}

uint64_t PDRRawVersionFromString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 componentsSeparatedByString:@"."];
    if ([v3 count])
    {
      uint64_t v4 = [v3 objectAtIndexedSubscript:0];
      int v5 = [v4 integerValue];

      unint64_t v6 = [v3 count];
      unsigned __int8 v7 = 0;
      unsigned int v8 = 0;
      if (v6 >= 2)
      {
        uint64_t v9 = [v3 objectAtIndexedSubscript:1];
        unsigned __int8 v7 = [v9 integerValue];

        if ((unint64_t)[v3 count] < 3)
        {
          unsigned int v8 = 0;
        }
        else
        {
          uint64_t v10 = [v3 objectAtIndexedSubscript:2];
          unsigned __int8 v11 = [v10 integerValue];

          unsigned int v8 = v11;
        }
      }
      uint64_t v12 = (v5 << 16) | (v7 << 8) | v8;
    }
    else
    {
      uint64_t v12 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }

  return v12;
}

uint64_t PDRWatchOSVersion(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (v3 && a2)
  {
    uint64_t v4 = PDRRawVersionFromString(a2);
    id v5 = v3;
    if (([v5 isEqualToString:@"Watch OS"] & 1) == 0
      && ([v5 isEqualToString:@"watchOS"] & 1) == 0)
    {
      if (v4 >> 8 == 2050 && [v5 isEqualToString:@"iPhone OS"]) {
        uint64_t v4 = v4 | 0x10000u;
      }
      else {
        uint64_t v4 = 0xFFFFFFFFLL;
      }
    }
  }
  return v4;
}

uint64_t PDRWatchOSVersionForRemoteDevice(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 valueForProperty:@"systemName"];
  id v3 = [v1 valueForProperty:@"systemVersion"];

  uint64_t v4 = PDRWatchOSVersion(v2, v3);
  return v4;
}

uint64_t PDRWatchOSVersionForLocalDevice()
{
  return 0;
}

BOOL PDRVersionIsGreaterThanOrEqual(unsigned int a1, unsigned int a2)
{
  return a1 >= a2;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t PDRDeviceSizeForProductType(uint64_t a1)
{
  id v1 = [&unk_2706C0AD0 objectForKeyedSubscript:a1];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = (int)[v1 intValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void type metadata accessor for PDRRegistryStatus(uint64_t a1)
{
}

void type metadata accessor for PDRCompatibilityState(uint64_t a1)
{
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance PDRDevicePropertyKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance PDRDevicePropertyKey(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance PDRDevicePropertyKey(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance PDRDevicePropertyKey(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PDRDevicePropertyKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = MEMORY[0x25A2CA820](v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance PDRDevicePropertyKey@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x25A2CA820](*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance PDRDevicePropertyKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance PDRDevicePropertyKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance PDRDevicePropertyKey(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance PDRDevicePropertyKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance PDRDevicePropertyKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PDRDevicePropertyKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance PDRDeviceExclusion(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PDRDeviceExclusion(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PDRDevicePropertyKey()
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

void *protocol witness for RawRepresentable.init(rawValue:) in conformance PDRCompatibilityState@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void type metadata accessor for PDRDevicePropertyKey(uint64_t a1)
{
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance PDRDevicePropertyKey(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey(&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey);
  uint64_t v3 = lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey((unint64_t *)&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t base witness table accessor for RawRepresentable in PDRDevicePropertyKey()
{
  return lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey(&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in PDRDevicePropertyKey()
{
  return lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey(&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey);
}

uint64_t lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PDRDevicePropertyKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in PDRDevicePropertyKey()
{
  return lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey(&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int32) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t partial apply for closure #1 in NotifyState.start(bootstrap:)(uint64_t result)
{
  if ((*(unsigned char *)(v1 + 44) & 1) == 0 && *(_DWORD *)(v1 + 40) == result) {
    return (*(uint64_t (**)(uint64_t))(v1 + 24))(v1);
  }
  return result;
}

uint64_t (*RegistryCrux.connectionSleeper_.modify())()
{
  return RegistryCrux.connectionSleeper_.modify;
}

uint64_t RegistryCrux.hasInternalDiagnostics.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___hasInternalDiagnostics;
  int v2 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___hasInternalDiagnostics);
  if (v2 != 2) {
    return v2 & 1;
  }
  uint64_t result = os_variant_has_internal_diagnostics();
  *(unsigned char *)(v0 + v1) = result;
  return result;
}

double RegistryCrux.minElapsedToFireMs.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___minElapsedToFireMs);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___minElapsedToFireMs + 8) & 1) == 0) {
    return *(double *)v1;
  }
  v2._object = (void *)0x800000025871D2F0;
  v2._countAndFlagsBits = 0xD000000000000012;
  Swift::Int_optional v4 = RegistryCrux.internalLongPreference(key:)(v2);
  double result = (double)v4.value;
  if (v4.is_nil) {
    double result = 30.0;
  }
  *(double *)uint64_t v1 = result;
  v1[8] = 0;
  return result;
}

Swift::Int_optional __swiftcall RegistryCrux.internalLongPreference(key:)(Swift::String key)
{
  object = key._object;
  uint64_t countAndFlagsBits = key._countAndFlagsBits;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(unsigned char *)(v3 + 24) = 1;
  RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001CLL, 0x800000025871D2C0, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCRegistryDelegate);
  swift_dynamicCast();
  Swift::Int_optional v4 = v16;
  char v5 = (void *)MEMORY[0x25A2CA820](countAndFlagsBits, object);
  uint64_t v14 = partial apply for closure #1 in RegistryCrux.internalLongPreference(key:);
  uint64_t v15 = v3;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v12 = thunk for @escaping @callee_guaranteed (@unowned Bool, @unowned Int) -> ();
  uint64_t v13 = &block_descriptor_59;
  unint64_t v6 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_xpcLongForInternalPreference_withBlock_, v5, v6);
  swift_unknownObjectRelease();
  _Block_release(v6);

  swift_beginAccess();
  Swift::Int v7 = *(void *)(v3 + 16);
  char v8 = *(unsigned char *)(v3 + 24);
  swift_release();
  Swift::Int v9 = v7;
  Swift::Bool v10 = v8;
  result.value = v9;
  result.is_nil = v10;
  return result;
}

double RegistryCrux.maxElapsedToFireMs.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___maxElapsedToFireMs);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___maxElapsedToFireMs + 8) & 1) == 0) {
    return *(double *)v1;
  }
  v2._object = (void *)0x800000025871D2A0;
  v2._uint64_t countAndFlagsBits = 0xD000000000000012;
  Swift::Int_optional v4 = RegistryCrux.internalLongPreference(key:)(v2);
  double result = (double)v4.value;
  if (v4.is_nil) {
    double result = 5000.0;
  }
  *(double *)uint64_t v1 = result;
  v1[8] = 0;
  return result;
}

BOOL RegistryCrux.tailspinsEnabled.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___tailspinsEnabled;
  int v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___tailspinsEnabled);
  if (v2 != 2) {
    return v2 & 1;
  }
  v3._object = (void *)0x800000025871D250;
  v3._uint64_t countAndFlagsBits = 0xD000000000000018;
  BOOL result = RegistryCrux.internalBoolPreference(key:)(v3).value;
  *(unsigned char *)(v0 + v1) = result;
  return result;
}

Swift::Bool_optional __swiftcall RegistryCrux.internalBoolPreference(key:)(Swift::String key)
{
  object = key._object;
  uint64_t countAndFlagsBits = key._countAndFlagsBits;
  uint64_t v3 = swift_allocObject();
  *(unsigned char *)(v3 + 16) = 2;
  RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001CLL, 0x800000025871D270, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCRegistryDelegate);
  swift_dynamicCast();
  Swift::Int_optional v4 = v13;
  char v5 = (void *)MEMORY[0x25A2CA820](countAndFlagsBits, object);
  unsigned __int8 v11 = partial apply for closure #1 in RegistryCrux.internalBoolPreference(key:);
  uint64_t v12 = v3;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  Swift::Int v9 = thunk for @escaping @callee_guaranteed (@unowned Bool, @unowned Bool) -> ();
  Swift::Bool v10 = &block_descriptor_53;
  unint64_t v6 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_xpcBooleanForInternalPreference_withBlock_, v5, v6);
  swift_unknownObjectRelease();
  _Block_release(v6);

  swift_beginAccess();
  LOBYTE(v4) = *(unsigned char *)(v3 + 16);
  swift_release();
  return (Swift::Bool_optional)v4;
}

uint64_t closure #1 in RegistryCrux.().init()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  Swift::Bool v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(void *)(a2 + 24);
  aBlock[4] = partial apply for closure #1 in closure #1 in RegistryCrux.().init();
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_147;
  unsigned __int8 v11 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v13[1] = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x25A2CA960](0, v10, v6, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

id RegistryCrux.definitelyFetchRegistryState(oldToken:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v47 = type metadata accessor for ContinuousClock.Instant();
  uint64_t v4 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v46 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t refreshed = type metadata accessor for RegistryCrux.RefreshTimings(0);
  MEMORY[0x270FA5388](refreshed);
  uint64_t v44 = (uint64_t)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v55 = 0u;
  long long v56 = 0u;
  char v57 = 1;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  uint64_t v8 = (void **)(v7 + 16);
  *(void *)(v7 + 24) = 0;
  *(void *)(v7 + 32) = 0;
  uint64_t v9 = v2 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
  swift_beginAccess();
  swift_beginAccess();
  uint64_t v43 = v9;
  swift_beginAccess();
  int v41 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v52 = 0x800000025871D1B0;
  uint64_t v51 = MEMORY[0x263F8EE58] + 8;
  *(void *)&long long v10 = 33555200;
  long long v40 = v10;
  uint64_t v42 = v54;
  while (1)
  {
    RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000027, v52, &aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCRegistryDelegate);
    swift_dynamicCast();
    uint64_t v12 = (void *)v54[4];
    uint64_t v13 = (void *)swift_allocObject();
    void v13[2] = v7;
    v13[3] = v2;
    v13[4] = a1;
    v54[2] = partial apply for closure #1 in RegistryCrux.definitelyFetchRegistryState(oldToken:);
    v54[3] = v13;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    v54[0] = thunk for @escaping @callee_guaranteed (@guaranteed NRMutableDeviceCollection?, @guaranteed NRSecureDevicePropertyStore?, @unowned UInt64, @unowned Bool) -> ();
    v54[1] = &block_descriptor_0;
    uint64_t v14 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_xpcGetDeviceCollectionWithBlock_, v14);
    _Block_release(v14);
    if (*(void *)(v7 + 16)) {
      goto LABEL_2;
    }
    uint64_t v15 = specialized getter of sleeper #1 in RegistryCrux.definitelyFetchRegistryState(oldToken:)((uint64_t)&v55);
    uint64_t v17 = v16;
    double v19 = v18;
    double v21 = v20;
    id result = objc_msgSend(self, sel_sleepForTimeInterval_, v20);
    uint64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    double v24 = v21 * 2.37137;
    if (v21 * 2.37137 > 0.01) {
      double v24 = 0.01;
    }
    *(double *)&long long v56 = v19 + v21;
    *((double *)&v56 + 1) = v24;
    char v57 = 0;
    *(void *)&long long v55 = v15 + 1;
    *((void *)&v55 + 1) = v17 << (v23 >= v17);
    if (v23 >= v17)
    {
      if (one-time initialization token for framework != -1) {
        swift_once();
      }
      uint64_t v25 = type metadata accessor for Logger();
      __swift_project_value_buffer(v25, (uint64_t)static Logs.framework);
      swift_retain();
      id v26 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.default.getter();
      int v28 = v27;
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v29 = (_DWORD *)swift_slowAlloc();
        int v50 = v28;
        uint64_t v30 = v29;
        _DWORD *v29 = v40;
        uint64_t v31 = v43;
        *((_WORD *)v30 + 2) = *(_WORD *)(v43 + *(int *)(refreshed + 20));
        *((_WORD *)v30 + 3) = 2048;
        uint64_t v48 = type metadata accessor for RegistryCrux.RefreshTimings;
        os_log_t v49 = v26;
        uint64_t v32 = v44;
        outlined init with copy of RegistryCrux.RefreshTimings(v31, v44, type metadata accessor for RegistryCrux.RefreshTimings);
        uint64_t v33 = v46;
        static ContinuousClock.now.getter();
        ContinuousClock.Instant.duration(to:)();
        (*v41)(v33, v47);
        uint64_t v34 = Duration.components.getter();
        double v36 = (double)v34 * 1000.0 + (double)v35 * 1.0e-15;
        outlined destroy of RegistryCrux.RefreshTimings(v32, v48);
        *((double *)v30 + 1) = v36;
        swift_release();
        *((_WORD *)v30 + 8) = 2048;
        *(void *)((char *)v30 + 18) = v55;
        os_log_t v37 = v49;
        _os_log_impl(&dword_258700000, v49, (os_log_type_t)v50, "#refresh_%hx t%fms definitelyFetchRegistryState at %ld retries", (uint8_t *)v30, 0x1Au);
        MEMORY[0x25A2CB3A0](v30, -1, -1);
        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
        swift_release();
      }
      goto LABEL_3;
    }
LABEL_2:
    swift_unknownObjectRelease();
LABEL_3:
    unsigned __int8 v11 = *v8;
    if (*v8)
    {
      id v38 = *(id *)(v7 + 24);
      id v39 = v11;
      swift_release();
      return v39;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized getter of sleeper #1 in RegistryCrux.definitelyFetchRegistryState(oldToken:)(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 32) & 1) == 0) {
    return *(void *)a1;
  }
  swift_beginAccess();
  uint64_t result = 0;
  *(_OWORD *)a1 = xmmword_25871BFD0;
  *(_OWORD *)(a1 + 16) = xmmword_25871BFE0;
  *(unsigned char *)(a1 + 32) = 0;
  return result;
}

void closure #1 in RegistryCrux.definitelyFetchRegistryState(oldToken:)(void *a1, void *a2, uint64_t a3, char a4, void *a5, uint64_t a6, uint64_t a7)
{
  if ((a4 & 1) == 0)
  {
    if (RegistryCrux.hasInternalDiagnostics.getter())
    {
      if (one-time initialization token for framework != -1) {
        swift_once();
      }
      uint64_t v18 = type metadata accessor for Logger();
      __swift_project_value_buffer(v18, (uint64_t)static Logs.framework);
      double v19 = Logger.logObject.getter();
      os_log_type_t v20 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v19, v20))
      {
        double v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v21 = 0;
        _os_log_impl(&dword_258700000, v19, v20, "Process is not entitled to access PairedDeviceRegistry - You MUST add the YES BOOLean entitlement 'com.apple.nano.nanoregistry.generalaccess'. This will be a fatal error.", v21, 2u);
        MEMORY[0x25A2CB3A0](v21, -1, -1);
      }
    }
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F57720]), sel_init);
    swift_beginAccess();
    uint64_t v15 = (void *)a5[2];
    uint64_t v16 = (void *)a5[3];
    a5[2] = v22;
    a5[3] = 0;
    a5[4] = a7;
    goto LABEL_11;
  }
  if (a1)
  {
    swift_beginAccess();
    unsigned __int8 v11 = (void *)a5[2];
    uint64_t v12 = (void *)a5[3];
    a5[2] = a1;
    a5[3] = a2;
    a5[4] = a3;
    id v13 = a2;
    id v14 = a1;
    uint64_t v15 = v11;
    uint64_t v16 = v12;
LABEL_11:
    outlined consume of RegistryState?(v15, v16);
    return;
  }
  __break(1u);
}

void thunk for @escaping @callee_guaranteed (@guaranteed NRMutableDeviceCollection?, @guaranteed NRSecureDevicePropertyStore?, @unowned UInt64, @unowned Bool) -> ()(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void (**)(void *, void *, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  id v11 = a2;
  id v10 = a3;
  v9(a2, a3, a4, a5);
  swift_release();
}

uint64_t RegistryCrux.deinit()
{
  swift_release();

  outlined destroy of RegistryCrux.RefreshTimings(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings, type metadata accessor for RegistryCrux.RefreshTimings);
  outlined destroy of UUID?(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_lastLoggedInfo, (uint64_t *)&demangling cache variable for type metadata for RegistryState.LoggingInfo?);
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);

  swift_release();
  outlined destroy of UUID?(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_serviceShadow_, &demangling cache variable for type metadata for Any?);
  return v0;
}

uint64_t RegistryCrux.__deallocating_deinit()
{
  RegistryCrux.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t ObjC metadata update function for RegistryCrux()
{
  return type metadata accessor for RegistryCrux(0);
}

id one-time initialization function for unifiedRemoteObjectInterface()
{
  id result = closure #1 in variable initialization expression of static RegistryCrux.unifiedRemoteObjectInterface();
  static RegistryCrux.unifiedRemoteObjectInterface = (uint64_t)result;
  return result;
}

id closure #1 in variable initialization expression of static RegistryCrux.unifiedRemoteObjectInterface()
{
  objc_msgSend(self, sel_interfaceWithProtocol_, &unk_2706C4CB8);
  id result = objc_msgSend(self, sel_enclosedClassTypes);
  if (!result)
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v1 = result;
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  specialized _copyCollectionToContiguousArray<A>(_:)(v2);
  swift_bridgeObjectRelease();
  id result = objc_msgSend(self, sel_enclosedClassTypes);
  if (!result)
  {
LABEL_5:
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v3 = result;
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  specialized Array.append<A>(contentsOf:)(v4);
  uint64_t v5 = swift_bridgeObjectRetain();
  specialized _arrayForceCast<A, B>(_:)(v5);
  swift_bridgeObjectRelease();
  id v6 = objc_allocWithZone(MEMORY[0x263EFFA08]);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_initWithArray_, isa);

  id result = (id)static Set._forceBridgeFromObjectiveC(_:result:)();
LABEL_6:
  __break(1u);
  __break(1u);
  __break(1u);
  return result;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 16);
  id v6 = *v2;
  int64_t v7 = (*v2)[2];
  int64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v3 = a1;
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v2 = v6;
  if (!isUniquelyReferenced_nonNull_native || (int64_t v10 = v6[3] >> 1, v10 < v8))
  {
    if (v7 <= v8) {
      int64_t v11 = v7 + v5;
    }
    else {
      int64_t v11 = v7;
    }
    id v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v11, 1, v6);
    *uint64_t v2 = v6;
    int64_t v10 = v6[3] >> 1;
  }
  uint64_t v12 = v6[2];
  uint64_t v13 = v10 - v12;
  uint64_t v14 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)v53, (uint64_t)&v6[5 * v12 + 4], v10 - v12, v3);
  if (v14 < v5) {
    goto LABEL_17;
  }
  if (v14)
  {
    uint64_t v15 = v6[2];
    BOOL v16 = __OFADD__(v15, v14);
    uint64_t v17 = v15 + v14;
    if (v16)
    {
      __break(1u);
      goto LABEL_22;
    }
    v6[2] = v17;
  }
  if (v14 == v13)
  {
LABEL_18:
    int64_t v4 = v6[2];
    id v6 = (void *)v53[0];
    uint64_t v42 = v53[1];
    uint64_t v13 = v55;
    if (v56)
    {
      unint64_t v19 = (v56 - 1) & v56;
      unint64_t v20 = __clz(__rbit64(v56)) | (v55 << 6);
      uint64_t v21 = v54;
LABEL_20:
      outlined init with copy of AnyHashable(v6[6] + 40 * v20, (uint64_t)&v50);
      uint64_t v3 = v13;
LABEL_44:
      outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v50, (uint64_t)&v47, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
      if (!*((void *)&v48 + 1))
      {
LABEL_82:
        outlined destroy of UUID?((uint64_t)&v50, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
        outlined consume of Set<AnyHashable>.Iterator._Variant();
        return outlined destroy of UUID?((uint64_t)&v47, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
      }
      int64_t v43 = (unint64_t)(v21 + 64) >> 6;
      while (1)
      {
        outlined destroy of UUID?((uint64_t)&v47, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
        os_log_type_t v27 = *v2;
        unint64_t v28 = (*v2)[3];
        int64_t v29 = v28 >> 1;
        if ((uint64_t)(v28 >> 1) < v4 + 1)
        {
          os_log_type_t v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v28 > 1), v4 + 1, 1, *v2);
          *uint64_t v2 = v27;
          int64_t v29 = v27[3] >> 1;
        }
        outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v50, (uint64_t)&v44, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
        if (*((void *)&v45 + 1)) {
          break;
        }
        uint64_t v34 = v3;
LABEL_81:
        outlined destroy of UUID?((uint64_t)&v44, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
        uint64_t v3 = v34;
        int64_t v31 = v4;
LABEL_47:
        (*v2)[2] = v31;
        outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v50, (uint64_t)&v47, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
        if (!*((void *)&v48 + 1)) {
          goto LABEL_82;
        }
      }
      uint64_t v30 = v27 + 4;
      if (v4 <= v29) {
        int64_t v31 = v29;
      }
      else {
        int64_t v31 = v4;
      }
      while (1)
      {
        long long v47 = v44;
        long long v48 = v45;
        uint64_t v49 = v46;
        if (v4 == v31)
        {
          outlined destroy of AnyHashable((uint64_t)&v47);
          int64_t v4 = v31;
          goto LABEL_47;
        }
        uint64_t result = outlined destroy of UUID?((uint64_t)&v50, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
        uint64_t v35 = &v30[5 * v4];
        uint64_t v36 = v49;
        long long v37 = v48;
        *(_OWORD *)uint64_t v35 = v47;
        *((_OWORD *)v35 + 1) = v37;
        v35[4] = v36;
        if (!v19) {
          break;
        }
        unint64_t v32 = __clz(__rbit64(v19));
        v19 &= v19 - 1;
        unint64_t v33 = v32 | (v3 << 6);
LABEL_55:
        outlined init with copy of AnyHashable(v6[6] + 40 * v33, (uint64_t)&v50);
        uint64_t v34 = v3;
LABEL_56:
        ++v4;
        outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v50, (uint64_t)&v44, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
        if (!*((void *)&v45 + 1)) {
          goto LABEL_81;
        }
      }
      int64_t v38 = v3 + 1;
      if (__OFADD__(v3, 1))
      {
        __break(1u);
        return result;
      }
      if (v38 >= v43)
      {
        uint64_t v34 = v3;
LABEL_64:
        unint64_t v19 = 0;
        uint64_t v52 = 0;
        uint64_t v3 = v34;
        long long v50 = 0u;
        long long v51 = 0u;
        goto LABEL_56;
      }
      unint64_t v39 = *(void *)(v42 + 8 * v38);
      if (!v39)
      {
        uint64_t v40 = v3 + 2;
        uint64_t v34 = v3 + 1;
        if (v3 + 2 >= v43) {
          goto LABEL_64;
        }
        unint64_t v39 = *(void *)(v42 + 8 * v40);
        if (!v39)
        {
          uint64_t v34 = v3 + 2;
          if (v3 + 3 >= v43) {
            goto LABEL_64;
          }
          unint64_t v39 = *(void *)(v42 + 8 * (v3 + 3));
          if (v39)
          {
            int64_t v38 = v3 + 3;
            goto LABEL_62;
          }
          uint64_t v40 = v3 + 4;
          uint64_t v34 = v3 + 3;
          if (v3 + 4 >= v43) {
            goto LABEL_64;
          }
          unint64_t v39 = *(void *)(v42 + 8 * v40);
          if (!v39)
          {
            int64_t v38 = v3 + 5;
            uint64_t v34 = v3 + 4;
            if (v3 + 5 >= v43) {
              goto LABEL_64;
            }
            unint64_t v39 = *(void *)(v42 + 8 * v38);
            if (!v39)
            {
              uint64_t v41 = v3 + 6;
              while (v43 != v41)
              {
                unint64_t v39 = *(void *)(v42 + 8 * v41++);
                if (v39)
                {
                  int64_t v38 = v41 - 1;
                  goto LABEL_62;
                }
              }
              uint64_t v34 = v43 - 1;
              goto LABEL_64;
            }
            goto LABEL_62;
          }
        }
        int64_t v38 = v40;
      }
LABEL_62:
      unint64_t v19 = (v39 - 1) & v39;
      unint64_t v33 = __clz(__rbit64(v39)) + (v38 << 6);
      uint64_t v3 = v38;
      goto LABEL_55;
    }
LABEL_22:
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
LABEL_42:
      uint64_t v21 = v1;
    }
    else
    {
      uint64_t v21 = v54;
      int64_t v23 = (unint64_t)(v54 + 64) >> 6;
      uint64_t v3 = v13;
      if (v22 < v23)
      {
        unint64_t v24 = *(void *)(v42 + 8 * v22);
        if (v24)
        {
LABEL_25:
          unint64_t v19 = (v24 - 1) & v24;
          unint64_t v20 = __clz(__rbit64(v24)) + (v22 << 6);
          uint64_t v13 = v22;
          goto LABEL_20;
        }
        int64_t v25 = v13 + 2;
        uint64_t v3 = v13 + 1;
        if (v13 + 2 < v23)
        {
          uint64_t v1 = v54;
          unint64_t v24 = *(void *)(v42 + 8 * v25);
          if (v24)
          {
LABEL_28:
            int64_t v22 = v25;
LABEL_29:
            uint64_t v21 = v54;
            goto LABEL_25;
          }
          uint64_t v3 = v13 + 2;
          if (v13 + 3 < v23)
          {
            unint64_t v24 = *(void *)(v42 + 8 * (v13 + 3));
            if (v24)
            {
              int64_t v22 = v13 + 3;
              goto LABEL_29;
            }
            int64_t v25 = v13 + 4;
            uint64_t v3 = v13 + 3;
            uint64_t v21 = v54;
            if (v13 + 4 < v23)
            {
              unint64_t v24 = *(void *)(v42 + 8 * v25);
              if (v24) {
                goto LABEL_28;
              }
              int64_t v22 = v13 + 5;
              uint64_t v3 = v13 + 4;
              uint64_t v21 = v54;
              if (v13 + 5 < v23)
              {
                unint64_t v24 = *(void *)(v42 + 8 * v22);
                if (v24) {
                  goto LABEL_25;
                }
                uint64_t v3 = v23 - 1;
                uint64_t v26 = v13 + 6;
                do
                {
                  if (v23 == v26) {
                    goto LABEL_42;
                  }
                  unint64_t v24 = *(void *)(v42 + 8 * v26++);
                }
                while (!v24);
                int64_t v22 = v26 - 1;
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
    unint64_t v19 = 0;
    uint64_t v52 = 0;
    long long v50 = 0u;
    long long v51 = 0u;
    goto LABEL_44;
  }
  return outlined consume of Set<AnyHashable>.Iterator._Variant();
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v10;
    do
    {
      outlined init with copy of AnyHashable(v4, (uint64_t)&v8);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v10;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v10;
      }
      *(void *)(v2 + 16) = v6 + 1;
      outlined init with take of Any(&v9, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 40;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t RegistryCrux.connectionLocked()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_;
  int64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_);
  if (v7)
  {
    id v8 = *(id *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_);
LABEL_16:
    id v26 = v7;
    return (uint64_t)v8;
  }
  long long aBlock = 0u;
  long long v29 = 0u;
  uint64_t v9 = v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_serviceShadow_;
  swift_beginAccess();
  outlined assign with take of RegistryState.LoggingInfo?((uint64_t)&aBlock, v9, &demangling cache variable for type metadata for Any?);
  swift_endAccess();
  uint64_t v10 = RegistryCrux.connectionSleeper_.modify();
  if (*(unsigned char *)(v11 + 32))
  {
    ((void (*)(long long *, void))v10)(&aBlock, 0);
LABEL_13:
    id v18 = objc_allocWithZone(MEMORY[0x263F08D68]);
    unint64_t v19 = (void *)MEMORY[0x25A2CA820](0xD000000000000030, 0x800000025871D7D0);
    id v20 = objc_msgSend(v18, sel_initWithMachServiceName_options_, v19, 4096);

    if (one-time initialization token for unifiedRemoteObjectInterface != -1) {
      swift_once();
    }
    objc_msgSend(v20, sel_setRemoteObjectInterface_, static RegistryCrux.unifiedRemoteObjectInterface);
    id v21 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_2706C3010);
    objc_msgSend(v20, sel_setExportedInterface_, v21);

    objc_msgSend(v20, sel_setExportedObject_, v1);
    uint64_t v30 = partial apply for closure #1 in RegistryCrux.connectionLocked();
    uint64_t v31 = v1;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v29 = thunk for @escaping @callee_guaranteed () -> ();
    *((void *)&v29 + 1) = &block_descriptor_131;
    int64_t v22 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v20, sel_setInvalidationHandler_, v22);
    _Block_release(v22);
    uint64_t v30 = closure #2 in RegistryCrux.connectionLocked();
    uint64_t v31 = 0;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v29 = thunk for @escaping @callee_guaranteed () -> ();
    *((void *)&v29 + 1) = &block_descriptor_134;
    int64_t v23 = _Block_copy(&aBlock);
    objc_msgSend(v20, sel_setInterruptionHandler_, v23);
    _Block_release(v23);
    uint64_t v24 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionSleeper_;
    swift_beginAccess();
    *(_OWORD *)uint64_t v24 = 0u;
    *(_OWORD *)(v24 + 16) = 0u;
    *(unsigned char *)(v24 + 32) = 1;
    int64_t v25 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = v20;
    id v8 = v20;

    objc_msgSend(v8, sel_activate);
    int64_t v7 = 0;
    goto LABEL_16;
  }
  Swift::Bool v12 = RetrySleeper.sleep()();
  ((void (*)(long long *, void))v10)(&aBlock, 0);
  if (!v12) {
    goto LABEL_13;
  }
  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)static Logs.framework);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v13, v2);
  swift_retain();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v14, v15))
  {

    swift_release();
    goto LABEL_12;
  }
  BOOL v16 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)BOOL v16 = 134217984;
  uint64_t v17 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionSleeper_;
  swift_beginAccess();
  if ((*(unsigned char *)(v17 + 32) & 1) == 0)
  {
    *(void *)&long long aBlock = *(void *)v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_258700000, v14, v15, "Slept %ld times on XPC connection construction", v16, 0xCu);
    MEMORY[0x25A2CB3A0](v16, -1, -1);

LABEL_12:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    goto LABEL_13;
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t closure #1 in RegistryCrux.connectionLocked()(uint64_t a1)
{
  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logs.framework);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_258700000, v3, v4, "XPC connection is invalid. Retrying eventually.", v5, 2u);
    MEMORY[0x25A2CB3A0](v5, -1, -1);
  }

  uint64_t v6 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  int64_t v7 = *(os_unfair_lock_s **)(a1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v7 + 4);
  swift_release();
  memset(v16, 0, sizeof(v16));
  uint64_t v8 = a1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_serviceShadow_;
  swift_beginAccess();
  outlined assign with take of RegistryState.LoggingInfo?((uint64_t)v16, v8, &demangling cache variable for type metadata for Any?);
  swift_endAccess();
  uint64_t v9 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_;
  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_), sel_invalidate);
  uint64_t v10 = *(void **)(a1 + v9);
  *(void *)(a1 + v9) = 0;

  uint64_t v11 = a1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionSleeper_;
  swift_beginAccess();
  if (*(unsigned char *)(v11 + 32))
  {
    long long v12 = xmmword_25871BFE0;
    long long v13 = xmmword_25871BFD0;
  }
  else
  {
    long long v13 = *(_OWORD *)v11;
    long long v12 = *(_OWORD *)(v11 + 16);
  }
  *(_OWORD *)uint64_t v11 = v13;
  *(_OWORD *)(v11 + 16) = v12;
  *(unsigned char *)(v11 + 32) = 0;
  uint64_t v14 = *(os_unfair_lock_s **)(a1 + v6);
  swift_retain();
  os_unfair_lock_unlock(v14 + 4);
  return swift_release();
}

void closure #2 in RegistryCrux.connectionLocked()()
{
  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logs.framework);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_258700000, oslog, v1, "XPC connection interrupted.", v2, 2u);
    MEMORY[0x25A2CB3A0](v2, -1, -1);
  }
}

uint64_t RegistryCrux.synchronousUntypedService(tag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v7 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  uint64_t v8 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v8 + 4);
  swift_release();
  uint64_t v9 = v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_serviceShadow_;
  swift_beginAccess();
  outlined init with copy of RegistryState.LoggingInfo?(v9, (uint64_t)&aBlock, &demangling cache variable for type metadata for Any?);
  if (v22)
  {
    outlined init with take of Any(&aBlock, a3);
LABEL_7:
    uint64_t v17 = *(os_unfair_lock_s **)(v3 + v7);
    swift_retain();
    os_unfair_lock_unlock(v17 + 4);
    return swift_release();
  }
  uint64_t v19 = v7;
  id v18 = a3;
  outlined destroy of UUID?((uint64_t)&aBlock, &demangling cache variable for type metadata for Any?);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = 0u;
  *(_OWORD *)(v10 + 32) = 0u;
  *(unsigned char *)(v10 + 48) = 1;
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 0;
  memset(v25, 0, sizeof(v25));
  swift_beginAccess();
  do
  {
    *(unsigned char *)(v11 + 16) = 0;
    long long v12 = (void *)RegistryCrux.connectionLocked()();
    long long v13 = (void *)swift_allocObject();
    void v13[2] = v11;
    v13[3] = v10;
    v13[4] = a1;
    v13[5] = a2;
    int64_t v23 = partial apply for closure #1 in RegistryCrux.synchronousUntypedService(tag:);
    uint64_t v24 = v13;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    id v21 = thunk for @escaping @callee_guaranteed (@guaranteed Error) -> ();
    int64_t v22 = &block_descriptor_128;
    uint64_t v14 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    id v15 = objc_msgSend(v12, sel_synchronousRemoteObjectProxyWithErrorHandler_, v14);
    _Block_release(v14);

    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined destroy of UUID?((uint64_t)v25, &demangling cache variable for type metadata for Any?);
    outlined init with take of RegistryState.LoggingInfo?((uint64_t)&aBlock, (uint64_t)v25, &demangling cache variable for type metadata for Any?);
  }
  while ((*(unsigned char *)(v11 + 16) & 1) != 0);
  swift_beginAccess();
  outlined assign with copy of UUID?((uint64_t)v25, v9, &demangling cache variable for type metadata for Any?);
  swift_endAccess();
  uint64_t result = outlined init with copy of RegistryState.LoggingInfo?((uint64_t)v25, (uint64_t)&aBlock, &demangling cache variable for type metadata for Any?);
  if (v22)
  {
    outlined destroy of UUID?((uint64_t)v25, &demangling cache variable for type metadata for Any?);
    outlined init with take of Any(&aBlock, v18);
    swift_release();
    swift_release();
    uint64_t v7 = v19;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t getter of sleeper #1 in RegistryCrux.synchronousUntypedService(tag:)(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
    return *(void *)(a1 + 16);
  }
  swift_beginAccess();
  uint64_t result = 0;
  *(_OWORD *)(a1 + 16) = xmmword_25871BFD0;
  *(_OWORD *)(a1 + 32) = xmmword_25871BFE0;
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

void closure #1 in RegistryCrux.synchronousUntypedService(tag:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10 = (void *)_convertErrorToNSError(_:)();
  if (objc_msgSend(v10, sel_code) != (id)4097) {
    goto LABEL_7;
  }
  id v11 = objc_msgSend(v10, sel_domain);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
LABEL_15:
    swift_beginAccess();
    *(unsigned char *)(a2 + 16) = 1;
    uint64_t v25 = getter of sleeper #1 in RegistryCrux.synchronousUntypedService(tag:)(a3);
    uint64_t v27 = v26;
    double v29 = v28;
    double v31 = v30;
    objc_msgSend(self, sel_sleepForTimeInterval_, v30);
    BOOL v32 = __OFADD__(v25, 1);
    uint64_t v33 = v25 + 1;
    if (v32)
    {
      __break(1u);
    }
    else
    {
      if (v31 * 2.37137 <= 0.01) {
        double v34 = v31 * 2.37137;
      }
      else {
        double v34 = 0.01;
      }
      swift_beginAccess();
      *(double *)(a3 + 32) = v29 + v31;
      *(double *)(a3 + 40) = v34;
      *(unsigned char *)(a3 + 48) = 0;
      *(void *)(a3 + 16) = v33;
      *(void *)(a3 + 24) = v27 << (v33 >= v27);
      if (v33 < v27) {
        goto LABEL_23;
      }
      if (one-time initialization token for framework == -1)
      {
LABEL_21:
        uint64_t v35 = type metadata accessor for Logger();
        __swift_project_value_buffer(v35, (uint64_t)static Logs.framework);
        swift_retain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v36 = Logger.logObject.getter();
        os_log_type_t v37 = static os_log_type_t.error.getter();
        if (!os_log_type_enabled(v36, v37))
        {

          swift_bridgeObjectRelease_n();
          swift_release_n();
          return;
        }
        uint64_t v38 = swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        uint64_t v41 = v39;
        *(_DWORD *)uint64_t v38 = 136315650;
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a4, a5, &v41);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v38 + 12) = 2048;
        swift_release();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        *(_WORD *)(v38 + 22) = 2048;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        _os_log_impl(&dword_258700000, v36, v37, "Service fetch for %s retried %ld times, %f seconds", (uint8_t *)v38, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x25A2CB3A0](v39, -1, -1);
        MEMORY[0x25A2CB3A0](v38, -1, -1);

LABEL_23:
        return;
      }
    }
    swift_once();
    goto LABEL_21;
  }
  char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17) {
    goto LABEL_15;
  }
LABEL_7:
  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logs.framework);
  id v19 = a1;
  id v20 = a1;
  oslog = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v21))
  {
    int64_t v22 = (uint8_t *)swift_slowAlloc();
    int64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)int64_t v22 = 138412290;
    id v24 = a1;
    uint64_t v42 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *int64_t v23 = v42;

    _os_log_impl(&dword_258700000, oslog, v21, "Failed to get service: %@", v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x25A2CB3A0](v23, -1, -1);
    MEMORY[0x25A2CB3A0](v22, -1, -1);
  }
  else
  {
  }
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

Swift::Int __swiftcall RegistryCrux.switchIndex()()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  uint64_t v2 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  uint64_t v3 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  id v4 = *(void **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
  uint64_t v6 = *(os_unfair_lock_s **)(v0 + v2);
  id v7 = *(id *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
  swift_retain();
  id v8 = v4;
  os_unfair_lock_unlock(v6 + 4);
  swift_release();
  if (v5 < 0)
  {
  }
  else
  {
    RegistryCrux.synchronousUntypedService(tag:)(0x6E49686374697773, 0xED00002928786564, &aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCRegistryDelegate);
    swift_dynamicCast();
    uint64_t v9 = v18;
    BOOL v16 = partial apply for closure #1 in RegistryCrux.switchIndex();
    uint64_t v17 = v1;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v14 = thunk for @escaping @callee_guaranteed (@unowned UInt32) -> ();
    uint64_t v15 = &block_descriptor_138;
    uint64_t v10 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_xpcSwitchIndex_, v10);

    _Block_release(v10);
    swift_unknownObjectRelease();
  }
  swift_beginAccess();
  Swift::Int v11 = *(void *)(v1 + 16);
  swift_release();
  return v11;
}

void closure #1 in RegistryCrux.switchIndex()(unsigned int a1, uint64_t a2)
{
  uint64_t v3 = a1;
  swift_beginAccess();
  *(void *)(a2 + 16) = v3;
  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logs.framework);
  swift_retain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v7 = 134217984;
    swift_beginAccess();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_258700000, v5, v6, "Fetched new switchIndex: %ld", v7, 0xCu);
    MEMORY[0x25A2CB3A0](v7, -1, -1);
  }
  else
  {

    swift_release();
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned UInt32) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t closure #1 in RegistryCrux.deviceIDAtSwitchIndex(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_projectBox();
  uint64_t v5 = swift_projectBox();
  swift_beginAccess();
  outlined assign with copy of UUID?(a1, v4, &demangling cache variable for type metadata for UUID?);
  swift_beginAccess();
  return outlined assign with copy of UUID?(a2, v5, (uint64_t *)&demangling cache variable for type metadata for Date?);
}

void *RegistryCrux.unpair(pairingID:options:)()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001ALL, 0x800000025871D570, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  uint64_t v1 = v13;
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  Class v3 = Dictionary._bridgeToObjectiveC()().super.isa;
  Swift::Int v11 = partial apply for closure #1 in RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:);
  uint64_t v12 = v0;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v9 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  uint64_t v10 = &block_descriptor_118;
  uint64_t v4 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_xpcUnpairWithDeviceID_withOptions_operationHasBegun_, isa, v3, v4);
  swift_unknownObjectRelease();
  _Block_release(v4);

  swift_beginAccess();
  uint64_t v5 = *(void **)(v0 + 16);
  id v6 = v5;
  swift_release();
  return v5;
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  Class v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void *RegistryCrux.failsafeUnpair(options:)()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000018, 0x800000025871D550, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  uint64_t v1 = v12;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t v10 = partial apply for closure #1 in RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:);
  uint64_t v11 = v0;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  id v8 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  uint64_t v9 = &block_descriptor_114;
  Class v3 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_xpcUnpairWithDeviceID_withOptions_operationHasBegun_, 0, isa, v3);
  swift_unknownObjectRelease();
  _Block_release(v3);

  swift_beginAccess();
  id v4 = *(void **)(v0 + 16);
  id v5 = v4;
  swift_release();
  return v4;
}

uint64_t RegistryCrux.setActive(device:)(void *a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000012, 0x800000025871D510, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  id v6 = (void *)v17[1];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0xE000000000000000;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  id v9 = objc_msgSend(a1, sel_pairingID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  *(void *)(v11 + 24) = v7;
  os_log_type_t v21 = partial apply for closure #1 in RegistryCrux.setActive(device:);
  uint64_t v22 = v11;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  id v19 = thunk for @escaping @callee_guaranteed (@guaranteed Error?, @guaranteed String?) -> ();
  id v20 = &block_descriptor_110;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler_, isa, v12);
  swift_unknownObjectRelease();
  _Block_release(v12);

  swift_beginAccess();
  uint64_t v13 = *(void *)(v7 + 16);
  swift_beginAccess();
  uint64_t v14 = *(void **)(v8 + 16);
  swift_bridgeObjectRetain();
  id v15 = v14;
  swift_release();
  swift_release();
  return v13;
}

void closure #1 in RegistryCrux.setActive(device:)(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    swift_beginAccess();
    uint64_t v7 = *(void **)(a4 + 16);
    *(void *)(a4 + 16) = a1;
    id v8 = a1;
  }
  else
  {
    if (a3) {
      uint64_t v10 = a2;
    }
    else {
      uint64_t v10 = 0;
    }
    if (a3) {
      unint64_t v11 = a3;
    }
    else {
      unint64_t v11 = 0xE000000000000000;
    }
    swift_beginAccess();
    *(void *)(a5 + 16) = v10;
    *(void *)(a5 + 24) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Error?, @guaranteed String?) -> ()(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void *, uint64_t, uint64_t))(a1 + 32);
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a2;
  v4(a2, v5, v7);
  swift_release();

  return swift_bridgeObjectRelease();
}

Swift::Bool __swiftcall RegistryCrux.isAssertionActive(identifier:)(Swift::String identifier)
{
  object = identifier._object;
  uint64_t countAndFlagsBits = identifier._countAndFlagsBits;
  RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001ELL, 0x800000025871D390, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  uint64_t v3 = v14;
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = 0;
  uint64_t v5 = (void *)MEMORY[0x25A2CA820](countAndFlagsBits, object);
  uint64_t v12 = partial apply for closure #1 in RegistryCrux.isAssertionActive(identifier:);
  uint64_t v13 = v4;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v10 = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ();
  unint64_t v11 = &block_descriptor_66;
  uint64_t v6 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_xpcIsAssertionActive_withCompletion_, v5, v6);
  swift_unknownObjectRelease();
  _Block_release(v6);

  swift_beginAccess();
  char v7 = *(unsigned char *)(v4 + 16);
  swift_release();
  return v7;
}

void thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
}

{
  void (*v5)(uint64_t, void *);
  id v6;
  uint64_t vars8;

  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  uint64_t v6 = a3;
  v5(a2, a3);
  swift_release();
}

Swift::Void __swiftcall RegistryCrux.invalidateSwitchAssertion(identifier:)(Swift::String identifier)
{
  object = identifier._object;
  uint64_t countAndFlagsBits = identifier._countAndFlagsBits;
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000026, 0x800000025871D340, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  uint64_t v3 = v11;
  uint64_t v4 = (void *)MEMORY[0x25A2CA820](countAndFlagsBits, object);
  id v9 = closure #1 in RegistryCrux.invalidateSwitchAssertion(identifier:);
  uint64_t v10 = 0;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  char v7 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  id v8 = &block_descriptor_62;
  uint64_t v5 = _Block_copy(&aBlock);
  objc_msgSend(v3, sel_xpcInvalidateSwitchAssertionWithIdentifier_block_, v4, v5);
  _Block_release(v5);
  swift_unknownObjectRelease();
}

void closure #1 in RegistryCrux.invalidateSwitchAssertion(identifier:)(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    if (one-time initialization token for framework != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)static Logs.framework);
    id v4 = a1;
    id v5 = a1;
    oslog = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v6))
    {
      char v7 = (uint8_t *)swift_slowAlloc();
      id v8 = (void *)swift_slowAlloc();
      *(_DWORD *)char v7 = 138412290;
      id v9 = a1;
      uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v8 = v11;

      _os_log_impl(&dword_258700000, oslog, v6, "Invalidation failed (daemon crashed?): %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x25A2CB3A0](v8, -1, -1);
      MEMORY[0x25A2CB3A0](v7, -1, -1);
    }
    else
    {
    }
  }
}

Swift::Int __swiftcall RegistryCrux.lastSyncSwitchIndex()()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  uint64_t v3 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  id v4 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  id v5 = *(void **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
  char v7 = *(os_unfair_lock_s **)(v0 + v3);
  id v8 = *(id *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
  swift_retain();
  id v9 = v5;
  os_unfair_lock_unlock(v7 + 4);
  swift_release();
  if (v6 < 0)
  {
  }
  else
  {
    uint64_t v25 = v8;
    RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000015, 0x800000025871D4F0, &aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
    swift_dynamicCast();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v1;
    *(void *)(v10 + 24) = v2;
    double v30 = partial apply for closure #1 in RegistryCrux.lastSyncSwitchIndex();
    uint64_t v31 = v10;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    double v28 = thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed Error?) -> ();
    double v29 = &block_descriptor_100;
    uint64_t v11 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v26, sel_xpcGetLastSwitchIndex_, v11);
    _Block_release(v11);
    swift_beginAccess();
    uint64_t v12 = *(void **)(v2 + 16);
    if (v12)
    {
      id v24 = v9;
      uint64_t v13 = one-time initialization token for framework;
      id v14 = v12;
      if (v13 != -1) {
        swift_once();
      }
      uint64_t v15 = type metadata accessor for Logger();
      __swift_project_value_buffer(v15, (uint64_t)static Logs.framework);
      id v16 = v14;
      uint64_t v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v17, v18))
      {
        id v19 = (uint8_t *)swift_slowAlloc();
        id v20 = (void *)swift_slowAlloc();
        *(_DWORD *)id v19 = 138412290;
        *(void *)&long long aBlock = v16;
        id v21 = v16;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v20 = v12;

        _os_log_impl(&dword_258700000, v17, v18, "Failed to get switchIndex value from CFPrefs: %@", v19, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x25A2CB3A0](v20, -1, -1);
        MEMORY[0x25A2CB3A0](v19, -1, -1);

        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    else
    {

      swift_unknownObjectRelease();
    }
  }
  swift_beginAccess();
  Swift::Int v22 = *(void *)(v1 + 16);
  swift_release();
  swift_release();
  return v22;
}

void closure #1 in RegistryCrux.lastSyncSwitchIndex()(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char v7 = (void **)(a4 + 16);
  swift_beginAccess();
  *(void *)(a3 + 16) = a1;
  if (a2)
  {
    id v8 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    type metadata accessor for NRMutableDeviceCollection(0, &lazy cache variable for type metadata for NSError);
    if (swift_dynamicCast()) {
      a2 = v14;
    }
    else {
      a2 = 0;
    }
  }
  swift_beginAccess();
  id v9 = *v7;
  *char v7 = a2;

  if (one-time initialization token for framework != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Logs.framework);
  swift_retain();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134217984;
    swift_beginAccess();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_258700000, v11, v12, "Fetched lastSyncSwitchIndex: %ld", v13, 0xCu);
    MEMORY[0x25A2CB3A0](v13, -1, -1);
  }
  else
  {

    swift_release();
  }
}

void thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t RegistryCrux.migrationCount(pairingID:)()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001ALL, 0x800000025871D4B0, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  uint64_t v1 = v11;
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v9 = partial apply for closure #1 in RegistryCrux.migrationCount(pairingID:);
  uint64_t v10 = v0;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  char v7 = thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed Error?) -> ();
  id v8 = &block_descriptor_90;
  uint64_t v3 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_xpcGetMigrationCountForPairingID_completion_, isa, v3);
  swift_unknownObjectRelease();
  _Block_release(v3);

  swift_beginAccess();
  uint64_t v4 = *(void *)(v0 + 16);
  swift_release();
  return v4;
}

uint64_t RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000034, 0x800000025871D440, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  id v5 = v16;
  id v6 = (void *)MEMORY[0x25A2CA820](a1, a2);
  id v14 = partial apply for closure #1 in RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:);
  uint64_t v15 = v4;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  os_log_type_t v12 = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed NRWatchPairingExtendedMetadata?) -> ();
  uint64_t v13 = &block_descriptor_84;
  char v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName_completion_, v6, v7);
  swift_unknownObjectRelease();
  _Block_release(v7);

  swift_beginAccess();
  uint64_t v8 = *(unsigned __int8 *)(v4 + 16);
  id v9 = *(id *)(v4 + 24);
  swift_release();
  return v8;
}

void closure #1 in RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(char a1, void *a2, uint64_t a3)
{
  swift_beginAccess();
  *(unsigned char *)(a3 + 16) = a1;
  id v6 = *(void **)(a3 + 24);
  *(void *)(a3 + 24) = a2;
  id v7 = a2;
}

void thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed NRWatchPairingExtendedMetadata?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t RegistryCrux.completeRTCPairingMetric(metricID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000023, 0x800000025871D410, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  id v5 = v16;
  id v6 = (void *)MEMORY[0x25A2CA820](a1, a2);
  id v14 = partial apply for closure #1 in RegistryCrux.completeRTCPairingMetric(metricID:);
  uint64_t v15 = v4;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  os_log_type_t v12 = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ();
  uint64_t v13 = &block_descriptor_78;
  id v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_xpcSubmitRTCPairingMetricForMetricID_withSuccess_, v6, v7);
  swift_unknownObjectRelease();
  _Block_release(v7);

  swift_beginAccess();
  uint64_t v8 = *(unsigned __int8 *)(v4 + 16);
  id v9 = *(id *)(v4 + 24);
  swift_release();
  return v8;
}

void closure #1 in RegistryCrux.completeRTCPairingMetric(metricID:)(char a1, void *a2, uint64_t a3)
{
  swift_beginAccess();
  *(unsigned char *)(a3 + 16) = a1;
  id v6 = *(void **)(a3 + 24);
  *(void *)(a3 + 24) = a2;
  id v7 = a2;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Bool, @unowned Int) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Bool, @unowned Bool) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

void *RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v23 = a4;
  id v24 = a5;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000030, 0x800000025871D3D0, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  uint64_t v13 = v30;
  id v14 = (void *)MEMORY[0x25A2CA820](a1, a2);
  uint64_t v15 = (void *)MEMORY[0x25A2CA820](a3, v23);
  id v16 = objc_msgSend(v24, sel_pairingID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v28 = partial apply for closure #1 in RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:);
  uint64_t v29 = v12;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v26 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  uint64_t v27 = &block_descriptor_72;
  os_log_type_t v18 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion_, v14, v15, isa, v18);
  swift_unknownObjectRelease();
  _Block_release(v18);

  swift_beginAccess();
  id v19 = *(void **)(v12 + 16);
  id v20 = v19;
  swift_release();
  return v19;
}

void closure #1 in RegistryCrux.unpair(pairingID:options:)(void *a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = a1;
  id v5 = a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for RegistryCrux.RefreshTimings(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for ContinuousClock.Instant();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(_WORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_WORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for RegistryCrux.RefreshTimings(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContinuousClock.Instant();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(_WORD *)(a1 + *(int *)(a3 + 20)) = *(_WORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(_WORD *)(a1 + *(int *)(a3 + 20)) = *(_WORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_WORD *)(a1 + *(int *)(a3 + 20)) = *(_WORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_WORD *)(a1 + *(int *)(a3 + 20)) = *(_WORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25870E994);
}

uint64_t sub_25870E994(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContinuousClock.Instant();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25870EA14);
}

uint64_t sub_25870EA14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContinuousClock.Instant();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
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

uint64_t sub_25870EAF0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
  }
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25870EB34()
{
  return objectdestroy_46Tm(40);
}

void partial apply for closure #1 in RegistryCrux.definitelyFetchRegistryState(oldToken:)(void *a1, void *a2, uint64_t a3, char a4)
{
  closure #1 in RegistryCrux.definitelyFetchRegistryState(oldToken:)(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32));
}

void outlined consume of RegistryState?(void *a1, void *a2)
{
  if (a1)
  {
  }
}

uint64_t sub_25870EB88()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t partial apply for closure #1 in RegistryCrux.internalBoolPreference(key:)(uint64_t result, char a2)
{
  if (result)
  {
    char v3 = a2 & 1;
    uint64_t result = swift_beginAccess();
    *(unsigned char *)(v2 + 16) = v3;
  }
  return result;
}

uint64_t sub_25870EBE0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in RegistryCrux.internalLongPreference(key:)(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t result = swift_beginAccess();
    *(void *)(v2 + 16) = a2;
    *(unsigned char *)(v2 + 24) = 0;
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

uint64_t partial apply for closure #1 in RegistryCrux.isAssertionActive(identifier:)(char a1, uint64_t a2)
{
  char v3 = (a2 != 0) & a1;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v2 + 16) = v3;
  return result;
}

uint64_t sub_25870F2E0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for closure #1 in RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:)(void *a1)
{
  closure #1 in RegistryCrux.unpair(pairingID:options:)(a1, v1);
}

uint64_t sub_25870F334()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in RegistryCrux.completeRTCPairingMetric(metricID:)(char a1, void *a2)
{
  closure #1 in RegistryCrux.completeRTCPairingMetric(metricID:)(a1, a2, v2);
}

uint64_t sub_25870F374()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(char a1, void *a2)
{
  closure #1 in RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(a1, a2, v2);
}

uint64_t sub_25870F3B4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in RegistryCrux.migrationCount(pairingID:)(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_25870F404()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25870F43C()
{
  return objectdestroy_46Tm(32);
}

void partial apply for closure #1 in RegistryCrux.lastSyncSwitchIndex()(uint64_t a1, void *a2)
{
  closure #1 in RegistryCrux.lastSyncSwitchIndex()(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_25870F44C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25870F484()
{
  return objectdestroy_46Tm(32);
}

uint64_t objectdestroy_46Tm(uint64_t a1)
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

void partial apply for closure #1 in RegistryCrux.setActive(device:)(void *a1, uint64_t a2, unint64_t a3)
{
  closure #1 in RegistryCrux.setActive(device:)(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_25870F4E0()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25870F4F0()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void partial apply for closure #1 in RegistryCrux.synchronousUntypedService(tag:)(void *a1)
{
  closure #1 in RegistryCrux.synchronousUntypedService(tag:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t outlined assign with copy of UUID?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24))(a2, a1, v5);
  return a2;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t outlined assign with take of RegistryState.LoggingInfo?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #1 in RegistryCrux.connectionLocked()()
{
  return closure #1 in RegistryCrux.connectionLocked()(v0);
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnyHashable>);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 40);
  uint64_t v5 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  outlined consume of Set<AnyHashable>.Iterator._Variant();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
LABEL_36:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v13;
  }
  if (!a3)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v22 = -1 << *(unsigned char *)(a4 + 32);
  while (v9)
  {
    unint64_t v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v16 = v15 | (v12 << 6);
LABEL_9:
    ++v13;
    uint64_t result = outlined init with copy of AnyHashable(*(void *)(a4 + 48) + 40 * v16, (uint64_t)v23);
    uint64_t v17 = v24;
    long long v18 = v23[1];
    *(_OWORD *)uint64_t v11 = v23[0];
    *(_OWORD *)(v11 + 16) = v18;
    *(void *)(v11 + 32) = v17;
    v11 += 40;
    if (v13 == a3)
    {
      uint64_t v13 = a3;
LABEL_35:
      uint64_t v7 = v22;
      goto LABEL_36;
    }
  }
  int64_t v19 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v19 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v19);
  if (v20) {
    goto LABEL_23;
  }
  int64_t v21 = v12 + 2;
  ++v12;
  if (v19 + 1 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20) {
    goto LABEL_16;
  }
  int64_t v12 = v19 + 1;
  if (v19 + 2 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * (v19 + 2));
  if (v20)
  {
    v19 += 2;
    goto LABEL_23;
  }
  int64_t v12 = v19 + 2;
  if (v19 + 3 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * (v19 + 3));
  if (v20)
  {
    v19 += 3;
    goto LABEL_23;
  }
  int64_t v21 = v19 + 4;
  int64_t v12 = v19 + 3;
  if (v19 + 4 >= v14)
  {
LABEL_34:
    unint64_t v9 = 0;
    goto LABEL_35;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
LABEL_16:
    int64_t v19 = v21;
LABEL_23:
    unint64_t v9 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v19 << 6);
    int64_t v12 = v19;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v19 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v19 >= v14)
    {
      int64_t v12 = v14 - 1;
      goto LABEL_34;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v21;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t outlined consume of Set<AnyHashable>.Iterator._Variant()
{
  return swift_release();
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

void partial apply for closure #1 in RegistryCrux.switchIndex()(unsigned int a1)
{
  closure #1 in RegistryCrux.switchIndex()(a1, v1);
}

uint64_t partial apply for closure #1 in RegistryCrux.().init()(uint64_t a1)
{
  return closure #1 in RegistryCrux.().init()(a1, v1);
}

uint64_t sub_25870FA98()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in closure #1 in RegistryCrux.().init()()
{
  closure #1 in closure #1 in RegistryCrux.().init()(v0, "#refresh Starting async refresh");
}

id Registry_Stub.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id Registry_Stub.init()()
{
  uint64_t v1 = OBJC_IVAR___PDRRegistry_Stub_unfairLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  *(void *)&v0[v1] = v2;
  uint64_t v3 = OBJC_IVAR___PDRRegistry_Stub_delegates;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = MEMORY[0x263F8EE78];
  *(void *)&v0[v3] = v4;
  *(void *)&v0[OBJC_IVAR___PDRRegistry_Stub_lastCompatibilityState] = 0;
  v0[OBJC_IVAR___PDRRegistry_Stub_started_] = 0;
  *(void *)&v0[OBJC_IVAR___PDRRegistry_Stub_status_] = 0;
  v0[OBJC_IVAR___PDRRegistry_Stub_amSingleton] = 0;
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for Registry_Stub();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for Registry_Stub()
{
  return self;
}

Swift::Void __swiftcall Registry_Stub.stop()()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR___PDRRegistry_Stub_started_) != 1
    || (*(unsigned char *)(v0 + OBJC_IVAR___PDRRegistry_Stub_amSingleton) & 1) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *(unsigned char *)(v0 + OBJC_IVAR___PDRRegistry_Stub_started_) = 0;
  }
}

uint64_t Registry_Stub.add(delegate:)()
{
  uint64_t v1 = OBJC_IVAR___PDRRegistry_Stub_unfairLock;
  uint64_t v2 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR___PDRRegistry_Stub_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  swift_release();
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR___PDRRegistry_Stub_delegates);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  outlined init with take of WeakCollection<PDRRegistryDelegate>.Weak((uint64_t)&v11, (uint64_t)v12);
  uint64_t v4 = (void *)(v3 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void **)(v3 + 16);
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v3 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5[2] + 1, 1, (unint64_t)v5);
    void *v4 = v5;
  }
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v7 > 1), v8 + 1, 1, (unint64_t)v5);
    void *v4 = v5;
  }
  v5[2] = v8 + 1;
  outlined init with take of WeakCollection<PDRRegistryDelegate>.Weak((uint64_t)v12, (uint64_t)&v5[v8 + 4]);
  swift_endAccess();
  swift_release();
  unint64_t v9 = *(os_unfair_lock_s **)(v0 + v1);
  swift_retain();
  os_unfair_lock_unlock(v9 + 4);
  return swift_release();
}

uint64_t Registry_Stub.remove(delegate:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR___PDRRegistry_Stub_unfairLock;
  uint64_t v4 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR___PDRRegistry_Stub_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR___PDRRegistry_Stub_delegates);
  unsigned __int8 v10 = 0;
  swift_unknownObjectRetain();
  uint64_t v6 = swift_retain();
  specialized WeakCollection.sweep(action:)(v6, a1, v5, &v10);
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v7 = v10;
  unint64_t v8 = *(os_unfair_lock_s **)(v1 + v3);
  swift_retain();
  os_unfair_lock_unlock(v8 + 4);
  swift_release();
  return v7;
}

id @objc Registry_Stub.device(forBluetoothID:)()
{
  uint64_t v0 = type metadata accessor for UUID();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

id Registry_Stub.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Registry_Stub();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t Registry_Stub.unpair(device:options:)()
{
  return 0;
}

uint64_t Registry_Stub.failsafeUnpair(options:)()
{
  return 0;
}

uint64_t Registry_Stub.setActive(device:results:)(uint64_t a1, uint64_t (*a2)(void, void))
{
  return a2(0, 0);
}

Swift::Int __swiftcall Registry_Stub.lastSyncSwitchIndex()()
{
  return 0;
}

uint64_t Registry_Stub.migrationCount(pairingID:)()
{
  return 0;
}

uint64_t Registry_Stub.waitForPairingExtendedMetadata(advertisedName:results:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void))
{
  return a3(0, 0);
}

uint64_t Registry_Stub.completeRTCPairingMetric(metricID:completion:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void))
{
  return a3(0, 0);
}

void @objc Registry_Stub.waitForPairingExtendedMetadata(advertisedName:results:)(void *a1, int a2, int a3, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v6 = (void (*)(void *, void, void))v5[2];
  id v7 = a1;
  v6(v5, 0, 0);
  _Block_release(v5);
}

uint64_t Registry_Stub.pairingClientSetAltAccount(name:altDSID:device:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  return a6(0);
}

Swift::Int __swiftcall Registry_Stub.maxPairedDeviceCount()()
{
  return 0;
}

Swift::Int __swiftcall Registry_Stub.maxTinkerPairedDeviceCount()()
{
  return 0;
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnyHashable>);
      unsigned __int8 v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      int64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unsigned __int8 v10 = (void *)MEMORY[0x263F8EE78];
      int64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t method lookup function for Registry_Stub(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Registry_Stub);
}

char *String.strdup()()
{
  uint64_t v0 = (void *)MEMORY[0x25A2CA820]();
  uint64_t v1 = (const char *)objc_msgSend(v0, sel_UTF8String);
  id v2 = v0;
  uint64_t result = strdup(v1);
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for RetrySleeper(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for RetrySleeper(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RetrySleeper(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for RetrySleeper()
{
  return &type metadata for RetrySleeper;
}

Swift::Bool __swiftcall RetrySleeper.sleep()()
{
  uint64_t v1 = self;
  double v2 = *(double *)(v0 + 24);
  Swift::Bool result = objc_msgSend(v1, sel_sleepForTimeInterval_, v2);
  double v4 = v2 * 2.37137;
  if (v2 * 2.37137 > 0.01) {
    double v4 = 0.01;
  }
  *(double *)(v0 + 16) = v2 + *(double *)(v0 + 16);
  *(double *)(v0 + 24) = v4;
  uint64_t v5 = *(void *)v0 + 1;
  if (__OFADD__(*(void *)v0, 1))
  {
    __break(1u);
  }
  else
  {
    *(void *)uint64_t v0 = v5;
    uint64_t v6 = *(void *)(v0 + 8);
    if (v5 >= v6) {
      *(void *)(v0 + 8) = 2 * v6;
    }
    return v5 >= v6;
  }
  return result;
}

char *one-time initialization function for notify()
{
  type metadata accessor for NotifyState();
  uint64_t v0 = swift_allocObject();
  *(_DWORD *)(v0 + 40) = 0;
  *(unsigned char *)(v0 + 44) = 1;
  uint64_t v1 = (void *)MEMORY[0x25A2CA820](0xD000000000000025, 0x800000025871DB70);
  double v2 = (const char *)objc_msgSend(v1, sel_UTF8String);
  id v3 = v1;
  Swift::Bool result = strdup(v2);
  if (result)
  {
    *(void *)(v0 + 16) = result;
    *(void *)(v0 + 24) = closure #1 in default argument 1 of NotifyState.init(name:_:);
    *(void *)(v0 + 32) = 0;
    Swift::Bool result = (char *)NotifyState.start(bootstrap:)(0);
    static ConnectivityStatus_Impl.notify = (_UNKNOWN *)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id ConnectivityStatus_Impl.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ConnectivityStatus_Impl.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConnectivityStatus_Impl();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ConnectivityStatus_Impl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConnectivityStatus_Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t specialized static ConnectivityStatus_Impl.currentConnectivity()()
{
  v3[1] = *MEMORY[0x263EF8340];
  if (one-time initialization token for notify != -1) {
    swift_once();
  }
  uint64_t result = 0;
  id v1 = static ConnectivityStatus_Impl.notify;
  v3[0] = 0;
  if ((*((unsigned char *)static ConnectivityStatus_Impl.notify + 44) & 1) == 0)
  {
    int v2 = *((_DWORD *)static ConnectivityStatus_Impl.notify + 10);
    swift_retain();
    uint64_t result = notify_is_valid_token(v2);
    if (result)
    {
      if (v1[11])
      {
        __break(1u);
      }
      else
      {
        notify_get_state(v1[10], v3);
        swift_release();
        return v3[0];
      }
    }
    else
    {
      swift_release();
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ConnectivityStatus_Impl()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for RegistryState(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  double v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for RegistryState(uint64_t a1)
{
  int v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for RegistryState(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RegistryState(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for RegistryState(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RegistryState(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RegistryState()
{
  return &type metadata for RegistryState;
}

uint64_t *initializeBufferWithCopyOfBuffer for RegistryState.LoggingInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  id v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *id v3 = *a2;
    id v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    uint64_t v5 = *(int *)(a3 + 28);
    id v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = type metadata accessor for ContinuousClock.Instant();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for RegistryState.LoggingInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 28);
  uint64_t v3 = type metadata accessor for ContinuousClock.Instant();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

uint64_t initializeWithCopy for RegistryState.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *assignWithCopy for RegistryState.LoggingInfo(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

uint64_t initializeWithTake for RegistryState.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for RegistryState.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for RegistryState.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2587113F4);
}

uint64_t sub_2587113F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 28);
  uint64_t v5 = type metadata accessor for ContinuousClock.Instant();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  return v6(v4, a2, v5);
}

uint64_t sub_258711464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 28);
  uint64_t v6 = type metadata accessor for ContinuousClock.Instant();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, a2, a2, v6);
}

uint64_t RegistryState.LoggingInfo.shouldLog(last:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for RegistryState.LoggingInfo();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v31 = (uint64_t)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v30 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  int64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  unint64_t v15 = (char *)&v30 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  long long v18 = (char *)&v30 - v17;
  MEMORY[0x270FA5388](v16);
  unint64_t v20 = (char *)&v30 - v19;
  uint64_t v21 = *v2;
  uint64_t v22 = *a1;
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)v2, (uint64_t)&v30 - v19);
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)a1, (uint64_t)v18);
  if (v21 != v22)
  {
    outlined destroy of RegistryState.LoggingInfo((uint64_t)v18);
    outlined destroy of RegistryState.LoggingInfo((uint64_t)v20);
    outlined init with copy of RegistryState.LoggingInfo((uint64_t)v2, (uint64_t)v15);
    outlined init with copy of RegistryState.LoggingInfo((uint64_t)a1, (uint64_t)v12);
    goto LABEL_6;
  }
  uint64_t v23 = *((void *)v20 + 1);
  outlined destroy of RegistryState.LoggingInfo((uint64_t)v20);
  uint64_t v24 = *((void *)v18 + 1);
  outlined destroy of RegistryState.LoggingInfo((uint64_t)v18);
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)v2, (uint64_t)v15);
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)a1, (uint64_t)v12);
  if (v23 != v24)
  {
LABEL_6:
    outlined destroy of RegistryState.LoggingInfo((uint64_t)v12);
    outlined destroy of RegistryState.LoggingInfo((uint64_t)v15);
    outlined init with copy of RegistryState.LoggingInfo((uint64_t)v2, (uint64_t)v9);
    uint64_t v27 = v31;
    outlined init with copy of RegistryState.LoggingInfo((uint64_t)a1, v31);
    goto LABEL_7;
  }
  uint64_t v25 = *((void *)v15 + 2);
  outlined destroy of RegistryState.LoggingInfo((uint64_t)v15);
  uint64_t v26 = *((void *)v12 + 2);
  outlined destroy of RegistryState.LoggingInfo((uint64_t)v12);
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)v2, (uint64_t)v9);
  uint64_t v27 = v31;
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)a1, v31);
  if (v25 != v26)
  {
LABEL_7:
    char v28 = 1;
    goto LABEL_8;
  }
  ContinuousClock.Instant.duration(to:)();
  char v28 = static Duration.< infix(_:_:)();
LABEL_8:
  outlined destroy of RegistryState.LoggingInfo(v27);
  outlined destroy of RegistryState.LoggingInfo((uint64_t)v9);
  return v28 & 1;
}

uint64_t outlined init with copy of RegistryState.LoggingInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RegistryState.LoggingInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of RegistryState.LoggingInfo(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RegistryState.LoggingInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void RegistryState.LoggingInfo.init(_:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  id v7 = a1;
  id v8 = objc_msgSend(v7, sel_allPairingIDs);
  type metadata accessor for UUID();
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v10 = a2;
  id v11 = v7;
  unint64_t v12 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay10Foundation4UUIDVG_20PairedDeviceRegistry0G5_ImplCs5NeverOTg504_s20fg44Registry0C5StateV11LoggingInfoVyAeCcfcAA0B5_I24C10Foundation4UUIDVXEfU_AJ0hN0VTf1cn_nTf4ng_n(v9, v11, a2, a3);
  swift_bridgeObjectRelease();

  unint64_t v13 = v12 >> 62;
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    if (v14) {
      goto LABEL_3;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    uint64_t v23 = 0;
    a4[1] = 0;
    goto LABEL_25;
  }
  uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v14) {
    goto LABEL_24;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    return;
  }
  unint64_t v28 = v12 >> 62;
  id v29 = v10;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  unint64_t v17 = v12 & 0xC000000000000001;
  while (1)
  {
    id v18 = v17 ? (id)MEMORY[0x25A2CAA40](v15, v12) : *(id *)(v12 + 8 * v15 + 32);
    uint64_t v19 = v18;
    unsigned int v20 = objc_msgSend(v18, sel_isPaired, v28, v29);

    if (v20)
    {
      BOOL v21 = __OFADD__(v16++, 1);
      if (v21) {
        break;
      }
    }
    if (v14 == ++v15) {
      goto LABEL_13;
    }
  }
  __break(1u);
LABEL_13:
  swift_bridgeObjectRelease();
  a4[1] = v16;
  swift_bridgeObjectRetain();
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  while (1)
  {
    id v24 = v17 ? (id)MEMORY[0x25A2CAA40](v22, v12) : *(id *)(v12 + 8 * v22 + 32);
    uint64_t v25 = v24;
    unsigned int v26 = objc_msgSend(v24, sel_isActive);

    if (v26)
    {
      BOOL v21 = __OFADD__(v23++, 1);
      if (v21) {
        break;
      }
    }
    if (v14 == ++v22) {
      goto LABEL_22;
    }
  }
  __break(1u);
LABEL_22:
  swift_bridgeObjectRelease();
  unint64_t v13 = v28;
  id v10 = v29;
LABEL_25:
  a4[2] = v23;
  if (v13)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  *a4 = v27;
  type metadata accessor for RegistryState.LoggingInfo();
  static ContinuousClock.now.getter();
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay10Foundation4UUIDVG_20PairedDeviceRegistry0G5_ImplCs5NeverOTg504_s20fg44Registry0C5StateV11LoggingInfoVyAeCcfcAA0B5_I24C10Foundation4UUIDVXEfU_AJ0hN0VTf1cn_nTf4ng_n(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v11)
  {
    uint64_t v25 = v4;
    uint64_t v34 = MEMORY[0x263F8EE78];
    id v29 = v10;
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    uint64_t v13 = v8 + 16;
    uint64_t v15 = (char *)(a1 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64)));
    uint64_t v27 = *(void *)(v13 + 56);
    unint64_t v28 = v14;
    uint64_t v30 = v13;
    unsigned int v26 = (void (**)(char *, uint64_t))(v13 - 8);
    do
    {
      unint64_t v17 = v28;
      uint64_t v16 = v29;
      v28(v29, v15, v7);
      id v18 = (objc_class *)type metadata accessor for Device_Impl();
      uint64_t v19 = (char *)objc_allocWithZone(v18);
      v17(&v19[OBJC_IVAR___PDRDevice_Impl_uuid_], v16, v7);
      unsigned int v20 = &v19[OBJC_IVAR___PDRDevice_Impl_registryState];
      uint64_t v22 = v31;
      uint64_t v21 = v32;
      *(void *)unsigned int v20 = a2;
      *((void *)v20 + 1) = v22;
      *((void *)v20 + 2) = v21;
      v33.receiver = v19;
      v33.super_class = v18;
      id v23 = a2;
      id v24 = v22;
      objc_msgSendSuper2(&v33, sel_init);
      (*v26)(v16, v7);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v15 += v27;
      --v11;
    }
    while (v11);
    return v34;
  }
  return result;
}

id Migrator_Impl.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id Migrator_Impl.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Migrator_Impl();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for Migrator_Impl()
{
  return self;
}

id Migrator_Impl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Migrator_Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t Registry_Impl.notify(deviceColletionDiff:state:)(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v33 = a4;
  uint64_t v35 = a3;
  uint64_t v36 = a1;
  os_log_type_t v37 = a2;
  uint64_t v34 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v40 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v38 = *(void *)(v8 - 8);
  uint64_t v39 = v8;
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(v4, sel_compatibilityState);
  uint64_t v12 = OBJC_IVAR___PDRRegistry_Impl_unfairLock;
  uint64_t v13 = *(os_unfair_lock_s **)&v4[OBJC_IVAR___PDRRegistry_Impl_unfairLock];
  swift_retain();
  os_unfair_lock_lock(v13 + 4);
  swift_release();
  aBlock[0] = MEMORY[0x263F8EE78];
  uint64_t v14 = swift_retain();
  specialized WeakCollection.sweep(action:)(v14, aBlock);
  swift_release();
  uint64_t v15 = aBlock[0];
  id v16 = *(id *)&v5[OBJC_IVAR___PDRRegistry_Impl_lastCompatibilityState];
  if (v11 != v16) {
    *(void *)&v5[OBJC_IVAR___PDRRegistry_Impl_lastCompatibilityState] = v11;
  }
  BOOL v17 = v11 != v16;
  id v18 = *(os_unfair_lock_s **)&v5[v12];
  swift_retain();
  os_unfair_lock_unlock(v18 + 4);
  swift_release();
  id v19 = objc_msgSend(v5, sel_callbackQueue);
  uint64_t v20 = swift_allocObject();
  uint64_t v22 = v36;
  uint64_t v21 = v37;
  *(void *)(v20 + 16) = v36;
  *(void *)(v20 + 24) = v21;
  id v23 = v35;
  uint64_t v24 = v33;
  *(void *)(v20 + 32) = v35;
  *(void *)(v20 + 40) = v24;
  *(void *)(v20 + 48) = v15;
  *(void *)(v20 + 56) = v5;
  *(unsigned char *)(v20 + 64) = v17;
  aBlock[4] = partial apply for specialized closure #1 in Registry_Impl.notify(deviceColletionDiff:state:);
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_33;
  uint64_t v25 = _Block_copy(aBlock);
  id v26 = v23;
  uint64_t v27 = v5;
  id v28 = v22;
  id v29 = v21;
  static DispatchQoS.unspecified.getter();
  uint64_t v41 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  uint64_t v30 = v34;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x25A2CA960](0, v10, v7, v25);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v30);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v39);
  return swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed UUID?, @in_guaranteed Date?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void (**)(char *, char *))(a1 + 32);
  if (a2)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v8, 1, 1, v16);
  }
  swift_retain();
  v12(v11, v8);
  swift_release();
  outlined destroy of UUID?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for Date?);
  return outlined destroy of UUID?((uint64_t)v11, &demangling cache variable for type metadata for UUID?);
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    outlined init with copy of RegistryState.LoggingInfo?(v6, (uint64_t)v15, &demangling cache variable for type metadata for (AnyHashable, Any));
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    uint64_t v3[2] = v14;
    v6 += 72;
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

id Registry_Impl.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t static Registry_Impl.supportsWatch()()
{
  if (one-time initialization token for supportWatch != -1) {
    swift_once();
  }
  return static RegistryCrux.supportWatch;
}

void Registry_Impl.computeCompatibilityState()()
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  uint64_t v1 = static RegistryCrux.instance;
  uint64_t v2 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  uint64_t v3 = *(os_unfair_lock_s **)(static RegistryCrux.instance
                            + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
  uint64_t v6 = *(os_unfair_lock_s **)(v1 + v2);
  id v7 = *(id *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
  swift_retain();
  id v8 = v4;
  os_unfair_lock_unlock(v6 + 4);

  swift_release();
  swift_release();
  if (v5 < 0) {
    return;
  }
  id v9 = objc_msgSend(v0, sel_getDevicesExcluding_, 4);
  type metadata accessor for PDRDevice();
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_6;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_13;
  }
LABEL_6:
  if ((v10 & 0xC000000000000001) != 0)
  {
    id v11 = (id)MEMORY[0x25A2CAA40](0, v10);
  }
  else
  {
    if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v11 = *(id *)(v10 + 32);
  }
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  if ((objc_msgSend(v12, sel_isArchived) & 1) == 0) {
    PDRDevice.compatibilityState.getter();
  }
}

Swift::Void __swiftcall Registry_Impl.stop()()
{
  uint64_t v1 = OBJC_IVAR___PDRRegistry_Impl_started_;
  if (*((unsigned char *)v0 + OBJC_IVAR___PDRRegistry_Impl_started_) != 1
    || (*((unsigned char *)v0 + OBJC_IVAR___PDRRegistry_Impl_amSingleton) & 1) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (one-time initialization token for instance != -1) {
      swift_once();
    }
    uint64_t v2 = static RegistryCrux.instance;
    uint64_t v3 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
    uint64_t v4 = *(os_unfair_lock_s **)(static RegistryCrux.instance
                              + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v4 + 4);
    swift_release();
    uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registries_);
    id v6 = v0;
    uint64_t v7 = swift_retain();
    specialized WeakCollection.sweep(action:)(v7, v6, v5, &v9);
    swift_release();

    id v8 = *(os_unfair_lock_s **)(v2 + v3);
    swift_retain();
    os_unfair_lock_unlock(v8 + 4);
    swift_release();
    swift_release();
    *((unsigned char *)v0 + v1) = 0;
  }
}

uint64_t Registry_Impl.remove(delegate:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR___PDRRegistry_Impl_unfairLock;
  uint64_t v4 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR___PDRRegistry_Impl_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR___PDRRegistry_Impl_delegates);
  unsigned __int8 v10 = 0;
  swift_unknownObjectRetain();
  uint64_t v6 = swift_retain();
  specialized WeakCollection.sweep(action:)(v6, a1, v5, &v10);
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v7 = v10;
  id v8 = *(os_unfair_lock_s **)(v1 + v3);
  swift_retain();
  os_unfair_lock_unlock(v8 + 4);
  swift_release();
  return v7;
}

uint64_t closure #1 in Registry_Impl.device(forBluetoothID:)(void **a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unsigned __int8 v10 = (char *)&v17 - v9;
  id v11 = *a1;
  if (objc_msgSend(v11, sel_isActive))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a2, v4);
  }
  else
  {
    unsigned __int8 v12 = objc_msgSend(v11, sel_isPaired);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a2, v4);
    if ((v12 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      char v14 = 0;
      return v14 & 1;
    }
  }
  id v13 = objc_msgSend(v11, sel_bluetoothIdentifier);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  char v14 = static UUID.== infix(_:_:)();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v8, v4);
  v15(v10, v4);
  return v14 & 1;
}

void *specialized Sequence.first(where:)(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25A2CAA40](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v13 = v8;
      char v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t closure #1 in Registry_Impl.device(forPairingID:)(id *a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(*a1, sel_pairingID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  char v7 = static UUID.== infix(_:_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 & 1;
}

id @objc Registry_Impl.device(forBluetoothID:)(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(id *))
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a1;
  id v11 = objc_msgSend(v10, sel_getDevicesExcluding_, 0);
  type metadata accessor for PDRDevice();
  unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v16 = v9;
  id v13 = specialized Sequence.first(where:)(a4, (uint64_t)v15, v12);

  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

id Registry_Impl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Registry_Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t specialized closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v133 = a7;
  uint64_t v144 = a6;
  uint64_t v137 = a4;
  v138 = a2;
  double v142 = a3;
  uint64_t v9 = type metadata accessor for UUID();
  unint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v136 = (uint64_t)v111 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v12 - 8);
  char v14 = (char *)v111 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v127 = a1;
  id v15 = objc_msgSend(a1, sel_allPairingIDs);
  uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v126 = *(void *)(v16 + 16);
  if (v126)
  {
    unint64_t v17 = 0;
    id v19 = *(void (**)(char *, unint64_t, uint64_t))(v10 + 16);
    unint64_t v18 = v10 + 16;
    unint64_t v124 = v16 + ((*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64));
    v125 = v19;
    uint64_t v122 = *(void *)(v18 + 56);
    unint64_t v123 = v18;
    unint64_t v132 = v18 + 40;
    uint64_t v120 = (void (**)(uint64_t, char *, uint64_t))(v18 + 16);
    uint64_t v121 = (unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 32);
    uint64_t v20 = a5 & 0xFFFFFFFFFFFFFF8;
    uint64_t v119 = a5 & 0xFFFFFFFFFFFFFF8;
    if (a5 < 0) {
      uint64_t v20 = a5;
    }
    v111[1] = v20;
    unint64_t v141 = a5 & 0xC000000000000001;
    v114 = @"com.apple.watch.paireddeviceregistry.didunpair";
    uint64_t v115 = (void (**)(uint64_t, uint64_t))(v18 - 8);
    v130 = @"pdr.device";
    os_log_type_t v112 = @"com.apple.watch.paireddeviceregistry.didsetup";
    uint64_t v113 = @"com.apple.watch.paireddeviceregistry.didpair";
    v111[2] = MEMORY[0x263F8EE58] + 8;
    long long v129 = xmmword_25871C1F0;
    unint64_t v10 = 0x265436000;
    double v117 = v14;
    uint64_t v118 = v9;
    uint64_t v135 = a5;
    uint64_t v116 = v16;
    while (1)
    {
      v125(v14, v124 + v122 * v17, v9);
      uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v132;
      (*(void (**)(char *, void, uint64_t, uint64_t))v132)(v14, 0, 1, v9);
      if ((*v121)(v14, 1, v9) == 1) {
        break;
      }
      (*v120)(v136, v14, v9);
      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      id v23 = objc_msgSend(v127, sel_objectForKeyedSubscript_, isa);

      v145 = v23;
      if (!v23)
      {
LABEL_69:
        __break(1u);
LABEL_70:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return result;
      }
      uint64_t v139 = swift_allocObject();
      *(void *)(v139 + 16) = 0;
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = 0;
      *(unsigned char *)(v24 + 26) = 0;
      *(_WORD *)(v24 + 24) = 0;
      unint64_t v131 = v17;
      uint64_t v128 = v21;
      if ((unint64_t)a5 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
        if (v25)
        {
LABEL_9:
          uint64_t v26 = 4;
          unint64_t v143 = v24;
          uint64_t v134 = v25;
          do
          {
            uint64_t v27 = v26 - 4;
            if (v141)
            {
              id v28 = (void *)MEMORY[0x25A2CAA40](v26 - 4, a5);
              uint64_t v29 = v26 - 3;
              if (__OFADD__(v27, 1)) {
                goto LABEL_68;
              }
            }
            else
            {
              id v28 = *(void **)(a5 + 8 * v26);
              swift_unknownObjectRetain();
              uint64_t v29 = v26 - 3;
              if (__OFADD__(v27, 1))
              {
LABEL_68:
                __break(1u);
                goto LABEL_69;
              }
            }
            if (objc_msgSend(v28, sel_respondsToSelector_, *(void *)(v10 + 3856)))
            {
              objc_msgSend(v28, *(SEL *)(v10 + 3856), v144);
            }
            else
            {
              uint64_t v30 = v142;
              uint64_t v31 = v138;
              uint64_t v32 = v136;
              if (v133)
              {
                if (one-time initialization token for framework != -1) {
                  swift_once();
                }
                uint64_t v33 = type metadata accessor for Logger();
                __swift_project_value_buffer(v33, (uint64_t)static Logs.framework);
                uint64_t v34 = Logger.logObject.getter();
                os_log_type_t v35 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v34, v35))
                {
                  uint64_t v36 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)uint64_t v36 = 0;
                  _os_log_impl(&dword_258700000, v34, v35, "Informing delegate about compatibility state change", v36, 2u);
                  os_log_type_t v37 = v36;
                  uint64_t v30 = v142;
                  MEMORY[0x25A2CB3A0](v37, -1, -1);
                }
              }
              id v38 = objc_msgSend(v145, sel_changeType);
              if (v38 == (id)2)
              {
                if (one-time initialization token for framework != -1) {
                  swift_once();
                }
                uint64_t v50 = type metadata accessor for Logger();
                __swift_project_value_buffer(v50, (uint64_t)static Logs.framework);
                long long v51 = Logger.logObject.getter();
                os_log_type_t v52 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v51, v52))
                {
                  uint64_t v53 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)uint64_t v53 = 0;
                  _os_log_impl(&dword_258700000, v51, v52, "Informing delegate about device removal", v53, 2u);
                  uint64_t v54 = v53;
                  uint64_t v30 = v142;
                  MEMORY[0x25A2CB3A0](v54, -1, -1);
                }

                unsigned __int8 v55 = objc_msgSend(v28, sel_respondsToSelector_, sel_registry_removed_);
                uint64_t v45 = v137;
                if (v55)
                {
                  swift_unknownObjectRetain();
                  Class v56 = UUID._bridgeToObjectiveC()().super.isa;
                  objc_msgSend(v28, sel_registry_removed_, v144, v56);
                  swift_unknownObjectRelease();
                }
              }
              else if (v38 == (id)1)
              {
                if (one-time initialization token for framework != -1) {
                  swift_once();
                }
                uint64_t v39 = type metadata accessor for Logger();
                __swift_project_value_buffer(v39, (uint64_t)static Logs.framework);
                uint64_t v40 = Logger.logObject.getter();
                os_log_type_t v41 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v40, v41))
                {
                  uint64_t v42 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)uint64_t v42 = 0;
                  _os_log_impl(&dword_258700000, v40, v41, "Informing delegate about property changes", v42, 2u);
                  int64_t v43 = v42;
                  uint64_t v30 = v142;
                  MEMORY[0x25A2CB3A0](v43, -1, -1);
                }

                unsigned __int8 v44 = objc_msgSend(v28, sel_respondsToSelector_, sel_registry_changed_properties_);
                uint64_t v45 = v137;
                if (v44)
                {
                  swift_unknownObjectRetain();
                  uint64_t v46 = v139;
                  id v47 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v139, v32, v31, v30, v45);
                  uint64_t v48 = v46;
                  uint64_t v24 = v143;
                  getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v143, v145, v48, v32, v31, v30, v45);
                  type metadata accessor for PDRDevicePropertyKey(0);
                  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey, type metadata accessor for PDRDevicePropertyKey);
                  Class v49 = Set._bridgeToObjectiveC()().super.isa;
                  objc_msgSend(v28, sel_registry_changed_properties_, v144, v47, v49);

                  uint64_t v45 = v137;
                  swift_bridgeObjectRelease();
                  swift_unknownObjectRelease();

                  uint64_t v30 = v142;
                }
              }
              else
              {
                if (v38) {
                  goto LABEL_70;
                }
                if (one-time initialization token for framework != -1) {
                  swift_once();
                }
                uint64_t v57 = type metadata accessor for Logger();
                __swift_project_value_buffer(v57, (uint64_t)static Logs.framework);
                uint64_t v58 = Logger.logObject.getter();
                os_log_type_t v59 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v58, v59))
                {
                  os_log_type_t v60 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)os_log_type_t v60 = 0;
                  _os_log_impl(&dword_258700000, v58, v59, "Informing delegate about device creation", v60, 2u);
                  os_log_type_t v61 = v60;
                  uint64_t v30 = v142;
                  MEMORY[0x25A2CB3A0](v61, -1, -1);
                }

                unsigned __int8 v62 = objc_msgSend(v28, sel_respondsToSelector_, sel_registry_added_);
                uint64_t v45 = v137;
                if (v62)
                {
                  swift_unknownObjectRetain();
                  id v63 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v139, v32, v31, v30, v45);
                  objc_msgSend(v28, sel_registry_added_, v144, v63);

                  swift_unknownObjectRelease();
                }
              }
              uint64_t v140 = v29;
              uint64_t v64 = v24;
              uint64_t v65 = v139;
              getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v64, v145, v139, v32, v31, v30, v45);
              int v67 = v66;
              swift_bridgeObjectRelease();
              if ((v67 & 0x10000) != 0
                && (objc_msgSend(v28, sel_respondsToSelector_, sel_registry_didSetup_) & 1) != 0)
              {
                swift_unknownObjectRetain();
                id v68 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v65, v32, v31, v30, v45);
                objc_msgSend(v28, sel_registry_didSetup_, v144, v68);

                swift_unknownObjectRelease();
              }
              getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v143, v145, v65, v32, v31, v30, v45);
              char v70 = v69;
              swift_bridgeObjectRelease();
              uint64_t v71 = v135;
              if ((v70 & 1) != 0
                && (objc_msgSend(v28, sel_respondsToSelector_, sel_registry_didPair_) & 1) != 0)
              {
                swift_unknownObjectRetain();
                id v72 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v65, v32, v31, v30, v45);
                objc_msgSend(v28, sel_registry_didPair_, v144, v72);

                swift_unknownObjectRelease();
              }
              uint64_t v73 = v65;
              uint64_t v24 = v143;
              getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v143, v145, v73, v32, v31, v30, v45);
              __int16 v75 = v74;
              swift_bridgeObjectRelease();
              unint64_t v10 = 0x265436000uLL;
              uint64_t v25 = v134;
              a5 = v71;
              uint64_t v29 = v140;
              if ((v75 & 0x100) != 0
                && (objc_msgSend(v28, sel_respondsToSelector_, sel_registry_didUnpair_) & 1) != 0)
              {
                swift_unknownObjectRetain();
                id v76 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v139, v136, v138, v142, v137);
                objc_msgSend(v28, sel_registry_didUnpair_, v144, v76);

                swift_unknownObjectRelease();
              }
            }
            swift_unknownObjectRelease();
            ++v26;
          }
          while (v29 != v25);
        }
      }
      else
      {
        uint64_t v25 = *(void *)(v119 + 16);
        swift_bridgeObjectRetain();
        if (v25) {
          goto LABEL_9;
        }
      }
      uint64_t v77 = a5;
      swift_bridgeObjectRelease();
      uint64_t v78 = v139;
      uint64_t v80 = v136;
      uint64_t v79 = v137;
      uint64_t v81 = v142;
      getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v24, v145, v139, v136, v138, v142, v137);
      __int16 v83 = v82;
      swift_bridgeObjectRelease();
      if ((v83 & 0x100) != 0)
      {
        id v84 = objc_msgSend(self, sel_defaultCenter);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v129;
        uint64_t v146 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v147 = v86;
        AnyHashable.init<A>(_:)();
        id v87 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v78, v80, v138, v81, v79);
        *(void *)(inited + 96) = type metadata accessor for PDRDevice();
        *(void *)(inited + 72) = v87;
        specialized Dictionary.init(dictionaryLiteral:)(inited);
        Class v88 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        objc_msgSend(v84, sel_postNotificationName_object_userInfo_, v114, v144, v88);

        uint64_t v77 = v135;
      }
      getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v24, v145, v78, v80, v138, v81, v79);
      char v90 = v89;
      swift_bridgeObjectRelease();
      if (v90)
      {
        id v91 = objc_msgSend(self, sel_defaultCenter);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
        uint64_t v92 = swift_initStackObject();
        *(_OWORD *)(v92 + 16) = v129;
        uint64_t v146 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v147 = v93;
        AnyHashable.init<A>(_:)();
        id v94 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v78, v80, v138, v81, v79);
        *(void *)(v92 + 96) = type metadata accessor for PDRDevice();
        *(void *)(v92 + 72) = v94;
        specialized Dictionary.init(dictionaryLiteral:)(v92);
        Class v95 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        objc_msgSend(v91, sel_postNotificationName_object_userInfo_, v113, v144, v95);

        uint64_t v77 = v135;
      }
      char v96 = v81;
      unint64_t v17 = v131 + 1;
      unint64_t v143 = v132 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v97 = v79;
      uint64_t v98 = v145;
      uint64_t v99 = v80;
      uint64_t v100 = v80;
      uint64_t v101 = v97;
      getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v24, v145, v78, v100, v138, v96, v97);
      int v103 = v102;
      swift_bridgeObjectRelease();
      if ((v103 & 0x10000) != 0)
      {
        id v104 = objc_msgSend(self, sel_defaultCenter);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
        uint64_t v105 = swift_initStackObject();
        *(_OWORD *)(v105 + 16) = v129;
        uint64_t v106 = v98;
        uint64_t v146 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v147 = v107;
        AnyHashable.init<A>(_:)();
        id v108 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v78, v99, v138, v142, v101);
        *(void *)(v105 + 96) = type metadata accessor for PDRDevice();
        *(void *)(v105 + 72) = v108;
        specialized Dictionary.init(dictionaryLiteral:)(v105);
        Class v109 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        objc_msgSend(v104, sel_postNotificationName_object_userInfo_, v112, v144, v109);

        uint64_t v77 = v135;
        uint64_t v9 = v118;
        (*v115)(v99, v118);
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v9 = v118;
        (*v115)(v99, v118);
        swift_release();
        swift_release();
      }
      char v14 = v117;
      if (v17 == v126) {
        goto LABEL_66;
      }
      unint64_t v10 = 0x265436000;
      a5 = v77;
      if (v17 >= *(void *)(v116 + 16))
      {
        __break(1u);
        goto LABEL_65;
      }
    }
  }
  else
  {
LABEL_65:
    uint64_t v128 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    unint64_t v143 = (v10 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
LABEL_66:
    v128(v14, 1, 1, v9);
  }
  return swift_bridgeObjectRelease();
}

id getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void **)(a1 + 16);
  id v15 = (void **)(a1 + 16);
  char v14 = v16;
  if (v16)
  {
    id v17 = v14;
  }
  else
  {
    uint64_t v28 = a5;
    unint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v18(v13, a2, v10);
    id v19 = (objc_class *)type metadata accessor for Device_Impl();
    uint64_t v20 = (char *)objc_allocWithZone(v19);
    v18(&v20[OBJC_IVAR___PDRDevice_Impl_uuid_], (uint64_t)v13, v10);
    uint64_t v21 = &v20[OBJC_IVAR___PDRDevice_Impl_registryState];
    *(void *)uint64_t v21 = a3;
    *((void *)v21 + 1) = a4;
    *((void *)v21 + 2) = v28;
    v29.receiver = v20;
    v29.super_class = v19;
    id v22 = a3;
    id v23 = a4;
    id v24 = objc_msgSendSuper2(&v29, sel_init);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_beginAccess();
    uint64_t v25 = *v15;
    *id v15 = v24;
    id v17 = v24;

    char v14 = 0;
  }
  id v26 = v14;
  return v17;
}

uint64_t getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = closure #2 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(a2, a3, a4, a5, a6, a7);
    int v11 = HIWORD(v10) & 1;
    __int16 v12 = v10 & 0x101;
    swift_beginAccess();
    *(void *)(a1 + 16) = v9;
    *(unsigned char *)(a1 + 26) = v11;
    *(_WORD *)(a1 + 24) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v9;
}

uint64_t closure #2 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v73 = a5;
  uint64_t v74 = a6;
  uint64_t v71 = a2;
  id v72 = a4;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int v66 = (char *)v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v79 = (char *)v65 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v68 = (char *)v65 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v81 = (char *)v65 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  int v67 = (char *)v65 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v78 = (char *)v65 - v20;
  uint64_t v84 = MEMORY[0x263F8EE88];
  id v21 = objc_msgSend(a1, sel_diff);
  if (v21)
  {
    id v22 = v21;
    id v23 = objc_msgSend(v21, sel_allPropertyNames);

    if (v23)
    {
      uint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v25 = *(void *)(v24 + 16);
      if (v25)
      {
        int v77 = 0;
        unsigned __int8 v26 = 0;
        char v27 = 0;
        __int16 v82 = (void (**)(char *, uint64_t, uint64_t))(v9 + 16);
        char v69 = @"isPaired";
        v65[1] = v24;
        v65[2] = @"isSetup";
        uint64_t v28 = (uint64_t *)(v24 + 40);
        uint64_t v80 = (void (**)(char *, uint64_t))(v9 + 8);
        uint64_t v70 = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        uint64_t v75 = a3;
        while (1)
        {
          uint64_t v29 = *(v28 - 1);
          uint64_t v30 = *v28;
          swift_bridgeObjectRetain();
          uint64_t v31 = (void *)MEMORY[0x25A2CA820](v29, v30);
          swift_bridgeObjectRelease();
          id v32 = v31;
          specialized Set._Variant.insert(_:)(&v83, v32);

          uint64_t v33 = *v82;
          uint64_t v34 = v78;
          (*v82)(v78, a3, v8);
          if (v27)
          {
            os_log_type_t v35 = *v80;
            (*v80)(v34, v8);
            int v76 = 1;
            goto LABEL_18;
          }
          uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v38 = v37;
          if (v36 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v38 == v39)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v42 = (uint64_t)v67;
            v33(v67, (uint64_t)v78, v8);
          }
          else
          {
            char v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v42 = (uint64_t)v67;
            v33(v67, (uint64_t)v78, v8);
            unsigned int v43 = 0;
            if ((v41 & 1) == 0) {
              goto LABEL_17;
            }
          }
          id v44 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v71, v42, v72, v73, v74);
          unsigned int v43 = objc_msgSend(v44, sel_isPaired);

          uint64_t v42 = (uint64_t)v67;
LABEL_17:
          int v76 = v43;
          os_log_type_t v35 = *v80;
          (*v80)((char *)v42, v8);
          v35(v78, v8);
          a3 = v75;
LABEL_18:
          uint64_t v45 = v79;
          char v46 = v77;
          v33(v81, a3, v8);
          if (v46)
          {
            int v47 = 1;
            goto LABEL_26;
          }
          uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v50 = v49;
          if (v48 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v50 == v51)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v52 = (uint64_t)v68;
            v33(v68, (uint64_t)v81, v8);
LABEL_24:
            id v54 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v71, v52, v72, v73, v74);
            unsigned int v55 = objc_msgSend(v54, sel_isPaired);

            uint64_t v52 = (uint64_t)v68;
            int v47 = v55 ^ 1;
            goto LABEL_25;
          }
          char v53 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v52 = (uint64_t)v68;
          v33(v68, (uint64_t)v81, v8);
          int v47 = 0;
          if (v53) {
            goto LABEL_24;
          }
LABEL_25:
          v35((char *)v52, v8);
          a3 = v75;
          uint64_t v45 = v79;
LABEL_26:
          v35(v81, v8);
          v33(v45, a3, v8);
          int v77 = v47;
          if ((v26 & 1) == 0)
          {
            uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v58 = v57;
            if (v56 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v58 == v59)
            {
              swift_bridgeObjectRelease_n();
              uint64_t v60 = (uint64_t)v66;
              v33(v66, (uint64_t)v79, v8);
              goto LABEL_31;
            }
            char v61 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v60 = (uint64_t)v66;
            unsigned __int8 v62 = v79;
            v33(v66, (uint64_t)v79, v8);
            if (v61)
            {
LABEL_31:
              id v63 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v71, v60, v72, v73, v74);
              unsigned __int8 v26 = objc_msgSend(v63, sel_isSetup);

              id v32 = v63;
              unsigned __int8 v62 = v79;
            }
            else
            {
              unsigned __int8 v26 = 0;
            }

            v35((char *)v60, v8);
            v35(v62, v8);
            a3 = v75;
            goto LABEL_6;
          }
          v35(v45, v8);

          unsigned __int8 v26 = 1;
LABEL_6:
          char v27 = v76;
          v28 += 2;
          if (!--v25)
          {
            swift_bridgeObjectRelease();
            return v84;
          }
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  return MEMORY[0x263F8EE88];
}

void *Registry_Impl.unpair(device:options:)(void *a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  swift_retain();
  id v6 = objc_msgSend(a1, sel_pairingID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v7 = RegistryCrux.unpair(pairingID:options:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

void *Registry_Impl.failsafeUnpair(options:)()
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v0 = RegistryCrux.failsafeUnpair(options:)();
  swift_release();
  return v0;
}

void Registry_Impl.setActive(device:results:)(void *a1, void (*a2)(void *, id))
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v4 = RegistryCrux.setActive(device:)(a1);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  swift_release();
  if (v8)
  {
    id v9 = v8;
    id v10 = v8;
    a2(v8, 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    active = (objc_class *)type metadata accessor for ActiveDeviceAssertion_Impl();
    uint64_t v12 = objc_allocWithZone(active);
    v12[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_valid] = 1;
    *(void *)&v12[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_device_] = a1;
    uint64_t v13 = (uint64_t *)&v12[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_identifier_];
    *uint64_t v13 = v4;
    v13[1] = v6;
    v16.receiver = v12;
    v16.super_class = active;
    id v14 = a1;
    swift_bridgeObjectRetain();
    id v15 = objc_msgSendSuper2(&v16, sel_init);
    a2(0, v15);

    swift_bridgeObjectRelease();
  }
}

Swift::Int __swiftcall Registry_Impl.lastSyncSwitchIndex()()
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  swift_retain();
  Swift::Int v0 = RegistryCrux.lastSyncSwitchIndex()();
  swift_release();
  return v0;
}

uint64_t Registry_Impl.migrationCount(pairingID:)()
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v0 = RegistryCrux.migrationCount(pairingID:)();
  swift_release();
  return v0;
}

void Registry_Impl.waitForPairingExtendedMetadata(advertisedName:results:)(uint64_t a1, uint64_t a2, void (*a3)(void, id))
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  swift_retain();
  char v6 = RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(a1, a2);
  uint64_t v8 = v7;
  swift_release();
  if (v8)
  {
    id v9 = objc_allocWithZone((Class)PDRPairingExtendedMetadata);
    id v13 = v8;
    id v10 = objc_msgSend(v9, sel_init);
    objc_msgSend(v10, sel_setChipID_, objc_msgSend(v13, sel_chipID));
    objc_msgSend(v10, sel_setPairingVersion_, objc_msgSend(v13, sel_pairingVersion));
    id v11 = objc_msgSend(v13, sel_productType);
    objc_msgSend(v10, sel_setProductType_, v11);

    objc_msgSend(v10, sel_setPostFailsafeObliteration_, objc_msgSend(v13, sel_postFailsafeObliteration));
    objc_msgSend(v10, sel_setIsCellularEnabled_, objc_msgSend(v13, sel_isCellularEnabled));
    objc_msgSend(v10, sel_setEncodedSystemVersion_, objc_msgSend(v13, sel_encodedSystemVersion));
    id v12 = v10;
    a3(v6 & 1, v10);
  }
  else
  {
    a3(v6 & 1, 0);
  }
}

void Registry_Impl.completeRTCPairingMetric(metricID:completion:)(uint64_t a1, uint64_t a2, void (*a3)(void, void *))
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  swift_retain();
  char v6 = RegistryCrux.completeRTCPairingMetric(metricID:)(a1, a2);
  uint64_t v8 = v7;
  swift_release();
  a3(v6 & 1, v8);
}

void Registry_Impl.pairingClientSetAltAccount(name:altDSID:device:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(void *))
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  swift_retain();
  id v12 = RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:)(a1, a2, a3, a4, a5);
  swift_release();
  a6(v12);
}

Swift::Int __swiftcall Registry_Impl.maxPairedDeviceCount()()
{
  return 5;
}

Swift::Int __swiftcall Registry_Impl.maxTinkerPairedDeviceCount()()
{
  return 5;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      outlined init with copy of AnyHashable(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25A2CA9F0](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t specialized Set._Variant.insert(_:)(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v24 = a2;
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = ~v8;
      do
      {
        unint64_t v9 = (v9 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v19 = v18;
        if (v17 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v19 == v20) {
          goto LABEL_16;
        }
        char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  unsigned __int8 v26 = *(void **)(*(void *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  id v27 = v26;
  return 0;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<PDRDevicePropertyKey>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    id v27 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v29 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v28 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28) {
          goto LABEL_33;
        }
        unint64_t v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v28) {
            goto LABEL_33;
          }
          unint64_t v15 = v29[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v28) {
              goto LABEL_33;
            }
            unint64_t v15 = v29[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v27;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v29 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v28) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v29[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      Hasher.init(_seed:)();
      String.hash(into:)();
      Swift::Int v18 = Hasher._finalize()();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = v18 & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v25 = *(void *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  if (a3)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)specialized _NativeSet.copy()();
LABEL_22:
      uint64_t v25 = *v4;
      *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(void *)(*(void *)(v25 + 48) + 8 * a2) = v6;
      uint64_t v26 = *(void *)(v25 + 16);
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (!v27)
      {
        *(void *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v9 = *v3;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v10 = Hasher._finalize()();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v21 = v20;
      if (v19 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v21 == v22) {
        goto LABEL_25;
      }
      char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for PDRDevicePropertyKey(0);
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

id specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<PDRDevicePropertyKey>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    char v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<PDRDevicePropertyKey>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  BOOL v27 = v0;
  uint64_t v28 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    char v17 = *(void **)(*(void *)(v2 + 48) + 8 * v13);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    id v18 = v17;
    String.hash(into:)();
    Swift::Int v19 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v4 + 48) + 8 * v11) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in RegistryCrux.deviceIDAtSwitchIndex(_:_:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in RegistryCrux.deviceIDAtSwitchIndex(_:_:)(a1, a2);
}

uint64_t partial apply for closure #1 in Registry_Impl.device(forBluetoothID:)(void **a1)
{
  return closure #1 in Registry_Impl.device(forBluetoothID:)(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t partial apply for closure #1 in Registry_Impl.device(forPairingID:)(id *a1)
{
  return closure #1 in Registry_Impl.device(forPairingID:)(a1) & 1;
}

uint64_t method lookup function for Registry_Impl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Registry_Impl);
}

uint64_t dispatch thunk of static Registry_Impl.supportsWatch()()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

unint64_t specialized Registry_Impl.getSwitchEvents(after:process:)(int a1, char *a2, char *a3)
{
  int v67 = a3;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  uint64_t v7 = MEMORY[0x270FA5388](v76);
  int64_t v9 = (uint64_t *)((char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v90 = (uint64_t)&v64 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v89 = (uint64_t)&v64 - v12;
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  uint64_t v13 = MEMORY[0x270FA5388](v73);
  uint64_t v69 = (uint64_t)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v75 = (uint64_t)&v64 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v91 = (uint64_t)&v64 - v17;
  BOOL v18 = __CFADD__(a1, 1);
  unsigned int v19 = a1 + 1;
  if (v18)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_5;
  }
  unint64_t v3 = 0x265436000uLL;
  id v20 = objc_msgSend(a2, sel_switchIndex);
  if (((unint64_t)v20 & 0x8000000000000000) != 0) {
    goto LABEL_30;
  }
  uint64_t v4 = (uint64_t *)v20;
  if ((unint64_t)v20 >> 32) {
    goto LABEL_30;
  }
  if (one-time initialization token for instance != -1) {
    goto LABEL_27;
  }
LABEL_5:
  id v72 = v93;
  uint64_t v65 = v67 + 16;
  unint64_t v21 = (uint64_t *)&demangling cache variable for type metadata for Date?;
  uint64_t v71 = 0x800000025871DD80;
  uint64_t v70 = MEMORY[0x263F8EE58] + 8;
  uint64_t v64 = a2;
  int v66 = v9;
  while (v4 < v19)
  {
LABEL_20:
    unint64_t result = (unint64_t)objc_msgSend(a2, *(SEL *)(v3 + 3736), v64, v65);
    if ((result & 0x8000000000000000) != 0 || HIDWORD(result)) {
      goto LABEL_30;
    }
    unsigned int v19 = v4 + 1;
    BOOL v18 = v4 >= result;
    uint64_t v4 = (uint64_t *)result;
    if (v18) {
      return result;
    }
  }
  a2 = (char *)static RegistryCrux.instance;
  uint64_t v80 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  uint64_t v79 = static RegistryCrux.instance + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_;
  uint64_t v22 = type metadata accessor for Date();
  uint64_t v23 = *(void *)(v22 - 8);
  unint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
  unint64_t v25 = v23 + 56;
  uint64_t v81 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  id v68 = (void (**)(uint64_t, uint64_t))(v23 + 8);
  swift_retain();
  int64_t v9 = 0;
  uint64_t v74 = a2;
  __int16 v82 = v24;
  unint64_t v78 = v25;
  int v77 = v4;
  uint64_t v88 = v19;
  uint64_t v83 = v22;
  while (1)
  {
    uint64_t v26 = v91;
    v24(v91, 1, 1, v22);
    outlined destroy of UUID?(v26, v21);
    v24(v26, 1, 1, v22);
    uint64_t v86 = swift_allocBox();
    uint64_t v28 = v27;
    uint64_t v29 = type metadata accessor for UUID();
    uint64_t v30 = *(void *)(v29 - 8);
    uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 56);
    uint64_t v87 = v28;
    uint64_t v84 = v29;
    v31(v28, 1, 1);
    uint64_t v32 = v80;
    uint64_t v33 = *(os_unfair_lock_s **)&a2[v80];
    swift_retain();
    os_unfair_lock_lock(v33 + 4);
    swift_release();
    uint64_t v34 = *(void **)v79;
    os_log_type_t v35 = v21;
    uint64_t v36 = *(void *)(v79 + 16);
    uint64_t v37 = *(os_unfair_lock_s **)&a2[v32];
    id v85 = *(id *)(v79 + 8);
    swift_retain();
    id v38 = v34;
    os_unfair_lock_unlock(v37 + 4);
    swift_release();
    if (v36 < 0)
    {

      unint64_t v21 = v35;
      uint64_t v47 = v88;
      uint64_t v49 = v30;
    }
    else
    {
      outlined destroy of UUID?(v26, v35);
      RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001BLL, v71, &aBlock);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCRegistryDelegate);
      swift_dynamicCast();
      uint64_t v39 = (void *)v93[4];
      uint64_t v40 = swift_allocBox();
      uint64_t v42 = v41;
      v82(v41, 1, 1, v83);
      uint64_t v43 = swift_allocObject();
      *(void *)(v43 + 16) = v86;
      *(void *)(v43 + 24) = v40;
      v93[2] = closure #1 in RegistryCrux.deviceIDAtSwitchIndex(_:_:)partial apply;
      v93[3] = v43;
      *(void *)&long long aBlock = MEMORY[0x263EF8330];
      *((void *)&aBlock + 1) = 1107296256;
      v93[0] = thunk for @escaping @callee_guaranteed (@in_guaranteed UUID?, @in_guaranteed Date?) -> ();
      v93[1] = &block_descriptor_27;
      uint64_t v44 = v30;
      uint64_t v45 = _Block_copy(&aBlock);
      char v46 = v38;
      swift_retain();
      swift_retain();
      swift_release();
      uint64_t v47 = v88;
      objc_msgSend(v39, sel_xpcDeviceIDAtSwitchIndex_withBlock_, (v88 + v9), v45);

      swift_unknownObjectRelease();
      uint64_t v48 = v45;
      uint64_t v49 = v44;
      a2 = v74;
      _Block_release(v48);
      swift_beginAccess();
      uint64_t v50 = v42;
      unint64_t v21 = (uint64_t *)&demangling cache variable for type metadata for Date?;
      outlined init with copy of RegistryState.LoggingInfo?(v50, v26, (uint64_t *)&demangling cache variable for type metadata for Date?);
      swift_release();
    }
    uint64_t v86 = (uint64_t)v9 + v47;
    uint64_t v51 = v87;
    swift_beginAccess();
    uint64_t v52 = v89;
    uint64_t v4 = &demangling cache variable for type metadata for UUID?;
    outlined init with copy of RegistryState.LoggingInfo?(v51, v89, &demangling cache variable for type metadata for UUID?);
    swift_release();
    uint64_t v53 = v75;
    outlined init with copy of RegistryState.LoggingInfo?(v91, v75, v21);
    id v54 = *v81;
    uint64_t v22 = v83;
    LODWORD(v51) = (*v81)(v53, 1, v83);
    outlined destroy of UUID?(v53, v21);
    outlined init with copy of RegistryState.LoggingInfo?(v52, v90, &demangling cache variable for type metadata for UUID?);
    if (v51 == 1
      || (unsigned int v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48), v55(v90, 1, v84) == 1))
    {
      outlined destroy of UUID?(v90, &demangling cache variable for type metadata for UUID?);
      outlined destroy of UUID?(v89, &demangling cache variable for type metadata for UUID?);
      outlined destroy of UUID?(v91, v21);
      unint64_t v24 = v82;
      LODWORD(v56) = v86;
      goto LABEL_17;
    }
    uint64_t v87 = v49;
    outlined destroy of UUID?(v90, &demangling cache variable for type metadata for UUID?);
    uint64_t v57 = v69;
    outlined init with copy of RegistryState.LoggingInfo?(v91, v69, v21);
    if (v54(v57, 1, v22) == 1) {
      goto LABEL_29;
    }
    uint64_t v4 = v66;
    outlined init with copy of RegistryState.LoggingInfo?(v89, (uint64_t)v66, &demangling cache variable for type metadata for UUID?);
    uint64_t v58 = v84;
    unsigned int v59 = v55((uint64_t)v4, 1, v84);
    unint64_t v24 = v82;
    uint64_t v56 = v86;
    if (v59 == 1) {
      break;
    }
    uint64_t v60 = v69;
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    Class v62 = UUID._bridgeToObjectiveC()().super.isa;
    (*((void (**)(char *, uint64_t, Class, Class))v67 + 2))(v67, v56, isa, v62);

    outlined destroy of UUID?(v89, &demangling cache variable for type metadata for UUID?);
    outlined destroy of UUID?(v91, v21);
    (*(void (**)(uint64_t *, uint64_t))(v87 + 8))(v4, v58);
    (*v68)(v60, v22);
    a2 = v74;
LABEL_17:
    unint64_t v3 = v78;
    unsigned int v19 = v88;
    if (v56 == -1)
    {
      __break(1u);
      goto LABEL_26;
    }
    int64_t v9 = (uint64_t *)((char *)v9 + 1);
    LODWORD(v4) = v77;
    if (v77 < (int)v88 + (int)v9)
    {
      swift_release();
      a2 = v64;
      unint64_t v3 = 0x265436000uLL;
      goto LABEL_20;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  _Block_release(v67);
  unint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void specialized Registry_Impl.setActive(device:results:)(void *a1, uint64_t a2)
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v4 = RegistryCrux.setActive(device:)(a1);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  swift_release();
  if (v8)
  {
    id v9 = v8;
    id v10 = v8;
    uint64_t v11 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *, void))(a2 + 16))(a2, v11, 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    active = (objc_class *)type metadata accessor for ActiveDeviceAssertion_Impl();
    uint64_t v13 = objc_allocWithZone(active);
    v13[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_valid] = 1;
    *(void *)&v13[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_device_] = a1;
    uint64_t v14 = (uint64_t *)&v13[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_identifier_];
    *uint64_t v14 = v4;
    v14[1] = v6;
    v17.receiver = v13;
    v17.super_class = active;
    id v15 = a1;
    swift_bridgeObjectRetain();
    id v16 = objc_msgSendSuper2(&v17, sel_init);
    (*(void (**)(uint64_t, void, id))(a2 + 16))(a2, 0, v16);

    swift_bridgeObjectRelease();
  }
}

void specialized Registry_Impl.waitForPairingExtendedMetadata(advertisedName:results:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  swift_retain();
  char v6 = RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(a1, a2);
  uint64_t v8 = v7;
  swift_release();
  if (v8)
  {
    id v9 = objc_allocWithZone((Class)PDRPairingExtendedMetadata);
    id v15 = v8;
    id v10 = objc_msgSend(v9, sel_init);
    objc_msgSend(v10, sel_setChipID_, objc_msgSend(v15, sel_chipID));
    objc_msgSend(v10, sel_setPairingVersion_, objc_msgSend(v15, sel_pairingVersion));
    id v11 = objc_msgSend(v15, sel_productType);
    objc_msgSend(v10, sel_setProductType_, v11);

    objc_msgSend(v10, sel_setPostFailsafeObliteration_, objc_msgSend(v15, sel_postFailsafeObliteration));
    objc_msgSend(v10, sel_setIsCellularEnabled_, objc_msgSend(v15, sel_isCellularEnabled));
    objc_msgSend(v10, sel_setEncodedSystemVersion_, objc_msgSend(v15, sel_encodedSystemVersion));
    uint64_t v12 = *(void (**)(uint64_t, void, id))(a3 + 16);
    id v13 = v10;
    v12(a3, v6 & 1, v13);
  }
  else
  {
    uint64_t v14 = *(void (**)(uint64_t, void, void))(a3 + 16);
    v14(a3, v6 & 1, 0);
  }
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_258717A7C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 65, 7);
}

uint64_t partial apply for specialized closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)()
{
  return specialized closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned __int8 *)(v0 + 64));
}

uint64_t sub_258717AE8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_258717B20()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 27, 7);
}

uint64_t sub_258717B58()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t closure #1 in Registry_Impl.device(forPairingID:)partial apply(id *a1)
{
  return partial apply for closure #1 in Registry_Impl.device(forPairingID:)(a1) & 1;
}

uint64_t closure #1 in Registry_Impl.device(forBluetoothID:)partial apply(void **a1)
{
  return partial apply for closure #1 in Registry_Impl.device(forBluetoothID:)(a1) & 1;
}

BOOL static WeakCollection.Weak.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x25A2CB450]();
  uint64_t v4 = MEMORY[0x25A2CB450](a2);
  uint64_t v5 = v4;
  if (v3)
  {
    swift_unknownObjectRelease();
    if (v5)
    {
      swift_unknownObjectRelease();
      return v3 == v5;
    }
    return 0;
  }
  if (v4)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return 1;
}

uint64_t WeakCollection.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t assignWithCopy for WeakCollection.Weak()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t assignWithTake for WeakCollection.Weak()
{
  return MEMORY[0x270FA0600]();
}

uint64_t getEnumTagSinglePayload for WeakCollection.Weak(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WeakCollection.Weak(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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

void *specialized _ArrayBuffer._consumeAndCreateNew()(unint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t specialized WeakCollection.sweep(action:)(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v7 = a1 + 16;
  uint64_t result = swift_beginAccess();
  id v9 = *(void **)(a1 + 16);
  if (!v9[2]) {
    return result;
  }
  unint64_t v10 = 0;
  BOOL v18 = (void **)(a3 + 2);
  while (1)
  {
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v9[v10 + 4], (uint64_t)v20, &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    uint64_t v11 = MEMORY[0x25A2CB450](v20);
    outlined destroy of UUID?((uint64_t)v20, &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    if (v11) {
      break;
    }
    swift_beginAccess();
    uint64_t v12 = *(void **)v7;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)uint64_t v7 = v12;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)v12);
      *(void *)uint64_t v7 = v12;
    }
    unint64_t v14 = v12[2];
    if (v10 >= v14)
    {
      __break(1u);
      goto LABEL_19;
    }
    unint64_t v15 = v14 - 1;
    outlined destroy of UUID?((uint64_t)&v12[v10 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    if ((uint64_t)(v15 - v10) < 0) {
      goto LABEL_21;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    v12[2] = v15;
    *(void *)uint64_t v7 = v12;
    uint64_t result = swift_endAccess();
LABEL_9:
    id v9 = *(void **)v7;
    if (v10 >= *(void *)(*(void *)v7 + 16)) {
      return result;
    }
  }
  if (v11 != a2)
  {
    uint64_t result = swift_unknownObjectRelease();
    ++v10;
    goto LABEL_9;
  }
  swift_beginAccess();
  a3 = *v18;
  if (swift_isUniquelyReferenced_nonNull_native()) {
    goto LABEL_14;
  }
LABEL_19:
  a3 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)a3);
LABEL_14:
  unint64_t v16 = a3[2];
  if (v10 >= v16)
  {
    __break(1u);
LABEL_21:
    swift_release();
    swift_unknownObjectRelease();
    goto LABEL_22;
  }
  unint64_t v17 = v16 - 1;
  outlined destroy of UUID?((uint64_t)&a3[v10 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
  if ((uint64_t)(v17 - v10) >= 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    a3[2] = v17;
    *BOOL v18 = a3;
    swift_endAccess();
    *a4 = 1;
    return swift_unknownObjectRelease();
  }
LABEL_22:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void specialized WeakCollection.sweep(action:)(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess();
  uint64_t v8 = *(void **)(a1 + 16);
  if (!v8[2]) {
    return;
  }
  unint64_t v9 = 0;
  unint64_t v17 = (void **)(a3 + 2);
  while (1)
  {
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v8[v9 + 4], (uint64_t)v19, &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    unint64_t v10 = (void *)MEMORY[0x25A2CB450](v19);
    outlined destroy of UUID?((uint64_t)v19, &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    if (v10) {
      break;
    }
    swift_beginAccess();
    uint64_t v11 = *(void **)v7;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)uint64_t v7 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v11 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)v11);
      *(void *)uint64_t v7 = v11;
    }
    unint64_t v13 = v11[2];
    if (v9 >= v13)
    {
      __break(1u);
      goto LABEL_19;
    }
    unint64_t v14 = v13 - 1;
    outlined destroy of UUID?((uint64_t)&v11[v9 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    if ((uint64_t)(v14 - v9) < 0) {
      goto LABEL_21;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    v11[2] = v14;
    *(void *)uint64_t v7 = v11;
    swift_endAccess();
LABEL_9:
    uint64_t v8 = *(void **)v7;
    if (v9 >= *(void *)(*(void *)v7 + 16)) {
      return;
    }
  }
  if (v10 != a2)
  {

    ++v9;
    goto LABEL_9;
  }
  swift_beginAccess();
  a3 = *v17;
  if (swift_isUniquelyReferenced_nonNull_native()) {
    goto LABEL_14;
  }
LABEL_19:
  a3 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)a3);
LABEL_14:
  unint64_t v15 = a3[2];
  if (v9 >= v15)
  {
    __break(1u);
LABEL_21:
    swift_release();

    goto LABEL_22;
  }
  unint64_t v16 = v15 - 1;
  outlined destroy of UUID?((uint64_t)&a3[v9 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
  if ((uint64_t)(v16 - v9) >= 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    a3[2] = v16;
    void *v17 = a3;
    swift_endAccess();
    *a4 = 1;

    return;
  }
LABEL_22:
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
}

id ActiveDeviceAssertion_Impl.__deallocating_deinit()
{
  objc_msgSend(v0, sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActiveDeviceAssertion_Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActiveDeviceAssertion_Impl()
{
  return self;
}

id ActiveDeviceAssertion_Impl.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActiveDeviceAssertion_Impl.init()()
{
}

uint64_t method lookup function for ActiveDeviceAssertion_Impl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActiveDeviceAssertion_Impl);
}

uint64_t PDRDevice.compatibilityState.getter()
{
  if (objc_msgSend(v0, sel_valueForProperty_, @"compatibilityState"))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  outlined init with take of Any?((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v2;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)v4);
  }
  return 0;
}

void Device_Impl.valueFor(property:)(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___PDRDevice_Impl_registryState;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR___PDRDevice_Impl_registryState);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v6 = objc_msgSend(v4, sel_deviceForPairingID_, isa);

  if (v6)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = (void *)MEMORY[0x25A2CA820](v7);
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v6, sel_objectForKeyedSubscript_, v8);

    if (!v9 || (id v10 = objc_msgSend(v9, sel_value), v9, !v10))
    {

LABEL_9:
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      return;
    }
    self;
    uint64_t v11 = swift_dynamicCastObjCClass();
    if (!v11)
    {
      *(void *)(a1 + 24) = swift_getObjectType();

      *(void *)a1 = v10;
      return;
    }
    uint64_t v12 = *(void **)(v3 + 8);
    if (v12)
    {
      uint64_t v13 = v11;
      swift_unknownObjectRetain();
      id v14 = objc_msgSend(v12, sel_objectForKeyedSubscript_, v13);
      if (v14)
      {
        id v15 = v14;
        *(void *)(a1 + 24) = swift_getObjectType();

        swift_unknownObjectRelease_n();
        *(void *)a1 = v15;
        return;
      }

      swift_unknownObjectRelease_n();
      goto LABEL_9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t Device_Impl.propertyNames()()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___PDRDevice_Impl_registryState);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v3 = objc_msgSend(v1, sel_deviceForPairingID_, isa);

  uint64_t v4 = MEMORY[0x263F8EE78];
  if (v3)
  {
    id v5 = objc_msgSend(v3, sel_allPropertyNames);

    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    int64_t v7 = *(void *)(v6 + 16);
    if (v7)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7, 0);
      uint64_t v8 = (uint64_t *)(v6 + 40);
      do
      {
        uint64_t v9 = *(v8 - 1);
        uint64_t v10 = *v8;
        swift_bridgeObjectRetain();
        uint64_t v11 = MEMORY[0x25A2CA820](v9, v10);
        swift_bridgeObjectRelease();
        unint64_t v13 = *(void *)(v4 + 16);
        unint64_t v12 = *(void *)(v4 + 24);
        if (v13 >= v12 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1);
        }
        v8 += 2;
        *(void *)(v4 + 16) = v13 + 1;
        *(void *)(v4 + 8 * v13 + 32) = v11;
        --v7;
      }
      while (v7);
    }
    swift_bridgeObjectRelease();
  }
  return v4;
}

Swift::Bool __swiftcall Device_Impl.supportsCapabilityRaw(_:)(Swift::UInt32 a1)
{
  if (objc_msgSend(v1, sel_valueForProperty_, @"capabilities"))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
  }
  outlined init with take of Any?((uint64_t)&v6, (uint64_t)v8);
  outlined init with copy of Any?((uint64_t)v8, (uint64_t)&v6);
  if (!*((void *)&v7 + 1))
  {
    outlined destroy of Any?((uint64_t)&v6);
    goto LABEL_8;
  }
  type metadata accessor for NRMiniUUIDSet();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    unsigned __int8 v3 = 0;
    goto LABEL_9;
  }
  unsigned __int8 v3 = objc_msgSend(v5, sel_hasCapability_, bswap32(a1));

LABEL_9:
  outlined destroy of Any?((uint64_t)v8);
  return v3;
}

id Device_Impl.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void Device_Impl.init()()
{
}

id Device_Impl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Device_Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t PDRDevice.localPairingDataStorePath.getter()
{
  return PDRDevice.localPairingDataStorePath.getter(PDRDevicePropertyKeyLocalPairingDataStorePath);
}

uint64_t PDRDevice.isPaired()(void *a1)
{
  if (objc_msgSend(v1, sel_valueForProperty_, *a1))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    uint64_t result = swift_dynamicCast();
    if (result) {
      return v3;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)v5);
    return 0;
  }
  return result;
}

uint64_t PDRDevice.lastActiveDate()@<X0>(uint64_t a1@<X8>)
{
  if (objc_msgSend(v1, sel_valueForProperty_, @"lastActiveDate"))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  outlined init with take of Any?((uint64_t)v7, (uint64_t)v8);
  if (v9)
  {
    uint64_t v3 = type metadata accessor for Date();
    int v4 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(a1, v4 ^ 1u, 1, v3);
  }
  else
  {
    outlined destroy of Any?((uint64_t)v8);
    uint64_t v6 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, 1, 1, v6);
  }
}

id @objc PDRDevice.systemBuildVersion()(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  uint64_t v5 = PDRDevice.localPairingDataStorePath.getter(a3);
  uint64_t v7 = v6;

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x25A2CA820](v5, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

id PDRDevice.advertisedName.getter()
{
  id result = objc_msgSend(v0, sel_valueForProperty_, @"advertisedName");
  if (result)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined init with take of Any(&v3, &v4);
    swift_dynamicCast();
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t PDRDevice.name.getter()
{
  return PDRDevice.localPairingDataStorePath.getter(PDRDevicePropertyKeyName);
}

uint64_t PDRDevice.localPairingDataStorePath.getter(void *a1)
{
  if (objc_msgSend(v1, sel_valueForProperty_, *a1))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)v5);
    return 0;
  }
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

unint64_t type metadata accessor for NRMiniUUIDSet()
{
  unint64_t result = lazy cache variable for type metadata for NRMiniUUIDSet;
  if (!lazy cache variable for type metadata for NRMiniUUIDSet)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NRMiniUUIDSet);
  }
  return result;
}

uint64_t type metadata accessor for Device_Impl()
{
  uint64_t result = type metadata singleton initialization cache for Device_Impl;
  if (!type metadata singleton initialization cache for Device_Impl) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ObjC metadata update function for Device_Impl()
{
  return type metadata accessor for Device_Impl();
}

uint64_t type metadata completion function for Device_Impl()
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

uint64_t method lookup function for Device_Impl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Device_Impl);
}

uint64_t dispatch thunk of Device_Impl.supportsCapabilityRaw(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  id v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<PDRDevicePropertyKey>);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    type metadata accessor for PDRDevicePropertyKey(0);
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

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
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

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x270EF0C88]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0CB8]();
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

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return MEMORY[0x270FA0BF0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
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

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
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

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x270EF1C98]();
}

uint64_t static Set._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x270FA0DD0]();
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

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9E8C0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
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

uint64_t static ContinuousClock.now.getter()
{
  return MEMORY[0x270FA2168]();
}

uint64_t ContinuousClock.Instant.duration(to:)()
{
  return MEMORY[0x270FA2198]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x270FA21A0]();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t Duration.components.getter()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t static Duration.< infix(_:_:)()
{
  return MEMORY[0x270F9FFA8]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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