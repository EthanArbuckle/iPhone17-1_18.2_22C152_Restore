@interface WelcomeView
- (_TtC8StocksUI11WelcomeView)initWithCoder:(id)a3;
- (_TtC8StocksUI11WelcomeView)initWithFrame:(CGRect)a3;
@end

@implementation WelcomeView

- (_TtC8StocksUI11WelcomeView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI11WelcomeView *)sub_20A66F5C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI11WelcomeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A6705B4();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI11WelcomeView_errorView);
}

@end