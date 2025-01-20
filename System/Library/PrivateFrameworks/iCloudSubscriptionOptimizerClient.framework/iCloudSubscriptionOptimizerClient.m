uint64_t ClientLibEvent.__allocating_init(withClientEventName:andSink:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void v9[5];

  swift_allocObject();
  v4 = (uint64_t *)sub_228AAD180();
  v6 = *v4;
  v5 = v4[1];
  v9[0] = v6;
  v9[1] = v5;
  swift_bridgeObjectRetain();
  sub_228AAD6C0();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228A98864(a3, (uint64_t)v9);
  v7 = sub_228AAD100();
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v7;
}

uint64_t ClientLibEvent.init(withClientEventName:andSink:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = (uint64_t *)sub_228AAD180();
  uint64_t v6 = *v4;
  uint64_t v5 = v4[1];
  v9[0] = v6;
  v9[1] = v5;
  swift_bridgeObjectRetain();
  sub_228AAD6C0();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228A98864(a3, (uint64_t)v9);
  uint64_t v7 = sub_228AAD100();
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v7;
}

uint64_t static ClientLibEvent.toFullEventName(_:)()
{
  uint64_t v1 = *(void *)sub_228AAD180();
  swift_bridgeObjectRetain();
  sub_228AAD6C0();
  sub_228AAD6C0();
  return v1;
}

uint64_t sub_228A98864(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

void ClientLibEvent.__allocating_init(withName:andSink:)()
{
}

void ClientLibEvent.init(withName:andSink:)()
{
}

uint64_t ClientLibEvent.__deallocating_deinit()
{
  uint64_t v0 = _s33iCloudSubscriptionOptimizerClient0D8LibEventCfd_0();
  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t type metadata accessor for ClientLibEvent()
{
  return self;
}

uint64_t sub_228A989D0()
{
  uint64_t v0 = sub_228AAD160();
  swift_allocObject();
  uint64_t v1 = sub_228AAD150();
  uint64_t v5 = v0;
  uint64_t v6 = MEMORY[0x263F88BB0];
  *(void *)&long long v4 = v1;
  type metadata accessor for ClientLibEvents();
  uint64_t v2 = swift_allocObject();
  uint64_t result = sub_228A98AA8(&v4, v2 + 16);
  qword_26AF0C510 = v2;
  return result;
}

uint64_t sub_228A98A4C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for ClientLibEvents()
{
  return self;
}

uint64_t sub_228A98AA8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

id sub_228A98DA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DelayedOffer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_228A98DF0()
{
  return type metadata accessor for DelayedOffer();
}

uint64_t type metadata accessor for DelayedOffer()
{
  uint64_t result = qword_268290A40;
  if (!qword_268290A40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_228A98E44()
{
  uint64_t result = sub_228AAD440();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_228A98ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228AAD440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_228A98F38(uint64_t a1)
{
  uint64_t v2 = sub_228AAD440();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t FailsafeClientLibEvent.__allocating_init(withSink:failsafeEvent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return FailsafeClientLibEvent.init(withSink:failsafeEvent:)(a1, a2, a3);
}

uint64_t FailsafeClientLibEvent.init(withSink:failsafeEvent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_228A98864(a1, (uint64_t)v13);
  uint64_t v6 = (uint64_t *)sub_228AAD180();
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  v12[0] = v8;
  v12[1] = v7;
  swift_bridgeObjectRetain();
  sub_228AAD6C0();
  sub_228AAD6C0();
  sub_228A98864((uint64_t)v13, (uint64_t)v12);
  uint64_t v9 = sub_228AAD100();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  v10 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)v9 + 192);
  swift_retain();
  v10(0x656661736C696166, 0xED0000746E657645, a2, a3);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

void FailsafeClientLibEvent.__allocating_init(withClientEventName:andSink:)()
{
}

void FailsafeClientLibEvent.init(withClientEventName:andSink:)()
{
}

uint64_t FailsafeClientLibEvent.__deallocating_deinit()
{
  uint64_t v0 = _s33iCloudSubscriptionOptimizerClient0D8LibEventCfd_0();
  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t type metadata accessor for FailsafeClientLibEvent()
{
  return self;
}

unint64_t sub_228A992C4()
{
  sub_228AAD7A0();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(v0, sel_newOfferResponse);
  id v2 = objc_msgSend(v1, sel_description);
  sub_228AAD660();

  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  return 0xD000000000000027;
}

id sub_228A9941C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FailsafeDelayedOffer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FailsafeDelayedOffer()
{
  return self;
}

unint64_t sub_228A99474()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C5F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_228AAE240;
  uint64_t v1 = MEMORY[0x263F8D310];
  sub_228AAD790();
  *(void *)(inited + 96) = v1;
  strcpy((char *)(inited + 72), "iCloudStorage");
  *(_WORD *)(inited + 86) = -4864;
  unint64_t result = sub_228A9ED2C(inited);
  qword_268290BB8 = result;
  return result;
}

unint64_t sub_228A99648()
{
  sub_228AAD7A0();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(v0, sel_toContext);
  sub_228AAD620();

  sub_228AAD630();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  return 0xD000000000000022;
}

id sub_228A99818()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FailsafeNewOfferResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FailsafeNewOfferResponse()
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

uint64_t MethodCallClientLibEvent.__allocating_init(withMethod:andSink:)(char a1, uint64_t a2)
{
  return MethodCallClientLibEvent.init(withMethod:andSink:)(a1, a2);
}

unint64_t MethodCallClientLibEvent.MethodName.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0x726566664F77656ELL;
      break;
    case 3:
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000019;
      break;
    case 6:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_228A999F4(char *a1, char *a2)
{
  return sub_228A99A00(*a1, *a2);
}

uint64_t sub_228A99A00(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000016;
  unint64_t v4 = 0x8000000228AAE7B0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD000000000000015;
      uint64_t v5 = "isNotificationPending";
      goto LABEL_10;
    case 2:
      unint64_t v4 = 0xE800000000000000;
      unint64_t v3 = 0x726566664F77656ELL;
      break;
    case 3:
      uint64_t v6 = "parseDelayedOffer";
      goto LABEL_7;
    case 4:
      unint64_t v3 = 0xD000000000000019;
      uint64_t v5 = "parseDelayedOfferFromJson";
      goto LABEL_10;
    case 5:
      uint64_t v6 = "parseNotification";
LABEL_7:
      unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000011;
      break;
    case 6:
      unint64_t v3 = 0xD00000000000001FLL;
      uint64_t v5 = "failsafeDelayedOfferJsonContext";
      goto LABEL_10;
    case 7:
      unint64_t v3 = 0xD000000000000010;
      uint64_t v5 = "logFailsafeEvent";
LABEL_10:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xD000000000000016;
  unint64_t v8 = 0x8000000228AAE7B0;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xD000000000000015;
      uint64_t v9 = "isNotificationPending";
      goto LABEL_20;
    case 2:
      unint64_t v8 = 0xE800000000000000;
      unint64_t v7 = 0x726566664F77656ELL;
      break;
    case 3:
      v10 = "parseDelayedOffer";
      goto LABEL_17;
    case 4:
      unint64_t v7 = 0xD000000000000019;
      uint64_t v9 = "parseDelayedOfferFromJson";
      goto LABEL_20;
    case 5:
      v10 = "parseNotification";
LABEL_17:
      unint64_t v8 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      unint64_t v7 = 0xD000000000000011;
      break;
    case 6:
      unint64_t v7 = 0xD00000000000001FLL;
      uint64_t v9 = "failsafeDelayedOfferJsonContext";
      goto LABEL_20;
    case 7:
      unint64_t v7 = 0xD000000000000010;
      uint64_t v9 = "logFailsafeEvent";
LABEL_20:
      unint64_t v8 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v7 && v4 == v8) {
    char v11 = 1;
  }
  else {
    char v11 = sub_228AAD820();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_228A99C20()
{
  return sub_228A99D5C();
}

uint64_t sub_228A99C2C()
{
  return sub_228A99C34();
}

uint64_t sub_228A99C34()
{
  sub_228AAD6A0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_228A99D54()
{
  return sub_228A99D5C();
}

uint64_t sub_228A99D5C()
{
  return sub_228AAD8A0();
}

uint64_t sub_228A99E94@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s33iCloudSubscriptionOptimizerClient010MethodCallD8LibEventC0E4NameO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_228A99EC4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = MethodCallClientLibEvent.MethodName.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

BOOL static MethodCallClientLibEvent.MethodState.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t MethodCallClientLibEvent.MethodState.hash(into:)()
{
  return sub_228AAD890();
}

uint64_t MethodCallClientLibEvent.MethodState.hashValue.getter()
{
  return sub_228AAD8A0();
}

BOOL sub_228A99F70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_228A99F88()
{
  return sub_228AAD8A0();
}

uint64_t sub_228A99FD0()
{
  return sub_228AAD890();
}

uint64_t sub_228A99FFC()
{
  return sub_228AAD8A0();
}

uint64_t MethodCallClientLibEvent.init(withMethod:andSink:)(char a1, uint64_t a2)
{
  sub_228A98864(a2, (uint64_t)&v10);
  unint64_t v4 = (uint64_t *)sub_228AAD180();
  uint64_t v6 = *v4;
  uint64_t v5 = v4[1];
  v9[0] = v6;
  v9[1] = v5;
  swift_bridgeObjectRetain();
  sub_228AAD6C0();
  sub_228AAD6C0();
  sub_228A98864((uint64_t)&v10, (uint64_t)v9);
  uint64_t v7 = sub_228AAD100();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  uint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  LOBYTE(v9[0]) = a1;
  swift_retain();
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v7 + 192))(0x646F6874656DLL, 0xE600000000000000, v10, v11);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v7;
}

uint64_t MethodCallClientLibEvent.add(state:)(char a1)
{
  BYTE8(v3) = 0;
  *(void *)&long long v3 = a1 & 1;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, void, unint64_t))(*(void *)v1 + 192))(0x6574617473, 0xE500000000000000, *(void *)((char *)&v3 + 1), 0xE000000000000000);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t MethodCallClientLibEvent.add(duration:)()
{
  uint64_t v1 = sub_228AAD600();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)v0 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v1);
  swift_release();
  return swift_retain();
}

uint64_t MethodCallClientLibEvent.add(wasSuccessful:)(uint64_t a1)
{
  return sub_228A9A30C(a1, 0x6563637553736177, 0xED00006C75667373);
}

uint64_t MethodCallClientLibEvent.add(isFailsafe:)(uint64_t a1)
{
  return sub_228A9A30C(a1, 0x61736C6961467369, 0xEA00000000006566);
}

uint64_t sub_228A9A30C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v3 + 184))(a2, a3, a1);
  swift_release();
  return swift_retain();
}

uint64_t MethodCallClientLibEvent.add(litmusInfo:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)v2 + 192);
  swift_bridgeObjectRetain();
  v5(0x6E4973756D74696CLL, 0xEA00000000006F66, a1, a2);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_retain();
}

void MethodCallClientLibEvent.__allocating_init(withClientEventName:andSink:)()
{
}

void MethodCallClientLibEvent.init(withClientEventName:andSink:)()
{
}

uint64_t MethodCallClientLibEvent.__deallocating_deinit()
{
  uint64_t v0 = _s33iCloudSubscriptionOptimizerClient0D8LibEventCfd_0();
  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t _s33iCloudSubscriptionOptimizerClient010MethodCallD8LibEventC0E4NameO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_228AAD800();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

unint64_t sub_228A9A4F0()
{
  unint64_t result = qword_268290A50;
  if (!qword_268290A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268290A50);
  }
  return result;
}

unint64_t sub_228A9A548()
{
  unint64_t result = qword_268290A58;
  if (!qword_268290A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268290A58);
  }
  return result;
}

uint64_t type metadata accessor for MethodCallClientLibEvent()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MethodCallClientLibEvent.MethodName(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MethodCallClientLibEvent.MethodName(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x228A9A72CLL);
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

uint64_t sub_228A9A754(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_228A9A75C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MethodCallClientLibEvent.MethodName()
{
  return &type metadata for MethodCallClientLibEvent.MethodName;
}

uint64_t getEnumTagSinglePayload for MethodCallClientLibEvent.MethodState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MethodCallClientLibEvent.MethodState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x228A9A8D0);
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

unsigned char *sub_228A9A8F8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MethodCallClientLibEvent.MethodState()
{
  return &type metadata for MethodCallClientLibEvent.MethodState;
}

uint64_t sub_228A9A914(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  unint64_t v5 = 0xED0000454C42414CLL;
  uint64_t v6 = 0x494156415F544F4ELL;
  sub_228AAD0A0();
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NotificationContent();
  if (swift_dynamicCastClass())
  {
    id v9 = a1;
    if (sub_228AAD2F0())
    {
      sub_228AAD2D0();
      uint64_t v6 = sub_228AAD090();
      unint64_t v5 = v10;

      sub_228A9D470((uint64_t)v8, MEMORY[0x263F88B28]);
    }
    else
    {
    }
  }
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_228A98864(v11, (uint64_t)&aBlock);
  type metadata accessor for NewOfferClientLibEvent();
  uint64_t v23 = v3;
  swift_allocObject();
  sub_228A98864((uint64_t)&aBlock, (uint64_t)v32);
  uint64_t v12 = MethodCallClientLibEvent.init(withMethod:andSink:)(2, (uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  uint64_t aBlock = 0;
  unint64_t v27 = 0xE000000000000000;
  v32[0] = 0;
  sub_228AAD7C0();
  v13 = *(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v12 + 192);
  v13(0x6574617473, 0xE500000000000000, aBlock, v27);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v13(0x6E4973756D74696CLL, 0xEA00000000006F66, v6, v5);
  swift_release();
  uint64_t v14 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v12 + 200))(v14);
  swift_release();
  sub_228AAD5F0();
  uint64_t v15 = sub_228AAD5E0();
  sub_228A98864(v11, (uint64_t)&aBlock);
  swift_allocObject();
  sub_228A98864((uint64_t)&aBlock, (uint64_t)v32);
  uint64_t v16 = MethodCallClientLibEvent.init(withMethod:andSink:)(2, (uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  v17 = *(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v16 + 192);
  swift_bridgeObjectRetain();
  v17(0x6E4973756D74696CLL, 0xEA00000000006F66, v6, v5);
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease_n();
  uint64_t aBlock = 0;
  unint64_t v27 = 0xE000000000000000;
  v32[0] = 1;
  sub_228AAD7C0();
  v17(0x6574617473, 0xE500000000000000, aBlock, v27);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v18 = *(void **)(v23 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  v19 = (void *)swift_allocObject();
  v19[2] = v16;
  v19[3] = v15;
  uint64_t v20 = v25;
  v19[4] = v24;
  v19[5] = v20;
  v30 = sub_228A9D338;
  v31 = v19;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v27 = 1107296256;
  v28 = sub_228A9B0B0;
  v29 = &block_descriptor_22;
  v21 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_newOffer_andCallback_, a1, v21);
  _Block_release(v21);
  swift_release();
  return swift_release();
}

uint64_t sub_228A9AD9C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268290A70);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_228AAD440();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NewOfferResponse();
  uint64_t v13 = swift_dynamicCastClass();
  if (v13)
  {
    sub_228A9D344(v13 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      sub_228A9D3AC((uint64_t)v8);
    }
    else
    {
      sub_228A9D40C((uint64_t)v8, (uint64_t)v12);
      uint64_t v14 = sub_228AAD420();
      char v16 = v15;
      id v17 = a1;
      sub_228A9D470((uint64_t)v12, MEMORY[0x263F88C88]);
      uint64_t v24 = 0;
      unint64_t v25 = 0xE000000000000000;
      uint64_t v22 = v14;
      char v23 = v16 & 1;
      sub_228AAD7C0();
      sub_228AAD0C0();

      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  id v18 = objc_msgSend(a1, sel_error);
  if (v18) {

  }
  sub_228AAD0D0();
  swift_release();
  v19 = *(void (**)(uint64_t))(*(void *)a3 + 96);
  uint64_t v20 = swift_retain();
  v19(v20);
  sub_228AAD600();
  sub_228AAD0E0();
  swift_release();
  sub_228AAD0F0();
  swift_release();
  return a4(a1);
}

uint64_t sub_228A9B154(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_228A98864(v5, (uint64_t)&aBlock);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  uint64_t v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(1, (uint64_t)&aBlock);
  uint64_t aBlock = 0;
  unint64_t v16 = 0xE000000000000000;
  char v21 = 0;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v6 + 192))(0x6574617473, 0xE500000000000000, aBlock, v16);
  swift_release();
  uint64_t v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v6 + 200))(v7);
  swift_release();
  sub_228AAD5F0();
  uint64_t v8 = sub_228AAD5E0();
  sub_228A98864(v5, (uint64_t)&aBlock);
  swift_allocObject();
  uint64_t v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(1, (uint64_t)&aBlock);
  uint64_t aBlock = 0;
  unint64_t v16 = 0xE000000000000000;
  char v21 = 1;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v9 + 192))(0x6574617473, 0xE500000000000000, aBlock, v16);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void **)(v3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v9;
  v11[3] = v8;
  v11[4] = a1;
  v11[5] = a2;
  v19 = sub_228A9D2D8;
  uint64_t v20 = v11;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v16 = 1107296256;
  id v17 = sub_228A9B0B0;
  id v18 = &block_descriptor_13;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_isNotificationPending_, v12);
  _Block_release(v12);
  swift_release();
  return swift_release();
}

uint64_t sub_228A9B42C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *))
{
  (*(void (**)(void))(*(void *)a3 + 96))();
  uint64_t v7 = sub_228AAD600();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)a2 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v7);
  swift_release();
  swift_retain();
  id v8 = objc_msgSend(a1, sel_error);
  id v9 = v8;
  if (v8) {

  }
  (*(void (**)(uint64_t, unint64_t, BOOL))(*(void *)a2 + 184))(0x6563637553736177, 0xED00006C75667373, v9 == 0);
  uint64_t v10 = swift_release();
  (*(void (**)(uint64_t))(*(void *)a2 + 200))(v10);
  swift_release();
  return a4(a1);
}

void sub_228A9B5A8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_228A9B644(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_228A98864(v5, (uint64_t)&aBlock);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  uint64_t v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(0, (uint64_t)&aBlock);
  uint64_t aBlock = 0;
  unint64_t v16 = 0xE000000000000000;
  char v21 = 0;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v6 + 192))(0x6574617473, 0xE500000000000000, aBlock, v16);
  swift_release();
  uint64_t v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v6 + 200))(v7);
  swift_release();
  sub_228AAD5F0();
  uint64_t v8 = sub_228AAD5E0();
  sub_228A98864(v5, (uint64_t)&aBlock);
  swift_allocObject();
  uint64_t v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(0, (uint64_t)&aBlock);
  uint64_t aBlock = 0;
  unint64_t v16 = 0xE000000000000000;
  char v21 = 1;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v9 + 192))(0x6574617473, 0xE500000000000000, aBlock, v16);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void **)(v3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v9;
  v11[3] = v8;
  v11[4] = a1;
  v11[5] = a2;
  v19 = sub_228A9D2A8;
  uint64_t v20 = v11;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v16 = 1107296256;
  id v17 = sub_228A9BA80;
  id v18 = &block_descriptor;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_clearNotificationState_, v12);
  _Block_release(v12);
  swift_release();
  return swift_release();
}

uint64_t sub_228A9B91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  (*(void (**)(void))(*(void *)a3 + 96))();
  uint64_t v7 = sub_228AAD600();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)a2 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v7);
  swift_release();
  uint64_t v8 = *(void (**)(uint64_t, unint64_t, BOOL))(*(void *)a2 + 184);
  swift_retain();
  v8(0x6563637553736177, 0xED00006C75667373, a1 == 0);
  uint64_t v9 = swift_release();
  (*(void (**)(uint64_t))(*(void *)a2 + 200))(v9);
  swift_release();
  return a4(a1);
}

void sub_228A9BA80(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_228A9BB20(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a1;
  a6(a5, v10);

  return swift_release();
}

uint64_t sub_228A9BCC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v6 = 0xED0000454C42414CLL;
  uint64_t v7 = 0x494156415F544F4ELL;
  sub_228AAD0A0();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  id v11 = (void *)sub_228AAD610();
  id v12 = objc_msgSend(v10, sel_parseNotification_, v11);

  if (v12)
  {
    type metadata accessor for NotificationContent();
    if (swift_dynamicCastClass())
    {
      id v13 = v12;
      if (sub_228AAD2F0())
      {
        sub_228AAD2D0();
        uint64_t v7 = sub_228AAD090();
        unint64_t v6 = v14;

        sub_228A9D470((uint64_t)v9, MEMORY[0x263F88B28]);
      }
      else
      {
      }
    }
  }
  char v15 = *(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)a1 + 192);
  swift_bridgeObjectRetain();
  v15(0x6E4973756D74696CLL, 0xEA00000000006F66, v7, v6);
  swift_release();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a3 = v12;
  return result;
}

uint64_t sub_228A9C044(char a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_228A9C88C(a1, a2, (uint64_t)a3);

  swift_bridgeObjectRelease();
  return v4;
}

id sub_228A9C0B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MetricsQuotaClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MetricsQuotaClient()
{
  return self;
}

id sub_228A9C15C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_228A98864(v5, (uint64_t)&v17);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  uint64_t v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v17);
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v6 + 192))(0x6574617473, 0xE500000000000000, v17, v18);
  swift_release();
  uint64_t v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v6 + 200))(v7);
  swift_release();
  sub_228AAD5F0();
  uint64_t v8 = sub_228AAD5E0();
  sub_228A98864(v5, (uint64_t)&v17);
  swift_allocObject();
  uint64_t v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v17);
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v9 + 192))(0x6574617473, 0xE500000000000000, v17, v18);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void **)(a3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  id v11 = (void *)sub_228AAD610();
  id v12 = objc_msgSend(v10, sel_parseDelayedOffer_, v11);

  (*(void (**)(void))(*(void *)v8 + 96))();
  uint64_t v13 = sub_228AAD600();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)v9 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v13);
  swift_release();
  unint64_t v14 = *(void (**)(uint64_t, unint64_t, BOOL))(*(void *)v9 + 184);
  swift_retain();
  v14(0x6563637553736177, 0xED00006C75667373, v12 != 0);
  uint64_t v15 = swift_release();
  (*(void (**)(uint64_t))(*(void *)v9 + 200))(v15);
  swift_release_n();
  swift_release();
  return v12;
}

id sub_228A9C4D0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_228A98864(v5, (uint64_t)&v20);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  uint64_t v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v20);
  uint64_t v20 = 0;
  unint64_t v21 = 0xE000000000000000;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v6 + 192))(0x6574617473, 0xE500000000000000, v20, v21);
  swift_release();
  uint64_t v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v6 + 200))(v7);
  swift_release();
  sub_228AAD5F0();
  uint64_t v8 = sub_228AAD5E0();
  sub_228A98864(v5, (uint64_t)&v20);
  swift_allocObject();
  uint64_t v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v20);
  uint64_t v20 = 0;
  unint64_t v21 = 0xE000000000000000;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v9 + 192))(0x6574617473, 0xE500000000000000, v20, v21);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void **)(a3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  id v11 = (void *)sub_228AAD650();
  id v12 = objc_msgSend(v10, sel_parseDelayedOfferFromJson_, v11);

  if (v12)
  {
    type metadata accessor for FailsafeDelayedOffer();
    uint64_t v13 = (void *)swift_dynamicCastClass();
    if (v13) {
      id v14 = v12;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  uint64_t v15 = *(void (**)(uint64_t, unint64_t, BOOL))(*(void *)v9 + 184);
  v15(0x61736C6961467369, 0xEA00000000006566, v13 != 0);
  uint64_t v16 = swift_release();
  (*(void (**)(uint64_t))(*(void *)v8 + 96))(v16);
  uint64_t v17 = sub_228AAD600();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)v9 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v17);
  swift_release();
  swift_retain();
  v15(0x6563637553736177, 0xED00006C75667373, v12 != 0);
  uint64_t v18 = swift_release();
  (*(void (**)(uint64_t))(*(void *)v9 + 200))(v18);
  swift_release_n();
  swift_release();
  return v12;
}

