@interface PKProvisioningContinuityCarKeyHostViewController
- (PKProvisioningContinuityCarKeyHostViewController)initWithCoder:(id)a3;
- (PKProvisioningContinuityCarKeyHostViewController)initWithHandle:(id)a3 userInfo:(id)a4 parent:(id)a5;
- (PKProvisioningContinuityCarKeyHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKProvisioningContinuityCarKeyHostViewController

- (PKProvisioningContinuityCarKeyHostViewController)initWithHandle:(id)a3 userInfo:(id)a4 parent:(id)a5
{
  uint64_t v6 = sub_1A03B47F8();
  id v7 = a3;
  swift_unknownObjectRetain();
  ProvisioningContinuityCarKeyHostViewController.init(handle:userInfo:parent:)(v7, v6);
  return result;
}

- (PKProvisioningContinuityCarKeyHostViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19F548CC8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  ProvisioningContinuityCarKeyHostViewController.viewWillAppear(_:)(a3);
}

- (PKProvisioningContinuityCarKeyHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PKProvisioningContinuityCarKeyHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKProvisioningContinuityCarKeyHostViewController_handle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKProvisioningContinuityCarKeyHostViewController_pass));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR___PKProvisioningContinuityCarKeyHostViewController_alertParent);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKProvisioningContinuityCarKeyHostViewController_paymentService));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKProvisioningContinuityCarKeyHostViewController_passLibrary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKProvisioningContinuityCarKeyHostViewController_webService));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PKProvisioningContinuityCarKeyHostViewController_authorizationSession);
}

@end