void sub_100003CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003D08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003D18(uint64_t a1)
{
}

void sub_100003D20(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (a3)
  {
    v5 = [a3 localizedDescription];
    NSLog(@"Getting error: %@", v5);
  }
  else
  {
    NSLog(@"Successfully run");
    id v6 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLong:", objc_msgSend(v11, "numTHKEvents"));
    v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v8 = +[SiriTHKAnalyticsPluginResult numTHKEventsKey];
    [v7 setObject:v6 forKeyedSubscript:v8];

    v5 = [v11 thkEventSummaries];
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v10 = +[SiriTHKAnalyticsPluginResult thkEventSummariesKey];
    [v9 setObject:v5 forKeyedSubscript:v10];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));
}

void *SiriInvocationAnalyticsPluginResult.numConversationsKey.unsafeMutableAddressor()
{
  return &static SiriInvocationAnalyticsPluginResult.numConversationsKey;
}

unint64_t static SiriInvocationAnalyticsPluginResult.numConversationsKey.getter()
{
  return sub_100004F14(26);
}

void *SiriInvocationAnalyticsPluginResult.numVTEventsKey.unsafeMutableAddressor()
{
  return &static SiriInvocationAnalyticsPluginResult.numVTEventsKey;
}

unint64_t static SiriInvocationAnalyticsPluginResult.numVTEventsKey.getter()
{
  return sub_100004F14(31);
}

const char *SiriInvocationAnalyticsPluginResult.bookmarkNameKey.unsafeMutableAddressor()
{
  return "bookmarkName";
}

uint64_t static SiriInvocationAnalyticsPluginResult.bookmarkNameKey.getter()
{
  return sub_100004EC4();
}

void *SiriInvocationAnalyticsPluginResult.conversationIdsKey.unsafeMutableAddressor()
{
  return &static SiriInvocationAnalyticsPluginResult.conversationIdsKey;
}

uint64_t static SiriInvocationAnalyticsPluginResult.conversationIdsKey.getter()
{
  return sub_100004EA0();
}

const char *SiriInvocationAnalyticsPluginResult.vtEventIdsKey.unsafeMutableAddressor()
{
  return "vtEventIds";
}

uint64_t static SiriInvocationAnalyticsPluginResult.vtEventIdsKey.getter()
{
  return sub_100004EE4();
}

void *SiriInvocationAnalyticsPluginResult.vtEventSummariesKey.unsafeMutableAddressor()
{
  return &static SiriInvocationAnalyticsPluginResult.vtEventSummariesKey;
}

unint64_t static SiriInvocationAnalyticsPluginResult.vtEventSummariesKey.getter()
{
  return sub_100004F14(16);
}

id sub_100004088(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  NSString v3 = sub_100009290();
  swift_bridgeObjectRelease();
  return v3;
}

const char *SiriInvocationAnalyticsPluginResult.bookmarkSavedKey.unsafeMutableAddressor()
{
  return "bookmarkSaved";
}

uint64_t static SiriInvocationAnalyticsPluginResult.bookmarkSavedKey.getter()
{
  return sub_100004E7C();
}

uint64_t SiriInvocationAnalyticsPluginResult.numFeaturizedConversations.getter()
{
  sub_100004E50(OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedConversations, v2);
  return *(void *)v0;
}

uint64_t sub_1000041C8(uint64_t a1)
{
  uint64_t result = sub_100004E2C(OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedConversations, v4);
  void *v1 = a1;
  return result;
}

uint64_t sub_100004200@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x88))();
  *a2 = result;
  return result;
}

uint64_t sub_10000425C(uint64_t *a1)
{
  return sub_1000041C8(*a1);
}

uint64_t SiriInvocationAnalyticsPluginResult.numFeaturizedVoiceTriggerEvents.getter()
{
  sub_100004E50(OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedVoiceTriggerEvents, v2);
  return *(void *)v0;
}

uint64_t sub_100004304(uint64_t a1)
{
  uint64_t result = sub_100004E2C(OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedVoiceTriggerEvents, v4);
  void *v1 = a1;
  return result;
}

uint64_t sub_10000433C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xA0))();
  *a2 = result;
  return result;
}

uint64_t sub_100004398(uint64_t *a1)
{
  return sub_100004304(*a1);
}

uint64_t SiriInvocationAnalyticsPluginResult.bookmarkName.getter()
{
  sub_100004E50(OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_bookmarkName, v3);
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000044C0(uint64_t a1, uint64_t a2)
{
  sub_100004E2C(OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_bookmarkName, v6);
  *uint64_t v2 = a1;
  v2[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000450C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xB8))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_100004568(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1000044C0(v1, v2);
}

uint64_t SiriInvocationAnalyticsPluginResult.conversationIds.getter()
{
  return sub_1000048A4(&OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_conversationIds);
}

uint64_t sub_100004628(uint64_t a1)
{
  return sub_100004968(a1, &OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_conversationIds);
}

uint64_t sub_100004634@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xD0))();
  *a2 = result;
  return result;
}