uint64_t sub_228A9C88C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_228A98864(v5, (uint64_t)&v17);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  uint64_t v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v17);
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v6 + 192))(0x6574617473, 0xE500000000000000, v17, v18);
  swift_release();
  uint64_t v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v6 + 200))(v7);
  swift_release();
  sub_228AAD5F0();
  uint64_t v8 = sub_228AAD5E0();
  sub_228A98864(v5, (uint64_t)&v17);
  swift_allocObject();
  uint64_t v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v17);
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v9 + 192))(0x6574617473, 0xE500000000000000, v17, v18);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_228A9BCC4(v9, a3, &v17);
  (*(void (**)(uint64_t))(*(void *)v8 + 96))(v10);
  uint64_t v11 = sub_228AAD600();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)v9 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v11);
  swift_release();
  uint64_t v12 = v17;
  BOOL v13 = v17 != 0;
  id v14 = *(void (**)(uint64_t, unint64_t, BOOL))(*(void *)v9 + 184);
  swift_retain();
  v14(0x6563637553736177, 0xED00006C75667373, v13);
  uint64_t v15 = swift_release();
  (*(void (**)(uint64_t))(*(void *)v9 + 200))(v15);
  swift_release_n();
  swift_release();
  return v12;
}

uint64_t sub_228A9CBC0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_228A98864(v5, (uint64_t)&v19);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  uint64_t v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v19);
  uint64_t v19 = 0;
  unint64_t v20 = 0xE000000000000000;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v6 + 192))(0x6574617473, 0xE500000000000000, v19, v20);
  swift_release();
  uint64_t v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v6 + 200))(v7);
  swift_release();
  sub_228AAD5F0();
  uint64_t v8 = sub_228AAD5E0();
  sub_228A98864(v5, (uint64_t)&v19);
  swift_allocObject();
  uint64_t v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v19);
  uint64_t v19 = 0;
  unint64_t v20 = 0xE000000000000000;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v9 + 192))(0x6574617473, 0xE500000000000000, v19, v20);
  swift_release();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient), sel_failsafeDelayedOfferJsonContext);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = sub_228AAD660();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  (*(void (**)(void))(*(void *)v8 + 96))();
  uint64_t v15 = sub_228AAD600();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)v9 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v15);
  swift_release();
  uint64_t v16 = *(void (**)(uint64_t, unint64_t, BOOL))(*(void *)v9 + 184);
  swift_retain();
  v16(0x6563637553736177, 0xED00006C75667373, v14 != 0);
  uint64_t v17 = swift_release();
  (*(void (**)(uint64_t))(*(void *)v9 + 200))(v17);
  swift_release_n();
  swift_release();
  return v12;
}

uint64_t sub_228A9CF20(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_228A98864(v5, (uint64_t)&v16);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  uint64_t v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v16);
  uint64_t v16 = 0;
  unint64_t v17 = 0xE000000000000000;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v6 + 192))(0x6574617473, 0xE500000000000000, v16, v17);
  swift_release();
  uint64_t v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v6 + 200))(v7);
  swift_release();
  sub_228AAD5F0();
  uint64_t v8 = sub_228AAD5E0();
  sub_228A98864(v5, (uint64_t)&v16);
  swift_allocObject();
  uint64_t v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v16);
  uint64_t v16 = 0;
  unint64_t v17 = 0xE000000000000000;
  sub_228AAD7C0();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(void *)v9 + 192))(0x6574617473, 0xE500000000000000, v16, v17);
  swift_release();
  swift_bridgeObjectRelease();
  id v10 = *(void **)(a3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  uint64_t v11 = (void *)sub_228AAD650();
  objc_msgSend(v10, sel_logFailsafeEvent_, v11);

  (*(void (**)(void))(*(void *)v8 + 96))();
  uint64_t v12 = sub_228AAD600();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)v9 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v12);
  swift_release();
  uint64_t v13 = *(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)v9 + 184);
  swift_retain();
  v13(0x6563637553736177, 0xED00006C75667373, 1);
  uint64_t v14 = swift_release();
  (*(void (**)(uint64_t))(*(void *)v9 + 200))(v14);
  swift_release_n();
  swift_release();
  return 42;
}

uint64_t sub_228A9D264()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_228A9D29C(uint64_t a1)
{
  sub_228AA9EDC(a1, *(void *)(v1 + 16));
}

uint64_t sub_228A9D2A8(uint64_t a1)
{
  return sub_228A9B91C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t (**)(uint64_t))(v1 + 32));
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

uint64_t sub_228A9D2CC(uint64_t a1)
{
  return sub_228AACEEC(a1, *(void *)(v1 + 16));
}

uint64_t sub_228A9D2D8(void *a1)
{
  return sub_228A9B42C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t (**)(void *))(v1 + 32));
}

uint64_t sub_228A9D2E4(uint64_t a1)
{
  return sub_228AA9EC4(a1, *(void *)(v1 + 16));
}

uint64_t objectdestroy_3Tm()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_228A9D338(void *a1)
{
  return sub_228A9AD9C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t (**)(void *))(v1 + 32));
}

uint64_t sub_228A9D344(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290A70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_228A9D3AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290A70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_228A9D40C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228AAD440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_228A9D470(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t NewOfferClientLibEvent.__allocating_init(withSink:)(uint64_t a1)
{
  swift_allocObject();
  sub_228A98864(a1, (uint64_t)v4);
  uint64_t v2 = MethodCallClientLibEvent.init(withMethod:andSink:)(2, (uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t NewOfferClientLibEvent.init(withSink:)(uint64_t a1)
{
  sub_228A98864(a1, (uint64_t)v4);
  uint64_t v2 = MethodCallClientLibEvent.init(withMethod:andSink:)(2, (uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t NewOfferClientLibEvent.add(responseAction:)()
{
  return swift_retain();
}

void NewOfferClientLibEvent.__allocating_init(withMethod:andSink:)()
{
}

void NewOfferClientLibEvent.init(withMethod:andSink:)()
{
}

uint64_t NewOfferClientLibEvent.__deallocating_deinit()
{
  uint64_t v0 = _s33iCloudSubscriptionOptimizerClient0D8LibEventCfd_0();
  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t type metadata accessor for NewOfferClientLibEvent()
{
  return self;
}

unint64_t sub_228A9D6EC()
{
  unint64_t result = sub_228A9ED2C(MEMORY[0x263F8EE78]);
  qword_268290A78 = result;
  return result;
}

uint64_t sub_228A9D714()
{
  uint64_t v0 = sub_228AAD2C0();
  MEMORY[0x270FA5388](v0 - 8);
  sub_228AAD240();
  sub_228AAD430();
  sub_228AAD3D0();
  sub_228AAD220();
  sub_228AAD3F0();
  sub_228AAD230();
  return sub_228AAD410();
}

uint64_t sub_228A9D7DC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290A70);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_228AAD440();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_228A9D344(v0 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_228A9D3AC((uint64_t)v3);
    if (qword_268290A28 != -1) {
      swift_once();
    }
    uint64_t refreshed = qword_268290A78;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_228A9D40C((uint64_t)v3, (uint64_t)v7);
    uint64_t refreshed = _s33iCloudSubscriptionOptimizerClient19QuotaServerProtocolV02toF14RefreshDetailsySDys11AnyHashableVypG01iabC4Core0iJ7ContextVFZ_0((uint64_t)v7);
    sub_228A98F38((uint64_t)v7);
  }
  return refreshed;
}

unint64_t sub_228A9DAB4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290A70);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_228AAD7A0();
  swift_bridgeObjectRelease();
  unint64_t v10 = 0xD00000000000001ALL;
  unint64_t v11 = 0x8000000228AAEF20;
  sub_228A9D344(v0 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context, (uint64_t)v3);
  sub_228AAD670();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  unint64_t v5 = v10;
  unint64_t v4 = v11;
  unint64_t v10 = 0x5B3D726F727265;
  unint64_t v11 = 0xE700000000000000;
  id v9 = *(id *)(v0 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError);
  id v6 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268290AA8);
  sub_228AAD670();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  unint64_t v10 = v5;
  unint64_t v11 = v4;
  swift_bridgeObjectRetain();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_228A9DCCC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290A70);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_228AAD440();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v16 - v9;
  if (*(void *)(v0 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError)) {
    return 1;
  }
  sub_228A9D344(v0 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_228A9D3AC((uint64_t)v3);
    return 1;
  }
  sub_228A9D40C((uint64_t)v3, (uint64_t)v10);
  sub_228AAD420();
  uint64_t v13 = sub_228AAD170();
  BOOL v11 = 1;
  uint64_t v14 = sub_228AAD170();
  sub_228A98ED4((uint64_t)v10, (uint64_t)v8);
  if (v13 != v14)
  {
    sub_228AAD420();
    uint64_t v15 = sub_228AAD170();
    BOOL v11 = v15 == sub_228AAD170();
  }
  sub_228A98F38((uint64_t)v8);
  sub_228A98F38((uint64_t)v10);
  return v11;
}

id sub_228A9DF1C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NewOfferResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_228A9DFA0()
{
  return type metadata accessor for NewOfferResponse();
}

uint64_t type metadata accessor for NewOfferResponse()
{
  uint64_t result = qword_268290A90;
  if (!qword_268290A90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_228A9DFF4()
{
  sub_228A9E08C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_228A9E08C()
{
  if (!qword_268290AA0)
  {
    sub_228AAD440();
    unint64_t v0 = sub_228AAD750();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268290AA0);
    }
  }
}

uint64_t sub_228A9E144()
{
  uint64_t v0 = sub_228AAD2C0();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_228AAD0A0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_228AAD300();
  sub_228AAD1A0();
  sub_228AAD2D0();
  sub_228AAD190();
  sub_228AAD320();
  sub_228AAD1B0();
  sub_228AAD340();
  return sub_228AAD1C0();
}

id sub_228A9E3F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationContent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_228A9E440()
{
  return type metadata accessor for NotificationContent();
}

uint64_t type metadata accessor for NotificationContent()
{
  uint64_t result = qword_268290AB0;
  if (!qword_268290AB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_228A9E494()
{
  uint64_t result = sub_228AAD390();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_228A9E524(uint64_t a1)
{
  uint64_t v2 = sub_228AAD390();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_228A9E6E8()
{
  sub_228AAD7A0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268290AD0);
  sub_228AAD670();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  id v1 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_responseError));
  __swift_instantiateConcreteTypeFromMangledName(&qword_268290AA8);
  sub_228AAD670();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  swift_bridgeObjectRetain();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  return 0xD00000000000001CLL;
}

id sub_228A9E960()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationPendingResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NotificationPendingResponse()
{
  return self;
}

unint64_t sub_228A9E9CC()
{
  unint64_t result = qword_268290AD8;
  if (!qword_268290AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268290AD8);
  }
  return result;
}

uint64_t sub_228A9EA20()
{
  return 1;
}

uint64_t sub_228A9EA28()
{
  return sub_228AAD8A0();
}

uint64_t sub_228A9EA6C()
{
  return sub_228AAD890();
}

uint64_t sub_228A9EA94()
{
  return sub_228AAD8A0();
}

uint64_t sub_228A9EAE4()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  uint64_t v1 = sub_228AACF20();

  return v1;
}

uint64_t getEnumTagSinglePayload for QuotaClientError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for QuotaClientError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x228A9EC94);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_228A9ECBC()
{
  return 0;
}

ValueMetadata *type metadata accessor for QuotaClientError()
{
  return &type metadata for QuotaClientError;
}

unint64_t sub_228A9ECD8()
{
  unint64_t result = qword_268290AE0;
  if (!qword_268290AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268290AE0);
  }
  return result;
}

unint64_t sub_228A9ED2C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C5E8);
  uint64_t v2 = sub_228AAD7F0();
  int v3 = (void *)v2;
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
    sub_228AA49B8(v6, (uint64_t)v15);
    unint64_t result = sub_228AA1590((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_228AA3EEC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
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

uint64_t sub_228A9EE60()
{
  uint64_t v0 = sub_228AAD5C0();
  __swift_allocate_value_buffer(v0, qword_268290AE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_268290AE8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268290B58);
  return sub_228AAD5D0();
}

void *QuotaServerProtocol.kMlServerScoreNotSet.unsafeMutableAddressor()
{
  return &static QuotaServerProtocol.kMlServerScoreNotSet;
}

double static QuotaServerProtocol.kMlServerScoreNotSet.getter()
{
  return 100.0;
}

const char *QuotaServerProtocol.FetchOffers.kSubdContext.unsafeMutableAddressor()
{
  return "subdContext";
}

uint64_t static QuotaServerProtocol.FetchOffers.kSubdContext.getter()
{
  return 0x746E6F4364627573;
}

const char *QuotaServerProtocol.FetchOffers.kOfferId.unsafeMutableAddressor()
{
  return "offerId";
}

uint64_t static QuotaServerProtocol.FetchOffers.kOfferId.getter()
{
  return 0x6449726566666FLL;
}

const char *QuotaServerProtocol.PushNotification.kCallSubD.unsafeMutableAddressor()
{
  return "callSubD";
}

uint64_t static QuotaServerProtocol.PushNotification.kCallSubD.getter()
{
  return 0x446275536C6C6163;
}

const char *QuotaServerProtocol.PushNotification.kMlServerScore.unsafeMutableAddressor()
{
  return "mlServerScore";
}

uint64_t static QuotaServerProtocol.PushNotification.kMlServerScore.getter()
{
  return 0x7265767265536C6DLL;
}

const char *QuotaServerProtocol.PushNotification.kLitmus.unsafeMutableAddressor()
{
  return "litmus";
}

uint64_t static QuotaServerProtocol.PushNotification.kLitmus.getter()
{
  return 0x73756D74696CLL;
}

const char *QuotaServerProtocol.PushNotification.kMaxDelayInSecs.unsafeMutableAddressor()
{
  return "maxDelayInSecs";
}

uint64_t static QuotaServerProtocol.PushNotification.kMaxDelayInSecs.getter()
{
  return 0x79616C654478616DLL;
}

const char *QuotaServerProtocol.PushNotification.kPreviousState.unsafeMutableAddressor()
{
  return "previousState";
}

uint64_t static QuotaServerProtocol.PushNotification.kPreviousState.getter()
{
  return 0x73756F6976657270;
}

const char *QuotaServerProtocol.PushNotification.kNotificationId.unsafeMutableAddressor()
{
  return "notificationId";
}

uint64_t static QuotaServerProtocol.PushNotification.kNotificationId.getter()
{
  return 0x6163696669746F6ELL;
}

void *QuotaServerProtocol.PushNotification.kLitmusInfoSeparator.unsafeMutableAddressor()
{
  return &static QuotaServerProtocol.PushNotification.kLitmusInfoSeparator;
}

uint64_t static QuotaServerProtocol.PushNotification.kLitmusInfoSeparator.getter()
{
  return 46;
}

void *QuotaServerProtocol.RefreshOfferDetails.kShouldDisplayNotificationNow.unsafeMutableAddressor()
{
  return &static QuotaServerProtocol.RefreshOfferDetails.kShouldDisplayNotificationNow;
}

unint64_t static QuotaServerProtocol.RefreshOfferDetails.kShouldDisplayNotificationNow.getter()
{
  return 0xD00000000000001CLL;
}

const char *QuotaServerProtocol.RefreshOfferDetails.kSubdWasCalled.unsafeMutableAddressor()
{
  return "subdWasCalled";
}

uint64_t static QuotaServerProtocol.RefreshOfferDetails.kSubdWasCalled.getter()
{
  return 0x4373615764627573;
}

void *QuotaServerProtocol.RefreshOfferDetails.kNotificationWasDelayed.unsafeMutableAddressor()
{
  return &static QuotaServerProtocol.RefreshOfferDetails.kNotificationWasDelayed;
}

unint64_t static QuotaServerProtocol.RefreshOfferDetails.kNotificationWasDelayed.getter()
{
  return 0xD000000000000016;
}

const char *QuotaServerProtocol.RefreshOfferDetails.kPreviousState.unsafeMutableAddressor()
{
  return "previousState";
}

uint64_t static QuotaServerProtocol.RefreshOfferDetails.kPreviousState.getter()
{
  return 0x73756F6976657270;
}

const char *QuotaServerProtocol.RefreshOfferDetails.kNotificationId.unsafeMutableAddressor()
{
  return "notificationId";
}

uint64_t static QuotaServerProtocol.RefreshOfferDetails.kNotificationId.getter()
{
  return 0x6163696669746F6ELL;
}

const char *QuotaServerProtocol.RefreshOfferDetails.kOfferId.unsafeMutableAddressor()
{
  return "offerId";
}

uint64_t static QuotaServerProtocol.RefreshOfferDetails.kOfferId.getter()
{
  return 0x6449726566666FLL;
}

void *QuotaServerProtocol.RefreshOfferDetails.kExpectedCallbackTs.unsafeMutableAddressor()
{
  return &static QuotaServerProtocol.RefreshOfferDetails.kExpectedCallbackTs;
}

unint64_t static QuotaServerProtocol.RefreshOfferDetails.kExpectedCallbackTs.getter()
{
  return 0xD000000000000012;
}

uint64_t static QuotaServerProtocol.toServerPushNotification(_:)()
{
  uint64_t v0 = sub_228AAD2C0();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_228AA3C0C();
  strcpy((char *)&v13, "notificationId");
  HIBYTE(v13) = -18;
  uint64_t v4 = MEMORY[0x263F8D310];
  sub_228AAD790();
  sub_228AAD340();
  uint64_t v5 = sub_228AAD280();
  uint64_t v7 = v6;
  sub_228AA4A88((uint64_t)v2, MEMORY[0x263F88C28]);
  uint64_t v14 = v4;
  *(void *)&long long v13 = v5;
  *((void *)&v13 + 1) = v7;
  sub_228AA3EEC(&v13, v12);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = v3;
  sub_228AA1C7C(v12, (uint64_t)v15, isUniquelyReferenced_nonNull_native);
  uint64_t v9 = v11;
  swift_bridgeObjectRelease();
  sub_228AA3EFC((uint64_t)v15);
  return v9;
}

uint64_t sub_228A9F2D4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_228AA3EEC((_OWORD *)a1, v7);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v6 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_228AA1C7C(v7, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v6;
    swift_bridgeObjectRelease();
    return sub_228AA3EFC(a2);
  }
  else
  {
    sub_228AA4024(a1, &qword_268290B08);
    sub_228AA169C(a2, v7);
    sub_228AA3EFC(a2);
    return sub_228AA4024((uint64_t)v7, &qword_268290B08);
  }
}

unint64_t static QuotaServerProtocol.toServerFetchOffers(_:)()
{
  uint64_t v0 = sub_228AAD2C0();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C5F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_228AAE580;
  uint64_t v10 = 0x6449726566666FLL;
  unint64_t v11 = 0xE700000000000000;
  uint64_t v4 = MEMORY[0x263F8D310];
  sub_228AAD790();
  sub_228AAD340();
  uint64_t v5 = sub_228AAD2A0();
  uint64_t v7 = v6;
  sub_228AA4A88((uint64_t)v2, MEMORY[0x263F88C28]);
  *(void *)(inited + 96) = v4;
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = v7;
  uint64_t v10 = 0x746E6F4364627573;
  unint64_t v11 = 0xEB00000000747865;
  sub_228AAD790();
  uint64_t v8 = sub_228AA3C0C();
  *(void *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B00);
  *(void *)(inited + 144) = v8;
  return sub_228A9ED2C(inited);
}

uint64_t static QuotaServerProtocol.parse(fromFetchOffers:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_228AAD5C0();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = 0x6449726566666FLL;
  unint64_t v21 = 0xE700000000000000;
  sub_228AAD790();
  if (*(void *)(a1 + 16) && (unint64_t v7 = sub_228AA1590((uint64_t)&v22), (v8 & 1) != 0))
  {
    sub_228AA3F88(*(void *)(a1 + 56) + 32 * v7, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  sub_228AA3EFC((uint64_t)&v22);
  if (!*((void *)&v25 + 1))
  {
    sub_228AA4024((uint64_t)&v24, &qword_268290B08);
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    if (qword_268290A30 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v4, (uint64_t)qword_268290AE8);
    sub_228AA4A20(v13, (uint64_t)v6, MEMORY[0x263F88E40]);
    unint64_t v22 = 0;
    unint64_t v23 = 0xE000000000000000;
    sub_228AAD7A0();
    swift_bridgeObjectRelease();
    unint64_t v14 = 0xD00000000000002BLL;
    uint64_t v15 = "The key [offerId] is not present. context=[";
    goto LABEL_23;
  }
  uint64_t v10 = v20;
  uint64_t v9 = v21;
  uint64_t v20 = 0x746E6F4364627573;
  unint64_t v21 = 0xEB00000000747865;
  sub_228AAD790();
  if (*(void *)(a1 + 16) && (unint64_t v11 = sub_228AA1590((uint64_t)&v22), (v12 & 1) != 0))
  {
    sub_228AA3F88(*(void *)(a1 + 56) + 32 * v11, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  sub_228AA3EFC((uint64_t)&v22);
  if (*((void *)&v25 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268290B00);
    if (swift_dynamicCast())
    {
      static QuotaServerProtocol.toFetchOffersContext(context:notificationId:offerId:)(v20, 0, 0, v10, v9, a2);
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_228AA4024((uint64_t)&v24, &qword_268290B08);
  }
  if (qword_268290A30 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v4, (uint64_t)qword_268290AE8);
  sub_228AA4A20(v17, (uint64_t)v6, MEMORY[0x263F88E40]);
  unint64_t v22 = 0;
  unint64_t v23 = 0xE000000000000000;
  sub_228AAD7A0();
  swift_bridgeObjectRelease();
  unint64_t v14 = 0xD00000000000002FLL;
  uint64_t v15 = "The key [subdContext] is not present. context=[";
LABEL_23:
  unint64_t v22 = v14;
  unint64_t v23 = (unint64_t)(v15 - 32) | 0x8000000000000000;
  sub_228AAD630();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  sub_228AAD5A0();
  swift_bridgeObjectRelease();
  sub_228AA4A88((uint64_t)v6, MEMORY[0x263F88E40]);
  uint64_t v18 = sub_228AAD390();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a2, 1, 1, v18);
}

uint64_t static QuotaServerProtocol.toFetchOffersContext(context:notificationId:offerId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v68 = a5;
  uint64_t v65 = a4;
  uint64_t v67 = a3;
  uint64_t v64 = a2;
  uint64_t v72 = a6;
  uint64_t v66 = sub_228AAD2C0();
  MEMORY[0x270FA5388](v66);
  v69 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B10);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_228AAD0A0();
  uint64_t v71 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v70 = (uint64_t)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_228AAD5C0();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v64 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  unint64_t v22 = (char *)&v64 - v21;
  MEMORY[0x270FA5388](v20);
  long long v24 = (char *)&v64 - v23;
  *(void *)&long long v74 = 0x446275536C6C6163;
  *((void *)&v74 + 1) = 0xE800000000000000;
  sub_228AAD790();
  if (*(void *)(a1 + 16) && (unint64_t v25 = sub_228AA1590((uint64_t)&v77), (v26 & 1) != 0))
  {
    sub_228AA3F88(*(void *)(a1 + 56) + 32 * v25, (uint64_t)&v79);
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  sub_228AA3EFC((uint64_t)&v77);
  if (!*((void *)&v80 + 1))
  {
    sub_228AA4024((uint64_t)&v79, &qword_268290B08);
    goto LABEL_11;
  }
  sub_228AA3FE4();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    if (qword_268290A30 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v13, (uint64_t)qword_268290AE8);
    sub_228AA4A20(v30, (uint64_t)v16, MEMORY[0x263F88E40]);
    unint64_t v77 = 0;
    unint64_t v78 = 0xE000000000000000;
    sub_228AAD7A0();
    swift_bridgeObjectRelease();
    *(void *)&long long v74 = 0x5B20646E756F46;
    *((void *)&v74 + 1) = 0xE700000000000000;
    *(void *)&long long v79 = 0x446275536C6C6163;
    *((void *)&v79 + 1) = 0xE800000000000000;
    sub_228AAD790();
    if (*(void *)(a1 + 16))
    {
      unint64_t v31 = sub_228AA1590((uint64_t)&v77);
      uint64_t v32 = v72;
      if (v33)
      {
        sub_228AA3F88(*(void *)(a1 + 56) + 32 * v31, (uint64_t)&v79);
      }
      else
      {
        long long v79 = 0u;
        long long v80 = 0u;
      }
    }
    else
    {
      long long v79 = 0u;
      long long v80 = 0u;
      uint64_t v32 = v72;
    }
    sub_228AA3EFC((uint64_t)&v77);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268290B08);
    sub_228AAD670();
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    sub_228AAD6C0();
    unint64_t v77 = 0xD000000000000025;
    unint64_t v78 = 0x8000000228AAF1F0;
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    sub_228AAD5B0();
    swift_bridgeObjectRelease();
    v34 = (uint64_t (*)(void))MEMORY[0x263F88E40];
    uint64_t v35 = (uint64_t)v16;
    goto LABEL_19;
  }
  unint64_t v27 = (void *)v74;
  uint64_t v76 = 0x4059000000000000;
  strcpy((char *)&v74, "mlServerScore");
  HIWORD(v74) = -4864;
  sub_228AAD790();
  if (*(void *)(a1 + 16))
  {
    unint64_t v28 = sub_228AA1590((uint64_t)&v77);
    if (v29)
    {
      sub_228AA3F88(*(void *)(a1 + 56) + 32 * v28, (uint64_t)&v74);
    }
    else
    {
      long long v74 = 0u;
      long long v75 = 0u;
    }
  }
  else
  {
    long long v74 = 0u;
    long long v75 = 0u;
  }
  sub_228AA3EFC((uint64_t)&v77);
  if (*((void *)&v75 + 1))
  {
    sub_228AA3EEC(&v74, &v79);
    sub_228AA3F88((uint64_t)&v79, (uint64_t)&v77);
    if (!swift_dynamicCast())
    {
      if (qword_268290A30 != -1) {
        swift_once();
      }
      uint64_t v41 = __swift_project_value_buffer(v13, (uint64_t)qword_268290AE8);
      sub_228AA4A20(v41, (uint64_t)v24, MEMORY[0x263F88E40]);
      unint64_t v77 = 0;
      unint64_t v78 = 0xE000000000000000;
      sub_228AAD7A0();
      swift_bridgeObjectRelease();
      unint64_t v77 = 0;
      unint64_t v78 = 0xE000000000000000;
      sub_228AAD7A0();
      sub_228AAD6C0();
      sub_228AAD7C0();
      sub_228AAD6C0();
      unint64_t v77 = 0xD000000000000023;
      unint64_t v78 = 0x8000000228AAF2B0;
      sub_228AAD6C0();
      swift_bridgeObjectRelease();
      sub_228AAD5B0();

      swift_bridgeObjectRelease();
      sub_228AA4A88((uint64_t)v24, MEMORY[0x263F88E40]);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v79);
      goto LABEL_40;
    }
    uint64_t v38 = v74;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v79);
    uint64_t v76 = v38;
  }
  else
  {
    sub_228AA4024((uint64_t)&v74, &qword_268290B08);
  }
  *(void *)&long long v74 = 0x73756D74696CLL;
  *((void *)&v74 + 1) = 0xE600000000000000;
  sub_228AAD790();
  if (*(void *)(a1 + 16))
  {
    unint64_t v39 = sub_228AA1590((uint64_t)&v77);
    if (v40)
    {
      sub_228AA3F88(*(void *)(a1 + 56) + 32 * v39, (uint64_t)&v79);
    }
    else
    {
      long long v79 = 0u;
      long long v80 = 0u;
    }
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  sub_228AA3EFC((uint64_t)&v77);
  if (!*((void *)&v80 + 1))
  {
    sub_228AA4024((uint64_t)&v79, &qword_268290B08);
    goto LABEL_42;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_42:
    if (qword_268290A30 != -1) {
      swift_once();
    }
    uint64_t v44 = __swift_project_value_buffer(v13, (uint64_t)qword_268290AE8);
    sub_228AA4A20(v44, (uint64_t)v19, MEMORY[0x263F88E40]);
    unint64_t v77 = 0;
    unint64_t v78 = 0xE000000000000000;
    sub_228AAD7A0();
    swift_bridgeObjectRelease();
    *(void *)&long long v74 = 0x5B20646E756F46;
    *((void *)&v74 + 1) = 0xE700000000000000;
    *(void *)&long long v79 = 0x73756D74696CLL;
    *((void *)&v79 + 1) = 0xE600000000000000;
    sub_228AAD790();
    if (*(void *)(a1 + 16))
    {
      unint64_t v45 = sub_228AA1590((uint64_t)&v77);
      uint64_t v32 = v72;
      if (v46)
      {
        sub_228AA3F88(*(void *)(a1 + 56) + 32 * v45, (uint64_t)&v79);
      }
      else
      {
        long long v79 = 0u;
        long long v80 = 0u;
      }
    }
    else
    {
      long long v79 = 0u;
      long long v80 = 0u;
      uint64_t v32 = v72;
    }
    sub_228AA3EFC((uint64_t)&v77);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268290B08);
    sub_228AAD670();
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    sub_228AAD6C0();
    unint64_t v77 = 0xD000000000000022;
    unint64_t v78 = 0x8000000228AAF220;
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    sub_228AAD5B0();
    swift_bridgeObjectRelease();

    v34 = (uint64_t (*)(void))MEMORY[0x263F88E40];
    uint64_t v35 = (uint64_t)v19;
    goto LABEL_19;
  }
  static QuotaServerProtocol.parseLitmusInfo(_:)(v74, *((unint64_t *)&v74 + 1), (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v10, 1, v11) == 1)
  {
    sub_228AA4024((uint64_t)v10, &qword_268290B10);
    if (qword_268290A30 != -1) {
      swift_once();
    }
    uint64_t v42 = __swift_project_value_buffer(v13, (uint64_t)qword_268290AE8);
    sub_228AA4A20(v42, (uint64_t)v24, MEMORY[0x263F88E40]);
    unint64_t v77 = 0;
    unint64_t v78 = 0xE000000000000000;
    sub_228AAD7A0();
    swift_bridgeObjectRelease();
    unint64_t v77 = 0xD000000000000024;
    unint64_t v78 = 0x8000000228AAF250;
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    sub_228AAD6C0();
    sub_228AAD5B0();
    swift_bridgeObjectRelease();

    sub_228AA4A88((uint64_t)v24, MEMORY[0x263F88E40]);
LABEL_40:
    uint64_t v43 = sub_228AAD390();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v72, 1, 1, v43);
  }
  swift_bridgeObjectRelease();
  uint64_t v47 = (uint64_t)v10;
  uint64_t v48 = v70;
  sub_228AA4080(v47, v70);
  strcpy((char *)&v74, "maxDelayInSecs");
  HIBYTE(v74) = -18;
  sub_228AAD790();
  if (*(void *)(a1 + 16))
  {
    unint64_t v49 = sub_228AA1590((uint64_t)&v77);
    uint64_t v50 = (uint64_t)v69;
    if (v51)
    {
      sub_228AA3F88(*(void *)(a1 + 56) + 32 * v49, (uint64_t)&v79);
    }
    else
    {
      long long v79 = 0u;
      long long v80 = 0u;
    }
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v50 = (uint64_t)v69;
  }
  sub_228AA3EFC((uint64_t)&v77);
  if (!*((void *)&v80 + 1))
  {
    sub_228AA4024((uint64_t)&v79, &qword_268290B08);
    goto LABEL_61;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_61:
    if (qword_268290A30 != -1) {
      swift_once();
    }
    uint64_t v56 = __swift_project_value_buffer(v13, (uint64_t)qword_268290AE8);
    sub_228AA4A20(v56, (uint64_t)v22, MEMORY[0x263F88E40]);
    unint64_t v77 = 0;
    unint64_t v78 = 0xE000000000000000;
    sub_228AAD7A0();
    swift_bridgeObjectRelease();
    *(void *)&long long v74 = 0x5B20646E756F46;
    *((void *)&v74 + 1) = 0xE700000000000000;
    strcpy((char *)&v79, "maxDelayInSecs");
    HIBYTE(v79) = -18;
    sub_228AAD790();
    if (*(void *)(a1 + 16))
    {
      unint64_t v57 = sub_228AA1590((uint64_t)&v77);
      uint64_t v32 = v72;
      if (v58)
      {
        sub_228AA3F88(*(void *)(a1 + 56) + 32 * v57, (uint64_t)&v79);
      }
      else
      {
        long long v79 = 0u;
        long long v80 = 0u;
      }
    }
    else
    {
      long long v79 = 0u;
      long long v80 = 0u;
      uint64_t v32 = v72;
    }
    sub_228AA3EFC((uint64_t)&v77);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268290B08);
    sub_228AAD670();
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    sub_228AAD6C0();
    unint64_t v77 = 0xD00000000000002ALL;
    unint64_t v78 = 0x8000000228AAF280;
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    sub_228AAD5B0();
    swift_bridgeObjectRelease();

    sub_228AA4A88((uint64_t)v22, MEMORY[0x263F88E40]);
    v34 = (uint64_t (*)(void))MEMORY[0x263F88B28];
    uint64_t v35 = v48;
LABEL_19:
    sub_228AA4A88(v35, v34);
    uint64_t v36 = sub_228AAD390();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v32, 1, 1, v36);
  }
  uint64_t v52 = v74;
  *(void *)&long long v74 = 0;
  *((void *)&v74 + 1) = 0xE000000000000000;
  strcpy((char *)v73, "previousState");
  HIWORD(v73[1]) = -4864;
  sub_228AAD790();
  if (*(void *)(a1 + 16))
  {
    unint64_t v53 = sub_228AA1590((uint64_t)&v77);
    uint64_t v54 = v72;
    if (v55)
    {
      sub_228AA3F88(*(void *)(a1 + 56) + 32 * v53, (uint64_t)&v79);
    }
    else
    {
      long long v79 = 0u;
      long long v80 = 0u;
    }
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v54 = v72;
  }
  sub_228AA3EFC((uint64_t)&v77);
  if (*((void *)&v80 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v59 = v73[0];
      uint64_t v60 = v73[1];
      swift_bridgeObjectRelease();
      *(void *)&long long v74 = v59;
      *((void *)&v74 + 1) = v60;
    }
  }
  else
  {
    sub_228AA4024((uint64_t)&v79, &qword_268290B08);
  }
  id v61 = objc_msgSend(v27, sel_BOOLValue, v64, v65, v66);
  if (v61) {
    uint64_t v62 = 2;
  }
  else {
    uint64_t v62 = 1;
  }
  MEMORY[0x270FA5388](v61);
  *(&v64 - 2) = (uint64_t)&v74;
  sub_228AA47D0(&qword_268290B20, MEMORY[0x263F88C28]);
  sub_228AACF50();
  if (v67)
  {
    swift_bridgeObjectRetain();
    sub_228AAD290();
  }
  if (v68)
  {
    swift_bridgeObjectRetain();
    sub_228AAD2B0();
  }
  uint64_t v63 = sub_228AAD390();
  MEMORY[0x270FA5388](v63);
  *(&v64 - 6) = v62;
  *((unsigned char *)&v64 - 40) = 1;
  *(&v64 - 4) = v48;
  *(&v64 - 3) = v52;
  *(&v64 - 2) = (uint64_t)&v76;
  *(&v64 - 1) = v50;
  sub_228AA47D0(&qword_268290B28, MEMORY[0x263F88C58]);
  sub_228AACF50();

  sub_228AA4A88(v48, MEMORY[0x263F88B28]);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v54, 0, 1, v63);
  sub_228AA4A88(v50, MEMORY[0x263F88C28]);
  return swift_bridgeObjectRelease();
}

