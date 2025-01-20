@interface STUIStatusBarDataOverridesViewController
- (_TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController)initWithCoder:(id)a3;
- (_TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation STUIStatusBarDataOverridesViewController

- (void)viewDidLoad
{
  v2 = self;
  STUIStatusBarDataOverridesViewController.viewDidLoad()();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  objc_msgSend(*(id *)((char *)&v3->super.super.super.isa+ OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher), sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for STUIStatusBarDataOverridesViewController();
  [(STUIStatusBarDataOverridesViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher);
}

- (_TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1D7ECA480();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController *)STUIStatusBarDataOverridesViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController)initWithCoder:(id)a3
{
  return (_TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController *)STUIStatusBarDataOverridesViewController.init(coder:)(a3);
}

@end