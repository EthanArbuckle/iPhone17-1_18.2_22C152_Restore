@interface DismissibleDynamicViewController
- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithCoder:(id)a3;
- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithRootViewController:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation DismissibleDynamicViewController

- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC16NewsSubscription32DismissibleDynamicViewController *)sub_1BFBD4E58();
  __break(1u);
  return result;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate;
  swift_beginAccess();
  if (MEMORY[0x1C18BCCA0](v5))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 8);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC16NewsSubscription32DismissibleDynamicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC16NewsSubscription32DismissibleDynamicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16NewsSubscription32DismissibleDynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16NewsSubscription32DismissibleDynamicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate;
  sub_1BFA51A44((uint64_t)v3);
}

@end