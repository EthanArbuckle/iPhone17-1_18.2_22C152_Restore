@interface WFFocusConfigurationServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (WFFocusConfigurationServiceViewController)initWithCoder:(id)a3;
- (WFFocusConfigurationServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)startConfigurationWithRequest:(WFFocusConfigurationRequest *)a3 completion:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WFFocusConfigurationServiceViewController

+ (id)_exportedInterface
{
  id v2 = sub_100019E60();
  return v2;
}

+ (id)_remoteViewControllerInterface
{
  id v2 = sub_100019EB4();
  return v2;
}

- (void)loadView
{
  id v2 = self;
  sub_100019F08();
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_10001BC04((SEL *)&selRef_viewDidLoad);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_10001A52C(a3);
}

- (void)startConfigurationWithRequest:(WFFocusConfigurationRequest *)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_10001B92C((uint64_t)&unk_1000336C0, (uint64_t)v7);
}

- (WFFocusConfigurationServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1000207E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (WFFocusConfigurationServiceViewController *)sub_10001BA30(v5, v7, a4);
}

- (WFFocusConfigurationServiceViewController)initWithCoder:(id)a3
{
  return (WFFocusConfigurationServiceViewController *)sub_10001BB48(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFFocusConfigurationServiceViewController_request));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFFocusConfigurationServiceViewController_configurationViewModel));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___WFFocusConfigurationServiceViewController_hostingViewController);
}

@end