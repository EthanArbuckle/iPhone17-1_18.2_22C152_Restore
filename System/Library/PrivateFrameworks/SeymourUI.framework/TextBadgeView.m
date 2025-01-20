@interface TextBadgeView
- (CGSize)intrinsicContentSize;
- (NSLayoutYAxisAnchor)firstBaselineAnchor;
- (_TtC9SeymourUI13TextBadgeView)initWithCoder:(id)a3;
- (_TtC9SeymourUI13TextBadgeView)initWithFrame:(CGRect)a3;
@end

@implementation TextBadgeView

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13TextBadgeView_textLabel), sel_firstBaselineAnchor);

  return (NSLayoutYAxisAnchor *)v2;
}

- (CGSize)intrinsicContentSize
{
  id v2 = self;
  double v3 = sub_239CADEC8();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI13TextBadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13TextBadgeView *)sub_239CADF4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13TextBadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239CAE3F4();
}

- (void).cxx_destruct
{
}

@end