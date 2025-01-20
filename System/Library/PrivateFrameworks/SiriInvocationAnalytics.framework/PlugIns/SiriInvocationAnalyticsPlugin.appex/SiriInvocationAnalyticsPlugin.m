void sub_100002A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002A90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002AA0(uint64_t a1)
{
}

void sub_100002AA8(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  if (a3)
  {
    v5 = [a3 localizedDescription];
    NSLog(@"Getting error: %@", v5);
  }
  else
  {
    NSLog(@"Successfully run");
    id v6 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLong:", objc_msgSend(v26, "numFeaturizedConversations"));
    v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v8 = +[SiriInvocationAnalyticsPluginResult numConversationsKey];
    [v7 setObject:v6 forKeyedSubscript:v8];

    id v9 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLong:", objc_msgSend(v26, "numFeaturizedVoiceTriggerEvents"));
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v11 = +[SiriInvocationAnalyticsPluginResult numVTEventsKey];
    [v10 setObject:v9 forKeyedSubscript:v11];

    v12 = [v26 bookmarkName];
    v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v14 = +[SiriInvocationAnalyticsPluginResult bookmarkNameKey];
    [v13 setObject:v12 forKeyedSubscript:v14];

    id v15 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithBool:", objc_msgSend(v26, "bookmarkSaved"));
    v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v17 = +[SiriInvocationAnalyticsPluginResult bookmarkSavedKey];
    [v16 setObject:v15 forKeyedSubscript:v17];

    v18 = [v26 conversationIds];
    v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v20 = +[SiriInvocationAnalyticsPluginResult conversationIdsKey];
    [v19 setObject:v18 forKeyedSubscript:v20];

    v21 = [v26 vtEventIds];
    v22 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v23 = +[SiriInvocationAnalyticsPluginResult vtEventIdsKey];
    [v22 setObject:v21 forKeyedSubscript:v23];

    v5 = [v26 vtEventSummaries];
    v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v25 = +[SiriInvocationAnalyticsPluginResult vtEventSummariesKey];
    [v24 setObject:v5 forKeyedSubscript:v25];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));
}

void sub_1000030C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000030E4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if (a3)
  {
    id v5 = [a3 localizedDescription];
    NSLog(@"Getting error: %@", v5);
  }
  else
  {
    NSLog(@"Successfully run");
    id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLong:", objc_msgSend(v8, "numFeaturizedVoiceTriggerEvents"));
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = +[SiriInvocationAnalyticsPluginResult numVTEventsKey];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));
}

void *SiriInvocationAnalyticsPluginResult.numConversationsKey.unsafeMutableAddressor()
{
  return &static SiriInvocationAnalyticsPluginResult.numConversationsKey;
}

unint64_t static SiriInvocationAnalyticsPluginResult.numConversationsKey.getter()
{
  return sub_10000428C(26);
}

void *SiriInvocationAnalyticsPluginResult.numVTEventsKey.unsafeMutableAddressor()
{
  return &static SiriInvocationAnalyticsPluginResult.numVTEventsKey;
}

unint64_t static SiriInvocationAnalyticsPluginResult.numVTEventsKey.getter()
{
  return sub_10000428C(31);
}

const char *SiriInvocationAnalyticsPluginResult.bookmarkNameKey.unsafeMutableAddressor()
{
  return "bookmarkName";
}

uint64_t static SiriInvocationAnalyticsPluginResult.bookmarkNameKey.getter()
{
  return sub_10000423C();
}

void *SiriInvocationAnalyticsPluginResult.conversationIdsKey.unsafeMutableAddressor()
{
  return &static SiriInvocationAnalyticsPluginResult.conversationIdsKey;
}

uint64_t static SiriInvocationAnalyticsPluginResult.conversationIdsKey.getter()
{
  return sub_100004218();
}

const char *SiriInvocationAnalyticsPluginResult.vtEventIdsKey.unsafeMutableAddressor()
{
  return "vtEventIds";
}

uint64_t static SiriInvocationAnalyticsPluginResult.vtEventIdsKey.getter()
{
  return sub_10000425C();
}

void *SiriInvocationAnalyticsPluginResult.vtEventSummariesKey.unsafeMutableAddressor()
{
  return &static SiriInvocationAnalyticsPluginResult.vtEventSummariesKey;
}

unint64_t static SiriInvocationAnalyticsPluginResult.vtEventSummariesKey.getter()
{
  return sub_10000428C(16);
}

id sub_100003400(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  NSString v3 = sub_1000085D0();
  swift_bridgeObjectRelease();
  return v3;
}

const char *SiriInvocationAnalyticsPluginResult.bookmarkSavedKey.unsafeMutableAddressor()
{
  return "bookmarkSaved";
}

uint64_t static SiriInvocationAnalyticsPluginResult.bookmarkSavedKey.getter()
{
  return sub_1000041F4();
}

uint64_t SiriInvocationAnalyticsPluginResult.numFeaturizedConversations.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedConversations, v2);
  return *(void *)v0;
}

uint64_t sub_100003540(uint64_t a1)
{
  uint64_t result = sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedConversations, v4);
  void *v1 = a1;
  return result;
}

uint64_t sub_100003578@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x88))();
  *a2 = result;
  return result;
}

uint64_t sub_1000035D4(uint64_t *a1)
{
  return sub_100003540(*a1);
}

