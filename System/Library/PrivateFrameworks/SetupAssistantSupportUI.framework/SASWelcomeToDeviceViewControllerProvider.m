@interface SASWelcomeToDeviceViewControllerProvider
- (SASWelcomeToDeviceViewControllerProvider)init;
- (SASWelcomeToDeviceViewControllerProvider)initWithText:(id)a3 finalTextColor:(id)a4 onAnimationCompleteHandler:(id)a5;
- (UIViewController)viewController;
- (void)setViewController:(id)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation SASWelcomeToDeviceViewControllerProvider

- (UIViewController)viewController
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setViewController:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (SASWelcomeToDeviceViewControllerProvider)initWithText:(id)a3 finalTextColor:(id)a4 onAnimationCompleteHandler:(id)a5
{
  id v6 = _Block_copy(a5);
  uint64_t v7 = sub_25C23A588();
  uint64_t v9 = v8;
  if (v6)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v6;
    id v6 = sub_25C2338C0;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a4;
  v12 = (SASWelcomeToDeviceViewControllerProvider *)sub_25C2336B0(v7, v9, v11, (uint64_t)v6, v10);
  sub_25C230F94((uint64_t)v6);

  return v12;
}

- (void)startAnimation
{
  v2 = *(void (**)(void))(**(void **)((char *)&self->super.isa
                                      + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewModel)
                        + 664);
  v3 = self;
  v2();
}

- (void)stopAnimation
{
  v2 = *(void (**)(void))(**(void **)((char *)&self->super.isa
                                      + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewModel)
                        + 696);
  v3 = self;
  v2();
}

- (SASWelcomeToDeviceViewControllerProvider)init
{
  result = (SASWelcomeToDeviceViewControllerProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController);
}

@end