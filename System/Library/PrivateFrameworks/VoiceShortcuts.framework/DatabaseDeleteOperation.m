@interface DatabaseDeleteOperation
- (BOOL)transitionToState:(id)a3 withReason:(id)a4;
- (_TtC14VoiceShortcuts23DatabaseDeleteOperation)init;
@end

@implementation DatabaseDeleteOperation

- (BOOL)transitionToState:(id)a3 withReason:(id)a4
{
  uint64_t v6 = sub_1C7E992D0();
  uint64_t v8 = v7;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v9 = self;
  LOBYTE(v6) = sub_1C7DA2938((uint64_t)a3, v6, v8, (char *)v9);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_TtC14VoiceShortcuts23DatabaseDeleteOperation)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14VoiceShortcuts23DatabaseDeleteOperation_descriptor));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14VoiceShortcuts23DatabaseDeleteOperation_progress));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC14VoiceShortcuts23DatabaseDeleteOperation_environment);
  swift_release();
}

@end