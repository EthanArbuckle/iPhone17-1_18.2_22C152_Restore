@interface DebugSubViewController
- (_TtC5TeaUI22DebugSubViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI22DebugSubViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doDone;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugSubViewController

- (_TtC5TeaUI22DebugSubViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  DebugSubViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  DebugSubViewController.viewDidLoad()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  DebugSubViewController.viewWillLayoutSubviews()();
}

- (void)doDone
{
  v2 = self;
  sub_1B6094260();
}

- (_TtC5TeaUI22DebugSubViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  DebugSubViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI22DebugSubViewController_tableViewSource);
}

@end