@interface ProductRatingCollectionViewCell
- (UILabel)accessibilityCurrentRatingLabel;
- (UILabel)accessibilityOutOfRatingLabel;
- (UILabel)accessibilityRatingCountLabel;
- (UIStackView)accessibilityRatingBreakdownStack;
- (_TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)clearAllRatings;
- (void)layoutSubviews;
- (void)setRatingWithProportion:(float)a3 at:(int64_t)a4;
@end

@implementation ProductRatingCollectionViewCell

- (_TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell *)sub_1B9E98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BBBD0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BA9A8();
}

- (void)setRatingWithProportion:(float)a3 at:(int64_t)a4
{
  v6 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_ratingBreakdownStack);
  v7 = self;
  id v8 = [v6 arrangedSubviews];
  sub_2E66C(0, (unint64_t *)&qword_474180);
  uint64_t v9 = sub_3845F0();

  if ((v9 & 0xC000000000000001) != 0)
  {
    id v10 = (id)sub_3857A0();
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8)) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return;
  }
  id v10 = *(id *)(v9 + 8 * a4 + 32);
LABEL_5:
  id v13 = v10;
  swift_bridgeObjectRelease();
  type metadata accessor for RatingRowView();
  uint64_t v11 = swift_dynamicCastClassUnconditional();
  *(float *)&double v12 = a3;
  [*(id *)(v11 + OBJC_IVAR____TtC23ShelfKitCollectionViews13RatingRowView_barView) setProgress:v12];
}

- (void)clearAllRatings
{
  v2 = self;
  sub_1BB264();
}

- (UILabel)accessibilityCurrentRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_currentRatingLabel));
}

- (UILabel)accessibilityOutOfRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_outOfRatingLabel));
}

- (UILabel)accessibilityRatingCountLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_ratingCountLabel));
}

- (UIStackView)accessibilityRatingBreakdownStack
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_ratingBreakdownStack));
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_currentRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_outOfRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_ratingCountLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews31ProductRatingCollectionViewCell_ratingBreakdownStack);
}

@end