uint64_t sub_100004690()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_100004628(v0);
}

Class sub_1000046D4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  v3.super.isa = sub_1000092D0().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

uint64_t SiriInvocationAnalyticsPluginResult.vtEventIds.getter()
{
  return sub_1000048A4(&OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_vtEventIds);
}

uint64_t sub_100004794(uint64_t a1)
{
  return sub_100004968(a1, &OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_vtEventIds);
}

uint64_t sub_1000047A0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xE8))();
  *a2 = result;
  return result;
}

uint64_t sub_1000047FC()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_100004794(v0);
}

uint64_t SiriInvocationAnalyticsPluginResult.vtEventSummaries.getter()
{
  return sub_1000048A4(&OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_vtEventSummaries);
}

uint64_t sub_1000048A4(uint64_t *a1)
{
  sub_100004E50(*a1, v2);
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000495C(uint64_t a1)
{
  return sub_100004968(a1, &OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_vtEventSummaries);
}

uint64_t sub_100004968(uint64_t a1, uint64_t *a2)
{
  sub_100004E2C(*a2, v5);
  *uint64_t v2 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000049A4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x100))();
  *a2 = result;
  return result;
}

uint64_t sub_100004A08()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_10000495C(v0);
}

uint64_t SiriInvocationAnalyticsPluginResult.bookmarkSaved.getter()
{
  sub_100004E50(OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_bookmarkSaved, v2);
  return *v0;
}

uint64_t sub_100004AB8(char a1)
{
  uint64_t result = sub_100004E2C(OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_bookmarkSaved, v4);
  unsigned char *v1 = a1;
  return result;
}

uint64_t sub_100004AF0@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x118))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_100004B58(char *a1)
{
  return sub_100004AB8(*a1);
}

id SiriInvocationAnalyticsPluginResult.__allocating_init(numFeaturizedConversations:numFeaturizedVoiceTriggerEvents:bookmarkName:conversationIds:vtEventIds:vtEventSummaries:bookmarkSaved:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  id v17 = objc_allocWithZone(v8);
  return SiriInvocationAnalyticsPluginResult.init(numFeaturizedConversations:numFeaturizedVoiceTriggerEvents:bookmarkName:conversationIds:vtEventIds:vtEventSummaries:bookmarkSaved:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

id SiriInvocationAnalyticsPluginResult.init(numFeaturizedConversations:numFeaturizedVoiceTriggerEvents:bookmarkName:conversationIds:vtEventIds:vtEventSummaries:bookmarkSaved:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)&v8[OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedConversations] = a1;
  *(void *)&v8[OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedVoiceTriggerEvents] = a2;
  v9 = &v8[OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_bookmarkName];
  void *v9 = a3;
  v9[1] = a4;
  *(void *)&v8[OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_conversationIds] = a5;
  *(void *)&v8[OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_vtEventIds] = a6;
  *(void *)&v8[OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_vtEventSummaries] = a7;
  v8[OBJC_IVAR____TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult_bookmarkSaved] = a8;
  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for SiriInvocationAnalyticsPluginResult();
  return objc_msgSendSuper2(&v11, "init");
}

uint64_t type metadata accessor for SiriInvocationAnalyticsPluginResult()
{
  return self;
}

id SiriInvocationAnalyticsUtils.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void SiriInvocationAnalyticsPluginResult.init()()
{
}

id SiriInvocationAnalyticsPluginResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInvocationAnalyticsPluginResult();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100004DD4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_100004E18()
{
}

uint64_t sub_100004E2C@<X0>(uint64_t a1@<X8>, uint64_t a2, ...)
{
  va_start(va, a2);
  return _swift_beginAccess(v2 + a1, va, 1, 0);
}

uint64_t sub_100004E50@<X0>(uint64_t a1@<X8>, uint64_t a2, ...)
{
  va_start(va, a2);
  return _swift_beginAccess(v2 + a1, va, 0, 0);
}

id sub_100004E74(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return sub_100004088(a1, a2, a3);
}

uint64_t sub_100004E7C()
{
  return 0x6B72616D6B6F6F62;
}

uint64_t sub_100004EA0()
{
  return 0x61737265766E6F63;
}

uint64_t sub_100004EC4()
{
  return 0x6B72616D6B6F6F62;
}

uint64_t sub_100004EE4()
{
  return 0x49746E6576457476;
}

uint64_t sub_100004F00()
{
  return v0;
}

unint64_t sub_100004F14(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

const char *SiriTHKAnalyticsPluginResult.numTHKEventsKey.unsafeMutableAddressor()
{
  return "numTHKEvents";
}

uint64_t static SiriTHKAnalyticsPluginResult.numTHKEventsKey.getter()
{
  return sub_100005464();
}

void *SiriTHKAnalyticsPluginResult.thkEventSummariesKey.unsafeMutableAddressor()
{
  return &static SiriTHKAnalyticsPluginResult.thkEventSummariesKey;
}

unint64_t static SiriTHKAnalyticsPluginResult.thkEventSummariesKey.getter()
{
  return 0xD000000000000011;
}

uint64_t SiriTHKAnalyticsPluginResult.numTHKEvents.getter()
{
  sub_100004E50(OBJC_IVAR____TtC17THKOnDemandPlugin28SiriTHKAnalyticsPluginResult_numTHKEvents, v2);
  return *(void *)v0;
}

uint64_t sub_10000507C(uint64_t a1)
{
  uint64_t result = sub_100004E2C(OBJC_IVAR____TtC17THKOnDemandPlugin28SiriTHKAnalyticsPluginResult_numTHKEvents, v4);
  void *v1 = a1;
  return result;
}

uint64_t sub_1000050B4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x60))();
  *a2 = result;
  return result;
}

