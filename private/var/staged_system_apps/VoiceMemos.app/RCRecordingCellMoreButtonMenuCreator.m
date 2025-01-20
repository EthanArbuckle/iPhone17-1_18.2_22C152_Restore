@interface RCRecordingCellMoreButtonMenuCreator
- (NSString)recordingUUID;
- (_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator)init;
- (_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator)initWithRecordingUUID:(id)a3 actionDelegate:(id)a4 source:(id)a5;
- (id)createMenuWithDisplayShowTranscriptAction:(BOOL)a3 displayCopyTranscriptAction:(BOOL)a4 hasMultipleTracks:(BOOL)a5;
- (void)setRecordingUUID:(id)a3;
@end

@implementation RCRecordingCellMoreButtonMenuCreator

- (NSString)recordingUUID
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setRecordingUUID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator_recordingUUID);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator)initWithRecordingUUID:(id)a3 actionDelegate:(id)a4 source:(id)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = (_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator *)sub_100108ECC(v6, v8);
  swift_unknownObjectRelease();

  return v10;
}

- (id)createMenuWithDisplayShowTranscriptAction:(BOOL)a3 displayCopyTranscriptAction:(BOOL)a4 hasMultipleTracks:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v7 = self;
  v8.super.super.isa = sub_100109028(v6, a5).super.super.isa;

  return v8.super.super.isa;
}

- (_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator)init
{
  result = (_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator_menuCreator));

  swift_bridgeObjectRelease();
}

@end