uint64_t SiriInvocationAnalyticsPluginResult.numFeaturizedVoiceTriggerEvents.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedVoiceTriggerEvents, v2);
  return *(void *)v0;
}

uint64_t sub_10000367C(uint64_t a1)
{
  uint64_t result = sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedVoiceTriggerEvents, v4);
  void *v1 = a1;
  return result;
}

uint64_t sub_1000036B4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xA0))();
  *a2 = result;
  return result;
}

uint64_t sub_100003710(uint64_t *a1)
{
  return sub_10000367C(*a1);
}

uint64_t SiriInvocationAnalyticsPluginResult.bookmarkName.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_bookmarkName, v3);
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100003838(uint64_t a1, uint64_t a2)
{
  sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_bookmarkName, v6);
  *uint64_t v2 = a1;
  v2[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100003884@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xB8))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1000038E0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_100003838(v1, v2);
}

uint64_t SiriInvocationAnalyticsPluginResult.conversationIds.getter()
{
  return sub_100003C1C(&OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_conversationIds);
}

uint64_t sub_1000039A0(uint64_t a1)
{
  return sub_100003CE0(a1, &OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_conversationIds);
}

uint64_t sub_1000039AC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xD0))();
  *a2 = result;
  return result;
}

uint64_t sub_100003A08()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_1000039A0(v0);
}

Class sub_100003A4C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  v3.super.isa = sub_100008600().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

uint64_t SiriInvocationAnalyticsPluginResult.vtEventIds.getter()
{
  return sub_100003C1C(&OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_vtEventIds);
}

uint64_t sub_100003B0C(uint64_t a1)
{
  return sub_100003CE0(a1, &OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_vtEventIds);
}

uint64_t sub_100003B18@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xE8))();
  *a2 = result;
  return result;
}

uint64_t sub_100003B74()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_100003B0C(v0);
}

uint64_t SiriInvocationAnalyticsPluginResult.vtEventSummaries.getter()
{
  return sub_100003C1C(&OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_vtEventSummaries);
}

uint64_t sub_100003C1C(uint64_t *a1)
{
  sub_1000041C8(*a1, v2);
  return swift_bridgeObjectRetain();
}

uint64_t sub_100003CD4(uint64_t a1)
{
  return sub_100003CE0(a1, &OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_vtEventSummaries);
}

uint64_t sub_100003CE0(uint64_t a1, uint64_t *a2)
{
  sub_1000041A4(*a2, v5);
  *uint64_t v2 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100003D1C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x100))();
  *a2 = result;
  return result;
}

uint64_t sub_100003D80()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_100003CD4(v0);
}

uint64_t SiriInvocationAnalyticsPluginResult.bookmarkSaved.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_bookmarkSaved, v2);
  return *v0;
}

uint64_t sub_100003E30(char a1)
{
  uint64_t result = sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_bookmarkSaved, v4);
  unsigned char *v1 = a1;
  return result;
}

uint64_t sub_100003E68@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x118))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_100003ED0(char *a1)
{
  return sub_100003E30(*a1);
}

id SiriInvocationAnalyticsPluginResult.__allocating_init(numFeaturizedConversations:numFeaturizedVoiceTriggerEvents:bookmarkName:conversationIds:vtEventIds:vtEventSummaries:bookmarkSaved:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  id v17 = objc_allocWithZone(v8);
  return SiriInvocationAnalyticsPluginResult.init(numFeaturizedConversations:numFeaturizedVoiceTriggerEvents:bookmarkName:conversationIds:vtEventIds:vtEventSummaries:bookmarkSaved:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

id SiriInvocationAnalyticsPluginResult.init(numFeaturizedConversations:numFeaturizedVoiceTriggerEvents:bookmarkName:conversationIds:vtEventIds:vtEventSummaries:bookmarkSaved:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedConversations] = a1;
  *(void *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_numFeaturizedVoiceTriggerEvents] = a2;
  id v9 = &v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_bookmarkName];
  *id v9 = a3;
  v9[1] = a4;
  *(void *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_conversationIds] = a5;
  *(void *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_vtEventIds] = a6;
  *(void *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_vtEventSummaries] = a7;
  v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult_bookmarkSaved] = a8;
  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for SiriInvocationAnalyticsPluginResult();
  return objc_msgSendSuper2(&v11, "init");
}

uint64_t type metadata accessor for SiriInvocationAnalyticsPluginResult()
{
  return self;
}

id SiriInvocationAnalyticsPluginResult.__allocating_init()()
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

uint64_t sub_10000414C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_100004190()
{
}

uint64_t sub_1000041A4@<X0>(uint64_t a1@<X8>, uint64_t a2, ...)
{
  va_start(va, a2);
  return _swift_beginAccess(v2 + a1, va, 1, 0);
}

uint64_t sub_1000041C8@<X0>(uint64_t a1@<X8>, uint64_t a2, ...)
{
  va_start(va, a2);
  return _swift_beginAccess(v2 + a1, va, 0, 0);
}

id sub_1000041EC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return sub_100003400(a1, a2, a3);
}

uint64_t sub_1000041F4()
{
  return 0x6B72616D6B6F6F62;
}

uint64_t sub_100004218()
{
  return 0x61737265766E6F63;
}

uint64_t sub_10000423C()
{
  return 0x6B72616D6B6F6F62;
}

uint64_t sub_10000425C()
{
  return 0x49746E6576457476;
}

uint64_t sub_100004278()
{
  return v0;
}

