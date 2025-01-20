@interface WFSystemActionConfigurationServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (WFSystemActionConfigurationServiceViewController)initWithCoder:(id)a3;
- (WFSystemActionConfigurationServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)dealloc;
- (void)setSelectedSystemAction:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFSystemActionConfigurationServiceViewController

- (WFSystemActionConfigurationServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_100015080();
  }
  id v5 = a4;
  sub_100008118();
  return result;
}

- (WFSystemActionConfigurationServiceViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000082F8();
}

- (void)dealloc
{
  v2 = self;
  sub_10000838C();
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___WFSystemActionConfigurationServiceViewController_embeddedViewController);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100008528();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10000899C(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100008A34();
}

- (void)setSelectedSystemAction:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100008C2C();
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100008E78();
}

+ (id)_exportedInterface
{
  id v2 = sub_100009C80();
  return v2;
}

+ (id)_remoteViewControllerInterface
{
  id v2 = sub_100009CD4();
  return v2;
}

@end