uint64_t static QuotaServerProtocol.parse(fromPushNotification:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_228AAD5C0();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v13[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  strcpy((char *)v13, "notificationId");
  HIBYTE(v13[1]) = -18;
  sub_228AAD790();
  if (*(void *)(a1 + 16) && (unint64_t v7 = sub_228AA1590((uint64_t)&v14), (v8 & 1) != 0))
  {
    sub_228AA3F88(*(void *)(a1 + 56) + 32 * v7, (uint64_t)&v16);
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_228AA3EFC((uint64_t)&v14);
  if (*((void *)&v17 + 1))
  {
    if (swift_dynamicCast())
    {
      static QuotaServerProtocol.toFetchOffersContext(context:notificationId:offerId:)(a1, v13[0], v13[1], 0, 0, a2);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_228AA4024((uint64_t)&v16, &qword_268290B08);
  }
  if (qword_268290A30 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v4, (uint64_t)qword_268290AE8);
  sub_228AA4A20(v10, (uint64_t)v6, MEMORY[0x263F88E40]);
  unint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  sub_228AAD7A0();
  swift_bridgeObjectRelease();
  unint64_t v14 = 0xD000000000000032;
  unint64_t v15 = 0x8000000228AAF300;
  sub_228AAD630();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  sub_228AAD5A0();
  swift_bridgeObjectRelease();
  sub_228AA4A88((uint64_t)v6, MEMORY[0x263F88E40]);
  uint64_t v11 = sub_228AAD390();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a2, 1, 1, v11);
}

uint64_t static QuotaServerProtocol.parseLitmusInfo(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_228AAD5C0();
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v56 = 46;
  unint64_t v57 = 0xE100000000000000;
  uint64_t v54 = &v56;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_228AA202C(0x7FFFFFFFFFFFFFFFLL, 1, sub_228AA415C, (uint64_t)v53, a1, a2);
  uint64_t v10 = v9;
  uint64_t v11 = *((void *)v9 + 2);
  if (v11 != 4)
  {
    if (qword_268290A30 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v6, (uint64_t)qword_268290AE8);
    sub_228AA4A20(v18, (uint64_t)v8, MEMORY[0x263F88E40]);
    unint64_t v56 = 0;
    unint64_t v57 = 0xE000000000000000;
    sub_228AAD7A0();
    sub_228AAD6C0();
    sub_228AAD640();
    sub_228AAD6C0();
    unint64_t v56 = 0xD000000000000031;
    unint64_t v57 = 0x8000000228AAF340;
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    unint64_t v20 = v56;
    unint64_t v19 = v57;
    unint64_t v56 = 0;
    unint64_t v57 = 0xE000000000000000;
    sub_228AAD7A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v56 = 0x5B20646E756F46;
    unint64_t v57 = 0xE700000000000000;
    uint64_t v55 = v11;
    sub_228AAD810();
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    sub_228AAD6C0();
    unint64_t v56 = v20;
    unint64_t v57 = v19;
    swift_bridgeObjectRetain();
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_228AAD5B0();
    swift_bridgeObjectRelease();
    sub_228AA4A88((uint64_t)v8, MEMORY[0x263F88E40]);
    uint64_t v21 = sub_228AAD0A0();
    unint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
    uint64_t v23 = a3;
    return v22(v23, 1, 1, v21);
  }
  uint64_t v51 = a1;
  uint64_t v52 = a3;
  uint64_t v12 = *((void *)v9 + 4);
  uint64_t v13 = *((void *)v9 + 5);
  if ((v13 ^ (unint64_t)v12) < 0x4000) {
    goto LABEL_20;
  }
  unint64_t v15 = *((void *)v9 + 6);
  unint64_t v14 = *((void *)v9 + 7);
  uint64_t result = sub_228AA30BC(*((void *)v9 + 4), *((void *)v9 + 5), v15, v14, 10);
  if ((result & 0x10000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_228AA244C(v12, v13, v15, v14, 10);
    uint64_t result = swift_bridgeObjectRelease();
    if ((v17 & 0x100000000) != 0) {
      goto LABEL_20;
    }
  }
  else
  {
    LODWORD(v17) = result;
    if ((result & 0x100000000) != 0) {
      goto LABEL_20;
    }
  }
  if (*((void *)v10 + 2) < 2uLL)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v25 = *((void *)v10 + 8);
  uint64_t v24 = *((void *)v10 + 9);
  if ((v24 ^ (unint64_t)v25) < 0x4000)
  {
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    uint64_t v33 = v52;
    if (qword_268290A30 != -1) {
      swift_once();
    }
    uint64_t v34 = __swift_project_value_buffer(v6, (uint64_t)qword_268290AE8);
    sub_228AA4A20(v34, (uint64_t)v8, MEMORY[0x263F88E40]);
    unint64_t v56 = 0x5B20646E756F46;
    unint64_t v57 = 0xE700000000000000;
    sub_228AAD6C0();
    sub_228AAD6C0();
    unint64_t v56 = 0xD000000000000053;
    unint64_t v57 = 0x8000000228AAF380;
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    sub_228AAD5B0();
    swift_bridgeObjectRelease();
    sub_228AA4A88((uint64_t)v8, MEMORY[0x263F88E40]);
    uint64_t v21 = sub_228AAD0A0();
    unint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
    uint64_t v23 = v33;
    return v22(v23, 1, 1, v21);
  }
  unint64_t v26 = *((void *)v10 + 10);
  unint64_t v27 = *((void *)v10 + 11);
  uint64_t result = sub_228AA30BC(*((void *)v10 + 8), *((void *)v10 + 9), v26, v27, 10);
  if ((result & 0x10000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_228AA244C(v25, v24, v26, v27, 10);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v50 = v28;
    if ((v28 & 0x100000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  uint64_t v50 = result;
  if ((result & 0x100000000) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  if (*((void *)v10 + 2) < 3uLL)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  uint64_t v29 = *((void *)v10 + 12);
  uint64_t v30 = *((void *)v10 + 13);
  if ((v30 ^ (unint64_t)v29) < 0x4000) {
    goto LABEL_20;
  }
  unint64_t v31 = *((void *)v10 + 14);
  unint64_t v32 = *((void *)v10 + 15);
  uint64_t result = sub_228AA30BC(*((void *)v10 + 12), *((void *)v10 + 13), v31, v32, 10);
  if ((result & 0x10000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_228AA244C(v29, v30, v31, v32, 10);
    swift_bridgeObjectRelease();
    uint64_t result = v35;
    if ((v35 & 0x100000000) != 0) {
      goto LABEL_20;
    }
  }
  else if ((result & 0x100000000) != 0)
  {
    goto LABEL_20;
  }
  uint64_t v49 = result;
  if (*((void *)v10 + 2) < 4uLL) {
    goto LABEL_31;
  }
  uint64_t v36 = *((void *)v10 + 16);
  uint64_t v37 = *((void *)v10 + 17);
  uint64_t v38 = *((void *)v10 + 18);
  uint64_t v39 = *((void *)v10 + 19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = MEMORY[0x22A6A5190](v36, v37, v38, v39);
  uint64_t v42 = v41;
  swift_bridgeObjectRelease();
  uint64_t v43 = sub_228AA45DC(v40, v42);
  __int16 v45 = v44;
  swift_bridgeObjectRelease();
  if ((v45 & 0x100) != 0) {
    goto LABEL_21;
  }
  uint64_t v46 = sub_228AAD0A0();
  MEMORY[0x270FA5388](v46);
  int v47 = v50;
  *((_DWORD *)&v49 - 8) = v17;
  *((_DWORD *)&v49 - 7) = v47;
  *((_DWORD *)&v49 - 6) = v49;
  *(&v49 - 2) = v43;
  *((unsigned char *)&v49 - 8) = v45 & 1;
  sub_228AA47D0(&qword_268290B30, MEMORY[0x263F88B28]);
  uint64_t v48 = v52;
  sub_228AACF50();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v48, 0, 1, v46);
}

uint64_t sub_228AA13CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = sub_228AAD2C0();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_228AAD0A0();
  MEMORY[0x270FA5388](v12 - 8);
  unint64_t v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_228AAD380();
  sub_228AA4A20(a4, (uint64_t)v14, MEMORY[0x263F88B28]);
  sub_228AAD2E0();
  sub_228AAD330();
  sub_228AAD310();
  sub_228AA4A20(a7, (uint64_t)v11, MEMORY[0x263F88C28]);
  return sub_228AAD350();
}

uint64_t sub_228AA1524()
{
  return sub_228AAD040();
}

unint64_t sub_228AA1590(uint64_t a1)
{
  uint64_t v2 = sub_228AAD770();
  return sub_228AA15D4(a1, v2);
}

unint64_t sub_228AA15D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_228AA495C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x22A6A5290](v9, a1);
      sub_228AA3EFC((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_228AA169C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_228AA1590(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_228AA1E44();
      uint64_t v9 = v11;
    }
    sub_228AA3EFC(*(void *)(v9 + 48) + 40 * v6);
    sub_228AA3EEC((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_228AA1AB0(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_228AA1798(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C5E8);
  uint64_t v6 = sub_228AAD7E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_228AA3EEC((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_228AA495C(v25, (uint64_t)&v38);
      sub_228AA3F88(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_228AAD770();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_228AA3EEC(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_228AA1AB0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_228AAD760();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_228AA495C(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        uint64_t v10 = sub_228AAD770();
        uint64_t result = sub_228AA3EFC((uint64_t)v28);
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            uint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            int64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *unint64_t v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *unint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_228AA1C7C(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_228AA1590(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_228AA1E44();
      goto LABEL_7;
    }
    sub_228AA1798(v13, a3 & 1);
    unint64_t v19 = sub_228AA1590(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_228AA495C(a2, (uint64_t)v21);
      return sub_228AA1DC8(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_228AAD830();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return sub_228AA3EEC(a1, v17);
}

_OWORD *sub_228AA1DC8(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_228AA3EEC(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

void *sub_228AA1E44()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C5E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_228AAD7D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_228AA495C(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_228AA3F88(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_228AA3EEC(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_228AA202C(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v11 = a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = MEMORY[0x263F8EE78];
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = 15;
  uint64_t v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v16 = HIBYTE(a6) & 0xF) : (uint64_t v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v15 = v11 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_228AA2D90(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  uint64_t v38 = a1;
  uint64_t v39 = v14;
  unint64_t v44 = 4 * v16;
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v9 = 15;
  unint64_t v8 = 15;
  unint64_t v17 = 15;
  while (1)
  {
    v46[0] = sub_228AAD720();
    v46[1] = v18;
    uint64_t v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    uint64_t v6 = v19;
    swift_bridgeObjectRelease();
    if (v6) {
      break;
    }
    unint64_t v9 = sub_228AAD6B0();
LABEL_9:
    if (v44 == v9 >> 14) {
      goto LABEL_29;
    }
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v9 = sub_228AAD6B0();
    *(void *)(v43 + 16) = v9;
    unint64_t v8 = v9;
    unint64_t v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v20 = sub_228AAD740();
  uint64_t v40 = v21;
  uint64_t v41 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v10 = sub_228AA2EA0(0, *((void *)v10 + 2) + 1, 1, v10);
  }
  unint64_t v27 = *((void *)v10 + 2);
  unint64_t v26 = *((void *)v10 + 3);
  uint64_t v6 = v27 + 1;
  if (v27 >= v26 >> 1) {
    uint64_t v10 = sub_228AA2EA0((char *)(v26 > 1), v27 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v6;
  uint64_t v28 = &v10[32 * v27];
  *((void *)v28 + 4) = v41;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v40;
  *(void *)(v39 + 16) = v10;
  uint64_t v29 = sub_228AAD6B0();
  unint64_t v9 = v29;
  *(void *)(v43 + 16) = v29;
  if (*((void *)v10 + 2) != v38)
  {
    unint64_t v8 = v29;
    unint64_t v17 = v29;
    goto LABEL_9;
  }
  unint64_t v17 = v29;
  unint64_t v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    uint64_t v6 = sub_228AAD740();
    unint64_t v8 = v31;
    unint64_t v9 = v32;
    uint64_t v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t v10 = sub_228AA2EA0(0, *((void *)v10 + 2) + 1, 1, v10);
LABEL_34:
  unint64_t v35 = *((void *)v10 + 2);
  unint64_t v34 = *((void *)v10 + 3);
  if (v35 >= v34 >> 1) {
    uint64_t v10 = sub_228AA2EA0((char *)(v34 > 1), v35 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v35 + 1;
  uint64_t v36 = &v10[32 * v35];
  *((void *)v36 + 4) = v6;
  *((void *)v36 + 5) = v8;
  *((void *)v36 + 6) = v9;
  *((void *)v36 + 7) = v11;
  *(void *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

uint64_t sub_228AA244C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_228AA485C();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_228AAD730();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_228AA27C0();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v9 = (unsigned __int8 *)sub_228AAD7B0();
  }
LABEL_7:
  int64_t v13 = sub_228AA2540(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 | ((((unint64_t)v13 >> 32) & 1) << 32);
}

unsigned __int8 *sub_228AA2540(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            uint64_t v23 = (int)v8 * (uint64_t)(int)a3;
            if (v23 != (int)v23) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__OFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            uint64_t v31 = (int)v28 * (uint64_t)(int)a3;
            if (v31 != (int)v31) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__OFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          unint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            uint64_t v14 = (int)v8 * (uint64_t)(int)a3;
            if (v14 != (int)v14) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (__OFSUB__(v14, v15)) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_228AA27C0()
{
  unint64_t v0 = sub_228AAD740();
  uint64_t v4 = sub_228AA2840(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_228AA2840(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_228AA2998(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_228AA2A98(v9, 0);
      unint64_t v12 = sub_228AA2B00((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_228AAD7B0();
LABEL_4:
        JUMPOUT(0x22A6A51A0);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x22A6A51A0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22A6A51A0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_228AA2998(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    uint64_t result = sub_228AA2D14(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_228AA2D14(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  return sub_228AAD6F0();
}

void *sub_228AA2A98(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268290B48);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_228AA2B00(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_228AA2D14(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_228AAD700();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_228AAD7B0();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_228AA2D14(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_228AAD6D0();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_228AA2D14(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_228AAD710();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x22A6A51F0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_228AA2D90(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v10 = *(void *)(a2 + 16) >> 14;
  int v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1) {
    return v11 ^ 1u;
  }
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = a4;
  uint64_t v5 = sub_228AAD740();
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  uint64_t v9 = *(char **)(v4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    uint64_t v9 = sub_228AA2EA0(0, *((void *)v9 + 2) + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  unint64_t v17 = *((void *)v9 + 2);
  unint64_t v16 = *((void *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    uint64_t v9 = sub_228AA2EA0((char *)(v16 > 1), v17 + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  *((void *)v9 + 2) = v17 + 1;
  unint64_t v18 = &v9[32 * v17];
  *((void *)v18 + 4) = v5;
  *((void *)v18 + 5) = v6;
  *((void *)v18 + 6) = v7;
  *((void *)v18 + 7) = v8;
  return v11 ^ 1u;
}

char *sub_228AA2EA0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268290B50);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_228AA2FA4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_228AA2FC4(a1, a2, a3, *v3);
  *char v3 = result;
  return result;
}

char *sub_228AA2FC4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268290B38);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  size_t v15 = 16 * v8;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_release();
  return v10;
}

uint64_t sub_228AA30BC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    LODWORD(result) = 0;
    unsigned __int8 v14 = 0;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v13[0] = a3;
    v13[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    int64_t v11 = v13;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    int64_t v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    int64_t v11 = (void *)sub_228AAD7B0();
  }
  uint64_t result = sub_228AA41B4((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    unsigned __int8 v14 = BYTE4(result) & 1;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  return result;
}

uint64_t sub_228AA3190(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = MEMORY[0x263F8D310];
    sub_228AAD790();
    v9[3] = v7;
    v9[0] = a3;
    v9[1] = a4;
    swift_bridgeObjectRetain();
    return sub_228A9F2D4((uint64_t)v9, (uint64_t)v10);
  }
  return result;
}

uint64_t _s33iCloudSubscriptionOptimizerClient19QuotaServerProtocolV02toF14RefreshDetailsySDys11AnyHashableVypG01iabC4Core0iJ7ContextVFZ_0(uint64_t a1)
{
  sub_228AAD2C0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v60 = (char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_228AAD440();
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v59 = (uint64_t)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v58 = (uint64_t)&v57 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v57 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v57 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  size_t v15 = (char *)&v57 - v14;
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v57 - v16;
  unint64_t v18 = sub_228A9ED2C(MEMORY[0x263F8EE78]);
  *(void *)&v69[0] = 0xD00000000000001CLL;
  *((void *)&v69[0] + 1) = 0x8000000228AAF130;
  sub_228AAD790();
  sub_228AAD420();
  uint64_t v19 = sub_228AAD170();
  uint64_t v20 = sub_228AAD170();
  sub_228AA4A20(a1, (uint64_t)v17, MEMORY[0x263F88C88]);
  if (v19 == v20)
  {
    sub_228AA4A88((uint64_t)v17, MEMORY[0x263F88C88]);
    sub_228AA4A20(a1, (uint64_t)v15, MEMORY[0x263F88C88]);
    BOOL v21 = 1;
  }
  else
  {
    sub_228AAD420();
    uint64_t v22 = sub_228AAD170();
    BOOL v21 = 1;
    uint64_t v23 = sub_228AAD170();
    sub_228AA4A88((uint64_t)v17, MEMORY[0x263F88C88]);
    sub_228AA4A20(a1, (uint64_t)v15, MEMORY[0x263F88C88]);
    if (v22 != v23)
    {
      sub_228AAD420();
      uint64_t v24 = sub_228AAD170();
      BOOL v21 = v24 == sub_228AAD170();
    }
  }
  sub_228AA4A88((uint64_t)v15, MEMORY[0x263F88C88]);
  uint64_t v25 = MEMORY[0x263F8D4F8];
  uint64_t v71 = MEMORY[0x263F8D4F8];
  LOBYTE(v70) = v21;
  sub_228AA3EEC(&v70, v69);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v65 = v18;
  sub_228AA1C7C(v69, (uint64_t)v72, isUniquelyReferenced_nonNull_native);
  uint64_t v27 = v65;
  swift_bridgeObjectRelease();
  sub_228AA3EFC((uint64_t)v72);
  strcpy((char *)&v65, "subdWasCalled");
  HIWORD(v65) = -4864;
  sub_228AAD790();
  char v28 = sub_228AAD3C0();
  uint64_t v66 = v25;
  LOBYTE(v65) = v28 & 1;
  sub_228AA3EEC(&v65, &v67);
  char v29 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v63 = v27;
  sub_228AA1C7C(&v67, (uint64_t)v69, v29);
  uint64_t v30 = v63;
  uint64_t v73 = v63;
  swift_bridgeObjectRelease();
  sub_228AA3EFC((uint64_t)v69);
  *(void *)&long long v65 = 0xD000000000000016;
  *((void *)&v65 + 1) = 0x8000000228AAF150;
  sub_228AAD790();
  sub_228AAD420();
  uint64_t v31 = sub_228AAD170();
  uint64_t v32 = sub_228AAD170();
  sub_228AA4A20(a1, (uint64_t)v12, MEMORY[0x263F88C88]);
  if (v31 == v32)
  {
    sub_228AA4A88((uint64_t)v12, MEMORY[0x263F88C88]);
    sub_228AA4A20(a1, (uint64_t)v9, MEMORY[0x263F88C88]);
LABEL_8:
    sub_228AA4A88((uint64_t)v9, MEMORY[0x263F88C88]);
    uint64_t v35 = v58;
    sub_228AA4A20(a1, v58, MEMORY[0x263F88C88]);
    BOOL v36 = 1;
    goto LABEL_9;
  }
  sub_228AAD420();
  uint64_t v33 = sub_228AAD170();
  uint64_t v34 = sub_228AAD170();
  sub_228AA4A88((uint64_t)v12, MEMORY[0x263F88C88]);
  sub_228AA4A20(a1, (uint64_t)v9, MEMORY[0x263F88C88]);
  if (v33 == v34) {
    goto LABEL_8;
  }
  sub_228AAD420();
  uint64_t v53 = sub_228AAD170();
  BOOL v36 = 1;
  uint64_t v54 = sub_228AAD170();
  sub_228AA4A88((uint64_t)v9, MEMORY[0x263F88C88]);
  uint64_t v35 = v58;
  sub_228AA4A20(a1, v58, MEMORY[0x263F88C88]);
  if (v53 != v54)
  {
    sub_228AAD420();
    uint64_t v55 = sub_228AAD170();
    BOOL v36 = v55 == sub_228AAD170();
  }
LABEL_9:
  sub_228AA4A88(v35, MEMORY[0x263F88C88]);
  uint64_t v68 = MEMORY[0x263F8D4F8];
  LOBYTE(v67) = v36;
  sub_228AA3EEC(&v67, &v65);
  char v37 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v63 = v30;
  sub_228AA1C7C(&v65, (uint64_t)v69, v37);
  uint64_t v73 = v63;
  swift_bridgeObjectRelease();
  sub_228AA3EFC((uint64_t)v69);
  uint64_t v38 = (uint64_t)v60;
  sub_228AAD3E0();
  uint64_t v39 = sub_228AAD280();
  sub_228AA3190(0x6163696669746F6ELL, 0xEE0064496E6F6974, v39, v40);
  swift_bridgeObjectRelease();
  uint64_t v41 = sub_228AAD2A0();
  sub_228AA3190(0x6449726566666FLL, 0xE700000000000000, v41, v42);
  swift_bridgeObjectRelease();
  uint64_t v43 = sub_228AAD260();
  sub_228AA3190(0x73756F6976657270, 0xED00006574617453, v43, v44);
  swift_bridgeObjectRelease();
  sub_228AAD420();
  uint64_t v45 = sub_228AAD170();
  uint64_t v46 = v59;
  sub_228AA4A20(a1, v59, MEMORY[0x263F88C88]);
  if (v45 == v32)
  {
    sub_228AA4A88(v46, MEMORY[0x263F88C88]);
  }
  else
  {
    sub_228AAD420();
    uint64_t v47 = sub_228AAD170();
    uint64_t v48 = sub_228AAD170();
    sub_228AA4A88(v46, MEMORY[0x263F88C88]);
    if (v47 != v48)
    {
      sub_228AA4A88(v38, MEMORY[0x263F88C28]);
      return v73;
    }
  }
  *(void *)&long long v63 = 0xD000000000000012;
  *((void *)&v63 + 1) = 0x8000000228AAF170;
  sub_228AAD790();
  uint64_t v49 = sub_228AAD400();
  uint64_t v64 = MEMORY[0x263F8E5C0];
  *(void *)&long long v63 = v49;
  sub_228AA3EEC(&v63, v62);
  uint64_t v50 = v73;
  char v51 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v61 = v50;
  sub_228AA1C7C(v62, (uint64_t)&v65, v51);
  uint64_t v52 = v61;
  swift_bridgeObjectRelease();
  sub_228AA3EFC((uint64_t)&v65);
  sub_228AA4A88(v38, MEMORY[0x263F88C28]);
  return v52;
}

uint64_t sub_228AA3AE4()
{
  sub_228AAD050();
  uint64_t v1 = sub_228AAD810();
  sub_228AAD6C0();
  sub_228AAD000();
  sub_228AAD810();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  sub_228AAD070();
  sub_228AAD810();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  sub_228AAD030();
  sub_228AAD6C0();
  return v1;
}

uint64_t sub_228AA3C0C()
{
  uint64_t v0 = sub_228AAD2C0();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_228AAD0A0();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C5F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_228AAE590;
  strcpy((char *)v19, "callSubD");
  BYTE1(v19[1]) = 0;
  WORD1(v19[1]) = 0;
  HIDWORD(v19[1]) = -402653184;
  uint64_t v7 = MEMORY[0x263F8D310];
  sub_228AAD790();
  sub_228AAD370();
  uint64_t v8 = sub_228AAD360();
  BOOL v9 = v8 == sub_228AAD360();
  *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 72) = v9;
  strcpy((char *)v19, "mlServerScore");
  HIWORD(v19[1]) = -4864;
  sub_228AAD790();
  sub_228AAD300();
  *(void *)(inited + 168) = MEMORY[0x263F8D538];
  *(void *)(inited + 144) = v10;
  v19[0] = 0x73756D74696CLL;
  v19[1] = 0xE600000000000000;
  sub_228AAD790();
  sub_228AAD2D0();
  uint64_t v11 = sub_228AA3AE4();
  uint64_t v13 = v12;
  sub_228AA4A88((uint64_t)v5, MEMORY[0x263F88B28]);
  *(void *)(inited + 240) = v7;
  *(void *)(inited + 216) = v11;
  *(void *)(inited + 224) = v13;
  strcpy((char *)v19, "maxDelayInSecs");
  HIBYTE(v19[1]) = -18;
  sub_228AAD790();
  uint64_t v14 = sub_228AAD320();
  *(void *)(inited + 312) = MEMORY[0x263F8E5C0];
  *(void *)(inited + 288) = v14;
  v19[0] = sub_228A9ED2C(inited);
  sub_228AAD340();
  uint64_t v15 = sub_228AAD260();
  unint64_t v17 = v16;
  sub_228AA4A88((uint64_t)v2, MEMORY[0x263F88C28]);
  sub_228AA3190(0x73756F6976657270, 0xED00006574617453, v15, v17);
  swift_bridgeObjectRelease();
  return v19[0];
}

_OWORD *sub_228AA3EEC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_228AA3EFC(uint64_t a1)
{
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_228AA3F88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_228AA3FE4()
{
  unint64_t result = qword_268290B18;
  if (!qword_268290B18)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268290B18);
  }
  return result;
}

uint64_t sub_228AA4024(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_228AA4080(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228AAD0A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_228AA40E4()
{
  return sub_228AAD270();
}

uint64_t sub_228AA4134(uint64_t a1)
{
  return sub_228AA13CC(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_228AA415C(void *a1)
{
  long long v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_228AAD820() & 1;
  }
}

uint64_t sub_228AA41B4(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10 = a2;
  uint64_t v11 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    unint64_t result = sub_228AA2D14(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v15 = a2 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v16 = HIBYTE(a5) & 0xF;
  }
  if (v16 < a2 >> 16) {
    goto LABEL_104;
  }
  unint64_t result = sub_228AAD6F0();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    unint64_t result = sub_228AA2D14(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    unint64_t result = sub_228AA2D14(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    unint64_t result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  unint64_t v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v17 < v10 >> 16) {
    goto LABEL_100;
  }
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  unint64_t result = sub_228AAD6F0();
LABEL_21:
  int64_t v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  uint64_t v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11) {
    uint64_t v19 = 0;
  }
  int v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v33 = a6 + 87;
        if (a6 > 10)
        {
          unsigned __int8 v34 = a6 + 55;
        }
        else
        {
          unsigned __int8 v33 = 97;
          unsigned __int8 v34 = 65;
        }
        if (a6 <= 10) {
          unsigned __int8 v35 = a6 + 48;
        }
        else {
          unsigned __int8 v35 = 58;
        }
        if (v19)
        {
          unsigned int v24 = 0;
          BOOL v36 = v19 + 1;
          uint64_t v37 = result - 1;
          do
          {
            unsigned int v38 = *v36;
            if (v38 < 0x30 || v38 >= v35)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                unsigned int v29 = 0;
                unsigned __int8 v30 = 1;
                if (v38 < 0x61 || v38 >= v33) {
                  return v29 | ((unint64_t)v30 << 32);
                }
                char v39 = -87;
              }
              else
              {
                char v39 = -55;
              }
            }
            else
            {
              char v39 = -48;
            }
            uint64_t v40 = (int)v24 * (uint64_t)(int)a6;
            if (v40 != (int)v40) {
              goto LABEL_96;
            }
            unsigned __int8 v41 = v38 + v39;
            unsigned int v24 = v40 + v41;
            if (__OFADD__(v40, v41)) {
              goto LABEL_96;
            }
            ++v36;
            --v37;
          }
          while (v37);
LABEL_94:
          unsigned __int8 v30 = 0;
          unsigned int v29 = v24;
          return v29 | ((unint64_t)v30 << 32);
        }
        goto LABEL_95;
      }
      goto LABEL_96;
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      unsigned __int8 v42 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v43 = a6 + 55;
      }
      else
      {
        unsigned __int8 v42 = 97;
        unsigned __int8 v43 = 65;
      }
      if (a6 <= 10) {
        unsigned __int8 v44 = a6 + 48;
      }
      else {
        unsigned __int8 v44 = 58;
      }
      if (v19)
      {
        unsigned int v24 = 0;
        while (1)
        {
          unsigned int v45 = *v19;
          if (v45 < 0x30 || v45 >= v44)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              unsigned int v29 = 0;
              unsigned __int8 v30 = 1;
              if (v45 < 0x61 || v45 >= v42) {
                return v29 | ((unint64_t)v30 << 32);
              }
              char v46 = -87;
            }
            else
            {
              char v46 = -55;
            }
          }
          else
          {
            char v46 = -48;
          }
          uint64_t v47 = (int)v24 * (uint64_t)(int)a6;
          if (v47 != (int)v47) {
            goto LABEL_96;
          }
          unsigned __int8 v48 = v45 + v46;
          unsigned int v24 = v47 + v48;
          if (__OFADD__(v47, v48)) {
            goto LABEL_96;
          }
          ++v19;
          if (!--result) {
            goto LABEL_94;
          }
        }
      }
      goto LABEL_95;
    }
LABEL_96:
    unsigned int v29 = 0;
    unsigned __int8 v30 = 1;
    return v29 | ((unint64_t)v30 << 32);
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v21 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v22 = a6 + 55;
      }
      else
      {
        unsigned __int8 v21 = 97;
        unsigned __int8 v22 = 65;
      }
      if (a6 <= 10) {
        unsigned __int8 v23 = a6 + 48;
      }
      else {
        unsigned __int8 v23 = 58;
      }
      if (v19)
      {
        unsigned int v24 = 0;
        uint64_t v25 = v19 + 1;
        uint64_t v26 = result - 1;
        while (1)
        {
          unsigned int v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              unsigned int v29 = 0;
              unsigned __int8 v30 = 1;
              if (v27 < 0x61 || v27 >= v21) {
                return v29 | ((unint64_t)v30 << 32);
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          uint64_t v31 = (int)v24 * (uint64_t)(int)a6;
          if (v31 != (int)v31) {
            goto LABEL_96;
          }
          unsigned __int8 v32 = v27 + v28;
          unsigned int v24 = v31 - v32;
          if (__OFSUB__(v31, v32)) {
            goto LABEL_96;
          }
          ++v25;
          if (!--v26) {
            goto LABEL_94;
          }
        }
      }
LABEL_95:
      unsigned int v29 = 0;
      unsigned __int8 v30 = 0;
      return v29 | ((unint64_t)v30 << 32);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

uint64_t sub_228AA45DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!a2) {
    return v2;
  }
  uint64_t v4 = sub_228AAD020();
  swift_beginAccess();
  uint64_t v5 = *(void *)(*(void *)v4 + 16);
  if (v5)
  {
    uint64_t v6 = (unsigned __int8 *)(swift_bridgeObjectRetain() + 40);
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v11 = *((void *)v6 - 1);
      int v12 = *v6;
      if (v12 == 1)
      {
        uint64_t v13 = *(void *)&aU[8 * v11];
        if (v2 != 0xE100000000000000) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v13 = 85;
        if (v2 != 0xE100000000000000) {
          goto LABEL_14;
        }
      }
      if (v13 == a1)
      {
        swift_bridgeObjectRelease();
LABEL_15:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_228AA2FA4(0, v7[2] + 1, 1);
        }
        unint64_t v9 = v7[2];
        unint64_t v8 = v7[3];
        if (v9 >= v8 >> 1) {
          sub_228AA2FA4((char *)(v8 > 1), v9 + 1, 1);
        }
        _OWORD v7[2] = v9 + 1;
        unint64_t v10 = &v7[2 * v9];
        v10[4] = v11;
        *((unsigned char *)v10 + 40) = v12;
        goto LABEL_7;
      }
LABEL_14:
      char v14 = sub_228AAD820();
      swift_bridgeObjectRelease();
      if (v14) {
        goto LABEL_15;
      }
LABEL_7:
      v6 += 16;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        if (v7[2]) {
          goto LABEL_18;
        }
LABEL_20:
        swift_release();
        return 0;
      }
    }
  }
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  if (!*(void *)(MEMORY[0x263F8EE78] + 16)) {
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v2 = v7[4];
  swift_release();
  return v2;
}

uint64_t sub_228AA47A8()
{
  return sub_228AA1524();
}

uint64_t sub_228AA47D0(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for QuotaServerProtocol()
{
  return &type metadata for QuotaServerProtocol;
}

ValueMetadata *type metadata accessor for QuotaServerProtocol.FetchOffers()
{
  return &type metadata for QuotaServerProtocol.FetchOffers;
}

ValueMetadata *type metadata accessor for QuotaServerProtocol.PushNotification()
{
  return &type metadata for QuotaServerProtocol.PushNotification;
}

ValueMetadata *type metadata accessor for QuotaServerProtocol.RefreshOfferDetails()
{
  return &type metadata for QuotaServerProtocol.RefreshOfferDetails;
}

unint64_t sub_228AA485C()
{
  unint64_t result = qword_268290B40;
  if (!qword_268290B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268290B40);
  }
  return result;
}

uint64_t sub_228AA48B0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_228AA48E8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
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

uint64_t sub_228AA495C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_228AA49B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C5E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_228AA4A20(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_228AA4A88(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id SharedInstance.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SharedInstance.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharedInstance();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SharedInstance.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharedInstance();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _s33iCloudSubscriptionOptimizerClient14SharedInstanceC3getSo08ISOQuotaD0CyFZ_0()
{
  uint64_t v0 = (void *)qword_26AF0C5D8;
  if (qword_26AF0C5D8)
  {
    id v1 = (id)qword_26AF0C5D8;
  }
  else
  {
    uint64_t v2 = sub_228AACFF0();
    swift_allocObject();
    uint64_t v3 = sub_228AACFE0();
    uint64_t v14 = v2;
    uint64_t v15 = MEMORY[0x263F88B18];
    *(void *)&long long v13 = v3;
    type metadata accessor for ClientLibEvents();
    uint64_t v4 = swift_allocObject();
    sub_228A98AA8(&v13, v4 + 16);
    if (qword_26AF0C518 != -1) {
      swift_once();
    }
    qword_26AF0C510 = v4;
    swift_release();
    id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XpcQuotaClient()), sel_init);
    uint64_t v6 = (objc_class *)type metadata accessor for MetricsQuotaClient();
    uint64_t v7 = (char *)objc_allocWithZone(v6);
    *(void *)&v7[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient] = v5;
    *(void *)&v7[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents] = qword_26AF0C510;
    v12.receiver = v7;
    v12.super_class = v6;
    swift_retain();
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    unint64_t v9 = (void *)qword_26AF0C5D8;
    qword_26AF0C5D8 = (uint64_t)v8;
    id v1 = v8;

    uint64_t v0 = 0;
  }
  id v10 = v0;
  return v1;
}

uint64_t type metadata accessor for SharedInstance()
{
  return self;
}

uint64_t *sub_228AA4D78(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_228AACFC0();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C380);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v20 = sub_228AACF40();
            (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v20 - 8) + 16))(a1, a2, v20);
            uint64_t v21 = *(int *)(sub_228AAD130() + 20);
            unsigned __int8 v22 = (uint64_t *)((char *)a1 + v21);
            unsigned __int8 v23 = (uint64_t *)((char *)a2 + v21);
            uint64_t v24 = v23[1];
            *unsigned __int8 v22 = *v23;
            v22[1] = v24;
            swift_bridgeObjectRetain();
            break;
          case 2u:
            uint64_t v25 = sub_228AACF40();
            v146 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v25 - 8) + 16);
            v146(a1, a2, v25);
            uint64_t v26 = (int *)sub_228AAD250();
            uint64_t v27 = v26[5];
            char v28 = (char *)a1 + v27;
            unsigned int v29 = (char *)a2 + v27;
            *(void *)char v28 = *(void *)v29;
            *((_WORD *)v28 + 4) = *((_WORD *)v29 + 4);
            uint64_t v30 = v26[6];
            uint64_t v31 = (char *)a1 + v30;
            unsigned __int8 v32 = (char *)a2 + v30;
            *(void *)uint64_t v31 = *(void *)v32;
            v31[8] = v32[8];
            uint64_t v33 = v26[7];
            unsigned __int8 v34 = (char *)a1 + v33;
            unsigned __int8 v35 = (char *)a2 + v33;
            BOOL v36 = (int *)sub_228AAD2C0();
            uint64_t v151 = *((void *)v36 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v151 + 48))(v35, 1, v36))
            {
              uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B60);
              memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
            }
            else
            {
              v146((uint64_t *)v34, (uint64_t *)v35, v25);
              uint64_t v102 = v36[5];
              v103 = &v34[v102];
              v104 = &v35[v102];
              uint64_t v105 = *((void *)v104 + 1);
              *(void *)v103 = *(void *)v104;
              *((void *)v103 + 1) = v105;
              uint64_t v106 = v36[6];
              v107 = &v34[v106];
              v108 = &v35[v106];
              uint64_t v150 = *((void *)v108 + 1);
              *(void *)v107 = *(void *)v108;
              *((void *)v107 + 1) = v150;
              uint64_t v109 = v36[7];
              v110 = &v34[v109];
              v111 = &v35[v109];
              uint64_t v144 = *((void *)v111 + 1);
              *(void *)v110 = *(void *)v111;
              *((void *)v110 + 1) = v144;
              uint64_t v112 = v36[8];
              v113 = &v34[v112];
              v114 = &v35[v112];
              uint64_t v115 = *((void *)v114 + 1);
              *(void *)v113 = *(void *)v114;
              *((void *)v113 + 1) = v115;
              v160 = *(void (**)(char *, void, uint64_t, int *))(v151 + 56);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v160(v34, 0, 1, v36);
            }
            uint64_t v116 = v26[8];
            v117 = (char *)a1 + v116;
            v118 = (char *)a2 + v116;
            *(void *)v117 = *(void *)v118;
            v117[8] = v118[8];
            uint64_t v119 = v26[9];
            v120 = (uint64_t *)((char *)a1 + v119);
            v121 = (uint64_t *)((char *)a2 + v119);
            uint64_t v122 = v121[1];
            void *v120 = *v121;
            v120[1] = v122;
            swift_bridgeObjectRetain();
            break;
          case 3u:
            *a1 = *a2;
            uint64_t v38 = sub_228AAD1F0();
            uint64_t v39 = *(int *)(v38 + 20);
            v147 = (char *)a2 + v39;
            v152 = (char *)a1 + v39;
            uint64_t v40 = sub_228AACF40();
            unsigned __int8 v41 = *(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16);
            swift_bridgeObjectRetain();
            v41(v152, v147, v40);
            uint64_t v42 = *(int *)(v38 + 24);
            unsigned __int8 v43 = (char *)a1 + v42;
            unsigned __int8 v44 = (char *)a2 + v42;
            *(void *)unsigned __int8 v43 = *(void *)v44;
            v43[8] = v44[8];
            break;
          case 4u:
            uint64_t v45 = sub_228AACF40();
            v153 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v45 - 8) + 16);
            v153(a1, a2, v45);
            uint64_t v46 = *(int *)(sub_228AAD200() + 20);
            uint64_t v47 = (char *)a1 + v46;
            unsigned __int8 v48 = (char *)a2 + v46;
            uint64_t v49 = sub_228AAD0B0();
            uint64_t v50 = *(void *)(v49 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49))
            {
              uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B68);
              memcpy(v47, v48, *(void *)(*(void *)(v51 - 8) + 64));
            }
            else
            {
              v153((uint64_t *)v47, (uint64_t *)v48, v45);
              *(void *)&v47[*(int *)(v49 + 20)] = *(void *)&v48[*(int *)(v49 + 20)];
              v123 = *(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56);
              swift_retain();
              v123(v47, 0, 1, v49);
            }
            break;
          case 5u:
            uint64_t v52 = a2[1];
            *a1 = *a2;
            a1[1] = v52;
            uint64_t v53 = (int *)sub_228AAD120();
            uint64_t v54 = v53[6];
            v148 = (char *)a2 + v54;
            v154 = (char *)a1 + v54;
            uint64_t v55 = sub_228AACF40();
            v142 = *(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 16);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v142(v154, v148, v55);
            *((unsigned char *)a1 + v53[7]) = *((unsigned char *)a2 + v53[7]);
            *((unsigned char *)a1 + v53[8]) = *((unsigned char *)a2 + v53[8]);
            break;
          case 6u:
            uint64_t v56 = sub_228AACF40();
            (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v56 - 8) + 16))(a1, a2, v56);
            uint64_t v57 = sub_228AAD530();
            *((unsigned char *)a1 + *(int *)(v57 + 20)) = *((unsigned char *)a2 + *(int *)(v57 + 20));
            uint64_t v58 = *(int *)(v57 + 24);
            uint64_t v59 = (char *)a1 + v58;
            uint64_t v60 = (char *)a2 + v58;
            v59[8] = v60[8];
            *(void *)uint64_t v59 = *(void *)v60;
            break;
          case 7u:
            uint64_t v61 = sub_228AACF40();
            v155 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v61 - 8) + 16);
            v155(a1, a2, v61);
            uint64_t v62 = *(int *)(sub_228AAD470() + 20);
            long long v63 = (char *)a1 + v62;
            uint64_t v64 = (char *)a2 + v62;
            long long v65 = (int *)sub_228AAD1E0();
            uint64_t v66 = *((void *)v65 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v66 + 48))(v64, 1, v65))
            {
              uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B70);
              memcpy(v63, v64, *(void *)(*(void *)(v67 - 8) + 64));
            }
            else
            {
              v155((uint64_t *)v63, (uint64_t *)v64, v61);
              uint64_t v124 = v65[5];
              v125 = &v63[v124];
              v126 = &v64[v124];
              uint64_t v127 = *((void *)v126 + 1);
              *(void *)v125 = *(void *)v126;
              *((void *)v125 + 1) = v127;
              uint64_t v128 = v65[6];
              v129 = &v63[v128];
              v130 = &v64[v128];
              *(void *)v129 = *(void *)v130;
              v129[8] = v130[8];
              uint64_t v131 = v65[7];
              v132 = &v63[v131];
              v133 = &v64[v131];
              *(void *)v132 = *(void *)v133;
              v132[8] = v133[8];
              v134 = *(void (**)(char *, void, uint64_t, int *))(v66 + 56);
              swift_bridgeObjectRetain();
              v134(v63, 0, 1, v65);
            }
            break;
          case 8u:
          case 0xAu:
          case 0xCu:
            uint64_t v76 = sub_228AACF40();
            (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v76 - 8) + 16))(a1, a2, v76);
            break;
          case 9u:
            *a1 = *a2;
            uint64_t v68 = *(int *)(sub_228AAD450() + 20);
            v69 = (char *)a1 + v68;
            v156 = (char *)a2 + v68;
            uint64_t v70 = sub_228AACF40();
            uint64_t v71 = *(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16);
            swift_bridgeObjectRetain();
            v71(v69, v156, v70);
            break;
          case 0xBu:
            *a1 = *a2;
            uint64_t v72 = *(int *)(sub_228AAD460() + 20);
            uint64_t v73 = (char *)a1 + v72;
            v157 = (char *)a2 + v72;
            uint64_t v74 = sub_228AACF40();
            long long v75 = *(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 16);
            swift_bridgeObjectRetain();
            v75(v73, v157, v74);
            break;
          case 0xDu:
            uint64_t v77 = sub_228AACF40();
            v158 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v77 - 8) + 16);
            v158(a1, a2, v77);
            uint64_t v78 = *(int *)(sub_228AAD480() + 20);
            long long v79 = (uint64_t *)((char *)a1 + v78);
            long long v80 = (uint64_t *)((char *)a2 + v78);
            uint64_t v81 = sub_228AAD4F0();
            uint64_t v82 = *(void *)(v81 - 8);
            if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v82 + 48))(v80, 1, v81))
            {
              uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B78);
              memcpy(v79, v80, *(void *)(*(void *)(v83 - 8) + 64));
            }
            else
            {
              *long long v79 = *v80;
              uint64_t v135 = *(int *)(v81 + 20);
              v145 = (char *)v79 + v135;
              v136 = (char *)v80 + v135;
              swift_bridgeObjectRetain();
              v158((uint64_t *)v145, (uint64_t *)v136, v77);
              (*(void (**)(void *, void, uint64_t, uint64_t))(v82 + 56))(v79, 0, 1, v81);
            }
            break;
          case 0xEu:
            uint64_t v84 = sub_228AACF40();
            (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v84 - 8) + 16))(a1, a2, v84);
            uint64_t v85 = *(int *)(sub_228AAD500() + 20);
            v86 = (char *)a1 + v85;
            v87 = (char *)a2 + v85;
            *(void *)v86 = *(void *)v87;
            v86[8] = v87[8];
            break;
          case 0xFu:
            uint64_t v88 = a2[1];
            *a1 = *a2;
            a1[1] = v88;
            uint64_t v89 = sub_228AAD4B0();
            uint64_t v90 = *(int *)(v89 + 24);
            v149 = (char *)a2 + v90;
            v159 = (char *)a1 + v90;
            uint64_t v91 = sub_228AACF40();
            v143 = *(void (**)(char *, char *, uint64_t))(*(void *)(v91 - 8) + 16);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v143(v159, v149, v91);
            *((unsigned char *)a1 + *(int *)(v89 + 28)) = *((unsigned char *)a2 + *(int *)(v89 + 28));
            break;
          case 0x10u:
            uint64_t v92 = sub_228AACF40();
            (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v92 - 8) + 16))(a1, a2, v92);
            uint64_t v93 = *(int *)(sub_228AAD540() + 20);
            v94 = (uint64_t *)((char *)a1 + v93);
            v95 = (uint64_t *)((char *)a2 + v93);
            uint64_t v96 = v95[1];
            void *v94 = *v95;
            v94[1] = v96;
            swift_bridgeObjectRetain();
            break;
          case 0x11u:
            uint64_t v97 = sub_228AACF40();
            (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v97 - 8) + 16))(a1, a2, v97);
            uint64_t v98 = *(int *)(sub_228AAD4C0() + 20);
            v99 = (uint64_t *)((char *)a1 + v98);
            v100 = (uint64_t *)((char *)a2 + v98);
            uint64_t v101 = v100[1];
            void *v99 = *v100;
            v99[1] = v101;
            swift_bridgeObjectRetain();
            break;
          default:
            uint64_t v15 = sub_228AACF40();
            (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
            uint64_t v16 = *(int *)(sub_228AAD140() + 20);
            unint64_t v17 = (uint64_t *)((char *)a1 + v16);
            int64_t v18 = (uint64_t *)((char *)a2 + v16);
            uint64_t v19 = v18[1];
            *unint64_t v17 = *v18;
            v17[1] = v19;
            swift_bridgeObjectRetain();
            break;
        }
        swift_storeEnumTagMultiPayload();
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
      uint64_t v137 = *(int *)(sub_228AACFD0() + 20);
      v138 = (char *)a1 + v137;
      v139 = (char *)a2 + v137;
      uint64_t v140 = sub_228AACF40();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v140 - 8) + 16))(v138, v139, v140);
    }
    else
    {
      uint64_t v10 = sub_228AACF40();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      uint64_t v11 = *(int *)(sub_228AAD140() + 20);
      objc_super v12 = (uint64_t *)((char *)a1 + v11);
      long long v13 = (uint64_t *)((char *)a2 + v11);
      uint64_t v14 = v13[1];
      *objc_super v12 = *v13;
      v12[1] = v14;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_228AA5C98(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_228AACFC0();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2))
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
          uint64_t v9 = sub_228AACF40();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
          sub_228AAD140();
          goto LABEL_32;
        case 1u:
          uint64_t v10 = sub_228AACF40();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
          sub_228AAD130();
          goto LABEL_32;
        case 2u:
          uint64_t v11 = sub_228AACF40();
          objc_super v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
          v12(a1, v11);
          uint64_t v13 = a1 + *(int *)(sub_228AAD250() + 28);
          uint64_t v14 = sub_228AAD2C0();
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14))
          {
            v12(v13, v11);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          goto LABEL_32;
        case 3u:
          swift_bridgeObjectRelease();
          uint64_t v15 = sub_228AAD1F0();
          goto LABEL_24;
        case 4u:
          uint64_t v16 = sub_228AACF40();
          unint64_t v17 = *(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8);
          v17(a1, v16);
          uint64_t v18 = a1 + *(int *)(sub_228AAD200() + 20);
          uint64_t v19 = sub_228AAD0B0();
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v18, 1, v19))
          {
            v17(v18, v16);
            swift_release();
          }
          break;
        case 5u:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v20 = sub_228AAD120();
          goto LABEL_28;
        case 6u:
        case 8u:
        case 0xAu:
        case 0xCu:
        case 0xEu:
          uint64_t v8 = sub_228AACF40();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
          break;
        case 7u:
          uint64_t v21 = sub_228AACF40();
          unsigned __int8 v22 = *(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8);
          v22(a1, v21);
          uint64_t v23 = a1 + *(int *)(sub_228AAD470() + 20);
          uint64_t v24 = sub_228AAD1E0();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48))(v23, 1, v24)) {
            break;
          }
          v22(v23, v21);
          goto LABEL_32;
        case 9u:
          swift_bridgeObjectRelease();
          uint64_t v15 = sub_228AAD450();
          goto LABEL_24;
        case 0xBu:
          swift_bridgeObjectRelease();
          uint64_t v15 = sub_228AAD460();
