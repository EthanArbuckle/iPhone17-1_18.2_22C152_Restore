@interface SessionRecorder
- (_TtC7Measure15SessionRecorder)init;
@end

@implementation SessionRecorder

- (_TtC7Measure15SessionRecorder)init
{
  result = (_TtC7Measure15SessionRecorder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000C0A18(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure15SessionRecorder_state));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Measure15SessionRecorder____lazy_storage___eventRecorder));

  sub_100028914(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure15SessionRecorder_stopCompletion));
  sub_100028914(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure15SessionRecorder_onStopped));

  swift_bridgeObjectRelease();
}

@end