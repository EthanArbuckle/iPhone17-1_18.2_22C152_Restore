@interface FocusableView
- (BOOL)canBecomeFocused;
- (_TtC12NewsArticles13FocusableView)initWithCoder:(id)a3;
- (_TtC12NewsArticles13FocusableView)initWithFrame:(CGRect)a3;
@end

@implementation FocusableView

- (BOOL)canBecomeFocused
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles13FocusableView_focusable);
}

- (_TtC12NewsArticles13FocusableView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles13FocusableView_focusable) = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FocusableView();
  return -[FocusableView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12NewsArticles13FocusableView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles13FocusableView_focusable) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FocusableView();
  return [(FocusableView *)&v5 initWithCoder:a3];
}

@end