unint64_t sub_10000428C(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

void *UserEngagementStatsAnalyticsPluginResult.dailyAggregatedStats.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin40UserEngagementStatsAnalyticsPluginResult_dailyAggregatedStats, v4);
  id v1 = *v0;
  id v2 = v1;
  return v1;
}

void UserEngagementStatsAnalyticsPluginResult.dailyAggregatedStats.setter(void *a1)
{
  sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin40UserEngagementStatsAnalyticsPluginResult_dailyAggregatedStats, v4);
  uint64_t v3 = *v1;
  void *v1 = a1;
}

uint64_t (*UserEngagementStatsAnalyticsPluginResult.dailyAggregatedStats.modify())()
{
  return j__swift_endAccess;
}

uint64_t UserEngagementStatsAnalyticsPluginResult.accumulatedAggregationStats.getter()
{
  return sub_100003C1C(&OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin40UserEngagementStatsAnalyticsPluginResult_accumulatedAggregationStats);
}

uint64_t UserEngagementStatsAnalyticsPluginResult.accumulatedAggregationStats.setter(uint64_t a1)
{
  return sub_100003CE0(a1, &OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin40UserEngagementStatsAnalyticsPluginResult_accumulatedAggregationStats);
}

uint64_t (*UserEngagementStatsAnalyticsPluginResult.accumulatedAggregationStats.modify())()
{
  return j_j__swift_endAccess;
}

id UserEngagementStatsAnalyticsPluginResult.__allocating_init(dailyAggregatedStats:accumulatedAggregationStats:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return UserEngagementStatsAnalyticsPluginResult.init(dailyAggregatedStats:accumulatedAggregationStats:)(a1);
}

id UserEngagementStatsAnalyticsPluginResult.init(dailyAggregatedStats:accumulatedAggregationStats:)(void *a1)
{
  swift_bridgeObjectRelease();
  id v3 = (void **)&v1[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin40UserEngagementStatsAnalyticsPluginResult_dailyAggregatedStats];
  *id v3 = 0;
  sub_100005EF4((uint64_t)v3, (uint64_t)v9);
  uint64_t v4 = *v3;
  *id v3 = 0;
  uint64_t v5 = v1;

  *(void *)&v5[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin40UserEngagementStatsAnalyticsPluginResult_accumulatedAggregationStats] = &_swiftEmptyArrayStorage;
  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for UserEngagementStatsAnalyticsPluginResult();
  id v6 = objc_msgSendSuper2(&v8, "init");

  return v6;
}

uint64_t type metadata accessor for UserEngagementStatsAnalyticsPluginResult()
{
  return self;
}

void UserEngagementStatsAnalyticsPluginResult.init()()
{
}

id UserEngagementStatsAnalyticsPluginResult.__deallocating_deinit()
{
  return sub_100005E30(type metadata accessor for UserEngagementStatsAnalyticsPluginResult);
}

unint64_t TriggeredMechanism.init(rawValue:)(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

BOOL sub_10000466C(uint64_t *a1, uint64_t *a2)
{
  return sub_100004678(*a1, *a2);
}

BOOL sub_100004678(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Int sub_100004684()
{
  return sub_10000468C(*v0);
}

Swift::Int sub_10000468C(Swift::UInt a1)
{
  return sub_1000086F0();
}

void sub_1000046D4(uint64_t a1)
{
  sub_1000046DC(a1, *v1);
}

void sub_1000046DC(uint64_t a1, Swift::UInt a2)
{
}

Swift::Int sub_100004704(uint64_t a1)
{
  return sub_10000470C(a1, *v1);
}

Swift::Int sub_10000470C(uint64_t a1, Swift::UInt a2)
{
  return sub_1000086F0();
}

unint64_t sub_100004750@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = TriggeredMechanism.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_100004784(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t AggregatedStats.triggeredMechanism.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_triggeredMechanism, v2);
  return *(void *)v0;
}

uint64_t AggregatedStats.triggeredMechanism.setter(uint64_t a1)
{
  uint64_t result = sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_triggeredMechanism, v4);
  void *v1 = a1;
  return result;
}

uint64_t (*AggregatedStats.triggeredMechanism.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AggregatedStats.requestCount.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_requestCount, v2);
  return *(void *)v0;
}

uint64_t AggregatedStats.requestCount.setter(uint64_t a1)
{
  uint64_t result = sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_requestCount, v4);
  void *v1 = a1;
  return result;
}

uint64_t (*AggregatedStats.requestCount.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AggregatedStats.intendedRequestCount.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_intendedRequestCount, v2);
  return *(void *)v0;
}

uint64_t AggregatedStats.intendedRequestCount.setter(uint64_t a1)
{
  uint64_t result = sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_intendedRequestCount, v4);
  void *v1 = a1;
  return result;
}

uint64_t (*AggregatedStats.intendedRequestCount.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AggregatedStats.unintendedRequestCount.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_unintendedRequestCount, v2);
  return *(void *)v0;
}

uint64_t AggregatedStats.unintendedRequestCount.setter(uint64_t a1)
{
  uint64_t result = sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_unintendedRequestCount, v4);
  void *v1 = a1;
  return result;
}

uint64_t (*AggregatedStats.unintendedRequestCount.modify())()
{
  return j_j__swift_endAccess;
}

double AggregatedStats.intendedRequestRatio.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_intendedRequestRatio, v2);
  return *(double *)v0;
}

