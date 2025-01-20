const char *sub_42A4()
{
  return "Screenshot";
}

uint64_t sub_42B0()
{
  return 0x68736E6565726353;
}

const char *sub_42CC()
{
  return "Flashlight";
}

uint64_t sub_42D8()
{
  return 0x67696C6873616C46;
}

const char *sub_42F4()
{
  return "Lock";
}

uint64_t sub_4300()
{
  return 1801678668;
}

const char *sub_4310()
{
  return "Restart";
}

uint64_t sub_431C()
{
  return 0x74726174736552;
}

uint64_t sub_4334@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC31SystemCommandsSuggestionsPlugin35SystemCommandsSuggestionsRepository_templateDirectory;
  sub_6D60();
  sub_563C();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t sub_43A0()
{
  uint64_t v0 = swift_allocObject();
  sub_6D60();
  sub_563C();
  uint64_t v1 = sub_5814();
  v2(v1);
  return v0;
}

uint64_t sub_4414()
{
  sub_6D60();
  sub_563C();
  uint64_t v1 = sub_5814();
  v2(v1);
  return v0;
}

__n128 *sub_4474()
{
  unsigned int v1 = [self hasFlashlight];
  sub_4888(&qword_C610);
  sub_6E30();
  v2 = (__n128 *)swift_allocObject();
  if (v1)
  {
    uint64_t v3 = sub_5828(v2, (__n128)xmmword_7070);
    (*(void (**)(__n128 *))(v4 + 120))(v3);
    sub_57F0();
    (*(void (**)(void))(v5 + 128))();
  }
  else
  {
    v8 = sub_5828(v2, (__n128)xmmword_7060);
    (*(void (**)(__n128 *))(v9 + 128))(v8);
  }
  sub_57F0();
  uint64_t v7 = (*(uint64_t (**)(void))(v6 + 136))();
  (*(void (**)(uint64_t))(*(void *)v0 + 144))(v7);
  return v2;
}

uint64_t sub_4654()
{
  uint64_t v0 = sub_4888(&qword_C450);
  uint64_t v1 = sub_576C(v0);
  __chkstk_darwin(v1);
  sub_56C4();
  uint64_t v2 = sub_4888(&qword_C458);
  uint64_t v3 = sub_576C(v2);
  __chkstk_darwin(v3);
  sub_564C();
  uint64_t v4 = sub_6F30();
  sub_4888(&qword_C460);
  sub_588C();
  uint64_t v5 = sub_586C((uint64_t)"flashlight.on.fill");
  sub_56FC(v5);
  uint64_t v6 = enum case for Image.symbol(_:);
  sub_6ED0();
  sub_563C();
  uint64_t v7 = sub_56AC();
  v8(v7);
  uint64_t v9 = sub_5674();
  sub_5778();
  v15[3] = v9;
  v15[4] = &protocol witness table for StaticIconUrlProvider;
  v15[0] = sub_583C();
  type metadata accessor for SystemCommandsSuggestionsInvocationActionProvider();
  uint64_t v10 = sub_57AC();
  v14[3] = v6;
  v14[4] = sub_5548(&qword_C468, v11, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsInvocationActionProvider);
  v14[0] = v10;
  sub_57C8();
  sub_53B8(v14);
  sub_53B8(v15);
  sub_4888(&qword_C470);
  sub_5790((uint64_t)sub_5448);
  sub_6E80();
  sub_5778();
  uint64_t v12 = sub_56DC();
  sub_5744(v12, (uint64_t)&protocol witness table for SimpleActionKeyMapper);
  return sub_5854(0x67696C6873616C46, 0xEA00000000007468, v4);
}

