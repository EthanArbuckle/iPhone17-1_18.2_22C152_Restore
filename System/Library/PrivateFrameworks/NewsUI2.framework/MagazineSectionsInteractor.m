@interface MagazineSectionsInteractor
- (_TtC7NewsUI226MagazineSectionsInteractor)init;
- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3;
@end

@implementation MagazineSectionsInteractor

- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3
{
  uint64_t result = MEMORY[0x1E01EFB70](&a1[OBJC_IVAR____TtC7NewsUI226MagazineSectionsInteractor_delegate]);
  if (result)
  {
    uint64_t v6 = result;
    id v7 = a3;
    v8 = a1;
    sub_1DF694B5C(v6);

    return swift_unknownObjectRelease();
  }
  return result;
}

- (_TtC7NewsUI226MagazineSectionsInteractor)init
{
  uint64_t result = (_TtC7NewsUI226MagazineSectionsInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineSectionsInteractor_delegate);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineSectionsInteractor_magazinesBadgingCoordinator);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI226MagazineSectionsInteractor_offlineManager);
}

@end