uint64_t AggregatedStats.intendedRequestRatio.setter(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_intendedRequestRatio);
  uint64_t result = sub_100005EF4(v1 + OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_intendedRequestRatio, (uint64_t)v5);
  *id v3 = a1;
  return result;
}

uint64_t (*AggregatedStats.intendedRequestRatio.modify())()
{
  return j_j__swift_endAccess;
}

double AggregatedStats.triggeredMechanismRequestRatio.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_triggeredMechanismRequestRatio, v2);
  return *(double *)v0;
}

uint64_t AggregatedStats.triggeredMechanismRequestRatio.setter(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_triggeredMechanismRequestRatio);
  uint64_t result = sub_100005EF4(v1 + OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_triggeredMechanismRequestRatio, (uint64_t)v5);
  *id v3 = a1;
  return result;
}

uint64_t (*AggregatedStats.triggeredMechanismRequestRatio.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AggregatedStats.modelVersion.getter()
{
  return sub_10000580C(&OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_modelVersion);
}

uint64_t AggregatedStats.modelVersion.setter(uint64_t a1, uint64_t a2)
{
  return sub_100005870(a1, a2, &OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_modelVersion);
}

uint64_t (*AggregatedStats.modelVersion.modify())()
{
  return j_j__swift_endAccess;
}

id AggregatedStats.__allocating_init(triggerMechanism:requestCount:intendedRequestCount:unintendedRequestCount:intendedRequestRatio:triggeredMechanismRequestRatio:modelVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  id v17 = objc_allocWithZone(v8);
  return AggregatedStats.init(triggerMechanism:requestCount:intendedRequestCount:unintendedRequestCount:intendedRequestRatio:triggeredMechanismRequestRatio:modelVersion:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

id AggregatedStats.init(triggerMechanism:requestCount:intendedRequestCount:unintendedRequestCount:intendedRequestRatio:triggeredMechanismRequestRatio:modelVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  v14 = &v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_requestCount];
  *(void *)v14 = 0;
  id v15 = &v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_intendedRequestCount];
  *(void *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_intendedRequestCount] = 0;
  v16 = &v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_unintendedRequestCount];
  *(void *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_unintendedRequestCount] = 0;
  id v17 = (double *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_intendedRequestRatio];
  *(void *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_intendedRequestRatio] = 0;
  v18 = (double *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_triggeredMechanismRequestRatio];
  *(void *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_triggeredMechanismRequestRatio] = 0;
  v19 = &v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_modelVersion];
  *(void *)v19 = 0;
  *((void *)v19 + 1) = 0;
  *(void *)&v8[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin15AggregatedStats_triggeredMechanism] = a1;
  sub_100005EF4((uint64_t)v14, (uint64_t)v29);
  *(void *)v14 = a2;
  sub_100005EF4((uint64_t)v15, (uint64_t)v28);
  *(void *)id v15 = a3;
  sub_100005EF4((uint64_t)v16, (uint64_t)v27);
  *(void *)v16 = a4;
  sub_100005EF4((uint64_t)v17, (uint64_t)v26);
  double *v17 = a7;
  sub_100005EF4((uint64_t)v18, (uint64_t)v25);
  double *v18 = a8;
  sub_100005EF4((uint64_t)v19, (uint64_t)v24);
  *(void *)v19 = a5;
  *((void *)v19 + 1) = a6;
  swift_bridgeObjectRelease();
  v23.receiver = v8;
  v23.super_class = (Class)type metadata accessor for AggregatedStats();
  return objc_msgSendSuper2(&v23, "init");
}

uint64_t type metadata accessor for AggregatedStats()
{
  return self;
}

void AggregatedStats.init()()
{
}

id AggregatedStats.__deallocating_deinit()
{
  return sub_100005E30(type metadata accessor for AggregatedStats);
}

double AccumulatedAggregationStats.aggregationStartTimestamp.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_aggregationStartTimestamp, v2);
  return *(double *)v0;
}

uint64_t AccumulatedAggregationStats.aggregationStartTimestamp.setter(double a1)
{
  id v3 = (double *)(v1
                + OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_aggregationStartTimestamp);
  uint64_t result = sub_100005EF4(v1 + OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_aggregationStartTimestamp, (uint64_t)v5);
  *id v3 = a1;
  return result;
}

uint64_t (*AccumulatedAggregationStats.aggregationStartTimestamp.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AccumulatedAggregationStats.numberOfDaysAggregation.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_numberOfDaysAggregation, v2);
  return *(void *)v0;
}

uint64_t AccumulatedAggregationStats.numberOfDaysAggregation.setter(uint64_t a1)
{
  uint64_t result = sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_numberOfDaysAggregation, v4);
  void *v1 = a1;
  return result;
}

uint64_t (*AccumulatedAggregationStats.numberOfDaysAggregation.modify())()
{
  return j_j__swift_endAccess;
}

Class sub_1000052E4(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(void))
{
  a3();
  a4();
  v5.super.isa = sub_100008600().super.isa;
  swift_bridgeObjectRelease();
  return v5.super.isa;
}

uint64_t AccumulatedAggregationStats.aggregationStats.getter()
{
  return sub_100003C1C(&OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_aggregationStats);
}

void sub_100005380(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void), void (*a5)(uint64_t))
{
  a4();
  uint64_t v7 = sub_100008610();
  id v8 = a1;
  a5(v7);
}