LABEL_24:
          uint64_t v25 = *(int *)(v15 + 20);
          goto LABEL_29;
        case 0xDu:
          uint64_t v26 = sub_228AACF40();
          uint64_t v27 = *(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8);
          v27(a1, v26);
          uint64_t v28 = a1 + *(int *)(sub_228AAD480() + 20);
          uint64_t v29 = sub_228AAD4F0();
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 48))(v28, 1, v29))
          {
            swift_bridgeObjectRelease();
            v27(v28 + *(int *)(v29 + 20), v26);
          }
          break;
        case 0xFu:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v20 = sub_228AAD4B0();
LABEL_28:
          uint64_t v25 = *(int *)(v20 + 24);
LABEL_29:
          uint64_t v30 = a1 + v25;
          uint64_t v31 = sub_228AACF40();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8))(v30, v31);
          break;
        case 0x10u:
          uint64_t v32 = sub_228AACF40();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v32 - 8) + 8))(a1, v32);
          sub_228AAD540();
          goto LABEL_32;
        case 0x11u:
          uint64_t v33 = sub_228AACF40();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(a1, v33);
          sub_228AAD4C0();
LABEL_32:
          swift_bridgeObjectRelease();
          break;
        default:
          break;
      }
    }
    uint64_t v3 = a1 + *(int *)(sub_228AACFD0() + 20);
    uint64_t v4 = sub_228AACF40();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(v3, v4);
  }
  else
  {
    uint64_t v7 = sub_228AACF40();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
    sub_228AAD140();
    return swift_bridgeObjectRelease();
  }
}

