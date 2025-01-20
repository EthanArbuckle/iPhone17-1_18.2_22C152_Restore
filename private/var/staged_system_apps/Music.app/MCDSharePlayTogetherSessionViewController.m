@interface MCDSharePlayTogetherSessionViewController
- (_TtC5Music41MCDSharePlayTogetherSessionViewController)initWithCoder:(id)a3;
- (_TtC5Music41MCDSharePlayTogetherSessionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Music41MCDSharePlayTogetherSessionViewController)initWithViewModel:(id)a3;
- (void)dismissQRCode;
- (void)viewDidLayoutSubviews;
@end

@implementation MCDSharePlayTogetherSessionViewController

- (_TtC5Music41MCDSharePlayTogetherSessionViewController)initWithViewModel:(id)a3
{
  return (_TtC5Music41MCDSharePlayTogetherSessionViewController *)sub_1005FB658((char *)a3);
}

- (_TtC5Music41MCDSharePlayTogetherSessionViewController)initWithCoder:(id)a3
{
  result = (_TtC5Music41MCDSharePlayTogetherSessionViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1005FBBCC();
}

- (void)dismissQRCode
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music41MCDSharePlayTogetherSessionViewController_contentViewController);
  v3 = self;
  id v4 = v2;
  sub_1006E5EA4();
}

- (_TtC5Music41MCDSharePlayTogetherSessionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music41MCDSharePlayTogetherSessionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music41MCDSharePlayTogetherSessionViewController_contentViewController));
}

@end