@interface Bootstrapper
- (_TtC5TeaUI12Bootstrapper)init;
- (void)afterBootstrapOnQueue:(id)a3 runBootstrapCallbackBlock:(id)a4;
- (void)startBootstrappingWithWindow:(id)a3 shouldOnboard:(BOOL)a4;
- (void)startBootstrappingWithWindow:(id)a3 shouldOnboard:(BOOL)a4 shouldCollapseSidebar:(BOOL)a5;
@end

@implementation Bootstrapper

- (void)startBootstrappingWithWindow:(id)a3 shouldOnboard:(BOOL)a4
{
  v6 = (UIWindow *)a3;
  v7 = self;
  Bootstrapper.startBootstrapping(window:shouldOnboard:)(v6, a4);
}

- (void)startBootstrappingWithWindow:(id)a3 shouldOnboard:(BOOL)a4 shouldCollapseSidebar:(BOOL)a5
{
  v8 = (UIWindow *)a3;
  v9 = self;
  Bootstrapper.startBootstrapping(window:shouldOnboard:shouldCollapseSidebar:)(v8, a4, a5);
}

- (void)afterBootstrapOnQueue:(id)a3 runBootstrapCallbackBlock:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  Bootstrapper.afterBootstrap(on:run:)((uint64_t)v8, (uint64_t)sub_1B5EA9C18, v7);

  swift_release();
}

- (_TtC5TeaUI12Bootstrapper)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI12Bootstrapper_mainViewControllerFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI12Bootstrapper_onboardingViewControllerFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI12Bootstrapper_onboardingViewDismissalAnimator);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5TeaUI12Bootstrapper_deferringGroup);
}

@end