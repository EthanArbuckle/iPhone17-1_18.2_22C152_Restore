@interface FloatingToolbarViewController
- (_TtC9Shortcuts29FloatingToolbarViewController)initWithCoder:(id)a3;
- (_TtC9Shortcuts29FloatingToolbarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)keyboardWillChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation FloatingToolbarViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000132E8();
}

- (_TtC9Shortcuts29FloatingToolbarViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100045F70();
}

- (void)dealloc
{
  v2 = self;
  sub_100046030();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts29FloatingToolbarViewController_toolbar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts29FloatingToolbarViewController_bottomConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Shortcuts29FloatingToolbarViewController_backgroundColor);
}

- (void)keyboardWillChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100046128(v4);
}

- (_TtC9Shortcuts29FloatingToolbarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_100046538();
}

@end