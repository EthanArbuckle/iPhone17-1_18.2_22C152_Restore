@interface SiriSetupCoordinator
- (_TtC9SiriSetup20SiriSetupCoordinator)init;
@end

@implementation SiriSetupCoordinator

- (_TtC9SiriSetup20SiriSetupCoordinator)init
{
  result = (_TtC9SiriSetup20SiriSetupCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_delegate);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end