uint64_t sub_100005110(uint64_t *a1)
{
  return sub_10000507C(*a1);
}

uint64_t SiriTHKAnalyticsPluginResult.thkEventSummaries.getter()
{
  sub_100004E50(OBJC_IVAR____TtC17THKOnDemandPlugin28SiriTHKAnalyticsPluginResult_thkEventSummaries, v1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_100005264(uint64_t a1)
{
  sub_100004E2C(OBJC_IVAR____TtC17THKOnDemandPlugin28SiriTHKAnalyticsPluginResult_thkEventSummaries, v4);
  void *v1 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000052A4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x78))();
  *a2 = result;
  return result;
}

uint64_t sub_100005300()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_100005264(v0);
}

id SiriTHKAnalyticsPluginResult.__allocating_init(numTHKEvents:thkEventSummaries:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return SiriTHKAnalyticsPluginResult.init(numTHKEvents:thkEventSummaries:)(a1, a2);
}

id SiriTHKAnalyticsPluginResult.init(numTHKEvents:thkEventSummaries:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC17THKOnDemandPlugin28SiriTHKAnalyticsPluginResult_numTHKEvents] = a1;
  *(void *)&v2[OBJC_IVAR____TtC17THKOnDemandPlugin28SiriTHKAnalyticsPluginResult_thkEventSummaries] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for SiriTHKAnalyticsPluginResult();
  return objc_msgSendSuper2(&v4, "init");
}

uint64_t type metadata accessor for SiriTHKAnalyticsPluginResult()
{
  return self;
}

void SiriTHKAnalyticsPluginResult.init()()
{
}

id SiriTHKAnalyticsPluginResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriTHKAnalyticsPluginResult();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005464()
{
  return 0x76454B48546D756ELL;
}

id SiriInvocationAnalyticsUtils.__allocating_init(trialClient:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SiriInvocationAnalyticsUtils.init(trialClient:)(a1);
}

