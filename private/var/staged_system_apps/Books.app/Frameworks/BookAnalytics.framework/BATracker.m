@interface BATracker
- (BOOL)optedIn;
- (NSDate)sessionStartTime;
- (NSString)name;
- (NSString)path;
- (_TtC13BookAnalytics9BATracker)init;
- (id)chainWithName:(id)a3;
- (id)contentPrivateIDForContentID:(id)a3;
- (id)contentUserIDForContentID:(id)a3;
- (id)newSessionAssertion;
- (id)newSessionExtendingAssertion;
- (void)onSessionChangeWithBlock:(id)a3;
- (void)performAfterPrivateDataFetchedWithCompletionHandler:(id)a3;
- (void)popOrientationData;
- (void)popRawDataEventWithName:(id)a3;
- (void)popSessionListeningData;
- (void)popSessionReadingData;
- (void)pushLinkData:(id)a3 file:(id)a4 line:(int64_t)a5;
- (void)pushOrientationDataFromFile:(id)a3 line:(int64_t)a4;
- (void)pushRawDataEventWithNameData:(id)a3 :(id)a4 :(id)a5;
- (void)pushSessionEndReasonDataWithReason:(int64_t)a3 file:(id)a4 line:(int64_t)a5;
- (void)pushSessionListeningData:(id)a3 file:(id)a4 line:(int64_t)a5;
- (void)pushSessionReadingData:(id)a3 file:(id)a4 line:(int64_t)a5;
- (void)pushTabDataWithType:(int64_t)a3 file:(id)a4 line:(int64_t)a5;
- (void)submitAppSessionStartEvent;
- (void)submitRawEvent:(id)a3 :(id)a4;
- (void)submitRawEventEndTime:(id)a3 :(id)a4 :(id)a5;
- (void)submitRawEventOnlyIfTimed:(id)a3 :(id)a4 :(BOOL)a5;
- (void)timeAppSessionEndEvent;
- (void)timeRawEvent:(id)a3 :(id)a4 :(id)a5;
@end

@implementation BATracker

- (void)popOrientationData
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookAnalytics9BATracker_operationHistory);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_15A610((void **)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  swift_release();
  sub_15A6EC();
  sub_27D760();
}

- (void)popSessionListeningData
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookAnalytics9BATracker_operationHistory);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_15A740((void **)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  swift_release();
  sub_15A81C();
  sub_27D760();
}

- (void)popSessionReadingData
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookAnalytics9BATracker_operationHistory);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_15A870((void **)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  swift_release();
  sub_15A94C();
  sub_27D760();
}

- (void)pushLinkData:(id)a3 file:(id)a4 line:(int64_t)a5
{
}

- (void)pushOrientationDataFromFile:(id)a3 line:(int64_t)a4
{
  uint64_t v6 = sub_27DDB0();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  BATracker.pushOrientationData(file:line:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (void)pushSessionEndReasonDataWithReason:(int64_t)a3 file:(id)a4 line:(int64_t)a5
{
}

- (void)pushSessionListeningData:(id)a3 file:(id)a4 line:(int64_t)a5
{
}

- (void)pushSessionReadingData:(id)a3 file:(id)a4 line:(int64_t)a5
{
}

- (void)pushTabDataWithType:(int64_t)a3 file:(id)a4 line:(int64_t)a5
{
}

- (void)submitAppSessionStartEvent
{
  type metadata accessor for AppSessionStartEvent(0);
  sub_15AE18(&qword_31F040, (void (*)(uint64_t))type metadata accessor for AppSessionStartEvent);
  v3 = self;
  sub_27D7B0();
}

- (void)timeAppSessionEndEvent
{
  uint64_t v3 = sub_4E04(&qword_320080);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_27D0A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = self;
  sub_15A318((uint64_t)v5);
  sub_15AC4C((uint64_t)v5);
}

- (id)chainWithName:(id)a3
{
  sub_27DDB0();
  uint64_t v4 = self;
  id v5 = BATracker.chain(with:)();

  swift_bridgeObjectRelease();

  return v5;
}

- (void)onSessionChangeWithBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_271A40;
  *(void *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_27D750();

  swift_release();
  swift_release();

  swift_release();
}

- (_TtC13BookAnalytics9BATracker)init
{
  result = (_TtC13BookAnalytics9BATracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC13BookAnalytics9BATracker_sessionOperationDelegate;

  sub_187650((uint64_t)v3);
}

- (NSString)name
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)sub_27D720();
  sub_27D370();

  NSString v4 = sub_27DDA0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (BOOL)optedIn
{
  uint64_t v3 = self;
  NSString v4 = self;
  id v5 = [v3 sharedConnection];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned __int8 v7 = [v5 isDiagnosticSubmissionAllowed];

    LOBYTE(v5) = v7;
  }
  else
  {
    __break(1u);
  }
  return (char)v5;
}

- (NSString)path
{
  uint64_t v2 = self;
  sub_27D770();
  sub_4E04(&qword_319620);
  sub_13C89C(&qword_327648, &qword_319620);
  sub_27DD80();

  swift_bridgeObjectRelease();
  NSString v3 = sub_27DDA0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)timeRawEvent:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  BATracker.timeRawEvent(eventNameValue:propertiesValue:startTimeValue:)((JSValue)v8, (JSValue)v9, (JSValue)v10);
}

