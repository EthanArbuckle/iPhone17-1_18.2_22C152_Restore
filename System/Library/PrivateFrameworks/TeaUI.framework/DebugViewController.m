@interface DebugViewController
- (_TtC5TeaUI19DebugViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI19DebugViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doDone;
- (void)doSettings;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugViewController

- (_TtC5TeaUI19DebugViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  DebugViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  DebugViewController.viewDidLoad()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  DebugViewController.viewWillLayoutSubviews()();
}

- (void)doDone
{
  v2 = self;
  sub_1B6094260();
}

- (void)doSettings
{
  v2 = self;
  sub_1B609D54C();
}

- (_TtC5TeaUI19DebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  DebugViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI19DebugViewController_settingsPresenter);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI19DebugViewController_tableViewSource);
}

@end