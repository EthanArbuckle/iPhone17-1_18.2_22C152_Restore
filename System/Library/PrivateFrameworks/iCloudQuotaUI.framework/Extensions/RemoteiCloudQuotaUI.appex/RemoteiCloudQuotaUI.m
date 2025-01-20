BOOL static RemoteError.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void RemoteError.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int RemoteError.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance RemoteError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance RemoteError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance RemoteError()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance RemoteError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance RemoteError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance RemoteError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance RemoteError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance RemoteError()
{
  return Error._getEmbeddedNSError()();
}

uint64_t variable initialization expression of RemoteViewController.flowPresented()
{
  return 0;
}

uint64_t RemoteViewController.flowPresented.getter()
{
  Swift::UInt v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC19RemoteiCloudQuotaUI20RemoteViewController_flowPresented);
  swift_beginAccess();
  return *v1;
}

uint64_t RemoteViewController.flowPresented.setter(char a1)
{
  v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC19RemoteiCloudQuotaUI20RemoteViewController_flowPresented);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*RemoteViewController.flowPresented.modify())()
{
  return RemoteViewController.flowPresented.modify;
}

id RemoteViewController.flowManager.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC19RemoteiCloudQuotaUI20RemoteViewController_flowManager);
  swift_beginAccess();
  v2 = *v1;
  return v2;
}

void RemoteViewController.flowManager.setter(void *a1)
{
  v3 = (void **)(v1 + OBJC_IVAR____TtC19RemoteiCloudQuotaUI20RemoteViewController_flowManager);
  swift_beginAccess();
  v4 = *v3;
  unsigned char *v3 = a1;
}

uint64_t (*RemoteViewController.flowManager.modify())()
{
  return RemoteViewController.flowManager.modify;
}

uint64_t RemoteViewController.flowManager.modify()
{
  return _swift_endAccess();
}

id RemoteViewController.__allocating_init(remoteContext:flowOptions:)(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return RemoteViewController.init(remoteContext:flowOptions:)(a1, a2);
}

id RemoteViewController.init(remoteContext:flowOptions:)(void *a1, void *a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2[OBJC_IVAR____TtC19RemoteiCloudQuotaUI20RemoteViewController_flowPresented] = 0;
  v9 = v2;
  id v10 = [a1 offer];
  id v11 = [objc_allocWithZone((Class)ICQUpgradeFlowManager) initWithOffer:v10];

  if (!v11)
  {
    static QuotaLogger.ui.getter();
    id v22 = a2;
    id v23 = a1;
    v24 = v22;
    v25 = v23;
    v26 = Logger.logObject.getter();
    int v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, (os_log_type_t)v27))
    {
      HIDWORD(v32) = v27;
      uint64_t v33 = v6;
      v35 = a2;
      uint64_t v28 = swift_slowAlloc();
      v34 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 138412546;
      v29 = [v25 offer];
      v30 = v29;
      if (v29) {
        v37 = v29;
      }
      else {
        v37 = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v34 = v30;

      *(_WORD *)(v28 + 12) = 2112;
      if (v35)
      {
        v37 = v24;
        v31 = v24;
      }
      else
      {
        v37 = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v34[1] = v35;

      _os_log_impl((void *)&_mh_execute_header, v26, BYTE4(v32), "Unable to create RemoteViewController using offer %@ and flowOptions %@", (uint8_t *)v28, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      uint64_t v6 = v33;
    }
    else
    {

      v26 = v24;
      v25 = v24;
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    type metadata accessor for RemoteViewController();
    swift_deallocPartialClassInstance();
    return 0;
  }
  *(void *)&v9[OBJC_IVAR____TtC19RemoteiCloudQuotaUI20RemoteViewController_flowManager] = v11;
  id v12 = v11;

  v13 = (objc_class *)type metadata accessor for RemoteViewController();
  v36.receiver = v9;
  v36.super_class = v13;
  id v14 = objc_msgSendSuper2(&v36, "initWithNibName:bundle:", 0, 0);
  id v15 = v14;
  [v12 setDelegate:v15];
  [v12 setFlowOptions:a2];
  id v16 = [a1 link];
  [v12 setIcqLink:v16];

  id v17 = [a1 presentingSceneIdentifier];
  [v12 setPresentingSceneIdentifier:v17];

  id v18 = [a1 presentingSceneBundleIdentifier];
  [v12 setPresentingSceneBundleIdentifier:v18];

  id result = [a1 offer];
  if (result)
  {
    v20 = result;
    NSString v21 = [result bundleIdentifier];

    if (!v21)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v21 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    [self publishOfferDisplayActionEventWithBundleId:v21];

    return v14;
  }
  __break(1u);
  return result;
}

id RemoteViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

void RemoteViewController.init(coder:)()
{
  v0[OBJC_IVAR____TtC19RemoteiCloudQuotaUI20RemoteViewController_flowPresented] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

Swift::Void __swiftcall RemoteViewController.viewDidLoad()()
{
}

Swift::Void __swiftcall RemoteViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (objc_class *)type metadata accessor for RemoteViewController();
  v14.receiver = v1;
  v14.super_class = v7;
  id v8 = objc_msgSendSuper2(&v14, "viewDidAppear:", a1);
  if ((*(uint64_t (**)(id))((swift_isaMask & *v1) + 0x60))(v8))
  {
    static QuotaLogger.ui.getter();
    v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Extension flow is already presented.", v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x68))(1);
    v13 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x78))(v12);
    [v13 startFlowWithParentViewController:v1];
  }
}

id RemoteViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void RemoteViewController.init(nibName:bundle:)()
{
}

id RemoteViewController.__deallocating_deinit()
{
  return RemoteViewController.viewDidLoad()((SEL *)&selRef_dealloc);
}

id RemoteViewController.viewDidLoad()(SEL *a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for RemoteViewController();
  return objc_msgSendSuper2(&v4, *a1);
}

uint64_t type metadata accessor for RemoteViewController()
{
  return self;
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
  v13 = a4 + 32;
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

void *specialized RemoteViewController.upgradeFlowManagerDidComplete(_:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  size_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static QuotaLogger.ui.getter();
  unint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315650;
    uint64_t v11 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002ELL, 0x8000000100007700, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v11 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000021, 0x8000000100007AA0, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v8 + 22) = 2048;
    uint64_t v11 = 60;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s: %s - line %ld", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  type metadata accessor for ICQUIRemoteExtensionEntry();
  uint64_t result = (void *)static ICQUIRemoteExtensionEntry.sharedInstance.getter();
  if (result)
  {
    uint64_t v10 = result;
    [result dismissViewControllerWithError:0];

    return (void *)(*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))(0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t specialized RemoteViewController.upgradeFlowManagerDidCancel(_:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  size_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static QuotaLogger.ui.getter();
  unint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315650;
    uint64_t v13 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002ELL, 0x8000000100007700, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v13 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001FLL, 0x8000000100007840, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v8 + 22) = 2048;
    uint64_t v13 = 66;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s: %s - line %ld", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  type metadata accessor for ICQUIRemoteExtensionEntry();
  uint64_t result = static ICQUIRemoteExtensionEntry.sharedInstance.getter();
  if (result)
  {
    uint64_t v10 = (void *)result;
    lazy protocol witness table accessor for type RemoteError and conformance RemoteError();
    swift_allocError();
    *uint64_t v11 = 0;
    uint64_t v12 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    [v10 dismissViewControllerWithError:v12];

    return (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))(0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type RemoteError and conformance RemoteError()
{
  unint64_t result = lazy protocol witness table cache variable for type RemoteError and conformance RemoteError;
  if (!lazy protocol witness table cache variable for type RemoteError and conformance RemoteError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RemoteError and conformance RemoteError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type RemoteError and conformance RemoteError;
  if (!lazy protocol witness table cache variable for type RemoteError and conformance RemoteError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RemoteError and conformance RemoteError);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RemoteError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RemoteError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100005D6CLL);
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

uint64_t getEnumTag for RemoteError(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for RemoteError(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteError()
{
  return &type metadata for RemoteError;
}

unint64_t type metadata accessor for ICQUIRemoteExtensionEntry()
{
  unint64_t result = lazy cache variable for type metadata for ICQUIRemoteExtensionEntry;
  if (!lazy cache variable for type metadata for ICQUIRemoteExtensionEntry)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for ICQUIRemoteExtensionEntry);
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

uint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
    int v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    int v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  unsigned int v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    id v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    outlined init with take of Any(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    outlined init with take of Any(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    outlined init with take of Any(v36, v37);
    outlined init with take of Any(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)outlined init with take of Any(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    outlined consume of [String : Any].Iterator._Variant();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id RemoteExtensionAppDelegate.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id RemoteExtensionAppDelegate.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteExtensionAppDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id RemoteExtensionAppDelegate.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteExtensionAppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id specialized RemoteExtensionAppDelegate.makeContentViewController()()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unsigned int v6 = (char *)&v31 - v5;
  type metadata accessor for ICQUIRemoteExtensionEntry();
  id result = (id)static ICQUIRemoteExtensionEntry.sharedInstance.getter();
  if (result)
  {
    int64_t v8 = result;
    id v9 = [result offerContext];

    uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    specialized _dictionaryUpCast<A, B, C, D>(_:)(v10);
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v12 = [self contextFromDictionary:isa];

    if (v12)
    {
      Class v13 = (Class)[v12 flowOptionsData];
      if (v13)
      {
        uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v16 = v15;

        Class v13 = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v14, v16);
      }
      type metadata accessor for RemoteViewController();
      id v17 = [self flowOptionsFromData:v13];

      id v18 = v12;
      id v19 = RemoteViewController.__allocating_init(remoteContext:flowOptions:)(v18, v17);
      if (v19)
      {
        id v20 = v19;

        return v20;
      }
      static QuotaLogger.ui.getter();
      unint64_t v24 = v18;
      BOOL v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v32 = v1;
        int64_t v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v31 = (void *)swift_slowAlloc();
        *(_DWORD *)int64_t v27 = 138412290;
        long long v34 = v24;
        unint64_t v24 = v24;
        uint64_t v1 = v32;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v31 = v12;

        _os_log_impl((void *)&_mh_execute_header, v25, v26, "unable to retrieve remote view controller from remote context: %@", v27, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        BOOL v25 = v24;
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
      return 0;
    }
    static QuotaLogger.ui.getter();
    unint64_t v21 = Logger.logObject.getter();
    uint64_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, (os_log_type_t)v22))
    {
      uint64_t v23 = swift_slowAlloc();
      long long v34 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315650;
      uint64_t v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000034, 0x8000000100007B10, (uint64_t *)&v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v23 + 12) = 2080;
      uint64_t v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001BLL, 0x8000000100007B50, (uint64_t *)&v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v23 + 22) = 2048;
      uint64_t v33 = 22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v22, "%s: %s - line %ld: Unable to retrieve context!", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    id result = (id)static ICQUIRemoteExtensionEntry.sharedInstance.getter();
    if (result)
    {
      uint64_t v28 = result;
      lazy protocol witness table accessor for type RemoteError and conformance RemoteError();
      swift_allocError();
      unsigned char *v29 = 1;
      long long v30 = (void *)_convertErrorToNSError(_:)();
      swift_errorRelease();
      [v28 dismissViewControllerWithError:v30];

      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for RemoteExtensionAppDelegate()
{
  return self;
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

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static QuotaLogger.ui.getter()
{
  return static QuotaLogger.ui.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static ICQUIRemoteExtensionEntry.sharedInstance.getter()
{
  return static ICQUIRemoteExtensionEntry.sharedInstance.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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