uint64_t AccumulatedAggregationStats.aggregationStats.setter(uint64_t a1)
{
  return sub_100003CE0(a1, &OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_aggregationStats);
}

uint64_t (*AccumulatedAggregationStats.aggregationStats.modify())()
{
  return j_j__swift_endAccess;
}

id sub_10000546C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  if (v3)
  {
    NSString v4 = sub_1000085D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  return v4;
}

uint64_t AccumulatedAggregationStats.cohortType.getter()
{
  return sub_10000580C(&OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_cohortType);
}

void sub_1000054EC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  if (a3)
  {
    uint64_t v6 = sub_1000085E0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a1;
  a4(v6, v8);
}

uint64_t AccumulatedAggregationStats.cohortType.setter(uint64_t a1, uint64_t a2)
{
  return sub_100005870(a1, a2, &OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_cohortType);
}

uint64_t (*AccumulatedAggregationStats.cohortType.modify())()
{
  return j_j__swift_endAccess;
}

double AccumulatedAggregationStats.intendedRequestRatio.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_intendedRequestRatio, v2);
  return *(double *)v0;
}

uint64_t AccumulatedAggregationStats.intendedRequestRatio.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_intendedRequestRatio);
  uint64_t result = sub_100005EF4(v1 + OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_intendedRequestRatio, (uint64_t)v5);
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*AccumulatedAggregationStats.intendedRequestRatio.modify())()
{
  return j_j__swift_endAccess;
}

double AccumulatedAggregationStats.uesScore.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_uesScore, v2);
  return *(double *)v0;
}

uint64_t AccumulatedAggregationStats.uesScore.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_uesScore);
  uint64_t result = sub_100005EF4(v1 + OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_uesScore, (uint64_t)v5);
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*AccumulatedAggregationStats.uesScore.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AccumulatedAggregationStats.mitigationAssetVersion.getter()
{
  return sub_10000580C(&OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_mitigationAssetVersion);
}

uint64_t sub_10000580C(uint64_t *a1)
{
  sub_1000041C8(*a1, v4);
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t AccumulatedAggregationStats.mitigationAssetVersion.setter(uint64_t a1, uint64_t a2)
{
  return sub_100005870(a1, a2, &OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_mitigationAssetVersion);
}

uint64_t sub_100005870(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000041A4(*a3, v7);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*AccumulatedAggregationStats.mitigationAssetVersion.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of AccumulatedAggregationStats.sdsdRetryCount()
{
  return 0;
}

uint64_t AccumulatedAggregationStats.sdsdRetryCount.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_sdsdRetryCount, v2);
  return *v0;
}

uint64_t AccumulatedAggregationStats.sdsdRetryCount.setter(int a1)
{
  uint64_t result = sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_sdsdRetryCount, v4);
  _DWORD *v1 = a1;
  return result;
}

uint64_t (*AccumulatedAggregationStats.sdsdRetryCount.modify())()
{
  return j_j__swift_endAccess;
}

id AccumulatedAggregationStats.__allocating_init(aggregationStartTimestamp:numberOfDaysAggregation:aggregationStats:cohortType:intendedRequestRatio:uesScore:mitigationAssetVersion:sdsdRetryCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, double a8, double a9, double a10)
{
  id v21 = objc_allocWithZone(v10);
  return AccumulatedAggregationStats.init(aggregationStartTimestamp:numberOfDaysAggregation:aggregationStats:cohortType:intendedRequestRatio:uesScore:mitigationAssetVersion:sdsdRetryCount:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

id AccumulatedAggregationStats.init(aggregationStartTimestamp:numberOfDaysAggregation:aggregationStats:cohortType:intendedRequestRatio:uesScore:mitigationAssetVersion:sdsdRetryCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, double a8, double a9, double a10)
{
  v16 = (double *)&v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_aggregationStartTimestamp];
  double *v16 = 0.0;
  id v17 = &v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_numberOfDaysAggregation];
  *(void *)&v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_numberOfDaysAggregation] = 0;
  v18 = &v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_cohortType];
  *(void *)v18 = 0;
  *((void *)v18 + 1) = 0;
  v19 = (double *)&v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_intendedRequestRatio];
  *(void *)&v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_intendedRequestRatio] = 0;
  v20 = (double *)&v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_uesScore];
  *(void *)&v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_uesScore] = 0;
  id v21 = &v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_mitigationAssetVersion];
  *(void *)id v21 = 0;
  *((void *)v21 + 1) = 0;
  v22 = &v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_sdsdRetryCount];
  *(_DWORD *)&v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_sdsdRetryCount] = 0;
  sub_100005EF4((uint64_t)v16, (uint64_t)v37);
  double *v16 = a8;
  sub_100005EF4((uint64_t)v17, (uint64_t)v36);
  *(void *)id v17 = a1;
  *(void *)&v10[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats_aggregationStats] = a2;
  sub_100005EF4((uint64_t)v18, (uint64_t)v35);
  *(void *)v18 = a3;
  *((void *)v18 + 1) = a4;
  objc_super v23 = v10;
  swift_bridgeObjectRelease();
  sub_100005EF4((uint64_t)v19, (uint64_t)v34);
  double *v19 = a9;
  sub_100005EF4((uint64_t)v20, (uint64_t)v33);
  double *v20 = a10;
  sub_100005EF4((uint64_t)v21, (uint64_t)v32);
  *(void *)id v21 = a5;
  *((void *)v21 + 1) = a6;
  swift_bridgeObjectRelease();
  sub_100005EF4((uint64_t)v22, (uint64_t)v31);
  *(_DWORD *)v22 = a7;

  v30.receiver = v23;
  v30.super_class = (Class)type metadata accessor for AccumulatedAggregationStats();
  return objc_msgSendSuper2(&v30, "init");
}

