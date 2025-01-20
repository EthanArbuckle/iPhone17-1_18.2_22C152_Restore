@interface SDAirDropSendStateMachine.BaseRunner
- (_TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner)init;
@end

@implementation SDAirDropSendStateMachine.BaseRunner

- (_TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner)init
{
  result = (_TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_deviceStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_queue));
  v3 = (char *)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_log;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_sendRequest;
  uint64_t v6 = type metadata accessor for SFAirDropSend.Request();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v7 = (char *)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine10BaseRunner_currentTransfer;
  uint64_t v8 = type metadata accessor for SFAirDropSend.Transfer();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

@end