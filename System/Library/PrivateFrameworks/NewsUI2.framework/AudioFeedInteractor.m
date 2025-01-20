@interface AudioFeedInteractor
- (_TtC7NewsUI219AudioFeedInteractor)init;
- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3;
@end

@implementation AudioFeedInteractor

- (_TtC7NewsUI219AudioFeedInteractor)init
{
  result = (_TtC7NewsUI219AudioFeedInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI219AudioFeedInteractor_delegate);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219AudioFeedInteractor_modifierFactory);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3
{
  uint64_t result = MEMORY[0x1E01EFB70](&a1[OBJC_IVAR____TtC7NewsUI219AudioFeedInteractor_delegate]);
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = MEMORY[0x1E01EFB70](result + 16);
    if (v7)
    {
      v8 = (void *)v7;
      id v9 = a3;
      v10 = a1;
      sub_1DF71EE44(v6, v8);

      swift_unknownObjectRelease();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

@end