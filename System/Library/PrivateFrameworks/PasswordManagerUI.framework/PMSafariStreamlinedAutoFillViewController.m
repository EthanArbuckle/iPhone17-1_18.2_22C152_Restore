@interface PMSafariStreamlinedAutoFillViewController
- (PMSafariStreamlinedAutoFillViewController)initWithCoder:(id)a3;
- (PMSafariStreamlinedAutoFillViewController)initWithCredentialIdentity:(id)a3 host:(id)a4 hasPasswordFieldToFill:(BOOL)a5;
- (PMSafariStreamlinedAutoFillViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PMSafariStreamlinedAutoFillViewController)initWithSavedAccountMatch:(id)a3 host:(id)a4 hasPasswordFieldToFill:(BOOL)a5;
- (PMSafariStreamlinedAutoFillViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation PMSafariStreamlinedAutoFillViewController

- (PMSafariStreamlinedAutoFillViewControllerDelegate)delegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (PMSafariStreamlinedAutoFillViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PMSafariStreamlinedAutoFillViewController_delegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  PMSafariStreamlinedAutoFillViewController.viewDidLoad()();
}

- (PMSafariStreamlinedAutoFillViewController)initWithSavedAccountMatch:(id)a3 host:(id)a4 hasPasswordFieldToFill:(BOOL)a5
{
  return (PMSafariStreamlinedAutoFillViewController *)sub_2589C0D24((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, a5, (uint64_t (*)(void))sub_2589C277C);
}

- (PMSafariStreamlinedAutoFillViewController)initWithCredentialIdentity:(id)a3 host:(id)a4 hasPasswordFieldToFill:(BOOL)a5
{
  return (PMSafariStreamlinedAutoFillViewController *)sub_2589C0D24((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, a5, (uint64_t (*)(void))sub_2589C2864);
}

- (PMSafariStreamlinedAutoFillViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PMSafariStreamlinedAutoFillViewController_delegate) = 0;
  id v4 = a3;

  result = (PMSafariStreamlinedAutoFillViewController *)sub_258D6FE78();
  __break(1u);
  return result;
}

- (PMSafariStreamlinedAutoFillViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PMSafariStreamlinedAutoFillViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PMSafariStreamlinedAutoFillViewController_savedAccountMatch));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PMSafariStreamlinedAutoFillViewController_credentialIdentity));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end