uint64_t type metadata accessor for AccumulatedAggregationStats()
{
  return self;
}

void AccumulatedAggregationStats.init()()
{
}

id AccumulatedAggregationStats.__deallocating_deinit()
{
  return sub_100005E30(type metadata accessor for AccumulatedAggregationStats);
}

uint64_t static TriggeredMechanismUtil.TriggeredMechanismToString(triggeredMechanism:)(unint64_t a1)
{
  if (a1 < 4) {
    return *(void *)&aUnknown[8 * a1];
  }
  uint64_t result = sub_1000086C0();
  __break(1u);
  return result;
}

id TriggeredMechanismUtil.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TriggeredMechanismUtil();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for TriggeredMechanismUtil()
{
  return self;
}

id TriggeredMechanismUtil.__deallocating_deinit()
{
  return sub_100005E30(type metadata accessor for TriggeredMechanismUtil);
}

id sub_100005E30(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_100005E6C()
{
  unint64_t result = qword_100011A08;
  if (!qword_100011A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011A08);
  }
  return result;
}

ValueMetadata *type metadata accessor for TriggeredMechanism()
{
  return &type metadata for TriggeredMechanism;
}

uint64_t sub_100005ED0@<X0>(uint64_t a1@<X8>)
{
  return _swift_beginAccess(v2 + a1, v1, 33, 0);
}

uint64_t sub_100005EF4(uint64_t a1, uint64_t a2)
{
  return _swift_beginAccess(a1, a2, 1, 0);
}

double _s29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStatsC8uesScoreSdvpfi_0()
{
  return 0.0;
}

uint64_t _s29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStatsC22mitigationAssetVersionSSSgvpfi_0()
{
  return 0;
}

uint64_t _s29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStatsC012numberOfDaysF0Sivpfi_0()
{
  return 0;
}

uint64_t sub_100005F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

const char *SiriTHKAnalyticsPluginResult.numTHKEventsKey.unsafeMutableAddressor()
{
  return "numTHKEvents";
}

uint64_t static SiriTHKAnalyticsPluginResult.numTHKEventsKey.getter()
{
  return sub_10000647C();
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
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin28SiriTHKAnalyticsPluginResult_numTHKEvents, v2);
  return *(void *)v0;
}

uint64_t sub_100006094(uint64_t a1)
{
  uint64_t result = sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin28SiriTHKAnalyticsPluginResult_numTHKEvents, v4);
  void *v1 = a1;
  return result;
}

uint64_t sub_1000060CC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x60))();
  *a2 = result;
  return result;
}

uint64_t sub_100006128(uint64_t *a1)
{
  return sub_100006094(*a1);
}

uint64_t SiriTHKAnalyticsPluginResult.thkEventSummaries.getter()
{
  sub_1000041C8(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin28SiriTHKAnalyticsPluginResult_thkEventSummaries, v1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000627C(uint64_t a1)
{
  sub_1000041A4(OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin28SiriTHKAnalyticsPluginResult_thkEventSummaries, v4);
  void *v1 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000062BC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x78))();
  *a2 = result;
  return result;
}

uint64_t sub_100006318()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_10000627C(v0);
}

id SiriTHKAnalyticsPluginResult.__allocating_init(numTHKEvents:thkEventSummaries:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return SiriTHKAnalyticsPluginResult.init(numTHKEvents:thkEventSummaries:)(a1, a2);
}

id SiriTHKAnalyticsPluginResult.init(numTHKEvents:thkEventSummaries:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin28SiriTHKAnalyticsPluginResult_numTHKEvents] = a1;
  *(void *)&v2[OBJC_IVAR____TtC29SiriInvocationAnalyticsPlugin28SiriTHKAnalyticsPluginResult_thkEventSummaries] = a2;
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

uint64_t sub_10000647C()
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
    id v3 = *(void (**)(void *))(**(void **)sub_100008550() + 152);
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

