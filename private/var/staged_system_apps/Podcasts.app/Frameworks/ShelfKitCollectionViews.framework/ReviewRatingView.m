@interface ReviewRatingView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23ShelfKitCollectionViews16ReviewRatingView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews16ReviewRatingView)initWithFrame:(CGRect)a3;
- (double)accessibilityRating;
- (void)drawRect:(CGRect)a3;
@end

@implementation ReviewRatingView

- (_TtC23ShelfKitCollectionViews16ReviewRatingView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16ReviewRatingView *)sub_21D7D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews16ReviewRatingView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews16ReviewRatingView_hasRTLTransformSet) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews16ReviewRatingView_rating) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews16ReviewRatingView_starSize) = 1;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews16ReviewRatingView_showsEmptyStars) = 1;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews16ReviewRatingView *)sub_385890();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_21DC10(x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_21E80C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[ReviewRatingView sizeThatFits:](self, "sizeThatFits:", 0.0, 0.0);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)accessibilityRating
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC23ShelfKitCollectionViews16ReviewRatingView_rating);
}

@end