void *sub_228AA6384(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_228AACFC0();
    uint64_t v5 = *(void *)(v4 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C380);
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v17 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
          uint64_t v18 = *(int *)(sub_228AAD130() + 20);
          uint64_t v19 = (void *)((char *)a1 + v18);
          uint64_t v20 = (void *)((char *)a2 + v18);
          uint64_t v21 = v20[1];
          void *v19 = *v20;
          v19[1] = v21;
          swift_bridgeObjectRetain();
          break;
        case 2u:
          uint64_t v22 = sub_228AACF40();
          v143 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
          v143((char *)a1, (char *)a2, v22);
          uint64_t v23 = (int *)sub_228AAD250();
          uint64_t v24 = v23[5];
          uint64_t v25 = (char *)a1 + v24;
          uint64_t v26 = (char *)a2 + v24;
          *(void *)uint64_t v25 = *(void *)v26;
          *((_WORD *)v25 + 4) = *((_WORD *)v26 + 4);
          uint64_t v27 = v23[6];
          uint64_t v28 = (char *)a1 + v27;
          uint64_t v29 = (char *)a2 + v27;
          *(void *)uint64_t v28 = *(void *)v29;
          v28[8] = v29[8];
          uint64_t v30 = v23[7];
          uint64_t v31 = (char *)a1 + v30;
          uint64_t v32 = (char *)a2 + v30;
          uint64_t v33 = (int *)sub_228AAD2C0();
          uint64_t v148 = *((void *)v33 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v148 + 48))(v32, 1, v33))
          {
            uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B60);
            memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
          }
          else
          {
            v143(v31, v32, v22);
            uint64_t v99 = v33[5];
            v100 = &v31[v99];
            uint64_t v101 = &v32[v99];
            uint64_t v102 = *((void *)v101 + 1);
            *(void *)v100 = *(void *)v101;
            *((void *)v100 + 1) = v102;
            uint64_t v103 = v33[6];
            v104 = &v31[v103];
            uint64_t v105 = &v32[v103];
            uint64_t v147 = *((void *)v105 + 1);
            *(void *)v104 = *(void *)v105;
            *((void *)v104 + 1) = v147;
            uint64_t v106 = v33[7];
            v107 = &v31[v106];
            v108 = &v32[v106];
            uint64_t v141 = *((void *)v108 + 1);
            *(void *)v107 = *(void *)v108;
            *((void *)v107 + 1) = v141;
            uint64_t v109 = v33[8];
            v110 = &v31[v109];
            v111 = &v32[v109];
            uint64_t v112 = *((void *)v111 + 1);
            *(void *)v110 = *(void *)v111;
            *((void *)v110 + 1) = v112;
            v157 = *(void (**)(char *, void, uint64_t, int *))(v148 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v157(v31, 0, 1, v33);
          }
          uint64_t v113 = v23[8];
          v114 = (char *)a1 + v113;
          uint64_t v115 = (char *)a2 + v113;
          *(void *)v114 = *(void *)v115;
          v114[8] = v115[8];
          uint64_t v116 = v23[9];
          v117 = (void *)((char *)a1 + v116);
          v118 = (void *)((char *)a2 + v116);
          uint64_t v119 = v118[1];
          void *v117 = *v118;
          v117[1] = v119;
          swift_bridgeObjectRetain();
          break;
        case 3u:
          *a1 = *a2;
          uint64_t v35 = sub_228AAD1F0();
          uint64_t v36 = *(int *)(v35 + 20);
          uint64_t v144 = (char *)a2 + v36;
          v149 = (char *)a1 + v36;
          uint64_t v37 = sub_228AACF40();
          uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16);
          swift_bridgeObjectRetain();
          v38(v149, v144, v37);
          uint64_t v39 = *(int *)(v35 + 24);
          uint64_t v40 = (char *)a1 + v39;
          unsigned __int8 v41 = (char *)a2 + v39;
          *(void *)uint64_t v40 = *(void *)v41;
          v40[8] = v41[8];
          break;
        case 4u:
          uint64_t v42 = sub_228AACF40();
          uint64_t v150 = *(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16);
          v150((char *)a1, (char *)a2, v42);
          uint64_t v43 = *(int *)(sub_228AAD200() + 20);
          unsigned __int8 v44 = (char *)a1 + v43;
          uint64_t v45 = (char *)a2 + v43;
          uint64_t v46 = sub_228AAD0B0();
          uint64_t v47 = *(void *)(v46 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46))
          {
            uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B68);
            memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
          }
          else
          {
            v150(v44, v45, v42);
            *(void *)&v44[*(int *)(v46 + 20)] = *(void *)&v45[*(int *)(v46 + 20)];
            v120 = *(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56);
            swift_retain();
            v120(v44, 0, 1, v46);
          }
          break;
        case 5u:
          uint64_t v49 = a2[1];
          *a1 = *a2;
          a1[1] = v49;
          uint64_t v50 = (int *)sub_228AAD120();
          uint64_t v51 = v50[6];
          v145 = (char *)a2 + v51;
          uint64_t v151 = (char *)a1 + v51;
          uint64_t v52 = sub_228AACF40();
          v139 = *(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v139(v151, v145, v52);
          *((unsigned char *)a1 + v50[7]) = *((unsigned char *)a2 + v50[7]);
          *((unsigned char *)a1 + v50[8]) = *((unsigned char *)a2 + v50[8]);
          break;
        case 6u:
          uint64_t v53 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v53 - 8) + 16))(a1, a2, v53);
          uint64_t v54 = sub_228AAD530();
          *((unsigned char *)a1 + *(int *)(v54 + 20)) = *((unsigned char *)a2 + *(int *)(v54 + 20));
          uint64_t v55 = *(int *)(v54 + 24);
          uint64_t v56 = (char *)a1 + v55;
          uint64_t v57 = (char *)a2 + v55;
          v56[8] = v57[8];
          *(void *)uint64_t v56 = *(void *)v57;
          break;
        case 7u:
          uint64_t v58 = sub_228AACF40();
          v152 = *(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 16);
          v152((char *)a1, (char *)a2, v58);
          uint64_t v59 = *(int *)(sub_228AAD470() + 20);
          uint64_t v60 = (char *)a1 + v59;
          uint64_t v61 = (char *)a2 + v59;
          uint64_t v62 = (int *)sub_228AAD1E0();
          uint64_t v63 = *((void *)v62 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v63 + 48))(v61, 1, v62))
          {
            uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B70);
            memcpy(v60, v61, *(void *)(*(void *)(v64 - 8) + 64));
          }
          else
          {
            v152(v60, v61, v58);
            uint64_t v121 = v62[5];
            uint64_t v122 = &v60[v121];
            v123 = &v61[v121];
            uint64_t v124 = *((void *)v123 + 1);
            *(void *)uint64_t v122 = *(void *)v123;
            *((void *)v122 + 1) = v124;
            uint64_t v125 = v62[6];
            v126 = &v60[v125];
            uint64_t v127 = &v61[v125];
            *(void *)v126 = *(void *)v127;
            v126[8] = v127[8];
            uint64_t v128 = v62[7];
            v129 = &v60[v128];
            v130 = &v61[v128];
            *(void *)v129 = *(void *)v130;
            v129[8] = v130[8];
            uint64_t v131 = *(void (**)(char *, void, uint64_t, int *))(v63 + 56);
            swift_bridgeObjectRetain();
            v131(v60, 0, 1, v62);
          }
          break;
        case 8u:
        case 0xAu:
        case 0xCu:
          uint64_t v73 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v73 - 8) + 16))(a1, a2, v73);
          break;
        case 9u:
          *a1 = *a2;
          uint64_t v65 = *(int *)(sub_228AAD450() + 20);
          uint64_t v66 = (char *)a1 + v65;
          v153 = (char *)a2 + v65;
          uint64_t v67 = sub_228AACF40();
          uint64_t v68 = *(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 16);
          swift_bridgeObjectRetain();
          v68(v66, v153, v67);
          break;
        case 0xBu:
          *a1 = *a2;
          uint64_t v69 = *(int *)(sub_228AAD460() + 20);
          uint64_t v70 = (char *)a1 + v69;
          v154 = (char *)a2 + v69;
          uint64_t v71 = sub_228AACF40();
          uint64_t v72 = *(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 16);
          swift_bridgeObjectRetain();
          v72(v70, v154, v71);
          break;
        case 0xDu:
          uint64_t v74 = sub_228AACF40();
          v155 = *(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 16);
          v155((char *)a1, (char *)a2, v74);
          uint64_t v75 = *(int *)(sub_228AAD480() + 20);
          uint64_t v76 = (void *)((char *)a1 + v75);
          uint64_t v77 = (void *)((char *)a2 + v75);
          uint64_t v78 = sub_228AAD4F0();
          uint64_t v79 = *(void *)(v78 - 8);
          if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v79 + 48))(v77, 1, v78))
          {
            uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B78);
            memcpy(v76, v77, *(void *)(*(void *)(v80 - 8) + 64));
          }
          else
          {
            *uint64_t v76 = *v77;
            uint64_t v132 = *(int *)(v78 + 20);
            v142 = (char *)v76 + v132;
            v133 = (char *)v77 + v132;
            swift_bridgeObjectRetain();
            v155(v142, v133, v74);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v79 + 56))(v76, 0, 1, v78);
          }
          break;
        case 0xEu:
          uint64_t v81 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v81 - 8) + 16))(a1, a2, v81);
          uint64_t v82 = *(int *)(sub_228AAD500() + 20);
          uint64_t v83 = (char *)a1 + v82;
          uint64_t v84 = (char *)a2 + v82;
          *(void *)uint64_t v83 = *(void *)v84;
          v83[8] = v84[8];
          break;
        case 0xFu:
          uint64_t v85 = a2[1];
          *a1 = *a2;
          a1[1] = v85;
          uint64_t v86 = sub_228AAD4B0();
          uint64_t v87 = *(int *)(v86 + 24);
          v146 = (char *)a2 + v87;
          v156 = (char *)a1 + v87;
          uint64_t v88 = sub_228AACF40();
          uint64_t v140 = *(void (**)(char *, char *, uint64_t))(*(void *)(v88 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v140(v156, v146, v88);
          *((unsigned char *)a1 + *(int *)(v86 + 28)) = *((unsigned char *)a2 + *(int *)(v86 + 28));
          break;
        case 0x10u:
          uint64_t v89 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v89 - 8) + 16))(a1, a2, v89);
          uint64_t v90 = *(int *)(sub_228AAD540() + 20);
          uint64_t v91 = (void *)((char *)a1 + v90);
          uint64_t v92 = (void *)((char *)a2 + v90);
          uint64_t v93 = v92[1];
          *uint64_t v91 = *v92;
          v91[1] = v93;
          swift_bridgeObjectRetain();
          break;
        case 0x11u:
          uint64_t v94 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v94 - 8) + 16))(a1, a2, v94);
          uint64_t v95 = *(int *)(sub_228AAD4C0() + 20);
          uint64_t v96 = (void *)((char *)a1 + v95);
          uint64_t v97 = (void *)((char *)a2 + v95);
          uint64_t v98 = v97[1];
          *uint64_t v96 = *v97;
          v96[1] = v98;
          swift_bridgeObjectRetain();
          break;
        default:
          uint64_t v12 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
          uint64_t v13 = *(int *)(sub_228AAD140() + 20);
          uint64_t v14 = (void *)((char *)a1 + v13);
          uint64_t v15 = (void *)((char *)a2 + v13);
          uint64_t v16 = v15[1];
          *uint64_t v14 = *v15;
          v14[1] = v16;
          swift_bridgeObjectRetain();
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
    }
    uint64_t v134 = *(int *)(sub_228AACFD0() + 20);
    uint64_t v135 = (char *)a1 + v134;
    v136 = (char *)a2 + v134;
    uint64_t v137 = sub_228AACF40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v137 - 8) + 16))(v135, v136, v137);
  }
  else
  {
    uint64_t v7 = sub_228AACF40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(sub_228AAD140() + 20);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_228AA724C(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_228AA818C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_228AACFC0();
      uint64_t v5 = *(void *)(v4 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
      {
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C380);
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v15 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
            uint64_t v16 = *(int *)(sub_228AAD130() + 20);
            uint64_t v17 = (void *)((char *)a1 + v16);
            uint64_t v18 = (void *)((char *)a2 + v16);
            *uint64_t v17 = *v18;
            v17[1] = v18[1];
            swift_bridgeObjectRetain();
            break;
          case 2u:
            uint64_t v19 = sub_228AACF40();
            v138 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
            v138((char *)a1, (char *)a2, v19);
            uint64_t v20 = (int *)sub_228AAD250();
            uint64_t v21 = v20[5];
            uint64_t v22 = (char *)a1 + v21;
            uint64_t v23 = (char *)a2 + v21;
            __int16 v24 = *((_WORD *)v23 + 4);
            *(void *)uint64_t v22 = *(void *)v23;
            *((_WORD *)v22 + 4) = v24;
            uint64_t v25 = v20[6];
            uint64_t v26 = (char *)a1 + v25;
            uint64_t v27 = (char *)a2 + v25;
            LOBYTE(v24) = v27[8];
            *(void *)uint64_t v26 = *(void *)v27;
            v26[8] = v24;
            uint64_t v28 = v20[7];
            uint64_t v29 = (char *)a1 + v28;
            uint64_t v30 = (char *)a2 + v28;
            uint64_t v31 = (int *)sub_228AAD2C0();
            uint64_t v142 = *((void *)v31 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v142 + 48))(v30, 1, v31))
            {
              uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B60);
              memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64));
            }
            else
            {
              v138(v29, v30, v19);
              uint64_t v96 = v31[5];
              uint64_t v97 = &v29[v96];
              uint64_t v98 = &v30[v96];
              *(void *)uint64_t v97 = *(void *)v98;
              *((void *)v97 + 1) = *((void *)v98 + 1);
              uint64_t v99 = v31[6];
              v100 = &v29[v99];
              uint64_t v101 = &v30[v99];
              *(void *)v100 = *(void *)v101;
              *((void *)v100 + 1) = *((void *)v101 + 1);
              uint64_t v102 = v31[7];
              uint64_t v103 = &v29[v102];
              v104 = &v30[v102];
              *(void *)uint64_t v103 = *(void *)v104;
              *((void *)v103 + 1) = *((void *)v104 + 1);
              uint64_t v105 = v31[8];
              uint64_t v106 = &v29[v105];
              v107 = &v30[v105];
              *(void *)uint64_t v106 = *(void *)v107;
              *((void *)v106 + 1) = *((void *)v107 + 1);
              uint64_t v151 = *(void (**)(char *, void, uint64_t, int *))(v142 + 56);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v151(v29, 0, 1, v31);
            }
            uint64_t v108 = v20[8];
            uint64_t v109 = (char *)a1 + v108;
            v110 = (char *)a2 + v108;
            uint64_t v111 = *(void *)v110;
            v109[8] = v110[8];
            *(void *)uint64_t v109 = v111;
            uint64_t v112 = v20[9];
            uint64_t v113 = (void *)((char *)a1 + v112);
            v114 = (void *)((char *)a2 + v112);
            void *v113 = *v114;
            v113[1] = v114[1];
            swift_bridgeObjectRetain();
            break;
          case 3u:
            *a1 = *a2;
            uint64_t v33 = sub_228AAD1F0();
            uint64_t v34 = *(int *)(v33 + 20);
            v139 = (char *)a2 + v34;
            v143 = (char *)a1 + v34;
            uint64_t v35 = sub_228AACF40();
            uint64_t v36 = *(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16);
            swift_bridgeObjectRetain();
            v36(v143, v139, v35);
            uint64_t v37 = *(int *)(v33 + 24);
            uint64_t v38 = (char *)a1 + v37;
            uint64_t v39 = (char *)a2 + v37;
            char v40 = v39[8];
            *(void *)uint64_t v38 = *(void *)v39;
            v38[8] = v40;
            break;
          case 4u:
            uint64_t v41 = sub_228AACF40();
            uint64_t v144 = *(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16);
            v144((char *)a1, (char *)a2, v41);
            uint64_t v42 = *(int *)(sub_228AAD200() + 20);
            uint64_t v43 = (char *)a1 + v42;
            unsigned __int8 v44 = (char *)a2 + v42;
            uint64_t v45 = sub_228AAD0B0();
            uint64_t v46 = *(void *)(v45 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
            {
              uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B68);
              memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
            }
            else
            {
              v144(v43, v44, v41);
              *(void *)&v43[*(int *)(v45 + 20)] = *(void *)&v44[*(int *)(v45 + 20)];
              uint64_t v115 = *(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56);
              swift_retain();
              v115(v43, 0, 1, v45);
            }
            break;
          case 5u:
            *a1 = *a2;
            a1[1] = a2[1];
            uint64_t v48 = (int *)sub_228AAD120();
            uint64_t v49 = v48[6];
            uint64_t v140 = (char *)a2 + v49;
            v145 = (char *)a1 + v49;
            uint64_t v50 = sub_228AACF40();
            uint64_t v135 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v135(v145, v140, v50);
            *((unsigned char *)a1 + v48[7]) = *((unsigned char *)a2 + v48[7]);
            *((unsigned char *)a1 + v48[8]) = *((unsigned char *)a2 + v48[8]);
            break;
          case 6u:
            uint64_t v51 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v51 - 8) + 16))(a1, a2, v51);
            uint64_t v52 = sub_228AAD530();
            *((unsigned char *)a1 + *(int *)(v52 + 20)) = *((unsigned char *)a2 + *(int *)(v52 + 20));
            uint64_t v53 = *(int *)(v52 + 24);
            uint64_t v54 = (char *)a1 + v53;
            uint64_t v55 = (char *)a2 + v53;
            char v56 = v55[8];
            *(void *)uint64_t v54 = *(void *)v55;
            v54[8] = v56;
            break;
          case 7u:
            uint64_t v57 = sub_228AACF40();
            v146 = *(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16);
            v146((char *)a1, (char *)a2, v57);
            uint64_t v58 = *(int *)(sub_228AAD470() + 20);
            uint64_t v59 = (char *)a1 + v58;
            uint64_t v60 = (char *)a2 + v58;
            uint64_t v61 = (int *)sub_228AAD1E0();
            uint64_t v62 = *((void *)v61 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v62 + 48))(v60, 1, v61))
            {
              uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B70);
              memcpy(v59, v60, *(void *)(*(void *)(v63 - 8) + 64));
            }
            else
            {
              v146(v59, v60, v57);
              uint64_t v116 = v61[5];
              v117 = &v59[v116];
              v118 = &v60[v116];
              *(void *)v117 = *(void *)v118;
              *((void *)v117 + 1) = *((void *)v118 + 1);
              uint64_t v119 = v61[6];
              v120 = &v59[v119];
              uint64_t v121 = &v60[v119];
              char v122 = v121[8];
              *(void *)v120 = *(void *)v121;
              v120[8] = v122;
              uint64_t v123 = v61[7];
              uint64_t v124 = &v59[v123];
              uint64_t v125 = &v60[v123];
              char v126 = v125[8];
              *(void *)uint64_t v124 = *(void *)v125;
              v124[8] = v126;
              uint64_t v127 = *(void (**)(char *, void, uint64_t, int *))(v62 + 56);
              swift_bridgeObjectRetain();
              v127(v59, 0, 1, v61);
            }
            break;
          case 8u:
          case 0xAu:
          case 0xCu:
            uint64_t v72 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v72 - 8) + 16))(a1, a2, v72);
            break;
          case 9u:
            *a1 = *a2;
            uint64_t v64 = *(int *)(sub_228AAD450() + 20);
            uint64_t v65 = (char *)a1 + v64;
            uint64_t v147 = (char *)a2 + v64;
            uint64_t v66 = sub_228AACF40();
            uint64_t v67 = *(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 16);
            swift_bridgeObjectRetain();
            v67(v65, v147, v66);
            break;
          case 0xBu:
            *a1 = *a2;
            uint64_t v68 = *(int *)(sub_228AAD460() + 20);
            uint64_t v69 = (char *)a1 + v68;
            uint64_t v148 = (char *)a2 + v68;
            uint64_t v70 = sub_228AACF40();
            uint64_t v71 = *(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16);
            swift_bridgeObjectRetain();
            v71(v69, v148, v70);
            break;
          case 0xDu:
            uint64_t v73 = sub_228AACF40();
            v149 = *(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 16);
            v149((char *)a1, (char *)a2, v73);
            uint64_t v74 = *(int *)(sub_228AAD480() + 20);
            uint64_t v75 = (void *)((char *)a1 + v74);
            uint64_t v76 = (void *)((char *)a2 + v74);
            uint64_t v77 = sub_228AAD4F0();
            uint64_t v78 = *(void *)(v77 - 8);
            if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v78 + 48))(v76, 1, v77))
            {
              uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B78);
              memcpy(v75, v76, *(void *)(*(void *)(v79 - 8) + 64));
            }
            else
            {
              *uint64_t v75 = *v76;
              uint64_t v128 = *(int *)(v77 + 20);
              uint64_t v137 = (char *)v75 + v128;
              v129 = (char *)v76 + v128;
              swift_bridgeObjectRetain();
              v149(v137, v129, v73);
              (*(void (**)(void *, void, uint64_t, uint64_t))(v78 + 56))(v75, 0, 1, v77);
            }
            break;
          case 0xEu:
            uint64_t v80 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v80 - 8) + 16))(a1, a2, v80);
            uint64_t v81 = *(int *)(sub_228AAD500() + 20);
            uint64_t v82 = (char *)a1 + v81;
            uint64_t v83 = (char *)a2 + v81;
            char v84 = v83[8];
            *(void *)uint64_t v82 = *(void *)v83;
            v82[8] = v84;
            break;
          case 0xFu:
            *a1 = *a2;
            a1[1] = a2[1];
            uint64_t v85 = sub_228AAD4B0();
            uint64_t v86 = *(int *)(v85 + 24);
            uint64_t v141 = (char *)a2 + v86;
            uint64_t v150 = (char *)a1 + v86;
            uint64_t v87 = sub_228AACF40();
            v136 = *(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 16);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v136(v150, v141, v87);
            *((unsigned char *)a1 + *(int *)(v85 + 28)) = *((unsigned char *)a2 + *(int *)(v85 + 28));
            break;
          case 0x10u:
            uint64_t v88 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v88 - 8) + 16))(a1, a2, v88);
            uint64_t v89 = *(int *)(sub_228AAD540() + 20);
            uint64_t v90 = (void *)((char *)a1 + v89);
            uint64_t v91 = (void *)((char *)a2 + v89);
            *uint64_t v90 = *v91;
            v90[1] = v91[1];
            swift_bridgeObjectRetain();
            break;
          case 0x11u:
            uint64_t v92 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v92 - 8) + 16))(a1, a2, v92);
            uint64_t v93 = *(int *)(sub_228AAD4C0() + 20);
            uint64_t v94 = (void *)((char *)a1 + v93);
            uint64_t v95 = (void *)((char *)a2 + v93);
            void *v94 = *v95;
            v94[1] = v95[1];
            swift_bridgeObjectRetain();
            break;
          default:
            uint64_t v11 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
            uint64_t v12 = *(int *)(sub_228AAD140() + 20);
            uint64_t v13 = (void *)((char *)a1 + v12);
            uint64_t v14 = (void *)((char *)a2 + v12);
            *uint64_t v13 = *v14;
            v13[1] = v14[1];
            swift_bridgeObjectRetain();
            break;
        }
        swift_storeEnumTagMultiPayload();
        (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      }
      uint64_t v130 = *(int *)(sub_228AACFD0() + 20);
      uint64_t v131 = (char *)a1 + v130;
      uint64_t v132 = (char *)a2 + v130;
      uint64_t v133 = sub_228AACF40();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v133 - 8) + 16))(v131, v132, v133);
    }
    else
    {
      uint64_t v7 = sub_228AACF40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = *(int *)(sub_228AAD140() + 20);
      uint64_t v9 = (void *)((char *)a1 + v8);
      uint64_t v10 = (void *)((char *)a2 + v8);
      *uint64_t v9 = *v10;
      v9[1] = v10[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_228AA818C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for XpcClientError();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for XpcClientError()
{
  uint64_t result = qword_268290B80;
  if (!qword_268290B80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_228AA8234(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_228AACFC0();
    uint64_t v5 = *(void *)(v4 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C380);
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v11 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
          uint64_t v12 = sub_228AAD130();
          *(_OWORD *)((char *)a1 + *(int *)(v12 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v12 + 20));
          break;
        case 2u:
          uint64_t v13 = sub_228AACF40();
          uint64_t v102 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
          uint64_t v103 = v13;
          ((void (*)(void *, void *))v102)(a1, a2);
          uint64_t v14 = (int *)sub_228AAD250();
          uint64_t v15 = v14[5];
          uint64_t v16 = (char *)a1 + v15;
          uint64_t v17 = (char *)a2 + v15;
          *(void *)uint64_t v16 = *(void *)v17;
          *((_WORD *)v16 + 4) = *((_WORD *)v17 + 4);
          uint64_t v18 = v14[6];
          uint64_t v19 = (char *)a1 + v18;
          uint64_t v20 = (char *)a2 + v18;
          *(void *)uint64_t v19 = *(void *)v20;
          v19[8] = v20[8];
          uint64_t v21 = v14[7];
          uint64_t v22 = (char *)a1 + v21;
          uint64_t v23 = (char *)a2 + v21;
          __int16 v24 = (int *)sub_228AAD2C0();
          uint64_t v25 = *((void *)v24 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v25 + 48))(v23, 1, v24))
          {
            uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B60);
            memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
          }
          else
          {
            v102(v22, v23, v103);
            *(_OWORD *)&v22[v24[5]] = *(_OWORD *)&v23[v24[5]];
            *(_OWORD *)&v22[v24[6]] = *(_OWORD *)&v23[v24[6]];
            *(_OWORD *)&v22[v24[7]] = *(_OWORD *)&v23[v24[7]];
            *(_OWORD *)&v22[v24[8]] = *(_OWORD *)&v23[v24[8]];
            (*(void (**)(char *, void, uint64_t, int *))(v25 + 56))(v22, 0, 1, v24);
          }
          uint64_t v88 = v14[8];
          uint64_t v89 = (char *)a1 + v88;
          uint64_t v90 = (char *)a2 + v88;
          *(void *)uint64_t v89 = *(void *)v90;
          v89[8] = v90[8];
          *(_OWORD *)((char *)a1 + v14[9]) = *(_OWORD *)((char *)a2 + v14[9]);
          break;
        case 3u:
          *a1 = *a2;
          uint64_t v27 = sub_228AAD1F0();
          uint64_t v28 = *(int *)(v27 + 20);
          uint64_t v29 = (char *)a1 + v28;
          uint64_t v30 = (char *)a2 + v28;
          uint64_t v31 = sub_228AACF40();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
          uint64_t v32 = *(int *)(v27 + 24);
          uint64_t v33 = (char *)a1 + v32;
          uint64_t v34 = (char *)a2 + v32;
          *(void *)uint64_t v33 = *(void *)v34;
          v33[8] = v34[8];
          break;
        case 4u:
          uint64_t v35 = sub_228AACF40();
          v104 = *(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32);
          v104((char *)a1, (char *)a2, v35);
          uint64_t v36 = *(int *)(sub_228AAD200() + 20);
          uint64_t v37 = (char *)a1 + v36;
          uint64_t v38 = (char *)a2 + v36;
          uint64_t v39 = sub_228AAD0B0();
          uint64_t v40 = *(void *)(v39 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
          {
            uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B68);
            memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
          }
          else
          {
            v104(v37, v38, v35);
            *(void *)&v37[*(int *)(v39 + 20)] = *(void *)&v38[*(int *)(v39 + 20)];
            (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
          }
          break;
        case 5u:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          uint64_t v42 = (int *)sub_228AAD120();
          uint64_t v43 = v42[6];
          unsigned __int8 v44 = (char *)a1 + v43;
          uint64_t v45 = (char *)a2 + v43;
          uint64_t v46 = sub_228AACF40();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
          *((unsigned char *)a1 + v42[7]) = *((unsigned char *)a2 + v42[7]);
          *((unsigned char *)a1 + v42[8]) = *((unsigned char *)a2 + v42[8]);
          break;
        case 6u:
          uint64_t v47 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v47 - 8) + 32))(a1, a2, v47);
          uint64_t v48 = sub_228AAD530();
          *((unsigned char *)a1 + *(int *)(v48 + 20)) = *((unsigned char *)a2 + *(int *)(v48 + 20));
          uint64_t v49 = *(int *)(v48 + 24);
          uint64_t v50 = (char *)a1 + v49;
          uint64_t v51 = (char *)a2 + v49;
          v50[8] = v51[8];
          *(void *)uint64_t v50 = *(void *)v51;
          break;
        case 7u:
          uint64_t v52 = sub_228AACF40();
          uint64_t v105 = *(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32);
          v105((char *)a1, (char *)a2, v52);
          uint64_t v53 = *(int *)(sub_228AAD470() + 20);
          uint64_t v54 = (char *)a1 + v53;
          uint64_t v55 = (char *)a2 + v53;
          char v56 = (int *)sub_228AAD1E0();
          uint64_t v57 = *((void *)v56 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v57 + 48))(v55, 1, v56))
          {
            uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B70);
            memcpy(v54, v55, *(void *)(*(void *)(v58 - 8) + 64));
          }
          else
          {
            v105(v54, v55, v52);
            *(_OWORD *)&v54[v56[5]] = *(_OWORD *)&v55[v56[5]];
            uint64_t v91 = v56[6];
            uint64_t v92 = &v54[v91];
            uint64_t v93 = &v55[v91];
            *(void *)uint64_t v92 = *(void *)v93;
            v92[8] = v93[8];
            uint64_t v94 = v56[7];
            uint64_t v95 = &v54[v94];
            uint64_t v96 = &v55[v94];
            *(void *)uint64_t v95 = *(void *)v96;
            v95[8] = v96[8];
            (*(void (**)(char *, void, uint64_t, int *))(v57 + 56))(v54, 0, 1, v56);
          }
          break;
        case 8u:
        case 0xAu:
        case 0xCu:
          uint64_t v67 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v67 - 8) + 32))(a1, a2, v67);
          break;
        case 9u:
          *a1 = *a2;
          uint64_t v59 = *(int *)(sub_228AAD450() + 20);
          uint64_t v60 = (char *)a1 + v59;
          uint64_t v61 = (char *)a2 + v59;
          uint64_t v62 = sub_228AACF40();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 32))(v60, v61, v62);
          break;
        case 0xBu:
          *a1 = *a2;
          uint64_t v63 = *(int *)(sub_228AAD460() + 20);
          uint64_t v64 = (char *)a1 + v63;
          uint64_t v65 = (char *)a2 + v63;
          uint64_t v66 = sub_228AACF40();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32))(v64, v65, v66);
          break;
        case 0xDu:
          uint64_t v68 = sub_228AACF40();
          uint64_t v106 = *(void (**)(void *, void *, uint64_t))(*(void *)(v68 - 8) + 32);
          v106(a1, a2, v68);
          uint64_t v69 = *(int *)(sub_228AAD480() + 20);
          uint64_t v70 = (void *)((char *)a1 + v69);
          uint64_t v71 = (void *)((char *)a2 + v69);
          uint64_t v72 = sub_228AAD4F0();
          uint64_t v73 = *(void *)(v72 - 8);
          if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v73 + 48))(v71, 1, v72))
          {
            uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B78);
            memcpy(v70, v71, *(void *)(*(void *)(v74 - 8) + 64));
          }
          else
          {
            *uint64_t v70 = *v71;
            v106((void *)((char *)v70 + *(int *)(v72 + 20)), (void *)((char *)v71 + *(int *)(v72 + 20)), v68);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v73 + 56))(v70, 0, 1, v72);
          }
          break;
        case 0xEu:
          uint64_t v75 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v75 - 8) + 32))(a1, a2, v75);
          uint64_t v76 = *(int *)(sub_228AAD500() + 20);
          uint64_t v77 = (char *)a1 + v76;
          uint64_t v78 = (char *)a2 + v76;
          *(void *)uint64_t v77 = *(void *)v78;
          v77[8] = v78[8];
          break;
        case 0xFu:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          uint64_t v79 = sub_228AAD4B0();
          uint64_t v80 = *(int *)(v79 + 24);
          uint64_t v81 = (char *)a1 + v80;
          uint64_t v82 = (char *)a2 + v80;
          uint64_t v83 = sub_228AACF40();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 32))(v81, v82, v83);
          *((unsigned char *)a1 + *(int *)(v79 + 28)) = *((unsigned char *)a2 + *(int *)(v79 + 28));
          break;
        case 0x10u:
          uint64_t v84 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v84 - 8) + 32))(a1, a2, v84);
          uint64_t v85 = sub_228AAD540();
          *(_OWORD *)((char *)a1 + *(int *)(v85 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v85 + 20));
          break;
        case 0x11u:
          uint64_t v86 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v86 - 8) + 32))(a1, a2, v86);
          uint64_t v87 = sub_228AAD4C0();
          *(_OWORD *)((char *)a1 + *(int *)(v87 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v87 + 20));
          break;
        default:
          uint64_t v9 = sub_228AACF40();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
          uint64_t v10 = sub_228AAD140();
          *(_OWORD *)((char *)a1 + *(int *)(v10 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v10 + 20));
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
    }
    uint64_t v97 = *(int *)(sub_228AACFD0() + 20);
    uint64_t v98 = (char *)a1 + v97;
    uint64_t v99 = (char *)a2 + v97;
    uint64_t v100 = sub_228AACF40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v100 - 8) + 32))(v98, v99, v100);
  }
  else
  {
    uint64_t v7 = sub_228AACF40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = sub_228AAD140();
    *(_OWORD *)((char *)a1 + *(int *)(v8 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v8 + 20));
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_228AA8FE0(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_228AA818C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_228AACFC0();
      uint64_t v5 = *(void *)(v4 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
      {
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C380);
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v11 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
            uint64_t v12 = sub_228AAD130();
            *(_OWORD *)((char *)a1 + *(int *)(v12 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v12 + 20));
            break;
          case 2u:
            uint64_t v13 = sub_228AACF40();
            uint64_t v102 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
            uint64_t v103 = v13;
            ((void (*)(void *, void *))v102)(a1, a2);
            uint64_t v14 = (int *)sub_228AAD250();
            uint64_t v15 = v14[5];
            uint64_t v16 = (char *)a1 + v15;
            uint64_t v17 = (char *)a2 + v15;
            *(void *)uint64_t v16 = *(void *)v17;
            *((_WORD *)v16 + 4) = *((_WORD *)v17 + 4);
            uint64_t v18 = v14[6];
            uint64_t v19 = (char *)a1 + v18;
            uint64_t v20 = (char *)a2 + v18;
            *(void *)uint64_t v19 = *(void *)v20;
            v19[8] = v20[8];
            uint64_t v21 = v14[7];
            uint64_t v22 = (char *)a1 + v21;
            uint64_t v23 = (char *)a2 + v21;
            __int16 v24 = (int *)sub_228AAD2C0();
            uint64_t v25 = *((void *)v24 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v25 + 48))(v23, 1, v24))
            {
              uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B60);
              memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
            }
            else
            {
              v102(v22, v23, v103);
              *(_OWORD *)&v22[v24[5]] = *(_OWORD *)&v23[v24[5]];
              *(_OWORD *)&v22[v24[6]] = *(_OWORD *)&v23[v24[6]];
              *(_OWORD *)&v22[v24[7]] = *(_OWORD *)&v23[v24[7]];
              *(_OWORD *)&v22[v24[8]] = *(_OWORD *)&v23[v24[8]];
              (*(void (**)(char *, void, uint64_t, int *))(v25 + 56))(v22, 0, 1, v24);
            }
            uint64_t v88 = v14[8];
            uint64_t v89 = (char *)a1 + v88;
            uint64_t v90 = (char *)a2 + v88;
            *(void *)uint64_t v89 = *(void *)v90;
            v89[8] = v90[8];
            *(_OWORD *)((char *)a1 + v14[9]) = *(_OWORD *)((char *)a2 + v14[9]);
            break;
          case 3u:
            *a1 = *a2;
            uint64_t v27 = sub_228AAD1F0();
            uint64_t v28 = *(int *)(v27 + 20);
            uint64_t v29 = (char *)a1 + v28;
            uint64_t v30 = (char *)a2 + v28;
            uint64_t v31 = sub_228AACF40();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
            uint64_t v32 = *(int *)(v27 + 24);
            uint64_t v33 = (char *)a1 + v32;
            uint64_t v34 = (char *)a2 + v32;
            *(void *)uint64_t v33 = *(void *)v34;
            v33[8] = v34[8];
            break;
          case 4u:
            uint64_t v35 = sub_228AACF40();
            v104 = *(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32);
            v104((char *)a1, (char *)a2, v35);
            uint64_t v36 = *(int *)(sub_228AAD200() + 20);
            uint64_t v37 = (char *)a1 + v36;
            uint64_t v38 = (char *)a2 + v36;
            uint64_t v39 = sub_228AAD0B0();
            uint64_t v40 = *(void *)(v39 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
            {
              uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B68);
              memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
            }
            else
            {
              v104(v37, v38, v35);
              *(void *)&v37[*(int *)(v39 + 20)] = *(void *)&v38[*(int *)(v39 + 20)];
              (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
            }
            break;
          case 5u:
            *(_OWORD *)a1 = *(_OWORD *)a2;
            uint64_t v42 = (int *)sub_228AAD120();
            uint64_t v43 = v42[6];
            unsigned __int8 v44 = (char *)a1 + v43;
            uint64_t v45 = (char *)a2 + v43;
            uint64_t v46 = sub_228AACF40();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
            *((unsigned char *)a1 + v42[7]) = *((unsigned char *)a2 + v42[7]);
            *((unsigned char *)a1 + v42[8]) = *((unsigned char *)a2 + v42[8]);
            break;
          case 6u:
            uint64_t v47 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v47 - 8) + 32))(a1, a2, v47);
            uint64_t v48 = sub_228AAD530();
            *((unsigned char *)a1 + *(int *)(v48 + 20)) = *((unsigned char *)a2 + *(int *)(v48 + 20));
            uint64_t v49 = *(int *)(v48 + 24);
            uint64_t v50 = (char *)a1 + v49;
            uint64_t v51 = (char *)a2 + v49;
            v50[8] = v51[8];
            *(void *)uint64_t v50 = *(void *)v51;
            break;
          case 7u:
            uint64_t v52 = sub_228AACF40();
            uint64_t v105 = *(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32);
            v105((char *)a1, (char *)a2, v52);
            uint64_t v53 = *(int *)(sub_228AAD470() + 20);
            uint64_t v54 = (char *)a1 + v53;
            uint64_t v55 = (char *)a2 + v53;
            char v56 = (int *)sub_228AAD1E0();
            uint64_t v57 = *((void *)v56 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v57 + 48))(v55, 1, v56))
            {
              uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B70);
              memcpy(v54, v55, *(void *)(*(void *)(v58 - 8) + 64));
            }
            else
            {
              v105(v54, v55, v52);
              *(_OWORD *)&v54[v56[5]] = *(_OWORD *)&v55[v56[5]];
              uint64_t v91 = v56[6];
              uint64_t v92 = &v54[v91];
              uint64_t v93 = &v55[v91];
              *(void *)uint64_t v92 = *(void *)v93;
              v92[8] = v93[8];
              uint64_t v94 = v56[7];
              uint64_t v95 = &v54[v94];
              uint64_t v96 = &v55[v94];
              *(void *)uint64_t v95 = *(void *)v96;
              v95[8] = v96[8];
              (*(void (**)(char *, void, uint64_t, int *))(v57 + 56))(v54, 0, 1, v56);
            }
            break;
          case 8u:
          case 0xAu:
          case 0xCu:
            uint64_t v67 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v67 - 8) + 32))(a1, a2, v67);
            break;
          case 9u:
            *a1 = *a2;
            uint64_t v59 = *(int *)(sub_228AAD450() + 20);
            uint64_t v60 = (char *)a1 + v59;
            uint64_t v61 = (char *)a2 + v59;
            uint64_t v62 = sub_228AACF40();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 32))(v60, v61, v62);
            break;
          case 0xBu:
            *a1 = *a2;
            uint64_t v63 = *(int *)(sub_228AAD460() + 20);
            uint64_t v64 = (char *)a1 + v63;
            uint64_t v65 = (char *)a2 + v63;
            uint64_t v66 = sub_228AACF40();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32))(v64, v65, v66);
            break;
          case 0xDu:
            uint64_t v68 = sub_228AACF40();
            uint64_t v106 = *(void (**)(void *, void *, uint64_t))(*(void *)(v68 - 8) + 32);
            v106(a1, a2, v68);
            uint64_t v69 = *(int *)(sub_228AAD480() + 20);
            uint64_t v70 = (void *)((char *)a1 + v69);
            uint64_t v71 = (void *)((char *)a2 + v69);
            uint64_t v72 = sub_228AAD4F0();
            uint64_t v73 = *(void *)(v72 - 8);
            if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v73 + 48))(v71, 1, v72))
            {
              uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290B78);
              memcpy(v70, v71, *(void *)(*(void *)(v74 - 8) + 64));
            }
            else
            {
              *uint64_t v70 = *v71;
              v106((void *)((char *)v70 + *(int *)(v72 + 20)), (void *)((char *)v71 + *(int *)(v72 + 20)), v68);
              (*(void (**)(void *, void, uint64_t, uint64_t))(v73 + 56))(v70, 0, 1, v72);
            }
            break;
          case 0xEu:
            uint64_t v75 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v75 - 8) + 32))(a1, a2, v75);
            uint64_t v76 = *(int *)(sub_228AAD500() + 20);
            uint64_t v77 = (char *)a1 + v76;
            uint64_t v78 = (char *)a2 + v76;
            *(void *)uint64_t v77 = *(void *)v78;
            v77[8] = v78[8];
            break;
          case 0xFu:
            *(_OWORD *)a1 = *(_OWORD *)a2;
            uint64_t v79 = sub_228AAD4B0();
            uint64_t v80 = *(int *)(v79 + 24);
            uint64_t v81 = (char *)a1 + v80;
            uint64_t v82 = (char *)a2 + v80;
            uint64_t v83 = sub_228AACF40();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 32))(v81, v82, v83);
            *((unsigned char *)a1 + *(int *)(v79 + 28)) = *((unsigned char *)a2 + *(int *)(v79 + 28));
            break;
          case 0x10u:
            uint64_t v84 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v84 - 8) + 32))(a1, a2, v84);
            uint64_t v85 = sub_228AAD540();
            *(_OWORD *)((char *)a1 + *(int *)(v85 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v85 + 20));
            break;
          case 0x11u:
            uint64_t v86 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v86 - 8) + 32))(a1, a2, v86);
            uint64_t v87 = sub_228AAD4C0();
            *(_OWORD *)((char *)a1 + *(int *)(v87 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v87 + 20));
            break;
          default:
            uint64_t v9 = sub_228AACF40();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
            uint64_t v10 = sub_228AAD140();
            *(_OWORD *)((char *)a1 + *(int *)(v10 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v10 + 20));
            break;
        }
        swift_storeEnumTagMultiPayload();
        (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      }
      uint64_t v97 = *(int *)(sub_228AACFD0() + 20);
      uint64_t v98 = (char *)a1 + v97;
      uint64_t v99 = (char *)a2 + v97;
      uint64_t v100 = sub_228AACF40();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v100 - 8) + 32))(v98, v99, v100);
    }
    else
    {
      uint64_t v7 = sub_228AACF40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = sub_228AAD140();
      *(_OWORD *)((char *)a1 + *(int *)(v8 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v8 + 20));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_228AA9D9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_228AA9DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_228AA9DF0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_228AA9E00()
{
  uint64_t result = sub_228AAD140();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_228AACFD0();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_228AA9EC4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_228AA9EDC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_228AACF30();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_228AA9F40()
{
  uint64_t v0 = sub_228AAD5C0();
  __swift_allocate_value_buffer(v0, qword_26AF0C4E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AF0C4E8);
  type metadata accessor for XpcQuotaClient();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C508);
  return sub_228AAD5D0();
}

void sub_228AAA118(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = sub_228AACFB0();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_228AAD1D0();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NotificationContent();
  uint64_t v15 = swift_dynamicCastClass();
  if (v15)
  {
    uint64_t v27 = ObjectType;
    uint64_t v28 = a2;
    *(&v26 - 2) = (id)MEMORY[0x270FA5388](v15);
    sub_228AACD60(&qword_268290BA0, MEMORY[0x263F88BE0]);
    id v26 = a1;
    sub_228AACF50();
    if (qword_26AF0C500 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_228AAD5C0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26AF0C4E8);
    uint64_t v29 = 0;
    unint64_t v30 = 0xE000000000000000;
    sub_228AAD7A0();
    sub_228AAD6C0();
    sub_228AAD7C0();
    sub_228AAD6C0();
    sub_228AAD590();
    swift_bridgeObjectRelease();
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = v28;
    v17[3] = a3;
    v17[4] = v27;
    MEMORY[0x270FA5388](v17);
    *(&v26 - 2) = v14;
    sub_228AACD60(&qword_26AF0C378, MEMORY[0x263F88AC0]);
    swift_retain();
    sub_228AACF50();
    uint64_t v18 = *(void *)(v4 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient + 24);
    uint64_t v19 = *(void *)(v4 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient + 32);
    __swift_project_boxed_opaque_existential_1((void *)(v4 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient), v18);
    (*(void (**)(char *, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v19 + 8))(v11, sub_228AACD1C, v17, v18, v19);

    swift_release();
    sub_228AACE78((uint64_t)v11, MEMORY[0x263F88AC0]);
    sub_228AACE78((uint64_t)v14, MEMORY[0x263F88BE0]);
  }
  else
  {
    sub_228A9E9CC();
    uint64_t v20 = swift_allocError();
    uint64_t v21 = (objc_class *)type metadata accessor for NewOfferResponse();
    uint64_t v22 = (char *)objc_allocWithZone(v21);
    uint64_t v23 = &v22[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context];
    uint64_t v24 = sub_228AAD440();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
    *(void *)&v22[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError] = v20;
    v31.receiver = v22;
    v31.super_class = v21;
    id v25 = objc_msgSendSuper2(&v31, sel_init);
    a2();
  }
}

uint64_t sub_228AAA5A0(uint64_t a1, void (*a2)(id), uint64_t a3)
{
  v31[1] = a3;
  uint64_t v32 = a2;
  uint64_t v4 = sub_228AAD440();
  v31[0] = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_228AAD5C0();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_228AAD250();
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v31 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C380);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v31 - v20;
  sub_228AACC40(a1, (uint64_t)v31 - v20);
  uint64_t v22 = sub_228AACFC0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v21, 1, v22) != 1)
  {
    sub_228AACC40((uint64_t)v21, (uint64_t)v19);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      sub_228AACDA8((uint64_t)v19, (uint64_t)v15, MEMORY[0x263F88C18]);
      if (qword_26AF0C500 != -1) {
        swift_once();
      }
      uint64_t v23 = __swift_project_value_buffer(v7, (uint64_t)qword_26AF0C4E8);
      sub_228AACE10(v23, (uint64_t)v9, MEMORY[0x263F88E40]);
      uint64_t v34 = 0;
      unint64_t v35 = 0xE000000000000000;
      sub_228AAD7A0();
      swift_bridgeObjectRelease();
      uint64_t v34 = 0x6C65646F6D204C4DLL;
      unint64_t v35 = 0xEF5B3D6465737520;
      sub_228AAD210();
      sub_228AAD6C0();
      swift_bridgeObjectRelease();
      sub_228AAD6C0();
      sub_228AAD590();
      swift_bridgeObjectRelease();
      sub_228AACE78((uint64_t)v9, MEMORY[0x263F88E40]);
      uint64_t v24 = sub_228AACE10((uint64_t)v15, (uint64_t)v13, MEMORY[0x263F88C18]);
      MEMORY[0x270FA5388](v24);
      v31[-2] = v13;
      sub_228AACD60(&qword_268290BA8, MEMORY[0x263F88C88]);
      sub_228AACF50();
      id v25 = (objc_class *)type metadata accessor for NewOfferResponse();
      id v26 = (char *)objc_allocWithZone(v25);
      uint64_t v27 = &v26[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context];
      sub_228AACE10((uint64_t)v6, (uint64_t)&v26[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context], MEMORY[0x263F88C88]);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31[0] + 56))(v27, 0, 1, v4);
      *(void *)&v26[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError] = 0;
      v33.receiver = v26;
      v33.super_class = v25;
      id v28 = objc_msgSendSuper2(&v33, sel_init);
      sub_228AACE78((uint64_t)v6, MEMORY[0x263F88C88]);
      uint64_t v29 = (uint64_t (*)(void))MEMORY[0x263F88C18];
      sub_228AACE78((uint64_t)v13, MEMORY[0x263F88C18]);
      v32(v28);
      uint64_t v34 = 0;
      unint64_t v35 = 0xE000000000000000;
      sub_228AAD7A0();
      sub_228AAD6C0();
      sub_228AACFD0();
      sub_228AAD7C0();
      sub_228AAD6C0();
      sub_228AAD590();

      swift_bridgeObjectRelease();
      sub_228AACE78((uint64_t)v15, v29);
      return sub_228AA4024((uint64_t)v21, &qword_26AF0C380);
    }
    sub_228AACE78((uint64_t)v19, MEMORY[0x263F88AC8]);
  }
  if (qword_26AF0C500 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v7, (uint64_t)qword_26AF0C4E8);
  uint64_t v34 = 0;
  unint64_t v35 = 0xE000000000000000;
  sub_228AAD7A0();
  sub_228AAD6C0();
  sub_228AACFD0();
  sub_228AAD7C0();
  sub_228AAD6C0();
  sub_228AAD5B0();
  swift_bridgeObjectRelease();
  return sub_228AA4024((uint64_t)v21, &qword_26AF0C380);
}

