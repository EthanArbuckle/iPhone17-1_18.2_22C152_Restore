@interface FollowingDataManager
- (_TtC7NewsUI220FollowingDataManager)init;
- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4;
- (void)dealloc;
@end

@implementation FollowingDataManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(void *)&self->subscriptionService[OBJC_IVAR____TtC7NewsUI220FollowingDataManager_sportsOnboardingManager];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_sportsOnboardingManager), *(void *)&self->notificationPrompter[OBJC_IVAR____TtC7NewsUI220FollowingDataManager_sportsOnboardingManager]);
  v5 = *(void (**)(void))(v4 + 56);
  v6 = self;
  v5();

  v7.receiver = v6;
  v7.super_class = ObjectType;
  [(FollowingDataManager *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_shortcutService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_editorialService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_tagReorderService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_followingBadgingCoordinator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_magazinesBadgingCoordinator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_puzzleBadgingCoordinator);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_sportsOnboardingManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_shortcutsOnboardingManager);

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_contentAvailabilityValidator;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (_TtC7NewsUI220FollowingDataManager)init
{
  result = (_TtC7NewsUI220FollowingDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  objc_super v7 = (char *)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_delegate;
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI220FollowingDataManager_delegate, a2))
  {
    uint64_t v8 = *((void *)v7 + 1);
    swift_getObjectType();
    v9 = *(void (**)(void))(v8 + 88);
    id v10 = a3;
    id v11 = a4;
    v12 = self;
    v9();

    swift_unknownObjectRelease();
  }
}

@end