@interface TVBrowsingNavigationController
- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithCoder:(id)a3;
- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithRootViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVBrowsingNavigationController

- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_purchaseCoordinator;
  id v6 = objc_allocWithZone((Class)type metadata accessor for MarketingPurchaseCoordinator());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9SeymourUI30TVBrowsingNavigationController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A3D2338();
}

- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC9SeymourUI30TVBrowsingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC9SeymourUI30TVBrowsingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI30TVBrowsingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_purchaseCoordinator));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_placeholderViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_engagementPresentationCoordinator);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_pictureInPicturePresenter));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

@end