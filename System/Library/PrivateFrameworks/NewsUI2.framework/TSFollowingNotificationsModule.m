@interface TSFollowingNotificationsModule
- (TSFollowingNotificationsModule)init;
- (id)createViewController;
@end

@implementation TSFollowingNotificationsModule

- (id)createViewController
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___TSFollowingNotificationsModule_resolver), *(void *)&self->resolver[OBJC_IVAR___TSFollowingNotificationsModule_resolver + 16]);
  type metadata accessor for FollowingNotificationsViewController();
  swift_allocObject();
  swift_unknownObjectUnownedInit();
  v3 = self;
  swift_retain();
  v4 = (void *)sub_1DFDECC90();
  id result = (id)swift_release_n();
  if (v4)
  {

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (TSFollowingNotificationsModule)init
{
  id result = (TSFollowingNotificationsModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___TSFollowingNotificationsModule_resolver);
  swift_release();
}

@end