- (void)submitRawEvent:(id)a3 :(id)a4
{
  uint64_t v5 = sub_4E04(&qword_320080);
  __chkstk_darwin(v5 - 8);
  unsigned __int8 v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_27DDB0();
  unint64_t v10 = v9;
  sub_4E04(&qword_323928);
  uint64_t v11 = sub_27DD70();
  uint64_t v12 = sub_27D0A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  v13 = self;
  BATracker.submitRawEvent(_:properties:endTime:)(v8, v10, v11, (uint64_t)v7);
  sub_ADCF8((uint64_t)v7, &qword_320080);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)submitRawEventEndTime:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7 = sub_27DDB0();
  unint64_t v9 = v8;
  sub_4E04(&qword_323928);
  uint64_t v10 = sub_27DD70();
  id v11 = a5;
  uint64_t v12 = self;
  v13._countAndFlagsBits = v7;
  v13._object = v9;
  v15.value.super.isa = (Class)a5;
  BATracker.submitRawEvent(_:properties:endTimeValue:)(v13, (Swift::OpaquePointer)v10, v15);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)submitRawEventOnlyIfTimed:(id)a3 :(id)a4 :(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = sub_27DDB0();
  uint64_t v9 = v8;
  sub_4E04(&qword_323928);
  uint64_t v10 = sub_27DD70();
  id v11 = self;
  uint64_t v12 = (void *)sub_270F9C(v7, v9, v10);
  id v13 = (id)sub_27D720();
  [v13 submitRawEvent:v12 onlyIfTimed:v5];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)pushRawDataEventWithNameData:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v6 = sub_27DDB0();
  uint64_t v8 = v7;
  uint64_t v9 = sub_27DD70();
  uint64_t v10 = sub_27DEF0();
  id v11 = self;
  v12._countAndFlagsBits = v6;
  v12._object = v8;
  BATracker.pushRawDataEvent(with:data:traitValues:)(v12, (Swift::OpaquePointer)v9, (Swift::OpaquePointer)v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)popRawDataEventWithName:(id)a3
{
  sub_27DDB0();
  NSString v4 = self;
  BOOL v5 = (void *)sub_27D720();
  NSString v6 = sub_27DDA0();
  [v5 popDataEventByName:v6];

  swift_bridgeObjectRelease();
}

- (NSDate)sessionStartTime
{
  uint64_t v3 = sub_4E04(&qword_320080);
  __chkstk_darwin(v3 - 8);
  BOOL v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v6 = self;
  BATracker.sessionStartTime.getter((uint64_t)v5);

  uint64_t v7 = sub_27D0A0();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = sub_27D030().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSDate *)isa;
}

- (id)contentPrivateIDForContentID:(id)a3
{
  return sub_270A60(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))BATracker.contentPrivateID(for:));
}

- (id)contentUserIDForContentID:(id)a3
{
  return sub_270A60(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))BATracker.contentUserID(for:));
}

- (void)performAfterPrivateDataFetchedWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  NSString v6 = self;
  BATracker.performAfterPrivateDataFetched(completionHandler:)((uint64_t)sub_2719F8, v5);

  swift_release();
}

- (id)newSessionAssertion
{
  return sub_270D30(self, (uint64_t)a2, (SEL *)&selRef_newSessionAssertion);
}

- (id)newSessionExtendingAssertion
{
  return sub_270D30(self, (uint64_t)a2, (SEL *)&selRef_newSessionExtendingAssertion);
}

@end