@interface RCMoreActionsMenuCreator
- (NSString)recordingUUID;
- (RCControlsActionDelegate)actionDelegate;
- (UIView)source;
- (_TtC10VoiceMemos24RCMoreActionsMenuCreator)init;
- (_TtC10VoiceMemos24RCMoreActionsMenuCreator)initWithRecordingUUID:(id)a3 actionDelegate:(id)a4 source:(id)a5;
- (void)setActionDelegate:(id)a3;
- (void)setRecordingUUID:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation RCMoreActionsMenuCreator

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10003489C((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos24RCMoreActionsMenuCreator_controller);
  sub_10000C4A4((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos24RCMoreActionsMenuCreator_actionDelegate);

  swift_unknownObjectWeakDestroy();
}

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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10VoiceMemos24RCMoreActionsMenuCreator_recordingUUID);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (RCControlsActionDelegate)actionDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (RCControlsActionDelegate *)Strong;
}

- (void)setActionDelegate:(id)a3
{
}

- (UIView)source
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIView *)Strong;
}

- (void)setSource:(id)a3
{
}

- (_TtC10VoiceMemos24RCMoreActionsMenuCreator)initWithRecordingUUID:(id)a3 actionDelegate:(id)a4 source:(id)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = (_TtC10VoiceMemos24RCMoreActionsMenuCreator *)sub_10015188C(v6, v8);
  swift_unknownObjectRelease();

  return v10;
}

- (_TtC10VoiceMemos24RCMoreActionsMenuCreator)init
{
  result = (_TtC10VoiceMemos24RCMoreActionsMenuCreator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end