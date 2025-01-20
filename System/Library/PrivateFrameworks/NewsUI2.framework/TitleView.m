@interface TitleView
- (BOOL)isAccessibilityElement;
- (_TtC7NewsUI29TitleView)initWithCoder:(id)a3;
- (_TtC7NewsUI29TitleView)initWithFrame:(CGRect)a3;
@end

@implementation TitleView

- (_TtC7NewsUI29TitleView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI29TitleView *)sub_1DF7382B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI29TitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF73896C();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI29TitleView_action);
}

- (BOOL)isAccessibilityElement
{
  v2 = self;
  BOOL v3 = sub_1DF738854();

  return v3;
}

@end