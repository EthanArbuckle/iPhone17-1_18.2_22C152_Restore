@interface RatingView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)viewForLastBaselineLayout;
- (_TtC23ShelfKitCollectionViews10RatingView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews10RatingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RatingView

- (_TtC23ShelfKitCollectionViews10RatingView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews10RatingView *)sub_2788C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews10RatingView)initWithCoder:(id)a3
{
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_rating) = 1080033280;
  uint64_t v5 = OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_color;
  sub_FAD4();
  id v6 = a3;
  *(UIColor *)((char *)&self->super.super.super.isa + v5) = sub_385220(0.99608, 0.5098, 0.027451, 1.0);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_starSize) = 2;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_hideEmptyStars) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_reverseAlignment) = 0;

  result = (_TtC23ShelfKitCollectionViews10RatingView *)sub_385890();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(RatingView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_278CA8();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RatingView();
  v2 = (char *)v4.receiver;
  [(RatingView *)&v4 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_label];
  [v2 frame];
  [v3 setFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_label));
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10RatingView_color);
}

@end