uint64_t sub_4888(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_48CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_48F4()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for SystemCommandsSuggestionsInvocationActionProvider()
{
  return self;
}

uint64_t sub_4928()
{
  uint64_t v1 = sub_4888(&qword_C450);
  uint64_t v2 = sub_576C(v1);
  __chkstk_darwin(v2);
  sub_56C4();
  uint64_t v3 = sub_4888(&qword_C458);
  uint64_t v4 = sub_576C(v3);
  __chkstk_darwin(v4);
  sub_564C();
  uint64_t v5 = sub_6F30();
  sub_4888(&qword_C460);
  sub_588C();
  *uint64_t v0 = 0x6C69662E6B636F6CLL;
  v0[1] = 0xE90000000000006CLL;
  uint64_t v6 = sub_6EC0();
  sub_56FC(v6);
  uint64_t v7 = enum case for Image.symbol(_:);
  sub_6ED0();
  sub_563C();
  uint64_t v8 = sub_56AC();
  v9(v8);
  uint64_t v10 = sub_5674();
  sub_5778();
  v16[3] = v10;
  v16[4] = &protocol witness table for StaticIconUrlProvider;
  v16[0] = sub_583C();
  type metadata accessor for SystemCommandsSuggestionsInvocationActionProvider();
  uint64_t v11 = sub_57AC();
  v15[3] = v7;
  v15[4] = sub_5548(&qword_C468, v12, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsInvocationActionProvider);
  v15[0] = v11;
  sub_57FC();
  sub_6DC0();
  sub_53B8(v15);
  sub_53B8(v16);
  sub_4888(&qword_C470);
  sub_5790((uint64_t)sub_5448);
  sub_6E80();
  sub_5778();
  uint64_t v13 = sub_56DC();
  sub_571C(v13, (uint64_t)&protocol witness table for SimpleActionKeyMapper);
  return sub_5854(1801678668, 0xE400000000000000, v5);
}

uint64_t sub_4B64()
{
  uint64_t v1 = sub_4888(&qword_C450);
  uint64_t v2 = sub_576C(v1);
  __chkstk_darwin(v2);
  sub_56C4();
  uint64_t v3 = sub_4888(&qword_C458);
  uint64_t v4 = sub_576C(v3);
  __chkstk_darwin(v4);
  sub_564C();
  uint64_t v5 = sub_6F30();
  sub_4888(&qword_C460);
  sub_588C();
  strcpy(v0, "restart.circle");
  v0[15] = -18;
  uint64_t v6 = sub_6EC0();
  sub_56FC(v6);
  uint64_t v7 = enum case for Image.symbol(_:);
  sub_6ED0();
  sub_563C();
  uint64_t v8 = sub_56AC();
  v9(v8);
  uint64_t v10 = sub_5674();
  sub_5778();
  v16[3] = v10;
  v16[4] = &protocol witness table for StaticIconUrlProvider;
  v16[0] = sub_583C();
  type metadata accessor for SystemCommandsSuggestionsInvocationActionProvider();
  uint64_t v11 = sub_57AC();
  v15[3] = v7;
  v15[4] = sub_5548(&qword_C468, v12, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsInvocationActionProvider);
  v15[0] = v11;
  sub_57FC();
  sub_6DC0();
  sub_53B8(v15);
  sub_53B8(v16);
  sub_4888(&qword_C470);
  sub_5790((uint64_t)sub_5448);
  sub_6E80();
  sub_5778();
  uint64_t v13 = sub_56DC();
  sub_571C(v13, (uint64_t)&protocol witness table for SimpleActionKeyMapper);
  return sub_5854(0x74726174736552, 0xE700000000000000, v5);
}

uint64_t sub_4DB0()
{
  uint64_t v0 = sub_4888(&qword_C450);
  uint64_t v1 = sub_576C(v0);
  __chkstk_darwin(v1);
  sub_56C4();
  uint64_t v2 = sub_4888(&qword_C458);
  uint64_t v3 = sub_576C(v2);
  __chkstk_darwin(v3);
  sub_564C();
  uint64_t v4 = sub_6F30();
  sub_4888(&qword_C460);
  sub_588C();
  uint64_t v5 = sub_586C((uint64_t)"camera.viewfinder");
  sub_56FC(v5);
  uint64_t v6 = enum case for Image.symbol(_:);
  sub_6ED0();
  sub_563C();
  uint64_t v7 = sub_56AC();
  v8(v7);
  uint64_t v9 = sub_5674();
  sub_5778();
  v15[3] = v9;
  v15[4] = &protocol witness table for StaticIconUrlProvider;
  v15[0] = sub_583C();
  type metadata accessor for SystemCommandsSuggestionsInvocationActionProvider();
  uint64_t v10 = sub_57AC();
  v14[3] = v6;
  v14[4] = sub_5548(&qword_C468, v11, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsInvocationActionProvider);
  v14[0] = v10;
  sub_57C8();
  sub_53B8(v14);
  sub_53B8(v15);
  sub_4888(&qword_C470);
  sub_5790((uint64_t)sub_5448);
  sub_6E80();
  sub_5778();
  uint64_t v12 = sub_56DC();
  sub_5744(v12, (uint64_t)&protocol witness table for SimpleActionKeyMapper);
  return sub_5854(0x68736E6565726353, 0xEA0000000000746FLL, v4);
}

uint64_t sub_4FE4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC31SystemCommandsSuggestionsPlugin35SystemCommandsSuggestionsRepository_templateDirectory;
  sub_6D60();
  sub_563C();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t sub_5040()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC31SystemCommandsSuggestionsPlugin35SystemCommandsSuggestionsRepository_templateDirectory;
  sub_6D60();
  sub_563C();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_50D8()
{
  sub_57F0();
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_5118(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_51C0;
  return InternalSuggestionsRepository.getAsyncPooledSuggestions()(a1, a2);
}

uint64_t sub_51C0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_52BC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return SuggestionsRepository.getOwner()(a1, WitnessTable);
}

uint64_t sub_5320@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_6DE0();
  uint64_t v3 = sub_6DD0();
  a1[3] = v2;
  uint64_t result = sub_5548(&qword_C478, 255, (void (*)(uint64_t))&type metadata accessor for UtteranceAction);
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t sub_53A0()
{
  return v0;
}

uint64_t sub_53A8()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_53B8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_5408()
{
  sub_57F0();
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_5448@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  *a2 = v3;
  a2[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_5468()
{
  return sub_5548(&qword_C480, 255, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsRepository);
}

uint64_t type metadata accessor for SystemCommandsSuggestionsRepository()
{
  uint64_t result = qword_CC50;
  if (!qword_CC50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_54FC()
{
  return sub_5548((unint64_t *)&unk_C488, 255, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsRepository);
}

uint64_t sub_5548(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_5590()
{
  return type metadata accessor for SystemCommandsSuggestionsRepository();
}

uint64_t sub_5598()
{
  uint64_t result = sub_6D60();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_5628()
{
}

uint64_t sub_564C()
{
  return type metadata accessor for ResolvableParameter(0);
}

uint64_t sub_5674()
{
  sub_48CC(v0, 0, 1, v1);
  return type metadata accessor for StaticIconUrlProvider(0);
}

uint64_t sub_56AC()
{
  return v0;
}

uint64_t sub_56DC()
{
  return SimpleActionKeyMapper.init(actionId:loggingParamsIdTransformer:)(0, 0, v0);
}

uint64_t sub_56FC(uint64_t a1)
{
  return sub_48CC(v1, 1, 1, a1);
}

double sub_571C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v3 - 120) = v2;
  *(void *)(v3 - 112) = a2;
  *(void *)(v3 - 144) = a1;
  *(void *)(v3 - 160) = 0;
  double result = 0.0;
  *(_OWORD *)(v3 - 192) = 0u;
  *(_OWORD *)(v3 - 176) = 0u;
  return result;
}

double sub_5744@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v3 - 136) = v2;
  *(void *)(v3 - 128) = a2;
  *(void *)(v3 - 160) = a1;
  *(void *)(v3 - 176) = 0;
  double result = 0.0;
  *(_OWORD *)(v3 - 208) = 0u;
  *(_OWORD *)(v3 - 192) = 0u;
  return result;
}

uint64_t sub_576C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_5778()
{
  return swift_allocObject();
}

uint64_t sub_5790(uint64_t a1)
{
  return Transformer.init(transform:)(a1, 0, v1);
}

uint64_t sub_57AC()
{
  return swift_allocObject();
}

uint64_t sub_57C8()
{
  return sub_6DC0();
}

uint64_t sub_5814()
{
  return v0;
}

__n128 *sub_5828(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t sub_583C()
{
  return StaticIconUrlProvider.init(icon:)(v0);
}

uint64_t sub_5854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SuggestionDetails.init(suggestionId:resolverParams:description:viewProvider:actionIdKeyMapper:filter:)(a1, a2, a3, 0, 0);
}

uint64_t sub_586C@<X0>(uint64_t a1@<X8>)
{
  *uint64_t v1 = v2;
  v1[1] = (a1 - 32) | 0x8000000000000000;
  return sub_6EC0();
}

uint64_t sub_5898()
{
  sub_6328();
  return sub_58B8(v1, v0, (uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_58B8(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_58C8()
{
  uint64_t v0 = sub_4310();
  uint64_t v2 = *(void *)v0;
  uint64_t v1 = *((void *)v0 + 1);
  uint64_t v3 = type metadata accessor for SystemCommandsSuggestionConfigurator();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_42CC();
  uint64_t v7 = *(void *)v5;
  uint64_t v6 = *((void *)v5 + 1);
  uint64_t v8 = sub_6378();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_42F4();
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *((void *)v9 + 1);
  uint64_t v12 = sub_6378();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v10;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_42A4();
  uint64_t v14 = *(void *)v13;
  uint64_t v15 = *((void *)v13 + 1);
  uint64_t v16 = sub_6378();
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v15;
  sub_4888(&qword_C620);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_7060;
  sub_6F10();
  swift_bridgeObjectRetain();
  *(void *)(inited + 32) = sub_6F00();
  sub_4888(&qword_C628);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_7200;
  *(void *)(v18 + 56) = v3;
  uint64_t v20 = sub_6068(&qword_C630, v19, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionConfigurator);
  *(void *)(v18 + 32) = v8;
  *(void *)(v18 + 96) = v3;
  *(void *)(v18 + 104) = v20;
  *(void *)(v18 + 64) = v20;
  *(void *)(v18 + 72) = v16;
  *(void *)(inited + 40) = v18;
  swift_retain();
  swift_retain();
  *(void *)(inited + 48) = sub_6EF0();
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_7200;
  *(void *)(v21 + 56) = v3;
  *(void *)(v21 + 64) = v20;
  *(void *)(v21 + 32) = v8;
  *(void *)(v21 + 96) = v3;
  *(void *)(v21 + 104) = v20;
  *(void *)(v21 + 72) = v16;
  *(void *)(inited + 56) = v21;
  swift_retain();
  swift_retain();
  *(void *)(inited + 64) = sub_6EE0();
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_7070;
  *(void *)(v22 + 56) = v3;
  *(void *)(v22 + 64) = v20;
  *(void *)(v22 + 32) = v12;
  *(void *)(v22 + 96) = v3;
  *(void *)(v22 + 104) = v20;
  *(void *)(v22 + 72) = v4;
  *(void *)(v22 + 136) = v3;
  *(void *)(v22 + 144) = v20;
  *(void *)(v22 + 112) = v8;
  *(void *)(v22 + 176) = v3;
  *(void *)(v22 + 184) = v20;
  *(void *)(v22 + 152) = v16;
  *(void *)(inited + 72) = v22;
  sub_4888(&qword_C638);
  sub_6068(&qword_C640, 255, (void (*)(uint64_t))&type metadata accessor for Signal);
  return sub_6F30();
}

uint64_t sub_5B38()
{
  sub_6394();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v1;
  *(void *)(result + 24) = v0;
  return result;
}

uint64_t type metadata accessor for SystemCommandsSuggestionConfigurator()
{
  return self;
}

uint64_t sub_5B9C()
{
  sub_6358();
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_5BDC()
{
  sub_6394();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_63A0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_6324;
  uint64_t v3 = sub_6368();
  return SignalSubscriber.getAsyncSubscriptions()(v3);
}

uint64_t sub_5C74()
{
  sub_6394();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_63A0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_6324;
  uint64_t v3 = sub_6368();
  return SignalSubscriber.getAsyncLookupSubscriptions()(v3);
}

uint64_t sub_5D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_6358();
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 + 80) + **(int **)(v6 + 80));
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = (void *)sub_63A0(v7);
  void *v8 = v9;
  v8[1] = sub_5E20;
  return v11(a1, a2, a3);
}

uint64_t sub_5E20(uint64_t a1)
{
  sub_6340();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_5EFC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_5F2C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_53A0();
}

uint64_t sub_5F34()
{
  sub_6328();
  return sub_5F4C(v0);
}

uint64_t sub_5F4C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_5F54()
{
  return 1;
}

uint64_t sub_5F5C()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_5F7C()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_5FB4(uint64_t a1, uint64_t a2)
{
  return sub_6068(qword_C650, a2, (void (*)(uint64_t))type metadata accessor for SystemCommandsGenerator);
}

uint64_t type metadata accessor for SystemCommandsGenerator()
{
  return self;
}

uint64_t sub_6020(uint64_t a1, uint64_t a2)
{
  return sub_6068(qword_C668, a2, (void (*)(uint64_t))type metadata accessor for SystemCommandsGenerator);
}

uint64_t sub_6068(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_60B0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_60E4()
{
  sub_6394();
  sub_6358();
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v0 + 96) + **(int **)(v0 + 96));
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_63A0(v1);
  void *v2 = v3;
  v2[1] = sub_61DC;
  uint64_t v4 = sub_6368();
  return v6(v4);
}

uint64_t sub_61DC()
{
  sub_6340();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_62AC()
{
  sub_6358();
  (*(void (**)(void))(v1 + 104))();
  sub_6328();
  return sub_58B8(v3, v0, v2 & 1);
}

uint64_t sub_6368()
{
  return v0;
}

uint64_t sub_6378()
{
  return swift_allocObject();
}

uint64_t sub_63A0(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_63AC()
{
  sub_4888(&qword_C7E0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_7380;
  uint64_t v1 = type metadata accessor for SystemCommandsSuggestionsOwnerDefinition();
  uint64_t inited = swift_initStaticObject();
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = sub_6BF0(&qword_C7E8, v3, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsOwnerDefinition);
  *(void *)(v0 + 32) = inited;
  return v0;
}

uint64_t type metadata accessor for SystemCommandsSuggestionsOwnerDefinition()
{
  return self;
}

uint64_t *sub_6478()
{
  if (qword_CEE0 != -1) {
    swift_once();
  }
  return &qword_CA40;
}

uint64_t sub_64C8()
{
  return sub_63AC();
}

uint64_t sub_64E0()
{
  uint64_t v1 = sub_6EB0();
  char v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return sub_58B8(v2, v0, v1);
}

uint64_t sub_6560()
{
  type metadata accessor for SystemCommandsSuggestionsOwnerDefinition();
  uint64_t result = swift_initStaticObject();
  qword_CA40 = result;
  return result;
}

uint64_t sub_658C()
{
  type metadata accessor for SystemCommandsSuggestionsOwnerDefinition();
  return swift_initStaticObject();
}

uint64_t sub_65BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for SystemCommandsGenerator();
  uint64_t v3 = sub_48F4();
  a1[3] = v2;
  uint64_t result = sub_6BF0(&qword_C7F0, 255, (void (*)(uint64_t))type metadata accessor for SystemCommandsGenerator);
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t sub_663C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for SystemCommandsSuggestionsTargetOwnerDefinition();
  uint64_t v3 = swift_allocObject();
  a1[3] = v2;
  uint64_t result = sub_6BF0(&qword_C7F8, v4, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsTargetOwnerDefinition);
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t sub_66BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_6DA0();
  swift_allocObject();
  uint64_t v3 = sub_6DB0();
  a1[3] = v2;
  uint64_t result = sub_6BF0(&qword_C800, 255, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t type metadata accessor for SystemCommandsSuggestionsTargetOwnerDefinition()
{
  return self;
}

uint64_t sub_6790()
{
  sub_6358();
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_67CC()
{
  sub_6358();
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_6808()
{
  sub_6358();
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_6844@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_4888(&qword_C808);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_6D60();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_6D50();
  uint64_t result = sub_6AF0((uint64_t)v4, 1, v5);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    uint64_t v13 = type metadata accessor for SystemCommandsSuggestionsRepository();
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    uint64_t v14 = sub_43A0();
    a1[3] = v13;
    a1[4] = sub_6BF0((unint64_t *)&unk_C810, 255, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsRepository);
    *a1 = v14;
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  return result;
}

void *sub_6A48()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_6A54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_6E60();
  uint64_t result = sub_6E50();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for NoOpSuggestionFilter;
  *a1 = result;
  return result;
}

uint64_t sub_6A94()
{
  type metadata accessor for SystemCommandsSuggestionsOwnerDefinition();
  uint64_t inited = swift_initStaticObject();
  return (*(uint64_t (**)(void))(*(void *)inited + 96))();
}

uint64_t sub_6AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_6B18(uint64_t a1, uint64_t a2)
{
  return sub_6BF0(&qword_C820, a2, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsOwnerDefinition);
}

uint64_t sub_6B60(uint64_t a1, uint64_t a2)
{
  return sub_6BF0(&qword_C828, a2, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsOwnerDefinition);
}

uint64_t sub_6BA8(uint64_t a1, uint64_t a2)
{
  return sub_6BF0(&qword_C830, a2, (void (*)(uint64_t))type metadata accessor for SystemCommandsSuggestionsTargetOwnerDefinition);
}

uint64_t sub_6BF0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_6C38()
{
  sub_6358();
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_6C74()
{
  sub_6358();
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_6CB0()
{
  sub_6358();
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_6CEC()
{
  sub_6358();
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t type metadata accessor for SystemCommandsSuggestionsOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_6D50()
{
  return URL.init(string:)();
}

uint64_t sub_6D60()
{
  return type metadata accessor for URL();
}

uint64_t sub_6DA0()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_6DB0()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_6DC0()
{
  return static ViewCallbacks.createCatViewCallback(dialogId:templateDirectory:assetsProvider:invocationActionProvider:)();
}

uint64_t sub_6DD0()
{
  return UtteranceAction.__allocating_init()();
}

uint64_t sub_6DE0()
{
  return type metadata accessor for UtteranceAction();
}

uint64_t sub_6E00()
{
  return SignalSubscriber.getConfiguratorProvider()();
}

uint64_t sub_6E30()
{
  return type metadata accessor for SuggestionDetails();
}

uint64_t sub_6E50()
{
  return static NoOpSuggestionFilter.Instance.getter();
}

uint64_t sub_6E60()
{
  return type metadata accessor for NoOpSuggestionFilter();
}

uint64_t sub_6E80()
{
  return type metadata accessor for SimpleActionKeyMapper();
}

uint64_t sub_6EB0()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)();
}

uint64_t sub_6EC0()
{
  return type metadata accessor for Color();
}

uint64_t sub_6ED0()
{
  return type metadata accessor for Image();
}

uint64_t sub_6EE0()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_6EF0()
{
  return static Signal.DeviceLocked.getter();
}

uint64_t sub_6F00()
{
  return static Signal.Fallback.getter();
}

uint64_t sub_6F10()
{
  return type metadata accessor for Signal();
}

uint64_t sub_6F20()
{
  return Wrappable.getRoot()();
}

uint64_t sub_6F30()
{
  return Dictionary.init(dictionaryLiteral:)();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}