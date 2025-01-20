@interface AEAAgent
- (_TtC15assessmentagent8AEAAgent)init;
- (void)dealloc;
@end

@implementation AEAAgent

- (void)dealloc
{
  v2 = self;
  sub_100020640();
}

- (void).cxx_destruct
{
  sub_100021E10((uint64_t)self + OBJC_IVAR____TtC15assessmentagent8AEAAgent_args);
  swift_unknownObjectRelease();
  swift_release();
  sub_100021E40((uint64_t)self + OBJC_IVAR____TtC15assessmentagent8AEAAgent_taskSource);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC15assessmentagent8AEAAgent)init
{
  result = (_TtC15assessmentagent8AEAAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end