@interface WelcomeView
- (BOOL)accessibilityViewIsModal;
- (_TtC7NewsUI211WelcomeView)initWithCoder:(id)a3;
- (_TtC7NewsUI211WelcomeView)initWithFrame:(CGRect)a3;
@end

@implementation WelcomeView

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (_TtC7NewsUI211WelcomeView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI211WelcomeView *)sub_1DEC08D50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI211WelcomeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DEC09DF4();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI211WelcomeView_footer);
}

@end