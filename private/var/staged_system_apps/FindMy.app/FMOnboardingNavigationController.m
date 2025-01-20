@interface FMOnboardingNavigationController
- (_TtC6FindMy32FMOnboardingNavigationController)initWithCoder:(id)a3;
- (_TtC6FindMy32FMOnboardingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC6FindMy32FMOnboardingNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC6FindMy32FMOnboardingNavigationController)initWithRootViewController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMOnboardingNavigationController

- (_TtC6FindMy32FMOnboardingNavigationController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_conditionSubscription) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_isDissmissable) = 0;
  *(void *)&self->mediator[OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_onboardingDelegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC6FindMy32FMOnboardingNavigationController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1002EE9F8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1002EEBB8(a3);
}

- (_TtC6FindMy32FMOnboardingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC6FindMy32FMOnboardingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC6FindMy32FMOnboardingNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC6FindMy32FMOnboardingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC6FindMy32FMOnboardingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy32FMOnboardingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_noveltyViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_notificationAuthViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_pageViewController));
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_onboardingDelegate;

  sub_100068760((uint64_t)v3);
}

@end