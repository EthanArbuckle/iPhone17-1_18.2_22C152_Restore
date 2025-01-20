@interface RCRecordingCardMoreButtonMenuCreator
- (_TtC10VoiceMemos36RCRecordingCardMoreButtonMenuCreator)init;
- (_TtC10VoiceMemos36RCRecordingCardMoreButtonMenuCreator)initWithRecordingUUID:(id)a3 actionDelegate:(id)a4;
- (id)createMenuWithDisplayCopyTranscriptAction:(BOOL)a3 hideTrimItem:(BOOL)a4 hasMultipleTracks:(BOOL)a5 showUndoItem:(BOOL)a6;
@end

@implementation RCRecordingCardMoreButtonMenuCreator

- (_TtC10VoiceMemos36RCRecordingCardMoreButtonMenuCreator)initWithRecordingUUID:(id)a3 actionDelegate:(id)a4
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  swift_unknownObjectRetain();
  v7 = (_TtC10VoiceMemos36RCRecordingCardMoreButtonMenuCreator *)sub_100021B6C(v4, v6);
  swift_unknownObjectRelease();
  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos36RCRecordingCardMoreButtonMenuCreator_menuCreator));
}

- (id)createMenuWithDisplayCopyTranscriptAction:(BOOL)a3 hideTrimItem:(BOOL)a4 hasMultipleTracks:(BOOL)a5 showUndoItem:(BOOL)a6
{
  v10 = self;
  v11.super.super.isa = sub_1000EAC7C(a3, a4, a5, a6).super.super.isa;

  return v11.super.super.isa;
}

- (_TtC10VoiceMemos36RCRecordingCardMoreButtonMenuCreator)init
{
  result = (_TtC10VoiceMemos36RCRecordingCardMoreButtonMenuCreator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end