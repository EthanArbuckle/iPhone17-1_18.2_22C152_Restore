uint64_t type metadata instantiation function for AVPartialAsyncProperty()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t @objc completion handler block implementation for <A><A1, B1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ()(uint64_t a1)
{
  return MEMORY[0x270FA2400](*(void *)(a1 + 32));
}

uint64_t type metadata instantiation function for AVAsyncProperty.Status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t type metadata accessor for AVPartialAsyncProperty()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AVAnyAsyncProperty()
{
  return self;
}

void *static AVPartialAsyncProperty<A>.duration.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter(type metadata accessor for CMTime, 0x6E6F697461727564, 0xE800000000000000);
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMTime(void *a1, uint64_t a2)
{
  id v3 = a1;
  id result = (id)strcmp((const char *)[v3 objCType], "{?=qiIq}");
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 sel_CMTimeValue];
    *(_OWORD *)a2 = v5;
    *(void *)(a2 + 16) = v6;
    *(unsigned char *)(a2 + 24) = 0;
  }
  return result;
}

uint64_t AVAsyncProperty.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata completion function for AVPartialAsyncProperty()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata completion function for AVAsyncProperty()
{
  return swift_initClassMetadata2();
}

uint64_t AVAsynchronousKeyValueLoading.load<A>(_:)(uint64_t a1, uint64_t a2)
{
  v3[16] = a2;
  v3[17] = v2;
  v3[15] = a1;
  v3[18] = *(void *)(*(void *)a2 + 128);
  uint64_t v4 = type metadata accessor for AVAsyncProperty.Status();
  v3[19] = v4;
  v3[20] = *(void *)(v4 - 8);
  v3[21] = swift_task_alloc();
  v3[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A>(_:), 0, 0);
}

uint64_t AVAsynchronousKeyValueLoading.load<A>(_:)()
{
  v1 = *(uint64_t **)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 152);
  long long v5 = *(void **)(v0 + 128);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v5, v1);
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v3 + 16))(v2, v1, v4);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v11 = *(void *)(v0 + 176);
    uint64_t v12 = *(void *)(v0 + 152);
    uint64_t v13 = *(void *)(v0 + 160);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    swift_task_dealloc();
    swift_task_dealloc();
    v10 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      _StringGuts.grow(_:)(20);
      v15._object = (void *)0x80000002128B5AF0;
      v15._countAndFlagsBits = 0xD000000000000012;
      String.append(_:)(v15);
      swift_getWitnessTable();
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v7 = *(void *)(v0 + 168);
    uint64_t v8 = *(void *)(v0 + 144);
    uint64_t v9 = *(void *)(v0 + 120);
    (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 152));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v9, v7, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    v10 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v10();
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  uint64_t v7;
  uint64_t v9;

  v1 = v0[16];
  uint64_t v2 = (void *)v0[17];
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  long long v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2128B2800;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 40) = v3;
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[23] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A>(_:);
  uint64_t v7 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v0[13] = &block_descriptor;
  v0[14] = v7;
  [v2 loadValuesAsynchronouslyForKeys:[v0 + 10] completionHandler:isa];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A>(_:), 0, 0);
}

void AVAsynchronousKeyValueLoading.status<A>(of:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  v26 = a2;
  v28[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = type metadata accessor for CancellationError();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[2];
  v10 = (void *)a1[3];
  uint64_t v11 = (void *)MEMORY[0x216684570](v9, v10);
  v28[0] = 0;
  id v12 = [v3 statusOfValueForKey:v11 error:v28];

  id v13 = v28[0];
  switch((unint64_t)v12)
  {
    case 0uLL:
    case 1uLL:
      type metadata accessor for AVAsyncProperty.Status();
      goto LABEL_12;
    case 2uLL:
      uint64_t v16 = (void (*)(id *))a1[4];
      v28[0] = v3;
      id v17 = v13;
      v16(v28);
      type metadata accessor for AVAsyncProperty.Status();
      swift_storeEnumTagMultiPayload();

      return;
    case 3uLL:
      if (v28[0])
      {
        id v18 = v28[0];
      }
      else
      {
        id v18 = (id)AVLocalizedError();
        if (!v18) {
          goto LABEL_15;
        }
      }
      uint64_t *v26 = (uint64_t)v18;
      type metadata accessor for AVAsyncProperty.Status();
LABEL_12:
      swift_storeEnumTagMultiPayload();
      break;
    case 4uLL:
      id v14 = v28[0];
      AVFall2022OSVersions();
      if (dyld_program_sdk_at_least())
      {
        id v15 = (id)AVLocalizedError();
        if (v15)
        {
          uint64_t *v26 = (uint64_t)v15;
          type metadata accessor for AVAsyncProperty.Status();
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          __break(1u);
LABEL_15:
          __break(1u);
LABEL_16:
          v28[0] = 0;
          v28[1] = (id)0xE000000000000000;
          id v21 = v13;
          _StringGuts.grow(_:)(33);
          v22._object = (void *)0x80000002128B5AD0;
          v22._countAndFlagsBits = 0xD000000000000014;
          String.append(_:)(v22);
          id v27 = v12;
          type metadata accessor for AVKeyValueStatus(0);
          _print_unlocked<A, B>(_:_:)();
          v23._countAndFlagsBits = 0x79656B20726F6620;
          v23._object = (void *)0xE900000000000020;
          String.append(_:)(v23);
          v24._countAndFlagsBits = v9;
          v24._object = v10;
          String.append(_:)(v24);
          _assertionFailure(_:_:file:line:flags:)();
          __break(1u);
        }
      }
      else
      {
        CancellationError.init()();
        lazy protocol witness table accessor for type CancellationError and conformance CancellationError();
        v19 = (void *)swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v20, v8, v5);
        uint64_t *v26 = _convertErrorToNSError(_:)();
        type metadata accessor for AVAsyncProperty.Status();
        swift_storeEnumTagMultiPayload();
      }
      break;
    default:
      goto LABEL_16;
  }
}

uint64_t type metadata accessor for AVAsyncProperty.Status()
{
  return __swift_instantiateGenericMetadata();
}

void *static AVPartialAsyncProperty<A>.duration.getter(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return AVAsyncProperty<>.init(key:)(a2, a3);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for AVAsyncProperty()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for CMTime(uint64_t a1)
{
}

void type metadata accessor for CGImageRef(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t partial apply for closure #1 in AVAsyncProperty<>.init(key:)(void **a1)
{
  return closure #1 in AVAsyncProperty<>.init(key:)(a1, *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t closure #1 in AVAsyncProperty<>.init(key:)(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (void *)MEMORY[0x216684570](a2, a3);
  id v5 = [v3 valueForKey:v4];

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  outlined init with take of Any?((uint64_t)v7, (uint64_t)v8);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  return swift_dynamicCast();
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
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

void *AVAsyncProperty<>.init(key:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(v2 + 120);
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 40) = a2;
  uint64_t v6 = (void *)swift_allocObject();
  v6[4] = partial apply for closure #1 in AVAsyncProperty<>.init(key:);
  v6[5] = v5;
  v6[2] = a1;
  v6[3] = a2;
  swift_bridgeObjectRetain();
  return v6;
}

void destroy for AVAsyncProperty.Status(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 24) - 8) + 64);
  if (v2 <= 8) {
    unint64_t v2 = 8;
  }
  if (v2 > 3) {
    goto LABEL_4;
  }
  unsigned int v4 = ((1 << (8 * v2)) + 1) >> (8 * v2);
  if (v4 > 0xFFFD)
  {
    unsigned int v3 = *(_DWORD *)&a1[v2];
  }
  else
  {
    if (v4 <= 0xFD)
    {
LABEL_4:
      unsigned int v3 = a1[v2];
      goto LABEL_9;
    }
    unsigned int v3 = *(unsigned __int16 *)&a1[v2];
  }
LABEL_9:
  unsigned int v5 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v6 = v2;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_18;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_18;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_18;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_18:
        int v8 = (v7 | (v5 << (8 * v2))) + 2;
        unsigned int v3 = v7 + 2;
        if (v2 < 4) {
          unsigned int v3 = v8;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1)
  {
  }
  else if (!v3)
  {
    (*(void (**)(void))(*(void *)(*(void *)(a2 + 24) - 8) + 8))();
  }
}

char *initializeWithCopy for AVAsyncProperty.Status(char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  }
  if (v4 > 3) {
    goto LABEL_5;
  }
  unsigned int v6 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v6 > 0xFFFD)
  {
    unsigned int v5 = *(_DWORD *)&a2[v4];
  }
  else
  {
    if (v6 <= 0xFD)
    {
LABEL_5:
      unsigned int v5 = a2[v4];
      goto LABEL_10;
    }
    unsigned int v5 = *(unsigned __int16 *)&a2[v4];
  }
LABEL_10:
  unsigned int v7 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a2;
        goto LABEL_19;
      case 2:
        int v9 = *(unsigned __int16 *)a2;
        goto LABEL_19;
      case 3:
        int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_19;
      case 4:
        int v9 = *(_DWORD *)a2;
LABEL_19:
        int v10 = (v9 | (v7 << (8 * v4))) + 2;
        unsigned int v5 = v9 + 2;
        if (v4 < 4) {
          unsigned int v5 = v10;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    id v12 = *(void **)a2;
    *(void *)__dst = *(void *)a2;
    id v13 = v12;
    if (v4 > 3) {
      goto LABEL_28;
    }
    unsigned int v16 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    if (v16 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v4] = 1;
      return __dst;
    }
    if (v16 <= 0xFD) {
LABEL_28:
    }
      __dst[v4] = 1;
    else {
      *(_WORD *)&__dst[v4] = 1;
    }
  }
  else if (v5)
  {
    if (v4 > 3) {
      goto LABEL_33;
    }
    unsigned int v14 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    uint64_t v15 = 2;
    if (v14 > 0xFFFD) {
      uint64_t v15 = 4;
    }
    if (v14 <= 0xFD) {
LABEL_33:
    }
      uint64_t v15 = 1;
    memcpy(__dst, a2, v15 + v4);
  }
  else
  {
    (*(void (**)(char *))(*(void *)(*(void *)(a3 + 24) - 8) + 16))(__dst);
    if (v4 <= 3)
    {
      unsigned int v11 = ((1 << (8 * v4)) + 1) >> (8 * v4);
      if (v11 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v4] = 0;
        return __dst;
      }
      if (v11 > 0xFD)
      {
        *(_WORD *)&__dst[v4] = 0;
        return __dst;
      }
    }
    __dst[v4] = 0;
  }
  return __dst;
}

uint64_t type metadata completion function for AVAsyncProperty.Status()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t AVFall2022OSVersions()
{
  return 0x7E60901FFFFFFFFLL;
}

AVPlayerInterstitialEvent __swiftcall AVPlayerInterstitialEvent.init(primaryItem:identifier:time:templateItems:restrictions:resumptionOffset:playoutLimit:userDefinedAttributes:)(AVPlayerItem primaryItem, Swift::String_optional identifier, CMTime time, Swift::OpaquePointer templateItems, AVPlayerInterstitialEventRestrictions restrictions, CMTime resumptionOffset, CMTime playoutLimit, Swift::OpaquePointer userDefinedAttributes)
{
  Class isa = primaryItem.super.isa;
  uint64_t v16 = *(void *)&time.timescale;
  CMTimeValue value = time.value;
  object = identifier.value._object;
  if (identifier.value._countAndFlagsBits)
  {
    int v9 = (void *)MEMORY[0x216684570](primaryItem._playerItem, identifier.value._countAndFlagsBits);
    swift_bridgeObjectRelease();
  }
  else
  {
    int v9 = 0;
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  type metadata accessor for AVPlayerItem();
  Class v10 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  specialized _dictionaryUpCast<A, B, C, D>(_:)(playoutLimit.epoch);
  swift_bridgeObjectRelease();
  Class v11 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v21[0] = object;
  v21[1] = value;
  v21[2] = v16;
  v20[1] = resumptionOffset.value;
  v20[2] = *(void *)&resumptionOffset.timescale;
  v19[0] = resumptionOffset.epoch;
  v19[1] = playoutLimit.value;
  v19[2] = *(void *)&playoutLimit.timescale;
  v20[0] = restrictions;
  id v12 = [ObjCClassFromMetadata interstitialEventWithPrimaryItem:v9 identifier:v21 time:v10 templateItems:templateItems._rawValue restrictions:v20 resumptionOffset:v19 playoutLimit:v11];

  return (AVPlayerInterstitialEvent)v12;
}

unint64_t type metadata accessor for AVPlayerItem()
{
  unint64_t result = lazy cache variable for type metadata for AVPlayerItem;
  if (!lazy cache variable for type metadata for AVPlayerItem)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for AVPlayerItem);
  }
  return result;
}

uint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
    uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
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
  uint64_t v6 = v2 + 64;
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
    outlined init with copy of Sendable(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    outlined init with take of Sendable(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    outlined init with take of Sendable(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    outlined init with take of Sendable(v36, v37);
    outlined init with take of Sendable(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)outlined init with take of Sendable(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    outlined consume of [String : Sendable].Iterator._Variant();
    return v2;
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

unint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v35 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v34 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v47;
  unsigned int v7 = v45;
  int64_t v8 = &v41;
  unint64_t v9 = &v43;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v36 = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v19 = v36 + 1;
  if (__OFADD__(v36, 1)) {
    goto LABEL_35;
  }
  if (v19 >= v34) {
    goto LABEL_32;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v19);
  int64_t v21 = v36 + 1;
  if (!v20)
  {
    int64_t v21 = v36 + 2;
    if (v36 + 2 >= v34) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v21);
    if (!v20)
    {
      int64_t v21 = v36 + 3;
      if (v36 + 3 >= v34) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v36 + 4;
        if (v36 + 4 >= v34) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v21);
        if (!v20)
        {
          int64_t v22 = v36 + 5;
          if (v36 + 5 < v34)
          {
            unint64_t v20 = *(void *)(v35 + 8 * v22);
            if (v20)
            {
              int64_t v21 = v36 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v21 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                goto LABEL_36;
              }
              if (v21 >= v34) {
                break;
              }
              unint64_t v20 = *(void *)(v35 + 8 * v21);
              ++v22;
              if (v20) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          outlined consume of [String : Sendable].Iterator._Variant();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  int64_t v36 = v21;
  uint64_t v37 = (v20 - 1) & v20;
  for (unint64_t i = __clz(__rbit64(v20)) + (v21 << 6); ; unint64_t i = __clz(__rbit64(v5)) | (v36 << 6))
  {
    char v23 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    uint64_t v25 = *v23;
    uint64_t v24 = v23[1];
    outlined init with copy of Sendable(*(void *)(v1 + 56) + 32 * i, (uint64_t)v6);
    *(void *)&long long v46 = v25;
    *((void *)&v46 + 1) = v24;
    v44[2] = v46;
    v45[0] = v47[0];
    v45[1] = v47[1];
    uint64_t v39 = v25;
    uint64_t v40 = v24;
    outlined init with take of Sendable(v7, &v38);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Sendable);
    swift_dynamicCast();
    uint64_t v27 = v39;
    uint64_t v26 = v40;
    outlined init with take of Sendable(v8, v9);
    outlined init with take of Sendable(v9, v44);
    outlined init with take of Sendable(v44, &v42);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v27, v26);
    unint64_t v28 = result;
    if (v29)
    {
      unint64_t v11 = v9;
      unint64_t v12 = v8;
      uint64_t v13 = v1;
      unint64_t v14 = v7;
      int64_t v15 = v6;
      int64_t v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *int64_t v16 = v27;
      v16[1] = v26;
      uint64_t v6 = v15;
      unsigned int v7 = v14;
      uint64_t v1 = v13;
      int64_t v8 = v12;
      unint64_t v9 = v11;
      id v17 = (_OWORD *)(v2[7] + 32 * v28);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
      unint64_t result = (unint64_t)outlined init with take of Sendable(&v42, v17);
      unint64_t v5 = v37;
      if (!v37) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v30 = (uint64_t *)(v2[6] + 16 * result);
    *long long v30 = v27;
    v30[1] = v26;
    unint64_t result = (unint64_t)outlined init with take of Sendable(&v42, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v31 = v2[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_34;
    }
    v2[2] = v33;
    unint64_t v5 = v37;
    if (!v37) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v37 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

id AVPlayerInterstitialEvent.init(primaryItem:identifier:date:templateItems:restrictions:resumptionOffset:playoutLimit:userDefinedAttributes:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a3)
  {
    int64_t v15 = (void *)MEMORY[0x216684570](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v15 = 0;
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  type metadata accessor for AVPlayerItem();
  Class v17 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  specialized _dictionaryUpCast<A, B, C, D>(_:)(a13);
  swift_bridgeObjectRelease();
  Class v18 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v27[1] = a8;
  v27[2] = a9;
  v26[0] = a10;
  v26[1] = a11;
  v26[2] = a12;
  v27[0] = a7;
  id v19 = [ObjCClassFromMetadata interstitialEventWithPrimaryItem:a1 identifier:v15 date:isa templateItems:v17 restrictions:a6 resumptionOffset:v27 playoutLimit:v26 userDefinedAttributes:v18];

  uint64_t v20 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(a4, v20);
  return v19;
}

void type metadata accessor for CGImageRef(uint64_t a1)
{
}

__n128 __swift_memcpy96_4(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for CMTimeMapping(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 96)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CMTimeMapping(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 96) = v3;
  return result;
}

void type metadata accessor for CMTimeMapping(uint64_t a1)
{
}

void type metadata accessor for AVTrackAssociationType(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CGSize(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CGSize(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for CMTimeRange(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMTimeRange(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CMTimeRange(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CMTimeRange(uint64_t a1)
{
}

void type metadata accessor for CMTagCollectionRef(uint64_t a1)
{
}

void type metadata accessor for CMFormatDescriptionRef(uint64_t a1)
{
}

void type metadata accessor for AVMediaCharacteristic(uint64_t a1)
{
}

void type metadata accessor for AVMetadataKey(uint64_t a1)
{
}

void type metadata accessor for AVMetadataFormat(uint64_t a1)
{
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

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

void type metadata accessor for AVKeyValueStatus(uint64_t a1)
{
}

void type metadata accessor for AVFileType(uint64_t a1)
{
}

void type metadata accessor for AVMediaType(uint64_t a1)
{
}

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMTime(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CMTime(uint64_t result, int a2, int a3)
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

void type metadata accessor for CFDictionaryRef(uint64_t a1)
{
}

void type metadata accessor for related decl 'e' for AVError(uint64_t a1)
{
}

void type metadata accessor for AVMetadataExtraAttributeKey(uint64_t a1)
{
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance AVMetadataExtraAttributeKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance AVMetadataExtraAttributeKey(a1, a2, MEMORY[0x263F8D308]);
}

id protocol witness for _BridgedStoredNSError._nsError.getter in conformance related decl 'e' for AVError()
{
  return *v0;
}

uint64_t protocol witness for _BridgedStoredNSError.init(_nsError:) in conformance related decl 'e' for AVError@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance AVFileType(uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance AVMetadataExtraAttributeKey(a1, a2, MEMORY[0x263F07B58]);
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance AVAssetExportSessionStatus@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance AVAssetExportSessionStatus(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance AVMetadataExtraAttributeKey(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance AVMetadataExtraAttributeKey(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance AVMetadataExtraAttributeKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = MEMORY[0x216684570](v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for static CustomNSError.errorDomain.getter in conformance related decl 'e' for AVError()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t protocol witness for CustomNSError.errorCode.getter in conformance related decl 'e' for AVError(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);

  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t protocol witness for CustomNSError.errorUserInfo.getter in conformance related decl 'e' for AVError(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);

  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t protocol witness for _ObjectiveCBridgeableError.init(_bridgedNSError:) in conformance related decl 'e' for AVError(void *a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);
  id v5 = a1;

  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance related decl 'e' for AVError()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance related decl 'e' for AVError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);

  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance related decl 'e' for AVError()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVMetadataExtraAttributeKey(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey, type metadata accessor for AVMetadataExtraAttributeKey);
  uint64_t v3 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey, type metadata accessor for AVMetadataExtraAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t base witness table accessor for RawRepresentable in AVMetadataExtraAttributeKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey, type metadata accessor for AVMetadataExtraAttributeKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVMetadataExtraAttributeKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey, type metadata accessor for AVMetadataExtraAttributeKey);
}

uint64_t lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t base witness table accessor for Equatable in AVMetadataExtraAttributeKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey, type metadata accessor for AVMetadataExtraAttributeKey);
}

uint64_t protocol witness for Error._domain.getter in conformance related decl 'e' for AVError(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t protocol witness for Error._code.getter in conformance related decl 'e' for AVError(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t protocol witness for Error._userInfo.getter in conformance related decl 'e' for AVError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance related decl 'e' for AVError(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);

  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance related decl 'e' for AVError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);

  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t base witness table accessor for Equatable in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);
}

uint64_t base witness table accessor for Error in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance AVError(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVMediaType(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaType and conformance AVMediaType, type metadata accessor for AVMediaType);
  uint64_t v3 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaType and conformance AVMediaType, type metadata accessor for AVMediaType);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t base witness table accessor for RawRepresentable in AVMediaType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaType and conformance AVMediaType, type metadata accessor for AVMediaType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVMediaType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaType and conformance AVMediaType, type metadata accessor for AVMediaType);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance AVFileType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVFileType(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVFileType and conformance AVFileType, type metadata accessor for AVFileType);
  uint64_t v3 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVFileType and conformance AVFileType, type metadata accessor for AVFileType);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVMetadataFormat(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataFormat and conformance AVMetadataFormat, type metadata accessor for AVMetadataFormat);
  uint64_t v3 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataFormat and conformance AVMetadataFormat, type metadata accessor for AVMetadataFormat);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVMetadataKey(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataKey and conformance AVMetadataKey, type metadata accessor for AVMetadataKey);
  uint64_t v3 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataKey and conformance AVMetadataKey, type metadata accessor for AVMetadataKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVMediaCharacteristic(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaCharacteristic and conformance AVMediaCharacteristic, type metadata accessor for AVMediaCharacteristic);
  uint64_t v3 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaCharacteristic and conformance AVMediaCharacteristic, type metadata accessor for AVMediaCharacteristic);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance AVMetadataExtraAttributeKey@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x216684570](*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVTrackAssociationType(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVTrackAssociationType and conformance AVTrackAssociationType, type metadata accessor for AVTrackAssociationType);
  uint64_t v3 = lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVTrackAssociationType and conformance AVTrackAssociationType, type metadata accessor for AVTrackAssociationType);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance AVMetadataExtraAttributeKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AVMetadataExtraAttributeKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AVMetadataExtraAttributeKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t base witness table accessor for Equatable in AVMediaType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaType and conformance AVMediaType, type metadata accessor for AVMediaType);
}

uint64_t base witness table accessor for RawRepresentable in AVFileType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVFileType and conformance AVFileType, type metadata accessor for AVFileType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVFileType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVFileType and conformance AVFileType, type metadata accessor for AVFileType);
}

uint64_t base witness table accessor for Equatable in AVFileType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVFileType and conformance AVFileType, type metadata accessor for AVFileType);
}

uint64_t base witness table accessor for RawRepresentable in AVMetadataFormat()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataFormat and conformance AVMetadataFormat, type metadata accessor for AVMetadataFormat);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVMetadataFormat()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataFormat and conformance AVMetadataFormat, type metadata accessor for AVMetadataFormat);
}

uint64_t base witness table accessor for Equatable in AVMetadataFormat()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataFormat and conformance AVMetadataFormat, type metadata accessor for AVMetadataFormat);
}

uint64_t base witness table accessor for RawRepresentable in AVMetadataKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataKey and conformance AVMetadataKey, type metadata accessor for AVMetadataKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVMetadataKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataKey and conformance AVMetadataKey, type metadata accessor for AVMetadataKey);
}

uint64_t base witness table accessor for Equatable in AVMetadataKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataKey and conformance AVMetadataKey, type metadata accessor for AVMetadataKey);
}

uint64_t base witness table accessor for RawRepresentable in AVMediaCharacteristic()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaCharacteristic and conformance AVMediaCharacteristic, type metadata accessor for AVMediaCharacteristic);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVMediaCharacteristic()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaCharacteristic and conformance AVMediaCharacteristic, type metadata accessor for AVMediaCharacteristic);
}

uint64_t base witness table accessor for Equatable in AVMediaCharacteristic()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaCharacteristic and conformance AVMediaCharacteristic, type metadata accessor for AVMediaCharacteristic);
}

uint64_t base witness table accessor for RawRepresentable in AVTrackAssociationType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVTrackAssociationType and conformance AVTrackAssociationType, type metadata accessor for AVTrackAssociationType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVTrackAssociationType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVTrackAssociationType and conformance AVTrackAssociationType, type metadata accessor for AVTrackAssociationType);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AVMetadataExtraAttributeKey()
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

uint64_t base witness table accessor for Equatable in AVTrackAssociationType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVTrackAssociationType and conformance AVTrackAssociationType, type metadata accessor for AVTrackAssociationType);
}

uint64_t base witness table accessor for CustomNSError in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);
}

uint64_t base witness table accessor for _ObjectiveCBridgeableError in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);
}

uint64_t base witness table accessor for Hashable in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : _ErrorCodeProtocol in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVError and conformance AVError, type metadata accessor for AVError);
}

void type metadata accessor for AVError(uint64_t a1)
{
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : RawRepresentable in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVError and conformance AVError, type metadata accessor for AVError);
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

uint64_t base witness table accessor for Equatable in AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVError and conformance AVError, type metadata accessor for AVError);
}

uint64_t associated type witness table accessor for _ErrorCodeProtocol._ErrorType : _BridgedStoredNSError in AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, type metadata accessor for related decl 'e' for AVError);
}

_OWORD *outlined init with take of Sendable(_OWORD *a1, _OWORD *a2)
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

uint64_t outlined init with copy of Sendable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for AVCaptureFlashMode(uint64_t a1)
{
}

void type metadata accessor for AVCaptureColorSpace(uint64_t a1)
{
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CMVideoDimensions(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CMVideoDimensions(uint64_t result, int a2, int a3)
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

void type metadata accessor for CMVideoDimensions(uint64_t a1)
{
}

void type metadata accessor for AVAssetExportSessionStatus(uint64_t a1)
{
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
}

void *static AVPartialAsyncProperty<A>.extraAttributes.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataExtraAttributeKey : Any]?, 0x7474416172747865, 0xEF73657475626972);
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

void *static AVPartialAsyncProperty<A>.value.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for (NSCopying & NSObject)?, 0x65756C6176, 0xE500000000000000);
}

void *static AVPartialAsyncProperty<A>.stringValue.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for String?, 0x6156676E69727473, 0xEB0000000065756CLL);
}

void *static AVPartialAsyncProperty<A>.numberValue.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for NSNumber?, 0x61567265626D756ELL, 0xEB0000000065756CLL);
}

void *static AVPartialAsyncProperty<A>.dateValue.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for Date?, 0x756C615665746164, 0xE900000000000065);
}

void *static AVPartialAsyncProperty<A>.dataValue.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for Data?, 0x756C615661746164, 0xE900000000000065);
}

void *static AVPartialAsyncProperty<A>.extraAttributes.getter(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return AVAsyncProperty<>.init(key:)(a2, a3);
}

void *static AVPartialAsyncProperty<A>.tracks.getter()
{
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVFragmentedMovieTrack]);
  type metadata accessor for AVAsyncProperty();
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVCompositionTrack]);
  type metadata accessor for AVAsyncProperty();
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVAssetTrack], 0x736B63617274, 0xE600000000000000);
}

{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVMutableCompositionTrack]);
  type metadata accessor for AVAsyncProperty();
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVFragmentedAssetTrack]);
  type metadata accessor for AVAsyncProperty();
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVMovieTrack]);
  type metadata accessor for AVAsyncProperty();
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVAssetTrack]);
  type metadata accessor for AVAsyncProperty();
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

uint64_t related decl 'e' for AVError.device.getter()
{
  return 0;
}

uint64_t related decl 'e' for AVError.device.getter(uint64_t a1)
{
  *(void *)&long long v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  uint64_t v1 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v1 + 16) && (unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
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
    type metadata accessor for AVCaptureDevice();
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

unint64_t lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError()
{
  unint64_t result = lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError;
  if (!lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError)
  {
    type metadata accessor for related decl 'e' for AVError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError);
  }
  return result;
}

CMTimeValue related decl 'e' for AVError.time.getter(uint64_t a1)
{
  *(void *)&long long v17 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  uint64_t v2 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v2 + 16) && (unint64_t v5 = specialized __RawDictionaryStorage.find<A>(_:)(v3, v4), (v6 & 1) != 0))
  {
    outlined init with copy of Sendable(*(void *)(v2 + 56) + 32 * v5, (uint64_t)&v19);
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v20 + 1))
  {
    type metadata accessor for CMTime(0);
    if (swift_dynamicCast()) {
      return v17;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v19);
  }
  *(void *)&long long v17 = a1;
  uint64_t v8 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v8 + 16) && (unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v10), (v12 & 1) != 0))
  {
    outlined init with copy of Sendable(*(void *)(v8 + 56) + 32 * v11, (uint64_t)&v17);
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v18 + 1))
  {
    outlined init with take of Sendable(&v17, &v19);
    outlined init with copy of Sendable((uint64_t)&v19, (uint64_t)&v17);
    type metadata accessor for CFDictionaryRef(0);
    swift_dynamicCast();
    CFDictionaryRef v13 = dictionaryRepresentation;
    CMTimeMakeFromDictionary(&v15, dictionaryRepresentation);
    CMTimeValue value = v15.value;

    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v19);
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v17);
    return 0;
  }
  return value;
}

uint64_t related decl 'e' for AVError.fileSize.getter(uint64_t a1)
{
  return related decl 'e' for AVError.fileSize.getter(a1);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v7;
  long long v8;
  long long v9;

  *(void *)&uint64_t v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  uint64_t v1 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v1 + 16) && (uint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    uint64_t v8 = 0u;
    uint64_t v9 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v9 + 1))
  {
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

uint64_t related decl 'e' for AVError.processID.getter(uint64_t a1)
{
  return related decl 'e' for AVError.fileSize.getter(a1);
}

uint64_t related decl 'e' for AVError.recordingSuccessfullyFinished.getter(uint64_t a1)
{
  *(void *)&long long v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  uint64_t v1 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v1 + 16) && (unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
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
    if (swift_dynamicCast()) {
      return v7;
    }
    else {
      return 2;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v8);
    return 2;
  }
}

uint64_t related decl 'e' for AVError.mediaType.getter(uint64_t a1)
{
  *(void *)&long long v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  uint64_t v1 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v1 + 16) && (unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
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

{
  return related decl 'e' for AVError.mediaType.getter(a1, MEMORY[0x263F210C0], type metadata accessor for AVMediaType);
}

uint64_t related decl 'e' for AVError.mediaSubtypes.getter(uint64_t a1)
{
  *(void *)&long long v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  uint64_t v1 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v1 + 16) && (unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
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

uint64_t related decl 'e' for AVError.presentationTimeStamp.getter(uint64_t a1)
{
  *(void *)&long long v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  uint64_t v1 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v1 + 16) && (unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
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
    type metadata accessor for CMTime(0);
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

unint64_t related decl 'e' for AVError.persistentTrackID.getter(uint64_t a1)
{
  *(void *)&long long v11 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  uint64_t v1 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v1 + 16) && (unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v11);
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v12 + 1))
  {
    int v6 = swift_dynamicCast();
    uint64_t v7 = v10;
    unsigned __int8 v8 = v6 ^ 1;
    if (!v6) {
      uint64_t v7 = 0;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v11);
    uint64_t v7 = 0;
    unsigned __int8 v8 = 1;
  }
  return v7 | ((unint64_t)v8 << 32);
}

uint64_t related decl 'e' for AVError.fileType.getter(uint64_t a1)
{
  return related decl 'e' for AVError.mediaType.getter(a1, MEMORY[0x263F210B0], type metadata accessor for AVFileType);
}

uint64_t related decl 'e' for AVError.mediaType.getter(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  *(void *)&long long v11 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  uint64_t v4 = _BridgedStoredNSError.userInfo.getter();
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v4 + 16) && (unint64_t v7 = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6), (v8 & 1) != 0))
  {
    outlined init with copy of Sendable(*(void *)(v4 + 56) + 32 * v7, (uint64_t)&v11);
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v12 + 1))
  {
    a3(0);
    if (swift_dynamicCast()) {
      return v10;
    }
    else {
      return 0;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v11);
    return 0;
  }
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for AVCaptureDevice()
{
  unint64_t result = lazy cache variable for type metadata for AVCaptureDevice;
  if (!lazy cache variable for type metadata for AVCaptureDevice)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for AVCaptureDevice);
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
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
        CFDictionaryRef v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void AVCaptureIndexPicker.setActionQueue(_:action:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[4] = a2;
  v6[5] = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = thunk for @escaping @callee_guaranteed (@unowned Int) -> ();
  v6[3] = &block_descriptor_3;
  uint64_t v5 = _Block_copy(v6);
  swift_retain();
  swift_release();
  [v3 setActionQueue:a1 action:v5];
  _Block_release(v5);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
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

unint64_t lazy protocol witness table accessor for type CancellationError and conformance CancellationError()
{
  unint64_t result = lazy protocol witness table cache variable for type CancellationError and conformance CancellationError;
  if (!lazy protocol witness table cache variable for type CancellationError and conformance CancellationError)
  {
    type metadata accessor for CancellationError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CancellationError and conformance CancellationError);
  }
  return result;
}

unint64_t AVAnyAsyncProperty.description.getter()
{
  return 0xD000000000000012;
}

uint64_t AVAnyAsyncProperty.deinit()
{
  return v0;
}

uint64_t AVAnyAsyncProperty.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AVAnyAsyncProperty()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88))();
}

uint64_t AVPartialAsyncProperty.init(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t AVPartialAsyncProperty.description.getter()
{
  uint64_t v6 = _typeName(_:qualified:)();
  v1._countAndFlagsBits = 46;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v3;
  v4._object = v2;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t AVPartialAsyncProperty.__ivar_destroyer()
{
  return swift_bridgeObjectRelease();
}

uint64_t AVPartialAsyncProperty.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AVPartialAsyncProperty.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

void *AVAsyncProperty.__allocating_init(key:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result = (void *)swift_allocObject();
  result[4] = a3;
  result[5] = a4;
  result[2] = a1;
  result[3] = a2;
  return result;
}

void *AVAsyncProperty.init(key:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return v4;
}

uint64_t AVAsyncProperty.__ivar_destroyer()
{
  return swift_release();
}

uint64_t AVAsyncProperty.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t static AVAsyncProperty.Status<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v36 = a5;
  uint64_t v37 = v6;
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v35 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  int64_t v34 = (char *)&v33 - v9;
  uint64_t v10 = type metadata accessor for AVAsyncProperty.Status();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  BOOL v14 = (void **)((char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v12);
  int64_t v16 = (char *)&v33 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v18 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  int64_t v21 = (char *)&v33 - v20;
  int64_t v22 = (void **)((char *)&v33 + *(int *)(v19 + 48) - v20);
  uint64_t v38 = v11;
  char v23 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v23((char *)&v33 - v20, v39, v10);
  v23((char *)v22, v40, v10);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      v23((char *)v14, (uint64_t)v21, v10);
      uint64_t v24 = *v14;
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v25 = *v22;
        type metadata accessor for NSObject();
        char v26 = static NSObject.== infix(_:_:)();

        goto LABEL_13;
      }

      goto LABEL_11;
    case 2u:
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_11;
      }
      goto LABEL_9;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_11;
      }
LABEL_9:
      char v26 = 1;
      goto LABEL_13;
    default:
      v23(v16, (uint64_t)v21, v10);
      if (swift_getEnumCaseMultiPayload())
      {
        (*(void (**)(char *, uint64_t))(v37 + 8))(v16, a4);
LABEL_11:
        char v26 = 0;
      }
      else
      {
        uint64_t v27 = v37;
        unint64_t v28 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
        char v29 = v34;
        v28(v34, v16, a4);
        long long v30 = v35;
        v28(v35, (char *)v22, a4);
        char v26 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v31 = *(void (**)(char *, uint64_t))(v27 + 8);
        v31(v30, a4);
        v31(v29, a4);
LABEL_13:
        uint64_t v18 = v38;
        TupleTypeMetadata2 = v10;
      }
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, TupleTypeMetadata2);
      return v26 & 1;
  }
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

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> AVAsyncProperty<A, B>.Status(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVAsyncProperty.Status<>.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24), *(void *)(a4 - 8));
}

uint64_t AVAsyncProperty.Status.description.getter(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (void **)((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void **))(v8 + 16))(v7);
  uint64_t v9 = 0x2074657920746F4ELL;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v12 = *v7;
      uint64_t v20 = 0x282064656C696146;
      unint64_t v21 = 0xE800000000000000;
      id v13 = [v12 sel_description];
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      int64_t v16 = v15;

      v17._countAndFlagsBits = v14;
      v17._object = v16;
      String.append(_:)(v17);
      swift_bridgeObjectRelease();
      v18._countAndFlagsBits = 41;
      v18._object = (void *)0xE100000000000000;
      String.append(_:)(v18);

      uint64_t v9 = v20;
      break;
    case 2u:
      return v9;
    case 3u:
      uint64_t v9 = 0x676E6964616F4CLL;
      break;
    default:
      (*(void (**)(char *, void **, uint64_t))(v2 + 32))(v5, v7, v1);
      uint64_t v20 = 0;
      unint64_t v21 = 0xE000000000000000;
      v10._countAndFlagsBits = 0x2820646564616F4CLL;
      v10._object = (void *)0xE800000000000000;
      String.append(_:)(v10);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v11._countAndFlagsBits = 41;
      v11._object = (void *)0xE100000000000000;
      String.append(_:)(v11);
      uint64_t v9 = v20;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
      break;
  }
  return v9;
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  v5[18] = a4;
  v5[19] = v4;
  v5[16] = a2;
  v5[17] = a3;
  v5[15] = a1;
  uint64_t v6 = *a4;
  v5[20] = *(void *)(*(void *)a3 + 128);
  uint64_t v7 = type metadata accessor for AVAsyncProperty.Status();
  v5[21] = v7;
  v5[22] = *(void *)(v6 + 128);
  uint64_t v8 = type metadata accessor for AVAsyncProperty.Status();
  v5[23] = v8;
  v5[24] = swift_getTupleTypeMetadata2();
  v5[25] = swift_task_alloc();
  v5[26] = *(void *)(v8 - 8);
  v5[27] = swift_task_alloc();
  v5[28] = *(void *)(v7 - 8);
  v5[29] = swift_task_alloc();
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B>(_:_:), 0, 0);
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B>(_:_:)()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = (void *)v0[19];
  uint64_t v3 = v0[17];
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2128B2810;
  *(void *)(v8 + 32) = v5;
  *(void *)(v8 + 40) = v4;
  *(void *)(v8 + 48) = v7;
  *(void *)(v8 + 56) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v0[32] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A, B>(_:_:);
  uint64_t v10 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for <A><A1, B1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v0[13] = &block_descriptor_2;
  v0[14] = v10;
  [v2 loadValuesAsynchronouslyForKeys:[v0 + 10] completionHandler:isa];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B>(_:_:), 0, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t *, uint64_t);
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t (*v20)(void);
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  uint64_t v1 = *(uint64_t **)(v0 + 248);
  uint64_t v2 = *(uint64_t **)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v36 = *(void *)(v0 + 192);
  uint64_t v37 = *(void *)(v0 + 184);
  uint64_t v6 = *(void *)(v0 + 168);
  uint64_t v7 = *(void **)(v0 + 144);
  uint64_t v8 = *(void **)(v0 + 136);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v2);
  uint64_t v9 = v4 + *(int *)(v36 + 48);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v3 + 16);
  v10(v4, v1, v6);
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v5 + 16))(v9, v2, v37);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    id v13 = *(void *)(v0 + 208);
    uint64_t v14 = *(void *)(v0 + 184);
    v10(*(void *)(v0 + 232), *(uint64_t **)(v0 + 200), *(void *)(v0 + 168));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v14);
    int64_t v34 = *(void *)(v0 + 184);
  }
  else
  {
    if (!EnumCaseMultiPayload)
    {
      v10(*(void *)(v0 + 240), *(uint64_t **)(v0 + 200), *(void *)(v0 + 168));
      if (!swift_getEnumCaseMultiPayload())
      {
        char v26 = *(void *)(v0 + 240);
        uint64_t v25 = *(void *)(v0 + 248);
        uint64_t v27 = *(void *)(v0 + 224);
        unint64_t v28 = *(void *)(v0 + 176);
        long long v30 = *(void *)(v0 + 160);
        char v29 = *(void *)(v0 + 168);
        uint64_t v31 = *(void *)(v0 + 120);
        uint64_t v33 = *(void *)(v0 + 128);
        uint64_t v35 = *(void *)(v0 + 200);
        (*(void (**)(void))(*(void *)(v0 + 208) + 8))();
        BOOL v32 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
        v32(v25, v29);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32))(v31, v26, v30);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v33, v9, v28);
        v32(v35, v29);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
        goto LABEL_9;
      }
      (*(void (**)(void))(*(void *)(*(void *)(v0 + 160) - 8) + 8))(*(void *)(v0 + 240));
    }
    uint64_t v12 = *(void *)(v0 + 184);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      _StringGuts.grow(_:)(28);
      v22._object = (void *)0x80000002128B5B10;
      v22._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v22);
      swift_getWitnessTable();
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v23._countAndFlagsBits = 8236;
      v23._object = (void *)0xE200000000000000;
      String.append(_:)(v23);
      swift_getWitnessTable();
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v24._countAndFlagsBits = 41;
      v24._object = (void *)0xE100000000000000;
      String.append(_:)(v24);
      return _assertionFailure(_:_:file:line:flags:)();
    }
    int64_t v34 = v12;
  }
  uint64_t v15 = *(void *)(v0 + 248);
  int64_t v16 = *(void *)(v0 + 208);
  Swift::String v17 = *(void *)(v0 + 216);
  Swift::String v18 = *(void *)(v0 + 168);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 224) + 8);
  v19(*(void *)(v0 + 200), v18);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v34);
  v19(v15, v18);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
LABEL_9:
  return v20();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  v7[20] = a6;
  v7[21] = v6;
  v7[18] = a4;
  v7[19] = a5;
  v7[16] = a2;
  v7[17] = a3;
  v7[15] = a1;
  uint64_t v8 = *a5;
  uint64_t v9 = *a6;
  v7[22] = *(void *)(*(void *)a4 + 128);
  uint64_t v10 = type metadata accessor for AVAsyncProperty.Status();
  v7[23] = v10;
  v7[24] = *(void *)(v8 + 128);
  uint64_t v11 = type metadata accessor for AVAsyncProperty.Status();
  v7[25] = v11;
  v7[26] = *(void *)(v9 + 128);
  uint64_t v12 = type metadata accessor for AVAsyncProperty.Status();
  v7[27] = v12;
  v7[28] = swift_getTupleTypeMetadata3();
  v7[29] = swift_task_alloc();
  v7[30] = *(void *)(v12 - 8);
  v7[31] = swift_task_alloc();
  v7[32] = *(void *)(v11 - 8);
  v7[33] = swift_task_alloc();
  v7[34] = swift_task_alloc();
  v7[35] = *(void *)(v10 - 8);
  v7[36] = swift_task_alloc();
  v7[37] = swift_task_alloc();
  v7[38] = swift_task_alloc();
  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C>(_:_:_:), 0, 0);
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C>(_:_:_:)()
{
  id v14 = (id)v0[21];
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v9 = *(void *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2128B2820;
  *(void *)(v10 + 32) = v5;
  *(void *)(v10 + 40) = v4;
  *(void *)(v10 + 48) = v7;
  *(void *)(v10 + 56) = v6;
  *(void *)(v10 + 64) = v8;
  *(void *)(v10 + 72) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v0[39] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A, B, C>(_:_:_:);
  uint64_t v12 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v0[13] = &block_descriptor_4;
  v0[14] = v12;
  [v14 loadValuesAsynchronouslyForKeys:isa completionHandler:v0 + 10];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C>(_:_:_:), 0, 0);
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  void (*v14)(uint64_t, uint64_t *, uint64_t);
  void (*v15)(uint64_t, uint64_t *, uint64_t);
  int EnumCaseMultiPayload;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t (*v31)(void);
  Swift::String v33;
  Swift::String v34;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;

  uint64_t v1 = v0 + 30;
  v64 = v0[30];
  uint64_t v3 = (uint64_t *)v0[38];
  uint64_t v2 = (void *)v0[39];
  uint64_t v4 = v0[35];
  v57 = (uint64_t *)v0[34];
  v50 = v0 + 32;
  uint64_t v5 = (uint64_t *)v0[31];
  v66 = v0[32];
  uint64_t v7 = v0[28];
  uint64_t v6 = v0[29];
  v61 = v0[25];
  v62 = v0[27];
  v59 = v0[23];
  uint64_t v8 = (void *)v0[20];
  uint64_t v9 = (void *)*(v1 - 12);
  uint64_t v10 = (void *)*(v1 - 11);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v9, v3);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v10, v57);
  uint64_t v11 = v5;
  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v5);
  uint64_t v12 = (uint64_t *)(v6 + *(int *)(v7 + 48));
  id v13 = (uint64_t *)(v6 + *(int *)(v7 + 64));
  v52 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v4 + 16);
  v52(v6, v3, v59);
  id v14 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v66 + 16);
  v67 = v12;
  v14((uint64_t)v12, v57, v61);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v64 + 16);
  v65 = v13;
  v15((uint64_t)v13, v11, v62);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    Swift::String v17 = v56;
    uint64_t v20 = v56[30];
    unint64_t v21 = v56[27];
    v52(v56[36], (uint64_t *)v56[29], v56[23]);
    (*(void (**)(uint64_t *, uint64_t))(v20 + 8))(v13, v21);
    v53 = v56[27];
    v55 = v56[25];
    uint64_t v19 = v50;
    uint64_t v12 = v67;
  }
  else
  {
    Swift::String v17 = v56;
    if (!EnumCaseMultiPayload)
    {
      v52(v56[37], (uint64_t *)v56[29], v56[23]);
      if (!swift_getEnumCaseMultiPayload())
      {
        v14(v56[33], v12, v56[25]);
        if (!swift_getEnumCaseMultiPayload())
        {
          uint64_t v37 = v56[38];
          uint64_t v38 = v56[35];
          v63 = v56[37];
          uint64_t v39 = v56[34];
          v54 = v56[33];
          uint64_t v40 = v56[32];
          v58 = v56[29];
          v49 = v56[26];
          uint64_t v41 = v56[25];
          long long v42 = v56[22];
          uint64_t v43 = v56[23];
          v51 = v56[17];
          v47 = v56[24];
          v48 = v56[16];
          long long v46 = v56[15];
          (*(void (**)(void))(v56[30] + 8))();
          v44 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
          v44(v39, v41);
          v45 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
          v45(v37, v43);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 32))(v46, v63, v42);
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v47 - 8) + 32))(v48, v54);
          (*(void (**)(uint64_t, uint64_t *))(*(void *)(v49 - 8) + 32))(v51, v65);
          v44((uint64_t)v67, v41);
          v45(v58, v43);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          uint64_t v31 = (uint64_t (*)(void))v56[1];
          goto LABEL_13;
        }
        (*(void (**)(void))(*(void *)(v56[24] - 8) + 8))(v56[33]);
      }
      (*(void (**)(void))(*(void *)(v56[22] - 8) + 8))(v56[37]);
    }
    Swift::String v18 = v56[25];
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = v1;
      v53 = v56[27];
      uint64_t v12 = v13;
      v55 = v18;
    }
    else
    {
      int64_t v22 = v56[27];
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        _StringGuts.grow(_:)(32);
        v33._object = (void *)0x80000002128B5B10;
        v33._countAndFlagsBits = 0xD000000000000015;
        String.append(_:)(v33);
        swift_getWitnessTable();
        DefaultStringInterpolation.appendInterpolation<A>(_:)();
        v34._countAndFlagsBits = 8236;
        v34._object = (void *)0xE200000000000000;
        String.append(_:)(v34);
        swift_getWitnessTable();
        DefaultStringInterpolation.appendInterpolation<A>(_:)();
        v35._countAndFlagsBits = 8236;
        v35._object = (void *)0xE200000000000000;
        String.append(_:)(v35);
        swift_getWitnessTable();
        DefaultStringInterpolation.appendInterpolation<A>(_:)();
        v36._countAndFlagsBits = 41;
        v36._object = (void *)0xE100000000000000;
        String.append(_:)(v36);
        return _assertionFailure(_:_:file:line:flags:)();
      }
      uint64_t v19 = v50;
      v53 = v22;
      v55 = v18;
    }
  }
  char v23 = v17[38];
  uint64_t v24 = v17[35];
  v60 = v17[34];
  uint64_t v25 = v17[32];
  uint64_t v27 = v17[30];
  char v26 = v17[31];
  unint64_t v28 = v17[29];
  char v29 = v17[23];
  (*(void (**)(uint64_t *))(*v19 + 8))(v12);
  long long v30 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  v30(v28, v29);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v53);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v60, v55);
  v30(v23, v29);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v31 = (uint64_t (*)(void))v17[1];
LABEL_13:
  return v31();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D>(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t *a7, uint64_t *a8)
{
  v9[26] = a8;
  v9[27] = v8;
  v9[24] = a6;
  v9[25] = a7;
  v9[22] = a4;
  v9[23] = a5;
  v9[20] = a2;
  v9[21] = a3;
  v9[19] = a1;
  uint64_t v10 = *a6;
  uint64_t v11 = *a7;
  uint64_t v12 = *a8;
  v9[28] = *(void *)(*(void *)a5 + 128);
  v9[15] = type metadata accessor for AVAsyncProperty.Status();
  v9[29] = *(void *)(v10 + 128);
  v9[16] = type metadata accessor for AVAsyncProperty.Status();
  v9[30] = *(void *)(v11 + 128);
  v9[17] = type metadata accessor for AVAsyncProperty.Status();
  v9[31] = *(void *)(v12 + 128);
  v9[18] = type metadata accessor for AVAsyncProperty.Status();
  v9[32] = swift_getTupleTypeMetadata();
  v9[33] = swift_task_alloc();
  uint64_t v13 = type metadata accessor for AVAsyncProperty.Status();
  v9[34] = v13;
  v9[35] = *(void *)(v13 - 8);
  v9[36] = swift_task_alloc();
  uint64_t v14 = type metadata accessor for AVAsyncProperty.Status();
  v9[37] = v14;
  v9[38] = *(void *)(v14 - 8);
  v9[39] = swift_task_alloc();
  v9[40] = swift_task_alloc();
  uint64_t v15 = type metadata accessor for AVAsyncProperty.Status();
  v9[41] = v15;
  v9[42] = *(void *)(v15 - 8);
  v9[43] = swift_task_alloc();
  v9[44] = swift_task_alloc();
  uint64_t v16 = type metadata accessor for AVAsyncProperty.Status();
  v9[45] = v16;
  v9[46] = *(void *)(v16 - 8);
  v9[47] = swift_task_alloc();
  v9[48] = swift_task_alloc();
  v9[49] = swift_task_alloc();
  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C, D>(_:_:_:_:), 0, 0);
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D>(_:_:_:_:)()
{
  uint64_t v1 = v0;
  uint64_t v18 = v0 + 2;
  id v19 = (id)v0[27];
  uint64_t v3 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v5 = v0[23];
  uint64_t v4 = v0[24];
  uint64_t v7 = *(void *)(v5 + 16);
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v8 = *(void *)(v4 + 16);
  uint64_t v9 = *(void *)(v4 + 24);
  uint64_t v10 = *(void *)(v3 + 16);
  uint64_t v11 = *(void *)(v3 + 24);
  uint64_t v12 = *(void *)(v2 + 16);
  uint64_t v13 = *(void *)(v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2128B2830;
  *(void *)(v14 + 32) = v7;
  *(void *)(v14 + 40) = v6;
  *(void *)(v14 + 48) = v8;
  *(void *)(v14 + 56) = v9;
  *(void *)(v14 + 64) = v10;
  *(void *)(v14 + 72) = v11;
  *(void *)(v14 + 80) = v12;
  *(void *)(v14 + 88) = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v1[50] = isa;
  swift_bridgeObjectRelease();
  v1[2] = v1;
  v1[3] = AVAsynchronousKeyValueLoading.load<A, B, C, D>(_:_:_:_:);
  uint64_t v16 = swift_continuation_init();
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 0x40000000;
  v1[12] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v1[13] = &block_descriptor_6;
  v1[14] = v16;
  [v19 loadValuesAsynchronouslyForKeys:isa completionHandler:];
  return MEMORY[0x270FA23F0](v18);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C, D>(_:_:_:_:), 0, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  void (*v12)(uint64_t, uint64_t *, uint64_t);
  uint64_t *v13;
  void (*v14)(uint64_t *, uint64_t *, uint64_t);
  void (*v15)(uint64_t *, uint64_t *, uint64_t);
  uint64_t *v16;
  int EnumCaseMultiPayload;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t (*v37)(void);
  Swift::String v39;
  Swift::String v40;
  Swift::String v41;
  Swift::String v42;
  Swift::String v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  void *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;

  uint64_t v1 = *(uint64_t **)(v0 + 392);
  uint64_t v2 = *(void *)(v0 + 368);
  v71 = *(void *)(v0 + 360);
  uint64_t v3 = *(uint64_t **)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 336);
  v80 = *(void *)(v0 + 328);
  v85 = *(uint64_t **)(v0 + 320);
  v86 = *(void *)(v0 + 304);
  v74 = *(void *)(v0 + 296);
  v84 = *(uint64_t **)(v0 + 288);
  v77 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v0 + 264);
  v78 = *(void *)(v0 + 272);
  uint64_t v6 = *(int **)(v0 + 256);
  v82 = *(void **)(v0 + 208);
  uint64_t v7 = *(void **)(v0 + 192);
  v68 = *(void **)(v0 + 200);
  uint64_t v8 = *(void **)(v0 + 184);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v3);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v68, v85);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v82, v84);
  uint64_t v9 = (uint64_t *)(v5 + v6[12]);
  uint64_t v10 = (uint64_t *)(v5 + v6[20]);
  uint64_t v11 = v1;
  uint64_t v12 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v2 + 16);
  uint64_t v13 = (uint64_t *)(v5 + v6[16]);
  v12(v5, v11, v71);
  uint64_t v14 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v4 + 16);
  v83 = v9;
  v14(v9, v3, v80);
  uint64_t v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v86 + 16);
  v81 = v13;
  v15(v13, v85, v74);
  uint64_t v16 = v10;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v77 + 16))(v10, v84, v78);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    int64_t v22 = *(void *)(v0 + 272);
    char v23 = *(void *)(v0 + 280);
    v12(*(void *)(v0 + 376), *(uint64_t **)(v0 + 264), *(void *)(v0 + 360));
    (*(void (**)(uint64_t *, uint64_t))(v23 + 8))(v10, v22);
    uint64_t v18 = (uint64_t *)(v0 + 304);
    v66 = *(void *)(v0 + 296);
    v69 = *(void *)(v0 + 272);
    unint64_t v21 = v13;
    v64 = *(void *)(v0 + 328);
    v65 = v64;
    uint64_t v20 = (uint64_t *)(v0 + 336);
  }
  else
  {
    if (!EnumCaseMultiPayload)
    {
      v12(*(void *)(v0 + 384), *(uint64_t **)(v0 + 264), *(void *)(v0 + 360));
      if (!swift_getEnumCaseMultiPayload())
      {
        v14(*(uint64_t **)(v0 + 344), v9, *(void *)(v0 + 328));
        if (!swift_getEnumCaseMultiPayload())
        {
          v15(*(uint64_t **)(v0 + 312), v13, *(void *)(v0 + 296));
          if (!swift_getEnumCaseMultiPayload())
          {
            v44 = *(void *)(v0 + 392);
            v61 = *(void *)(v0 + 384);
            v59 = v10;
            v45 = *(void *)(v0 + 360);
            v56 = *(void *)(v0 + 368);
            long long v46 = *(void *)(v0 + 352);
            v67 = *(void *)(v0 + 344);
            v48 = *(void *)(v0 + 328);
            v47 = *(void *)(v0 + 336);
            v49 = *(void *)(v0 + 320);
            v76 = *(void *)(v0 + 312);
            v50 = *(void *)(v0 + 296);
            v51 = *(void *)(v0 + 304);
            v79 = *(void *)(v0 + 264);
            v60 = *(void *)(v0 + 240);
            v52 = *(void *)(v0 + 224);
            v70 = *(void *)(v0 + 248);
            v73 = *(void *)(v0 + 176);
            v62 = *(void *)(v0 + 168);
            v57 = *(void *)(v0 + 232);
            v58 = *(void *)(v0 + 160);
            v55 = *(void *)(v0 + 152);
            (*(void (**)(void))(*(void *)(v0 + 280) + 8))();
            v63 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
            v63(v49, v50);
            v53 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
            v53(v46, v48);
            v54 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
            v54(v44, v45);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 32))(v55, v61, v52);
            (*(void (**)(uint64_t, uint64_t))(*(void *)(v57 - 8) + 32))(v58, v67);
            (*(void (**)(uint64_t, uint64_t))(*(void *)(v60 - 8) + 32))(v62, v76);
            (*(void (**)(uint64_t, uint64_t *))(*(void *)(v70 - 8) + 32))(v73, v59);
            v63((uint64_t)v81, v50);
            v53((uint64_t)v83, v48);
            v54(v79, v45);
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            uint64_t v37 = *(uint64_t (**)(void))(v0 + 8);
            goto LABEL_18;
          }
          (*(void (**)(void))(*(void *)(*(void *)(v0 + 240) - 8) + 8))(*(void *)(v0 + 312));
        }
        (*(void (**)(void))(*(void *)(*(void *)(v0 + 232) - 8) + 8))(*(void *)(v0 + 344));
      }
      (*(void (**)(void))(*(void *)(*(void *)(v0 + 224) - 8) + 8))(*(void *)(v0 + 384));
    }
    uint64_t v18 = (uint64_t *)(v0 + 280);
    id v19 = *(void *)(v0 + 328);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = (uint64_t *)(v0 + 304);
      v66 = *(void *)(v0 + 296);
      v69 = *(void *)(v0 + 272);
      v64 = v66;
      v83 = v13;
      unint64_t v21 = v16;
      v65 = v19;
    }
    else
    {
      uint64_t v24 = *(void *)(v0 + 296);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v69 = *(void *)(v0 + 272);
        v64 = v19;
        unint64_t v21 = v16;
      }
      else
      {
        uint64_t v25 = *(void *)(v0 + 272);
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          _StringGuts.grow(_:)(36);
          v39._object = (void *)0x80000002128B5B10;
          v39._countAndFlagsBits = 0xD000000000000015;
          String.append(_:)(v39);
          swift_getWitnessTable();
          DefaultStringInterpolation.appendInterpolation<A>(_:)();
          v40._countAndFlagsBits = 8236;
          v40._object = (void *)0xE200000000000000;
          String.append(_:)(v40);
          swift_getWitnessTable();
          DefaultStringInterpolation.appendInterpolation<A>(_:)();
          v41._countAndFlagsBits = 8236;
          v41._object = (void *)0xE200000000000000;
          String.append(_:)(v41);
          swift_getWitnessTable();
          DefaultStringInterpolation.appendInterpolation<A>(_:)();
          v42._countAndFlagsBits = 8236;
          v42._object = (void *)0xE200000000000000;
          String.append(_:)(v42);
          swift_getWitnessTable();
          DefaultStringInterpolation.appendInterpolation<A>(_:)();
          v43._countAndFlagsBits = 41;
          v43._object = (void *)0xE100000000000000;
          String.append(_:)(v43);
          return _assertionFailure(_:_:file:line:flags:)();
        }
        v69 = v25;
        uint64_t v18 = (uint64_t *)(v0 + 304);
        unint64_t v21 = v81;
        v64 = v19;
      }
      uint64_t v20 = (uint64_t *)(v0 + 336);
      v65 = v19;
      v66 = v24;
    }
  }
  char v26 = *v20;
  uint64_t v27 = *v18;
  unint64_t v28 = *(void *)(v0 + 392);
  char v29 = *(void *)(v0 + 368);
  long long v30 = *(void *)(v0 + 360);
  v75 = *(void *)(v0 + 352);
  uint64_t v31 = *(void *)(v0 + 336);
  v72 = *(void *)(v0 + 320);
  BOOL v32 = *(void *)(v0 + 304);
  int64_t v34 = *(void *)(v0 + 280);
  uint64_t v33 = *(void *)(v0 + 288);
  uint64_t v35 = *(void *)(v0 + 264);
  (*(void (**)(uint64_t *))(v27 + 8))(v21);
  (*(void (**)(uint64_t *, uint64_t))(v26 + 8))(v83, v64);
  uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  v36(v35, v30);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v69);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v72, v66);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v75, v65);
  v36(v28, v30);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v37 = *(uint64_t (**)(void))(v0 + 8);
LABEL_18:
  return v37();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E>(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t *a8)
{
  v9[29] = v22;
  v9[30] = v8;
  v9[27] = a8;
  v9[28] = v21;
  v9[25] = a6;
  v9[26] = a7;
  v9[23] = a4;
  v9[24] = a5;
  v9[21] = a2;
  v9[22] = a3;
  v9[20] = a1;
  uint64_t v10 = *a7;
  uint64_t v11 = *a8;
  uint64_t v12 = *v21;
  uint64_t v19 = *v22;
  v9[31] = *(void *)(*(void *)a6 + 128);
  v9[10] = type metadata accessor for AVAsyncProperty.Status();
  v9[32] = *(void *)(v10 + 128);
  v9[11] = type metadata accessor for AVAsyncProperty.Status();
  v9[33] = *(void *)(v11 + 128);
  v9[12] = type metadata accessor for AVAsyncProperty.Status();
  v9[34] = *(void *)(v12 + 128);
  v9[13] = type metadata accessor for AVAsyncProperty.Status();
  v9[35] = *(void *)(v19 + 128);
  v9[14] = type metadata accessor for AVAsyncProperty.Status();
  v9[36] = swift_getTupleTypeMetadata();
  v9[37] = swift_task_alloc();
  uint64_t v13 = type metadata accessor for AVAsyncProperty.Status();
  v9[38] = v13;
  v9[39] = *(void *)(v13 - 8);
  v9[40] = swift_task_alloc();
  uint64_t v14 = type metadata accessor for AVAsyncProperty.Status();
  v9[41] = v14;
  v9[42] = *(void *)(v14 - 8);
  v9[43] = swift_task_alloc();
  v9[44] = swift_task_alloc();
  uint64_t v15 = type metadata accessor for AVAsyncProperty.Status();
  v9[45] = v15;
  v9[46] = *(void *)(v15 - 8);
  v9[47] = swift_task_alloc();
  v9[48] = swift_task_alloc();
  uint64_t v16 = type metadata accessor for AVAsyncProperty.Status();
  v9[49] = v16;
  v9[50] = *(void *)(v16 - 8);
  v9[51] = swift_task_alloc();
  v9[52] = swift_task_alloc();
  uint64_t v17 = type metadata accessor for AVAsyncProperty.Status();
  v9[53] = v17;
  v9[54] = *(void *)(v17 - 8);
  v9[55] = swift_task_alloc();
  v9[56] = swift_task_alloc();
  v9[57] = swift_task_alloc();
  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C, D, E>(_:_:_:_:_:), 0, 0);
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E>(_:_:_:_:_:)()
{
  uint64_t v1 = v0;
  unint64_t v21 = v0 + 2;
  id v22 = (id)v0[30];
  uint64_t v3 = v0[28];
  uint64_t v2 = v0[29];
  uint64_t v5 = v0[26];
  uint64_t v4 = v0[27];
  uint64_t v6 = v0[25];
  uint64_t v7 = *(void *)(v6 + 16);
  uint64_t v8 = *(void *)(v6 + 24);
  uint64_t v9 = *(void *)(v5 + 16);
  uint64_t v10 = *(void *)(v5 + 24);
  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v12 = *(void *)(v4 + 24);
  uint64_t v13 = *(void *)(v3 + 24);
  uint64_t v14 = *(void *)(v2 + 24);
  uint64_t v19 = *(void *)(v2 + 16);
  uint64_t v20 = *(void *)(v3 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_2128B2840;
  *(void *)(v15 + 32) = v7;
  *(void *)(v15 + 40) = v8;
  *(void *)(v15 + 48) = v9;
  *(void *)(v15 + 56) = v10;
  *(void *)(v15 + 64) = v11;
  *(void *)(v15 + 72) = v12;
  *(void *)(v15 + 80) = v20;
  *(void *)(v15 + 88) = v13;
  *(void *)(v15 + 96) = v19;
  *(void *)(v15 + 104) = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v1[58] = isa;
  swift_bridgeObjectRelease();
  v1[2] = v1;
  v1[3] = AVAsynchronousKeyValueLoading.load<A, B, C, D, E>(_:_:_:_:_:);
  uint64_t v17 = swift_continuation_init();
  v1[15] = MEMORY[0x263EF8330];
  v1[16] = 0x40000000;
  v1[17] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v1[18] = &block_descriptor_8;
  v1[19] = v17;
  [v22 loadValuesAsynchronouslyForKeys:[isa allKeys] completionHandler:^(NSError *error) {
    if (error) {
        NSLog(@"Error: %@", error);
    }
}];
  return MEMORY[0x270FA23F0](v21);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C, D, E>(_:_:_:_:_:), 0, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  int *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  void (*v13)(uint64_t, uint64_t *, uint64_t);
  uint64_t v14;
  void (*v15)(uint64_t *, uint64_t *, uint64_t);
  uint64_t *v16;
  void (*v17)(uint64_t *, uint64_t *, uint64_t);
  uint64_t *v18;
  int EnumCaseMultiPayload;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t (*v42)(void);
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t *v81;
  void *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t *v103;
  void *v104;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;

  uint64_t v1 = *(uint64_t **)(v0 + 456);
  uint64_t v2 = *(void *)(v0 + 432);
  v89 = *(void *)(v0 + 424);
  uint64_t v3 = *(uint64_t **)(v0 + 416);
  v84 = v1;
  v87 = v3;
  v114 = *(void *)(v0 + 400);
  uint64_t v4 = *(uint64_t **)(v0 + 384);
  v91 = *(void *)(v0 + 392);
  v111 = *(void *)(v0 + 368);
  v95 = *(void *)(v0 + 360);
  v106 = *(uint64_t **)(v0 + 352);
  v93 = *(void *)(v0 + 336);
  v108 = *(uint64_t **)(v0 + 320);
  v97 = *(void *)(v0 + 328);
  v99 = *(void *)(v0 + 312);
  uint64_t v5 = *(void *)(v0 + 296);
  uint64_t v6 = *(int **)(v0 + 288);
  v101 = *(void *)(v0 + 304);
  v104 = *(void **)(v0 + 232);
  uint64_t v7 = *(void **)(v0 + 208);
  v79 = *(void **)(v0 + 216);
  v82 = *(void **)(v0 + 224);
  uint64_t v8 = *(void **)(v0 + 200);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v3);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v79, v4);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v82, v106);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v104, v108);
  uint64_t v9 = (uint64_t *)(v5 + v6[12]);
  uint64_t v10 = (uint64_t *)(v5 + v6[16]);
  uint64_t v11 = (uint64_t *)(v5 + v6[20]);
  uint64_t v12 = (uint64_t *)(v5 + v6[24]);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v2 + 16);
  v13(v5, v84, v89);
  v105 = v9;
  uint64_t v14 = v91;
  v92 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v114 + 16);
  v92(v9, v87, v14);
  uint64_t v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v111 + 16);
  uint64_t v16 = v10;
  v15(v10, v4, v95);
  uint64_t v17 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v93 + 16);
  uint64_t v18 = v11;
  v17(v11, v106, v97);
  v107 = v12;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v99 + 16))(v12, v108, v101);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v27 = *(void *)(v0 + 304);
    unint64_t v28 = *(void *)(v0 + 312);
    v13(*(void *)(v0 + 440), *(uint64_t **)(v0 + 296), *(void *)(v0 + 424));
    (*(void (**)(uint64_t *, uint64_t))(v28 + 8))(v12, v27);
    id v22 = (uint64_t *)(v0 + 336);
    v74 = *(void *)(v0 + 328);
    uint64_t v25 = v11;
    v112 = *(void *)(v0 + 304);
    char v26 = (uint64_t *)(v0 + 368);
    v76 = *(void *)(v0 + 360);
    v72 = v76;
    v102 = v16;
    v109 = *(void *)(v0 + 392);
    v71 = v109;
    uint64_t v24 = (uint64_t *)(v0 + 400);
  }
  else
  {
    uint64_t v20 = v16;
    unint64_t v21 = v11;
    if (!EnumCaseMultiPayload)
    {
      v13(*(void *)(v0 + 448), *(uint64_t **)(v0 + 296), *(void *)(v0 + 424));
      if (!swift_getEnumCaseMultiPayload())
      {
        v92(*(uint64_t **)(v0 + 408), v105, *(void *)(v0 + 392));
        if (!swift_getEnumCaseMultiPayload())
        {
          v15(*(uint64_t **)(v0 + 376), v16, *(void *)(v0 + 360));
          if (!swift_getEnumCaseMultiPayload())
          {
            v17(*(uint64_t **)(v0 + 344), v11, *(void *)(v0 + 328));
            if (!swift_getEnumCaseMultiPayload())
            {
              v100 = *(void *)(v0 + 456);
              v64 = *(void *)(v0 + 448);
              v110 = *(void *)(v0 + 432);
              v96 = *(void *)(v0 + 416);
              v98 = *(void *)(v0 + 424);
              v66 = *(void *)(v0 + 408);
              v113 = *(void *)(v0 + 400);
              v50 = *(void *)(v0 + 384);
              v94 = *(void *)(v0 + 392);
              v73 = *(void *)(v0 + 376);
              v51 = *(void *)(v0 + 360);
              v115 = *(void *)(v0 + 368);
              v68 = v51;
              v52 = *(void *)(v0 + 352);
              v78 = *(void *)(v0 + 344);
              v54 = *(void *)(v0 + 328);
              v53 = *(void *)(v0 + 336);
              v70 = v54;
              v86 = *(void *)(v0 + 296);
              v75 = *(void *)(v0 + 280);
              v65 = *(void *)(v0 + 272);
              v62 = *(void *)(v0 + 264);
              v103 = v21;
              v55 = *(void *)(v0 + 248);
              v56 = *(void *)(v0 + 256);
              v77 = *(void *)(v0 + 192);
              v67 = *(void *)(v0 + 184);
              v63 = *(void *)(v0 + 176);
              v81 = v20;
              v60 = *(void *)(v0 + 160);
              v61 = *(void *)(v0 + 168);
              (*(void (**)(void))(*(void *)(v0 + 312) + 8))();
              v69 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
              v69(v52, v54);
              v57 = *(void (**)(uint64_t, uint64_t))(v115 + 8);
              v57(v50, v51);
              v58 = *(void (**)(uint64_t, uint64_t))(v113 + 8);
              v58(v96, v94);
              v59 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
              v59(v100, v98);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 32))(v60, v64, v55);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 32))(v61, v66, v56);
              (*(void (**)(uint64_t, uint64_t))(*(void *)(v62 - 8) + 32))(v63, v73);
              (*(void (**)(uint64_t, uint64_t))(*(void *)(v65 - 8) + 32))(v67, v78);
              (*(void (**)(uint64_t, uint64_t *))(*(void *)(v75 - 8) + 32))(v77, v107);
              v69((uint64_t)v103, v70);
              v57((uint64_t)v81, v68);
              v58((uint64_t)v105, v94);
              v59(v86, v98);
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
              swift_task_dealloc();
              long long v42 = *(uint64_t (**)(void))(v0 + 8);
              goto LABEL_22;
            }
            (*(void (**)(void))(*(void *)(*(void *)(v0 + 272) - 8) + 8))(*(void *)(v0 + 344));
          }
          (*(void (**)(void))(*(void *)(*(void *)(v0 + 264) - 8) + 8))(*(void *)(v0 + 376));
        }
        (*(void (**)(void))(*(void *)(*(void *)(v0 + 256) - 8) + 8))(*(void *)(v0 + 408));
      }
      (*(void (**)(void))(*(void *)(*(void *)(v0 + 248) - 8) + 8))(*(void *)(v0 + 448));
    }
    id v22 = (uint64_t *)(v0 + 312);
    uint64_t v23 = *(void *)(v0 + 392);
    v109 = v23;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v112 = *(void *)(v0 + 304);
      v72 = *(void *)(v0 + 328);
      v74 = v72;
      uint64_t v24 = (uint64_t *)(v0 + 368);
      v76 = *(void *)(v0 + 360);
      v71 = v76;
      v102 = v18;
      v105 = v16;
      uint64_t v25 = v107;
      char v26 = (uint64_t *)(v0 + 336);
    }
    else
    {
      char v29 = *(void *)(v0 + 360);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v112 = *(void *)(v0 + 304);
        v72 = *(void *)(v0 + 328);
        v74 = v72;
        v71 = v23;
        v102 = v18;
        uint64_t v25 = v107;
        uint64_t v24 = (uint64_t *)(v0 + 400);
        char v26 = (uint64_t *)(v0 + 336);
        v76 = v29;
      }
      else
      {
        long long v30 = *(void *)(v0 + 328);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          v112 = *(void *)(v0 + 304);
          char v26 = (uint64_t *)(v0 + 368);
          v72 = v29;
          v102 = v16;
          v71 = v23;
          uint64_t v25 = v107;
        }
        else
        {
          v112 = *(void *)(v0 + 304);
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            _StringGuts.grow(_:)(40);
            v44._object = (void *)0x80000002128B5B10;
            v44._countAndFlagsBits = 0xD000000000000015;
            String.append(_:)(v44);
            swift_getWitnessTable();
            DefaultStringInterpolation.appendInterpolation<A>(_:)();
            v45._countAndFlagsBits = 8236;
            v45._object = (void *)0xE200000000000000;
            String.append(_:)(v45);
            swift_getWitnessTable();
            DefaultStringInterpolation.appendInterpolation<A>(_:)();
            v46._countAndFlagsBits = 8236;
            v46._object = (void *)0xE200000000000000;
            String.append(_:)(v46);
            swift_getWitnessTable();
            DefaultStringInterpolation.appendInterpolation<A>(_:)();
            v47._countAndFlagsBits = 8236;
            v47._object = (void *)0xE200000000000000;
            String.append(_:)(v47);
            swift_getWitnessTable();
            DefaultStringInterpolation.appendInterpolation<A>(_:)();
            v48._countAndFlagsBits = 8236;
            v48._object = (void *)0xE200000000000000;
            String.append(_:)(v48);
            swift_getWitnessTable();
            DefaultStringInterpolation.appendInterpolation<A>(_:)();
            v49._countAndFlagsBits = 41;
            v49._object = (void *)0xE100000000000000;
            String.append(_:)(v49);
            return _assertionFailure(_:_:file:line:flags:)();
          }
          id v22 = (uint64_t *)(v0 + 336);
          uint64_t v25 = v21;
          char v26 = (uint64_t *)(v0 + 368);
          v72 = v29;
          v102 = v16;
          v71 = v23;
        }
        uint64_t v24 = (uint64_t *)(v0 + 400);
        v74 = v30;
        v76 = v29;
      }
    }
  }
  uint64_t v31 = *v24;
  BOOL v32 = *v26;
  uint64_t v33 = *v22;
  v90 = *(void *)(v0 + 456);
  int64_t v34 = *(void *)(v0 + 432);
  uint64_t v35 = *(void *)(v0 + 424);
  v88 = *(void *)(v0 + 416);
  uint64_t v36 = *(void *)(v0 + 400);
  v85 = *(void *)(v0 + 384);
  uint64_t v37 = *(void *)(v0 + 368);
  v83 = *(void *)(v0 + 352);
  uint64_t v38 = *(void *)(v0 + 336);
  uint64_t v39 = *(void *)(v0 + 312);
  v80 = *(void *)(v0 + 320);
  uint64_t v40 = *(void *)(v0 + 296);
  (*(void (**)(uint64_t *))(v33 + 8))(v25);
  (*(void (**)(uint64_t *, uint64_t))(v32 + 8))(v102, v72);
  (*(void (**)(uint64_t *, uint64_t))(v31 + 8))(v105, v71);
  uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
  v41(v40, v35);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v80, v112);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v83, v74);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v85, v76);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v88, v109);
  v41(v90, v35);
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
  swift_task_dealloc();
  long long v42 = *(uint64_t (**)(void))(v0 + 8);
LABEL_22:
  return v42();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F>(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  v9[32] = v26;
  v9[33] = v8;
  v9[30] = v24;
  v9[31] = v25;
  v9[28] = a8;
  v9[29] = v23;
  v9[26] = a6;
  v9[27] = a7;
  v9[24] = a4;
  v9[25] = a5;
  v9[22] = a2;
  v9[23] = a3;
  v9[21] = a1;
  uint64_t v10 = *a8;
  uint64_t v11 = *v23;
  uint64_t v19 = *v24;
  uint64_t v20 = *v25;
  uint64_t v21 = *v26;
  v9[34] = *(void *)(*(void *)a7 + 128);
  v9[10] = type metadata accessor for AVAsyncProperty.Status();
  v9[35] = *(void *)(v10 + 128);
  v9[11] = type metadata accessor for AVAsyncProperty.Status();
  v9[36] = *(void *)(v11 + 128);
  v9[12] = type metadata accessor for AVAsyncProperty.Status();
  v9[37] = *(void *)(v19 + 128);
  v9[13] = type metadata accessor for AVAsyncProperty.Status();
  v9[38] = *(void *)(v20 + 128);
  v9[14] = type metadata accessor for AVAsyncProperty.Status();
  v9[39] = *(void *)(v21 + 128);
  v9[15] = type metadata accessor for AVAsyncProperty.Status();
  v9[40] = swift_getTupleTypeMetadata();
  v9[41] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for AVAsyncProperty.Status();
  v9[42] = v12;
  v9[43] = *(void *)(v12 - 8);
  v9[44] = swift_task_alloc();
  uint64_t v13 = type metadata accessor for AVAsyncProperty.Status();
  v9[45] = v13;
  v9[46] = *(void *)(v13 - 8);
  v9[47] = swift_task_alloc();
  v9[48] = swift_task_alloc();
  uint64_t v14 = type metadata accessor for AVAsyncProperty.Status();
  v9[49] = v14;
  v9[50] = *(void *)(v14 - 8);
  v9[51] = swift_task_alloc();
  v9[52] = swift_task_alloc();
  uint64_t v15 = type metadata accessor for AVAsyncProperty.Status();
  v9[53] = v15;
  v9[54] = *(void *)(v15 - 8);
  v9[55] = swift_task_alloc();
  v9[56] = swift_task_alloc();
  uint64_t v16 = type metadata accessor for AVAsyncProperty.Status();
  v9[57] = v16;
  v9[58] = *(void *)(v16 - 8);
  v9[59] = swift_task_alloc();
  v9[60] = swift_task_alloc();
  uint64_t v17 = type metadata accessor for AVAsyncProperty.Status();
  v9[61] = v17;
  v9[62] = *(void *)(v17 - 8);
  v9[63] = swift_task_alloc();
  v9[64] = swift_task_alloc();
  v9[65] = swift_task_alloc();
  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F>(_:_:_:_:_:_:), 0, 0);
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F>(_:_:_:_:_:_:)()
{
  uint64_t v1 = v0;
  uint64_t v24 = v0 + 2;
  id v25 = (id)v0[33];
  uint64_t v3 = v0[31];
  uint64_t v2 = v0[32];
  uint64_t v5 = v0[29];
  uint64_t v4 = v0[30];
  uint64_t v7 = v0[27];
  uint64_t v6 = v0[28];
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t v9 = *(void *)(v7 + 24);
  uint64_t v10 = *(void *)(v6 + 16);
  uint64_t v11 = *(void *)(v6 + 24);
  uint64_t v12 = *(void *)(v5 + 24);
  uint64_t v13 = *(void *)(v4 + 24);
  uint64_t v22 = *(void *)(v4 + 16);
  uint64_t v23 = *(void *)(v5 + 16);
  uint64_t v14 = *(void *)(v3 + 24);
  uint64_t v15 = *(void *)(v2 + 24);
  uint64_t v20 = *(void *)(v2 + 16);
  uint64_t v21 = *(void *)(v3 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_2128B2850;
  *(void *)(v16 + 32) = v8;
  *(void *)(v16 + 40) = v9;
  *(void *)(v16 + 48) = v10;
  *(void *)(v16 + 56) = v11;
  *(void *)(v16 + 64) = v23;
  *(void *)(v16 + 72) = v12;
  *(void *)(v16 + 80) = v22;
  *(void *)(v16 + 88) = v13;
  *(void *)(v16 + 96) = v21;
  *(void *)(v16 + 104) = v14;
  *(void *)(v16 + 112) = v20;
  *(void *)(v16 + 120) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v1[66] = isa;
  swift_bridgeObjectRelease();
  v1[2] = v1;
  v1[3] = AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F>(_:_:_:_:_:_:);
  uint64_t v18 = swift_continuation_init();
  v1[16] = MEMORY[0x263EF8330];
  v1[17] = 0x40000000;
  v1[18] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v1[19] = &block_descriptor_10;
  v1[20] = v18;
  [v25 loadValuesAsynchronouslyForKeys:isa completionHandler:isa];
  return MEMORY[0x270FA23F0](v24);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F>(_:_:_:_:_:_:), 0, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  int *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  void (*v15)(uint64_t, uint64_t *, uint64_t);
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t *, uint64_t);
  void (*v19)(uint64_t, uint64_t *, uint64_t);
  int EnumCaseMultiPayload;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t (*v41)(void);
  uint64_t v43;
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  void (*v90)(uint64_t, uint64_t *, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  void (*v104)(uint64_t, uint64_t *, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t *v114;
  void *v115;
  uint64_t *v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t *v121;
  void *v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;

  uint64_t v1 = *(uint64_t **)(v0 + 520);
  v89 = v1;
  v133 = *(void *)(v0 + 496);
  uint64_t v2 = *(uint64_t **)(v0 + 480);
  v98 = *(void *)(v0 + 488);
  v93 = v2;
  v130 = *(void *)(v0 + 464);
  uint64_t v3 = *(uint64_t **)(v0 + 448);
  v100 = *(void *)(v0 + 456);
  v95 = v3;
  v127 = *(void *)(v0 + 432);
  v103 = *(void *)(v0 + 424);
  v117 = *(uint64_t **)(v0 + 416);
  v124 = *(void *)(v0 + 400);
  v106 = *(void *)(v0 + 392);
  v120 = *(uint64_t **)(v0 + 384);
  v105 = *(void *)(v0 + 368);
  v107 = *(void *)(v0 + 360);
  v86 = *(uint64_t **)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 328);
  v109 = *(void *)(v0 + 344);
  v111 = *(void *)(v0 + 336);
  uint64_t v5 = *(int **)(v0 + 320);
  v122 = *(void **)(v0 + 256);
  uint64_t v6 = *(void **)(v0 + 232);
  v113 = *(void **)(v0 + 240);
  v115 = *(void **)(v0 + 248);
  uint64_t v8 = *(void **)(v0 + 216);
  uint64_t v7 = *(void **)(v0 + 224);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v2);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v6, v3);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v113, v117);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v115, v120);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v122, v86);
  uint64_t v9 = (uint64_t *)(v4 + v5[12]);
  uint64_t v10 = (uint64_t *)(v4 + v5[16]);
  uint64_t v11 = (uint64_t *)(v4 + v5[20]);
  uint64_t v12 = (uint64_t *)(v4 + v5[24]);
  uint64_t v13 = (uint64_t *)(v4 + v5[28]);
  uint64_t v14 = v89;
  v90 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v133 + 16);
  v90(v4, v14, v98);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v130 + 16);
  v116 = v9;
  v15((uint64_t)v9, v93, v100);
  uint64_t v16 = v10;
  uint64_t v17 = v103;
  v104 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v127 + 16);
  v104((uint64_t)v10, v95, v17);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v124 + 16);
  v123 = v11;
  v18((uint64_t)v11, v117, v106);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v105 + 16);
  v114 = v12;
  v19((uint64_t)v12, v120, v107);
  v121 = v13;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v109 + 16))(v13, v86, v111);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    id v25 = *(void *)(v0 + 336);
    uint64_t v26 = *(void *)(v0 + 344);
    v90(*(void *)(v0 + 504), *(uint64_t **)(v0 + 328), *(void *)(v0 + 488));
    (*(void (**)(uint64_t *, uint64_t))(v26 + 8))(v121, v25);
    uint64_t v27 = (uint64_t *)(v0 + 400);
    uint64_t v21 = (uint64_t *)(v0 + 368);
    v80 = *(void *)(v0 + 360);
    uint64_t v24 = v12;
    v131 = *(void *)(v0 + 392);
    v79 = v131;
    v114 = v123;
    v128 = *(void *)(v0 + 336);
    unint64_t v28 = (uint64_t *)(v0 + 432);
    v118 = *(void *)(v0 + 424);
    v77 = v118;
    v123 = v16;
    v125 = *(void *)(v0 + 456);
    v75 = v125;
    uint64_t v23 = (uint64_t *)(v0 + 464);
  }
  else
  {
    if (!EnumCaseMultiPayload)
    {
      v90(*(void *)(v0 + 512), *(uint64_t **)(v0 + 328), *(void *)(v0 + 488));
      if (!swift_getEnumCaseMultiPayload())
      {
        v15(*(void *)(v0 + 472), v116, *(void *)(v0 + 456));
        if (!swift_getEnumCaseMultiPayload())
        {
          v104(*(void *)(v0 + 440), v16, *(void *)(v0 + 424));
          if (!swift_getEnumCaseMultiPayload())
          {
            v18(*(void *)(v0 + 408), v123, *(void *)(v0 + 392));
            if (!swift_getEnumCaseMultiPayload())
            {
              v19(*(void *)(v0 + 376), v12, *(void *)(v0 + 360));
              if (!swift_getEnumCaseMultiPayload())
              {
                v119 = *(void *)(v0 + 520);
                v67 = *(void *)(v0 + 512);
                v126 = *(void *)(v0 + 496);
                v110 = *(void *)(v0 + 480);
                v112 = *(void *)(v0 + 488);
                v69 = *(void *)(v0 + 472);
                v102 = v16;
                v129 = *(void *)(v0 + 464);
                v51 = *(void *)(v0 + 448);
                v108 = *(void *)(v0 + 456);
                v76 = *(void *)(v0 + 440);
                v52 = *(void *)(v0 + 424);
                v132 = *(void *)(v0 + 432);
                v70 = v52;
                v53 = *(void *)(v0 + 416);
                v83 = *(void *)(v0 + 408);
                v54 = *(void *)(v0 + 392);
                v134 = *(void *)(v0 + 400);
                v55 = *(void *)(v0 + 384);
                v92 = *(void *)(v0 + 376);
                v57 = *(void *)(v0 + 360);
                v56 = *(void *)(v0 + 368);
                v78 = v57;
                v97 = *(void *)(v0 + 328);
                v72 = *(void *)(v0 + 304);
                v64 = *(void *)(v0 + 288);
                v62 = *(void *)(v0 + 280);
                v61 = *(void *)(v0 + 272);
                v85 = *(void *)(v0 + 312);
                v88 = *(void *)(v0 + 208);
                v74 = *(void *)(v0 + 200);
                v68 = *(void *)(v0 + 192);
                v65 = *(void *)(v0 + 184);
                v66 = *(void *)(v0 + 296);
                v58 = *(void *)(v0 + 168);
                v63 = *(void *)(v0 + 176);
                (*(void (**)(void))(*(void *)(v0 + 344) + 8))();
                v81 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
                v81(v55, v57);
                v73 = *(void (**)(uint64_t, uint64_t))(v134 + 8);
                v73(v53, v54);
                v71 = *(void (**)(uint64_t, uint64_t))(v132 + 8);
                v71(v51, v52);
                v59 = *(void (**)(uint64_t, uint64_t))(v129 + 8);
                v59(v110, v108);
                v60 = *(void (**)(uint64_t, uint64_t))(v126 + 8);
                v60(v119, v112);
                (*(void (**)(uint64_t, uint64_t))(*(void *)(v61 - 8) + 32))(v58, v67);
                (*(void (**)(uint64_t, uint64_t))(*(void *)(v62 - 8) + 32))(v63, v69);
                (*(void (**)(uint64_t, uint64_t))(*(void *)(v64 - 8) + 32))(v65, v76);
                (*(void (**)(uint64_t, uint64_t))(*(void *)(v66 - 8) + 32))(v68, v83);
                (*(void (**)(uint64_t, uint64_t))(*(void *)(v72 - 8) + 32))(v74, v92);
                (*(void (**)(uint64_t, uint64_t *))(*(void *)(v85 - 8) + 32))(v88, v121);
                v81((uint64_t)v114, v78);
                v73((uint64_t)v123, v54);
                v71((uint64_t)v102, v70);
                v59((uint64_t)v116, v108);
                v60(v97, v112);
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
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
                goto LABEL_20;
              }
              (*(void (**)(void))(*(void *)(*(void *)(v0 + 304) - 8) + 8))(*(void *)(v0 + 376));
            }
            (*(void (**)(void))(*(void *)(*(void *)(v0 + 296) - 8) + 8))(*(void *)(v0 + 408));
          }
          (*(void (**)(void))(*(void *)(*(void *)(v0 + 288) - 8) + 8))(*(void *)(v0 + 440));
        }
        (*(void (**)(void))(*(void *)(*(void *)(v0 + 280) - 8) + 8))(*(void *)(v0 + 472));
      }
      (*(void (**)(void))(*(void *)(*(void *)(v0 + 272) - 8) + 8))(*(void *)(v0 + 512));
    }
    uint64_t v21 = (uint64_t *)(v0 + 344);
    uint64_t v22 = *(void *)(v0 + 456);
    v125 = v22;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v128 = *(void *)(v0 + 336);
      v79 = *(void *)(v0 + 360);
      v80 = v79;
      v131 = *(void *)(v0 + 392);
      v77 = v131;
      uint64_t v23 = (uint64_t *)(v0 + 432);
      v118 = *(void *)(v0 + 424);
      v75 = v118;
      v116 = v16;
      uint64_t v24 = v13;
    }
    else
    {
      char v29 = *(void *)(v0 + 424);
      v118 = v29;
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        v131 = *(void *)(v0 + 392);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          v128 = *(void *)(v0 + 336);
          v79 = *(void *)(v0 + 360);
          v80 = v79;
          unint64_t v28 = (uint64_t *)(v0 + 432);
          v77 = v29;
          v123 = v16;
          v75 = v22;
          uint64_t v24 = v13;
          uint64_t v23 = (uint64_t *)(v0 + 464);
          uint64_t v27 = (uint64_t *)(v0 + 368);
        }
        else
        {
          uint64_t v43 = *(void *)(v0 + 360);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            v128 = *(void *)(v0 + 336);
            uint64_t v27 = (uint64_t *)(v0 + 400);
            v79 = v131;
            v114 = v123;
            unint64_t v28 = (uint64_t *)(v0 + 432);
            v77 = v29;
            v123 = v16;
            v75 = v22;
            uint64_t v24 = v13;
          }
          else
          {
            v128 = *(void *)(v0 + 336);
            if (swift_getEnumCaseMultiPayload() != 1)
            {
              _StringGuts.grow(_:)(44);
              v44._object = (void *)0x80000002128B5B10;
              v44._countAndFlagsBits = 0xD000000000000015;
              String.append(_:)(v44);
              swift_getWitnessTable();
              DefaultStringInterpolation.appendInterpolation<A>(_:)();
              v45._countAndFlagsBits = 8236;
              v45._object = (void *)0xE200000000000000;
              String.append(_:)(v45);
              swift_getWitnessTable();
              DefaultStringInterpolation.appendInterpolation<A>(_:)();
              v46._countAndFlagsBits = 8236;
              v46._object = (void *)0xE200000000000000;
              String.append(_:)(v46);
              swift_getWitnessTable();
              DefaultStringInterpolation.appendInterpolation<A>(_:)();
              v47._countAndFlagsBits = 8236;
              v47._object = (void *)0xE200000000000000;
              String.append(_:)(v47);
              swift_getWitnessTable();
              DefaultStringInterpolation.appendInterpolation<A>(_:)();
              v48._countAndFlagsBits = 8236;
              v48._object = (void *)0xE200000000000000;
              String.append(_:)(v48);
              swift_getWitnessTable();
              DefaultStringInterpolation.appendInterpolation<A>(_:)();
              v49._countAndFlagsBits = 8236;
              v49._object = (void *)0xE200000000000000;
              String.append(_:)(v49);
              swift_getWitnessTable();
              DefaultStringInterpolation.appendInterpolation<A>(_:)();
              v50._countAndFlagsBits = 41;
              v50._object = (void *)0xE100000000000000;
              String.append(_:)(v50);
              return _assertionFailure(_:_:file:line:flags:)();
            }
            uint64_t v21 = (uint64_t *)(v0 + 368);
            uint64_t v24 = v12;
            uint64_t v27 = (uint64_t *)(v0 + 400);
            v79 = v131;
            v114 = v123;
            unint64_t v28 = (uint64_t *)(v0 + 432);
            v77 = v29;
            v123 = v16;
            v75 = v22;
          }
          uint64_t v23 = (uint64_t *)(v0 + 464);
          v80 = v43;
        }
        goto LABEL_19;
      }
      v128 = *(void *)(v0 + 336);
      v79 = *(void *)(v0 + 360);
      v80 = v79;
      v131 = *(void *)(v0 + 392);
      v75 = v22;
      v77 = v131;
      uint64_t v24 = v13;
      uint64_t v23 = (uint64_t *)(v0 + 464);
    }
    unint64_t v28 = (uint64_t *)(v0 + 400);
    uint64_t v27 = (uint64_t *)(v0 + 368);
  }
LABEL_19:
  long long v30 = *v23;
  uint64_t v31 = *v28;
  BOOL v32 = *v27;
  uint64_t v33 = *v21;
  v101 = *(void *)(v0 + 520);
  int64_t v34 = *(void *)(v0 + 496);
  v84 = *(void *)(v0 + 488);
  v99 = *(void *)(v0 + 480);
  v94 = *(void *)(v0 + 448);
  v96 = *(void *)(v0 + 464);
  uint64_t v35 = *(void *)(v0 + 432);
  v91 = *(void *)(v0 + 416);
  uint64_t v36 = *(void *)(v0 + 400);
  v87 = *(void *)(v0 + 384);
  uint64_t v37 = *(void *)(v0 + 368);
  uint64_t v38 = *(void *)(v0 + 344);
  v82 = *(void *)(v0 + 352);
  uint64_t v39 = *(void *)(v0 + 328);
  (*(void (**)(uint64_t *))(v33 + 8))(v24);
  (*(void (**)(uint64_t *, uint64_t))(v32 + 8))(v114, v79);
  (*(void (**)(uint64_t *, uint64_t))(v31 + 8))(v123, v77);
  (*(void (**)(uint64_t *, uint64_t))(v30 + 8))(v116, v75);
  uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
  v40(v39, v84);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v82, v128);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v87, v80);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v91, v131);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v94, v118);
  (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v99, v125);
  v40(v101, v84);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
LABEL_20:
  return v41();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[35] = v30;
  v9[36] = v8;
  v9[33] = v28;
  v9[34] = v29;
  v9[31] = v26;
  v9[32] = v27;
  v9[29] = a8;
  v9[30] = v25;
  v9[27] = a6;
  v9[28] = a7;
  v9[25] = a4;
  v9[26] = a5;
  v9[23] = a2;
  v9[24] = a3;
  v9[22] = a1;
  uint64_t v10 = *v25;
  uint64_t v11 = *v26;
  uint64_t v20 = *v27;
  uint64_t v21 = *v28;
  uint64_t v22 = *v29;
  uint64_t v23 = *v30;
  v9[37] = *(void *)(*(void *)a8 + 128);
  v9[10] = type metadata accessor for AVAsyncProperty.Status();
  v9[38] = *(void *)(v10 + 128);
  v9[11] = type metadata accessor for AVAsyncProperty.Status();
  v9[39] = *(void *)(v11 + 128);
  v9[12] = type metadata accessor for AVAsyncProperty.Status();
  v9[40] = *(void *)(v20 + 128);
  v9[13] = type metadata accessor for AVAsyncProperty.Status();
  v9[41] = *(void *)(v21 + 128);
  v9[14] = type metadata accessor for AVAsyncProperty.Status();
  v9[42] = *(void *)(v22 + 128);
  v9[15] = type metadata accessor for AVAsyncProperty.Status();
  v9[43] = *(void *)(v23 + 128);
  v9[16] = type metadata accessor for AVAsyncProperty.Status();
  v9[44] = swift_getTupleTypeMetadata();
  v9[45] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for AVAsyncProperty.Status();
  v9[46] = v12;
  v9[47] = *(void *)(v12 - 8);
  v9[48] = swift_task_alloc();
  uint64_t v13 = type metadata accessor for AVAsyncProperty.Status();
  v9[49] = v13;
  v9[50] = *(void *)(v13 - 8);
  v9[51] = swift_task_alloc();
  v9[52] = swift_task_alloc();
  uint64_t v14 = type metadata accessor for AVAsyncProperty.Status();
  v9[53] = v14;
  v9[54] = *(void *)(v14 - 8);
  v9[55] = swift_task_alloc();
  v9[56] = swift_task_alloc();
  uint64_t v15 = type metadata accessor for AVAsyncProperty.Status();
  v9[57] = v15;
  v9[58] = *(void *)(v15 - 8);
  v9[59] = swift_task_alloc();
  v9[60] = swift_task_alloc();
  uint64_t v16 = type metadata accessor for AVAsyncProperty.Status();
  v9[61] = v16;
  v9[62] = *(void *)(v16 - 8);
  v9[63] = swift_task_alloc();
  v9[64] = swift_task_alloc();
  uint64_t v17 = type metadata accessor for AVAsyncProperty.Status();
  v9[65] = v17;
  v9[66] = *(void *)(v17 - 8);
  v9[67] = swift_task_alloc();
  v9[68] = swift_task_alloc();
  uint64_t v18 = type metadata accessor for AVAsyncProperty.Status();
  v9[69] = v18;
  v9[70] = *(void *)(v18 - 8);
  v9[71] = swift_task_alloc();
  v9[72] = swift_task_alloc();
  v9[73] = swift_task_alloc();
  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:), 0, 0);
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)()
{
  uint64_t v1 = v0;
  uint64_t v27 = v0 + 2;
  id v28 = (id)v0[36];
  uint64_t v3 = v0[34];
  uint64_t v2 = v0[35];
  uint64_t v5 = v0[32];
  uint64_t v4 = v0[33];
  uint64_t v7 = v0[30];
  uint64_t v6 = v0[31];
  uint64_t v8 = v0[29];
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v10 = *(void *)(v8 + 24);
  uint64_t v11 = *(void *)(v7 + 24);
  uint64_t v12 = *(void *)(v6 + 24);
  uint64_t v25 = *(void *)(v6 + 16);
  uint64_t v26 = *(void *)(v7 + 16);
  uint64_t v13 = *(void *)(v5 + 24);
  uint64_t v14 = *(void *)(v4 + 24);
  uint64_t v23 = *(void *)(v4 + 16);
  uint64_t v24 = *(void *)(v5 + 16);
  uint64_t v15 = *(void *)(v3 + 24);
  uint64_t v16 = *(void *)(v2 + 24);
  uint64_t v21 = *(void *)(v2 + 16);
  uint64_t v22 = *(void *)(v3 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_2128B2860;
  *(void *)(v17 + 32) = v9;
  *(void *)(v17 + 40) = v10;
  *(void *)(v17 + 48) = v26;
  *(void *)(v17 + 56) = v11;
  *(void *)(v17 + 64) = v25;
  *(void *)(v17 + 72) = v12;
  *(void *)(v17 + 80) = v24;
  *(void *)(v17 + 88) = v13;
  *(void *)(v17 + 96) = v23;
  *(void *)(v17 + 104) = v14;
  *(void *)(v17 + 112) = v22;
  *(void *)(v17 + 120) = v15;
  *(void *)(v17 + 128) = v21;
  *(void *)(v17 + 136) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v1[74] = isa;
  swift_bridgeObjectRelease();
  v1[2] = v1;
  v1[3] = AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:);
  uint64_t v19 = swift_continuation_init();
  v1[17] = MEMORY[0x263EF8330];
  v1[18] = 0x40000000;
  v1[19] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v1[20] = &block_descriptor_12;
  v1[21] = v19;
  [v28 loadValuesAsynchronouslyForKeys:isa completionHandler:];
  return MEMORY[0x270FA23F0](v27);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:), 0, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  int *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  void (*v15)(uint64_t, uint64_t *, uint64_t);
  uint64_t *v16;
  void (*v17)(uint64_t, uint64_t *, uint64_t);
  void (*v18)(uint64_t, uint64_t *, uint64_t);
  void (*v19)(uint64_t, uint64_t *, uint64_t);
  void (*v20)(uint64_t, uint64_t *, uint64_t);
  int EnumCaseMultiPayload;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t (*v44)(void);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  Swift::String v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;
  Swift::String v53;
  Swift::String v54;
  Swift::String v55;
  Swift::String v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t);
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(uint64_t, uint64_t);
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  void (*v101)(uint64_t, uint64_t *, uint64_t);
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t *v125;
  void *v126;
  uint64_t *v127;
  void *v128;
  uint64_t *v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  uint64_t *v146;
  void *v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;

  uint64_t v1 = *(uint64_t **)(v0 + 584);
  v97 = v1;
  v154 = *(void *)(v0 + 560);
  v107 = *(void *)(v0 + 552);
  uint64_t v2 = *(uint64_t **)(v0 + 544);
  v100 = v2;
  v152 = *(void *)(v0 + 528);
  v124 = *(void *)(v0 + 520);
  uint64_t v3 = *(uint64_t **)(v0 + 512);
  v104 = v3;
  v149 = *(void *)(v0 + 496);
  v110 = *(void *)(v0 + 488);
  v130 = *(uint64_t **)(v0 + 480);
  v142 = *(void *)(v0 + 464);
  v112 = *(void *)(v0 + 456);
  v136 = *(uint64_t **)(v0 + 448);
  v139 = *(void *)(v0 + 432);
  v117 = *(void *)(v0 + 424);
  v132 = *(uint64_t **)(v0 + 416);
  v115 = *(void *)(v0 + 400);
  v134 = *(uint64_t **)(v0 + 384);
  v119 = *(void *)(v0 + 392);
  v120 = *(void *)(v0 + 376);
  uint64_t v4 = *(void *)(v0 + 360);
  v121 = *(void *)(v0 + 368);
  uint64_t v5 = *(int **)(v0 + 352);
  v145 = *(void **)(v0 + 272);
  v147 = *(void **)(v0 + 280);
  uint64_t v6 = *(void **)(v0 + 248);
  v126 = *(void **)(v0 + 256);
  v128 = *(void **)(v0 + 264);
  uint64_t v7 = *(void **)(v0 + 232);
  uint64_t v8 = *(void **)(v0 + 240);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v2);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v6, v3);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v126, v130);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v128, v136);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v145, v132);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v147, v134);
  uint64_t v9 = (uint64_t *)(v4 + v5[12]);
  uint64_t v10 = (uint64_t *)(v4 + v5[16]);
  uint64_t v11 = (uint64_t *)(v4 + v5[20]);
  uint64_t v12 = (uint64_t *)(v4 + v5[24]);
  uint64_t v13 = (uint64_t *)(v4 + v5[28]);
  uint64_t v14 = (uint64_t *)(v4 + v5[32]);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v154 + 16);
  v15(v4, v97, v107);
  v148 = v9;
  uint64_t v16 = v100;
  v101 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v152 + 16);
  v101((uint64_t)v9, v16, v124);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v149 + 16);
  v125 = v10;
  v17((uint64_t)v10, v104, v110);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v142 + 16);
  v146 = v11;
  v18((uint64_t)v11, v130, v112);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v139 + 16);
  v129 = v12;
  v19((uint64_t)v12, v136, v117);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v115 + 16);
  v127 = v13;
  v20((uint64_t)v13, v132, v119);
  v123 = v14;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v120 + 16))(v14, v134, v121);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v27 = *(void *)(v0 + 368);
    id v28 = *(void *)(v0 + 376);
    v15(*(void *)(v0 + 568), *(uint64_t **)(v0 + 360), *(void *)(v0 + 552));
    (*(void (**)(uint64_t *, uint64_t))(v28 + 8))(v123, v27);
    uint64_t v23 = (uint64_t *)(v0 + 400);
    v150 = *(void *)(v0 + 392);
    uint64_t v26 = v13;
    uint64_t v29 = (uint64_t *)(v0 + 432);
    v89 = *(void *)(v0 + 424);
    v91 = v89;
    v127 = v129;
    long long v30 = (uint64_t *)(v0 + 464);
    v140 = *(void *)(v0 + 456);
    v87 = v140;
    v129 = v146;
    v92 = *(void *)(v0 + 368);
    uint64_t v31 = (uint64_t *)(v0 + 496);
    v137 = *(void *)(v0 + 488);
    v85 = v137;
    v143 = *(void *)(v0 + 520);
    v146 = v125;
    v83 = v143;
    uint64_t v25 = (uint64_t *)(v0 + 528);
  }
  else
  {
    uint64_t v22 = v125;
    if (!EnumCaseMultiPayload)
    {
      v15(*(void *)(v0 + 576), *(uint64_t **)(v0 + 360), *(void *)(v0 + 552));
      if (!swift_getEnumCaseMultiPayload())
      {
        v101(*(void *)(v0 + 536), v148, *(void *)(v0 + 520));
        if (!swift_getEnumCaseMultiPayload())
        {
          v17(*(void *)(v0 + 504), v125, *(void *)(v0 + 488));
          if (!swift_getEnumCaseMultiPayload())
          {
            v18(*(void *)(v0 + 472), v146, *(void *)(v0 + 456));
            if (!swift_getEnumCaseMultiPayload())
            {
              v19(*(void *)(v0 + 440), v129, *(void *)(v0 + 424));
              if (!swift_getEnumCaseMultiPayload())
              {
                v20(*(void *)(v0 + 408), v13, *(void *)(v0 + 392));
                if (!swift_getEnumCaseMultiPayload())
                {
                  v138 = *(void *)(v0 + 584);
                  v75 = *(void *)(v0 + 576);
                  v141 = *(void *)(v0 + 560);
                  v133 = *(void *)(v0 + 544);
                  v135 = *(void *)(v0 + 552);
                  v76 = *(void *)(v0 + 536);
                  v144 = *(void *)(v0 + 528);
                  v131 = *(void *)(v0 + 520);
                  v122 = *(void *)(v0 + 512);
                  v79 = *(void *)(v0 + 504);
                  v57 = *(void *)(v0 + 488);
                  v151 = *(void *)(v0 + 496);
                  v58 = *(void *)(v0 + 480);
                  v96 = *(void *)(v0 + 472);
                  v59 = *(void *)(v0 + 456);
                  v153 = *(void *)(v0 + 464);
                  v81 = v59;
                  v60 = *(void *)(v0 + 448);
                  v99 = *(void *)(v0 + 440);
                  v61 = *(void *)(v0 + 424);
                  v156 = *(void *)(v0 + 432);
                  v84 = v61;
                  v62 = *(void *)(v0 + 416);
                  v109 = *(void *)(v0 + 408);
                  v63 = *(void *)(v0 + 392);
                  v64 = *(void *)(v0 + 400);
                  v114 = *(void *)(v0 + 360);
                  v78 = *(void *)(v0 + 328);
                  v73 = *(void *)(v0 + 320);
                  v71 = *(void *)(v0 + 312);
                  v65 = *(void *)(v0 + 296);
                  v69 = *(void *)(v0 + 304);
                  v103 = *(void *)(v0 + 224);
                  v106 = *(void *)(v0 + 344);
                  v88 = *(void *)(v0 + 216);
                  v90 = *(void *)(v0 + 336);
                  v77 = *(void *)(v0 + 208);
                  v74 = *(void *)(v0 + 200);
                  v72 = *(void *)(v0 + 192);
                  v70 = *(void *)(v0 + 184);
                  v68 = *(void *)(v0 + 176);
                  (*(void (**)(void))(*(void *)(v0 + 376) + 8))();
                  v94 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
                  v94(v62, v63);
                  v86 = *(void (**)(uint64_t, uint64_t))(v156 + 8);
                  v86(v60, v61);
                  v82 = *(void (**)(uint64_t, uint64_t))(v153 + 8);
                  v82(v58, v59);
                  v80 = *(void (**)(uint64_t, uint64_t))(v151 + 8);
                  v80(v122, v57);
                  v66 = *(void (**)(uint64_t, uint64_t))(v144 + 8);
                  v66(v133, v131);
                  v67 = *(void (**)(uint64_t, uint64_t))(v141 + 8);
                  v67(v138, v135);
                  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 32))(v68, v75, v65);
                  (*(void (**)(uint64_t, uint64_t))(*(void *)(v69 - 8) + 32))(v70, v76);
                  (*(void (**)(uint64_t, uint64_t))(*(void *)(v71 - 8) + 32))(v72, v79);
                  (*(void (**)(uint64_t, uint64_t))(*(void *)(v73 - 8) + 32))(v74, v96);
                  (*(void (**)(uint64_t, uint64_t))(*(void *)(v78 - 8) + 32))(v77, v99);
                  (*(void (**)(uint64_t, uint64_t))(*(void *)(v90 - 8) + 32))(v88, v109);
                  (*(void (**)(uint64_t, uint64_t *))(*(void *)(v106 - 8) + 32))(v103, v123);
                  v94((uint64_t)v127, v63);
                  v86((uint64_t)v129, v84);
                  v82((uint64_t)v146, v81);
                  v80((uint64_t)v125, v57);
                  v66((uint64_t)v148, v131);
                  v67(v114, v135);
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
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  v44 = *(uint64_t (**)(void))(v0 + 8);
                  goto LABEL_22;
                }
                (*(void (**)(void))(*(void *)(*(void *)(v0 + 336) - 8) + 8))(*(void *)(v0 + 408));
                uint64_t v22 = v125;
              }
              (*(void (**)(void))(*(void *)(*(void *)(v0 + 328) - 8) + 8))(*(void *)(v0 + 440));
            }
            (*(void (**)(void))(*(void *)(*(void *)(v0 + 320) - 8) + 8))(*(void *)(v0 + 472));
          }
          (*(void (**)(void))(*(void *)(*(void *)(v0 + 312) - 8) + 8))(*(void *)(v0 + 504));
        }
        (*(void (**)(void))(*(void *)(*(void *)(v0 + 304) - 8) + 8))(*(void *)(v0 + 536));
      }
      (*(void (**)(void))(*(void *)(*(void *)(v0 + 296) - 8) + 8))(*(void *)(v0 + 576));
    }
    uint64_t v23 = (uint64_t *)(v0 + 376);
    uint64_t v24 = *(void *)(v0 + 520);
    v143 = v24;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v92 = *(void *)(v0 + 368);
      v150 = *(void *)(v0 + 392);
      v89 = v150;
      v91 = *(void *)(v0 + 424);
      v87 = v91;
      v140 = *(void *)(v0 + 456);
      v85 = v140;
      uint64_t v25 = (uint64_t *)(v0 + 496);
      v137 = *(void *)(v0 + 488);
      v83 = v137;
      v148 = v22;
      uint64_t v26 = v123;
    }
    else
    {
      BOOL v32 = *(void *)(v0 + 488);
      v137 = v32;
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        long long v46 = *(void *)(v0 + 456);
        v140 = v46;
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          v92 = *(void *)(v0 + 368);
          v150 = *(void *)(v0 + 392);
          v89 = v150;
          v91 = *(void *)(v0 + 424);
          v87 = v91;
          uint64_t v31 = (uint64_t *)(v0 + 496);
          v85 = v32;
          v146 = v22;
          v83 = v24;
          uint64_t v26 = v123;
          uint64_t v25 = (uint64_t *)(v0 + 528);
          long long v30 = (uint64_t *)(v0 + 432);
          uint64_t v29 = (uint64_t *)(v0 + 400);
        }
        else
        {
          v47 = *(void *)(v0 + 424);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            v92 = *(void *)(v0 + 368);
            v150 = *(void *)(v0 + 392);
            v87 = v46;
            v89 = v150;
            long long v30 = (uint64_t *)(v0 + 464);
            v129 = v146;
            uint64_t v31 = (uint64_t *)(v0 + 496);
            v85 = v32;
            v146 = v125;
            v83 = v24;
            uint64_t v26 = v123;
            uint64_t v25 = (uint64_t *)(v0 + 528);
            uint64_t v29 = (uint64_t *)(v0 + 400);
            v91 = v47;
          }
          else
          {
            v150 = *(void *)(v0 + 392);
            if (swift_getEnumCaseMultiPayload() == 1)
            {
              v92 = *(void *)(v0 + 368);
              uint64_t v29 = (uint64_t *)(v0 + 432);
              v89 = v47;
              v127 = v129;
              long long v30 = (uint64_t *)(v0 + 464);
              v87 = v46;
              v129 = v146;
              uint64_t v31 = (uint64_t *)(v0 + 496);
              v85 = v32;
              v146 = v125;
              v83 = v24;
              uint64_t v26 = v123;
            }
            else
            {
              v48 = *(void *)(v0 + 368);
              if (swift_getEnumCaseMultiPayload() != 1)
              {
                _StringGuts.grow(_:)(48);
                v49._object = (void *)0x80000002128B5B10;
                v49._countAndFlagsBits = 0xD000000000000015;
                String.append(_:)(v49);
                swift_getWitnessTable();
                DefaultStringInterpolation.appendInterpolation<A>(_:)();
                v50._countAndFlagsBits = 8236;
                v50._object = (void *)0xE200000000000000;
                String.append(_:)(v50);
                swift_getWitnessTable();
                DefaultStringInterpolation.appendInterpolation<A>(_:)();
                v51._countAndFlagsBits = 8236;
                v51._object = (void *)0xE200000000000000;
                String.append(_:)(v51);
                swift_getWitnessTable();
                DefaultStringInterpolation.appendInterpolation<A>(_:)();
                v52._countAndFlagsBits = 8236;
                v52._object = (void *)0xE200000000000000;
                String.append(_:)(v52);
                swift_getWitnessTable();
                DefaultStringInterpolation.appendInterpolation<A>(_:)();
                v53._countAndFlagsBits = 8236;
                v53._object = (void *)0xE200000000000000;
                String.append(_:)(v53);
                swift_getWitnessTable();
                DefaultStringInterpolation.appendInterpolation<A>(_:)();
                v54._countAndFlagsBits = 8236;
                v54._object = (void *)0xE200000000000000;
                String.append(_:)(v54);
                swift_getWitnessTable();
                DefaultStringInterpolation.appendInterpolation<A>(_:)();
                v55._countAndFlagsBits = 8236;
                v55._object = (void *)0xE200000000000000;
                String.append(_:)(v55);
                swift_getWitnessTable();
                DefaultStringInterpolation.appendInterpolation<A>(_:)();
                v56._countAndFlagsBits = 41;
                v56._object = (void *)0xE100000000000000;
                String.append(_:)(v56);
                return _assertionFailure(_:_:file:line:flags:)();
              }
              v92 = v48;
              uint64_t v23 = (uint64_t *)(v0 + 400);
              uint64_t v26 = v13;
              uint64_t v29 = (uint64_t *)(v0 + 432);
              v89 = v47;
              v127 = v129;
              long long v30 = (uint64_t *)(v0 + 464);
              v87 = v46;
              v129 = v146;
              uint64_t v31 = (uint64_t *)(v0 + 496);
              v85 = v32;
              v146 = v125;
              v83 = v24;
            }
            uint64_t v25 = (uint64_t *)(v0 + 528);
            v91 = v47;
          }
        }
        goto LABEL_21;
      }
      v92 = *(void *)(v0 + 368);
      v150 = *(void *)(v0 + 392);
      v89 = v150;
      v91 = *(void *)(v0 + 424);
      v87 = v91;
      v140 = *(void *)(v0 + 456);
      v83 = v24;
      v85 = v140;
      uint64_t v26 = v123;
      uint64_t v25 = (uint64_t *)(v0 + 528);
    }
    long long v30 = (uint64_t *)(v0 + 432);
    uint64_t v29 = (uint64_t *)(v0 + 400);
    uint64_t v31 = (uint64_t *)(v0 + 464);
  }
LABEL_21:
  uint64_t v33 = *v25;
  int64_t v34 = *v31;
  uint64_t v35 = *v30;
  uint64_t v36 = *v29;
  uint64_t v37 = *v23;
  v118 = *(void *)(v0 + 584);
  v155 = *(void *)(v0 + 560);
  v95 = *(void *)(v0 + 552);
  v116 = *(void *)(v0 + 544);
  v111 = *(void *)(v0 + 512);
  v113 = *(void *)(v0 + 528);
  v105 = *(void *)(v0 + 480);
  v108 = *(void *)(v0 + 496);
  uint64_t v38 = *(void *)(v0 + 464);
  v102 = *(void *)(v0 + 448);
  uint64_t v39 = *(void *)(v0 + 432);
  v98 = *(void *)(v0 + 416);
  uint64_t v40 = *(void *)(v0 + 400);
  uint64_t v41 = *(void *)(v0 + 376);
  v93 = *(void *)(v0 + 384);
  long long v42 = *(void *)(v0 + 360);
  (*(void (**)(uint64_t *))(v37 + 8))(v26);
  (*(void (**)(uint64_t *, uint64_t))(v36 + 8))(v127, v89);
  (*(void (**)(uint64_t *, uint64_t))(v35 + 8))(v129, v87);
  (*(void (**)(uint64_t *, uint64_t))(v34 + 8))(v146, v85);
  (*(void (**)(uint64_t *, uint64_t))(v33 + 8))(v148, v83);
  uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v155 + 8);
  v43(v42, v95);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v93, v92);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v98, v150);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v102, v91);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v105, v140);
  (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v111, v137);
  (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v116, v143);
  v43(v118, v95);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v44 = *(uint64_t (**)(void))(v0 + 8);
LABEL_22:
  return v44();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[38] = v34;
  v9[39] = v8;
  v9[36] = v32;
  v9[37] = v33;
  v9[34] = v30;
  v9[35] = v31;
  v9[32] = v28;
  v9[33] = v29;
  v9[30] = a8;
  v9[31] = v27;
  v9[28] = a6;
  v9[29] = a7;
  v9[26] = a4;
  v9[27] = a5;
  v9[24] = a2;
  v9[25] = a3;
  v9[23] = a1;
  uint64_t v10 = *v28;
  uint64_t v11 = *v29;
  uint64_t v21 = *v30;
  uint64_t v22 = *v31;
  uint64_t v23 = *v32;
  uint64_t v24 = *v33;
  uint64_t v25 = *v34;
  v9[40] = *(void *)(*(void *)v27 + 128);
  v9[10] = type metadata accessor for AVAsyncProperty.Status();
  v9[41] = *(void *)(v10 + 128);
  v9[11] = type metadata accessor for AVAsyncProperty.Status();
  v9[42] = *(void *)(v11 + 128);
  v9[12] = type metadata accessor for AVAsyncProperty.Status();
  v9[43] = *(void *)(v21 + 128);
  v9[13] = type metadata accessor for AVAsyncProperty.Status();
  v9[44] = *(void *)(v22 + 128);
  v9[14] = type metadata accessor for AVAsyncProperty.Status();
  v9[45] = *(void *)(v23 + 128);
  v9[15] = type metadata accessor for AVAsyncProperty.Status();
  v9[46] = *(void *)(v24 + 128);
  v9[16] = type metadata accessor for AVAsyncProperty.Status();
  v9[47] = *(void *)(v25 + 128);
  v9[17] = type metadata accessor for AVAsyncProperty.Status();
  v9[48] = swift_getTupleTypeMetadata();
  v9[49] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for AVAsyncProperty.Status();
  v9[50] = v12;
  v9[51] = *(void *)(v12 - 8);
  v9[52] = swift_task_alloc();
  uint64_t v13 = type metadata accessor for AVAsyncProperty.Status();
  v9[53] = v13;
  v9[54] = *(void *)(v13 - 8);
  v9[55] = swift_task_alloc();
  v9[56] = swift_task_alloc();
  uint64_t v14 = type metadata accessor for AVAsyncProperty.Status();
  v9[57] = v14;
  v9[58] = *(void *)(v14 - 8);
  v9[59] = swift_task_alloc();
  v9[60] = swift_task_alloc();
  uint64_t v15 = type metadata accessor for AVAsyncProperty.Status();
  v9[61] = v15;
  v9[62] = *(void *)(v15 - 8);
  v9[63] = swift_task_alloc();
  v9[64] = swift_task_alloc();
  uint64_t v16 = type metadata accessor for AVAsyncProperty.Status();
  v9[65] = v16;
  v9[66] = *(void *)(v16 - 8);
  v9[67] = swift_task_alloc();
  v9[68] = swift_task_alloc();
  uint64_t v17 = type metadata accessor for AVAsyncProperty.Status();
  v9[69] = v17;
  v9[70] = *(void *)(v17 - 8);
  v9[71] = swift_task_alloc();
  v9[72] = swift_task_alloc();
  uint64_t v18 = type metadata accessor for AVAsyncProperty.Status();
  v9[73] = v18;
  v9[74] = *(void *)(v18 - 8);
  v9[75] = swift_task_alloc();
  v9[76] = swift_task_alloc();
  uint64_t v19 = type metadata accessor for AVAsyncProperty.Status();
  v9[77] = v19;
  v9[78] = *(void *)(v19 - 8);
  v9[79] = swift_task_alloc();
  v9[80] = swift_task_alloc();
  v9[81] = swift_task_alloc();
  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:), 0, 0);
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)()
{
  uint64_t v1 = v0;
  long long v30 = v0 + 2;
  id v31 = (id)v0[39];
  uint64_t v3 = v0[37];
  uint64_t v2 = v0[38];
  uint64_t v5 = v0[35];
  uint64_t v4 = v0[36];
  uint64_t v7 = v0[33];
  uint64_t v6 = v0[34];
  uint64_t v9 = v0[31];
  uint64_t v8 = v0[32];
  uint64_t v10 = *(void *)(v9 + 24);
  uint64_t v11 = *(void *)(v8 + 24);
  uint64_t v28 = *(void *)(v8 + 16);
  uint64_t v29 = *(void *)(v9 + 16);
  uint64_t v12 = *(void *)(v7 + 24);
  uint64_t v13 = *(void *)(v6 + 24);
  uint64_t v26 = *(void *)(v6 + 16);
  uint64_t v27 = *(void *)(v7 + 16);
  uint64_t v14 = *(void *)(v5 + 24);
  uint64_t v15 = *(void *)(v4 + 24);
  uint64_t v24 = *(void *)(v4 + 16);
  uint64_t v25 = *(void *)(v5 + 16);
  uint64_t v16 = *(void *)(v3 + 24);
  uint64_t v17 = *(void *)(v2 + 24);
  uint64_t v22 = *(void *)(v2 + 16);
  uint64_t v23 = *(void *)(v3 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_2128B2870;
  *(void *)(v18 + 32) = v29;
  *(void *)(v18 + 40) = v10;
  *(void *)(v18 + 48) = v28;
  *(void *)(v18 + 56) = v11;
  *(void *)(v18 + 64) = v27;
  *(void *)(v18 + 72) = v12;
  *(void *)(v18 + 80) = v26;
  *(void *)(v18 + 88) = v13;
  *(void *)(v18 + 96) = v25;
  *(void *)(v18 + 104) = v14;
  *(void *)(v18 + 112) = v24;
  *(void *)(v18 + 120) = v15;
  *(void *)(v18 + 128) = v23;
  *(void *)(v18 + 136) = v16;
  *(void *)(v18 + 144) = v22;
  *(void *)(v18 + 152) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v1[82] = isa;
  swift_bridgeObjectRelease();
  v1[2] = v1;
  v1[3] = AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:);
  uint64_t v20 = swift_continuation_init();
  v1[18] = MEMORY[0x263EF8330];
  v1[19] = 0x40000000;
  v1[20] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v1[21] = &block_descriptor_14;
  v1[22] = v20;
  [v31 loadValuesAsynchronouslyForKeys:isa completionHandler:isa];
  return MEMORY[0x270FA23F0](v30);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:), 0, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  void (*v20)(uint64_t, uint64_t *, uint64_t);
  void (*v21)(uint64_t, uint64_t *, uint64_t);
  void (*v22)(uint64_t, uint64_t *, uint64_t);
  uint64_t *v23;
  int EnumCaseMultiPayload;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t (*v47)(void);
  Swift::String v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;
  Swift::String v53;
  Swift::String v54;
  Swift::String v55;
  Swift::String v56;
  Swift::String v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t, uint64_t);
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  void (*v105)(uint64_t, uint64_t *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(uint64_t, uint64_t *, uint64_t);
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void (*v120)(uint64_t, uint64_t *, uint64_t);
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t *v134;
  void *v135;
  uint64_t *v136;
  void *v137;
  uint64_t *v138;
  void *v139;
  uint64_t *v140;
  uint64_t *v141;
  void (*v142)(uint64_t, uint64_t *, uint64_t);
  uint64_t v143;
  uint64_t v144;
  uint64_t *v145;
  uint64_t *v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;

  uint64_t v1 = *(uint64_t **)(v0 + 648);
  v104 = v1;
  v172 = *(void *)(v0 + 624);
  v113 = *(void *)(v0 + 616);
  v145 = *(uint64_t **)(v0 + 608);
  v169 = *(void *)(v0 + 592);
  v115 = *(void *)(v0 + 584);
  uint64_t v2 = *(uint64_t **)(v0 + 576);
  v167 = *(void *)(v0 + 560);
  v119 = *(void *)(v0 + 552);
  v141 = *(uint64_t **)(v0 + 544);
  v162 = *(void *)(v0 + 528);
  v121 = *(void *)(v0 + 520);
  v153 = *(uint64_t **)(v0 + 512);
  v159 = *(void *)(v0 + 496);
  v123 = *(void *)(v0 + 488);
  v156 = *(uint64_t **)(v0 + 480);
  v110 = *(void *)(v0 + 464);
  v125 = *(void *)(v0 + 456);
  v147 = *(uint64_t **)(v0 + 448);
  v124 = *(void *)(v0 + 432);
  v127 = *(void *)(v0 + 424);
  v150 = *(uint64_t **)(v0 + 416);
  uint64_t v3 = *(void *)(v0 + 392);
  v129 = *(void *)(v0 + 408);
  v131 = *(void *)(v0 + 400);
  uint64_t v4 = *(int **)(v0 + 384);
  v165 = *(void **)(v0 + 304);
  v137 = *(void **)(v0 + 288);
  v139 = *(void **)(v0 + 296);
  uint64_t v5 = *(void **)(v0 + 272);
  v135 = *(void **)(v0 + 280);
  uint64_t v7 = *(void **)(v0 + 256);
  uint64_t v6 = *(void **)(v0 + 264);
  uint64_t v8 = *(void **)(v0 + 248);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v145);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v6, v2);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v5, v141);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v135, v153);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v137, v156);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v139, v147);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v165, v150);
  uint64_t v9 = (uint64_t *)(v3 + v4[12]);
  uint64_t v10 = (uint64_t *)(v3 + v4[16]);
  uint64_t v11 = (uint64_t *)(v3 + v4[20]);
  uint64_t v12 = (uint64_t *)(v3 + v4[24]);
  uint64_t v13 = (uint64_t *)(v3 + v4[28]);
  uint64_t v14 = (uint64_t *)(v3 + v4[32]);
  uint64_t v15 = (uint64_t *)(v3 + v4[36]);
  uint64_t v16 = v104;
  v105 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v172 + 16);
  v105(v3, v16, v113);
  v140 = v9;
  uint64_t v17 = v115;
  v116 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v169 + 16);
  v116((uint64_t)v9, v145, v17);
  v146 = v10;
  uint64_t v18 = v119;
  v120 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v167 + 16);
  v120((uint64_t)v10, v2, v18);
  v166 = v11;
  uint64_t v19 = v141;
  v142 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v162 + 16);
  v142((uint64_t)v11, v19, v121);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v159 + 16);
  v138 = v12;
  v20((uint64_t)v12, v153, v123);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v110 + 16);
  v136 = v13;
  v21((uint64_t)v13, v156, v125);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v124 + 16);
  uint64_t v23 = v14;
  v22((uint64_t)v14, v147, v127);
  v133 = v15;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v129 + 16))(v15, v150, v131);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v29 = *(void *)(v0 + 400);
    long long v30 = *(void *)(v0 + 408);
    v105(*(void *)(v0 + 632), *(uint64_t **)(v0 + 392), *(void *)(v0 + 616));
    (*(void (**)(uint64_t *, uint64_t))(v30 + 8))(v15, v29);
    uint64_t v25 = (uint64_t *)(v0 + 432);
    v151 = *(void *)(v0 + 424);
    uint64_t v28 = v23;
    id v31 = (uint64_t *)(v0 + 464);
    v154 = *(void *)(v0 + 456);
    v92 = v154;
    v134 = v136;
    uint64_t v32 = (uint64_t *)(v0 + 496);
    v157 = *(void *)(v0 + 488);
    v90 = v157;
    v136 = v138;
    uint64_t v33 = (uint64_t *)(v0 + 528);
    v163 = *(void *)(v0 + 520);
    v88 = v163;
    v138 = v166;
    v148 = *(void *)(v0 + 400);
    int64_t v34 = (uint64_t *)(v0 + 560);
    v160 = *(void *)(v0 + 552);
    v86 = v160;
    v166 = v10;
    v143 = *(void *)(v0 + 584);
    v85 = v143;
    uint64_t v27 = (uint64_t *)(v0 + 592);
  }
  else
  {
    v134 = v14;
    if (!EnumCaseMultiPayload)
    {
      v105(*(void *)(v0 + 640), *(uint64_t **)(v0 + 392), *(void *)(v0 + 616));
      if (!swift_getEnumCaseMultiPayload())
      {
        v116(*(void *)(v0 + 600), v140, *(void *)(v0 + 584));
        if (!swift_getEnumCaseMultiPayload())
        {
          v120(*(void *)(v0 + 568), v10, *(void *)(v0 + 552));
          if (!swift_getEnumCaseMultiPayload())
          {
            v142(*(void *)(v0 + 536), v166, *(void *)(v0 + 520));
            if (!swift_getEnumCaseMultiPayload())
            {
              v20(*(void *)(v0 + 504), v138, *(void *)(v0 + 488));
              if (!swift_getEnumCaseMultiPayload())
              {
                v21(*(void *)(v0 + 472), v136, *(void *)(v0 + 456));
                if (!swift_getEnumCaseMultiPayload())
                {
                  v22(*(void *)(v0 + 440), v14, *(void *)(v0 + 424));
                  if (!swift_getEnumCaseMultiPayload())
                  {
                    v144 = *(void *)(v0 + 648);
                    v149 = *(void *)(v0 + 640);
                    v158 = *(void *)(v0 + 624);
                    v132 = *(void *)(v0 + 616);
                    v152 = *(void *)(v0 + 608);
                    v79 = *(void *)(v0 + 600);
                    v161 = *(void *)(v0 + 592);
                    v130 = *(void *)(v0 + 584);
                    v155 = *(void *)(v0 + 576);
                    v80 = *(void *)(v0 + 568);
                    v164 = *(void *)(v0 + 560);
                    v126 = *(void *)(v0 + 544);
                    v128 = *(void *)(v0 + 552);
                    v87 = *(void *)(v0 + 536);
                    v168 = *(void *)(v0 + 528);
                    v58 = *(void *)(v0 + 520);
                    v59 = *(void *)(v0 + 512);
                    v101 = *(void *)(v0 + 504);
                    v60 = *(void *)(v0 + 488);
                    v171 = *(void *)(v0 + 496);
                    v61 = *(void *)(v0 + 480);
                    v103 = *(void *)(v0 + 472);
                    v62 = *(void *)(v0 + 456);
                    v174 = *(void *)(v0 + 464);
                    v63 = *(void *)(v0 + 448);
                    v64 = *(void *)(v0 + 424);
                    v65 = *(void *)(v0 + 432);
                    v91 = v62;
                    v118 = *(void *)(v0 + 392);
                    v109 = *(void *)(v0 + 376);
                    v112 = *(void *)(v0 + 440);
                    v81 = *(void *)(v0 + 360);
                    v76 = *(void *)(v0 + 344);
                    v74 = *(void *)(v0 + 336);
                    v66 = *(void *)(v0 + 320);
                    v72 = *(void *)(v0 + 328);
                    v107 = *(void *)(v0 + 240);
                    v97 = *(void *)(v0 + 232);
                    v99 = *(void *)(v0 + 368);
                    v77 = *(void *)(v0 + 216);
                    v78 = *(void *)(v0 + 352);
                    v75 = *(void *)(v0 + 208);
                    v73 = *(void *)(v0 + 200);
                    v70 = *(void *)(v0 + 224);
                    v71 = *(void *)(v0 + 192);
                    v69 = *(void *)(v0 + 184);
                    (*(void (**)(void))(*(void *)(v0 + 408) + 8))();
                    v95 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
                    v95(v63, v64);
                    v67 = *(void (**)(uint64_t, uint64_t))(v174 + 8);
                    v67(v61, v62);
                    v89 = *(void (**)(uint64_t, uint64_t))(v171 + 8);
                    v89(v59, v60);
                    v84 = *(void (**)(uint64_t, uint64_t))(v168 + 8);
                    v84(v126, v58);
                    v83 = *(void (**)(uint64_t, uint64_t))(v164 + 8);
                    v83(v155, v128);
                    v82 = *(void (**)(uint64_t, uint64_t))(v161 + 8);
                    v82(v152, v130);
                    v68 = *(void (**)(uint64_t, uint64_t))(v158 + 8);
                    v68(v144, v132);
                    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 32))(v69, v149, v66);
                    (*(void (**)(uint64_t, uint64_t))(*(void *)(v72 - 8) + 32))(v71, v79);
                    (*(void (**)(uint64_t, uint64_t))(*(void *)(v74 - 8) + 32))(v73, v80);
                    (*(void (**)(uint64_t, uint64_t))(*(void *)(v76 - 8) + 32))(v75, v87);
                    (*(void (**)(uint64_t, uint64_t))(*(void *)(v78 - 8) + 32))(v77, v101);
                    (*(void (**)(uint64_t, uint64_t))(*(void *)(v81 - 8) + 32))(v70, v103);
                    (*(void (**)(uint64_t, uint64_t))(*(void *)(v99 - 8) + 32))(v97, v112);
                    (*(void (**)(uint64_t, uint64_t *))(*(void *)(v109 - 8) + 32))(v107, v133);
                    v95((uint64_t)v134, v64);
                    v67((uint64_t)v136, v91);
                    v89((uint64_t)v138, v60);
                    v84((uint64_t)v166, v58);
                    v83((uint64_t)v146, v128);
                    v82((uint64_t)v140, v130);
                    v68(v118, v132);
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
                    swift_task_dealloc();
                    swift_task_dealloc();
                    swift_task_dealloc();
                    swift_task_dealloc();
                    swift_task_dealloc();
                    swift_task_dealloc();
                    swift_task_dealloc();
                    v47 = *(uint64_t (**)(void))(v0 + 8);
                    goto LABEL_24;
                  }
                  (*(void (**)(void))(*(void *)(*(void *)(v0 + 368) - 8) + 8))(*(void *)(v0 + 440));
                }
                (*(void (**)(void))(*(void *)(*(void *)(v0 + 360) - 8) + 8))(*(void *)(v0 + 472));
              }
              (*(void (**)(void))(*(void *)(*(void *)(v0 + 352) - 8) + 8))(*(void *)(v0 + 504));
            }
            (*(void (**)(void))(*(void *)(*(void *)(v0 + 344) - 8) + 8))(*(void *)(v0 + 536));
          }
          (*(void (**)(void))(*(void *)(*(void *)(v0 + 336) - 8) + 8))(*(void *)(v0 + 568));
        }
        (*(void (**)(void))(*(void *)(*(void *)(v0 + 328) - 8) + 8))(*(void *)(v0 + 600));
      }
      (*(void (**)(void))(*(void *)(*(void *)(v0 + 320) - 8) + 8))(*(void *)(v0 + 640));
    }
    uint64_t v25 = (uint64_t *)(v0 + 408);
    uint64_t v26 = *(void *)(v0 + 584);
    v143 = v26;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v148 = *(void *)(v0 + 400);
      v151 = *(void *)(v0 + 424);
      v92 = v151;
      v154 = *(void *)(v0 + 456);
      v90 = v154;
      v157 = *(void *)(v0 + 488);
      v88 = v157;
      v163 = *(void *)(v0 + 520);
      v86 = v163;
      uint64_t v27 = (uint64_t *)(v0 + 560);
      v160 = *(void *)(v0 + 552);
      v85 = v160;
      v140 = v146;
      uint64_t v28 = v15;
    }
    else
    {
      uint64_t v35 = *(void *)(v0 + 552);
      v160 = v35;
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        v163 = *(void *)(v0 + 520);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          v148 = *(void *)(v0 + 400);
          v151 = *(void *)(v0 + 424);
          v92 = v151;
          v154 = *(void *)(v0 + 456);
          v90 = v154;
          v157 = *(void *)(v0 + 488);
          v88 = v157;
          int64_t v34 = (uint64_t *)(v0 + 560);
          v86 = v35;
          v166 = v146;
          v85 = v26;
          uint64_t v28 = v15;
          uint64_t v27 = (uint64_t *)(v0 + 592);
          uint64_t v32 = (uint64_t *)(v0 + 464);
          id v31 = (uint64_t *)(v0 + 432);
          uint64_t v33 = (uint64_t *)(v0 + 496);
        }
        else
        {
          v157 = *(void *)(v0 + 488);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            v148 = *(void *)(v0 + 400);
            v151 = *(void *)(v0 + 424);
            v92 = v151;
            v154 = *(void *)(v0 + 456);
            v90 = v154;
            uint64_t v33 = (uint64_t *)(v0 + 528);
            v88 = v163;
            v138 = v166;
            int64_t v34 = (uint64_t *)(v0 + 560);
            v86 = v35;
            v166 = v146;
            v85 = v26;
            uint64_t v28 = v15;
            uint64_t v27 = (uint64_t *)(v0 + 592);
            uint64_t v32 = (uint64_t *)(v0 + 464);
            id v31 = (uint64_t *)(v0 + 432);
          }
          else
          {
            v154 = *(void *)(v0 + 456);
            if (swift_getEnumCaseMultiPayload() == 1)
            {
              v148 = *(void *)(v0 + 400);
              v151 = *(void *)(v0 + 424);
              v92 = v151;
              uint64_t v32 = (uint64_t *)(v0 + 496);
              v90 = v157;
              v136 = v138;
              uint64_t v33 = (uint64_t *)(v0 + 528);
              v88 = v163;
              v138 = v166;
              int64_t v34 = (uint64_t *)(v0 + 560);
              v86 = v35;
              v166 = v146;
              v85 = v26;
              uint64_t v28 = v15;
              uint64_t v27 = (uint64_t *)(v0 + 592);
              id v31 = (uint64_t *)(v0 + 432);
            }
            else
            {
              v151 = *(void *)(v0 + 424);
              if (swift_getEnumCaseMultiPayload() == 1)
              {
                v148 = *(void *)(v0 + 400);
                id v31 = (uint64_t *)(v0 + 464);
                v92 = v154;
                v134 = v136;
                uint64_t v32 = (uint64_t *)(v0 + 496);
                v90 = v157;
                v136 = v138;
                uint64_t v33 = (uint64_t *)(v0 + 528);
                v88 = v163;
                v138 = v166;
                int64_t v34 = (uint64_t *)(v0 + 560);
                v86 = v35;
                v166 = v146;
                v85 = v26;
                uint64_t v28 = v15;
                uint64_t v27 = (uint64_t *)(v0 + 592);
              }
              else
              {
                v148 = *(void *)(v0 + 400);
                if (swift_getEnumCaseMultiPayload() != 1)
                {
                  _StringGuts.grow(_:)(52);
                  v49._object = (void *)0x80000002128B5B10;
                  v49._countAndFlagsBits = 0xD000000000000015;
                  String.append(_:)(v49);
                  swift_getWitnessTable();
                  DefaultStringInterpolation.appendInterpolation<A>(_:)();
                  v50._countAndFlagsBits = 8236;
                  v50._object = (void *)0xE200000000000000;
                  String.append(_:)(v50);
                  swift_getWitnessTable();
                  DefaultStringInterpolation.appendInterpolation<A>(_:)();
                  v51._countAndFlagsBits = 8236;
                  v51._object = (void *)0xE200000000000000;
                  String.append(_:)(v51);
                  swift_getWitnessTable();
                  DefaultStringInterpolation.appendInterpolation<A>(_:)();
                  v52._countAndFlagsBits = 8236;
                  v52._object = (void *)0xE200000000000000;
                  String.append(_:)(v52);
                  swift_getWitnessTable();
                  DefaultStringInterpolation.appendInterpolation<A>(_:)();
                  v53._countAndFlagsBits = 8236;
                  v53._object = (void *)0xE200000000000000;
                  String.append(_:)(v53);
                  swift_getWitnessTable();
                  DefaultStringInterpolation.appendInterpolation<A>(_:)();
                  v54._countAndFlagsBits = 8236;
                  v54._object = (void *)0xE200000000000000;
                  String.append(_:)(v54);
                  swift_getWitnessTable();
                  DefaultStringInterpolation.appendInterpolation<A>(_:)();
                  v55._countAndFlagsBits = 8236;
                  v55._object = (void *)0xE200000000000000;
                  String.append(_:)(v55);
                  swift_getWitnessTable();
                  DefaultStringInterpolation.appendInterpolation<A>(_:)();
                  v56._countAndFlagsBits = 8236;
                  v56._object = (void *)0xE200000000000000;
                  String.append(_:)(v56);
                  swift_getWitnessTable();
                  DefaultStringInterpolation.appendInterpolation<A>(_:)();
                  v57._countAndFlagsBits = 41;
                  v57._object = (void *)0xE100000000000000;
                  String.append(_:)(v57);
                  return _assertionFailure(_:_:file:line:flags:)();
                }
                uint64_t v25 = (uint64_t *)(v0 + 432);
                uint64_t v28 = v23;
                id v31 = (uint64_t *)(v0 + 464);
                v92 = v154;
                v134 = v136;
                uint64_t v32 = (uint64_t *)(v0 + 496);
                v90 = v157;
                v136 = v138;
                uint64_t v33 = (uint64_t *)(v0 + 528);
                v88 = v163;
                v138 = v166;
                int64_t v34 = (uint64_t *)(v0 + 560);
                v86 = v35;
                v166 = v146;
                v85 = v26;
                uint64_t v27 = (uint64_t *)(v0 + 592);
              }
            }
          }
        }
        goto LABEL_23;
      }
      v148 = *(void *)(v0 + 400);
      v151 = *(void *)(v0 + 424);
      v92 = v151;
      v154 = *(void *)(v0 + 456);
      v90 = v154;
      v157 = *(void *)(v0 + 488);
      v88 = v157;
      v163 = *(void *)(v0 + 520);
      v85 = v26;
      v86 = v163;
      uint64_t v28 = v15;
      uint64_t v27 = (uint64_t *)(v0 + 592);
    }
    uint64_t v32 = (uint64_t *)(v0 + 464);
    id v31 = (uint64_t *)(v0 + 432);
    int64_t v34 = (uint64_t *)(v0 + 528);
    uint64_t v33 = (uint64_t *)(v0 + 496);
  }
LABEL_23:
  uint64_t v36 = *v27;
  uint64_t v37 = *v34;
  uint64_t v38 = *v33;
  uint64_t v39 = *v32;
  uint64_t v40 = *v31;
  uint64_t v41 = *v25;
  v122 = *(void *)(v0 + 648);
  v173 = *(void *)(v0 + 624);
  v93 = *(void *)(v0 + 616);
  v114 = *(void *)(v0 + 592);
  v117 = *(void *)(v0 + 608);
  v108 = *(void *)(v0 + 560);
  v111 = *(void *)(v0 + 576);
  v106 = *(void *)(v0 + 544);
  v100 = *(void *)(v0 + 512);
  v102 = *(void *)(v0 + 528);
  v96 = *(void *)(v0 + 480);
  v98 = *(void *)(v0 + 496);
  long long v42 = *(void *)(v0 + 464);
  v94 = *(void *)(v0 + 448);
  uint64_t v43 = *(void *)(v0 + 432);
  v44 = *(void *)(v0 + 408);
  v170 = *(void *)(v0 + 416);
  v45 = *(void *)(v0 + 392);
  (*(void (**)(uint64_t *))(v41 + 8))(v28);
  (*(void (**)(uint64_t *, uint64_t))(v40 + 8))(v134, v92);
  (*(void (**)(uint64_t *, uint64_t))(v39 + 8))(v136, v90);
  (*(void (**)(uint64_t *, uint64_t))(v38 + 8))(v138, v88);
  (*(void (**)(uint64_t *, uint64_t))(v37 + 8))(v166, v86);
  (*(void (**)(uint64_t *, uint64_t))(v36 + 8))(v140, v85);
  long long v46 = *(void (**)(uint64_t, uint64_t))(v173 + 8);
  v46(v45, v93);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v170, v148);
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v94, v151);
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v96, v154);
  (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v100, v157);
  (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v106, v163);
  (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v111, v160);
  (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v117, v143);
  v46(v122, v93);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v47 = *(uint64_t (**)(void))(v0 + 8);
LABEL_24:
  return v47();
}

uint64_t method lookup function for AVAnyAsyncProperty(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AVAnyAsyncProperty);
}

uint64_t dispatch thunk of AVAnyAsyncProperty.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t method lookup function for AVPartialAsyncProperty(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AVPartialAsyncProperty);
}

uint64_t method lookup function for AVAsyncProperty(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AVAsyncProperty);
}

void *initializeBufferWithCopyOfBuffer for AVAsyncProperty.Status(void *__dst, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = __dst;
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  if (*(void *)(v4 + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  }
  if (v5 > 3)
  {
    unint64_t v6 = v5 + 1;
    int v7 = *(_DWORD *)(v4 + 80);
    int v8 = v7 & 0x1000F8;
    goto LABEL_6;
  }
  unsigned int v12 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  int v7 = *(_DWORD *)(v4 + 80);
  if (v12 > 0xFFFD)
  {
    if ((unint64_t)(v5 + 4) > 0x18 || (v7 & 0x1000F8) != 0) {
      goto LABEL_27;
    }
    unsigned int v10 = *(_DWORD *)&a2[v5];
    unsigned int v11 = v10 - 2;
    if (v10 < 2) {
      goto LABEL_39;
    }
    goto LABEL_29;
  }
  int v8 = v7 & 0x1000F8;
  if (v12 > 0xFD)
  {
    if ((unint64_t)(v5 + 2) > 0x18 || v8 != 0) {
      goto LABEL_27;
    }
    unsigned int v10 = *(unsigned __int16 *)&a2[v5];
    unsigned int v11 = v10 - 2;
    if (v10 < 2) {
      goto LABEL_39;
    }
LABEL_29:
    if (v5 <= 3) {
      uint64_t v16 = v5;
    }
    else {
      uint64_t v16 = 4;
    }
    switch(v16)
    {
      case 1:
        int v17 = *a2;
        goto LABEL_37;
      case 2:
        int v17 = *(unsigned __int16 *)a2;
        goto LABEL_37;
      case 3:
        int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_37;
      case 4:
        int v17 = *(_DWORD *)a2;
LABEL_37:
        int v18 = (v17 | (v11 << (8 * v5))) + 2;
        unsigned int v10 = v17 + 2;
        if (v5 < 4) {
          unsigned int v10 = v18;
        }
        break;
      default:
        goto LABEL_39;
    }
    goto LABEL_39;
  }
  unint64_t v6 = v5 + 1;
LABEL_6:
  if (v6 > 0x18 || v8 != 0)
  {
LABEL_27:
    uint64_t v15 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v15 + (((v7 & 0xF8 | 7u) + 16) & ~(unint64_t)(v7 & 0xF8 | 7u)));
    swift_retain();
    return v3;
  }
  unsigned int v10 = a2[v5];
  unsigned int v11 = v10 - 2;
  if (v10 >= 2) {
    goto LABEL_29;
  }
LABEL_39:
  if (v10 == 1)
  {
    uint64_t v20 = *(void **)a2;
    *__dst = *(void *)a2;
    id v21 = v20;
    if (v5 > 3) {
      goto LABEL_46;
    }
    unsigned int v24 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v24 > 0xFFFD)
    {
      *(_DWORD *)((char *)v3 + v5) = 1;
      return v3;
    }
    if (v24 <= 0xFD) {
LABEL_46:
    }
      *((unsigned char *)v3 + v5) = 1;
    else {
      *(_WORD *)((char *)v3 + v5) = 1;
    }
  }
  else if (v10)
  {
    if (v5 > 3) {
      goto LABEL_51;
    }
    unsigned int v22 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    uint64_t v23 = 2;
    if (v22 > 0xFFFD) {
      uint64_t v23 = 4;
    }
    if (v22 <= 0xFD) {
LABEL_51:
    }
      uint64_t v23 = 1;
    memcpy(__dst, a2, v23 + v5);
  }
  else
  {
    (*(void (**)(void *))(v4 + 16))(__dst);
    if (v5 <= 3)
    {
      unsigned int v19 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v19 > 0xFFFD)
      {
        *(_DWORD *)((char *)v3 + v5) = 0;
        return v3;
      }
      if (v19 > 0xFD)
      {
        *(_WORD *)((char *)v3 + v5) = 0;
        return v3;
      }
    }
    *((unsigned char *)v3 + v5) = 0;
  }
  return v3;
}

id *assignWithCopy for AVAsyncProperty.Status(id *__dst, id *__src, uint64_t a3)
{
  if (__dst == __src) {
    return __dst;
  }
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  if (v7 > 3) {
    goto LABEL_6;
  }
  unsigned int v9 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v9 > 0xFFFD)
  {
    unsigned int v8 = *(_DWORD *)((char *)__dst + v7);
  }
  else
  {
    if (v9 <= 0xFD)
    {
LABEL_6:
      unsigned int v8 = *((unsigned __int8 *)__dst + v7);
      goto LABEL_11;
    }
    unsigned int v8 = *(unsigned __int16 *)((char *)__dst + v7);
  }
LABEL_11:
  unsigned int v10 = v8 - 2;
  if (v8 >= 2)
  {
    if (v7 <= 3) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *(unsigned __int8 *)__dst;
        if (v7 < 4) {
          goto LABEL_23;
        }
        goto LABEL_24;
      case 2:
        int v12 = *(unsigned __int16 *)__dst;
        if (v7 >= 4) {
          goto LABEL_24;
        }
        goto LABEL_23;
      case 3:
        int v12 = *(unsigned __int16 *)__dst | (*((unsigned __int8 *)__dst + 2) << 16);
        if (v7 >= 4) {
          goto LABEL_24;
        }
        goto LABEL_23;
      case 4:
        int v12 = *(_DWORD *)__dst;
        if (v7 < 4) {
LABEL_23:
        }
          v12 |= v10 << (8 * v7);
LABEL_24:
        unsigned int v8 = v12 + 2;
        break;
      default:
        break;
    }
  }
  if (v8 == 1)
  {

    if (v7 > 3) {
      goto LABEL_33;
    }
  }
  else
  {
    if (!v8) {
      (*(void (**)(id *, uint64_t))(v6 + 8))(__dst, v5);
    }
    if (v7 > 3) {
      goto LABEL_33;
    }
  }
  unsigned int v13 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v13 <= 0xFFFD)
  {
    if (v13 > 0xFD)
    {
      unsigned int v14 = *(unsigned __int16 *)((char *)__src + v7);
      unsigned int v15 = v14 - 2;
      if (v14 < 2) {
        goto LABEL_48;
      }
      goto LABEL_38;
    }
LABEL_33:
    unsigned int v14 = *((unsigned __int8 *)__src + v7);
    unsigned int v15 = v14 - 2;
    if (v14 < 2) {
      goto LABEL_48;
    }
LABEL_38:
    if (v7 <= 3) {
      uint64_t v16 = v7;
    }
    else {
      uint64_t v16 = 4;
    }
    switch(v16)
    {
      case 1:
        int v17 = *(unsigned __int8 *)__src;
        if (v7 >= 4) {
          goto LABEL_61;
        }
        goto LABEL_47;
      case 2:
        int v17 = *(unsigned __int16 *)__src;
        if (v7 >= 4) {
          goto LABEL_61;
        }
        goto LABEL_47;
      case 3:
        int v17 = *(unsigned __int16 *)__src | (*((unsigned __int8 *)__src + 2) << 16);
        if (v7 < 4) {
          goto LABEL_47;
        }
        goto LABEL_61;
      case 4:
        int v17 = *(_DWORD *)__src;
        if (v7 < 4)
        {
LABEL_47:
          unsigned int v14 = (v17 | (v15 << (8 * v7))) + 2;
          goto LABEL_48;
        }
LABEL_61:
        unsigned int v14 = v17 + 2;
        if (v14 == 1) {
          goto LABEL_62;
        }
        goto LABEL_49;
      default:
        goto LABEL_48;
    }
  }
  unsigned int v14 = *(_DWORD *)((char *)__src + v7);
  unsigned int v15 = v14 - 2;
  if (v14 >= 2) {
    goto LABEL_38;
  }
LABEL_48:
  if (v14 == 1)
  {
LABEL_62:
    id v21 = *__src;
    *__dst = *__src;
    id v22 = v21;
    if (v7 > 3) {
      goto LABEL_63;
    }
    unsigned int v23 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    if (v23 > 0xFFFD)
    {
      *(_DWORD *)((char *)__dst + v7) = 1;
      return __dst;
    }
    if (v23 <= 0xFD) {
LABEL_63:
    }
      *((unsigned char *)__dst + v7) = 1;
    else {
      *(_WORD *)((char *)__dst + v7) = 1;
    }
  }
  else
  {
LABEL_49:
    if (v14)
    {
      if (v7 > 3) {
        goto LABEL_58;
      }
      unsigned int v19 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      uint64_t v20 = 2;
      if (v19 > 0xFFFD) {
        uint64_t v20 = 4;
      }
      if (v19 <= 0xFD) {
LABEL_58:
      }
        uint64_t v20 = 1;
      memcpy(__dst, __src, v20 + v7);
    }
    else
    {
      (*(void (**)(id *, id *, uint64_t))(v6 + 16))(__dst, __src, v5);
      if (v7 <= 3)
      {
        unsigned int v18 = ((1 << (8 * v7)) + 1) >> (8 * v7);
        if (v18 > 0xFFFD)
        {
          *(_DWORD *)((char *)__dst + v7) = 0;
          return __dst;
        }
        if (v18 > 0xFD)
        {
          *(_WORD *)((char *)__dst + v7) = 0;
          return __dst;
        }
      }
      *((unsigned char *)__dst + v7) = 0;
    }
  }
  return __dst;
}

char *initializeWithTake for AVAsyncProperty.Status(char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  }
  if (v4 > 3) {
    goto LABEL_5;
  }
  unsigned int v6 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v6 > 0xFFFD)
  {
    unsigned int v5 = *(_DWORD *)&a2[v4];
  }
  else
  {
    if (v6 <= 0xFD)
    {
LABEL_5:
      unsigned int v5 = a2[v4];
      goto LABEL_10;
    }
    unsigned int v5 = *(unsigned __int16 *)&a2[v4];
  }
LABEL_10:
  unsigned int v7 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a2;
        goto LABEL_19;
      case 2:
        int v9 = *(unsigned __int16 *)a2;
        goto LABEL_19;
      case 3:
        int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_19;
      case 4:
        int v9 = *(_DWORD *)a2;
LABEL_19:
        int v10 = (v9 | (v7 << (8 * v4))) + 2;
        unsigned int v5 = v9 + 2;
        if (v4 < 4) {
          unsigned int v5 = v10;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *(void *)__dst = *(void *)a2;
    if (v4 > 3) {
      goto LABEL_28;
    }
    unsigned int v14 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    if (v14 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v4] = 1;
      return __dst;
    }
    if (v14 <= 0xFD) {
LABEL_28:
    }
      __dst[v4] = 1;
    else {
      *(_WORD *)&__dst[v4] = 1;
    }
  }
  else if (v5)
  {
    if (v4 > 3) {
      goto LABEL_33;
    }
    unsigned int v12 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    uint64_t v13 = 2;
    if (v12 > 0xFFFD) {
      uint64_t v13 = 4;
    }
    if (v12 <= 0xFD) {
LABEL_33:
    }
      uint64_t v13 = 1;
    memcpy(__dst, a2, v13 + v4);
  }
  else
  {
    (*(void (**)(char *))(*(void *)(*(void *)(a3 + 24) - 8) + 32))(__dst);
    if (v4 <= 3)
    {
      unsigned int v11 = ((1 << (8 * v4)) + 1) >> (8 * v4);
      if (v11 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v4] = 0;
        return __dst;
      }
      if (v11 > 0xFD)
      {
        *(_WORD *)&__dst[v4] = 0;
        return __dst;
      }
    }
    __dst[v4] = 0;
  }
  return __dst;
}

id *assignWithTake for AVAsyncProperty.Status(id *__dst, id *__src, uint64_t a3)
{
  if (__dst == __src) {
    return __dst;
  }
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  if (v7 > 3) {
    goto LABEL_6;
  }
  unsigned int v9 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v9 > 0xFFFD)
  {
    unsigned int v8 = *(_DWORD *)((char *)__dst + v7);
  }
  else
  {
    if (v9 <= 0xFD)
    {
LABEL_6:
      unsigned int v8 = *((unsigned __int8 *)__dst + v7);
      goto LABEL_11;
    }
    unsigned int v8 = *(unsigned __int16 *)((char *)__dst + v7);
  }
LABEL_11:
  unsigned int v10 = v8 - 2;
  if (v8 >= 2)
  {
    if (v7 <= 3) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *(unsigned __int8 *)__dst;
        goto LABEL_20;
      case 2:
        int v12 = *(unsigned __int16 *)__dst;
        goto LABEL_20;
      case 3:
        int v12 = *(unsigned __int16 *)__dst | (*((unsigned __int8 *)__dst + 2) << 16);
        goto LABEL_20;
      case 4:
        int v12 = *(_DWORD *)__dst;
LABEL_20:
        int v13 = (v12 | (v10 << (8 * v7))) + 2;
        unsigned int v8 = v12 + 2;
        if (v7 < 4) {
          unsigned int v8 = v13;
        }
        break;
      default:
        break;
    }
  }
  if (v8 == 1)
  {

    if (v7 > 3) {
      goto LABEL_30;
    }
  }
  else
  {
    if (!v8) {
      (*(void (**)(id *, uint64_t))(v6 + 8))(__dst, v5);
    }
    if (v7 > 3)
    {
LABEL_30:
      unsigned int v15 = *((unsigned __int8 *)__src + v7);
      unsigned int v16 = v15 - 2;
      if (v15 < 2) {
        goto LABEL_45;
      }
      goto LABEL_35;
    }
  }
  unsigned int v14 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v14 > 0xFFFD)
  {
    unsigned int v15 = *(_DWORD *)((char *)__src + v7);
    unsigned int v16 = v15 - 2;
    if (v15 < 2) {
      goto LABEL_45;
    }
    goto LABEL_35;
  }
  if (v14 <= 0xFD) {
    goto LABEL_30;
  }
  unsigned int v15 = *(unsigned __int16 *)((char *)__src + v7);
  unsigned int v16 = v15 - 2;
  if (v15 < 2) {
    goto LABEL_45;
  }
LABEL_35:
  if (v7 <= 3) {
    uint64_t v17 = v7;
  }
  else {
    uint64_t v17 = 4;
  }
  switch(v17)
  {
    case 1:
      int v18 = *(unsigned __int8 *)__src;
      goto LABEL_43;
    case 2:
      int v18 = *(unsigned __int16 *)__src;
      goto LABEL_43;
    case 3:
      int v18 = *(unsigned __int16 *)__src | (*((unsigned __int8 *)__src + 2) << 16);
      goto LABEL_43;
    case 4:
      int v18 = *(_DWORD *)__src;
LABEL_43:
      int v19 = (v18 | (v16 << (8 * v7))) + 2;
      unsigned int v15 = v18 + 2;
      if (v7 < 4) {
        unsigned int v15 = v19;
      }
      break;
    default:
      break;
  }
LABEL_45:
  if (v15 == 1)
  {
    *__dst = *__src;
    if (v7 > 3) {
      goto LABEL_52;
    }
    unsigned int v23 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    if (v23 > 0xFFFD)
    {
      *(_DWORD *)((char *)__dst + v7) = 1;
      return __dst;
    }
    if (v23 <= 0xFD) {
LABEL_52:
    }
      *((unsigned char *)__dst + v7) = 1;
    else {
      *(_WORD *)((char *)__dst + v7) = 1;
    }
  }
  else if (v15)
  {
    if (v7 > 3) {
      goto LABEL_57;
    }
    unsigned int v21 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    uint64_t v22 = 2;
    if (v21 > 0xFFFD) {
      uint64_t v22 = 4;
    }
    if (v21 <= 0xFD) {
LABEL_57:
    }
      uint64_t v22 = 1;
    memcpy(__dst, __src, v22 + v7);
  }
  else
  {
    (*(void (**)(id *, id *, uint64_t))(v6 + 32))(__dst, __src, v5);
    if (v7 <= 3)
    {
      unsigned int v20 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      if (v20 > 0xFFFD)
      {
        *(_DWORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
      if (v20 > 0xFD)
      {
        *(_WORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
    }
    *((unsigned char *)__dst + v7) = 0;
  }
  return __dst;
}

uint64_t getEnumTagSinglePayload for AVAsyncProperty.Status(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  if (v3 <= 8) {
    unint64_t v3 = 8;
  }
  if (v3 > 3)
  {
    int v4 = 3;
LABEL_7:
    char v6 = 8;
    goto LABEL_8;
  }
  unsigned int v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFD) {
    goto LABEL_11;
  }
  int v4 = v5 + 2;
  if (v5 <= 0xFD) {
    goto LABEL_7;
  }
  char v6 = 16;
LABEL_8:
  unsigned int v7 = (1 << v6) - v4;
  if ((v7 & 0x80000000) == 0)
  {
    if (v3 > 3) {
      goto LABEL_15;
    }
LABEL_12:
    unsigned int v8 = ((1 << (8 * v3)) + 1) >> (8 * v3);
    uint64_t v9 = 2;
    if (v8 > 0xFFFD) {
      uint64_t v9 = 4;
    }
    if (v8 > 0xFD) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_11:
  unsigned int v7 = 0x7FFFFFFF;
  if (v3 <= 3) {
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v9 = 1;
LABEL_16:
  if (!a2) {
    return 0;
  }
  if (a2 <= v7) {
    goto LABEL_35;
  }
  unint64_t v10 = v9 + v3;
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v13 = ((a2 - v7 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v13))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_35;
      }
      goto LABEL_27;
    }
    if (v13 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_35;
      }
      goto LABEL_27;
    }
    if (v13 < 2)
    {
LABEL_35:
      if (v7)
      {
        if (v3 <= 3)
        {
          unsigned int v21 = ((1 << (8 * v3)) + 1) >> (8 * v3);
          if (v21 > 0xFFFD)
          {
            unsigned int v16 = *(_DWORD *)((char *)a1 + v3);
            unsigned int v17 = ~v16;
LABEL_45:
            unsigned int v24 = 0x7FFFFFFF;
LABEL_46:
            if (v24 > v17) {
              return -v16;
            }
            else {
              return 0;
            }
          }
          int v19 = v21 + 2;
          if (v21 > 0xFD)
          {
            int v23 = *(unsigned __int16 *)((char *)a1 + v3);
            unsigned int v16 = v23 | 0xFFFF0000;
            unsigned int v17 = v23 ^ 0xFFFF;
            char v18 = 16;
          }
          else
          {
            int v22 = *((unsigned __int8 *)a1 + v3);
            unsigned int v16 = v22 | 0xFFFFFF00;
            unsigned int v17 = v22 ^ 0xFF;
            char v18 = 8;
          }
        }
        else
        {
          int v15 = *((unsigned __int8 *)a1 + v3);
          unsigned int v16 = v15 | 0xFFFFFF00;
          unsigned int v17 = v15 ^ 0xFF;
          char v18 = 8;
          int v19 = 3;
        }
        unsigned int v24 = (1 << v18) - v19;
        if ((v24 & 0x80000000) == 0) {
          goto LABEL_46;
        }
        goto LABEL_45;
      }
      return 0;
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_35;
  }
LABEL_27:
  int v14 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v14 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v10 | v14) + 1;
}

void storeEnumTagSinglePayload for AVAsyncProperty.Status(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  char v6 = 8 * v5;
  if (v5 > 3)
  {
    int v7 = 3;
LABEL_5:
    char v8 = 8;
    goto LABEL_6;
  }
  unsigned int v10 = ((1 << v6) + 1) >> v6;
  if (v10 > 0xFFFD) {
    goto LABEL_12;
  }
  int v7 = v10 + 2;
  if (v10 <= 0xFD) {
    goto LABEL_5;
  }
  char v8 = 16;
LABEL_6:
  unsigned int v9 = (1 << v8) - v7;
  if ((v9 & 0x80000000) == 0)
  {
    if (v5 > 3) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
LABEL_12:
  unsigned int v9 = 0x7FFFFFFF;
  if (v5 > 3)
  {
LABEL_16:
    uint64_t v12 = 1;
    goto LABEL_17;
  }
LABEL_13:
  unsigned int v11 = ((1 << v6) + 1) >> v6;
  uint64_t v12 = 2;
  if (v11 > 0xFFFD) {
    uint64_t v12 = 4;
  }
  if (v11 <= 0xFD) {
    goto LABEL_16;
  }
LABEL_17:
  size_t v13 = v12 + v5;
  if (a3 <= v9)
  {
    int v14 = 0;
  }
  else if (v13 <= 3)
  {
    unsigned int v17 = ((a3 - v9 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
    if (HIWORD(v17))
    {
      int v14 = 4;
    }
    else if (v17 >= 0x100)
    {
      int v14 = 2;
    }
    else
    {
      int v14 = v17 > 1;
    }
  }
  else
  {
    int v14 = 1;
  }
  if (v9 < a2)
  {
    unsigned int v15 = ~v9 + a2;
    if (v13 < 4)
    {
      int v16 = (v15 >> (8 * v13)) + 1;
      if (v13)
      {
        int v18 = v15 & ~(-1 << (8 * v13));
        bzero(a1, v13);
        if (v13 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v13 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v13);
      *(_DWORD *)a1 = v15;
      int v16 = 1;
    }
    switch(v14)
    {
      case 1:
        a1[v13] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v16;
        return;
      case 3:
        goto LABEL_53;
      case 4:
        *(_DWORD *)&a1[v13] = v16;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 3:
LABEL_53:
      __break(1u);
      JUMPOUT(0x21289651CLL);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_36;
    default:
LABEL_36:
      if (!a2) {
        return;
      }
LABEL_37:
      int v19 = -a2;
      if (v5 > 3) {
        goto LABEL_38;
      }
      unsigned int v20 = ((1 << v6) + 1) >> v6;
      if (v20 > 0xFFFD)
      {
        *(_DWORD *)&a1[v5] = v19;
      }
      else if (v20 <= 0xFD)
      {
LABEL_38:
        a1[v5] = v19;
      }
      else
      {
        *(_WORD *)&a1[v5] = v19;
      }
      return;
  }
}

uint64_t getEnumTag for AVAsyncProperty.Status(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v3 = 8;
  if (*(void *)(v2 + 64) > 8uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  if (v3 > 3) {
    goto LABEL_4;
  }
  unsigned int v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFD)
  {
    uint64_t v4 = *(unsigned int *)&a1[v3];
  }
  else
  {
    if (v5 <= 0xFD)
    {
LABEL_4:
      uint64_t v4 = a1[v3];
      goto LABEL_9;
    }
    uint64_t v4 = *(unsigned __int16 *)&a1[v3];
  }
LABEL_9:
  int v6 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a1;
        goto LABEL_18;
      case 2:
        int v8 = *(unsigned __int16 *)a1;
        goto LABEL_18;
      case 3:
        int v8 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_18;
      case 4:
        int v8 = *(_DWORD *)a1;
LABEL_18:
        unsigned int v9 = (v8 | (v6 << (8 * v3))) + 2;
        LODWORD(v4) = v8 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v9;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void destructiveInjectEnumTag for AVAsyncProperty.Status(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) <= 8uLL) {
    size_t v5 = 8;
  }
  else {
    size_t v5 = *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v6 = a2 - 2;
    if (v5 < 4)
    {
      int v8 = (v6 >> (8 * v5)) + 2;
      v6 &= ~(-1 << (8 * v5));
      unsigned int v9 = (int *)&a1[v5];
      unsigned int v10 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v10 > 0xFFFD)
      {
        *unsigned int v9 = v8;
      }
      else if (v10 > 0xFD)
      {
        *(_WORD *)unsigned int v9 = v8;
      }
      else
      {
        *(unsigned char *)unsigned int v9 = v8;
      }
    }
    else
    {
      a1[v5] = 2;
    }
    if (v5 <= 3) {
      int v11 = v5;
    }
    else {
      int v11 = 4;
    }
    bzero(a1, v5);
    switch(v11)
    {
      case 2:
        *(_WORD *)a1 = v6;
        break;
      case 3:
        *(_WORD *)a1 = v6;
        a1[2] = BYTE2(v6);
        break;
      case 4:
        *(_DWORD *)a1 = v6;
        break;
      default:
        *a1 = v6;
        break;
    }
  }
  else
  {
    if (v5 > 3)
    {
LABEL_6:
      a1[v5] = a2;
      return;
    }
    unsigned int v7 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v7 > 0xFFFD)
    {
      *(_DWORD *)&a1[v5] = a2;
    }
    else
    {
      if (v7 <= 0xFD) {
        goto LABEL_6;
      }
      *(_WORD *)&a1[v5] = a2;
    }
  }
}

uint64_t sub_2128967BC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t AVMetadataMachineReadableCodeObject.corners.getter()
{
  id v1 = [v0 corners];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = v15;
    while (1)
    {
      swift_bridgeObjectRetain();
      v6.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      CGPoint_optional v16 = CGPoint.init(dictionaryRepresentation:)(v6.super.isa);
      if (v8) {
        break;
      }
      uint64_t v9 = *(void *)&v16.is_nil;
      uint64_t v10 = v7;
      swift_bridgeObjectRelease();
      unint64_t v12 = *(void *)(v15 + 16);
      unint64_t v11 = *(void *)(v15 + 24);
      if (v12 >= v11 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v4;
      *(void *)(v15 + 16) = v12 + 1;
      uint64_t v13 = v15 + 16 * v12;
      *(void *)(v13 + 32) = v9;
      *(void *)(v13 + 40) = v10;
      if (v3 == v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = MEMORY[0x263F8EE78];
LABEL_9:
    *(void *)&v16.is_nil = v5;
  }
  LOBYTE(result) = v16.is_nil;
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<CGPoint>);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<Int32>);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<UInt32>);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<AVCaptureFlashMode>);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<AVCaptureColorSpace>);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *int64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<ClosedRange<CGFloat>>);
  *int64_t v3 = result;
  return result;
}

void *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(void *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<[String : Any]>, &demangling cache variable for type metadata for [String : Any]);
  *int64_t v3 = result;
  return result;
}

{
  void **v3;
  void *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<[[String : NSNumber]]>, &demangling cache variable for type metadata for [[String : NSNumber]]);
  *int64_t v3 = result;
  return result;
}

{
  void **v3;
  void *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<[String : NSNumber]>, &demangling cache variable for type metadata for [String : NSNumber]);
  *int64_t v3 = result;
  return result;
}

{
  void **v3;
  void *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<[CGPoint]>, &demangling cache variable for type metadata for [CGPoint]);
  *int64_t v3 = result;
  return result;
}

{
  void **v3;
  void *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<[CMTag]>, &demangling cache variable for type metadata for [CMTag]);
  *int64_t v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMTimeRange>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 48 * v8);
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Float>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    unint64_t v12 = v11 - 32;
    if (v11 < 32) {
      unint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    unint64_t v12 = v11 - 32;
    if (v11 < 32) {
      unint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    unint64_t v12 = v11 - 32;
    if (v11 < 32) {
      unint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMTimeMapping>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[96 * v8]) {
      memmove(v12, v13, 96 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 96 * v8);
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMVideoDimensions>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    unint64_t v12 = v11 - 32;
    if (v11 < 32) {
      unint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CGFloat>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    unint64_t v12 = v11 - 32;
    if (v11 < 32) {
      unint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    size_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 29;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 2);
  }
  else
  {
    size_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  int v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[4 * v9]) {
      memmove(v14, v15, 4 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 4 * v9);
  }
  swift_release();
  return v11;
}

{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    size_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    size_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  int v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_release();
  return v11;
}

{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    size_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    size_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  int v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9]) {
      memmove(v14, v15, 16 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v9);
  }
  swift_release();
  return v11;
}

void *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    int64_t v14 = _swift_stdlib_malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 25;
    }
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  if (v8)
  {
    if (v13 != a4 || v13 + 4 >= &a4[v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

void *static AVPartialAsyncProperty<A>.preferredRate.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D5C8], 0x6572726566657270, 0xED00006574615264);
}

void *static AVPartialAsyncProperty<A>.preferredVolume.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D5C8], 0x6572726566657270, 0xEF656D756C6F5664);
}

{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D5C8], 0x6572726566657270, 0xEF656D756C6F5664);
}

void *static AVPartialAsyncProperty<A>.preferredTransform.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter(type metadata accessor for CGAffineTransform, 0xD000000000000012, 0x80000002128B5B70);
}

{
  return static AVPartialAsyncProperty<A>.timeRange.getter(type metadata accessor for CGAffineTransform, 0xD000000000000012, 0x80000002128B5B70);
}

void *static AVPartialAsyncProperty<A>.minimumTimeOffsetFromLive.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter(type metadata accessor for CMTime, 0xD000000000000019, 0x80000002128B5B90);
}

void *static AVPartialAsyncProperty<A>.providesPreciseDurationAndTiming.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0xD000000000000020, 0x80000002128B5BB0);
}

void *static AVPartialAsyncProperty<A>.trackGroups.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVAssetTrackGroup], 0x6F72476B63617274, 0xEB00000000737075);
}

void *static AVPartialAsyncProperty<A>.creationDate.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for AVMetadataItem?, 0x6E6F697461657263, 0xEC00000065746144);
}

void *static AVPartialAsyncProperty<A>.lyrics.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for String?, 0x73636972796CLL, 0xE600000000000000);
}

void *static AVPartialAsyncProperty<A>.commonMetadata.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataItem], 0x654D6E6F6D6D6F63, 0xEE00617461646174);
}

{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataItem], 0x654D6E6F6D6D6F63, 0xEE00617461646174);
}

void *static AVPartialAsyncProperty<A>.metadata.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataItem], 0x617461646174656DLL, 0xE800000000000000);
}

{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataItem], 0x617461646174656DLL, 0xE800000000000000);
}

void *static AVPartialAsyncProperty<A>.availableMetadataFormats.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataFormat], 0xD000000000000018, 0x80000002128B5BE0);
}

{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataFormat], 0xD000000000000018, 0x80000002128B5BE0);
}

void *static AVPartialAsyncProperty<A>.availableChapterLocales.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [Locale], 0xD000000000000017, 0x80000002128B5C00);
}

uint64_t AVAsset.loadChapterMetadataGroups(withTitleLocale:containingItemsWithCommonKeys:)(uint64_t a1, uint64_t a2)
{
  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  return MEMORY[0x270FA2498](AVAsset.loadChapterMetadataGroups(withTitleLocale:containingItemsWithCommonKeys:), 0, 0);
}

uint64_t AVAsset.loadChapterMetadataGroups(withTitleLocale:containingItemsWithCommonKeys:)()
{
  id v1 = (void *)v0[18];
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  v0[19] = isa;
  type metadata accessor for AVMetadataKey(0);
  Class v3 = Array._bridgeToObjectiveC()().super.isa;
  v0[20] = v3;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = AVAsset.loadChapterMetadataGroups(withTitleLocale:containingItemsWithCommonKeys:);
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSArray?, @unowned NSError?) -> () with result type [AVTimedMetadataGroup];
  v0[13] = &block_descriptor_0;
  v0[14] = v4;
  [v1 loadChapterMetadataGroupsWithTitleLocale:v3 containingItemsWithCommonKeys:v0 + 10 completionHandler:isa];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  id v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    uint64_t v2 = AVAsset.loadChapterMetadataGroups(withTitleLocale:containingItemsWithCommonKeys:);
  }
  else {
    uint64_t v2 = AVAsset.loadChapterMetadataGroups(withTitleLocale:containingItemsWithCommonKeys:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v5;

  id v1 = *(void **)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 120);

  Class v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  id v1 = (void *)v0[20];
  uint64_t v2 = (void *)v0[19];
  swift_willThrow();

  Class v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSArray?, @unowned NSError?) -> () with result type [AVTimedMetadataGroup](uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for AVTimedMetadataGroup);
    **(void **)(*(void *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return MEMORY[0x270FA2408](v3);
  }
}

void *static AVPartialAsyncProperty<A>.variants.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVAssetVariant], 0x73746E6169726176, 0xE800000000000000);
}

void *static AVPartialAsyncProperty<A>.availableMediaCharacteristicsWithMediaSelectionOptions.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMediaCharacteristic], 0xD000000000000036, 0x80000002128B5C40);
}

void *static AVPartialAsyncProperty<A>.preferredMediaSelection.getter()
{
  return AVAsyncProperty<>.init(key:)(0xD000000000000017, 0x80000002128B5C80);
}

void *static AVPartialAsyncProperty<A>.allMediaSelections.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMediaSelection], 0xD000000000000012, 0x80000002128B5CA0);
}

void *static AVPartialAsyncProperty<A>.hasProtectedContent.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0xD000000000000013, 0x80000002128B5CC0);
}

void *static AVPartialAsyncProperty<A>.canContainFragments.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0xD000000000000013, 0x80000002128B5CE0);
}

void *static AVPartialAsyncProperty<A>.containsFragments.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0xD000000000000011, 0x80000002128B5D00);
}

void *static AVPartialAsyncProperty<A>.overallDurationHint.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter(type metadata accessor for CMTime, 0xD000000000000013, 0x80000002128B5D20);
}

void *static AVPartialAsyncProperty<A>.isPlayable.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0x656C626179616C70, 0xE800000000000000);
}

{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0x656C626179616C70, 0xE800000000000000);
}

void *static AVPartialAsyncProperty<A>.isExportable.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0x626174726F707865, 0xEA0000000000656CLL);
}

void *static AVPartialAsyncProperty<A>.isReadable.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0x656C626164616572, 0xE800000000000000);
}

void *static AVPartialAsyncProperty<A>.isComposable.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0x6261736F706D6F63, 0xEA0000000000656CLL);
}

void *static AVPartialAsyncProperty<A>.isCompatibleWithSavedPhotosAlbum.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0xD00000000000001ELL, 0x80000002128B5D40);
}

void *static AVPartialAsyncProperty<A>.isCompatibleWithAirPlayVideo.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0xD00000000000001ALL, 0x80000002128B5D60);
}

void *static AVPartialAsyncProperty<A>.preferredRate.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AVAsyncProperty<>.init(key:)(a2, a3);
}

uint64_t type metadata accessor for AVMediaSelection(uint64_t a1, unint64_t *a2)
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

id AVCaption.textColor(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_textColorAtIndex_range_);
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

id AVCaption.backgroundColor(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_backgroundColorAtIndex_range_);
}

id AVCaption.textColor(at:)(uint64_t a1, SEL *a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  v9[1] = 0;
  id v4 = [v2 sel_text];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v5 = String.Index.utf16Offset<A>(in:)();
  swift_bridgeObjectRelease();
  id v6 = [v2 *a2:v5 v9];
  id v7 = [v2 sel_text];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  Range<>.init(_:in:)();
  swift_bridgeObjectRelease();
  return v6;
}

id AVCaption.fontWeight(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_fontWeightAtIndex_range_);
}

id AVCaption.fontStyle(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_fontStyleAtIndex_range_);
}

id AVCaption.decoration(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_decorationAtIndex_range_);
}

id AVCaption.textCombine(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_textCombineAtIndex_range_);
}

id AVCaption.ruby(at:)()
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  v6[1] = 0;
  id v1 = [v0 sel_text];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v2 = String.Index.utf16Offset<A>(in:)();
  swift_bridgeObjectRelease();
  id v3 = [v0 sel_rubyAtIndex_range_:v2 range:v6];
  id v4 = [v0 sel_text];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  Range<>.init(_:in:)();
  swift_bridgeObjectRelease();
  return v3;
}

Swift::Void __swiftcall AVMutableCaption.setTextColor(_:in:)(CGColorRef _, _NSRange in)
{
  [v2 setTextColor:_ inRange:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.setBackgroundColor(_:in:)(CGColorRef _, _NSRange in)
{
  [v2 setBackgroundColor:_ inRange:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.setFontWeight(_:in:)(AVCaptionFontWeight _, _NSRange in)
{
  [v2 setFontWeight:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.setFontStyle(_:in:)(AVCaptionFontStyle _, _NSRange in)
{
  [v2 setFontStyle:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.setDecoration(_:in:)(AVCaptionDecoration _, _NSRange in)
{
  [v2 setDecoration:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.setTextCombine(_:in:)(AVCaptionTextCombine _, _NSRange in)
{
  [v2 setTextCombine:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.setRuby(_:in:)(AVCaptionRuby _, _NSRange in)
{
  [v2 setRuby:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.removeTextColor(in:)(_NSRange in)
{
  [v1 removeTextColorInRange:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.removeBackgroundColor(in:)(_NSRange in)
{
  [v1 removeBackgroundColorInRange:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.removeFontWeight(in:)(_NSRange in)
{
  [v1 removeFontWeightInRange:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.removeFontStyle(in:)(_NSRange in)
{
  [v1 removeFontStyleInRange:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.removeDecoration(in:)(_NSRange in)
{
  [v1 removeDecorationInRange:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.removeTextCombine(in:)(_NSRange in)
{
  [v1 removeTextCombineInRange:in.location, in.length];
}

Swift::Void __swiftcall AVMutableCaption.removeRuby(in:)(_NSRange in)
{
  [v1 removeRubyInRange:in.location, in.length];
}

char *_sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSaySo7NSValueCG_So11CMTimeRangeas5NeverOTg5084_sSo37AVMetricPlayerItemLikelyToKeepUpEventC12AVFoundationE16loadedTimeRangesSaySo11e14RangeaGvgAFSo7D52Ccfu_32e1aaa32c9642607d0b6314623c7365cfAiFTf3nnnpk_nTf1cn_nTm(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      return (char *)v3;
    }
    uint64_t v16 = MEMORY[0x263F8EE78];
    unint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v16;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x2166848A0](v5, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * v5 + 32);
      }
      id v7 = v6;
      [v6 CMTimeRangeValue];

      unint64_t v9 = *(void *)(v16 + 16);
      unint64_t v8 = *(void *)(v16 + 24);
      if (v9 >= v8 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v8 > 1), v9 + 1, 1);
      }
      *(void *)(v16 + 16) = v9 + 1;
      uint64_t v10 = v16 + 48 * v9;
      *(void *)(v10 + 32) = v11;
      ++v5;
      *(void *)(v10 + 40) = v12;
      *(_OWORD *)(v10 + 48) = v13;
      *(void *)(v10 + 64) = v14;
      *(void *)(v10 + 72) = v15;
      if (v2 == v5) {
        return (char *)v3;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t AVMetricEventStreamPublisher.metrics<A>(forType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = a1;
  *(unsigned char *)(a2 + 16) = 0;
  return swift_unknownObjectRetain();
}

uint64_t AVMetrics.init(forType:publisher:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result;
  *(unsigned char *)(a3 + 16) = 0;
  return result;
}

uint64_t AVMetricEventStreamPublisher.allMetrics()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  return swift_unknownObjectRetain();
}

uint64_t AVMetrics.SubscriberDelegate.__allocating_init(streamContinuation:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2 + *(void *)(*(void *)v2 + 88);
  uint64_t v4 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t AVMetrics.SubscriberDelegate.init(streamContinuation:)(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 88);
  uint64_t v4 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t @objc AVMetrics.SubscriberDelegate.publisher(_:didReceive:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_unknownObjectRetain();
  id v5 = a4;
  swift_retain();
  specialized AVMetrics.SubscriberDelegate.publisher(_:didReceive:)(v5);
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t AVMetrics.SubscriberDelegate.deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  uint64_t v2 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AVMetrics.SubscriberDelegate.__deallocating_deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  uint64_t v2 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t AVMetrics.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  if (*(unsigned char *)(v1 + 16) == 1)
  {
    uint64_t v4 = swift_unknownObjectRetain();
    return AVMetrics.AsyncIterator.init(allMetricsForPublisher:)(v4, a1);
  }
  else if (*(void *)(v1 + 8))
  {
    swift_unknownObjectRetain();
    return AVMetrics.AsyncIterator.init(forType:publisher:)(v3, a1);
  }
  else
  {
    return AVMetrics.AsyncIterator.init()(a1);
  }
}

uint64_t AVMetrics.AsyncIterator.init(allMetricsForPublisher:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  AVMetrics.AsyncIterator.init()(a2);
  uint64_t v4 = *(void **)a2;
  [v4 addPublisher:a1];
  id v5 = v4;
  [v5 subscribeToAllMetricEvents];

  return swift_unknownObjectRelease();
}

uint64_t AVMetrics.AsyncIterator.init(forType:publisher:)@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  AVMetrics.AsyncIterator.init()(a2);
  uint64_t v4 = *(void **)a2;
  [v4 addPublisher:a1];
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = v4;
  [v6 subscribeToMetricEvent:ObjCClassFromMetadata];

  return swift_unknownObjectRelease();
}

uint64_t AVMetrics.AsyncIterator.init()@<X0>(char *a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v35 = type metadata accessor for AsyncStream.Continuation.BufferingPolicy();
  uint64_t v33 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  id v31 = (char *)&v27 - v2;
  uint64_t v3 = type metadata accessor for AsyncStream.Continuation();
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v27 - v4;
  uint64_t v34 = type metadata accessor for AsyncStream();
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  long long v30 = (char *)&v27 - v6;
  uint64_t v28 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v7 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  unint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388](v11 - 8);
  id v12 = [self eventStream];
  *(void *)a1 = v12;
  type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  id v29 = v12;
  static DispatchQoS.unspecified.getter();
  uint64_t v38 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F130], v28);
  long long v13 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v14 = v27;
  *((void *)v27 + 2) = v13;
  uint64_t v15 = v33;
  uint64_t v16 = v31;
  uint64_t v17 = v35;
  (*(void (**)(char *, void, uint64_t))(v33 + 104))(v31, *MEMORY[0x263F8F580], v35);
  id v18 = v13;
  int v19 = v30;
  static AsyncStream.makeStream(of:bufferingPolicy:)();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v17);
  uint64_t v20 = type metadata accessor for AVMetrics.AsyncIterator();
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(&v14[*(int *)(v20 + 36)], v19, v34);
  unsigned int v21 = &v14[*(int *)(v20 + 40)];
  uint64_t v23 = v36;
  uint64_t v22 = v37;
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v21, v5, v37);
  type metadata accessor for AVMetrics.SubscriberDelegate();
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v5, v21, v22);
  uint64_t v24 = AVMetrics.SubscriberDelegate.__allocating_init(streamContinuation:)((uint64_t)v5);
  *((void *)v14 + 1) = v24;
  swift_retain();
  id v25 = v29;
  [v29 setSubscriber:v24 queue:v18];

  swift_release();
  return AsyncStream.makeAsyncIterator()();
}

uint64_t AVMetrics.AsyncIterator.next()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = type metadata accessor for AsyncStream.Iterator();
  void *v1 = v0;
  v1[1] = AVMetrics.AsyncIterator.next();
  return MEMORY[0x270FA1F70](v0 + 16, v2);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return MEMORY[0x270FA2498](AVMetrics.AsyncIterator.next(), 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVMetrics<A>.AsyncIterator(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVMetrics<A>.AsyncIterator;
  return AVMetrics.AsyncIterator.next()();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v8;

  uint64_t v4 = *v2;
  id v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t _s12AVFoundation9AVMetricsV13AsyncIteratorVyx_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a4;
  id v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v12;
  *id v12 = v6;
  v12[1] = _s12AVFoundation9AVMetricsV13AsyncIteratorVyx_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return MEMORY[0x270FA1E90](a1, a2, a3, a5, a6, v6 + 16);
}

id AVMetrics.enableSubscription(forMetricEventStream:)(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  int v5 = *((unsigned __int8 *)v1 + 16);
  id result = [a1 addPublisher:v3];
  if (v5 == 1)
  {
    uint64_t v7 = sel_subscribeToAllMetricEvents;
    uint64_t v8 = a1;
    return [v8 v7];
  }
  if (v4)
  {
    swift_getObjCClassFromMetadata();
    uint64_t v7 = sel_subscribeToMetricEvent_;
    uint64_t v8 = a1;
    return [v8 v7];
  }
  return result;
}

uint64_t AVMetrics.chronologicalMerge<A, B>(with:_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  unint64_t v11 = a6 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v12 = 8 * a4;
  uint64_t v39 = a5;
  uint64_t v40 = a6;
  uint64_t v37 = a3;
  uint64_t v38 = a7;
  if (a4 == 1)
  {
    uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if (a4)
    {
      uint64_t v14 = (void *)((char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v15 = a4;
      do
      {
        v11 += 8;
        *v14++ = type metadata accessor for AVMetrics();
        --v15;
      }
      while (v15);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  uint64_t v16 = MEMORY[0x270FA5388](TupleTypeMetadata);
  id v18 = (char *)v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36[1] = v36;
  uint64_t v20 = *(void *)a1;
  uint64_t v19 = *(void *)(a1 + 8);
  char v21 = *(unsigned char *)(a1 + 16);
  uint64_t v22 = *(void *)(v7 + 8);
  char v23 = *(unsigned char *)(v7 + 16);
  v43[0] = *(void *)v7;
  v43[1] = v22;
  char v44 = v23;
  v41[0] = v20;
  v41[1] = v19;
  char v42 = v21;
  uint64_t v24 = MEMORY[0x270FA5388](v16);
  id v25 = (void *)((char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a4)
  {
    uint64_t v26 = (int *)(v24 + 32);
    uint64_t v27 = v25;
    uint64_t v28 = a4;
    do
    {
      if (a4 == 1) {
        int v29 = 0;
      }
      else {
        int v29 = *v26;
      }
      long long v30 = &v18[v29];
      uint64_t v31 = *a2++;
      uint64_t v32 = *(void *)(v31 + 8);
      char v33 = *(unsigned char *)(v31 + 16);
      *(void *)long long v30 = *(void *)v31;
      *((void *)v30 + 1) = v32;
      v30[16] = v33;
      *v27++ = (uint64_t)v30;
      swift_unknownObjectRetain();
      v26 += 4;
      --v28;
    }
    while (v28);
  }
  uint64_t v34 = *(void *)(v37 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return AVMergedMetrics.init(chronologicallyMerging:_:_:)((uint64_t)v43, v41, v25, a4, v34, v39, v40, v38);
}

uint64_t type metadata accessor for AVMetrics()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t AVMergedMetrics.init(chronologicallyMerging:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v11 = a4;
  uint64_t v44 = a8;
  v45 = a3;
  unint64_t v14 = a7 & 0xFFFFFFFFFFFFFFFELL;
  if (a4 == 1)
  {
    uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
    uint64_t v16 = TupleTypeMetadata;
  }
  else
  {
    uint64_t v43 = &v42;
    MEMORY[0x270FA5388](a1);
    unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (v11)
    {
      uint64_t v19 = (uint64_t *)((char *)&v42 - v18);
      uint64_t v20 = v11;
      do
      {
        v14 += 8;
        *v19++ = type metadata accessor for AVMetrics();
        --v20;
      }
      while (v20);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v16 = TupleTypeMetadata;
  }
  uint64_t v21 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](TupleTypeMetadata);
  char v23 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = v11;
  uint64_t v47 = a5;
  uint64_t v48 = a6;
  uint64_t v49 = a7;
  uint64_t v24 = type metadata accessor for AVMergedMetrics();
  uint64_t v43 = &v42;
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v42 - v26;
  uint64_t v28 = *(void *)(a1 + 8);
  char v29 = *(unsigned char *)(a1 + 16);
  uint64_t v30 = *a2;
  uint64_t v31 = a2[1];
  char v32 = *((unsigned char *)a2 + 16);
  *(void *)uint64_t v27 = *(void *)a1;
  *((void *)v27 + 1) = v28;
  v27[16] = v29;
  *((void *)v27 + 3) = v30;
  *((void *)v27 + 4) = v31;
  v27[40] = v32;
  if (v11)
  {
    char v33 = (int *)(v16 + 32);
    uint64_t v34 = v45;
    uint64_t v35 = v11;
    do
    {
      if (v11 == 1) {
        int v36 = 0;
      }
      else {
        int v36 = *v33;
      }
      uint64_t v37 = &v23[v36];
      uint64_t v38 = *v34++;
      uint64_t v39 = *(void *)(v38 + 8);
      char v40 = *(unsigned char *)(v38 + 16);
      *(void *)uint64_t v37 = *(void *)v38;
      *((void *)v37 + 1) = v39;
      v37[16] = v40;
      swift_unknownObjectRetain();
      v33 += 4;
      --v35;
    }
    while (v35);
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v27[*(int *)(v24 + 56)], v23, v16);
  for (uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 32))(v44, v27, v24); v11; --v11)
    uint64_t result = swift_unknownObjectRelease();
  return result;
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVMetrics<A>@<X0>(char *a1@<X8>)
{
  AVMetrics.makeAsyncIterator()(a1);

  return swift_unknownObjectRelease();
}

uint64_t AVMergedMetrics.SubscriberDelegate.__allocating_init(streamContinuation:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2 + direct field offset for AVMergedMetrics.SubscriberDelegate.streamContinuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t AVMergedMetrics.SubscriberDelegate.init(streamContinuation:)(uint64_t a1)
{
  uint64_t v3 = v1 + direct field offset for AVMergedMetrics.SubscriberDelegate.streamContinuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t AVMergedMetrics.SubscriberDelegate.publisher(_:didReceive:)(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation.YieldResult);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = a2;
  v10[1] = a1;
  id v8 = a2;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t @objc AVMergedMetrics.SubscriberDelegate.publisher(_:didReceive:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_retain();
  AVMergedMetrics.SubscriberDelegate.publisher(_:didReceive:)(a3, v6);
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t AVMergedMetrics.SubscriberDelegate.deinit()
{
  uint64_t v1 = v0 + direct field offset for AVMergedMetrics.SubscriberDelegate.streamContinuation;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AVMergedMetrics.SubscriberDelegate.__deallocating_deinit()
{
  uint64_t v1 = v0 + direct field offset for AVMergedMetrics.SubscriberDelegate.streamContinuation;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t AVMergedMetrics.makeAsyncIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = 8 * v4;
  uint64_t v42 = a2;
  if (v4 == 1)
  {
    uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
    uint64_t v7 = TupleTypeMetadata;
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if (v4)
    {
      unint64_t v8 = *(void *)(a1 + 40) & 0xFFFFFFFFFFFFFFFELL;
      unint64_t v9 = (uint64_t *)((char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v10 = v4;
      do
      {
        v8 += 8;
        *v9++ = type metadata accessor for AVMetrics();
        --v10;
      }
      while (v10);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v7 = TupleTypeMetadata;
  }
  uint64_t v11 = *(void *)(v7 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](TupleTypeMetadata);
  unint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = &v38;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v38 - v16;
  char v40 = &v38;
  uint64_t v18 = *(void *)(v2 + 8);
  char v19 = *(unsigned char *)(v2 + 16);
  uint64_t v39 = *(void *)v2;
  v46[0] = v39;
  v46[1] = v18;
  char v47 = v19;
  uint64_t v20 = *(void *)(v2 + 32);
  char v21 = *(unsigned char *)(v2 + 40);
  v44[0] = *(void *)(v2 + 24);
  v44[1] = v20;
  char v45 = v21;
  MEMORY[0x270FA5388](v15);
  uint64_t v22 = (uint64_t **)((char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = v2 + *(int *)(a1 + 56);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v43 = v25;
  v24(v14, v23, v25);
  if (v4)
  {
    uint64_t v26 = (int *)(v43 + 32);
    uint64_t v27 = (char **)((char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v28 = v4;
    do
    {
      if (v4 == 1)
      {
        LODWORD(v29) = 0;
        uint64_t v30 = v17;
      }
      else
      {
        uint64_t v29 = *v26;
        uint64_t v30 = &v17[v29];
      }
      uint64_t v31 = &v14[(int)v29];
      uint64_t v32 = *(void *)v31;
      uint64_t v33 = *((void *)v31 + 1);
      LOBYTE(v31) = v31[16];
      *(void *)uint64_t v30 = v32;
      *((void *)v30 + 1) = v33;
      v30[16] = (char)v31;
      *v27++ = v30;
      swift_unknownObjectRetain();
      v26 += 4;
      --v28;
    }
    while (v28);
  }
  uint64_t v34 = *(void *)(a1 + 24);
  uint64_t v35 = *(void *)(a1 + 32);
  uint64_t v36 = *(void *)(a1 + 40);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  AVMergedMetrics.AsyncIterator.init(chronologicallyMerging:_:_:)(v46, v44, v22, v4, v34, v35, v36, v42);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v43);
}

uint64_t AVMergedMetrics.AsyncIterator.init(chronologicallyMerging:_:_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t **a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v54 = a7;
  uint64_t v56 = a6;
  uint64_t v55 = a5;
  uint64_t v49 = a3;
  uint64_t v73 = a8;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation.BufferingPolicy);
  uint64_t v68 = *(void *)(v14 - 8);
  uint64_t v69 = v14;
  MEMORY[0x270FA5388](v14);
  v66 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  uint64_t v71 = *(void *)(v16 - 8);
  uint64_t v72 = v16;
  MEMORY[0x270FA5388](v16);
  v64 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  uint64_t v65 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  v58 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = (void *)type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v52 = *(v53 - 1);
  MEMORY[0x270FA5388](v53);
  v51 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388](v20);
  uint64_t v21 = type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v74 = a4;
  uint64_t v75 = a5;
  uint64_t v76 = a6;
  uint64_t v77 = a7;
  uint64_t v22 = type metadata accessor for AVMergedMetrics.AsyncIterator();
  uint64_t v70 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (uint64_t ***)((char *)&v49 - v23);
  uint64_t v57 = *a1;
  uint64_t v25 = a1[1];
  int v59 = *((unsigned __int8 *)a1 + 16);
  uint64_t v26 = *a2;
  uint64_t v60 = v25;
  uint64_t v61 = v26;
  uint64_t v63 = a2[1];
  int v62 = *((unsigned __int8 *)a2 + 16);
  id v27 = [self eventStream];
  *uint64_t v24 = v27;
  type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  id v28 = v27;
  static DispatchQoS.unspecified.getter();
  uint64_t v74 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, void *))(v52 + 104))(v51, *MEMORY[0x263F8F130], v53);
  uint64_t v29 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v24[2] = v29;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AVMetricEvent, AVMetricEventStreamPublisher));
  uint64_t v31 = v68;
  uint64_t v30 = v69;
  uint64_t v32 = v66;
  (*(void (**)(char *, void, uint64_t))(v68 + 104))(v66, *MEMORY[0x263F8F580], v69);
  v53 = v29;
  uint64_t v33 = v58;
  uint64_t v34 = (uint64_t)v64;
  static AsyncStream.makeStream(of:bufferingPolicy:)();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v30);
  uint64_t v35 = *(int *)(v22 + 60);
  v50 = v24;
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))((char *)v24 + v35, v33, v67);
  uint64_t v36 = (char *)v24 + *(int *)(v22 + 64);
  uint64_t v38 = v71;
  uint64_t v37 = v72;
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 32))(v36, v34, v72);
  uint64_t v74 = a4;
  uint64_t v75 = v55;
  uint64_t v76 = v56;
  uint64_t v77 = v54;
  type metadata accessor for AVMergedMetrics.SubscriberDelegate();
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 16))(v34, v36, v37);
  uint64_t v39 = v50;
  uint64_t v40 = AVMergedMetrics.SubscriberDelegate.__allocating_init(streamContinuation:)(v34);
  v39[1] = v40;
  swift_retain();
  AsyncStream.makeAsyncIterator()();
  uint64_t v41 = v53;
  [v28 setSubscriber:v40 queue:v53];
  swift_release();

  uint64_t v74 = v57;
  uint64_t v75 = v60;
  LOBYTE(v76) = v59;
  AVMetrics.enableSubscription(forMetricEventStream:)(v28);
  swift_unknownObjectRelease();
  uint64_t v74 = v61;
  uint64_t v75 = v63;
  LOBYTE(v76) = v62;
  AVMetrics.enableSubscription(forMetricEventStream:)(v28);
  swift_unknownObjectRelease();
  if (a4)
  {
    uint64_t v42 = v70;
    uint64_t v43 = v49;
    uint64_t v44 = a4;
    do
    {
      char v45 = *v43++;
      uint64_t v46 = v45[1];
      char v47 = *((unsigned char *)v45 + 16);
      uint64_t v74 = *v45;
      uint64_t v75 = v46;
      LOBYTE(v76) = v47;
      swift_unknownObjectRetain();
      AVMetrics.enableSubscription(forMetricEventStream:)(v28);
      swift_unknownObjectRelease();
      --v44;
    }
    while (v44);

    (*(void (**)(uint64_t, void *, uint64_t))(v42 + 32))(v73, v39, v22);
    do
    {
      uint64_t result = swift_unknownObjectRelease();
      --a4;
    }
    while (a4);
  }
  else
  {

    return (*(uint64_t (**)(uint64_t, void *, uint64_t))(v70 + 32))(v73, v39, v22);
  }
  return result;
}

uint64_t AVMergedMetrics.AsyncIterator.next()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  void *v1 = v0;
  v1[1] = AVMergedMetrics.AsyncIterator.next();
  return MEMORY[0x270FA1F70](v0 + 16, v2);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return MEMORY[0x270FA2498](AVMergedMetrics.AsyncIterator.next(), 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVMergedMetrics<A, B, Pack{repeat C}>.AsyncIterator(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVMergedMetrics<A, B, Pack{repeat C}>.AsyncIterator;
  return AVMergedMetrics.AsyncIterator.next()();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVMergedMetrics<A, B, Pack{repeat C}>.AsyncIterator(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (!v2)
  {
    unint64_t v8 = *(void **)(v6 + 16);
    *unint64_t v8 = a1;
    v8[1] = a2;
  }
  unint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t _s12AVFoundation15AVMergedMetricsV13AsyncIteratorVyxq_q0_q0_Qp_QP_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a4;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v12;
  *uint64_t v12 = v6;
  v12[1] = _s12AVFoundation15AVMergedMetricsV13AsyncIteratorVyxq_q0_q0_Qp_QP_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return MEMORY[0x270FA1E90](a1, a2, a3, a5, a6, v6 + 16);
}

uint64_t _s12AVFoundation15AVMergedMetricsV13AsyncIteratorVyxq_q0_q0_Qp_QP_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0) {
    **(void **)(v2 + 24) = *(void *)(v2 + 16);
  }
  uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
  return v4();
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVMergedMetrics<A, B, Pack{repeat C}>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  AVMergedMetrics.makeAsyncIterator()(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);

  return v4(v2, a1);
}

char *AVMetricPlayerItemLikelyToKeepUpEvent.loadedTimeRanges.getter()
{
  id v1 = [v0 sel_loadedTimeRanges];
  type metadata accessor for AVMediaSelection(0, (unint64_t *)&lazy cache variable for type metadata for NSValue);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v3 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSaySo7NSValueCG_So11CMTimeRangeas5NeverOTg5084_sSo37AVMetricPlayerItemLikelyToKeepUpEventC12AVFoundationE16loadedTimeRangesSaySo11e14RangeaGvgAFSo7D52Ccfu_32e1aaa32c9642607d0b6314623c7365cfAiFTf3nnnpk_nTf1cn_nTm(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t associated type witness table accessor for AsyncIteratorProtocol.Failure : Error in AVMetrics<A>.AsyncIterator()
{
  return MEMORY[0x263F8E4E0];
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in AVMetrics<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in AVMergedMetrics<A, B, Pack{repeat C}>()
{
  return swift_getWitnessTable();
}

uint64_t destroy for AVMetrics()
{
  return swift_unknownObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for AVMetrics(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AVMetrics(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AVMetrics(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVMetrics(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AVMetrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata completion function for AVMetrics.SubscriberDelegate()
{
  uint64_t result = type metadata accessor for AsyncStream.Continuation();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for AVMetrics.SubscriberDelegate()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata instantiation function for AVMetrics.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t type metadata completion function for AVMetrics.AsyncIterator()
{
  uint64_t result = type metadata accessor for AsyncStream();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for AsyncStream.Continuation();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for AsyncStream.Iterator();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for AVMetrics.AsyncIterator(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    unint64_t v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v8;
    uint64_t v9 = a3[9];
    uint64_t v23 = (uint64_t)a2 + v9;
    uint64_t v24 = &a1[v9];
    uint64_t v10 = type metadata accessor for AsyncStream();
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    uint64_t v12 = v4;
    swift_unknownObjectRetain();
    uint64_t v13 = v8;
    v11(v24, v23, v10);
    uint64_t v14 = a3[10];
    uint64_t v15 = &v7[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = type metadata accessor for AsyncStream.Continuation();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = a3[11];
    uint64_t v19 = &v7[v18];
    uint64_t v20 = (uint64_t)a2 + v18;
    uint64_t v21 = type metadata accessor for AsyncStream.Iterator();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  }
  return v7;
}

uint64_t destroy for AVMetrics.AsyncIterator(id *a1, int *a2)
{
  swift_unknownObjectRelease();
  uint64_t v4 = (char *)a1 + a2[9];
  uint64_t v5 = type metadata accessor for AsyncStream();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (char *)a1 + a2[10];
  uint64_t v7 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  unint64_t v8 = (char *)a1 + a2[11];
  uint64_t v9 = type metadata accessor for AsyncStream.Iterator();
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

void *initializeWithCopy for AVMetrics.AsyncIterator(void *a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  unint64_t v8 = *(void **)(a2 + 16);
  a1[2] = v8;
  uint64_t v9 = a3[9];
  uint64_t v23 = a2 + v9;
  uint64_t v24 = (char *)a1 + v9;
  uint64_t v10 = type metadata accessor for AsyncStream();
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v7;
  swift_unknownObjectRetain();
  id v13 = v8;
  v11(v24, v23, v10);
  uint64_t v14 = a3[10];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  uint64_t v18 = a3[11];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = type metadata accessor for AsyncStream.Iterator();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  return a1;
}

uint64_t assignWithCopy for AVMetrics.AsyncIterator(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v9 = *(void **)(a2 + 16);
  uint64_t v10 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v9;
  id v11 = v9;

  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for AsyncStream();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = a3[11];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = type metadata accessor for AsyncStream.Iterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

uint64_t initializeWithTake for AVMetrics.AsyncIterator(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[9];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for AsyncStream();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[10];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[11];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = type metadata accessor for AsyncStream.Iterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t assignWithTake for AVMetrics.AsyncIterator(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  swift_unknownObjectRelease();
  uint64_t v7 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  uint64_t v8 = a3[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for AsyncStream();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[10];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[11];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = type metadata accessor for AsyncStream.Iterator();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVMetrics.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21289BCC0);
}

uint64_t sub_21289BCC0(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = type metadata accessor for AsyncStream();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[9];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v13(&a1[v11], a2, v9);
  }
  uint64_t v12 = type metadata accessor for AsyncStream.Continuation();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[10];
    goto LABEL_9;
  }
  uint64_t v14 = type metadata accessor for AsyncStream.Iterator();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = &a1[a3[11]];

  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for AVMetrics.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21289BE5C);
}

char *sub_21289BE5C(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = type metadata accessor for AsyncStream();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[9];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = type metadata accessor for AsyncStream.Continuation();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[10];
    goto LABEL_7;
  }
  uint64_t v14 = type metadata accessor for AsyncStream.Iterator();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = &v5[a4[11]];

  return (char *)v15(v17, a2, a2, v16);
}

uint64_t type metadata accessor for AVMetrics.AsyncIterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata instantiation function for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t type metadata completion function for AVMergedMetrics(uint64_t a1)
{
  v12[1] = &unk_2128B2BF0;
  v12[2] = &unk_2128B2BF0;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == 1)
  {
    uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
    if (v4 > 0x3F) {
      return TupleTypeMetadata;
    }
    uint64_t TupleTypeMetadata = swift_checkMetadataState();
    if (v5 > 0x3F) {
      return TupleTypeMetadata;
    }
LABEL_9:
    v12[3] = *(void *)(TupleTypeMetadata - 8) + 64;
    swift_initStructMetadata();
    return 0;
  }
  MEMORY[0x270FA5388](a1);
  if (v2)
  {
    unint64_t v7 = *(void *)(a1 + 40) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v8 = (void *)((char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v9 = v2;
    do
    {
      v7 += 8;
      *v8++ = type metadata accessor for AVMetrics();
      --v9;
    }
    while (v9);
  }
  uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  if (v10 <= 0x3F) {
    goto LABEL_9;
  }
  return TupleTypeMetadata;
}

uint64_t initializeBufferWithCopyOfBuffer for AVMergedMetrics(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v7 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v7;
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v8 = *(int *)(a3 + 56);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = *(void *)(a3 + 16);
    swift_unknownObjectRetain();
    uint64_t v12 = swift_unknownObjectRetain();
    if (v11 == 1)
    {
      uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
    }
    else
    {
      MEMORY[0x270FA5388](v12);
      if (v11)
      {
        unint64_t v15 = *(void *)(a3 + 40) & 0xFFFFFFFFFFFFFFFELL;
        uint64_t v16 = (uint64_t *)((char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
        uint64_t v17 = v11;
        do
        {
          v15 += 8;
          *v16++ = type metadata accessor for AVMetrics();
          --v17;
        }
        while (v17);
      }
      uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 16))(v9, v10);
  }
  return a1;
}

uint64_t destroy for AVMergedMetrics(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  uint64_t v4 = swift_unknownObjectRelease();
  uint64_t v5 = *(int *)(a2 + 56);
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6 == 1)
  {
    uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
  }
  else
  {
    MEMORY[0x270FA5388](v4);
    if (v6)
    {
      unint64_t v9 = *(void *)(a2 + 40) & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v10 = (uint64_t *)((char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v11 = v6;
      do
      {
        v9 += 8;
        *v10++ = type metadata accessor for AVMetrics();
        --v11;
      }
      while (v11);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)(TupleTypeMetadata - 8) + 8))(a1 + v5);
}

uint64_t initializeWithCopy for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(int *)(a3 + 56);
  uint64_t v9 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  uint64_t v10 = swift_unknownObjectRetain();
  if (v9 == 1)
  {
    uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
  }
  else
  {
    MEMORY[0x270FA5388](v10);
    if (v9)
    {
      unint64_t v13 = *(void *)(a3 + 40) & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v14 = (uint64_t *)((char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v15 = v9;
      do
      {
        v13 += 8;
        *v14++ = type metadata accessor for AVMetrics();
        --v15;
      }
      while (v15);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 16))(a1 + v8, a2 + v8);
  return a1;
}

uint64_t assignWithCopy for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_unknownObjectRetain();
  uint64_t v6 = swift_unknownObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v7 = *(int *)(a3 + 56);
  uint64_t v8 = *(void *)(a3 + 16);
  if (v8 == 1)
  {
    uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
  }
  else
  {
    MEMORY[0x270FA5388](v6);
    if (v8)
    {
      unint64_t v11 = *(void *)(a3 + 40) & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v12 = (uint64_t *)((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v13 = v8;
      do
      {
        v11 += 8;
        *v12++ = type metadata accessor for AVMetrics();
        --v13;
      }
      while (v13);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 24))(a1 + v7, a2 + v7);
  return a1;
}

uint64_t initializeWithTake for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(int *)(a3 + 56);
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6 == 1)
  {
    uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if (v6)
    {
      unint64_t v10 = *(void *)(v8 + 40) & 0xFFFFFFFFFFFFFFFELL;
      unint64_t v11 = (uint64_t *)((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v12 = v6;
      do
      {
        v10 += 8;
        *v11++ = type metadata accessor for AVMetrics();
        --v12;
      }
      while (v12);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 32))(a1 + v5, a2 + v5);
  return a1;
}

uint64_t assignWithTake for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = swift_unknownObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v7 = *(int *)(a3 + 56);
  uint64_t v8 = *(void *)(a3 + 16);
  if (v8 == 1)
  {
    uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
  }
  else
  {
    MEMORY[0x270FA5388](v6);
    if (v8)
    {
      unint64_t v11 = *(void *)(a3 + 40) & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v12 = (uint64_t *)((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v13 = v8;
      do
      {
        v11 += 8;
        *v12++ = type metadata accessor for AVMetrics();
        --v13;
      }
      while (v13);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 40))(a1 + v7, a2 + v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21289C9D8);
}

uint64_t sub_21289C9D8(char *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = *(void *)(a3 + 16);
    if (v8 == 1)
    {
      uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
    }
    else
    {
      MEMORY[0x270FA5388](a1);
      if (v8)
      {
        unint64_t v11 = *(void *)(a3 + 40) & 0xFFFFFFFFFFFFFFFELL;
        uint64_t v12 = (uint64_t *)((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
        uint64_t v13 = v8;
        do
        {
          v11 += 8;
          *v12++ = type metadata accessor for AVMetrics();
          --v13;
        }
        while (v13);
      }
      uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    }
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 48))(&a1[*(int *)(a3 + 56)], a2);
  }
}

uint64_t storeEnumTagSinglePayload for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21289CB34);
}

char *sub_21289CB34(char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = *(void *)(a4 + 16);
    if (v7 == 1)
    {
      uint64_t TupleTypeMetadata = type metadata accessor for AVMetrics();
    }
    else
    {
      MEMORY[0x270FA5388](result);
      if (v7)
      {
        unint64_t v10 = *(void *)(a4 + 40) & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v11 = (uint64_t *)((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
        uint64_t v12 = v7;
        do
        {
          v10 += 8;
          *v11++ = type metadata accessor for AVMetrics();
          --v12;
        }
        while (v12);
      }
      uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 56))(&v5[*(int *)(a4 + 56)], a2, a2);
  }
  return result;
}

uint64_t type metadata accessor for AVMergedMetrics()
{
  return swift_getGenericMetadata();
}

void type metadata completion function for AVMergedMetrics.SubscriberDelegate()
{
  type metadata accessor for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation(319, &lazy cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation, MEMORY[0x263F8F590]);
  if (v0 <= 0x3F) {
    swift_initClassMetadata2();
  }
}

uint64_t type metadata accessor for AVMergedMetrics.SubscriberDelegate()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata instantiation function for AVMergedMetrics.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 56);
}

void type metadata completion function for AVMergedMetrics.AsyncIterator()
{
  type metadata accessor for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation(319, &lazy cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation(319, &lazy cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation, MEMORY[0x263F8F590]);
    if (v1 <= 0x3F)
    {
      type metadata accessor for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation(319, &lazy cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator, MEMORY[0x263F8F5A8]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

char *initializeBufferWithCopyOfBuffer for AVMergedMetrics.AsyncIterator(char *a1, char **a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v8;
    uint64_t v9 = a3[15];
    unint64_t v10 = &a1[v9];
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = v5;
    swift_unknownObjectRetain();
    uint64_t v13 = v8;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v11, v14);
    uint64_t v15 = a3[16];
    uint64_t v16 = &a1[v15];
    uint64_t v17 = (uint64_t)a2 + v15;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    uint64_t v19 = a3[17];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = (uint64_t)a2 + v19;
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  }
  return a1;
}

uint64_t destroy for AVMergedMetrics.AsyncIterator(id *a1, int *a2)
{
  swift_unknownObjectRelease();
  int v4 = (char *)a1 + a2[15];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (char *)a1 + a2[16];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = (char *)a1 + a2[17];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  unint64_t v10 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

void *initializeWithCopy for AVMergedMetrics.AsyncIterator(void *a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v8 = *(void **)(a2 + 16);
  a1[2] = v8;
  uint64_t v9 = a3[15];
  unint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = a2 + v9;
  id v12 = v6;
  swift_unknownObjectRetain();
  id v13 = v8;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v11, v14);
  uint64_t v15 = a3[16];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  uint64_t v19 = a3[17];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  return a1;
}

uint64_t assignWithCopy for AVMergedMetrics.AsyncIterator(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v9 = *(void **)(a2 + 16);
  unint64_t v10 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v9;
  id v11 = v9;

  uint64_t v12 = a3[15];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[16];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = a3[17];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

uint64_t initializeWithTake for AVMergedMetrics.AsyncIterator(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[15];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[16];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[17];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t assignWithTake for AVMergedMetrics.AsyncIterator(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  swift_unknownObjectRelease();
  uint64_t v7 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  uint64_t v8 = a3[15];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[16];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[17];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVMergedMetrics.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21289D6B4);
}

uint64_t sub_21289D6B4(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[15];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v13(&a1[v11], a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[16];
    goto LABEL_9;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = &a1[a3[17]];

  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for AVMergedMetrics.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21289D84C);
}

char *sub_21289D84C(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[15];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[16];
    goto LABEL_7;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = &v5[a4[17]];

  return (char *)v15(v17, a2, a2, v16);
}

uint64_t type metadata accessor for AVMergedMetrics.AsyncIterator()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for (AVMetricEvent, AVMetricEventStreamPublisher));
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t specialized AVMetrics.SubscriberDelegate.publisher(_:didReceive:)(void *a1)
{
  uint64_t v2 = type metadata accessor for AsyncStream.Continuation.YieldResult();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v8 - v4;
  v8[1] = swift_dynamicCastUnknownClassUnconditional();
  type metadata accessor for AsyncStream.Continuation();
  id v6 = a1;
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
  }
  return result;
}

Swift::Bool __swiftcall AVAssetWriterInputTaggedPixelBufferGroupAdaptor.appendTaggedBuffers(_:withPresentationTime:)(Swift::OpaquePointer _, CMTime withPresentationTime)
{
  CMTimeEpoch epoch = withPresentationTime.epoch;
  CMTimeScale timescale = withPresentationTime.timescale;
  CMTimeValue value = withPresentationTime.value;
  CMTimeFlags flags = withPresentationTime.flags;
  unint64_t v7 = (void *)Array<A>.taggedBufferGroup.getter();
  CMTimeValue v9 = value;
  CMTimeScale v10 = timescale;
  CMTimeFlags v11 = flags;
  CMTimeEpoch v12 = epoch;
  LOBYTE(epoch) = [v2 sel_appendTaggedPixelBufferGroup_withPresentationTime_:v7:&v9];

  return epoch;
}

uint64_t AVAnnotationSerializedData.jsonData.getter()
{
  uint64_t v1 = *(void *)v0;
  outlined copy of Data._Representation(*(void *)v0, *(void *)(v0 + 8));
  return v1;
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

uint64_t AVAnnotationSerializedData.binaryData.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AVAnnotationSerializedData.init(jsonData:binaryData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

id AVAnnotation.init(serializedData:)(uint64_t *a1)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  specialized _arrayForceCast<A, B>(_:)(v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  Class v6 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v1, v2);
  swift_bridgeObjectRelease();
  v11[0] = 0;
  id v7 = [v4 initWithJSONData:v6 representationBinaryDataBindings:v11];

  if (v7)
  {
    id v8 = v11[0];
  }
  else
  {
    id v9 = v11[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v7;
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : AnyHashable]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      *(void *)(v2 + 8 * v6 + 32) = v8;
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  long long v8;
  uint64_t v9;

  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    type metadata accessor for CMTime(0);
    uint64_t v4 = a1 + 48;
    do
    {
      swift_dynamicCast();
      uint64_t v2 = v9;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 24;
      *(void *)(v2 + 16) = v6 + 1;
      outlined init with take of Sendable(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
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

void AVAnnotation.serialize()(uint64_t *a1@<X8>)
{
  v14[1] = *(id *)MEMORY[0x263EF8340];
  id v3 = [objc_allocWithZone(MEMORY[0x263EFF8F8]) sel_init];
  id v4 = [objc_allocWithZone(MEMORY[0x263EFF8C0]) init];
  id v13 = v4;
  v14[0] = v3;
  [v1 sel_getJSONData_representationBinaryDataBindings_:v14, &v13];
  id v5 = v13;

  id v6 = v14[0];
  id v7 = v6;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  v14[0] = 0;
  id v11 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : AnyHashable]);
  static Array._forceBridgeFromObjectiveC(_:result:)();
  id v12 = v14[0];
  if (!v14[0]) {
    __break(1u);
  }

  *a1 = v8;
  a1[1] = v10;
  a1[2] = (uint64_t)v12;
}

uint64_t AVAnnotationPathRepresentation.init(paths:)(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    uint64_t v14 = *(void *)(a1 + 16);
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0);
    uint64_t v3 = v14;
    uint64_t v4 = 0;
    uint64_t v15 = a1 + 32;
    while (1)
    {
      uint64_t v5 = *(void *)(v15 + 8 * v4);
      int64_t v6 = *(void *)(v5 + 16);
      if (v6) {
        break;
      }
      uint64_t v8 = MEMORY[0x263F8EE78];
      unint64_t v10 = *(void *)(v16 + 16);
      unint64_t v9 = *(void *)(v16 + 24);
      if (v10 >= v9 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v9 > 1), v10 + 1, 1);
        uint64_t v3 = v14;
      }
      ++v4;
      *(void *)(v16 + 16) = v10 + 1;
      *(void *)(v16 + 8 * v10 + 32) = v8;
      if (v4 == v3) {
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6, 0);
    CGPointCreateDictionaryRepresentation(*(CGPoint *)(v5 + 32));
    type metadata accessor for NSNumber();
    uint64_t result = static Dictionary._forceBridgeFromObjectiveC(_:result:)();
    __break(1u);
  }
  else
  {
LABEL_8:
    swift_bridgeObjectRelease();
    id v11 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[String : NSNumber]]);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v13 = [v11 sel_initWithPaths_:isa];

    return (uint64_t)v13;
  }
  return result;
}

uint64_t AVAnnotationPathRepresentation.paths.getter()
{
  id v1 = [v0 sel_paths];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[String : NSNumber]]);
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v24 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = v24;
    int64_t v20 = v3;
    uint64_t v21 = v2 + 32;
    while (1)
    {
      int64_t v6 = *(void *)(*(void *)(v21 + 8 * v4) + 16);
      if (v6) {
        break;
      }
      uint64_t v7 = MEMORY[0x263F8EE78];
LABEL_11:
      unint64_t v18 = *(void *)(v24 + 16);
      unint64_t v17 = *(void *)(v24 + 24);
      if (v18 >= v17 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v17 > 1), v18 + 1, 1);
      }
      ++v4;
      *(void *)(v24 + 16) = v18 + 1;
      *(void *)(v24 + 8 * v18 + 32) = v7;
      if (v4 == v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    uint64_t v22 = v4;
    uint64_t v23 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6, 0);
    uint64_t v7 = v23;
    type metadata accessor for NSNumber();
    uint64_t v8 = 0;
    while (1)
    {
      swift_bridgeObjectRetain();
      v9.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      CGPoint_optional v25 = CGPoint.init(dictionaryRepresentation:)(v9.super.isa);
      if (v11) {
        break;
      }
      uint64_t v12 = *(void *)&v25.is_nil;
      uint64_t v13 = v10;
      swift_bridgeObjectRelease();
      unint64_t v15 = *(void *)(v23 + 16);
      unint64_t v14 = *(void *)(v23 + 24);
      if (v15 >= v14 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v14 > 1), v15 + 1, 1);
      }
      ++v8;
      *(void *)(v23 + 16) = v15 + 1;
      uint64_t v16 = v23 + 16 * v15;
      *(void *)(v16 + 32) = v12;
      *(void *)(v16 + 40) = v13;
      if (v6 == v8)
      {
        swift_bridgeObjectRelease();
        int64_t v3 = v20;
        uint64_t v4 = v22;
        goto LABEL_11;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = MEMORY[0x263F8EE78];
LABEL_16:
    *(void *)&v25.is_nil = v5;
  }
  LOBYTE(result) = v25.is_nil;
  return result;
}

void AVAnnotationPathRepresentation.paths.setter(uint64_t a1)
{
  int64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = v14;
    uint64_t v12 = a1 + 32;
    do
    {
      uint64_t v6 = *(void *)(v12 + 8 * v4);
      int64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7, 0);
        CGPointCreateDictionaryRepresentation(*(CGPoint *)(v6 + 32));
        type metadata accessor for NSNumber();
        static Dictionary._forceBridgeFromObjectiveC(_:result:)();
        __break(1u);
        return;
      }
      uint64_t v8 = MEMORY[0x263F8EE78];
      uint64_t v15 = v5;
      unint64_t v10 = *(void *)(v5 + 16);
      unint64_t v9 = *(void *)(v5 + 24);
      if (v10 >= v9 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v9 > 1), v10 + 1, 1);
        uint64_t v5 = v15;
      }
      ++v4;
      *(void *)(v5 + 16) = v10 + 1;
      *(void *)(v5 + 8 * v10 + 32) = v8;
    }
    while (v4 != v3);
    swift_bridgeObjectRelease();
    id v1 = v11;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[String : NSNumber]]);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v1 setPaths:isa];
}

void (*AVAnnotationPathRepresentation.paths.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = AVAnnotationPathRepresentation.paths.getter();
  return AVAnnotationPathRepresentation.paths.modify;
}

void AVAnnotationPathRepresentation.paths.modify(uint64_t *a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    AVAnnotationPathRepresentation.paths.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    AVAnnotationPathRepresentation.paths.setter(*a1);
  }
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

uint64_t sub_21289EA60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AVAnnotationPathRepresentation.paths.getter();
  *a1 = result;
  return result;
}

void sub_21289EA8C()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  AVAnnotationPathRepresentation.paths.setter(v0);
}

uint64_t destroy for AVAnnotationSerializedData(uint64_t a1)
{
  outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));

  return swift_bridgeObjectRelease();
}

uint64_t *initializeBufferWithCopyOfBuffer for AVAnnotationSerializedData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  outlined copy of Data._Representation(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for AVAnnotationSerializedData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  outlined copy of Data._Representation(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  outlined consume of Data._Representation(v6, v7);
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

uint64_t *assignWithTake for AVAnnotationSerializedData(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  outlined consume of Data._Representation(v4, v5);
  a1[2] = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAnnotationSerializedData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AVAnnotationSerializedData(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AVAnnotationSerializedData()
{
  return &type metadata for AVAnnotationSerializedData;
}

char *AVCaptureSlider.prominentValues.getter()
{
  id v1 = [v0 prominentValues];
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v13 = MEMORY[0x263F8EE78];
  __n128 result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v13;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x2166848A0](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      [v7 floatValue];
      int v10 = v9;

      unint64_t v12 = *(void *)(v13 + 16);
      unint64_t v11 = *(void *)(v13 + 24);
      if (v12 >= v11 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v5;
      *(void *)(v13 + 16) = v12 + 1;
      *(_DWORD *)(v13 + 4 * v12 + 32) = v10;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

void AVCaptureSlider.prominentValues.setter(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = v4 + 1;
      int v6 = *(_DWORD *)(a1 + 4 * v4 + 32);
      id v7 = objc_allocWithZone(NSNumber);
      LODWORD(v8) = v6;
      [v7 initWithFloat:v8];
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      uint64_t v4 = v5;
    }
    while (v3 != v5);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v1 setProminentValues:isa];
}

void (*AVCaptureSlider.prominentValues.modify(char **a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = AVCaptureSlider.prominentValues.getter();
  return AVCaptureSlider.prominentValues.modify;
}

void AVCaptureSlider.prominentValues.modify(uint64_t *a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    AVCaptureSlider.prominentValues.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    AVCaptureSlider.prominentValues.setter(*a1);
  }
}

id AVCaptureSlider.init(_:symbolName:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5, float a6)
{
  id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v13 = (void *)MEMORY[0x216684570](a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)MEMORY[0x216684570](a3, a4);
  swift_bridgeObjectRelease();
  *(float *)&double v15 = a5;
  *(float *)&double v16 = a6;
  id v17 = [v12 initWithLocalizedTitle:v13 symbolName:v14 minValue:v15 maxValue:v16];

  return v17;
}

id AVCaptureSlider.init(_:symbolName:in:step:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5, float a6, float a7)
{
  id v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  double v15 = (void *)MEMORY[0x216684570](a1, a2);
  swift_bridgeObjectRelease();
  double v16 = (void *)MEMORY[0x216684570](a3, a4);
  swift_bridgeObjectRelease();
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  *(float *)&double v19 = a7;
  id v20 = [v14 initWithLocalizedTitle:v15 symbolName:v16 minValue:v17 maxValue:v18 step:v19];

  return v20;
}

id AVCaptureSlider.init(_:symbolName:values:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = a3;
  uint64_t v9 = a1;
  uint64_t v10 = *(void *)(a5 + 16);
  if (v10)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = v11 + 1;
      int v13 = *(_DWORD *)(a5 + 4 * v11 + 32);
      id v14 = objc_allocWithZone(NSNumber);
      LODWORD(v15) = v13;
      [v14 initWithFloat:v15];
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      uint64_t v11 = v12;
    }
    while (v10 != v12);
    swift_bridgeObjectRelease();
    uint64_t v9 = a1;
    uint64_t v7 = a3;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  double v17 = (void *)MEMORY[0x216684570](v9, a2);
  swift_bridgeObjectRelease();
  double v18 = (void *)MEMORY[0x216684570](v7, a4);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v20 = [v16 initWithLocalizedTitle:v17 symbolName:v18 values:isa];

  return v20;
}

void AVCaptureSlider.setActionQueue(_:action:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[4] = a2;
  v6[5] = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = thunk for @escaping @callee_guaranteed (@unowned Float) -> ();
  void v6[3] = &block_descriptor_4;
  uint64_t v5 = _Block_copy(v6);
  swift_retain();
  swift_release();
  [v3 setActionQueue:a1 action:v5];
  _Block_release(v5);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Float) -> ()(uint64_t a1, float a2)
{
  uint64_t v3 = *(void (**)(uint64_t, float))(a1 + 32);
  uint64_t v4 = swift_retain();
  v3(v4, a2);

  return swift_release();
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

char *sub_21289F498@<X0>(char **a1@<X8>)
{
  __n128 result = AVCaptureSlider.prominentValues.getter();
  *a1 = result;
  return result;
}

void sub_21289F4C4()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  AVCaptureSlider.prominentValues.setter(v0);
}

Class @objc AVVideoComposition.sourceSampleDataTrackIDs.getter(void *a1, uint64_t a2)
{
  return @objc AVVideoComposition.sourceSampleDataTrackIDs.getter(a1, a2, (void (*)(void))AVVideoComposition.sourceSampleDataTrackIDs.getter);
}

Class @objc AVMutableVideoComposition.sourceSampleDataTrackIDs.getter(void *a1, uint64_t a2)
{
  return @objc AVVideoComposition.sourceSampleDataTrackIDs.getter(a1, a2, (void (*)(void))AVMutableVideoComposition.sourceSampleDataTrackIDs.getter);
}

Class @objc AVVideoComposition.sourceSampleDataTrackIDs.getter(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  v5.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

char *AVAsynchronousVideoCompositionRequest.sourceSampleDataTrackIDs.getter()
{
  id v1 = [v0 sel_sourceSampleDataTrackIDs];
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v12 = MEMORY[0x263F8EE78];
  __n128 result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x2166848A0](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      double v8 = v7;
      unsigned int v9 = [v7 intValue];

      unint64_t v11 = *(void *)(v12 + 16);
      unint64_t v10 = *(void *)(v12 + 24);
      if (v11 >= v10 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      *(void *)(v12 + 16) = v11 + 1;
      *(_DWORD *)(v12 + 4 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

void @objc AVMutableVideoComposition.sourceSampleDataTrackIDs.setter(void *a1)
{
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v3 = a1;
  AVMutableVideoComposition.sourceSampleDataTrackIDs.setter(v2);
}

void AVMutableVideoComposition.sourceSampleDataTrackIDs.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = v3 + 1;
      Int32._bridgeToObjectiveC()();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      uint64_t v3 = v4;
    }
    while (v2 != v4);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v1 setSourceSampleDataTrackIDs:isa];
}

id one-time initialization function for backgroundPIPAuthorizationTokenDidChangeNotification()
{
  static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification = *MEMORY[0x263F21100];
  return (id)static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification;
}

id static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification.getter()
{
  return static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification.getter(&one-time initialization token for backgroundPIPAuthorizationTokenDidChangeNotification, (void **)&static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification);
}

id one-time initialization function for audiovisualBackgroundPlaybackPolicyDidChangeNotification()
{
  static AVPlayer.audiovisualBackgroundPlaybackPolicyDidChangeNotification = *MEMORY[0x263F210F8];
  return (id)static AVPlayer.audiovisualBackgroundPlaybackPolicyDidChangeNotification;
}

id static AVPlayer.audiovisualBackgroundPlaybackPolicyDidChangeNotification.getter()
{
  return static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification.getter(&one-time initialization token for audiovisualBackgroundPlaybackPolicyDidChangeNotification, (void **)&static AVPlayer.audiovisualBackgroundPlaybackPolicyDidChangeNotification);
}

id one-time initialization function for interstitialPlayerDidChangeNotification()
{
  static AVPlayer.interstitialPlayerDidChangeNotification = *MEMORY[0x263F21108];
  return (id)static AVPlayer.interstitialPlayerDidChangeNotification;
}

id static AVPlayer.interstitialPlayerDidChangeNotification.getter()
{
  return static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification.getter(&one-time initialization token for interstitialPlayerDidChangeNotification, (void **)&static AVPlayer.interstitialPlayerDidChangeNotification);
}

id static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification.getter(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;

  return v3;
}

uint64_t AVAssetVariant.peakBitRate.getter()
{
  return AVAssetVariant.peakBitRate.getter((SEL *)&selRef_peakBitRate);
}

uint64_t AVAssetVariant.averageBitRate.getter()
{
  return AVAssetVariant.peakBitRate.getter((SEL *)&selRef_averageBitRate);
}

uint64_t AVAssetVariantVideoAttributes.nominalFrameRate.getter()
{
  return AVAssetVariant.peakBitRate.getter((SEL *)&selRef_nominalFrameRate);
}

uint64_t AVAssetVariant.peakBitRate.getter(SEL *a1)
{
  [v1 *a1];
  if (v3 < 0.0) {
    return 0;
  }
  [v1 *a1];
  return v5;
}

char *AVAssetVariantVideoAttributes.codecTypes.getter()
{
  return AVAssetVariantVideoAttributes.codecTypes.getter((SEL *)&selRef_codecTypes);
}

char *AVAssetVariantAudioAttributes.formatIDs.getter()
{
  return AVAssetVariantVideoAttributes.codecTypes.getter((SEL *)&selRef_formatIDs);
}

char *AVAssetVariantVideoAttributes.codecTypes.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  type metadata accessor for NSNumber();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v13 = MEMORY[0x263F8EE78];
  __n128 result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v13;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x2166848A0](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      unsigned int v9 = v8;
      unsigned int v10 = [v8 unsignedIntValue];

      unint64_t v12 = *(void *)(v13 + 16);
      unint64_t v11 = *(void *)(v13 + 24);
      if (v12 >= v11 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v6;
      *(void *)(v13 + 16) = v12 + 1;
      *(_DWORD *)(v13 + 4 * v12 + 32) = v10;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return (char *)v7;
  }
  __break(1u);
  return result;
}

id AVAssetVariantAudioRenditionSpecificAttributes.channelCount.getter()
{
  if (((unint64_t)objc_msgSend(v0, sel_channelCount) & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return [v0 channelCount];
  }
}

char *AVPlayerItemSegment.loadedTimeRanges.getter()
{
  id v1 = [v0 sel_loadedTimeRanges];
  type metadata accessor for NSValue();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v3 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSaySo7NSValueCG_So11CMTimeRangeas5NeverOTg5084_sSo37AVMetricPlayerItemLikelyToKeepUpEventC12AVFoundationE16loadedTimeRangesSaySo11e14RangeaGvgAFSo7D52Ccfu_32e1aaa32c9642607d0b6314623c7365cfAiFTf3nnnpk_nTf1cn_nTm(v2);
  swift_bridgeObjectRelease();
  return v3;
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

uint64_t AVPlayerItemIntegratedTimeline.PeriodicTimes.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  uint64_t v20 = *(void *)(v2 - 8);
  uint64_t v21 = v2;
  MEMORY[0x270FA5388](v2);
  double v19 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation.BufferingPolicy);
  uint64_t v4 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unsigned int v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void **)v1;
  uint64_t v11 = *(void *)(v1 + 8);
  uint64_t v13 = *(void *)(v1 + 24);
  type metadata accessor for CMTime(0);
  uint64_t v23 = v12;
  uint64_t v24 = v11;
  uint64_t v25 = *(void *)(v1 + 16);
  uint64_t v26 = v13;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F580], v18);
  id v14 = v12;
  AsyncStream.init(_:bufferingPolicy:_:)();
  double v15 = v19;
  AsyncStream.makeAsyncIterator()();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v22, v15, v21);
}

uint64_t closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(uint64_t a1, uint64_t *a2))
{
  uint64_t v22 = a5;
  unsigned int v5 = a4;
  unint64_t v9 = HIDWORD(a4);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v15 + v14, v13, v10);
  id v27 = partial apply for closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:);
  uint64_t v28 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v24 = 1107296256;
  uint64_t v25 = thunk for @escaping @callee_guaranteed @Sendable (@unowned CMTime) -> ();
  uint64_t v26 = &block_descriptor_20;
  id v16 = _Block_copy(&aBlock);
  swift_release();
  uint64_t aBlock = a3;
  unint64_t v24 = __PAIR64__(v9, v5);
  uint64_t v25 = v22;
  id v17 = [a2 addPeriodicTimeObserverForInterval:&aBlock queue:v16 usingBlock:0];
  _Block_release(v16);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a2;
  *(void *)(v18 + 24) = v17;
  id v19 = a2;
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t partial apply for closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(uint64_t a1)
{
  return closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(uint64_t (**)(uint64_t, uint64_t *))(v1 + 40));
}

uint64_t closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  int v4 = a2;
  unint64_t v6 = HIDWORD(a2);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation.YieldResult);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[1] = a1;
  int v13 = v4;
  int v14 = v6;
  uint64_t v15 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@unowned CMTime) -> ()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a2[2];
  unsigned int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(v2, v3, v4);

  return swift_release();
}

uint64_t AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.next()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  void *v1 = v0;
  v1[1] = AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.next();
  return MEMORY[0x270FA1F70](v0 + 16, v2);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return MEMORY[0x270FA2498](AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.next(), 0, 0);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  *uint64_t v2 = v1;
  v2[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator;
  return MEMORY[0x270FA1F70](v1 + 16, v3);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator, 0, 0);
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13PeriodicTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[9] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  *uint64_t v4 = v3;
  v4[1] = _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13PeriodicTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return MEMORY[0x270FA1F70](v3 + 2, v5);
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13PeriodicTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](_sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13PeriodicTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY1_, 0, 0);
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13PeriodicTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY1_()
{
  uint64_t v1 = *(void *)(v0 + 56);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 16);
  *(void *)(v0 + 96) = *(void *)(v0 + 32);
  *(unsigned char *)(v0 + 41) = *(unsigned char *)(v0 + 40);
  if (v1)
  {
    swift_getObjectType();
    uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v4 = 0;
  }
  return MEMORY[0x270FA2498](_sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13PeriodicTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY2_, v2, v4);
}

void protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v22 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  uint64_t v20 = *(void *)(v3 - 8);
  uint64_t v21 = v3;
  MEMORY[0x270FA5388](v3);
  id v19 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation.BufferingPolicy);
  uint64_t v5 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = *(id *)v2;
  uint64_t v12 = *(void *)(v2 + 8);
  uint64_t v14 = *(void *)(v2 + 24);
  type metadata accessor for CMTime(0);
  id v23 = v13;
  uint64_t v24 = v12;
  uint64_t v25 = *(void *)(v2 + 16);
  uint64_t v26 = v14;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F580], v18);
  id v15 = v13;
  AsyncStream.init(_:bufferingPolicy:_:)();
  id v16 = v19;
  AsyncStream.makeAsyncIterator()();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v22, v16, v21);
}

uint64_t AVPlayerItemIntegratedTimeline.BoundaryTimes.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  uint64_t v22 = *(void *)(v2 - 8);
  uint64_t v23 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v21 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation.BufferingPolicy);
  uint64_t v4 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void **)(v1 + 8);
  if (v12)
  {
    uint64_t v13 = *(void *)(v1 + 16);
    uint64_t v14 = *(void **)v1;
    type metadata accessor for CMTime(0);
    uint64_t v19 = (uint64_t)&v19;
    MEMORY[0x270FA5388](v15);
    *(&v19 - 4) = (uint64_t)v14;
    *(&v19 - 3) = (uint64_t)v12;
    *(&v19 - 2) = v13;
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F580], v20);
    id v16 = v14;
    id v17 = v12;
    swift_bridgeObjectRetain();
    AsyncStream.init(_:bufferingPolicy:_:)();
    swift_bridgeObjectRelease();
    uint64_t v18 = v21;
    AsyncStream.makeAsyncIterator()();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v22 + 32))(v24, v18, v23);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  specialized _arrayForceCast<A, B>(_:)(a4);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  unint64_t v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v14 = (v10 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v13, v11, v8);
  *(void *)(v15 + v14) = a2;
  aBlock[4] = partial apply for closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:);
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable (@unowned Bool) -> ();
  aBlock[3] = &block_descriptor_5;
  id v16 = _Block_copy(aBlock);
  id v17 = a2;
  swift_release();
  id v18 = [v17 addBoundaryTimeObserverForSegment:a3 offsetsIntoSegment:0 queue:v16 usingBlock:isa];
  _Block_release(v16);

  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v17;
  *(void *)(v19 + 24) = v18;
  id v20 = v17;
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t partial apply for closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(uint64_t a1)
{
  return closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

void closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(char a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation.YieldResult);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    [a3 sel_currentTime];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
    AsyncStream.Continuation.yield(_:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
    AsyncStream.Continuation.finish()();
  }
}

uint64_t AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.next()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  void *v1 = v0;
  v1[1] = AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.next();
  return MEMORY[0x270FA1F70](v0 + 16, v2);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return MEMORY[0x270FA2498](AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.next(), 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void, void, void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned __int8 *)(v0 + 40));
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  *uint64_t v2 = v1;
  v2[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator;
  return MEMORY[0x270FA1F70](v1 + 16, v3);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;

  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(unsigned char *)(v0 + 40);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v2;
  *(unsigned char *)(v1 + 24) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[9] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  *uint64_t v4 = v3;
  v4[1] = _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return MEMORY[0x270FA1F70](v3 + 2, v5);
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](_sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY1_, 0, 0);
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY1_()
{
  uint64_t v1 = *(void *)(v0 + 56);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 16);
  *(void *)(v0 + 96) = *(void *)(v0 + 32);
  *(unsigned char *)(v0 + 41) = *(unsigned char *)(v0 + 40);
  if (v1)
  {
    swift_getObjectType();
    uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v4 = 0;
  }
  return MEMORY[0x270FA2498](_sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY2_, v2, v4);
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY2_()
{
  char v1 = *(unsigned char *)(v0 + 41);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 48);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(v0 + 80);
  *(void *)(v3 + 16) = v2;
  *(unsigned char *)(v3 + 24) = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVPlayerItemIntegratedTimeline.BoundaryTimes(uint64_t a1@<X8>)
{
  AVPlayerItemIntegratedTimeline.BoundaryTimes.makeAsyncIterator()(a1);
  uint64_t v2 = *(void **)v1;
  id v3 = *(id *)(v1 + 8);
  swift_bridgeObjectRelease();
}

uint64_t AVPlayerItemIntegratedTimeline.periodicTimes(forInterval:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = v4;
  a4[1] = a1;
  a4[2] = a2;
  a4[3] = a3;
  return MEMORY[0x270F9A958]();
}

uint64_t AVPlayerItemIntegratedTimeline.boundaryTimes(for:offsetsIntoSegment:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = v3;
  a3[1] = a1;
  a3[2] = a2;
  id v5 = v3;
  id v6 = a1;

  return swift_bridgeObjectRetain();
}

uint64_t associated type witness table accessor for AsyncIteratorProtocol.Failure : Error in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator()
{
  return MEMORY[0x263F8E658];
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in AVPlayerItemIntegratedTimeline.PeriodicTimes()
{
  return lazy protocol witness table accessor for type AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator and conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(&lazy protocol witness table cache variable for type AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator and conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator, (void (*)(uint64_t))type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator);
}

uint64_t type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1)
{
  return type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(a1, (uint64_t *)&type metadata singleton initialization cache for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator);
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in AVPlayerItemIntegratedTimeline.BoundaryTimes()
{
  return lazy protocol witness table accessor for type AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator and conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator((unint64_t *)&lazy protocol witness table cache variable for type AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator and conformance AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator, (void (*)(uint64_t))type metadata accessor for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator);
}

uint64_t lazy protocol witness table accessor for type AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator and conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator(uint64_t a1)
{
  return type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(a1, type metadata singleton initialization cache for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator);
}

uint64_t type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void destroy for AVPlayerItemIntegratedTimeline.PeriodicTimes(id *a1)
{
}

uint64_t initializeWithCopy for AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
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

uint64_t assignWithTake for AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t a1, void *a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t getEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes()
{
  return &type metadata for AVPlayerItemIntegratedTimeline.PeriodicTimes;
}

uint64_t getEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

void type metadata accessor for AsyncStream<CMTime>.Iterator()
{
  if (!lazy cache variable for type metadata for AsyncStream<CMTime>.Iterator)
  {
    type metadata accessor for CMTime(255);
    unint64_t v0 = type metadata accessor for AsyncStream.Iterator();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for AsyncStream<CMTime>.Iterator);
    }
  }
}

uint64_t destroy for AVPlayerItemIntegratedTimeline.BoundaryTimes(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for AVPlayerItemIntegratedTimeline.BoundaryTimes(void *a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  id v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AVPlayerItemIntegratedTimeline.BoundaryTimes(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AVPlayerItemIntegratedTimeline.BoundaryTimes(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.BoundaryTimes(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.BoundaryTimes(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AVPlayerItemIntegratedTimeline.BoundaryTimes()
{
  return &type metadata for AVPlayerItemIntegratedTimeline.BoundaryTimes;
}

uint64_t initializeBufferWithCopyOfBuffer for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  id v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2128A2100);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2128A2188);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void type metadata completion function for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator()
{
  type metadata accessor for AsyncStream<CMTime>.Iterator();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_2128A228C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

void partial apply for closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(char a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation)
                 - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void **)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(a1, v1 + v4, v5);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

id partial apply for closure #2 in closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)()
{
  return [*(id *)(v0 + 16) removeTimeObserver:*(void *)(v0 + 24)];
}

uint64_t sub_2128A2400()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);

  return closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(a1, a2, a3);
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t AVCaptureSynchronizedDataCollection.makeIterator()@<X0>(void *a1@<X8>)
{
  *a1 = v1;
  type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  id v2 = v1;
  return NSFastEnumerationIterator.init(_:)();
}

uint64_t type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator()
{
  uint64_t result = type metadata singleton initialization cache for AVCaptureSynchronizedDataCollection.Iterator;
  if (!type metadata singleton initialization cache for AVCaptureSynchronizedDataCollection.Iterator) {
    return swift_getSingletonMetadata();
  }
  return result;
}

AVCaptureSynchronizedData_optional __swiftcall AVCaptureSynchronizedDataCollection.Iterator.next()()
{
  type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  NSFastEnumerationIterator.next()();
  if (!v7)
  {
    outlined destroy of Any?((uint64_t)v6);
    goto LABEL_5;
  }
  type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for AVCaptureOutput);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = (objc_class *)[*v0 synchronizedDataForCaptureOutput:v5];

LABEL_6:
  uint64_t v4 = v3;
  result.value._synchronizedDataInternal = v1;
  result.value.super.Class isa = v4;
  result.is_nil = v2;
  return result;
}

unint64_t protocol witness for IteratorProtocol.next() in conformance AVCaptureSynchronizedDataCollection.Iterator@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = (unint64_t)AVCaptureSynchronizedDataCollection.Iterator.next()();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type AVCaptureSynchronizedDataCollection.Iterator and conformance AVCaptureSynchronizedDataCollection.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type AVCaptureSynchronizedDataCollection.Iterator and conformance AVCaptureSynchronizedDataCollection.Iterator;
  if (!lazy protocol witness table cache variable for type AVCaptureSynchronizedDataCollection.Iterator and conformance AVCaptureSynchronizedDataCollection.Iterator)
  {
    type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AVCaptureSynchronizedDataCollection.Iterator and conformance AVCaptureSynchronizedDataCollection.Iterator);
  }
  return result;
}

uint64_t protocol witness for Sequence.makeIterator() in conformance AVCaptureSynchronizedDataCollection@<X0>(void *a1@<X8>)
{
  Swift::Bool v2 = *v1;
  *a1 = v2;
  type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  id v3 = v2;
  return NSFastEnumerationIterator.init(_:)();
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance AVCaptureSynchronizedDataCollection()
{
  return 0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance AVCaptureSynchronizedDataCollection()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance AVCaptureSynchronizedDataCollection()
{
  uint64_t v1 = *v0;
  specialized _copySequenceToContiguousArray<A>(_:)(*v0);
  uint64_t v3 = v2;

  return v3;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance AVCaptureSynchronizedDataCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3);
}

uint64_t specialized Sequence._copyContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (id *)((char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  *id v9 = v3;
  id v10 = v3;
  uint64_t result = NSFastEnumerationIterator.init(_:)();
  if (!a2)
  {
    a3 = 0;
    goto LABEL_16;
  }
  if (!a3)
  {
LABEL_16:
    outlined init with take of AVCaptureSynchronizedDataCollection.Iterator((uint64_t)v9, a1);
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v15 = a1;
    NSFastEnumerationIterator.next()();
    if (v18)
    {
      type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for AVCaptureOutput);
      uint64_t v12 = 0;
      while ((swift_dynamicCast() & 1) != 0)
      {
        unint64_t v13 = v16;
        id v14 = [*v9 synchronizedDataForCaptureOutput:v16];

        if (!v14) {
          break;
        }
        *(void *)(a2 + 8 * v12) = v14;
        if (a3 - 1 == v12) {
          goto LABEL_15;
        }
        NSFastEnumerationIterator.next()();
        ++v12;
        if (!v18) {
          goto LABEL_13;
        }
      }
    }
    else
    {
      uint64_t v12 = 0;
LABEL_13:
      outlined destroy of Any?((uint64_t)v17);
    }
    a3 = v12;
LABEL_15:
    a1 = v15;
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance AVCaptureSynchronizedDataCollection()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

void **initializeBufferWithCopyOfBuffer for AVCaptureSynchronizedDataCollection.Iterator(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for NSFastEnumerationIterator();
    id v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for AVCaptureSynchronizedDataCollection.Iterator(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for NSFastEnumerationIterator();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void **initializeWithCopy for AVCaptureSynchronizedDataCollection.Iterator(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for NSFastEnumerationIterator();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  id v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

void **assignWithCopy for AVCaptureSynchronizedDataCollection.Iterator(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  id v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

void *initializeWithTake for AVCaptureSynchronizedDataCollection.Iterator(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void **assignWithTake for AVCaptureSynchronizedDataCollection.Iterator(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2128A2DB0);
}

uint64_t sub_2128A2DB0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for NSFastEnumerationIterator();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2128A2E74);
}

void *sub_2128A2E74(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for NSFastEnumerationIterator();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for AVCaptureSynchronizedDataCollection.Iterator()
{
  uint64_t result = type metadata accessor for NSFastEnumerationIterator();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t outlined init with take of AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void specialized _copySequenceToContiguousArray<A>(_:)(void *a1)
{
  uint64_t v2 = type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (id *)((char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v5 = a1;
  uint64_t v6 = (char *)v5 + *(int *)(v3 + 28);
  id v7 = a1;
  NSFastEnumerationIterator.init(_:)();
  NSFastEnumerationIterator.next()();
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  if (v36)
  {
    uint64_t v9 = type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for AVCaptureOutput);
    uint64_t v10 = 0;
    uint64_t v11 = v8 + 4;
    uint64_t v12 = MEMORY[0x263F8EE58] + 8;
    unint64_t v13 = 0x264192000uLL;
    uint64_t v33 = v6;
    while ((swift_dynamicCast() & 1) != 0)
    {
      id v14 = v34;
      id v15 = [*v5 *(SEL *)(v13 + 3488) v34, v33];

      if (!v15) {
        break;
      }
      if (!v10)
      {
        unint64_t v16 = v8[3];
        if ((uint64_t)((v16 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_28;
        }
        id v17 = v5;
        uint64_t v18 = v12;
        uint64_t v19 = v9;
        int64_t v20 = v16 & 0xFFFFFFFFFFFFFFFELL;
        if (v20 <= 1) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = v20;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
        uint64_t v22 = (void *)swift_allocObject();
        int64_t v23 = _swift_stdlib_malloc_size(v22);
        uint64_t v24 = v23 - 32;
        if (v23 < 32) {
          uint64_t v24 = v23 - 25;
        }
        uint64_t v25 = v24 >> 3;
        v22[2] = v21;
        v22[3] = (2 * (v24 >> 3)) | 1;
        unint64_t v26 = (unint64_t)(v22 + 4);
        uint64_t v27 = v8[3] >> 1;
        if (v8[2])
        {
          uint64_t v28 = v8 + 4;
          if (v22 != v8 || v26 >= (unint64_t)v28 + 8 * v27) {
            memmove(v22 + 4, v28, 8 * v27);
          }
          void v8[2] = 0;
        }
        uint64_t v11 = (void *)(v26 + 8 * v27);
        uint64_t v10 = (v25 & 0x7FFFFFFFFFFFFFFFLL) - v27;
        swift_release();
        uint64_t v8 = v22;
        uint64_t v9 = v19;
        uint64_t v12 = v18;
        uint64_t v5 = v17;
        unint64_t v13 = 0x264192000;
      }
      BOOL v29 = __OFSUB__(v10--, 1);
      if (v29)
      {
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      *v11++ = v15;
      NSFastEnumerationIterator.next()();
      if (!v36) {
        goto LABEL_22;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
LABEL_22:
    outlined destroy of Any?((uint64_t)v35);
  }
  outlined destroy of AVCaptureSynchronizedDataCollection.Iterator((uint64_t)v5);
  unint64_t v30 = v8[3];
  if (v30 >= 2)
  {
    unint64_t v31 = v30 >> 1;
    BOOL v29 = __OFSUB__(v31, v10);
    uint64_t v32 = v31 - v10;
    if (v29) {
LABEL_29:
    }
      __break(1u);
    else {
      void v8[2] = v32;
    }
  }
}

uint64_t outlined destroy of AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@unowned Bool) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

AVPlayerItem __swiftcall AVPlayerItem.init(asset:automaticallyLoadedAssetKeys:)(AVAsset asset, Swift::OpaquePointer automaticallyLoadedAssetKeys)
{
  uint64_t v2 = asset._asset;
  Class isa = asset.super.isa;
  if ((unint64_t)asset._asset >> 62)
  {
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    if (!v4) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v4 = *(void *)(((uint64_t)asset._asset & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      goto LABEL_16;
    }
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v5 = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if (v4 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (((unint64_t)v2 & 0xC000000000000001) != 0)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = MEMORY[0x2166848A0](v7, v2);
      uint64_t v10 = *(void *)(v8 + 16);
      uint64_t v9 = *(void *)(v8 + 24);
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      unint64_t v12 = *(void *)(v25 + 16);
      unint64_t v11 = *(void *)(v25 + 24);
      if (v12 >= v11 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v7;
      *(void *)(v25 + 16) = v12 + 1;
      uint64_t v13 = v25 + 16 * v12;
      *(void *)(v13 + 32) = v10;
      *(void *)(v13 + 40) = v9;
    }
    while (v4 != v7);
  }
  else
  {
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = *((void *)v2 + v14 + 4);
      uint64_t v17 = *(void *)(v15 + 16);
      uint64_t v16 = *(void *)(v15 + 24);
      unint64_t v19 = *(void *)(v25 + 16);
      unint64_t v18 = *(void *)(v25 + 24);
      swift_bridgeObjectRetain();
      if (v19 >= v18 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v18 > 1), v19 + 1, 1);
      }
      ++v14;
      *(void *)(v25 + 16) = v19 + 1;
      uint64_t v20 = v25 + 16 * v19;
      *(void *)(v20 + 32) = v17;
      *(void *)(v20 + 40) = v16;
    }
    while (v4 != v14);
  }
LABEL_16:
  swift_bridgeObjectRelease();
  id v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class v22 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  int64_t v23 = (char *)[v21 sel_initWithAsset_automaticallyLoadedAssetKeys_:isa, v22];

  uint64_t v5 = v23;
LABEL_18:
  result._playerItem = v6;
  result.super.Class isa = (Class)v5;
  return result;
}

uint64_t AVPlayerItem.seek(to:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](AVPlayerItem.seek(to:), 0, 0);
}

uint64_t AVPlayerItem.seek(to:)()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  v0[2].i64[0] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[2].i64[1] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = AVPlayerItem.seek(to:);
  uint64_t v3 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2318](&v0[3], 0, 0, 0x3A6F74286B656573, 0xE900000000000029, partial apply for closure #1 in AVPlayerItem.seek(to:), v1, v3);
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](AVPlayerItem.seek(to:), 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 48));
}

void closure #1 in AVPlayerItem.seek(to:)(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = partial apply for closure #1 in closure #1 in AVPlayerItem.seek(to:);
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable (@unowned Bool) -> ();
  aBlock[3] = &block_descriptor_6;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release();
  [a2 seekToDate:v10];
  _Block_release(v10);
}

char *AVPlayerItem.speedRamp.getter()
{
  id v1 = [v0 sel_speedRamp];
  if (!v1) {
    return (char *)v1;
  }
  type metadata accessor for NSValue();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
LABEL_4:
  int64_t v23 = (void *)MEMORY[0x263F8EE78];
  AVPlayerItem result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    id v1 = v23;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x2166848A0](v5, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      [v6 CMTimeMappingValue:v11, v12, v13];
      long long v12 = v18;
      long long v13 = v16;
      long long v11 = v20;

      unint64_t v9 = v23[2];
      unint64_t v8 = v23[3];
      if (v9 >= v8 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v8 > 1), v9 + 1, 1);
      }
      v23[2] = v9 + 1;
      uint64_t v10 = &v23[12 * v9];
      v10[4] = v14;
      ++v5;
      v10[5] = v15;
      *((_OWORD *)v10 + 3) = v16;
      v10[8] = v17;
      *(_OWORD *)(v10 + 9) = v18;
      v10[11] = v19;
      *((_OWORD *)v10 + 6) = v20;
      v10[14] = v21;
      v10[15] = v22;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v1;
  }
  __break(1u);
  return result;
}

void AVPlayerItem.speedRamp.setter(objc_class *a1)
{
  Class isa = a1;
  if (a1)
  {
    uint64_t v3 = *((void *)a1 + 2);
    if (v3)
    {
      uint64_t v23 = MEMORY[0x263F8EE78];
      specialized ContiguousArray.reserveCapacity(_:)();
      uint64_t v4 = self;
      uint64_t v5 = (char *)isa + 64;
      do
      {
        uint64_t v6 = *((void *)v5 + 7);
        uint64_t v7 = *((void *)v5 - 3);
        uint64_t v8 = *(void *)v5;
        uint64_t v9 = *((void *)v5 + 3);
        uint64_t v10 = *((void *)v5 + 6);
        long long v11 = *((_OWORD *)v5 - 1);
        long long v12 = *(_OWORD *)(v5 + 8);
        long long v13 = *((_OWORD *)v5 + 2);
        v15[0] = *((void *)v5 - 4);
        v15[1] = v7;
        long long v16 = v11;
        uint64_t v17 = v8;
        long long v18 = v12;
        uint64_t v19 = v9;
        long long v20 = v13;
        uint64_t v21 = v10;
        uint64_t v22 = v6;
        id v14 = [v4 valueWithCMTimeMapping:v15];
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        v5 += 96;
        --v3;
      }
      while (v3);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    type metadata accessor for NSValue();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  [v1 setSpeedRamp:isa];
}

void (*AVPlayerItem.speedRamp.modify(char **a1))(objc_class **a1, char a2)
{
  a1[1] = v1;
  *a1 = AVPlayerItem.speedRamp.getter();
  return AVPlayerItem.speedRamp.modify;
}

void AVPlayerItem.speedRamp.modify(objc_class **a1, char a2)
{
  if (a2)
  {
    unint64_t v2 = (objc_class *)swift_bridgeObjectRetain();
    AVPlayerItem.speedRamp.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    AVPlayerItem.speedRamp.setter(*a1);
  }
}

void partial apply for closure #1 in AVPlayerItem.seek(to:)(uint64_t a1)
{
  closure #1 in AVPlayerItem.seek(to:)(a1, *(void **)(v1 + 16));
}

char *sub_2128A3D74@<X0>(char **a1@<X8>)
{
  AVPlayerItem result = AVPlayerItem.speedRamp.getter();
  *a1 = result;
  return result;
}

void sub_2128A3DA0()
{
  uint64_t v0 = (objc_class *)swift_bridgeObjectRetain();
  AVPlayerItem.speedRamp.setter(v0);
}

uint64_t sub_2128A3DCC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in AVPlayerItem.seek(to:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t AVAssetImageGenerator.image(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[24] = a3;
  v4[25] = v3;
  v4[22] = a1;
  v4[23] = a2;
  return MEMORY[0x270FA2498](AVAssetImageGenerator.image(at:), 0, 0);
}

uint64_t AVAssetImageGenerator.image(at:)()
{
  uint64_t v1 = v0 + 2;
  uint64_t v3 = v0[24];
  uint64_t v2 = (void *)v0[25];
  uint64_t v5 = v0[22];
  uint64_t v4 = v0[23];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = AVAssetImageGenerator.image(at:);
  uint64_t v6 = swift_continuation_init();
  v0[19] = v5;
  uint64_t v7 = v0 + 19;
  *(v7 - 9) = MEMORY[0x263EF8330];
  *(v7 - 8) = 0x40000000;
  *(v7 - 7) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned CGImageRef?, @unowned CMTime, @unowned NSError?) -> () with result type (CGImageRef, CMTime);
  *(v7 - 6) = &block_descriptor_1;
  *(v7 - 5) = v6;
  v7[1] = v4;
  _OWORD v7[2] = v3;
  [v2 sel_generateCGImageAsynchronouslyForTime_completionHandler_:v7];
  return MEMORY[0x270FA23F0](v1);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = AVAssetImageGenerator.image(at:);
  }
  else {
    uint64_t v2 = AVAssetImageGenerator.image(at:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void, void, void, void))(v0 + 8))(*(void *)(v0 + 120), *(void *)(v0 + 128), *(void *)(v0 + 136), *(void *)(v0 + 144));
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned CGImageRef?, @unowned CMTime, @unowned NSError?) -> () with result type (CGImageRef, CMTime)(uint64_t a1, void *a2, uint64_t *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v6 = swift_allocError();
    *uint64_t v7 = a4;
    id v8 = a4;
    return MEMORY[0x270FA2410](v4, v6);
  }
  else
  {
    if (a2)
    {
      uint64_t v9 = *a3;
      uint64_t v10 = a3[1];
      uint64_t v11 = a3[2];
      long long v12 = *(void **)(*(void *)(v4 + 64) + 40);
      *long long v12 = a2;
      v12[1] = v9;
      void v12[2] = v10;
      v12[3] = v11;
      id v13 = a2;
      a1 = v4;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t AVAssetImageGenerator.images(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  uint64_t v4 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation.BufferingPolicy);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = v2;
  uint64_t v20 = a1;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F580], v7);
  swift_bridgeObjectRetain();
  id v15 = v2;
  AsyncStream.init(_:bufferingPolicy:_:)();
  swift_bridgeObjectRelease();
  AsyncStream.makeAsyncIterator()();

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v18, v6, v17);
}

void AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + 16);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v6 = self;
    uint64_t v7 = (void (**)(uint64_t, uint64_t *, void *, uint64_t *, uint64_t, void *))(a1 + 48);
    do
    {
      uint64_t v8 = *v7;
      uint64_t aBlock = (uint64_t)*(v7 - 2);
      uint64_t v14 = (uint64_t)*(v7 - 1);
      id v15 = v8;
      id v9 = [v6 sel_valueWithCMTime:&aBlock];
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v7 += 3;
      --v5;
    }
    while (v5);
  }
  type metadata accessor for NSValue();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v2;
  *(void *)(v11 + 24) = a1;
  uint64_t v17 = partial apply for closure #2 in AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:);
  uint64_t v18 = v11;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  id v15 = thunk for @escaping @callee_guaranteed @Sendable (@unowned CMTime, @guaranteed CGImageRef?, @unowned CMTime, @unowned AVAssetImageGeneratorResult, @guaranteed Error?) -> ();
  long long v16 = &block_descriptor_9;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  [v4 sel_generateCGImagesAsynchronouslyForTimes_completionHandler_:isa, v12];
  _Block_release(v12);
}

void closure #2 in AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11 = *(void *)(a10 + 24);
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(void *)(a10 + 24) = v13;
  if (a8 == 2)
  {
    uint64_t v18 = *(void (**)(uint64_t *))(a10 + 32);
    id v19 = (id)AVLocalizedError();
    if (!v19)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    uint64_t v20 = v19;
    uint64_t v22 = a1;
    uint64_t v23 = a2;
    uint64_t v24 = a3;
    id v25 = v19;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v26 = 0;
    char v29 = 1;
    v18(&v22);
  }
  else
  {
    if (a8 == 1)
    {
      if (a9)
      {
        uint64_t v17 = *(void (**)(uint64_t *))(a10 + 32);
        uint64_t v22 = a1;
        uint64_t v23 = a2;
        uint64_t v24 = a3;
        id v25 = a9;
        uint64_t v27 = 0;
        uint64_t v28 = 0;
        uint64_t v26 = 0;
        char v29 = 1;
        v17(&v22);
        goto LABEL_11;
      }
      goto LABEL_15;
    }
    if (a8)
    {
LABEL_18:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return;
    }
    if (!a4)
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    uint64_t v21 = *(void (**)(uint64_t *))(a10 + 32);
    uint64_t v22 = a1;
    uint64_t v23 = a2;
    uint64_t v24 = a3;
    id v25 = a4;
    uint64_t v26 = a5;
    uint64_t v27 = a6;
    uint64_t v28 = a7;
    char v29 = 0;
    v21(&v22);
  }
LABEL_11:
  if (*(void *)(a10 + 24) == *(void *)(a11 + 16)) {
    (*(void (**)(void))(a10 + 48))(0);
  }
}

void thunk for @escaping @callee_guaranteed @Sendable (@unowned CMTime, @guaranteed CGImageRef?, @unowned CMTime, @unowned AVAssetImageGeneratorResult, @guaranteed Error?) -> ()(uint64_t a1, uint64_t *a2, void *a3, uint64_t *a4, uint64_t a5, void *a6)
{
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v10 = a2[2];
  uint64_t v11 = *a4;
  uint64_t v12 = a4[1];
  uint64_t v13 = a4[2];
  id v15 = *(void (**)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  id v16 = a3;
  id v14 = a6;
  v15(v8, v9, v10, a3, v11, v12, v13, a5, a6);
  swift_release();
}

uint64_t AVAssetImageGenerator.ImageGeneratorMonitor.__deallocating_deinit()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v20 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v10((char *)&v20 - v8, a1, v4);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v21 = swift_allocObject();
  uint64_t v12 = *(void (**)(unint64_t, char *, uint64_t))(v5 + 32);
  v12(v21 + v11, v9, v4);
  uint64_t v13 = v20;
  v10(v20, a1, v4);
  uint64_t v14 = swift_allocObject();
  v12(v14 + v11, v13, v4);
  type metadata accessor for AVAssetImageGenerator.ImageGeneratorMonitor();
  id v15 = (void *)swift_allocObject();
  uint64_t v17 = v21;
  id v16 = v22;
  void v15[2] = v22;
  v15[3] = 0;
  v15[4] = partial apply for closure #1 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:);
  v15[5] = v17;
  v15[6] = partial apply for closure #2 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:);
  v15[7] = v14;
  id v18 = v16;
  AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:)(v23);
  return swift_release();
}

uint64_t partial apply for closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(uint64_t a1)
{
  return closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t closure #1 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(long long *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation.YieldResult);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with take of AVAssetImageGenerator.Images.Element(a1, v7);
  outlined retain of AVAssetImageGenerator.Images.Element((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t AVAssetImageGenerator.Images.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of AVAssetImageGenerator.Images(v1, a1);
}

uint64_t outlined init with copy of AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AVAssetImageGenerator.Images();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for AVAssetImageGenerator.Images()
{
  uint64_t result = type metadata singleton initialization cache for AVAssetImageGenerator.Images;
  if (!type metadata singleton initialization cache for AVAssetImageGenerator.Images) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AVAssetImageGenerator.Images.next()(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 88) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  *uint64_t v2 = v1;
  v2[1] = AVAssetImageGenerator.Images.next();
  return MEMORY[0x270FA1F70](v1 + 16, v3);
}

uint64_t AVAssetImageGenerator.Images.next()()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](AVAssetImageGenerator.Images.next(), 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  long long v4;
  long long v5;

  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(unsigned char *)(v0 + 72);
  uint64_t v4 = *(_OWORD *)(v0 + 32);
  uint64_t v5 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = v4;
  *(_OWORD *)(v1 + 32) = v5;
  *(void *)(v1 + 48) = v2;
  *(unsigned char *)(v1 + 56) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVAssetImageGenerator.Images@<X0>(uint64_t a1@<X8>)
{
  return outlined init with take of AVAssetImageGenerator.Images(v1, a1);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetImageGenerator.Images(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 88) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  *uint64_t v2 = v1;
  v2[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetImageGenerator.Images;
  return MEMORY[0x270FA1F70](v1 + 16, v3);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetImageGenerator.Images()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetImageGenerator.Images, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  long long v4;
  long long v5;

  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(unsigned char *)(v0 + 72);
  uint64_t v4 = *(_OWORD *)(v0 + 32);
  uint64_t v5 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = v4;
  *(_OWORD *)(v1 + 32) = v5;
  *(void *)(v1 + 48) = v2;
  *(unsigned char *)(v1 + 56) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sSo21AVAssetImageGeneratorC12AVFoundationE6ImagesVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 88) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  *uint64_t v2 = v1;
  v2[1] = _sSo21AVAssetImageGeneratorC12AVFoundationE6ImagesVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return MEMORY[0x270FA1F70](v1 + 16, v3);
}

uint64_t _sSo21AVAssetImageGeneratorC12AVFoundationE6ImagesVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](_sSo21AVAssetImageGeneratorC12AVFoundationE6ImagesVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY1_, 0, 0);
}

uint64_t AVAssetImageGenerator.Images.Element.requestedTime.getter()
{
  outlined init with take of AVAssetImageGenerator.Images.Element(v0, &v2);
  return v2;
}

_OWORD *outlined init with take of AVAssetImageGenerator.Images.Element(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  long long v4 = a1[2];
  *(_OWORD *)((char *)a2 + 41) = *(long long *)((char *)a1 + 41);
  a2[1] = v3;
  a2[2] = v4;
  *a2 = v2;
  return a2;
}

long long *AVAssetImageGenerator.Images.Element.image.getter()
{
  uint64_t v1 = v0;
  outlined init with take of AVAssetImageGenerator.Images.Element(v0, &v6);
  long long v2 = v7;
  outlined init with take of AVAssetImageGenerator.Images.Element(v1, &v8);
  if (v10)
  {
    id v3 = v2;
    swift_willThrow();
  }
  else
  {
    uint64_t v1 = v9;
    id v4 = v2;
  }
  return v1;
}

uint64_t AVAssetImageGenerator.Images.Element.actualTime.getter()
{
  uint64_t v1 = v0;
  outlined init with take of AVAssetImageGenerator.Images.Element(v0, &v5);
  long long v2 = v6;
  outlined init with take of AVAssetImageGenerator.Images.Element(v1, &v7);
  if ((v9 & 1) == 0) {
    return v8;
  }
  id v3 = v2;
  return swift_willThrow();
}

unint64_t lazy protocol witness table accessor for type AVAssetImageGenerator.Images and conformance AVAssetImageGenerator.Images()
{
  unint64_t result = lazy protocol witness table cache variable for type AVAssetImageGenerator.Images and conformance AVAssetImageGenerator.Images;
  if (!lazy protocol witness table cache variable for type AVAssetImageGenerator.Images and conformance AVAssetImageGenerator.Images)
  {
    type metadata accessor for AVAssetImageGenerator.Images();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AVAssetImageGenerator.Images and conformance AVAssetImageGenerator.Images);
  }
  return result;
}

uint64_t type metadata accessor for AVAssetImageGenerator.ImageGeneratorMonitor()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  long long v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for AVAssetImageGenerator.Images(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2128A5764);
}

uint64_t sub_2128A5764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  long long v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2128A57E8);
}

uint64_t sub_2128A57E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  long long v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void type metadata completion function for AVAssetImageGenerator.Images()
{
  type metadata accessor for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator()
{
  if (!lazy cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator)
  {
    unint64_t v0 = type metadata accessor for AsyncStream.Iterator();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
    }
  }
}

id outlined copy of AVAssetImageGenerator.Images.Element(uint64_t a1, uint64_t a2, uint64_t a3, id a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8) {
    return a4;
  }
  else {
    return (id)MEMORY[0x270F9A958](a1, a2, a3, a4);
  }
}

void destroy for AVAssetImageGenerator.Images.Element(uint64_t a1)
{
}

void outlined consume of AVAssetImageGenerator.Images.Element(uint64_t a1, uint64_t a2, uint64_t a3, id a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8) {

  }
  else {
    MEMORY[0x270F9A828](a1, a2, a3, a4);
  }
}

uint64_t initializeWithCopy for AVAssetImageGenerator.Images.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  long long v6 = *(void **)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  char v10 = *(unsigned char *)(a2 + 56);
  outlined copy of AVAssetImageGenerator.Images.Element(*(void *)a2, v4, v5, v6, v7, v8, v9, v10);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = v10;
  return a1;
}

uint64_t assignWithCopy for AVAssetImageGenerator.Images.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  long long v6 = *(void **)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  char v10 = *(unsigned char *)(a2 + 56);
  outlined copy of AVAssetImageGenerator.Images.Element(*(void *)a2, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v11 = *(void *)a1;
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void **)(a1 + 24);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  char v18 = *(unsigned char *)(a1 + 56);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = v10;
  outlined consume of AVAssetImageGenerator.Images.Element(v11, v12, v13, v14, v15, v16, v17, v18);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AVAssetImageGenerator.Images.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 48);
  char v4 = *(unsigned char *)(a2 + 56);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void **)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 56);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v3;
  *(unsigned char *)(a1 + 56) = v4;
  outlined consume of AVAssetImageGenerator.Images.Element(v5, v7, v6, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetImageGenerator.Images.Element(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AVAssetImageGenerator.Images.Element(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 56) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for AVAssetImageGenerator.Images.Element(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 56);
}

uint64_t destructiveInjectEnumTag for AVAssetImageGenerator.Images.Element(uint64_t result, char a2)
{
  *(unsigned char *)(result + 56) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AVAssetImageGenerator.Images.Element()
{
  return &type metadata for AVAssetImageGenerator.Images.Element;
}

uint64_t sub_2128A5BF0()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #2 in AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  closure #2 in AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *(void *)(v9 + 16), *(void *)(v9 + 24));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t outlined init with take of AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AVAssetImageGenerator.Images();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(long long *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation);

  return closure #1 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(a1);
}

uint64_t objectdestroy_13Tm_0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void partial apply for closure #2 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:)()
{
}

uint64_t outlined retain of AVAssetImageGenerator.Images.Element(uint64_t a1)
{
  return a1;
}

uint64_t AVAssetExportSession.export(to:as:isolation:)@<X0>(uint64_t a1@<X1>, NSURL *a2@<X8>)
{
  uint64_t v4 = v2;
  v3[2] = v2;
  URL._bridgeToObjectiveC()(a2);
  uint64_t v7 = v6;
  [v4 setOutputURL:v6];

  [v4 setOutputFileType:a1];
  uint64_t v8 = swift_task_alloc();
  v3[3] = v8;
  *(void *)(v8 + 16) = v4;
  uint64_t v9 = swift_task_alloc();
  v3[4] = v9;
  *(void *)(v9 + 16) = v4;
  id v10 = v4;
  uint64_t v11 = (void *)swift_task_alloc();
  v3[5] = v11;
  *uint64_t v11 = v3;
  v11[1] = AVAssetExportSession.export(to:as:isolation:);
  return MEMORY[0x270FA2340]();
}

uint64_t AVAssetExportSession.export(to:as:isolation:)()
{
  uint64_t v1 = *(void **)(*v0 + 16);
  uint64_t v4 = *v0;
  swift_task_dealloc();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t AVAssetExportSession.export(to:as:)@<X0>(uint64_t a1@<X1>, NSURL *a2@<X8>)
{
  uint64_t v4 = v2;
  v3[2] = v2;
  URL._bridgeToObjectiveC()(a2);
  uint64_t v7 = v6;
  [v4 setOutputURL:v6];

  [v4 setOutputFileType:a1];
  uint64_t v8 = swift_task_alloc();
  v3[3] = v8;
  *(void *)(v8 + 16) = v4;
  uint64_t v9 = swift_task_alloc();
  v3[4] = v9;
  *(void *)(v9 + 16) = v4;
  id v10 = v4;
  uint64_t v11 = (void *)swift_task_alloc();
  v3[5] = v11;
  *uint64_t v11 = v3;
  v11[1] = AVAssetExportSession.export(to:as:);
  return MEMORY[0x270FA2340]();
}

uint64_t closure #1 in AVAssetExportSession.export(to:as:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a2;
  return MEMORY[0x270FA2498](closure #1 in AVAssetExportSession.export(to:as:), 0, 0);
}

uint64_t closure #1 in AVAssetExportSession.export(to:as:)()
{
  uint64_t v1 = (void *)v0[16];
  v0[2] = v0;
  v0[3] = closure #1 in AVAssetExportSession.export(to:as:);
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for <A><A1, B1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v0[13] = &block_descriptor_37;
  v0[14] = v2;
  [v1 sel_exportAsynchronouslyWithCompletionHandler_:v0 + 10];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](closure #1 in AVAssetExportSession.export(to:as:), 0, 0);
}

id closure #1 in AVAssetExportSession.export(to:as:)()
{
  id v1 = [*(id *)(v0 + 128) sel_status];
  if (v1 == (id)5)
  {
LABEL_7:
    id result = (id)AVLocalizedError();
    if (!result)
    {
      __break(1u);
      return result;
    }
    goto LABEL_8;
  }
  if (v1 != (id)4)
  {
    if (v1 != (id)3)
    {
      uint64_t v4 = *(void **)(v0 + 128);
      _StringGuts.grow(_:)(29);
      *(void *)(v0 + 80) = 0;
      *(void *)(v0 + 88) = 0xE000000000000000;
      v5._object = (void *)0x80000002128B6000;
      v5._countAndFlagsBits = 0xD00000000000001BLL;
      String.append(_:)(v5);
      *(void *)(v0 + 120) = [v4 sel_status];
      type metadata accessor for AVAssetExportSessionStatus(0);
      _print_unlocked<A, B>(_:_:)();
      return (id)_assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_9;
  }
  if (!objc_msgSend(*(id *)(v0 + 128), sel_error))
  {
    __break(1u);
    goto LABEL_7;
  }
LABEL_8:
  swift_willThrow();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
LABEL_9:
  return (id)v2();
}

uint64_t partial apply for closure #1 in AVAssetExportSession.export(to:as:)()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  v3[16] = v2;
  return MEMORY[0x270FA2498](closure #1 in AVAssetExportSession.export(to:as:), 0, 0);
}

uint64_t closure #1 in AVAssetExportSession.export(to:as:)partial apply()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = closure #1 in AVAssetExportSession.export(to:as:)partial apply;
  v3[16] = v2;
  return MEMORY[0x270FA2498](closure #1 in AVAssetExportSession.export(to:as:), 0, 0);
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id AVAssetExportSession.states(updateInterval:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  *(void *)a1 = v2;
  *(double *)(a1 + 8) = a2;
  return v2;
}

void *initializeBufferWithCopyOfBuffer for AVAssetExportSession.State(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for AVAssetExportSession.State(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for AVAssetExportSession.State(void **a1, void **a2)
{
  uint64_t v3 = *a1;
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
  *id result = *a2;
  return result;
}

void **assignWithTake for AVAssetExportSession.State(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetExportSession.State(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AVAssetExportSession.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)id result = 0;
    *(_DWORD *)id result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)id result = a2 + 1;
    }
  }
  return result;
}

uint64_t getEnumTag for AVAssetExportSession.State(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *destructiveInjectEnumTag for AVAssetExportSession.State(void *result, int a2)
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
  *id result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AVAssetExportSession.State()
{
  return &type metadata for AVAssetExportSession.State;
}

unint64_t lazy protocol witness table accessor for type AVAssetExportSession.ProgressStates and conformance AVAssetExportSession.ProgressStates()
{
  unint64_t result = lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates and conformance AVAssetExportSession.ProgressStates;
  if (!lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates and conformance AVAssetExportSession.ProgressStates)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates and conformance AVAssetExportSession.ProgressStates);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AVAssetExportSession.ProgressStates(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for AVAssetExportSession.ProgressStates(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for AVAssetExportSession.ProgressStates(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetExportSession.ProgressStates(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AVAssetExportSession.ProgressStates(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void *type metadata accessor for AVAssetExportSession.ProgressStates()
{
  return &unk_26C3C0B88;
}

unint64_t lazy protocol witness table accessor for type AVAssetExportSession.ProgressStates.Iterator and conformance AVAssetExportSession.ProgressStates.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates.Iterator and conformance AVAssetExportSession.ProgressStates.Iterator;
  if (!lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates.Iterator and conformance AVAssetExportSession.ProgressStates.Iterator)
  {
    type metadata accessor for AVAssetExportSession.ProgressStates.Iterator(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates.Iterator and conformance AVAssetExportSession.ProgressStates.Iterator);
  }
  return result;
}

uint64_t type metadata accessor for AVAssetExportSession.ProgressStates.Iterator(uint64_t a1)
{
  return type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(a1, (uint64_t *)&type metadata singleton initialization cache for AVAssetExportSession.ProgressStates.Iterator);
}

uint64_t AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = (char *)a3;
  uint64_t v47 = a2;
  uint64_t v4 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v45 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v44 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  MEMORY[0x270FA5388](v10 - 8);
  char v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Date();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = [a1 sel_status];
  switch((unint64_t)v17)
  {
    case 0uLL:

      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v47, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      id v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
      uint64_t v20 = v23;
      uint64_t v21 = (uint64_t)v46;
      uint64_t v22 = 1;
      goto LABEL_7;
    case 1uLL:

      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v47, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      id v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
      uint64_t v20 = v24;
      uint64_t v21 = (uint64_t)v46;
      uint64_t v22 = 2;
      goto LABEL_7;
    case 2uLL:
      outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v47, (uint64_t)v12, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4) == 1)
      {
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v12, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
LABEL_12:
        id v28 = [self progressWithTotalUnitCount:0x7FFFFE0000000000];
        [v28 setKind:*MEMORY[0x263F084A0]];
        SendableExportSession.outputURLRequiringExportingStatus.getter(a1, (uint64_t)v9);
        URL._bridgeToObjectiveC()(v29);
        unint64_t v31 = v30;
        (*(void (**)(char *, uint64_t))(v44 + 8))(v9, v7);
        [v28 setFileURL:v31];

        [v28 setPausable:0];
        [v28 setCancellable:1];
        uint64_t v32 = swift_allocObject();
        *(void *)(v32 + 16) = a1;
        uint64_t v52 = partial apply for closure #1 in AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:);
        uint64_t v53 = v32;
        uint64_t aBlock = MEMORY[0x263EF8330];
        unint64_t v49 = 1107296256;
        v50 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        v51 = &block_descriptor_7;
        uint64_t v33 = _Block_copy(&aBlock);
        id v34 = a1;
        swift_release();
        [v28 setCancellationHandler:v33];
        _Block_release(v33);
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
        uint64_t v36 = *(int *)(v35 + 48);
        uint64_t v37 = (uint64_t)v45;
        static Date.now.getter();

        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v47, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
        *(void *)(v37 + v36) = v28;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v37, 0, 3, v35);
        return outlined init with take of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v37, (uint64_t)v46);
      }
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      uint64_t v27 = *(void *)(v26 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v12, 3, v26))
      {
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal((uint64_t)v12);
        goto LABEL_12;
      }

      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v47, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      uint64_t v38 = *(void *)&v12[*(int *)(v26 + 48)];
      uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      v39(v16, v12, v13);
      uint64_t v40 = *(int *)(v26 + 48);
      uint64_t v41 = (uint64_t)v46;
      v39(v46, v16, v13);
      *(void *)(v41 + v40) = v38;
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(v41, 0, 3, v26);
    case 3uLL:
    case 4uLL:
    case 5uLL:

      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v47, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      id v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
      uint64_t v20 = v18;
      uint64_t v21 = (uint64_t)v46;
      uint64_t v22 = 3;
LABEL_7:
      return v19(v21, v22, 3, v20);
    default:
      uint64_t aBlock = 0;
      unint64_t v49 = 0xE000000000000000;
      _StringGuts.grow(_:)(24);
      v42._object = (void *)0x80000002128B5FE0;
      v42._countAndFlagsBits = 0xD000000000000016;
      String.append(_:)(v42);
      id v54 = v17;
      type metadata accessor for AVAssetExportSessionStatus(0);
      _print_unlocked<A, B>(_:_:)();
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      JUMPOUT(0x2128A73F0);
  }
}

uint64_t SendableExportSession.outputURLRequiringExportingStatus.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_status) != (id)2)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v11 = [a1 sel_outputURL];
  if (!v11)
  {
LABEL_6:
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
    goto LABEL_7;
  }
  char v12 = v11;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v10, v7, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
  if (result != 1) {
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v13)(a2, v10, v4);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t AVAssetExportSession.ProgressStates.Iterator.next()(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = type metadata accessor for Date();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](AVAssetExportSession.ProgressStates.Iterator.next(), 0, 0);
}

uint64_t AVAssetExportSession.ProgressStates.Iterator.next()()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void ***)(v0 + 24);
  uint64_t v5 = *v4;
  uint64_t v6 = *(int *)(type metadata accessor for AVAssetExportSession.ProgressStates.Iterator(0) + 24);
  *(_DWORD *)(v0 + 168) = v6;
  uint64_t v7 = (uint64_t)v4 + v6;
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v7, v3, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)(v5, v3, v2);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  *(void *)(v0 + 136) = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  *(void *)(v0 + 144) = v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v1, 3, 3, v8);
  LOBYTE(v2) = specialized static AVAssetExportSession.ProgressStates.Iterator.StateInternal.== infix(_:_:)(v2, v1);
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v1);
  if (v2) {
    goto LABEL_4;
  }
  uint64_t v10 = *(void *)(v0 + 80);
  uint64_t v11 = *(void *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 64);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v7, v12, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v12, 1, v10) == 1)
  {
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(*(void *)(v0 + 64), &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    if (static Task<>.isCancelled.getter())
    {
LABEL_4:
      uint64_t v13 = *(void **)(v0 + 16);
      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 128));
      *uint64_t v13 = 2;
LABEL_20:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
      return v43();
    }
LABEL_9:
    uint64_t v18 = *(void *)(v0 + 136);
    uint64_t v19 = *(void *)(v0 + 144);
    uint64_t v20 = *(void *)(v0 + 104);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 128), v20);
    uint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
    if (v21(v20, 3, v18))
    {
      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 104));
    }
    else
    {
      uint64_t v23 = *(void *)(v0 + 40);
      uint64_t v22 = *(void *)(v0 + 48);
      id v25 = *(id **)(v0 + 24);
      uint64_t v24 = *(void *)(v0 + 32);
      uint64_t v26 = *(void **)(*(void *)(v0 + 104) + *(int *)(*(void *)(v0 + 136) + 48));
      (*(void (**)(uint64_t))(v23 + 32))(v22);
      [*v25 sel_progress];
      specialized static AVAssetExportSession.ProgressStates.Iterator.updateProgress(_:exportProgress:exportingStartDate:)(v26, v27);

      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    }
    uint64_t v28 = *(void *)(v0 + 128);
    uint64_t v29 = *(void *)(v0 + 136);
    uint64_t v31 = *(void *)(v0 + 88);
    uint64_t v30 = *(void *)(v0 + 96);
    uint64_t v32 = *(void *)(v0 + 80);
    uint64_t v33 = *(void *)(v0 + 24) + *(int *)(v0 + 168);
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v33, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v28, v33);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 56))(v33, 0, 1, v32);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v28, v30);
    unsigned int v34 = v21(v30, 3, v29);
    uint64_t v35 = 0;
    switch(v34)
    {
      case 1u:
        break;
      case 2u:
        uint64_t v35 = 1;
        break;
      case 3u:
        uint64_t v35 = 2;
        break;
      default:
        uint64_t v35 = *(void *)(*(void *)(v0 + 96) + *(int *)(*(void *)(v0 + 136) + 48));
        (*(void (**)(void))(*(void *)(v0 + 40) + 8))();
        break;
    }
    uint64_t v42 = *(void *)(v0 + 128);
    **(void **)(v0 + 16) = v35;
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v42);
    goto LABEL_20;
  }
  uint64_t v14 = *(void *)(v0 + 128);
  uint64_t v15 = *(void *)(v0 + 112);
  outlined init with take of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 64), v15);
  if ((specialized static AVAssetExportSession.ProgressStates.Iterator.StateInternal.== infix(_:_:)(v14, v15) & 1) == 0)
  {
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 112));
    if (static Task<>.isCancelled.getter()) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  if (static Task<>.isCancelled.getter())
  {
    uint64_t v16 = *(void *)(v0 + 128);
    id v17 = *(void **)(v0 + 16);
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 112));
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v16);
    *id v17 = 2;
    goto LABEL_20;
  }
  uint64_t v36 = *(void *)(v0 + 112);
  uint64_t v37 = *(void *)(v0 + 56);
  uint64_t v38 = *(uint64_t **)(v0 + 24);
  Date.init(timeIntervalSinceNow:)();
  uint64_t v39 = *v38;
  uint64_t v40 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v40;
  _OWORD v40[2] = v39;
  v40[3] = v36;
  v40[4] = v37;
  uint64_t v41 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v41;
  *uint64_t v41 = v0;
  v41[1] = AVAssetExportSession.ProgressStates.Iterator.next();
  return MEMORY[0x270FA2158]();
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](AVAssetExportSession.ProgressStates.Iterator.next(), 0, 0);
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
  void **v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  void *v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(void);
  uint64_t v32;

  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 32);
  uint64_t v7 = *(void *)(v0 + 40);
  uint64_t v8 = *(void ***)(v0 + 24);
  uint64_t v9 = *v8;
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v8 + *(int *)(v0 + 168), v4, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)(v9, v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v3);
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v2);
  outlined init with take of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v1, v2);
  if (static Task<>.isCancelled.getter())
  {
    uint64_t v10 = *(void **)(v0 + 16);
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 128));
    char *v10 = 2;
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 136);
    uint64_t v12 = *(void *)(v0 + 144);
    uint64_t v13 = *(void *)(v0 + 104);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 128), v13);
    uint64_t v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    if (v14(v13, 3, v11))
    {
      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 104));
    }
    else
    {
      uint64_t v16 = *(void *)(v0 + 40);
      uint64_t v15 = *(void *)(v0 + 48);
      uint64_t v18 = *(id **)(v0 + 24);
      id v17 = *(void *)(v0 + 32);
      uint64_t v19 = *(void **)(*(void *)(v0 + 104) + *(int *)(*(void *)(v0 + 136) + 48));
      (*(void (**)(uint64_t))(v16 + 32))(v15);
      [*v18 sel_progress];
      specialized static AVAssetExportSession.ProgressStates.Iterator.updateProgress(_:exportProgress:exportingStartDate:)(v19, v20);

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    }
    uint64_t v21 = *(void *)(v0 + 128);
    uint64_t v22 = *(void *)(v0 + 136);
    uint64_t v24 = *(void *)(v0 + 88);
    uint64_t v23 = *(void *)(v0 + 96);
    id v25 = *(void *)(v0 + 80);
    uint64_t v26 = *(void *)(v0 + 24) + *(int *)(v0 + 168);
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v26, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v21, v26);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v26, 0, 1, v25);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v21, v23);
    float v27 = v14(v23, 3, v22);
    uint64_t v28 = 0;
    switch(v27)
    {
      case 1u:
        break;
      case 2u:
        uint64_t v28 = 1;
        break;
      case 3u:
        uint64_t v28 = 2;
        break;
      default:
        uint64_t v28 = *(void *)(*(void *)(v0 + 96) + *(int *)(*(void *)(v0 + 136) + 48));
        (*(void (**)(void))(*(void *)(v0 + 40) + 8))();
        break;
    }
    uint64_t v29 = *(void *)(v0 + 128);
    **(void **)(v0 + 16) = v28;
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v29);
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
  uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  v5[2] = a2;
  v5[3] = a3;
  uint64_t v6 = type metadata accessor for Date();
  v5[6] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[7] = v7;
  v5[8] = *(void *)(v7 + 64);
  v5[9] = swift_task_alloc();
  uint64_t v8 = *(void *)(type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0) - 8);
  v5[10] = v8;
  v5[11] = *(void *)(v8 + 64);
  v5[12] = swift_task_alloc();
  v5[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v5[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:), 0, 0);
}

uint64_t closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)()
{
  uint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  uint64_t v4 = v0[11];
  uint64_t v3 = v0[12];
  uint64_t v5 = v0[10];
  uint64_t v7 = (void *)v0[3];
  uint64_t v6 = v0[4];
  uint64_t v8 = type metadata accessor for TaskPriority();
  id v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  uint64_t v26 = v8;
  v25(v1, 1, 1);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v6, v2);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v10 = (v4 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  outlined init with take of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v2, v11 + v9);
  *(void *)(v11 + v10) = v7;
  id v12 = v7;
  _sScG7addTask8priority9operationyScPSg_xyYaYAcntFyt_Tg5(v1, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:), v11);
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v1, &demangling cache variable for type metadata for TaskPriority?);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v6, v3);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v3, 3, v13))
  {
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v0[12]);
  }
  else
  {
    uint64_t v14 = v0[14];
    uint64_t v15 = v0[12];
    uint64_t v16 = v0[9];
    uint64_t v18 = v0[6];
    uint64_t v17 = v0[7];
    uint64_t v19 = v0[5];

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v18);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v25)(v14, 1, 1, v26);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v19, v18);
    unint64_t v20 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = 0;
    *(void *)(v21 + 24) = 0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 32))(v21 + v20, v16, v18);
    _sScG7addTask8priority9operationyScPSg_xyYaYAcntFyt_Tg5(v14, (uint64_t)&async function pointer to partial apply for closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:), v21);
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v14, &demangling cache variable for type metadata for TaskPriority?);
  }
  uint64_t v22 = (void *)swift_task_alloc();
  v0[15] = v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskGroup<()>);
  *uint64_t v22 = v0;
  v22[1] = closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:);
  return MEMORY[0x270FA1E58](v0 + 16, 0, 0, v23);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return MEMORY[0x270FA2498](closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:), 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  MEMORY[0x2166846A0](**(void **)(v0 + 16), MEMORY[0x263F8EE60] + 8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t closure #1 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v8;
  *uint64_t v8 = v5;
  v8[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  return specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(a4, a5);
}

uint64_t _sScG7addTask8priority9operationyScPSg_xyYaYAcntFyt_Tg5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(a1, (uint64_t)v10, &demangling cache variable for type metadata for TaskPriority?);
  uint64_t v11 = type metadata accessor for TaskPriority();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v10, &demangling cache variable for type metadata for TaskPriority?);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  uint64_t v18 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    uint64_t v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  void v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:), 0, 0);
}

uint64_t closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)()
{
  uint64_t v1 = Date.nanosecondsSinceNow.getter();
  uint64_t v2 = 0x3FFFFFFFFFFFFFFFLL;
  if (v1 < 0x3FFFFFFFFFFFFFFFLL) {
    uint64_t v2 = v1;
  }
  uint64_t v3 = v2 & ~(v2 >> 63);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v4;
  *uint64_t v4 = v0;
  v4[1] = closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:);
  return MEMORY[0x270FA1FF0](v3);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:), 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t Date.nanosecondsSinceNow.getter()
{
  Date.timeIntervalSinceNow.getter();
  if (v0 <= 0.0) {
    unint64_t v1 = 0x8000000000000400;
  }
  else {
    unint64_t v1 = 0x7FFFFFFFFFFFFC00;
  }
  Date.timeIntervalSinceNow.getter();
  if ((~v2 & 0x7FF0000000000000) == 0) {
    return v1;
  }
  uint64_t result = Date.timeIntervalSinceNow.getter();
  double v5 = v4 * 1000000000.0;
  if (v5 >= 9.22337204e18 || v5 <= -9.22337204e18) {
    return v1;
  }
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v5 < 9.22337204e18) {
    return (uint64_t)v5;
  }
LABEL_16:
  __break(1u);
  return result;
}

void closure #1 in static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation.YieldResult);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((unint64_t)(a1 - 3) <= 2) {
    AsyncStream.Continuation.finish()();
  }
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetExportSession.ProgressStates.Iterator(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetExportSession.ProgressStates.Iterator;
  return AVAssetExportSession.ProgressStates.Iterator.next()(a1);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetExportSession.ProgressStates.Iterator()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _sSo20AVAssetExportSessionC12AVFoundationE14ProgressStates33_D1D93B46B4622E2FDA3EC9B1BC7A64BDLLV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = _sSo20AVAssetExportSessionC12AVFoundationE14ProgressStates33_D1D93B46B4622E2FDA3EC9B1BC7A64BDLLV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return AVAssetExportSession.ProgressStates.Iterator.next()(a1);
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVAssetExportSession.ProgressStates@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = (char *)a1 + *(int *)(type metadata accessor for AVAssetExportSession.ProgressStates.Iterator(0) + 24);
  uint64_t v6 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1)
{
  return type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(a1, (uint64_t *)&type metadata singleton initialization cache for AVAssetExportSession.ProgressStates.Iterator.StateInternal);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sSo20AVAssetExportSessionC12AVFoundationE14ProgressStates33_D1D93B46B4622E2FDA3EC9B1BC7A64BDLLV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return v6(a1);
}

uint64_t specialized static AVAssetExportSession.ProgressStates.Iterator.StateInternal.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AVAssetExportSession.ProgressStates.Iterator.StateInternal, AVAssetExportSession.ProgressStates.Iterator.StateInternal));
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(a1, (uint64_t)v14);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(a2, v15);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  uint64_t v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  switch(v17((uint64_t)v14, 3, v16))
  {
    case 1u:
      if (v17(v15, 3, v16) != 1) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 2u:
      if (v17(v15, 3, v16) != 2) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 3u:
      if (v17(v15, 3, v16) != 3) {
        goto LABEL_9;
      }
LABEL_5:
      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal((uint64_t)v14);
      char v19 = 1;
      return v19 & 1;
    default:
      outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal((uint64_t)v14, (uint64_t)v10);
      uint64_t v18 = *(int *)(v16 + 48);
      id v26 = *(id *)&v10[v18];
      if (v17(v15, 3, v16))
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_9:
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v14, &demangling cache variable for type metadata for (AVAssetExportSession.ProgressStates.Iterator.StateInternal, AVAssetExportSession.ProgressStates.Iterator.StateInternal));
        goto LABEL_10;
      }
      uint64_t v21 = *(void **)(v15 + v18);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
      char v22 = static Date.== infix(_:_:)();
      uint64_t v23 = *(void (**)(char *, uint64_t))(v5 + 8);
      v23(v10, v4);
      id v24 = v26;
      if ((v22 & 1) == 0)
      {
        v23(v7, v4);

        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal((uint64_t)v14);
LABEL_10:
        char v19 = 0;
        return v19 & 1;
      }
      type metadata accessor for NSObject();
      char v19 = static NSObject.== infix(_:_:)();

      v23(v7, v4);
      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal((uint64_t)v14);
      return v19 & 1;
  }
}

uint64_t outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id specialized static AVAssetExportSession.ProgressStates.Iterator.updateProgress(_:exportProgress:exportingStartDate:)(void *a1, float a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [a1 totalUnitCount];
  float v9 = (float)(uint64_t)result * a2;
  if ((~LODWORD(v9) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v9 <= -9.2234e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v9 >= 9.2234e18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  [a1 setCompletedUnitCount:(uint64_t)v9];
  static Date.now.getter();
  Date.timeIntervalSince(_:)();
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (a2 > 0.0) {
    return (id)NSProgress.estimatedTimeRemaining.setter();
  }
  return result;
}

uint64_t outlined init with take of AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  float v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *float v9 = v3;
  v9[1] = closure #1 in AVAssetExportSession.export(to:as:)partial apply;
  return closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)(a1, a2, v6, v7, v8);
}

uint64_t sub_2128A9868()
{
  uint64_t v1 = *(void *)(type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 3, v5))
  {
    uint64_t v6 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = v7 + 8;

  return MEMORY[0x270FA0238](v0, v8, v2 | 7);
}

uint64_t partial apply for closure #1 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)()
{
  uint64_t v2 = *(void *)(type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0 + v3;
  uint64_t v5 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  unint64_t v7 = (void *)swift_task_alloc();
  void v6[2] = v7;
  *unint64_t v7 = v6;
  v7[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  return specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(v4, v5);
}

uint64_t sub_2128A9B00()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)()
{
  uint64_t v2 = *(void *)(type metadata accessor for Date() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  v4[2] = v3;
  return MEMORY[0x270FA2498](closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:), 0, 0);
}

uint64_t outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2128A9D10()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRyt_Tg5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRyt_Tg5Tu);
  return v6(a1, v4);
}

uint64_t specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(uint64_t a1, uint64_t a2)
{
  v2[5] = a1;
  v2[6] = a2;
  uint64_t v3 = type metadata accessor for Date();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AVAssetExportSession.ProgressStates.Iterator.StateInternal, AVAssetExportSession.ProgressStates.Iterator.StateInternal));
  v2[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  v2[12] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Iterator);
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation.BufferingPolicy);
  v2[16] = v5;
  v2[17] = *(void *)(v5 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation);
  v2[19] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[20] = v7;
  v2[21] = *(void *)(v7 + 64);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>);
  v2[24] = v8;
  v2[25] = *(void *)(v8 - 8);
  v2[26] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  v2[27] = v9;
  v2[28] = *(void *)(v9 - 8);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:), 0, 0);
}

uint64_t specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)()
{
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 256);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 40), v2);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  *(void *)(v0 + 264) = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  *(void *)(v0 + 272) = v4;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v1, 3, 3, v3);
  char v5 = specialized static AVAssetExportSession.ProgressStates.Iterator.StateInternal.== infix(_:_:)(v2, v1);
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v1);
  uint64_t v6 = outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v2);
  if (v5)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 184);
    uint64_t v23 = *(void *)(v0 + 176);
    uint64_t v11 = *(void *)(v0 + 160);
    uint64_t v13 = *(void *)(v0 + 144);
    uint64_t v12 = *(void *)(v0 + 152);
    uint64_t v15 = *(void *)(v0 + 128);
    uint64_t v14 = *(void *)(v0 + 136);
    uint64_t v16 = *(void **)(v0 + 48);
    type metadata accessor for AVAssetExportSessionStatus(0);
    (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, *MEMORY[0x263F8F580], v15);
    static AsyncStream.makeStream(of:bufferingPolicy:)();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v23, v10, v12);
    unint64_t v17 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v18 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v11 + 32))(v18 + v17, v23, v12);
    *(void *)(v0 + 32) = v16;
    swift_getKeyPath();
    char v19 = (void *)swift_allocObject();
    v19[2] = partial apply for closure #1 in static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:);
    void v19[3] = v18;
    v19[4] = v16;
    id v20 = v16;
    swift_retain();
    *(void *)(v0 + 280) = _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
    swift_release();
    swift_release();

    swift_release();
    AsyncStream.makeAsyncIterator()();
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v21;
    *uint64_t v21 = v0;
    v21[1] = specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:);
    uint64_t v9 = *(void *)(v0 + 104);
    uint64_t v6 = v0 + 16;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  return MEMORY[0x270FA1F68](v6, v7, v8, v9);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return MEMORY[0x270FA2498](specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:), 0, 0);
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
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(void);
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;

  if (*(unsigned char *)(v0 + 24))
  {
LABEL_15:
    uint64_t v23 = *(void **)(v0 + 280);
    uint64_t v24 = *(void *)(v0 + 200);
    uint64_t v25 = *(void *)(v0 + 208);
    uint64_t v27 = *(void *)(v0 + 184);
    id v26 = *(void *)(v0 + 192);
    uint64_t v29 = *(void *)(v0 + 152);
    uint64_t v28 = *(void *)(v0 + 160);
    (*(void (**)(void, void))(*(void *)(v0 + 112) + 8))(*(void *)(v0 + 120), *(void *)(v0 + 104));
    dispatch thunk of NSKeyValueObservation.invalidate()();

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
    return v30();
  }
  else
  {
    uint64_t v1 = *(void *)(v0 + 272);
    uint64_t v42 = *(void *)(v0 + 264);
    uint64_t v2 = *(void *)(v0 + 240);
    uint64_t v3 = *(void *)(v0 + 216);
    uint64_t v4 = *(void *)(v0 + 224);
    uint64_t v6 = *(void *)(v0 + 88);
    char v5 = *(void *)(v0 + 96);
    uint64_t v7 = *(void *)(v0 + 80);
    uint64_t v9 = *(void *)(v0 + 40);
    uint64_t v8 = *(void **)(v0 + 48);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v9, v5);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v5, 0, 1, v3);
    AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)(v8, v5, v2);
    uint64_t v10 = v6 + *(int *)(v7 + 48);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v2, v6);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v9, v10);
    uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
    switch(v11(v6, 3, v42))
    {
      case 1u:
        if (v11(v10, 3, *(void *)(v0 + 264)) == 1) {
          goto LABEL_10;
        }
        goto LABEL_13;
      case 2u:
        if (v11(v10, 3, *(void *)(v0 + 264)) != 2) {
          goto LABEL_13;
        }
        goto LABEL_10;
      case 3u:
        if (v11(v10, 3, *(void *)(v0 + 264)) == 3) {
          goto LABEL_10;
        }
        goto LABEL_13;
      default:
        uint64_t v12 = *(void *)(v0 + 264);
        uint64_t v13 = *(void *)(v0 + 232);
        outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 88), v13);
        uint64_t v14 = *(int *)(v12 + 48);
        uint64_t v15 = *(void **)(v13 + v14);
        uint64_t v16 = v11(v10, 3, v12);
        unint64_t v17 = *(void *)(v0 + 232);
        if (v16)
        {
          char v19 = *(void *)(v0 + 56);
          uint64_t v18 = *(void *)(v0 + 64);

          (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
LABEL_13:
          outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(*(void *)(v0 + 88), &demangling cache variable for type metadata for (AVAssetExportSession.ProgressStates.Iterator.StateInternal, AVAssetExportSession.ProgressStates.Iterator.StateInternal));
          goto LABEL_14;
        }
        uint64_t v31 = *(void *)(v0 + 64);
        uint64_t v32 = *(void *)(v0 + 56);
        uint64_t v33 = *(void **)(v10 + v14);
        (*(void (**)(void, uint64_t, uint64_t))(v31 + 32))(*(void *)(v0 + 72), v10, v32);
        unsigned int v34 = static Date.== infix(_:_:)();
        uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
        v35(v17, v32);
        if ((v34 & 1) == 0)
        {
          uint64_t v40 = *(void *)(v0 + 88);
          v35(*(void *)(v0 + 72), *(void *)(v0 + 56));

          uint64_t v39 = v40;
          goto LABEL_22;
        }
        uint64_t v36 = *(void *)(v0 + 72);
        uint64_t v37 = *(void *)(v0 + 56);
        type metadata accessor for NSObject();
        uint64_t v38 = static NSObject.== infix(_:_:)();

        v35(v36, v37);
        if ((v38 & 1) == 0)
        {
          uint64_t v39 = *(void *)(v0 + 88);
LABEL_22:
          outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v39);
LABEL_14:
          outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 240));
          goto LABEL_15;
        }
LABEL_10:
        id v20 = *(void *)(v0 + 240);
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(void *)(v0 + 88));
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v20);
        uint64_t v21 = (void *)swift_task_alloc();
        *(void *)(v0 + 288) = v21;
        *uint64_t v21 = v0;
        v21[1] = specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:);
        char v22 = *(void *)(v0 + 104);
        id result = MEMORY[0x270FA1F68](v0 + 16, 0, 0, v22);
        break;
    }
  }
  return result;
}

uint64_t sub_2128AA9E0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void partial apply for closure #1 in static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation);

  closure #1 in static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(a1);
}

char *keypath_get_selector_status()
{
  return sel_status;
}

id sub_2128AAAF4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 sel_status];
  *a2 = result;
  return result;
}

uint64_t sub_2128AAB28()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in SendableExportSession.onInitialAndChangedStatus(execute:)()
{
  return (*(uint64_t (**)(id))(v0 + 16))([*(id *)(v0 + 32) sel_status]);
}

uint64_t sub_2128AABAC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id partial apply for closure #1 in AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)()
{
  return [*(id *)(v0 + 16) cancelExport];
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t *initializeBufferWithCopyOfBuffer for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = type metadata accessor for Date();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      uint64_t v11 = *(int *)(v7 + 48);
      uint64_t v12 = *(void **)((char *)a2 + v11);
      *(uint64_t *)((char *)a1 + v11) = (uint64_t)v12;
      uint64_t v13 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56);
      id v14 = v12;
      v13(a1, 0, 3, v7);
    }
  }
  return a1;
}

void destroy for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 3, v2))
  {
    uint64_t v3 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    uint64_t v4 = *(void **)(a1 + *(int *)(v2 + 48));
  }
}

char *initializeWithCopy for AVAssetExportSession.ProgressStates.Iterator.StateInternal(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    uint64_t v9 = *(int *)(v6 + 48);
    uint64_t v10 = *(void **)&a2[v9];
    *(void *)&a1[v9] = v10;
    uint64_t v11 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
    id v12 = v10;
    v11(a1, 0, 3, v6);
  }
  return a1;
}

char *assignWithCopy for AVAssetExportSession.ProgressStates.Iterator.StateInternal(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v17 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(a1, a2, v17);
      uint64_t v18 = *(int *)(v6 + 48);
      char v19 = *(void **)&a2[v18];
      id v20 = *(void **)&a1[v18];
      *(void *)&a1[v18] = v19;
      id v21 = v19;

      return a1;
    }
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)a1, &demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  uint64_t v12 = *(int *)(v6 + 48);
  uint64_t v13 = *(void **)&a2[v12];
  *(void *)&a1[v12] = v13;
  id v14 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
  id v15 = v13;
  v14(a1, 0, 3, v6);
  return a1;
}

uint64_t outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for AVAssetExportSession.ProgressStates.Iterator.StateInternal(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    *(void *)&a1[*(int *)(v6 + 48)] = *(void *)&a2[*(int *)(v6 + 48)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

char *assignWithTake for AVAssetExportSession.ProgressStates.Iterator.StateInternal(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      uint64_t v14 = *(int *)(v6 + 48);
      id v15 = *(void **)&a1[v14];
      *(void *)&a1[v14] = *(void *)&a2[v14];

      return a1;
    }
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)a1, &demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  *(void *)&a1[*(int *)(v6 + 48)] = *(void *)&a2[*(int *)(v6 + 48)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2128AB4D8);
}

uint64_t sub_2128AB4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2128AB55C);
}

uint64_t sub_2128AB55C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t getEnumTag for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 3, v2);
}

uint64_t destructiveInjectEnumTag for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 3, v4);
}

uint64_t type metadata completion function for AVAssetExportSession.ProgressStates.Iterator.StateInternal()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for AVAssetExportSession.ProgressStates.Iterator(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    uint64_t v12 = v4;
    if (v11(v8, 1, v9))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 3, v14))
      {
        memcpy(v7, v8, *(void *)(v10 + 64));
      }
      else
      {
        uint64_t v16 = type metadata accessor for Date();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v7, v8, v16);
        uint64_t v17 = *(int *)(v14 + 48);
        uint64_t v18 = *(void **)&v8[v17];
        *(void *)&v7[v17] = v18;
        char v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56);
        id v20 = v18;
        v19(v7, 0, 3, v14);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v5;
}

void destroy for AVAssetExportSession.ProgressStates.Iterator(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v4, 3, v6))
    {
      uint64_t v7 = type metadata accessor for Date();
      (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v4, v7);
      uint64_t v8 = *(void **)&v4[*(int *)(v6 + 48)];
    }
  }
}

void *initializeWithCopy for AVAssetExportSession.ProgressStates.Iterator(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  id v12 = v5;
  if (v11(v8, 1, v9))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 3, v14))
    {
      memcpy(v7, v8, *(void *)(v10 + 64));
    }
    else
    {
      uint64_t v16 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v7, v8, v16);
      uint64_t v17 = *(int *)(v14 + 48);
      uint64_t v18 = *(void **)&v8[v17];
      *(void *)&v7[v17] = v18;
      char v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56);
      id v20 = v18;
      v19(v7, 0, 3, v14);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithCopy for AVAssetExportSession.ProgressStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      uint64_t v21 = *(void *)(v20 - 8);
      char v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
      int v23 = v22(v10, 3, v20);
      int v24 = v22(v11, 3, v20);
      if (v23)
      {
        if (!v24)
        {
          uint64_t v25 = type metadata accessor for Date();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v10, v11, v25);
          uint64_t v26 = *(int *)(v20 + 48);
          uint64_t v27 = *(void **)&v11[v26];
          *(void *)&v10[v26] = v27;
          uint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56);
          id v29 = v27;
          v28(v10, 0, 3, v20);
          return a1;
        }
      }
      else
      {
        if (!v24)
        {
          uint64_t v36 = type metadata accessor for Date();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 24))(v10, v11, v36);
          uint64_t v37 = *(int *)(v20 + 48);
          uint64_t v38 = *(void **)&v11[v37];
          uint64_t v39 = *(void **)&v10[v37];
          *(void *)&v10[v37] = v38;
          id v40 = v38;

          return a1;
        }
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v10, &demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      }
      size_t v19 = *(void *)(v13 + 64);
      goto LABEL_8;
    }
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal((uint64_t)v10);
LABEL_7:
    size_t v19 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?)
                                - 8)
                    + 64);
LABEL_8:
    memcpy(v10, v11, v19);
    return a1;
  }
  if (v16) {
    goto LABEL_7;
  }
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 3, v17))
  {
    memcpy(v10, v11, *(void *)(v13 + 64));
  }
  else
  {
    uint64_t v30 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v10, v11, v30);
    uint64_t v31 = *(int *)(v17 + 48);
    uint64_t v32 = *(void **)&v11[v31];
    *(void *)&v10[v31] = v32;
    uint64_t v33 = *(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56);
    id v34 = v32;
    v33(v10, 0, 3, v17);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

_OWORD *initializeWithTake for AVAssetExportSession.ProgressStates.Iterator(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 3, v10))
    {
      memcpy(v5, v6, *(void *)(v8 + 64));
    }
    else
    {
      uint64_t v12 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v5, v6, v12);
      *(void *)&v5[*(int *)(v10 + 48)] = *(void *)&v6[*(int *)(v10 + 48)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v5, 0, 3, v10);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for AVAssetExportSession.ProgressStates.Iterator(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
      int v21 = v20(v8, 3, v18);
      int v22 = v20(v9, 3, v18);
      if (v21)
      {
        if (!v22)
        {
          uint64_t v23 = type metadata accessor for Date();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v8, v9, v23);
          *(void *)&v8[*(int *)(v18 + 48)] = *(void *)&v9[*(int *)(v18 + 48)];
          (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v8, 0, 3, v18);
          return a1;
        }
      }
      else
      {
        if (!v22)
        {
          uint64_t v26 = type metadata accessor for Date();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 40))(v8, v9, v26);
          uint64_t v27 = *(int *)(v18 + 48);
          uint64_t v28 = *(void **)&v8[v27];
          *(void *)&v8[v27] = *(void *)&v9[v27];

          return a1;
        }
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v8, &demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      }
      size_t v17 = *(void *)(v11 + 64);
      goto LABEL_8;
    }
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal((uint64_t)v8);
LABEL_7:
    size_t v17 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?)
                                - 8)
                    + 64);
LABEL_8:
    memcpy(v8, v9, v17);
    return a1;
  }
  if (v14) {
    goto LABEL_7;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 3, v15))
  {
    memcpy(v8, v9, *(void *)(v11 + 64));
  }
  else
  {
    uint64_t v24 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v8, v9, v24);
    *(void *)&v8[*(int *)(v15 + 48)] = *(void *)&v9[*(int *)(v15 + 48)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v8, 0, 3, v15);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetExportSession.ProgressStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2128AC610);
}

uint64_t sub_2128AC610(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AVAssetExportSession.ProgressStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2128AC6D8);
}

void *sub_2128AC6D8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for AVAssetExportSession.ProgressStates.Iterator()
{
  type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal?()
{
  if (!lazy cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?)
  {
    type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    }
  }
}

void *type metadata accessor for SendableExportSession()
{
  return &unk_26C3C0B40;
}

uint64_t specialized AVAsynchronousKeyValueLoading.status<A>(of:)(void *a1)
{
  void (*v14)(id *__return_ptr, id *);
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t v27;

  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = type metadata accessor for CancellationError();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[2];
  uint64_t v8 = (void *)a1[3];
  uint64_t v9 = (void *)MEMORY[0x216684570](v7, v8);
  uint64_t v25 = 0;
  id v10 = [v1 statusOfValueForKey:v9 error:&v25];

  id v11 = v25;
  switch((unint64_t)v10)
  {
    case 0uLL:
      return 0;
    case 1uLL:
      return 1;
    case 2uLL:
      int v14 = (void (*)(id *__return_ptr, id *))a1[4];
      uint64_t v24 = v1;
      uint64_t v15 = v25;
      v14(&v25, &v24);

      return (uint64_t)v25;
    case 3uLL:
      if (v25) {
        return (uint64_t)v25;
      }
      uint64_t v16 = (id)AVLocalizedError();
      if (v16) {
        return (uint64_t)v16;
      }
      goto LABEL_16;
    case 4uLL:
      id v12 = v25;
      AVFall2022OSVersions();
      if (dyld_program_sdk_at_least())
      {
        id v13 = (id)AVLocalizedError();
        if (!v13)
        {
          __break(1u);
LABEL_16:
          __break(1u);
LABEL_17:
          uint64_t v25 = 0;
          uint64_t v26 = 0xE000000000000000;
          uint64_t v20 = v11;
          _StringGuts.grow(_:)(33);
          v21._object = (void *)0x80000002128B5AD0;
          v21._countAndFlagsBits = 0xD000000000000014;
          String.append(_:)(v21);
          uint64_t v24 = v10;
          type metadata accessor for AVKeyValueStatus(0);
          _print_unlocked<A, B>(_:_:)();
          v22._countAndFlagsBits = 0x79656B20726F6620;
          v22._object = (void *)0xE900000000000020;
          String.append(_:)(v22);
          v23._countAndFlagsBits = v7;
          v23._object = v8;
          String.append(_:)(v23);
          _assertionFailure(_:_:file:line:flags:)();
          __break(1u);
          JUMPOUT(0x2128ACC08);
        }
        uint64_t v25 = v13;
      }
      else
      {
        CancellationError.init()();
        lazy protocol witness table accessor for type CancellationError and conformance CancellationError();
        size_t v17 = (void *)swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v18, v6, v3);
        uint64_t v25 = (id)_convertErrorToNSError(_:)();
        LOBYTE(v26) = 1;
      }
      return (uint64_t)v25;
    default:
      goto LABEL_17;
  }
}

uint64_t specialized AVAsynchronousKeyValueLoading.load<A>(_:)(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return MEMORY[0x270FA2498](specialized AVAsynchronousKeyValueLoading.load<A>(_:), 0, 0);
}

uint64_t specialized AVAsynchronousKeyValueLoading.load<A>(_:)()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = (void *)v0[16];
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2128B2800;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 40) = v3;
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v0[17] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = specialized AVAsynchronousKeyValueLoading.load<A>(_:);
  uint64_t v7 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v0[13] = &block_descriptor_6_0;
  v0[14] = v7;
  [v2 loadValuesAsynchronouslyForKeys:isa completionHandler:v0 + 10];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](specialized AVAsynchronousKeyValueLoading.load<A>(_:), 0, 0);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;
  uint64_t (*v5)(void);
  uint64_t (*v7)(void);
  char v8;
  Swift::String v9;
  uint64_t v10;

  uint64_t v1 = *(void **)(v0 + 120);

  uint64_t v2 = (void *)specialized AVAsynchronousKeyValueLoading.status<A>(of:)(v1);
  uint64_t v4 = v2;
  if (v3 == 1)
  {
    swift_willThrow();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  else if (v3)
  {
    uint64_t v8 = v3;
    outlined copy of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status(v2, v3);
    _StringGuts.grow(_:)(20);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = specialized AVAsyncProperty.Status.description.getter(v4, v8, &demangling cache variable for type metadata for [AVAssetTrack], (void (*)(void *, uint64_t))outlined consume of AVAsyncProperty<AVAsset, [AVAssetTrack]>.Status);
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    return _assertionFailure(_:_:file:line:flags:)();
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t specialized closure #1 in AVAsyncProperty<>.init(key:)(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = (void *)MEMORY[0x216684570](a2, a3);
  id v7 = [a1 sel_valueForKey_:v6];

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  outlined init with take of Any?((uint64_t)v9, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  __swift_instantiateConcreteTypeFromMangledName(a4);
  swift_dynamicCast();
  return v11;
}

uint64_t specialized AVAsyncProperty.Status.description.getter(void *a1, char a2, uint64_t *a3, void (*a4)(void *, uint64_t))
{
  if (!a2)
  {
    uint64_t v18 = 0;
    swift_bridgeObjectRetain();
    v15._countAndFlagsBits = 0x2820646564616F4CLL;
    v15._object = (void *)0xE800000000000000;
    String.append(_:)(v15);
    __swift_instantiateConcreteTypeFromMangledName(a3);
    _print_unlocked<A, B>(_:_:)();
    v16._countAndFlagsBits = 41;
    v16._object = (void *)0xE100000000000000;
    String.append(_:)(v16);
    id v12 = a1;
    uint64_t v13 = 0;
    goto LABEL_5;
  }
  if (a2 == 1)
  {
    uint64_t v18 = 0x282064656C696146;
    id v6 = [a1 sel_description];
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    v10._countAndFlagsBits = v7;
    v10._object = v9;
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = 41;
    v11._object = (void *)0xE100000000000000;
    String.append(_:)(v11);
    id v12 = a1;
    uint64_t v13 = 1;
LABEL_5:
    a4(v12, v13);
    return v18;
  }
  if (a1) {
    return 0x676E6964616F4CLL;
  }
  else {
    return 0x2074657920746F4ELL;
  }
}

uint64_t AVMutableComposition.insertTimeRange(_:of:at:isolation:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v7 + 312) = a4;
  *(void *)(v7 + 320) = a5;
  *(void *)(v7 + 296) = a2;
  *(void *)(v7 + 304) = a3;
  uint64_t v8 = *a1;
  *(void *)(v7 + 328) = v6;
  *(void *)(v7 + 336) = v8;
  long long v9 = *((_OWORD *)a1 + 2);
  *(_OWORD *)(v7 + 344) = *((_OWORD *)a1 + 1);
  long long v10 = *(_OWORD *)(a1 + 1);
  *((void *)&v10 + 1) = v9;
  *(_OWORD *)(v7 + 472) = v10;
  *(void *)(v7 + 360) = a1[5];
  if (a6)
  {
    swift_getObjectType();
    uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  *(void *)(v7 + 368) = v11;
  *(void *)(v7 + 376) = v13;
  return MEMORY[0x270FA2498](AVMutableComposition.insertTimeRange(_:of:at:isolation:), v11, v13);
}

uint64_t AVMutableComposition.insertTimeRange(_:of:at:isolation:)()
{
  uint64_t v1 = swift_allocObject();
  v0[48] = v1;
  *(void *)(v1 + 16) = 0x736B63617274;
  *(void *)(v1 + 24) = 0xE600000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAsyncProperty<AVAsset, [AVAssetTrack]>);
  inited = (void *)swift_initStackObject();
  v0[49] = inited;
  inited[4] = partial apply for specialized closure #1 in AVAsyncProperty<>.init(key:);
  inited[5] = v1;
  inited[2] = 0x736B63617274;
  inited[3] = 0xE600000000000000;
  uint64_t v3 = async function pointer to specialized AVAsynchronousKeyValueLoading.load<A>(_:);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[50] = v4;
  *uint64_t v4 = v0;
  v4[1] = AVMutableComposition.insertTimeRange(_:of:at:isolation:);
  return ((uint64_t (*)(uint64_t))((char *)&async function pointer to specialized AVAsynchronousKeyValueLoading.load<A>(_:)
                                          + v3))((uint64_t)inited);
}

{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  id v17;
  uint64_t (*v18)(void);
  uint64_t v19;
  void *inited;
  id v21;
  void *v23;
  uint64_t (*v24)(void);
  uint64_t v25;

  uint64_t v1 = v0[51];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v0[53] = v2;
  uint64_t v3 = v0[51];
  if (v2)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      uint64_t v4 = (id)MEMORY[0x2166848A0](0);
    }
    else {
      uint64_t v4 = *(id *)(v3 + 32);
    }
    v0[54] = v4;
    v0[55] = 1;
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = 0xD000000000000012;
    *(void *)(v19 + 24) = 0x80000002128B6020;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>);
    inited = (void *)swift_initStackObject();
    v0[56] = inited;
    inited[4] = partial apply for specialized closure #1 in AVAsyncProperty<>.init(key:);
    inited[5] = v19;
    inited[2] = 0xD000000000000012;
    inited[3] = 0x80000002128B6020;
    return MEMORY[0x270FA2498](AVMutableComposition.insertTimeRange(_:of:at:isolation:), 0, 0);
  }
  else
  {
    uint64_t v6 = v0[44];
    uint64_t v5 = v0[45];
    uint64_t v8 = v0[42];
    uint64_t v7 = v0[43];
    long long v9 = v0[40];
    uint64_t v23 = (void *)v0[41];
    long long v10 = v0[38];
    uint64_t v11 = v0[39];
    uint64_t v12 = v0[37];
    uint64_t v13 = v0[59];
    int v14 = v0[60];
    swift_bridgeObjectRelease();
    v0[22] = v8;
    v0[23] = v13;
    v0[24] = v7;
    v0[25] = v6;
    v0[26] = v14;
    v0[27] = v5;
    v0[33] = v10;
    v0[34] = v11;
    v0[35] = v9;
    v0[36] = 0;
    uint64_t v15 = [v23 insertTimeRange:v0 + 22 ofAsset:v12 atTime:v0 + 33 error:v0 + 36];
    Swift::String v16 = (void *)v0[36];
    if (v15)
    {
      uint64_t v24 = (uint64_t (*)(void))v0[1];
      size_t v17 = v16;
      uint64_t v18 = v24;
    }
    else
    {
      int v21 = v16;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      uint64_t v18 = (uint64_t (*)(void))v0[1];
    }
    return v18();
  }
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  uint64_t v7;
  uint64_t v9;

  uint64_t v1 = v0[56];
  uint64_t v2 = (void *)v0[54];
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2128B2800;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 40) = v3;
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v0[57] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVMutableComposition.insertTimeRange(_:of:at:isolation:);
  uint64_t v7 = swift_continuation_init();
  v0[28] = MEMORY[0x263EF8330];
  v0[29] = 0x40000000;
  v0[30] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v0[31] = &block_descriptor_2;
  v0[32] = v7;
  [v2 loadValuesAsynchronouslyForKeys:[v0 + 28] completionHandler:isa];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t v1;

  return MEMORY[0x270FA2498](AVMutableComposition.insertTimeRange(_:of:at:isolation:), 0, 0);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();
  char v8;
  Swift::String v9;
  uint64_t v11;

  uint64_t v1 = *(void **)(v0 + 448);

  uint64_t v2 = (void *)specialized AVAsynchronousKeyValueLoading.status<A>(of:)(v1);
  uint64_t v4 = v2;
  *(void *)(v0 + 464) = v2;
  if (v3 == 1)
  {
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v5 = *(void *)(v0 + 368);
    uint64_t v6 = *(void *)(v0 + 376);
    uint64_t v7 = AVMutableComposition.insertTimeRange(_:of:at:isolation:);
  }
  else
  {
    if (v3)
    {
      uint64_t v8 = v3;
      outlined copy of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status(v2, v3);
      _StringGuts.grow(_:)(20);
      swift_bridgeObjectRelease();
      v9._countAndFlagsBits = specialized AVAsyncProperty.Status.description.getter(v4, v8, &demangling cache variable for type metadata for [CMFormatDescriptionRef], (void (*)(void *, uint64_t))outlined consume of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status);
      String.append(_:)(v9);
      swift_bridgeObjectRelease();
      return _assertionFailure(_:_:file:line:flags:)();
    }
    swift_setDeallocating();
    swift_bridgeObjectRelease();
    swift_release();
    outlined consume of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status(v4, 0);
    uint64_t v5 = *(void *)(v0 + 368);
    uint64_t v6 = *(void *)(v0 + 376);
    uint64_t v7 = AVMutableComposition.insertTimeRange(_:of:at:isolation:);
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  id v15;
  uint64_t (*v16)(void);
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v22;
  void *inited;
  uint64_t (*v24)(void);
  id v25;
  uint64_t v26;

  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v2 = *(void *)(v0 + 424);

  if (v1 == v2)
  {
    uint64_t v4 = *(void *)(v0 + 352);
    uint64_t v3 = *(void *)(v0 + 360);
    uint64_t v6 = *(void *)(v0 + 336);
    uint64_t v5 = *(void *)(v0 + 344);
    uint64_t v7 = *(void *)(v0 + 320);
    uint64_t v25 = *(id *)(v0 + 328);
    uint64_t v8 = *(void *)(v0 + 304);
    long long v9 = *(void *)(v0 + 312);
    long long v10 = *(void *)(v0 + 296);
    uint64_t v11 = *(void *)(v0 + 472);
    uint64_t v12 = *(void *)(v0 + 480);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 176) = v6;
    *(void *)(v0 + 184) = v11;
    *(void *)(v0 + 192) = v5;
    *(void *)(v0 + 200) = v4;
    *(void *)(v0 + 208) = v12;
    *(void *)(v0 + 216) = v3;
    *(void *)(v0 + 264) = v8;
    *(void *)(v0 + 272) = v9;
    *(void *)(v0 + 280) = v7;
    *(void *)(v0 + 288) = 0;
    uint64_t v13 = [v25 insertTimeRange:v0 + 176 ofAsset:v10 atTime:v0 + 264 error:v0 + 288];
    int v14 = *(void **)(v0 + 288);
    if (v13)
    {
      uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
      uint64_t v15 = v14;
      Swift::String v16 = v24;
    }
    else
    {
      uint64_t v20 = v14;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      Swift::String v16 = *(uint64_t (**)(void))(v0 + 8);
    }
    return v16();
  }
  else
  {
    size_t v17 = *(void *)(v0 + 440);
    uint64_t v18 = *(void *)(v0 + 408);
    if ((v18 & 0xC000000000000001) != 0) {
      uint64_t v19 = (id)MEMORY[0x2166848A0](*(void *)(v0 + 440));
    }
    else {
      uint64_t v19 = *(id *)(v18 + 8 * v17 + 32);
    }
    *(void *)(v0 + 432) = v19;
    *(void *)(v0 + 440) = v17 + 1;
    if (__OFADD__(v17, 1)) {
      __break(1u);
    }
    int v22 = swift_allocObject();
    *(void *)(v22 + 16) = 0xD000000000000012;
    *(void *)(v22 + 24) = 0x80000002128B6020;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>);
    inited = (void *)swift_initStackObject();
    *(void *)(v0 + 448) = inited;
    inited[4] = partial apply for specialized closure #1 in AVAsyncProperty<>.init(key:);
    inited[5] = v22;
    inited[2] = 0xD000000000000012;
    inited[3] = 0x80000002128B6020;
    return MEMORY[0x270FA2498](AVMutableComposition.insertTimeRange(_:of:at:isolation:), 0, 0);
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t AVMutableComposition.insertTimeRange(_:of:at:isolation:)(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[51] = a1;
  v3[52] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = v3[46];
    uint64_t v5 = v3[47];
    uint64_t v6 = AVMutableComposition.insertTimeRange(_:of:at:isolation:);
  }
  else
  {
    swift_release();
    uint64_t v4 = v3[46];
    uint64_t v5 = v3[47];
    uint64_t v6 = AVMutableComposition.insertTimeRange(_:of:at:isolation:);
  }
  return MEMORY[0x270FA2498](v6, v4, v5);
}

uint64_t sub_2128AE168()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for specialized closure #1 in AVAsyncProperty<>.init(key:)@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = specialized closure #1 in AVAsyncProperty<>.init(key:)(*a1, *(void *)(v2 + 16), *(void *)(v2 + 24), &demangling cache variable for type metadata for [AVAssetTrack]);
  *a2 = result;
  return result;
}

{
  uint64_t v2;
  uint64_t result;

  uint64_t result = specialized closure #1 in AVAsyncProperty<>.init(key:)(*a1, *(void *)(v2 + 16), *(void *)(v2 + 24), &demangling cache variable for type metadata for [CMFormatDescriptionRef]);
  *a2 = result;
  return result;
}

id outlined copy of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status(id result, char a2)
{
  if (a2 == 1) {
    return result;
  }
  if (!a2) {
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

void outlined consume of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status(void *a1, char a2)
{
  if (a2 == 1)
  {
  }
  else if (!a2)
  {
    swift_bridgeObjectRelease();
  }
}

char *AVCapturePhotoOutput.supportedFlashModes.getter()
{
  id v1 = [v0 sel_supportedFlashModes];
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x2166848A0](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      id v9 = [v7 integerValue];

      unint64_t v11 = *(void *)(v12 + 16);
      unint64_t v10 = *(void *)(v12 + 24);
      if (v11 >= v10 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      *(void *)(v12 + 16) = v11 + 1;
      *(void *)(v12 + 8 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

char *AVCapturePhotoOutput.availablePhotoPixelFormatTypes.getter()
{
  return AVAssetVariantVideoAttributes.codecTypes.getter((SEL *)&selRef_availablePhotoPixelFormatTypes);
}

char *AVCapturePhotoOutput.availableRawPhotoPixelFormatTypes.getter()
{
  return AVAssetVariantVideoAttributes.codecTypes.getter((SEL *)&selRef_availableRawPhotoPixelFormatTypes);
}

void AVCapturePhotoOutput.supportedPhotoPixelFormatTypes(for:)()
{
}

void AVCapturePhotoOutput.supportedRawPhotoPixelFormatTypes(for:)()
{
}

char *AVCapturePhotoSettings.availablePreviewPhotoPixelFormatTypes.getter()
{
  return AVAssetVariantVideoAttributes.codecTypes.getter((SEL *)&selRef_availablePreviewPhotoPixelFormatTypes);
}

void AVCapturePhoto.cgImageRepresentation()()
{
}

void AVCapturePhoto.previewCGImageRepresentation()()
{
}

void AVSampleBufferVideoRenderer.presentationTimeExpectation.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
}

id key path setter for AVSampleBufferVideoRenderer.presentationTimeExpectation : AVSampleBufferVideoRenderer(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  int v5 = *((unsigned __int8 *)a1 + 24);
  uint64_t v6 = *a2;
  if (v5 == 1)
  {
    if (v4 | v3 | v2) {
      id v7 = sel_expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes;
    }
    else {
      id v7 = sel_resetUpcomingSampleBufferPresentationTimeExpectations;
    }
    return [v6 v7];
  }
  else
  {
    v9[0] = v2;
    v9[1] = v3;
    _OWORD v9[2] = v4;
    return [v6 sel_expectMinimumUpcomingSampleBufferPresentationTime_:v9];
  }
}

id AVSampleBufferVideoRenderer.presentationTimeExpectation.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  if (*(unsigned char *)(a1 + 24) == 1)
  {
    if (v3 | v2 | *(void *)a1) {
      uint64_t v4 = sel_expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes;
    }
    else {
      uint64_t v4 = sel_resetUpcomingSampleBufferPresentationTimeExpectations;
    }
    return [v1 v4];
  }
  else
  {
    v6[0] = *(void *)a1;
    v6[1] = v2;
    void v6[2] = v3;
    return [v1 sel_expectMinimumUpcomingSampleBufferPresentationTime_:v6];
  }
}

void (*AVSampleBufferVideoRenderer.presentationTimeExpectation.modify(void *a1))(uint64_t **a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  v3[1] = 0;
  v3[2] = 0;
  *uint64_t v3 = 0;
  *((unsigned char *)v3 + 24) = 1;
  return AVSampleBufferVideoRenderer.presentationTimeExpectation.modify;
}

void AVSampleBufferVideoRenderer.presentationTimeExpectation.modify(uint64_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (uint64_t)(*a1 + 4);
  uint64_t v3 = **a1;
  uint64_t v4 = (*a1)[1];
  uint64_t v5 = (*a1)[2];
  if (*((unsigned char *)*a1 + 24))
  {
    uint64_t v6 = (void *)v1[7];
    if (v5 | v4 | v3) {
      [v6 expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes:v2];
    }
    else {
      [v6 resetUpcomingSampleBufferPresentationTimeExpectations:v2];
    }
  }
  else
  {
    id v7 = (void *)v1[7];
    v1[4] = v3;
    v1[5] = v4;
    v1[6] = v5;
    [v7 sel_expectMinimumUpcomingSampleBufferPresentationTime_:v2];
  }

  free(v1);
}

void sub_2128AE764(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
}

__n128 __swift_memcpy25_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AVSampleBufferVideoRenderer.PresentationTimeExpectation(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AVSampleBufferVideoRenderer.PresentationTimeExpectation(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 12) = 0;
    *(void *)(result + 4) = 0;
    *(void *)(result + 17) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 25) = v3;
  return result;
}

uint64_t getEnumTag for AVSampleBufferVideoRenderer.PresentationTimeExpectation(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t destructiveInjectEnumTag for AVSampleBufferVideoRenderer.PresentationTimeExpectation(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(unsigned char *)(result + 24) = 1;
  }
  else
  {
    *(unsigned char *)(result + 24) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AVSampleBufferVideoRenderer.PresentationTimeExpectation()
{
  return &type metadata for AVSampleBufferVideoRenderer.PresentationTimeExpectation;
}

id AVPlayerVideoOutput.taggedBuffers(forHostTime:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F01090];
  uint64_t v7 = *(void *)(MEMORY[0x263F01090] + 16);
  id v16 = 0;
  *(void *)&long long v17 = v6;
  *((void *)&v17 + 1) = *(void *)(MEMORY[0x263F01090] + 8);
  uint64_t v18 = v7;
  v15[0] = a1;
  v15[1] = a2;
  void v15[2] = a3;
  id result = [v4 copyTaggedBufferGroupForHostTime:v15 presentationTimeStamp:&v17 activeConfiguration:&v16];
  long long v9 = 0uLL;
  if (!result) {
    goto LABEL_5;
  }
  unint64_t v10 = result;
  id v11 = v16;
  if (!v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_2128B2800;
    *(void *)(v14 + 56) = MEMORY[0x263F8D310];
    *(void *)(v14 + 32) = 0xD00000000000005DLL;
    *(void *)(v14 + 40) = 0x80000002128B6070;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();

    long long v9 = 0uLL;
    id result = 0;
LABEL_5:
    uint64_t v13 = 0;
    id v11 = 0;
    goto LABEL_6;
  }
  id v12 = v16;
  id result = (id)Array<A>.init(taggedBufferGroup:)();
  long long v9 = v17;
  uint64_t v13 = v18;
LABEL_6:
  *(void *)a4 = result;
  *(_OWORD *)(a4 + 8) = v9;
  *(void *)(a4 + 24) = v13;
  *(void *)(a4 + 32) = v11;
  return result;
}

id AVVideoOutputSpecification.init(tagCollections:)(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    uint64_t v2 = 0;
    uint64_t v3 = v14;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = Array<A>.tagCollection.getter();
      type metadata accessor for CMTagCollectionRef(0);
      uint64_t v13 = v5;
      swift_bridgeObjectRelease();
      *(void *)&long long v12 = v4;
      uint64_t v14 = v3;
      unint64_t v7 = *(void *)(v3 + 16);
      unint64_t v6 = *(void *)(v3 + 24);
      if (v7 >= v6 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v6 > 1), v7 + 1, 1);
        uint64_t v3 = v14;
      }
      ++v2;
      *(void *)(v3 + 16) = v7 + 1;
      outlined init with take of Sendable(&v12, (_OWORD *)(v3 + 32 * v7 + 32));
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [v8 initWithTagCollections:isa];

  return v10;
}

Swift::Void __swiftcall AVVideoOutputSpecification.setOutputPixelBufferAttributes(_:for:)(Swift::OpaquePointer_optional _, Swift::OpaquePointer a2)
{
  if (_.value._rawValue) {
    v3.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  else {
    v3.super.Class isa = 0;
  }
  id v4 = (id)Array<A>.tagCollection.getter();
  [v2 setOutputPixelBufferAttributes:v3.super.isa forTagCollection:v4];
}

Swift::Void __swiftcall AVVideoOutputSpecification.setOutputSettings(_:for:)(Swift::OpaquePointer_optional _, Swift::OpaquePointer a2)
{
  if (_.value._rawValue)
  {
    specialized _dictionaryUpCast<A, B, C, D>(_:)((uint64_t)_.value._rawValue);
    v3.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.Class isa = 0;
  }
  id v4 = (id)Array<A>.tagCollection.getter();
  [v2 setOutputSettings:v3.super.isa forTagCollection:v4];
}

uint64_t AVVideoOutputSpecification.preferredTagCollections.getter()
{
  return AVVideoOutputSpecification.preferredTagCollections.getter((SEL *)&selRef_preferredTagCollections);
}

uint64_t AVPlayerVideoOutputConfiguration.dataChannelDescription.getter()
{
  return AVVideoOutputSpecification.preferredTagCollections.getter((SEL *)&selRef_dataChannelDescriptions);
}

uint64_t AVVideoOutputSpecification.preferredTagCollections.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    uint64_t v5 = v3 + 32;
    do
    {
      outlined init with copy of Sendable(v5, (uint64_t)v12);
      outlined init with copy of Sendable((uint64_t)v12, (uint64_t)v11);
      type metadata accessor for CMTagCollectionRef(0);
      swift_dynamicCast();
      uint64_t v6 = MEMORY[0x216684640]();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
      uint64_t v7 = v13;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v7 + 16) + 1, 1);
        uint64_t v7 = v13;
      }
      unint64_t v9 = *(void *)(v7 + 16);
      unint64_t v8 = *(void *)(v7 + 24);
      if (v9 >= v8 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v8 > 1), v9 + 1, 1);
        uint64_t v7 = v13;
      }
      *(void *)(v7 + 16) = v9 + 1;
      *(void *)(v7 + 8 * v9 + 32) = v6;
      v5 += 32;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v7;
}

uint64_t static Array<A>.createTagsForPreset(preset:)()
{
  int v0 = CMTagCollectionCreateWithVideoOutputPreset();
  if (v0 != noErr.getter())
  {
    _StringGuts.grow(_:)(40);
    swift_bridgeObjectRelease();
    v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v1);
    swift_bridgeObjectRelease();
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static Array<A>.monoscopicForVideoOutput()()
{
  return static Array<A>.createTagsForPreset(preset:)();
}

uint64_t static Array<A>.stereoscopicForVideoOutput()()
{
  return static Array<A>.createTagsForPreset(preset:)();
}

void *static AVPartialAsyncProperty<A>.formatDescriptions.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [CMFormatDescriptionRef], 0xD000000000000012, 0x80000002128B6020);
}

void *static AVPartialAsyncProperty<A>.isDecodable.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0x6C6261646F636564, 0xE900000000000065);
}

void *static AVPartialAsyncProperty<A>.isEnabled.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0x64656C62616E65, 0xE700000000000000);
}

void *static AVPartialAsyncProperty<A>.isSelfContained.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0x746E6F43666C6573, 0xED000064656E6961);
}

void *static AVPartialAsyncProperty<A>.totalSampleDataLength.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8E5C0], 0xD000000000000015, 0x80000002128B6180);
}

void *static AVPartialAsyncProperty<A>.mediaCharacteristics.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMediaCharacteristic], 0xD000000000000014, 0x80000002128B61A0);
}

void *static AVPartialAsyncProperty<A>.timeRange.getter()
{
  return static AVPartialAsyncProperty<A>.timeRange.getter(type metadata accessor for CMTimeRange, 0x676E6152656D6974, 0xE900000000000065);
}

void *static AVPartialAsyncProperty<A>.naturalTimeScale.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8E548], 0xD000000000000010, 0x80000002128B61C0);
}

void *static AVPartialAsyncProperty<A>.estimatedDataRate.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D5C8], 0xD000000000000011, 0x80000002128B61E0);
}

void *static AVPartialAsyncProperty<A>.languageCode.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for String?, 0x65676175676E616CLL, 0xEC00000065646F43);
}

void *static AVPartialAsyncProperty<A>.extendedLanguageTag.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for String?, 0xD000000000000013, 0x80000002128B6200);
}

void *static AVPartialAsyncProperty<A>.naturalSize.getter()
{
  return static AVPartialAsyncProperty<A>.timeRange.getter(type metadata accessor for CGSize, 0x536C61727574616ELL, 0xEB00000000657A69);
}

void *static AVPartialAsyncProperty<A>.hasAudioSampleDependencies.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0xD00000000000001ALL, 0x80000002128B6220);
}

void *static AVPartialAsyncProperty<A>.nominalFrameRate.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D5C8], 0xD000000000000010, 0x80000002128B6240);
}

void *static AVPartialAsyncProperty<A>.minFrameDuration.getter()
{
  return static AVPartialAsyncProperty<A>.timeRange.getter(type metadata accessor for CMTime, 0xD000000000000010, 0x80000002128B6260);
}

void *static AVPartialAsyncProperty<A>.timeRange.getter(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return AVAsyncProperty<>.init(key:)(a2, a3);
}

void *static AVPartialAsyncProperty<A>.requiresFrameReordering.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0xD000000000000017, 0x80000002128B6280);
}

void *static AVPartialAsyncProperty<A>.segments.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVAssetTrackSegment], 0x73746E656D676573, 0xE800000000000000);
}

void *static AVPartialAsyncProperty<A>.availableTrackAssociationTypes.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVTrackAssociationType], 0xD00000000000001ELL, 0x80000002128B62A0);
}

void *static AVPartialAsyncProperty<A>.canProvideSampleCursors.getter()
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x263F8D4F8], 0xD000000000000017, 0x80000002128B62C0);
}

NSValue __swiftcall CMTime._bridgeToObjectiveC()()
{
  uint64_t v5 = v0;
  uint64_t v6 = v1;
  uint64_t v7 = v2;
  id v3 = [self sel_valueWithCMTime_:&v5];

  return (NSValue)v3;
}

id static CMTime._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  int64_t v4 = (const char *)[v3 objCType];
  type metadata accessor for CMTime(0);
  id result = (id)strcmp(v4, "{?=qiIq}");
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 CMTimeValue];
    *(_OWORD *)a2 = v6;
    *(void *)(a2 + 16) = v7;
    *(unsigned char *)(a2 + 24) = 0;
  }
  return result;
}

BOOL static CMTime._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  int64_t v4 = (const char *)[v3 objCType];
  type metadata accessor for CMTime(0);
  int v5 = strcmp(v4, "{?=qiIq}");
  if (v5)
  {
    uint64_t v6 = 0;
    long long v7 = 0uLL;
  }
  else
  {
    [v3 sel_CMTimeValue];
    long long v7 = v9;
    uint64_t v6 = v10;
  }
  BOOL result = v5 == 0;
  *(_OWORD *)a2 = v7;
  *(void *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 24) = v5 != 0;
  return result;
}

uint64_t static CMTime._unconditionallyBridgeFromObjectiveC(_:)(uint64_t result)
{
  if (result)
  {
    id v1 = (id) result;
    uint64_t v2 = (const char *)[v1 objCType];
    type metadata accessor for CMTime(0);
    BOOL result = strcmp(v2, "{?=qiIq}");
    if (!result)
    {
      [v1 sel_CMTimeValue];
      return v3;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMTime()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  uint64_t v3 = self;
  v6[0] = v1;
  v6[1] = v0[1];
  void v6[2] = v2;
  id v4 = [v3 sel_valueWithCMTime:v6];

  return v4;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMTime(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = strcmp((const char *)[v3 objCType], "{?=qiIq}");
  if (v4)
  {
    uint64_t v5 = 0;
    long long v6 = 0uLL;
  }
  else
  {
    [v3 sel_CMTimeValue];
    long long v6 = v8;
    uint64_t v5 = v9;
  }
  BOOL result = v4 == 0;
  *(_OWORD *)a2 = v6;
  *(void *)(a2 + 16) = v5;
  *(unsigned char *)(a2 + 24) = v4 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMTime@<X0>(id result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    id v3 = result;
    BOOL result = (id)strcmp((const char *)[v3 objCType], "{?=qiIq}");
    if (!result)
    {
      BOOL result = [v3 CMTimeValue];
      uint64_t v4 = v8;
      uint64_t v5 = v7;
      *a2 = v6;
      a2[1] = v5;
      a2[2] = v4;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

NSValue __swiftcall CMTimeRange._bridgeToObjectiveC()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[5];
  uint64_t v5 = self;
  v8[0] = v1;
  v8[1] = v0[1];
  void v8[2] = v2;
  v8[3] = v3;
  v8[4] = v0[4];
  v8[5] = v4;
  id v6 = [v5 valueWithCMTimeRange:v8];

  return (NSValue)v6;
}

id static CMTimeRange._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (const char *)[v3 objCType];
  type metadata accessor for CMTimeRange(0);
  id result = (id)strcmp(v4, "{?={?=qiIq}{?=qiIq}}");
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 CMTimeRangeValue];
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *(_OWORD *)(a2 + 32) = v8;
    *(unsigned char *)(a2 + 48) = 0;
  }
  return result;
}

BOOL static CMTimeRange._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (const char *)[v3 objCType];
  type metadata accessor for CMTimeRange(0);
  int v5 = strcmp(v4, "{?={?=qiIq}{?=qiIq}}");
  long long v6 = 0uLL;
  long long v7 = 0uLL;
  long long v8 = 0uLL;
  if (!v5)
  {
    [v3 CMTimeRangeValue:0.0, 0.0, 0.0];
    long long v6 = v10;
    long long v7 = v11;
    long long v8 = v12;
  }
  BOOL result = v5 == 0;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v7;
  *(_OWORD *)(a2 + 32) = v8;
  *(unsigned char *)(a2 + 48) = v5 != 0;
  return result;
}

id static CMTimeRange._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, uint64_t a2@<X8>)
{
  if (result)
  {
    id v3 = result;
    uint64_t v4 = (const char *)[v3 objCType];
    type metadata accessor for CMTimeRange(0);
    BOOL result = (id)strcmp(v4, "{?={?=qiIq}{?=qiIq}}");
    if (!result)
    {
      BOOL result = [v3 CMTimeRangeValue];
      uint64_t v5 = v13;
      uint64_t v6 = v10;
      uint64_t v7 = v12;
      long long v8 = v11;
      *(void *)a2 = v9;
      *(void *)(a2 + 8) = v6;
      *(_OWORD *)(a2 + 16) = v8;
      *(void *)(a2 + 32) = v7;
      *(void *)(a2 + 40) = v5;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMTimeRange()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[5];
  uint64_t v5 = self;
  v8[0] = v1;
  v8[1] = v0[1];
  void v8[2] = v2;
  v8[3] = v3;
  v8[4] = v0[4];
  v8[5] = v4;
  id v6 = [v5 valueWithCMTimeRange:v8];

  return v6;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMTimeRange(void *a1, uint64_t a2)
{
  id v3 = a1;
  id result = (id)strcmp([v3 objCType], "{?={?=qiIq}{?=qiIq}}");
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 CMTimeRangeValue];
    *(_OWORD *)a2 = v5;
    *(_OWORD *)(a2 + 16) = v6;
    *(_OWORD *)(a2 + 32) = v7;
    *(unsigned char *)(a2 + 48) = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMTimeRange(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = strcmp([v3 objCType], "{?={?=qiIq}{?=qiIq}}");
  long long v5 = 0uLL;
  long long v6 = 0uLL;
  long long v7 = 0uLL;
  if (!v4)
  {
    [v3 CMTimeRangeValue:0.0, 0.0, 0.0];
    long long v5 = v9;
    long long v6 = v10;
    long long v7 = v11;
  }
  BOOL result = v4 == 0;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v7;
  *(unsigned char *)(a2 + 48) = v4 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMTimeRange@<X0>(id result@<X0>, uint64_t a2@<X8>)
{
  if (result)
  {
    id v3 = result;
    BOOL result = (id)strcmp((const char *)[v3 objCType], "{?={?=qiIq}{?=qiIq}}");
    if (!result)
    {
      BOOL result = [v3 CMTimeRangeValue];
      uint64_t v4 = v12;
      uint64_t v5 = v9;
      uint64_t v6 = v11;
      long long v7 = v10;
      *(void *)a2 = v8;
      *(void *)(a2 + 8) = v5;
      *(_OWORD *)(a2 + 16) = v7;
      *(void *)(a2 + 32) = v6;
      *(void *)(a2 + 40) = v4;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

NSValue __swiftcall CMTimeMapping._bridgeToObjectiveC()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[8];
  uint64_t v7 = v0[9];
  uint64_t v8 = v0[11];
  uint64_t v9 = self;
  v12[0] = v1;
  v12[1] = v0[1];
  void v12[2] = v2;
  v12[3] = v3;
  void v12[4] = v0[4];
  v12[5] = v4;
  v12[6] = v5;
  v12[7] = v0[7];
  v12[8] = v6;
  v12[9] = v7;
  v12[10] = v0[10];
  v12[11] = v8;
  id v10 = [v9 sel_valueWithCMTimeMapping:v12];

  return (NSValue)v10;
}

id static CMTimeMapping._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (const char *)[v3 objCType];
  type metadata accessor for CMTimeMapping(0);
  id result = (id)strcmp(v4, "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 CMTimeMappingValue];
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *(_OWORD *)(a2 + 32) = v8;
    *(_OWORD *)(a2 + 48) = v9;
    *(_OWORD *)(a2 + 64) = v10;
    *(_OWORD *)(a2 + 80) = v11;
    *(unsigned char *)(a2 + 96) = 0;
  }
  return result;
}

BOOL static CMTimeMapping._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (const char *)[v3 objCType];
  type metadata accessor for CMTimeMapping(0);
  int v5 = strcmp(v4, "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
  if (v5)
  {
    long long v6 = 0uLL;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    long long v7 = 0uLL;
    long long v8 = 0uLL;
    long long v9 = 0uLL;
  }
  else
  {
    [v3 CMTimeMappingValue];
    long long v6 = v13;
    long long v7 = v14;
    long long v8 = v15;
    long long v9 = v16;
    *(_OWORD *)a2 = v11;
    *(_OWORD *)(a2 + 16) = v12;
  }
  BOOL result = v5 == 0;
  *(_OWORD *)(a2 + 32) = v6;
  *(_OWORD *)(a2 + 48) = v7;
  *(_OWORD *)(a2 + 64) = v8;
  *(_OWORD *)(a2 + 80) = v9;
  *(unsigned char *)(a2 + 96) = v5 != 0;
  return result;
}

id static CMTimeMapping._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, uint64_t a2@<X8>)
{
  if (result)
  {
    id v3 = result;
    uint64_t v4 = (const char *)[v3 objCType];
    type metadata accessor for CMTimeMapping(0);
    BOOL result = (id)strcmp(v4, "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
    if (!result)
    {
      BOOL result = [v3 CMTimeMappingValue];
      uint64_t v5 = v21;
      uint64_t v6 = v14;
      uint64_t v7 = v16;
      uint64_t v8 = v18;
      uint64_t v9 = v20;
      long long v10 = v15;
      long long v11 = v17;
      long long v12 = v19;
      *(void *)a2 = v13;
      *(void *)(a2 + 8) = v6;
      *(_OWORD *)(a2 + 16) = v10;
      *(void *)(a2 + 32) = v7;
      *(_OWORD *)(a2 + 40) = v11;
      *(void *)(a2 + 56) = v8;
      *(_OWORD *)(a2 + 64) = v12;
      *(void *)(a2 + 80) = v9;
      *(void *)(a2 + 88) = v5;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMTimeMapping()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[8];
  uint64_t v7 = v0[9];
  uint64_t v8 = v0[11];
  uint64_t v9 = self;
  v12[0] = v1;
  v12[1] = v0[1];
  void v12[2] = v2;
  v12[3] = v3;
  void v12[4] = v0[4];
  v12[5] = v4;
  v12[6] = v5;
  v12[7] = v0[7];
  v12[8] = v6;
  v12[9] = v7;
  v12[10] = v0[10];
  v12[11] = v8;
  id v10 = [v9 sel_valueWithCMTimeMapping:v12];

  return v10;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMTimeMapping(void *a1, uint64_t a2)
{
  id v3 = a1;
  id result = (id)strcmp((const char *)[v3 objCType], "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 CMTimeMappingValue];
    *(_OWORD *)a2 = v5;
    *(_OWORD *)(a2 + 16) = v6;
    *(_OWORD *)(a2 + 32) = v7;
    *(_OWORD *)(a2 + 48) = v8;
    *(_OWORD *)(a2 + 64) = v9;
    *(_OWORD *)(a2 + 80) = v10;
    *(unsigned char *)(a2 + 96) = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMTimeMapping(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = strcmp((const char *)[v3 objCType], "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
  if (v4)
  {
    long long v5 = 0uLL;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    long long v6 = 0uLL;
    long long v7 = 0uLL;
    long long v8 = 0uLL;
  }
  else
  {
    [v3 sel_CMTimeMappingValue];
    long long v5 = v12;
    long long v6 = v13;
    long long v7 = v14;
    long long v8 = v15;
    *(_OWORD *)a2 = v10;
    *(_OWORD *)(a2 + 16) = v11;
  }
  BOOL result = v4 == 0;
  *(_OWORD *)(a2 + 32) = v5;
  *(_OWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 64) = v7;
  *(_OWORD *)(a2 + 80) = v8;
  *(unsigned char *)(a2 + 96) = v4 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMTimeMapping@<X0>(id result@<X0>, uint64_t a2@<X8>)
{
  if (result)
  {
    id v3 = result;
    BOOL result = (id)[v3 compare:sel_objCType];
    if (!result)
    {
      BOOL result = [v3 CMTimeMappingValue];
      uint64_t v4 = v20;
      uint64_t v5 = v13;
      uint64_t v6 = v15;
      uint64_t v7 = v17;
      uint64_t v8 = v19;
      long long v9 = v14;
      long long v10 = v16;
      long long v11 = v18;
      *(void *)a2 = v12;
      *(void *)(a2 + 8) = v5;
      *(_OWORD *)(a2 + 16) = v9;
      *(void *)(a2 + 32) = v6;
      *(_OWORD *)(a2 + 40) = v10;
      *(void *)(a2 + 56) = v7;
      *(_OWORD *)(a2 + 64) = v11;
      *(void *)(a2 + 80) = v8;
      *(void *)(a2 + 88) = v4;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

char *AVCaptureVideoDataOutput.availableVideoPixelFormatTypes.getter()
{
  id v1 = [v0 sel_availableVideoCVPixelFormatTypes];
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v12 = MEMORY[0x263F8EE78];
  BOOL result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x2166848A0](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      unsigned int v9 = [v7 unsignedIntValue];

      unint64_t v11 = *(void *)(v12 + 16);
      unint64_t v10 = *(void *)(v12 + 24);
      if (v11 >= v10 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      *(void *)(v12 + 16) = v11 + 1;
      *(_DWORD *)(v12 + 4 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

char *AVCaptureDeviceFormat.supportedColorSpaces.getter()
{
  id v1 = [v0 sel_supportedColorSpaces];
  type metadata accessor for AVMediaSelection(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v12 = MEMORY[0x263F8EE78];
  BOOL result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x2166848A0](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      id v9 = [v7 integerValue];

      unint64_t v11 = *(void *)(v12 + 16);
      unint64_t v10 = *(void *)(v12 + 24);
      if (v11 >= v10 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      *(void *)(v12 + 16) = v11 + 1;
      *(void *)(v12 + 8 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

char *AVCaptureDeviceFormat.supportedMaxPhotoDimensions.getter()
{
  id v1 = [v0 sel_supportedMaxPhotoDimensions];
  type metadata accessor for AVMediaSelection(0, (unint64_t *)&lazy cache variable for type metadata for NSValue);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v12 = MEMORY[0x263F8EE78];
  BOOL result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x2166848A0](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      id v9 = [v7 valueForCMVideoDimensions];

      unint64_t v11 = *(void *)(v12 + 16);
      unint64_t v10 = *(void *)(v12 + 24);
      if (v11 >= v10 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      *(void *)(v12 + 16) = v11 + 1;
      *(void *)(v12 + 8 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

char *AVCaptureDeviceFormat.secondaryNativeResolutionZoomFactors.getter()
{
  return AVCaptureDeviceFormat.secondaryNativeResolutionZoomFactors.getter((SEL *)&selRef_secondaryNativeResolutionZoomFactors);
}

char *AVCaptureDeviceFormat.supportedVideoZoomFactorsForDepthDataDelivery.getter()
{
  return AVCaptureDeviceFormat.secondaryNativeResolutionZoomFactors.getter((SEL *)&selRef_supportedVideoZoomFactorsForDepthDataDelivery);
}

char *AVCaptureDeviceFormat.secondaryNativeResolutionZoomFactors.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  type metadata accessor for AVMediaSelection(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v14 = MEMORY[0x263F8EE78];
  BOOL result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v14;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x2166848A0](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      id v9 = v8;
      [v8 floatValue];
      float v11 = v10;

      unint64_t v13 = *(void *)(v14 + 16);
      unint64_t v12 = *(void *)(v14 + 24);
      if (v13 >= v12 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v12 > 1), v13 + 1, 1);
      }
      ++v6;
      *(void *)(v14 + 16) = v13 + 1;
      *(double *)(v14 + 8 * v13 + 32) = v11;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return (char *)v7;
  }
  __break(1u);
  return result;
}

char *AVCaptureDeviceFormat.supportedVideoZoomRangesForDepthDataDelivery.getter()
{
  id v1 = [v0 sel_supportedVideoZoomRangesForDepthDataDelivery];
  type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for AVZoomRange);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      uint64_t v16 = MEMORY[0x263F8EE78];
      BOOL result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0) {
        break;
      }
      uint64_t v5 = 0;
      uint64_t v6 = v16;
      while (1)
      {
        id v7 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2166848A0](v5, v2) : *(id *)(v2 + 8 * v5 + 32);
        id v8 = v7;
        [v7 minZoomFactor];
        double v10 = v9;
        [v8 sel_maxZoomFactor];
        double v12 = v11;

        if (v10 > v12) {
          break;
        }
        unint64_t v14 = *(void *)(v16 + 16);
        unint64_t v13 = *(void *)(v16 + 24);
        if (v14 >= v13 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
        }
        ++v5;
        *(void *)(v16 + 16) = v14 + 1;
        uint64_t v15 = v16 + 16 * v14;
        *(double *)(v15 + 32) = v10;
        *(double *)(v15 + 40) = v12;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return (char *)v6;
        }
      }
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3) {
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  return result;
}

void AVCaptureDeviceFormat.systemRecommendedVideoZoomRange.getter()
{
  id v1 = [v0 sel_systemRecommendedVideoZoomRange];
  unint64_t v2 = v1;
  if (v1)
  {
    [v1 sel_minZoomFactor];
    double v4 = v3;
    [v2 sel_maxZoomFactor];
    double v6 = v5;

    if (v4 > v6) {
      __break(1u);
    }
  }
}

void AVCaptureDeviceFormat.systemRecommendedExposureBiasRange.getter()
{
  id v1 = [v0 sel_systemRecommendedExposureBiasRange];
  unint64_t v2 = v1;
  if (v1)
  {
    [v1 sel_minExposureBias];
    float v4 = v3;
    [v2 sel_maxExposureBias];
    float v6 = v5;

    if (v4 > v6) {
      __break(1u);
    }
  }
}

uint64_t dispatch thunk of NSKeyValueObservation.invalidate()()
{
  return MEMORY[0x270EEF760]();
}

uint64_t _BridgedStoredNSError.userInfo.getter()
{
  return MEMORY[0x270EEF7E0]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t NSFastEnumerationIterator.init(_:)()
{
  return MEMORY[0x270EEFA28]();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return MEMORY[0x270EEFA78]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
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

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x270EF07E0]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)MEMORY[0x270EF0EE0]();
}

uint64_t noErr.getter()
{
  return MEMORY[0x270FA08E0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t CancellationError.init()()
{
  return MEMORY[0x270FA1DF0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1820]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
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

uint64_t String.Index.utf16Offset<A>(in:)()
{
  return MEMORY[0x270F9D720]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1B98]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array<A>.init(taggedBufferGroup:)()
{
  return MEMORY[0x270FA0748]();
}

uint64_t Array<A>.taggedBufferGroup.getter()
{
  return MEMORY[0x270FA0750]();
}

uint64_t Array<A>.init(tagCollection:)()
{
  return MEMORY[0x270FA0758]();
}

uint64_t Array<A>.tagCollection.getter()
{
  return MEMORY[0x270FA0760]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t type metadata accessor for CancellationError()
{
  return MEMORY[0x270FA1E30]();
}

Swift::Void __swiftcall TaskGroup.cancelAll()()
{
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t static AsyncStream.makeStream(of:bufferingPolicy:)()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.YieldResult()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.BufferingPolicy()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x270FA1F48]();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
}

uint64_t type metadata accessor for AsyncStream.Continuation()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t type metadata accessor for AsyncStream.Iterator()
{
  return MEMORY[0x270FA1F78]();
}

uint64_t type metadata accessor for AsyncStream()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t static Task<>.isCancelled.getter()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t Range<>.init(_:in:)()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t NSProgress.estimatedTimeRemaining.setter()
{
  return MEMORY[0x270EF1DA0]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

CGPoint_optional __swiftcall CGPoint.init(dictionaryRepresentation:)(CFDictionaryRef dictionaryRepresentation)
{
  char v1 = MEMORY[0x270EE5928](dictionaryRepresentation);
  result.value.y = v3;
  result.value.x = v2;
  result.is_nil = v1;
  return result;
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
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

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
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

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F770]();
}

{
  return MEMORY[0x270F9F778]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

NSNumber __swiftcall Int32._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF26A8]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AVLocalizedError()
{
  return MEMORY[0x270F08FB0]();
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x270EE7150]((__n128)point, *(__n128 *)&point.y);
}

uint64_t CMTagCollectionCreateWithVideoOutputPreset()
{
  return MEMORY[0x270F08FB8]();
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x270FA02B8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}