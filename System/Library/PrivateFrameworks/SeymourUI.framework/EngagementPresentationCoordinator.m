@interface EngagementPresentationCoordinator
- (BOOL)allowsModalMessageDisplay;
- (_TtC9SeymourUI33EngagementPresentationCoordinator)init;
- (id)contextPropertyWithName:(id)a3;
- (id)viewControllerForModalPresentation;
@end

@implementation EngagementPresentationCoordinator

- (BOOL)allowsModalMessageDisplay
{
  v2 = self;
  char v3 = EngagementPresentationCoordinator.allowsModalMessageDisplay.getter();

  return v3 & 1;
}

- (id)contextPropertyWithName:(id)a3
{
  sub_23A7FF988();
  v4 = self;
  EngagementPresentationCoordinator.contextProperty(withName:)(&v13);

  swift_bridgeObjectRelease();
  uint64_t v5 = v14;
  if (v14)
  {
    v6 = __swift_project_boxed_opaque_existential_1(&v13, v14);
    uint64_t v7 = *(void *)(v5 - 8);
    __n128 v8 = MEMORY[0x270FA5388](v6);
    v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v7 + 16))(v10, v8);
    v11 = (void *)sub_23A800F98();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)viewControllerForModalPresentation
{
  v2 = self;
  EngagementPresentationCoordinator.viewControllerForModalPresentation()(v3);
  uint64_t v5 = v4;

  return v5;
}

- (_TtC9SeymourUI33EngagementPresentationCoordinator)init
{
  result = (_TtC9SeymourUI33EngagementPresentationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33EngagementPresentationCoordinator_engagementClient);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33EngagementPresentationCoordinator_messageCoordinator);
  swift_release();
  sub_23A71FE14((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33EngagementPresentationCoordinator_engagementBannerRuleInfo);

  swift_unknownObjectRelease();
}

@end