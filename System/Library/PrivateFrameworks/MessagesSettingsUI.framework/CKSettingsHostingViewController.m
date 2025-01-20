@interface CKSettingsHostingViewController
- (CKSettingsHostingViewController)initWithCoder:(id)a3;
- (CKSettingsHostingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CKSettingsHostingViewController

- (void)viewDidLoad
{
  v2 = self;
  CKSettingsHostingViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  CKSettingsHostingViewController.viewDidLayoutSubviews()();
}

- (CKSettingsHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_25620F3C8();
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSettingsHostingViewController_hostedViewController) = 0;
    id v6 = a4;
    v7 = (void *)sub_25620F3B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSettingsHostingViewController_hostedViewController) = 0;
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)CKSettingsHostingViewController;
  v9 = [(CKSettingsHostingViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (CKSettingsHostingViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSettingsHostingViewController_hostedViewController) = 0;
  v4.receiver = self;
  v4.super_class = (Class)CKSettingsHostingViewController;
  return [(CKSettingsHostingViewController *)&v4 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSettingsHostingViewController_hostedViewController));
}

@end