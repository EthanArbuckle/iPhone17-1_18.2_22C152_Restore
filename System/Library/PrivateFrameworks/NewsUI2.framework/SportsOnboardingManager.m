@interface SportsOnboardingManager
- (_TtC7NewsUI223SportsOnboardingManager)init;
- (void)appleAccountChanged;
- (void)dealloc;
- (void)userInfoDidChangeSportsOnboardingState:(id)a3;
- (void)userInfoDidChangeSportsSyncState:(id)a3;
@end

@implementation SportsOnboardingManager

- (void)appleAccountChanged
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI223SportsOnboardingManager_sportsSyncManager);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  sub_1DE919914(0, (unint64_t *)&qword_1EBABAC90);
  v6 = self;
  v7 = (void *)sub_1DFDFEE60();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9 = *(void (**)(void *, void (*)(), uint64_t, uint64_t, uint64_t))(v5 + 8);
  swift_retain();
  v9(v7, sub_1DEAD49C4, v8, v4, v5);

  swift_release_n();
}

- (void)dealloc
{
  v2 = self;
  sub_1DEF95D28();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223SportsOnboardingManager_sportsSyncManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223SportsOnboardingManager_pushNotificationDataManager);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC7NewsUI223SportsOnboardingManager)init
{
  result = (_TtC7NewsUI223SportsOnboardingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)userInfoDidChangeSportsOnboardingState:(id)a3
{
}

- (void)userInfoDidChangeSportsSyncState:(id)a3
{
}

@end