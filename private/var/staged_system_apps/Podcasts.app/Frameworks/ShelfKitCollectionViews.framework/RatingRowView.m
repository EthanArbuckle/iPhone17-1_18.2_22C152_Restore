@interface RatingRowView
- (CGSize)intrinsicContentSize;
- (UIProgressView)accessibilityBarView;
- (_TtC23ShelfKitCollectionViews13RatingRowView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews13RatingRowView)initWithFrame:(CGRect)a3;
- (_TtC23ShelfKitCollectionViews16ReviewRatingView)accessibilityRatingView;
@end

@implementation RatingRowView

- (_TtC23ShelfKitCollectionViews13RatingRowView)initWithCoder:(id)a3
{
  result = (_TtC23ShelfKitCollectionViews13RatingRowView *)sub_385890();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_ratingView) intrinsicContentSize];
  double v3 = UIViewNoIntrinsicMetric;
  result.height = v2;
  result.width = v3;
  return result;
}

- (_TtC23ShelfKitCollectionViews16ReviewRatingView)accessibilityRatingView
{
  return (_TtC23ShelfKitCollectionViews16ReviewRatingView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_ratingView);
}

- (UIProgressView)accessibilityBarView
{
  return (UIProgressView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                   + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_barView));
}

- (_TtC23ShelfKitCollectionViews13RatingRowView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23ShelfKitCollectionViews13RatingRowView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_ratingView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_barView);
}

@end