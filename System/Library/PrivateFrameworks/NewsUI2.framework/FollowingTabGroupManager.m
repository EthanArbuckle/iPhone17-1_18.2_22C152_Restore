@interface FollowingTabGroupManager
- (_TtC7NewsUI224FollowingTabGroupManager)init;
@end

@implementation FollowingTabGroupManager

- (_TtC7NewsUI224FollowingTabGroupManager)init
{
  result = (_TtC7NewsUI224FollowingTabGroupManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI224FollowingTabGroupManager_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224FollowingTabGroupManager_shortcutService);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI224FollowingTabGroupManager_subscriptionController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224FollowingTabGroupManager_offlineProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224FollowingTabGroupManager_contentAvailabilityValidator);

  swift_bridgeObjectRelease();
}

@end