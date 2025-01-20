@interface DatabaseSendOperation
- (BOOL)transitionToState:(id)a3 withReason:(id)a4;
- (_TtC14VoiceShortcuts21DatabaseSendOperation)init;
@end

@implementation DatabaseSendOperation

- (BOOL)transitionToState:(id)a3 withReason:(id)a4
{
  uint64_t v6 = sub_1C7E992D0();
  uint64_t v8 = v7;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v9 = self;
  LOBYTE(v6) = sub_1C7DD0B80((uint64_t)a3, v6, v8, (char *)v9);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_TtC14VoiceShortcuts21DatabaseSendOperation)init
{
}

- (void).cxx_destruct
{
  sub_1C7D95208((uint64_t)self + OBJC_IVAR____TtC14VoiceShortcuts21DatabaseSendOperation_object);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC14VoiceShortcuts21DatabaseSendOperation_environment);
  swift_release();
}

@end