uint64_t sub_228AAAC20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_228AAD1D0();
  MEMORY[0x270FA5388](v3 - 8);
  sub_228AACE10(a2, (uint64_t)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), MEMORY[0x263F88BE0]);
  return sub_228AACFA0();
}

uint64_t sub_228AAAD68(uint64_t a1, void (*a2)(id))
{
  uint64_t v4 = sub_228AAD530();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v26 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C380);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v26 - v14;
  sub_228AACC40(a1, (uint64_t)&v26 - v14);
  uint64_t v16 = sub_228AACFC0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v15, 1, v16) != 1)
  {
    sub_228AACC40((uint64_t)v15, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() == 6)
    {
      sub_228AACDA8((uint64_t)v13, (uint64_t)v9, MEMORY[0x263F88DC0]);
      sub_228AACE10((uint64_t)v9, (uint64_t)v7, MEMORY[0x263F88DC0]);
      uint64_t v17 = (objc_class *)type metadata accessor for NotificationPendingResponse();
      uint64_t v18 = (char *)objc_allocWithZone(v17);
      *(void *)&v18[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_responseError] = 0;
      char v19 = sub_228AAD510();
      uint64_t v20 = 0;
      if (v19) {
        uint64_t v20 = sub_228AAD520();
      }
      uint64_t v21 = &v18[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_maxDelayTsMillis];
      *(void *)uint64_t v21 = v20;
      v21[8] = (v19 & 1) == 0;
      v26.receiver = v18;
      v26.super_class = v17;
      id v22 = objc_msgSendSuper2(&v26, sel_init);
      sub_228AACE78((uint64_t)v7, MEMORY[0x263F88DC0]);
      a2(v22);
      if (qword_26AF0C500 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_228AAD5C0();
      __swift_project_value_buffer(v23, (uint64_t)qword_26AF0C4E8);
      uint64_t v27 = 0;
      unint64_t v28 = 0xE000000000000000;
      sub_228AAD7A0();
      sub_228AAD6C0();
      sub_228AACFD0();
      sub_228AAD7C0();
      sub_228AAD6C0();
      sub_228AAD590();

      swift_bridgeObjectRelease();
      sub_228AACE78((uint64_t)v9, MEMORY[0x263F88DC0]);
      return sub_228AA4024((uint64_t)v15, &qword_26AF0C380);
    }
    sub_228AACE78((uint64_t)v13, MEMORY[0x263F88AC8]);
  }
  if (qword_26AF0C500 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_228AAD5C0();
  __swift_project_value_buffer(v24, (uint64_t)qword_26AF0C4E8);
  uint64_t v27 = 0;
  unint64_t v28 = 0xE000000000000000;
  sub_228AAD7A0();
  sub_228AAD6C0();
  sub_228AACFD0();
  sub_228AAD7C0();
  sub_228AAD6C0();
  sub_228AAD5B0();
  swift_bridgeObjectRelease();
  return sub_228AA4024((uint64_t)v15, &qword_26AF0C380);
}

uint64_t sub_228AAB1B8()
{
  uint64_t v0 = sub_228AAD4E0();
  MEMORY[0x270FA5388](v0 - 8);
  sub_228AAD4D0();
  return sub_228AACF90();
}

uint64_t sub_228AAB490()
{
  uint64_t v0 = sub_228AAD4A0();
  MEMORY[0x270FA5388](v0);
  sub_228AACD60(&qword_26AF0C388, MEMORY[0x263F88D38]);
  sub_228AACF50();
  return sub_228AACF80();
}

uint64_t sub_228AAB580()
{
  return sub_228AAD490();
}

uint64_t sub_228AAB5B4(uint64_t a1, void (*a2)(void *))
{
  uint64_t v4 = sub_228AAD140();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_228AAD4C0();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C380);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v26 - v14;
  sub_228AACC40(a1, (uint64_t)&v26 - v14);
  uint64_t v16 = sub_228AACFC0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v15, 1, v16) == 1)
  {
LABEL_11:
    if (qword_26AF0C500 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_228AAD5C0();
    __swift_project_value_buffer(v22, (uint64_t)qword_26AF0C4E8);
    uint64_t v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    sub_228AAD7A0();
    sub_228AAD6C0();
    sub_228AACFD0();
    sub_228AAD7C0();
    sub_228AAD6C0();
    sub_228AAD5B0();
    swift_bridgeObjectRelease();
    type metadata accessor for XpcClientError();
    sub_228AACD60(&qword_268290B98, (void (*)(uint64_t))type metadata accessor for XpcClientError);
    uint64_t v23 = (void *)swift_allocError();
    sub_228AACE10(a1, v24, MEMORY[0x263F88B10]);
    swift_storeEnumTagMultiPayload();
    a2(v23);

    return sub_228AA4024((uint64_t)v15, &qword_26AF0C380);
  }
  sub_228AACC40((uint64_t)v15, (uint64_t)v13);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 17)
    {
      sub_228AACDA8((uint64_t)v13, (uint64_t)v9, MEMORY[0x263F88D50]);
      if (qword_26AF0C500 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_228AAD5C0();
      __swift_project_value_buffer(v18, (uint64_t)qword_26AF0C4E8);
      uint64_t v26 = 0;
      unint64_t v27 = 0xE000000000000000;
      sub_228AAD7A0();
      sub_228AAD6C0();
      sub_228AAD7C0();
      sub_228AAD6C0();
      sub_228AAD590();
      swift_bridgeObjectRelease();
      a2(0);
      sub_228AACE78((uint64_t)v9, MEMORY[0x263F88D50]);
      return sub_228AA4024((uint64_t)v15, &qword_26AF0C380);
    }
    sub_228AACE78((uint64_t)v13, MEMORY[0x263F88AC8]);
    goto LABEL_11;
  }
  sub_228AACDA8((uint64_t)v13, (uint64_t)v6, MEMORY[0x263F88BA8]);
  if (qword_26AF0C500 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_228AAD5C0();
  __swift_project_value_buffer(v19, (uint64_t)qword_26AF0C4E8);
  uint64_t v26 = 0;
  unint64_t v27 = 0xE000000000000000;
  sub_228AAD7A0();
  sub_228AAD6C0();
  sub_228AACFD0();
  sub_228AAD7C0();
  sub_228AAD6C0();
  sub_228AAD5B0();
  swift_bridgeObjectRelease();
  type metadata accessor for XpcClientError();
  sub_228AACD60(&qword_268290B98, (void (*)(uint64_t))type metadata accessor for XpcClientError);
  uint64_t v20 = (void *)swift_allocError();
  sub_228AACE10((uint64_t)v6, v21, MEMORY[0x263F88BA8]);
  swift_storeEnumTagMultiPayload();
  a2(v20);

  sub_228AACE78((uint64_t)v6, MEMORY[0x263F88BA8]);
  return sub_228AA4024((uint64_t)v15, &qword_26AF0C380);
}