id SiriInvocationAnalyticsUtils.init(trialClient:)(void *a1)
{
  if (a1)
  {
    id v3 = *(void (**)(void *))(**(void **)sub_100009210() + 152);
    swift_retain();
    v3(a1);
    swift_release();
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for SiriInvocationAnalyticsUtils();
  id v4 = objc_msgSendSuper2(&v6, "init");

  return v4;
}

uint64_t type metadata accessor for SiriInvocationAnalyticsUtils()
{
  return self;
}

uint64_t sub_1000055B0()
{
  uint64_t v0 = *(void *)sub_1000091D0();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1000055E4()
{
  return 1;
}

uint64_t sub_1000055EC()
{
  return 0;
}

uint64_t SiriInvocationAnalyticsUtils.gradeSiriMisses(turnType:streamsBookmarkName:syncBookmarkWrite:includeIdsInOutput:)()
{
  sub_1000074C4();
  *(unsigned char *)(v0 + 129) = v1;
  *(unsigned char *)(v0 + 128) = v2;
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  *(void *)(v0 + 32) = v5;
  *(void *)(v0 + 40) = v6;
  uint64_t v7 = sub_100009260();
  *(void *)(v0 + 64) = v7;
  *(void *)(v0 + 72) = *(void *)(v7 - 8);
  *(void *)(v0 + 80) = swift_task_alloc();
  *(void *)(v0 + 88) = swift_task_alloc();
  return _swift_task_switch(sub_1000056CC, 0, 0);
}

uint64_t sub_1000056CC()
{
  uint64_t v42 = v0;
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v4 = sub_100009220();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v5(v1, v4, v3);
  uint64_t v6 = sub_100009250();
  os_log_type_t v7 = sub_100009350();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v34 = *(void *)(v0 + 64);
    uint64_t v35 = *(void *)(v0 + 88);
    int v9 = *(unsigned __int8 *)(v0 + 128);
    v36 = v5;
    v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = v4;
    uint64_t v41 = swift_slowAlloc();
    uint64_t v11 = v41;
    *(_DWORD *)v10 = 136315138;
    if (v9) {
      uint64_t v12 = 7562585;
    }
    else {
      uint64_t v12 = 28494;
    }
    if (v9) {
      unint64_t v13 = 0xE300000000000000;
    }
    else {
      unint64_t v13 = 0xE200000000000000;
    }
    *(void *)(v0 + 24) = sub_1000066E4(v12, v13, &v41);
    sub_100009360();
    uint64_t v5 = v36;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Running sync bookmark writing: %s", v10, 0xCu);
    swift_arrayDestroy();
    uint64_t v14 = v11;
    uint64_t v4 = v39;
    sub_1000074D0(v14);
    sub_1000074D0((uint64_t)v10);

    v15 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v15(v35, v34);
  }
  else
  {
    uint64_t v16 = *(void *)(v0 + 88);
    uint64_t v17 = *(void *)(v0 + 64);
    uint64_t v18 = *(void *)(v0 + 72);

    v15 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v15(v16, v17);
  }
  v5(*(void *)(v0 + 80), v4, *(void *)(v0 + 64));
  v19 = sub_100009250();
  os_log_type_t v20 = sub_100009350();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v22 = *(void *)(v0 + 80);
  uint64_t v23 = *(void *)(v0 + 64);
  if (v21)
  {
    v40 = v15;
    int v24 = *(unsigned __int8 *)(v0 + 129);
    uint64_t v37 = *(void *)(v0 + 80);
    v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v41 = v26;
    *(_DWORD *)v25 = 136315138;
    if (v24) {
      uint64_t v27 = 7562585;
    }
    else {
      uint64_t v27 = 28494;
    }
    if (v24) {
      unint64_t v28 = 0xE300000000000000;
    }
    else {
      unint64_t v28 = 0xE200000000000000;
    }
    *(void *)(v0 + 16) = sub_1000066E4(v27, v28, &v41);
    sub_100009360();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Include Ids in output: %s", v25, 0xCu);
    swift_arrayDestroy();
    sub_1000074D0(v26);
    sub_1000074D0((uint64_t)v25);

    v40(v37, v23);
  }
  else
  {

    v15(v22, v23);
  }
  sub_100009240();
  sub_100009230();
  objc_allocWithZone((Class)sub_1000091E0());
  swift_bridgeObjectRetain();
  v29 = (void *)sub_1000091C0();
  *(void *)(v0 + 96) = v29;
  v38 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)((swift_isaMask & *v29) + 0x138)
                                                 + **(int **)((swift_isaMask & *v29) + 0x138));
  v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v30;
  void *v30 = v0;
  v30[1] = sub_100005B50;
  uint64_t v31 = *(unsigned __int8 *)(v0 + 129);
  uint64_t v32 = *(unsigned __int8 *)(v0 + 128);
  return v38(v32, v31);
}

