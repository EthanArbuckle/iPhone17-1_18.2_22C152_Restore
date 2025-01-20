@interface TranscriptViewCoordinator
- (BOOL)isPerformingLiveTranscription;
- (BOOL)isProcessingOrDisplayingFileTranscriptionForUUID:(id)a3;
- (RCTimeController)timeController;
- (UIView)transcriptView;
- (_TtC10VoiceMemos25TranscriptViewCoordinator)init;
- (_TtP10VoiceMemos18TranscriptViewHost_)transcriptViewHost;
- (void)beginFileTranscriptionForRecordingUUID:(id)a3;
- (void)beginLiveTranscription:(id)a3;
- (void)clearData;
- (void)didChangeHostViewWidth:(double)a3;
- (void)didDismissTranscriptView;
- (void)didUpdateTranscriptViewData;
- (void)didUpdateTranscriptionState;
- (void)setTimeController:(id)a3;
- (void)setTranscriptView:(id)a3;
- (void)setTranscriptViewHost:(id)a3;
- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4;
- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5;
- (void)willCollapseTranscriptView;
- (void)willDisplayTranscriptView;
- (void)willExpandTranscriptView;
- (void)windowSceneDidEnterBackground;
- (void)windowSceneWillEnterForeground;
@end

@implementation TranscriptViewCoordinator

- (void)didChangeHostViewWidth:(double)a3
{
  v4 = self;
  sub_10000BEB0(a3);
}

- (UIView)transcriptView
{
  v2 = self;
  id v3 = sub_10000B664();

  return (UIView *)v3;
}

- (void)setTranscriptViewHost:(id)a3
{
  swift_unknownObjectWeakAssign();
  swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakAssign();

  swift_unknownObjectRelease();
}

- (_TtC10VoiceMemos25TranscriptViewCoordinator)init
{
  return (_TtC10VoiceMemos25TranscriptViewCoordinator *)sub_10001C1D4();
}

- (void)windowSceneWillEnterForeground
{
  v2 = self;
  sub_100034B14();
}

- (RCTimeController)timeController
{
  v2 = (void *)swift_unknownObjectRetain();

  return (RCTimeController *)v2;
}

- (void)setTimeController:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_timeController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_timeController) = (Class)a3;
  swift_unknownObjectRetain_n();
  v5 = self;
  sub_100150328(v4);

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (_TtP10VoiceMemos18TranscriptViewHost_)transcriptViewHost
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP10VoiceMemos18TranscriptViewHost_ *)Strong;
}

- (void)setTranscriptView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator____lazy_storage___transcriptView);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator____lazy_storage___transcriptView) = (Class)a3;
  id v3 = a3;
}

- (void)beginFileTranscriptionForRecordingUUID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  swift_retain();
  sub_10014A2E4(v4, v6, 1);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)beginLiveTranscription:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  swift_retain();
  sub_10014AA70(a3);

  swift_release();
}

- (void)clearData
{
  v2 = self;
  swift_retain();
  sub_10014A210();

  swift_release();
}

- (BOOL)isPerformingLiveTranscription
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_dataProvider);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  int v5 = *(unsigned __int8 *)(v2 + 48);
  return v3 == 2 && v4 == 0 && v5 == 128;
}

- (BOOL)isProcessingOrDisplayingFileTranscriptionForUUID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_dataProvider);
  uint64_t v7 = *(void *)(v6 + 32);
  uint64_t v8 = *(void *)(v6 + 40);
  LODWORD(v6) = *(unsigned __int8 *)(v6 + 48);
  if (v6 >> 5 >= 3)
  {
    char v10 = 0;
  }
  else if (v4 == v7 && v8 == v5)
  {
    char v10 = 1;
  }
  else
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_100150D70();
  swift_unknownObjectRelease();
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5
{
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_100150D70();
  swift_unknownObjectRelease();
}

- (void)didUpdateTranscriptViewData
{
  uint64_t v2 = self;
  sub_100018828();
}

- (void)didUpdateTranscriptionState
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_dataProvider);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  unsigned __int8 v5 = *(unsigned char *)(v2 + 48);
  uint64_t v6 = self;
  swift_retain();
  sub_10014C918(v3, v4, v5);
  sub_1000FECAC(v3, v4, v5);
  sub_10014C940(v3, v4, v5);

  swift_release();
}

- (void)windowSceneDidEnterBackground
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_isWindowSceneInForeground) = 0;
}

- (void)willDisplayTranscriptView
{
  uint64_t v2 = self;
  sub_1001508B8();
}

- (void)didDismissTranscriptView
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_isDisplayingTranscriptView) = 0;
}

- (void)willExpandTranscriptView
{
  uint64_t v2 = self;
  sub_100150994();
}

- (void)willCollapseTranscriptView
{
  uint64_t v2 = self;
  sub_100150B0C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_10000C4A4((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_transcriptViewHost);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator____lazy_storage___transcriptView));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_configurationMediator));
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_transcriptViewPresenter;

  sub_10002F48C((uint64_t)v3);
}

@end