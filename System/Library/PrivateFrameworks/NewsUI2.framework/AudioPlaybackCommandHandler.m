@interface AudioPlaybackCommandHandler
- (_TtC7NewsUI227AudioPlaybackCommandHandler)init;
- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3;
@end

@implementation AudioPlaybackCommandHandler

- (_TtC7NewsUI227AudioPlaybackCommandHandler)init
{
  result = (_TtC7NewsUI227AudioPlaybackCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioPlaybackCommandHandler_audioPlaybackTracker);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioPlaybackCommandHandler_offlineAlertControllerFactory);
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioPlaybackCommandHandler_commandCenter);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI227AudioPlaybackCommandHandler_sceneProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3
{
  uint64_t result = MEMORY[0x1E01EFB70](&a1[OBJC_IVAR____TtC7NewsUI227AudioPlaybackCommandHandler_commandCenter]);
  if (result)
  {
    swift_getObjectType();
    id v6 = a3;
    v7 = a1;
    sub_1DFDF5550();
    sub_1DE9F523C(0, (unint64_t *)&qword_1EBACA480, MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4F80D98]);
    sub_1DFDF1AE0();

    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

@end