uint64_t sub_1000065C8()
{
  uint64_t v0 = *(void *)sub_100008530();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1000065FC()
{
  return 1;
}

uint64_t SiriInvocationAnalyticsUtils.gradeSiriMisses(turnType:streamsBookmarkName:syncBookmarkWrite:includeIdsInOutput:)()
{
  sub_1000084D4();
  *(unsigned char *)(v0 + 129) = v1;
  *(unsigned char *)(v0 + 128) = v2;
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  *(void *)(v0 + 32) = v5;
  *(void *)(v0 + 40) = v6;
  uint64_t v7 = sub_1000085A0();
  *(void *)(v0 + 64) = v7;
  *(void *)(v0 + 72) = *(void *)(v7 - 8);
  *(void *)(v0 + 80) = swift_task_alloc();
  *(void *)(v0 + 88) = swift_task_alloc();
  return _swift_task_switch(sub_1000066DC, 0, 0);
}

uint64_t sub_1000066DC()
{
  uint64_t v42 = v0;
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v4 = sub_100008560();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v5(v1, v4, v3);
  uint64_t v6 = sub_100008590();
  os_log_type_t v7 = sub_100008650();
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
    *(void *)(v0 + 24) = sub_1000076F4(v12, v13, &v41);
    sub_100008660();
    uint64_t v5 = v36;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Running sync bookmark writing: %s", v10, 0xCu);
    swift_arrayDestroy();
    uint64_t v14 = v11;
    uint64_t v4 = v39;
    sub_1000084E0(v14);
    sub_1000084E0((uint64_t)v10);

    id v15 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v15(v35, v34);
  }
  else
  {
    uint64_t v16 = *(void *)(v0 + 88);
    uint64_t v17 = *(void *)(v0 + 64);
    uint64_t v18 = *(void *)(v0 + 72);

    id v15 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v15(v16, v17);
  }
  v5(*(void *)(v0 + 80), v4, *(void *)(v0 + 64));
  v19 = sub_100008590();
  os_log_type_t v20 = sub_100008650();
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
    *(void *)(v0 + 16) = sub_1000076F4(v27, v28, &v41);
    sub_100008660();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Include Ids in output: %s", v25, 0xCu);
    swift_arrayDestroy();
    sub_1000084E0(v26);
    sub_1000084E0((uint64_t)v25);

    v40(v37, v23);
  }
  else
  {

    v15(v22, v23);
  }
  sub_100008580();
  sub_100008570();
  objc_allocWithZone((Class)sub_100008540());
  swift_bridgeObjectRetain();
  v29 = (void *)sub_100008520();
  *(void *)(v0 + 96) = v29;
  v38 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)((swift_isaMask & *v29) + 0x138)
                                                 + **(int **)((swift_isaMask & *v29) + 0x138));
  objc_super v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v30;
  *objc_super v30 = v0;
  v30[1] = sub_100006B60;
  uint64_t v31 = *(unsigned __int8 *)(v0 + 129);
  uint64_t v32 = *(unsigned __int8 *)(v0 + 128);
  return v38(v32, v31);
}

