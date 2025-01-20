@interface MotionValidator
- (_TtC14dockaccessoryd15MotionValidator)init;
@end

@implementation MotionValidator

- (_TtC14dockaccessoryd15MotionValidator)init
{
  result = (_TtC14dockaccessoryd15MotionValidator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd15MotionValidator_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1000BF118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__calibrationCallback));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__timedOutCallback);

  sub_1000BF118(v5);
}

@end