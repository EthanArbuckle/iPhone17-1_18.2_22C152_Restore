@interface CHLegacyDevicesViewController
- (CHLegacyDevicesViewController)initWithCoder:(id)a3;
- (CHLegacyDevicesViewController)initWithFitnessAppContext:(id)a3;
- (CHLegacyDevicesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doneTapped;
- (void)viewDidLoad;
@end

@implementation CHLegacyDevicesViewController

- (CHLegacyDevicesViewController)initWithFitnessAppContext:(id)a3
{
  return (CHLegacyDevicesViewController *)sub_1006889B4((char *)a3);
}

- (CHLegacyDevicesViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHLegacyDevicesViewController_hostingViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHLegacyDevicesViewController_subView) = 0;
  id v4 = a3;

  result = (CHLegacyDevicesViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100688E00();
}

- (void)doneTapped
{
}

- (CHLegacyDevicesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CHLegacyDevicesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHLegacyDevicesViewController_hostingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHLegacyDevicesViewController_cloudDeviceProvider));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHLegacyDevicesViewController_subView);
}

@end