uint64_t sub_100006B60(uint64_t a1)
{
  sub_1000084AC();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  sub_1000084C4();
  void *v7 = v6;
  *(void *)(v5 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v8 = sub_100006CD4;
  }
  else
  {
    *(void *)(v5 + 120) = a1;
    uint64_t v8 = sub_100006C5C;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_100006C5C()
{
  sub_1000084D4();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 120);
  return v1(v2);
}

uint64_t sub_100006CD4()
{
  sub_1000084D4();

  swift_task_dealloc();
  swift_task_dealloc();
  sub_1000084F8();
  return v1();
}

uint64_t sub_100006DF4(int a1, uint64_t a2, int a3, int a4, void *aBlock, void *a6)
{
  v6[2] = a6;
  v6[3] = _Block_copy(aBlock);
  sub_1000085E0();
  v6[4] = v9;
  if (a2)
  {
    sub_1000085E0();
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
  void *v13 = v6;
  v13[1] = sub_100006F10;
  return SiriInvocationAnalyticsUtils.gradeSiriMisses(turnType:streamsBookmarkName:syncBookmarkWrite:includeIdsInOutput:)();
}

uint64_t sub_100006F10(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  sub_1000084C4();
  void *v8 = v7;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (***)(void, void, void))(v5 + 24);
  swift_bridgeObjectRelease();
  if (v3)
  {
    uint64_t v10 = (void *)sub_100008510();
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

uint64_t sub_1000070DC(uint64_t a1, uint64_t a2)
{
  sub_10000414C(&qword_100011B28);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008640();
  sub_100008090((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_100011B38;
  v8[5] = v7;
  sub_1000073EC((uint64_t)v5, (uint64_t)&unk_100011B48, (uint64_t)v8);
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

uint64_t sub_100007254(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1000084A8;
  return v6();
}

uint64_t sub_100007320(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1000084A8;
  return v7();
}

uint64_t sub_1000073EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100008640();
  if (sub_100008284(a1, 1, v6) == 1)
  {
    sub_1000082AC(a1);
  }
  else
  {
    sub_100008630();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100008620();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100007554(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100007630;
  return v6(a1);
}

uint64_t sub_100007630()
{
  sub_1000084D4();
  sub_1000084AC();
  uint64_t v1 = *v0;
  sub_1000084C4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1000084F8();
  return v3();
}

uint64_t sub_1000076F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000077C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008448((uint64_t)v12, *a3);
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
      sub_100008448((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000083F8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000077C8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100007920((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100008670();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_1000079F8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_100008690();
    if (!v8)
    {
      uint64_t result = sub_1000086A0();
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

void *sub_100007920(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000086B0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_1000079F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100007A90(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007C6C(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007C6C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100007A90(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_1000085F0();
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
  unint64_t v3 = sub_100007C04(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100008680();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_1000086B0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_1000086A0();
  __break(1u);
  return result;
}

void *sub_100007C04(uint64_t a1, uint64_t a2)
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
  sub_10000414C((uint64_t *)&unk_100011B60);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100007C6C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_10000414C((uint64_t *)&unk_100011B60);
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
    sub_100007E1C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100007D44(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100007D44(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000086B0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100007E1C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1000086B0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_100007EAC()
{
  _Block_release(*(const void **)(v0 + 40));
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100007EFC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 33);
  unint64_t v6 = *(void **)(v0 + 40);
  char v5 = *(void **)(v0 + 48);
  uint64_t v7 = swift_task_alloc();
  int64_t v8 = (void *)sub_100008504(v7);
  void *v8 = v9;
  v8[1] = sub_100007FD0;
  uint64_t v10 = (uint64_t (*)(int, uint64_t, int, int, void *, void *))((char *)&dword_100011B18 + dword_100011B18);
  return v10(v1, v2, v3, v4, v6, v5);
}

uint64_t sub_100007FD0()
{
  sub_1000084D4();
  sub_1000084AC();
  uint64_t v1 = *v0;
  sub_1000084C4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1000084F8();
  return v3();
}

uint64_t sub_100008090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1000080BC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  int v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_100008504(v4);
  void *v5 = v6;
  v5[1] = sub_1000084A8;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100011B30 + dword_100011B30);
  return v7(v1, v2, v3);
}

uint64_t sub_10000817C()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000081BC(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_100008504(v6);
  void *v7 = v8;
  v7[1] = sub_1000084A8;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100011B40 + dword_100011B40);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_100008284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1000082AC(uint64_t a1)
{
  uint64_t v2 = sub_10000414C(&qword_100011B28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000830C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008344(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_100008504(v4);
  void *v5 = v6;
  v5[1] = sub_100007FD0;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100011B50 + dword_100011B50);
  return v7(a1, v3);
}

uint64_t sub_1000083F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008448(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000084E0(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_1000084F8()
{
  return v0 + 8;
}

uint64_t sub_100008504(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_100008510()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100008520()
{
  return SiriMissRateAnalytics.init(streamsBookmarkName:conversationTurnType:)();
}

uint64_t sub_100008530()
{
  return SiriMissRateAnalytics.DEFAULT_BOOKMARK_NAME.unsafeMutableAddressor();
}

uint64_t sub_100008540()
{
  return type metadata accessor for SiriMissRateAnalytics();
}

uint64_t sub_100008550()
{
  return TrialProvider.shared.unsafeMutableAddressor();
}

uint64_t sub_100008560()
{
  return defaultLogger.unsafeMutableAddressor();
}

uint64_t sub_100008570()
{
  return static ConversationUtils.stringToConversationTurnType(typeString:)();
}

uint64_t sub_100008580()
{
  return type metadata accessor for ConversationUtils();
}

uint64_t sub_100008590()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000085A0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_1000085B0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000085C0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_1000085D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000085E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_1000085F0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100008600()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100008610()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100008620()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100008630()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100008640()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100008650()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100008660()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100008670()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100008680()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100008690()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000086A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000086B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000086C0()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_1000086D0()
{
  return Hasher.init(_seed:)();
}

void sub_1000086E0(Swift::UInt a1)
{
}

Swift::Int sub_1000086F0()
{
  return Hasher._finalize()();
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

void objc_enumerationMutation(id obj)
{
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

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

id objc_msgSend_JSONResult(void *a1, const char *a2, ...)
{
  return _[a1 JSONResult];
}

id objc_msgSend_bookmarkName(void *a1, const char *a2, ...)
{
  return _[a1 bookmarkName];
}

id objc_msgSend_bookmarkNameKey(void *a1, const char *a2, ...)
{
  return _[a1 bookmarkNameKey];
}

id objc_msgSend_bookmarkSaved(void *a1, const char *a2, ...)
{
  return _[a1 bookmarkSaved];
}

id objc_msgSend_bookmarkSavedKey(void *a1, const char *a2, ...)
{
  return _[a1 bookmarkSavedKey];
}

id objc_msgSend_BOOLValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValueForKey:defaultValue:");
}

id objc_msgSend_conversationIds(void *a1, const char *a2, ...)
{
  return _[a1 conversationIds];
}

id objc_msgSend_conversationIdsKey(void *a1, const char *a2, ...)
{
  return _[a1 conversationIdsKey];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_gradeSiriMissesWithTurnType_streamsBookmarkName_syncBookmarkWrite_includeIdsInOutput_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gradeSiriMissesWithTurnType:streamsBookmarkName:syncBookmarkWrite:includeIdsInOutput:completionHandler:");
}

id objc_msgSend_initWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBool:");
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

id objc_msgSend_numConversationsKey(void *a1, const char *a2, ...)
{
  return _[a1 numConversationsKey];
}

id objc_msgSend_numFeaturizedConversations(void *a1, const char *a2, ...)
{
  return _[a1 numFeaturizedConversations];
}

id objc_msgSend_numFeaturizedVoiceTriggerEvents(void *a1, const char *a2, ...)
{
  return _[a1 numFeaturizedVoiceTriggerEvents];
}

id objc_msgSend_numVTEventsKey(void *a1, const char *a2, ...)
{
  return _[a1 numVTEventsKey];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_performTask_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTask:outError:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_stringValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValueForKey:defaultValue:");
}

id objc_msgSend_triClient(void *a1, const char *a2, ...)
{
  return _[a1 triClient];
}

id objc_msgSend_vtEventIds(void *a1, const char *a2, ...)
{
  return _[a1 vtEventIds];
}

id objc_msgSend_vtEventIdsKey(void *a1, const char *a2, ...)
{
  return _[a1 vtEventIdsKey];
}

id objc_msgSend_vtEventSummaries(void *a1, const char *a2, ...)
{
  return _[a1 vtEventSummaries];
}

id objc_msgSend_vtEventSummariesKey(void *a1, const char *a2, ...)
{
  return _[a1 vtEventSummariesKey];
}