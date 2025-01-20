@interface AEAudiobookAnalyticsRecorder
+ (AEAudiobookAnalyticsRecorder)sharedRecorder;
- (AEAudiobookAnalyticsRecorder)init;
- (AEAudiobookAnalyticsRecorderTrackerHosting)trackerHost;
- (void)forceEndPlaySession;
- (void)networkChanged:(id)a3;
- (void)player:(id)a3 audiobookWillChange:(id)a4;
- (void)player:(id)a3 bitRateChangedFrom:(float)a4 to:(float)a5;
- (void)player:(id)a3 isScrubbing:(BOOL)a4;
- (void)player:(id)a3 playbackRateDidChange:(float)a4;
- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)routeChanged:(id)a3;
- (void)setTrackerHost:(id)a3;
- (void)skipController:(id)a3 willBeginSkippingInDirection:(unint64_t)a4;
- (void)skipControllerDidEndSkipping:(id)a3 actionSource:(unint64_t)a4;
- (void)startRecordingAnalyticsWithSessionHost:(id)a3;
@end

@implementation AEAudiobookAnalyticsRecorder

- (AEAudiobookAnalyticsRecorderTrackerHosting)trackerHost
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (AEAudiobookAnalyticsRecorderTrackerHosting *)Strong;
}

- (void)setTrackerHost:(id)a3
{
}

+ (AEAudiobookAnalyticsRecorder)sharedRecorder
{
  if (qword_22AA90 != -1) {
    swift_once();
  }
  v2 = (void *)qword_22AA98;

  return (AEAudiobookAnalyticsRecorder *)v2;
}

- (void)routeChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1119E4(v4);
}

- (void)networkChanged:(id)a3
{
  sub_11F2F4(0, &qword_22AAB8);
  *(void *)(swift_allocObject() + 16) = self;
  v5 = self;
  id v6 = a3;
  sub_1393A0();

  swift_release();
}

- (void)startRecordingAnalyticsWithSessionHost:(id)a3
{
  sub_11F2F4(0, &qword_22AAB8);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  *(void *)(v5 + 24) = a3;
  swift_unknownObjectRetain_n();
  id v6 = self;
  sub_1393A0();
  swift_unknownObjectRelease();

  swift_release();
}

- (void)forceEndPlaySession
{
  sub_11F2F4(0, &qword_22AAB8);
  *(void *)(swift_allocObject() + 16) = self;
  v3 = self;
  sub_1393A0();

  swift_release();
}

- (AEAudiobookAnalyticsRecorder)init
{
  result = (AEAudiobookAnalyticsRecorder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_11EF1C((uint64_t)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_trackerHost);
  sub_11EF1C((uint64_t)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_dataSource);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_11FBFC((uint64_t)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_playSessionStartDate, &qword_22AE18);

  v3 = (char *)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_doNotDisturbStatusAtStart;
  uint64_t v4 = sub_138F50();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_currentRoute;
  uint64_t v6 = sub_138F30();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_previousCellularAccessTechnology;
  uint64_t v8 = sub_139010();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_eventReporter);
}

- (void)skipController:(id)a3 willBeginSkippingInDirection:(unint64_t)a4
{
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_player);
  id v6 = a3;
  uint64_t v8 = self;
  [v5 positionInCurrentAudiobook];
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_skipStartMediaTime) = v7;
}

- (void)skipControllerDidEndSkipping:(id)a3 actionSource:(unint64_t)a4
{
  uint64_t v7 = sub_138EF0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    v11 = (unsigned int *)&enum case for SkipActionType.unknown(_:);
LABEL_5:
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *v11, v7);
    id v12 = a3;
    v13 = self;
    sub_11301C((uint64_t)v10);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

    return;
  }
  if (a4 == 1)
  {
    v11 = (unsigned int *)&enum case for SkipActionType.buttonTap(_:);
    goto LABEL_5;
  }
  type metadata accessor for BKAudiobookActionSource(0);
  v16[1] = a4;
  id v14 = a3;
  v15 = self;
  sub_1395C0();
  __break(1u);
}

- (void)player:(id)a3 audiobookWillChange:(id)a4
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_analyticsSessionAssertion))
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    uint64_t v5 = self;
    sub_1125B4();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  sub_11E4F0(a3, a5);
  swift_unknownObjectRelease();
}

- (void)player:(id)a3 playbackRateDidChange:(float)a4
{
  uint64_t v4 = OBJC_IVAR___AEAudiobookAnalyticsRecorder_playSessionPlaybackRate;
  if (*(float *)((char *)&self->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_playSessionPlaybackRate) != a4)
  {
    swift_unknownObjectRetain();
    uint64_t v7 = self;
    sub_114C08();
    *(float *)((char *)&self->super.isa + v4) = a4;
    swift_unknownObjectRelease();
  }
}

- (void)player:(id)a3 isScrubbing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = sub_138EF0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4)
  {
    swift_unknownObjectRetain();
    v15 = self;
    [a3 positionInCurrentAudiobook];
    *(Class *)((char *)&v15->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_skipStartMediaTime) = v11;
    swift_unknownObjectRelease();
    id v12 = v15;
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for SkipActionType.scrubbing(_:), v7);
    swift_unknownObjectRetain();
    v13 = self;
    sub_11301C((uint64_t)v10);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_unknownObjectRelease();
  }
}

- (void)player:(id)a3 bitRateChangedFrom:(float)a4 to:(float)a5
{
  sub_11F2F4(0, &qword_22AAB8);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(float *)(v8 + 24) = a5;
  *(float *)(v8 + 28) = a4;
  uint64_t v9 = self;
  swift_unknownObjectRetain();
  sub_1393A0();
  swift_unknownObjectRelease();

  swift_release();
}

@end