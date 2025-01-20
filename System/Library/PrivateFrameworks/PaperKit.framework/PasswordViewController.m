@interface PasswordViewController
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC8PaperKit22PasswordViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit22PasswordViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation PasswordViewController

- (void)loadView
{
  v2 = self;
  PasswordViewController.loadView()();
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  v4 = (UITextField *)a3;
  v5 = self;
  LOBYTE(self) = PasswordViewController.textFieldShouldReturn(_:)(v4);

  return self & 1;
}

- (_TtC8PaperKit22PasswordViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8PaperKit22PasswordViewController *)PasswordViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit22PasswordViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit22PasswordViewController *)PasswordViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit22PasswordViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit22PasswordViewController____lazy_storage___textField);
}

@end