uint64_t sub_100005B50(uint64_t a1)
{
  sub_10000749C();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  sub_1000074B4();
  void *v7 = v6;
  *(void *)(v5 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v8 = sub_100005CC4;
  }
  else
  {
    *(void *)(v5 + 120) = a1;
    uint64_t v8 = sub_100005C4C;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_100005C4C()
{
  sub_1000074C4();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 120);
  return v1(v2);
}

uint64_t sub_100005CC4()
{
  sub_1000074C4();

  swift_task_dealloc();
  swift_task_dealloc();
  sub_1000074E8();
  return v1();
}

uint64_t sub_100005DE4(int a1, uint64_t a2, int a3, int a4, void *aBlock, void *a6)
{
  v6[2] = a6;
  v6[3] = _Block_copy(aBlock);
  sub_1000092A0();
  v6[4] = v9;
  if (a2)
  {
    sub_1000092A0();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v6[5] = v11;
  id v12 = a6;
  unint64_t v13 = (void *)swift_task_alloc();
  v6[6] = v13;
  *unint64_t v13 = v6;
  v13[1] = sub_100005F00;
  return SiriInvocationAnalyticsUtils.gradeSiriMisses(turnType:streamsBookmarkName:syncBookmarkWrite:includeIdsInOutput:)();
}

uint64_t sub_100005F00(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  sub_1000074B4();
  void *v8 = v7;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (***)(void, void, void))(v5 + 24);
  swift_bridgeObjectRelease();
  if (v3)
  {
    uint64_t v10 = (void *)sub_100009150();
    swift_errorRelease();
    ((void (**)(void, void, void *))v9)[2](v9, 0, v10);

    _Block_release(v9);
  }
  else
  {
    ((void (**)(void, void *, void))v9)[2](v9, a1, 0);
    _Block_release(v9);
  }
  uint64_t v11 = *(uint64_t (**)(void))(v7 + 8);
  return v11();
}

uint64_t sub_1000060CC(uint64_t a1, uint64_t a2)
{
  sub_100004DD4(&qword_1000110F0);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100009340();
  sub_100007080((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_100011100;
  v8[5] = v7;
  sub_1000063DC((uint64_t)v5, (uint64_t)&unk_100011110, (uint64_t)v8);
  return swift_release();
}

void SiriInvocationAnalyticsUtils.init()()
{
}

id SiriInvocationAnalyticsUtils.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInvocationAnalyticsUtils();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100006244(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100007498;
  return v6();
}

uint64_t sub_100006310(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_100007498;
  return v7();
}

uint64_t sub_1000063DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100009340();
  if (sub_100007274(a1, 1, v6) == 1)
  {
    sub_10000729C(a1);
  }
  else
  {
    sub_100009330();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100009320();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100006544(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100006620;
  return v6(a1);
}

uint64_t sub_100006620()
{
  sub_1000074C4();
  sub_10000749C();
  uint64_t v1 = *v0;
  sub_1000074B4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1000074E8();
  return v3();
}

uint64_t sub_1000066E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000067B8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007438((uint64_t)v12, *a3);
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
      sub_100007438((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000073E8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000067B8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100006910((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100009370();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_1000069E8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1000093A0();
    if (!v8)
    {
      uint64_t result = sub_1000093B0();
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

void *sub_100006910(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000093C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_1000069E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100006A80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006C5C(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006C5C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100006A80(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_1000092B0();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_100006BF4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100009390();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_1000093C0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_1000093B0();
  __break(1u);
  return result;
}

void *sub_100006BF4(uint64_t a1, uint64_t a2)
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
  sub_100004DD4(&qword_100011128);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100006C5C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100004DD4(&qword_100011128);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  id v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100006E0C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100006D34(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100006D34(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000093C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100006E0C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1000093C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_100006E9C()
{
  _Block_release(*(const void **)(v0 + 40));
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100006EEC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 33);
  unint64_t v6 = *(void **)(v0 + 40);
  char v5 = *(void **)(v0 + 48);
  uint64_t v7 = swift_task_alloc();
  int64_t v8 = (void *)sub_1000074F4(v7);
  void *v8 = v9;
  v8[1] = sub_100006FC0;
  uint64_t v10 = (uint64_t (*)(int, uint64_t, int, int, void *, void *))((char *)&dword_1000110E0 + dword_1000110E0);
  return v10(v1, v2, v3, v4, v6, v5);
}

uint64_t sub_100006FC0()
{
  sub_1000074C4();
  sub_10000749C();
  uint64_t v1 = *v0;
  sub_1000074B4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1000074E8();
  return v3();
}

uint64_t sub_100007080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1000070AC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  int v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_1000074F4(v4);
  void *v5 = v6;
  v5[1] = sub_100007498;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000110F8 + dword_1000110F8);
  return v7(v1, v2, v3);
}

uint64_t sub_10000716C()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000071AC(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_1000074F4(v6);
  void *v7 = v8;
  v7[1] = sub_100007498;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100011108 + dword_100011108);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_100007274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000729C(uint64_t a1)
{
  uint64_t v2 = sub_100004DD4(&qword_1000110F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000072FC()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007334(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_1000074F4(v4);
  void *v5 = v6;
  v5[1] = sub_100006FC0;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100011118 + dword_100011118);
  return v7(a1, v3);
}

uint64_t sub_1000073E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007438(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000074D0(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_1000074E8()
{
  return v0 + 8;
}

uint64_t sub_1000074F4(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_10000754C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC17THKOnDemandPlugin12THKTaskEvent_id);
  swift_bridgeObjectRetain();
  return v1;
}

double sub_1000075AC()
{
  return *(double *)(v0 + OBJC_IVAR____TtC17THKOnDemandPlugin12THKTaskEvent_timeIntervalSinceReferenceDate);
}

id THKTaskEvent.__allocating_init(id:timeIntervalSinceReferenceDate:)(uint64_t a1, uint64_t a2, double a3)
{
  id v7 = objc_allocWithZone(v3);
  return THKTaskEvent.init(id:timeIntervalSinceReferenceDate:)(a1, a2, a3);
}

id THKTaskEvent.init(id:timeIntervalSinceReferenceDate:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = &v3[OBJC_IVAR____TtC17THKOnDemandPlugin12THKTaskEvent_id];
  *(void *)uint64_t v4 = a1;
  *((void *)v4 + 1) = a2;
  *(double *)&v3[OBJC_IVAR____TtC17THKOnDemandPlugin12THKTaskEvent_timeIntervalSinceReferenceDate] = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for THKTaskEvent();
  return objc_msgSendSuper2(&v6, "init");
}

uint64_t type metadata accessor for THKTaskEvent()
{
  return self;
}

uint64_t static THKTaskEvent.fromDictionary(dictionary:)()
{
  sub_100009110();
  swift_allocObject();
  sub_100009100();
  uint64_t v0 = self;
  Class isa = sub_100009270().super.isa;
  id v11 = 0;
  id v2 = [v0 dataWithJSONObject:isa options:0 error:&v11];

  id v3 = v11;
  if (!v2)
  {
    id v8 = v11;
    swift_release();
    sub_100009160();

    swift_willThrow();
    swift_errorRelease();
    return 0;
  }
  type metadata accessor for THKTaskEvent();
  id v4 = v3;
  uint64_t v5 = sub_100009180();
  unint64_t v7 = v6;

  sub_1000082A0(&qword_100011140);
  sub_1000090F0();
  swift_release();
  sub_1000081E8(v5, v7);
  id v9 = v11;
  uint64_t result = swift_dynamicCastClass();
  if (!result)
  {

    return 0;
  }
  return result;
}

Swift::OpaquePointer_optional __swiftcall THKTaskEvent.asDictionary()()
{
  (*(void (**)(void *__return_ptr))((swift_isaMask & *v0) + 0x70))(v4);
  if (v4[3])
  {
    sub_100004DD4(&qword_100011070);
    if (swift_dynamicCast()) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  else
  {
    sub_100008240((uint64_t)v4);
    id v2 = 0;
  }
  result.value._rawValue = v2;
  result.is_nil = v1;
  return result;
}

uint64_t THKTaskEvent.asJson()@<X0>(_OWORD *a1@<X8>)
{
  sub_100009140();
  swift_allocObject();
  sub_100009130();
  type metadata accessor for THKTaskEvent();
  sub_1000082A0(&qword_100011150);
  uint64_t v2 = sub_100009120();
  unint64_t v4 = v3;
  swift_release();
  uint64_t v5 = self;
  Class isa = sub_100009170().super.isa;
  id v11 = 0;
  id v7 = [v5 JSONObjectWithData:isa options:4 error:&v11];

  id v8 = v11;
  if (v7)
  {
    sub_100009380();
    sub_1000081E8(v2, v4);
    return swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v10 = v8;
    sub_100009160();

    swift_willThrow();
    sub_1000081E8(v2, v4);
    uint64_t result = swift_errorRelease();
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t THKTaskEvent.getTimestamp()()
{
  return Date.init(timeIntervalSinceReferenceDate:)(*(double *)(v0
                                                              + OBJC_IVAR____TtC17THKOnDemandPlugin12THKTaskEvent_timeIntervalSinceReferenceDate));
}

void THKTaskEvent.init()()
{
}

BOOL sub_100007B00(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100007B10(uint64_t a1, char a2)
{
}

uint64_t sub_100007B38(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_100009410() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x800000010000AFB0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100009410();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

Swift::Int sub_100007C10(char a1)
{
  return sub_100009440();
}

uint64_t sub_100007C58(char a1)
{
  if (a1) {
    return 0xD00000000000001ELL;
  }
  else {
    return 25705;
  }
}

BOOL sub_100007C88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100007B00(*a1, *a2);
}

Swift::Int sub_100007C94()
{
  return sub_100007C10(*v0);
}

void sub_100007C9C(uint64_t a1)
{
  sub_100007B10(a1, *v1);
}

Swift::Int sub_100007CA4()
{
  Swift::UInt v1 = *v0;
  sub_100009420();
  sub_100009430(v1);
  return sub_100009440();
}

uint64_t sub_100007CE8()
{
  return sub_100007C58(*v0);
}

uint64_t sub_100007CF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100007B38(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100007D18()
{
  return 0;
}

void sub_100007D24(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100007D30(uint64_t a1)
{
  unint64_t v2 = sub_100008324();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007D6C(uint64_t a1)
{
  unint64_t v2 = sub_100008324();
  return CodingKey.debugDescription.getter(a1, v2);
}

id THKTaskEvent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for THKTaskEvent();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t THKTaskEvent.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100004DD4(&qword_100011158);
  sub_100008614();
  uint64_t v5 = v4;
  __chkstk_darwin();
  id v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000082E0(a1, a1[3]);
  sub_100008324();
  sub_100009460();
  v9[15] = 0;
  sub_1000093F0();
  if (!v1)
  {
    v9[14] = 1;
    sub_100009400();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v3);
}

id THKTaskEvent.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return THKTaskEvent.init(from:)(a1);
}

id THKTaskEvent.init(from:)(void *a1)
{
  sub_100004DD4(&qword_100011160);
  sub_100008614();
  __chkstk_darwin();
  uint64_t v4 = sub_1000082E0(a1, a1[3]);
  sub_100008324();
  uint64_t v5 = v1;
  id v6 = v4;
  sub_100009450();
  if (v2)
  {
    sub_1000073E8((uint64_t)a1);

    type metadata accessor for THKTaskEvent();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_100008648();
    uint64_t v7 = sub_1000093D0();
    id v9 = (uint64_t *)&v5[OBJC_IVAR____TtC17THKOnDemandPlugin12THKTaskEvent_id];
    uint64_t *v9 = v7;
    v9[1] = v10;
    char v16 = 1;
    sub_100008648();
    sub_1000093E0();
    *(void *)&v5[OBJC_IVAR____TtC17THKOnDemandPlugin12THKTaskEvent_timeIntervalSinceReferenceDate] = v11;

    uint64_t v12 = (objc_class *)type metadata accessor for THKTaskEvent();
    v15.receiver = v5;
    v15.super_class = v12;
    id v6 = objc_msgSendSuper2(&v15, "init");
    uint64_t v13 = sub_100008630();
    v14(v13);
    sub_1000073E8((uint64_t)a1);
  }
  return v6;
}

uint64_t sub_100008158@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 136))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008194()
{
  return (*(uint64_t (**)(void))((swift_isaMask & **v0) + 0x80))();
}

uint64_t sub_1000081E8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100008240(uint64_t a1)
{
  uint64_t v2 = sub_100004DD4(&qword_100011148);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000082A0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for THKTaskEvent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_1000082E0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100008324()
{
  unint64_t result = qword_1000111F0;
  if (!qword_1000111F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000111F0);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for THKTaskEvent.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for THKTaskEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for THKTaskEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000084D4);
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

uint64_t sub_1000084FC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008508(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for THKTaskEvent.CodingKeys()
{
  return &type metadata for THKTaskEvent.CodingKeys;
}

unint64_t sub_100008528()
{
  unint64_t result = qword_100011400[0];
  if (!qword_100011400[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100011400);
  }
  return result;
}

unint64_t sub_100008578()
{
  unint64_t result = qword_100011510;
  if (!qword_100011510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011510);
  }
  return result;
}

unint64_t sub_1000085C8()
{
  unint64_t result = qword_100011518[0];
  if (!qword_100011518[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100011518);
  }
  return result;
}

uint64_t sub_100008630()
{
  return v0;
}

uint64_t sub_100008648()
{
  return v0 - 65;
}

id THKOnDemandUtils.__allocating_init(trialClient:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return THKOnDemandUtils.init(trialClient:)(a1);
}

id THKOnDemandUtils.init(trialClient:)(void *a1)
{
  if (a1)
  {
    id v3 = *(void (**)(void *))(**(void **)sub_100009210() + 152);
    swift_retain();
    v3(a1);
    swift_release();
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for THKOnDemandUtils();
  id v4 = objc_msgSendSuper2(&v6, "init");

  return v4;
}

uint64_t type metadata accessor for THKOnDemandUtils()
{
  return self;
}

uint64_t THKOnDemandUtils.runThkAnalytics(turnType:thkTaskEvents:isThkEventsOrdered:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 72) = a4;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 16) = a1;
  return _swift_task_switch(sub_1000087B0, 0, 0);
}

uint64_t sub_1000087B0()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    sub_100009200();
    uint64_t v3 = v1 + 32;
    swift_bridgeObjectRetain();
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_1000091F0();
      swift_bridgeObjectRelease();
      if (v4)
      {
        sub_1000092C0();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100009300();
        }
        sub_100009310();
        sub_1000092F0();
      }
      v3 += 8;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  sub_100009240();
  sub_100009230();
  id v5 = objc_allocWithZone((Class)sub_1000091B0());
  objc_super v6 = (void *)sub_1000091A0();
  v0[5] = v6;
  id v9 = (uint64_t (*)(void))(*(void *)((swift_isaMask & *v6) + 0x118) + **(int **)((swift_isaMask & *v6) + 0x118));
  BOOL v7 = (void *)swift_task_alloc();
  v0[6] = v7;
  void *v7 = v0;
  v7[1] = sub_1000089EC;
  return v9();
}

uint64_t sub_1000089EC(uint64_t a1)
{
  sub_10000749C();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  sub_1000074B4();
  void *v7 = v6;
  *(void *)(v5 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v8 = sub_100008B4C;
  }
  else
  {
    *(void *)(v5 + 64) = a1;
    id v8 = sub_100008AE8;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_100008AE8()
{
  sub_1000074C4();

  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  return v1(v2);
}

uint64_t sub_100008B4C()
{
  sub_1000074C4();

  sub_1000074E8();
  return v1();
}

uint64_t sub_100008C48(int a1, int a2, char a3, void *aBlock, void *a5)
{
  v5[2] = a5;
  v5[3] = _Block_copy(aBlock);
  uint64_t v8 = sub_1000092A0();
  uint64_t v10 = v9;
  v5[4] = v9;
  sub_100004DD4(&qword_100011070);
  uint64_t v11 = sub_1000092E0();
  v5[5] = v11;
  id v12 = a5;
  uint64_t v13 = (void *)swift_task_alloc();
  v5[6] = v13;
  *uint64_t v13 = v5;
  v13[1] = sub_100008D50;
  return THKOnDemandUtils.runThkAnalytics(turnType:thkTaskEvents:isThkEventsOrdered:)(v8, v10, v11, a3);
}

uint64_t sub_100008D50(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  sub_1000074B4();
  void *v8 = v7;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    uint64_t v10 = (void *)sub_100009150();
    swift_errorRelease();
    ((void (**)(void, void, void *))v9)[2](v9, 0, v10);

    _Block_release(v9);
  }
  else
  {
    ((void (**)(void, void *, void))v9)[2](v9, a1, 0);
    _Block_release(v9);
  }
  uint64_t v11 = *(uint64_t (**)(void))(v7 + 8);
  return v11();
}

void THKOnDemandUtils.init()()
{
}

id THKOnDemandUtils.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for THKOnDemandUtils();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100008F9C()
{
  _Block_release(*(const void **)(v0 + 40));
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100008FEC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(unsigned char *)(v0 + 32);
  uint64_t v5 = *(void **)(v0 + 40);
  uint64_t v4 = *(void **)(v0 + 48);
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_1000074F4(v6);
  void *v7 = v8;
  v7[1] = sub_100006FC0;
  uint64_t v9 = (uint64_t (*)(int, int, char, void *, void *))((char *)&dword_1000111C0 + dword_1000111C0);
  return v9(v1, v2, v3, v5, v4);
}

uint64_t sub_1000090B8()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000090F0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_100009100()
{
  return JSONDecoder.init()();
}

uint64_t sub_100009110()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_100009120()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_100009130()
{
  return JSONEncoder.init()();
}

uint64_t sub_100009140()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_100009150()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100009160()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_100009170()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100009180()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000091A0()
{
  return SiriTHKAnalytics.init(thkTaskEvents:isThkEventsOrdered:conversationTurnType:)();
}

uint64_t sub_1000091B0()
{
  return type metadata accessor for SiriTHKAnalytics();
}

uint64_t sub_1000091C0()
{
  return SiriMissRateAnalytics.init(streamsBookmarkName:conversationTurnType:)();
}

uint64_t sub_1000091D0()
{
  return SiriMissRateAnalytics.DEFAULT_BOOKMARK_NAME.unsafeMutableAddressor();
}

uint64_t sub_1000091E0()
{
  return type metadata accessor for SiriMissRateAnalytics();
}

uint64_t sub_1000091F0()
{
  return static THKTaskEvent.fromDictionary(dictionary:)();
}

uint64_t sub_100009200()
{
  return type metadata accessor for THKTaskEvent();
}

uint64_t sub_100009210()
{
  return TrialProvider.shared.unsafeMutableAddressor();
}

uint64_t sub_100009220()
{
  return defaultLogger.unsafeMutableAddressor();
}

uint64_t sub_100009230()
{
  return static ConversationUtils.stringToConversationTurnType(typeString:)();
}

uint64_t sub_100009240()
{
  return type metadata accessor for ConversationUtils();
}

uint64_t sub_100009250()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009260()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100009270()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100009280()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100009290()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000092A0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_1000092B0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000092C0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000092D0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000092E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000092F0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100009300()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100009310()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100009320()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100009330()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100009340()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100009350()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100009360()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009370()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009380()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100009390()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000093A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000093B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000093C0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000093D0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000093E0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000093F0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100009400()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100009410()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009420()
{
  return Hasher.init(_seed:)();
}

void sub_100009430(Swift::UInt a1)
{
}

Swift::Int sub_100009440()
{
  return Hasher._finalize()();
}

uint64_t sub_100009450()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100009460()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_BOOLValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValueForKey:defaultValue:");
}

id objc_msgSend_initWithJSONResult_unprivatizedVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJSONResult:unprivatizedVector:");
}

id objc_msgSend_initWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLong:");
}

id objc_msgSend_initWithTrialClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTrialClient:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_numTHKEvents(void *a1, const char *a2, ...)
{
  return _[a1 numTHKEvents];
}

id objc_msgSend_numTHKEventsKey(void *a1, const char *a2, ...)
{
  return _[a1 numTHKEventsKey];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_runThkAnalyticsWithTurnType_thkTaskEvents_isThkEventsOrdered_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runThkAnalyticsWithTurnType:thkTaskEvents:isThkEventsOrdered:completionHandler:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_stringValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValueForKey:defaultValue:");
}

id objc_msgSend_thkEventSummaries(void *a1, const char *a2, ...)
{
  return _[a1 thkEventSummaries];
}

id objc_msgSend_thkEventSummariesKey(void *a1, const char *a2, ...)
{
  return _[a1 thkEventSummariesKey];
}