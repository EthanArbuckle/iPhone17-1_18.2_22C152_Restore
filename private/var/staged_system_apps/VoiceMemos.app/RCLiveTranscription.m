@interface RCLiveTranscription
- (_TtC10VoiceMemos19RCLiveTranscription)init;
- (_TtC10VoiceMemos19RCLiveTranscription)initWith:(id)a3;
- (void)finalizeAndReturnTranscriptionDataWithCompletionHandler:(id)a3;
- (void)prepareToProcessWithFormat:(id)a3 audioTime:(id)a4 punchInTime:(double)a5;
- (void)processAudioBuffer:(id)a3;
- (void)refreshWithComposition:(id)a3;
@end

@implementation RCLiveTranscription

- (_TtC10VoiceMemos19RCLiveTranscription)initWith:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    id v4 = a3;
    uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = 0xF000000000000000;
  }
  v7 = (_TtC10VoiceMemos19RCLiveTranscription *)sub_1001072C0(v3, v6);
  sub_1001072AC(v3, v6);
  return v7;
}

- (void)prepareToProcessWithFormat:(id)a3 audioTime:(id)a4 punchInTime:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_100107814(v8, a5);
}

- (void)processAudioBuffer:(id)a3
{
  uint64_t v5 = sub_100028654(&qword_100267428);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos19RCLiveTranscription_liveTranscription))
  {
    v11[1] = a3;
    id v9 = a3;
    v10 = self;
    swift_retain();
    sub_100028654(&qword_1002654D0);
    AsyncStream.Continuation.yield(_:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

    swift_release();
  }
}

- (void)finalizeAndReturnTranscriptionDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100028654(&qword_1002699E0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  void v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100267420;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002666C0;
  v12[5] = v11;
  v13 = self;
  sub_100009D98((uint64_t)v7, (uint64_t)&unk_1002666C8, (uint64_t)v12);
  swift_release();
}

- (void)refreshWithComposition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100104C1C((uint64_t)v4);
}

- (_TtC10VoiceMemos19RCLiveTranscription)init
{
  result = (_TtC10VoiceMemos19RCLiveTranscription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10000C4A4((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos19RCLiveTranscription_delegate);

  swift_release();
}

@end