@interface ProductReviewActionsCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore24ProductReviewActionsCell)initWithCoder:(id)a3;
- (_TtC8AppStore24ProductReviewActionsCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductReviewActionsCell

- (_TtC8AppStore24ProductReviewActionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24ProductReviewActionsCell *)sub_1001A6478(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24ProductReviewActionsCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001A69CC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001A6730();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore24ProductReviewActionsCell_productReviewActionsView) sizeThatFits:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ProductReviewActionsCell_productReviewActionsView));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore24ProductReviewActionsCell_separatorView);
}

@end