id sub_228AAC014()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XpcQuotaClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for XpcQuotaClient()
{
  return self;
}

id sub_228AAC07C(uint64_t a1)
{
  uint64_t v2 = sub_228AAD5C0();
  MEMORY[0x270FA5388](v2);
  uint64_t v34 = (uint64_t)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268290BB0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v33 - v8;
  uint64_t v10 = sub_228AAD390();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v33 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v33 - v18;
  static QuotaServerProtocol.parse(fromFetchOffers:)(a1, (uint64_t)v9);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v20(v9, 1, v10) != 1)
  {
    sub_228AACDA8((uint64_t)v9, (uint64_t)v19, MEMORY[0x263F88C58]);
    uint64_t v24 = (uint64_t (*)(void))MEMORY[0x263F88C58];
    sub_228AACE10((uint64_t)v19, (uint64_t)v17, MEMORY[0x263F88C58]);
    id v25 = (objc_class *)type metadata accessor for NotificationContent();
    id v26 = objc_allocWithZone(v25);
    sub_228AACE10((uint64_t)v17, (uint64_t)v26 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient19NotificationContent_context, v24);
    v35.receiver = v26;
    v35.super_class = v25;
    id v23 = objc_msgSendSuper2(&v35, sel_init);
    unint64_t v27 = (uint64_t (*)(void))MEMORY[0x263F88C58];
    sub_228AACE78((uint64_t)v17, MEMORY[0x263F88C58]);
    uint64_t v28 = (uint64_t)v19;
LABEL_8:
    sub_228AACE78(v28, v27);
    return v23;
  }
  sub_228AA4024((uint64_t)v9, &qword_268290BB0);
  static QuotaServerProtocol.parse(fromPushNotification:)(a1, (uint64_t)v7);
  if (v20(v7, 1, v10) != 1)
  {
    sub_228AACDA8((uint64_t)v7, (uint64_t)v14, MEMORY[0x263F88C58]);
    uint64_t v29 = (uint64_t (*)(void))MEMORY[0x263F88C58];
    sub_228AACE10((uint64_t)v14, (uint64_t)v17, MEMORY[0x263F88C58]);
    unint64_t v30 = (objc_class *)type metadata accessor for NotificationContent();
    id v31 = objc_allocWithZone(v30);
    sub_228AACE10((uint64_t)v17, (uint64_t)v31 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient19NotificationContent_context, v29);
    v36.receiver = v31;
    v36.super_class = v30;
    id v23 = objc_msgSendSuper2(&v36, sel_init);
    unint64_t v27 = (uint64_t (*)(void))MEMORY[0x263F88C58];
    sub_228AACE78((uint64_t)v17, MEMORY[0x263F88C58]);
    uint64_t v28 = (uint64_t)v14;
    goto LABEL_8;
  }
  sub_228AA4024((uint64_t)v7, &qword_268290BB0);
  if (qword_26AF0C500 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v2, (uint64_t)qword_26AF0C4E8);
  uint64_t v22 = v34;
  sub_228AACE10(v21, v34, MEMORY[0x263F88E40]);
  unint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_228AAD7A0();
  swift_bridgeObjectRelease();
  unint64_t v37 = 0xD000000000000027;
  unint64_t v38 = 0x8000000228AAF780;
  sub_228AAD630();
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD6C0();
  unint64_t v37 = 0xD000000000000031;
  unint64_t v38 = 0x8000000228AAF740;
  sub_228AAD6C0();
  swift_bridgeObjectRelease();
  sub_228AAD590();
  swift_bridgeObjectRelease();
  sub_228AACE78(v22, MEMORY[0x263F88E40]);
  return 0;
}

id sub_228AAC560(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228AAD440();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C390);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_228AAD580();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_228AAD5C0();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1 && a2 == 0xE000000000000000 || (sub_228AAD820() & 1) != 0)
  {
    id v17 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FailsafeDelayedOffer()), sel_init);
    if (qword_26AF0C500 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v14, (uint64_t)qword_26AF0C4E8);
    sub_228AACE10(v18, (uint64_t)v16, MEMORY[0x263F88E40]);
    unint64_t v30 = 91;
    unint64_t v31 = 0xE100000000000000;
    id v19 = objc_msgSend(v17, sel_newOfferResponse);
    id v20 = objc_msgSend(v19, sel_toContext);

    sub_228AAD620();
    sub_228AAD630();
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_228AAD6C0();
    unint64_t v30 = 0xD000000000000094;
    unint64_t v31 = 0x8000000228AAF4E0;
    sub_228AAD6C0();
    swift_bridgeObjectRelease();
    sub_228AAD5A0();
    swift_bridgeObjectRelease();
    uint64_t v21 = (uint64_t (*)(void))MEMORY[0x263F88E40];
    uint64_t v22 = (uint64_t)v16;
    goto LABEL_7;
  }
  sub_228AAD3B0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_228AA4024((uint64_t)v9, &qword_26AF0C390);
    if (qword_26AF0C500 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v14, (uint64_t)qword_26AF0C4E8);
    sub_228AACE10(v24, (uint64_t)v16, MEMORY[0x263F88E40]);
    unint64_t v30 = 0;
    unint64_t v31 = 0xE000000000000000;
    sub_228AAD7A0();
    swift_bridgeObjectRelease();
    unint64_t v30 = 0xD00000000000001DLL;
    unint64_t v31 = 0x8000000228AAF480;
    sub_228AAD6C0();
    sub_228AAD6C0();
    sub_228AAD5B0();
    swift_bridgeObjectRelease();
    id v25 = (uint64_t (*)(void))MEMORY[0x263F88E40];
    uint64_t v26 = (uint64_t)v16;
LABEL_21:
    sub_228AACE78(v26, v25);
    return 0;
  }
  sub_228AACDA8((uint64_t)v9, (uint64_t)v13, MEMORY[0x263F88E28]);
  if (sub_228AAD570())
  {
    id v17 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FailsafeDelayedOffer()), sel_init);
  }
  else
  {
    if ((sub_228AAD560() & 1) == 0)
    {
      if (qword_26AF0C500 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v14, (uint64_t)qword_26AF0C4E8);
      unint64_t v30 = 0;
      unint64_t v31 = 0xE000000000000000;
      sub_228AAD7A0();
      sub_228AAD6C0();
      sub_228AAD7C0();
      sub_228AAD6C0();
      sub_228AAD5B0();
      swift_bridgeObjectRelease();
      id v25 = (uint64_t (*)(void))MEMORY[0x263F88E28];
      uint64_t v26 = (uint64_t)v13;
      goto LABEL_21;
    }
    sub_228AAD550();
    unint64_t v27 = (objc_class *)type metadata accessor for DelayedOffer();
    id v28 = objc_allocWithZone(v27);
    sub_228AACE10((uint64_t)v6, (uint64_t)v28 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient12DelayedOffer_context, MEMORY[0x263F88C88]);
    v29.receiver = v28;
    v29.super_class = v27;
    id v17 = objc_msgSendSuper2(&v29, sel_init);
    sub_228AACE78((uint64_t)v6, MEMORY[0x263F88C88]);
  }
  uint64_t v21 = (uint64_t (*)(void))MEMORY[0x263F88E28];
  uint64_t v22 = (uint64_t)v13;
LABEL_7:
  sub_228AACE78(v22, v21);
  return v17;
}

uint64_t sub_228AACBB8()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_228AACC34(uint64_t a1)
{
  return sub_228AAB5B4(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t sub_228AACC40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0C380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_228AACCA8(uint64_t a1)
{
  return sub_228AAAD68(a1, *(void (**)(id))(v1 + 16));
}

uint64_t sub_228AACCB4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_228AACCC8()
{
  return sub_228A9E144();
}

uint64_t sub_228AACCE4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_228AACD1C(uint64_t a1)
{
  return sub_228AAA5A0(a1, *(void (**)(id))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_228AACD28(uint64_t a1)
{
  return sub_228AAAC20(a1, *(void *)(v1 + 16));
}

uint64_t sub_228AACD44()
{
  return sub_228A9D714();
}

uint64_t sub_228AACD60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_228AACDA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_228AACE10(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_228AACE78(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_228AACEF0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_228AACF00()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_228AACF10()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_228AACF20()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_228AACF30()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_228AACF40()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_228AACF50()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_228AACF60()
{
  return MEMORY[0x270F87D88]();
}

uint64_t sub_228AACF70()
{
  return MEMORY[0x270F87D90]();
}

uint64_t sub_228AACF80()
{
  return MEMORY[0x270F87DA8]();
}

uint64_t sub_228AACF90()
{
  return MEMORY[0x270F87DB0]();
}

uint64_t sub_228AACFA0()
{
  return MEMORY[0x270F87DB8]();
}

uint64_t sub_228AACFB0()
{
  return MEMORY[0x270F87DC0]();
}

uint64_t sub_228AACFC0()
{
  return MEMORY[0x270F87DC8]();
}

uint64_t sub_228AACFD0()
{
  return MEMORY[0x270F87E30]();
}

uint64_t sub_228AACFE0()
{
  return MEMORY[0x270F87E38]();
}

uint64_t sub_228AACFF0()
{
  return MEMORY[0x270F87E40]();
}

uint64_t sub_228AAD000()
{
  return MEMORY[0x270F87E48]();
}

uint64_t sub_228AAD010()
{
  return MEMORY[0x270F87E50]();
}

uint64_t sub_228AAD020()
{
  return MEMORY[0x270F87E58]();
}

uint64_t sub_228AAD030()
{
  return MEMORY[0x270F87E68]();
}

uint64_t sub_228AAD040()
{
  return MEMORY[0x270F87E70]();
}

uint64_t sub_228AAD050()
{
  return MEMORY[0x270F87E78]();
}

uint64_t sub_228AAD060()
{
  return MEMORY[0x270F87E80]();
}

uint64_t sub_228AAD070()
{
  return MEMORY[0x270F87E88]();
}

uint64_t sub_228AAD080()
{
  return MEMORY[0x270F87E90]();
}

uint64_t sub_228AAD090()
{
  return MEMORY[0x270F87E98]();
}

uint64_t sub_228AAD0A0()
{
  return MEMORY[0x270F87EA8]();
}

uint64_t sub_228AAD0B0()
{
  return MEMORY[0x270F87FB8]();
}

uint64_t sub_228AAD0C0()
{
  return MEMORY[0x270F88000]();
}

uint64_t sub_228AAD0D0()
{
  return MEMORY[0x270F88008]();
}

uint64_t sub_228AAD0E0()
{
  return MEMORY[0x270F88018]();
}

uint64_t sub_228AAD0F0()
{
  return MEMORY[0x270F88020]();
}

uint64_t sub_228AAD100()
{
  return MEMORY[0x270F88028]();
}

uint64_t _s33iCloudSubscriptionOptimizerClient0D8LibEventCfd_0()
{
  return MEMORY[0x270F88030]();
}

uint64_t sub_228AAD120()
{
  return MEMORY[0x270F88060]();
}

uint64_t sub_228AAD130()
{
  return MEMORY[0x270F88070]();
}

uint64_t sub_228AAD140()
{
  return MEMORY[0x270F88088]();
}

uint64_t sub_228AAD150()
{
  return MEMORY[0x270F88090]();
}

uint64_t sub_228AAD160()
{
  return MEMORY[0x270F88098]();
}

uint64_t sub_228AAD170()
{
  return MEMORY[0x270F880C0]();
}

uint64_t sub_228AAD180()
{
  return MEMORY[0x270F880C8]();
}

uint64_t sub_228AAD190()
{
  return MEMORY[0x270F88128]();
}

uint64_t sub_228AAD1A0()
{
  return MEMORY[0x270F88138]();
}

uint64_t sub_228AAD1B0()
{
  return MEMORY[0x270F88148]();
}

uint64_t sub_228AAD1C0()
{
  return MEMORY[0x270F88158]();
}

uint64_t sub_228AAD1D0()
{
  return MEMORY[0x270F88168]();
}

uint64_t sub_228AAD1E0()
{
  return MEMORY[0x270F88190]();
}

uint64_t sub_228AAD1F0()
{
  return MEMORY[0x270F881A8]();
}

uint64_t sub_228AAD200()
{
  return MEMORY[0x270F881B8]();
}

uint64_t sub_228AAD210()
{
  return MEMORY[0x270F881C0]();
}

uint64_t sub_228AAD220()
{
  return MEMORY[0x270F881D0]();
}

uint64_t sub_228AAD230()
{
  return MEMORY[0x270F881E0]();
}

uint64_t sub_228AAD240()
{
  return MEMORY[0x270F881F8]();
}

uint64_t sub_228AAD250()
{
  return MEMORY[0x270F88208]();
}

uint64_t sub_228AAD260()
{
  return MEMORY[0x270F88210]();
}

uint64_t sub_228AAD270()
{
  return MEMORY[0x270F88218]();
}

uint64_t sub_228AAD280()
{
  return MEMORY[0x270F88220]();
}

uint64_t sub_228AAD290()
{
  return MEMORY[0x270F88228]();
}

uint64_t sub_228AAD2A0()
{
  return MEMORY[0x270F88230]();
}

uint64_t sub_228AAD2B0()
{
  return MEMORY[0x270F88238]();
}

uint64_t sub_228AAD2C0()
{
  return MEMORY[0x270F88248]();
}

uint64_t sub_228AAD2D0()
{
  return MEMORY[0x270F882E0]();
}

uint64_t sub_228AAD2E0()
{
  return MEMORY[0x270F882E8]();
}

uint64_t sub_228AAD2F0()
{
  return MEMORY[0x270F882F0]();
}

uint64_t sub_228AAD300()
{
  return MEMORY[0x270F882F8]();
}

uint64_t sub_228AAD310()
{
  return MEMORY[0x270F88300]();
}

uint64_t sub_228AAD320()
{
  return MEMORY[0x270F88308]();
}

uint64_t sub_228AAD330()
{
  return MEMORY[0x270F88310]();
}

uint64_t sub_228AAD340()
{
  return MEMORY[0x270F88318]();
}

uint64_t sub_228AAD350()
{
  return MEMORY[0x270F88320]();
}

uint64_t sub_228AAD360()
{
  return MEMORY[0x270F88328]();
}

uint64_t sub_228AAD370()
{
  return MEMORY[0x270F88330]();
}

uint64_t sub_228AAD380()
{
  return MEMORY[0x270F88338]();
}

uint64_t sub_228AAD390()
{
  return MEMORY[0x270F88340]();
}

uint64_t sub_228AAD3A0()
{
  return MEMORY[0x270F88350]();
}

uint64_t sub_228AAD3B0()
{
  return MEMORY[0x270F88358]();
}

uint64_t sub_228AAD3C0()
{
  return MEMORY[0x270F883A0]();
}

uint64_t sub_228AAD3D0()
{
  return MEMORY[0x270F883A8]();
}

uint64_t sub_228AAD3E0()
{
  return MEMORY[0x270F883B0]();
}

uint64_t sub_228AAD3F0()
{
  return MEMORY[0x270F883B8]();
}

uint64_t sub_228AAD400()
{
  return MEMORY[0x270F883C0]();
}

uint64_t sub_228AAD410()
{
  return MEMORY[0x270F883C8]();
}

uint64_t sub_228AAD420()
{
  return MEMORY[0x270F883D0]();
}

uint64_t sub_228AAD430()
{
  return MEMORY[0x270F883D8]();
}

uint64_t sub_228AAD440()
{
  return MEMORY[0x270F883E0]();
}

uint64_t sub_228AAD450()
{
  return MEMORY[0x270F88448]();
}

uint64_t sub_228AAD460()
{
  return MEMORY[0x270F88450]();
}

uint64_t sub_228AAD470()
{
  return MEMORY[0x270F88458]();
}

uint64_t sub_228AAD480()
{
  return MEMORY[0x270F88460]();
}

uint64_t sub_228AAD490()
{
  return MEMORY[0x270F88538]();
}

uint64_t sub_228AAD4A0()
{
  return MEMORY[0x270F88548]();
}

uint64_t sub_228AAD4B0()
{
  return MEMORY[0x270F88560]();
}

uint64_t sub_228AAD4C0()
{
  return MEMORY[0x270F88570]();
}

uint64_t sub_228AAD4D0()
{
  return MEMORY[0x270F886C0]();
}

uint64_t sub_228AAD4E0()
{
  return MEMORY[0x270F886C8]();
}

uint64_t sub_228AAD4F0()
{
  return MEMORY[0x270F886D8]();
}

uint64_t sub_228AAD500()
{
  return MEMORY[0x270F886E8]();
}

uint64_t sub_228AAD510()
{
  return MEMORY[0x270F886F0]();
}

uint64_t sub_228AAD520()
{
  return MEMORY[0x270F88700]();
}

uint64_t sub_228AAD530()
{
  return MEMORY[0x270F88718]();
}

uint64_t sub_228AAD540()
{
  return MEMORY[0x270F88758]();
}

uint64_t sub_228AAD550()
{
  return MEMORY[0x270F887A8]();
}

uint64_t sub_228AAD560()
{
  return MEMORY[0x270F887B8]();
}

uint64_t sub_228AAD570()
{
  return MEMORY[0x270F887C0]();
}

uint64_t sub_228AAD580()
{
  return MEMORY[0x270F887C8]();
}

uint64_t sub_228AAD590()
{
  return MEMORY[0x270F88810]();
}

uint64_t sub_228AAD5A0()
{
  return MEMORY[0x270F88820]();
}

uint64_t sub_228AAD5B0()
{
  return MEMORY[0x270F88830]();
}

uint64_t sub_228AAD5C0()
{
  return MEMORY[0x270F88838]();
}

uint64_t sub_228AAD5D0()
{
  return MEMORY[0x270F88840]();
}

uint64_t sub_228AAD5E0()
{
  return MEMORY[0x270F888C8]();
}

uint64_t sub_228AAD5F0()
{
  return MEMORY[0x270F888D0]();
}

uint64_t sub_228AAD600()
{
  return MEMORY[0x270F88910]();
}

uint64_t sub_228AAD610()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_228AAD620()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_228AAD630()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_228AAD640()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t sub_228AAD650()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_228AAD660()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_228AAD670()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_228AAD680()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_228AAD690()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_228AAD6A0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_228AAD6B0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_228AAD6C0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_228AAD6D0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_228AAD6E0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_228AAD6F0()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_228AAD700()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_228AAD710()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_228AAD720()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_228AAD730()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_228AAD740()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_228AAD750()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_228AAD760()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_228AAD770()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_228AAD780()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_228AAD790()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_228AAD7A0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_228AAD7B0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_228AAD7C0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_228AAD7D0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_228AAD7E0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_228AAD7F0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_228AAD800()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_228AAD810()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_228AAD820()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_228AAD830()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_228AAD840()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_228AAD850()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_228AAD860()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_228AAD870()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_228AAD880()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_228AAD890()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_228AAD8A0()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_exception_throw(id exception)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}