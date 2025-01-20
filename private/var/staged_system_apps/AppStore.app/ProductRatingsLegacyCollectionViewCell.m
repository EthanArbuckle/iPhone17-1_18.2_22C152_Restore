@interface ProductRatingsLegacyCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityProgressBarViews;
- (NSArray)accessibilityStarViews;
- (UILabel)accessibilityCurrentRatingLabel;
- (UILabel)accessibilityOutOfRatingLabel;
- (UILabel)accessibilityRatingCountLabel;
- (_TtC8AppStore38ProductRatingsLegacyCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore38ProductRatingsLegacyCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation ProductRatingsLegacyCollectionViewCell

- (_TtC8AppStore38ProductRatingsLegacyCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore38ProductRatingsLegacyCollectionViewCell *)sub_1005CE3B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore38ProductRatingsLegacyCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_pageTraits) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_pageGrid;
  uint64_t v8 = type metadata accessor for PageGrid();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_hasRatings) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_noRatingsView) = 0;
  id v9 = a3;

  result = (_TtC8AppStore38ProductRatingsLegacyCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005CF6E0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1005CFB30();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  sub_1005D0038();
}

- (UILabel)accessibilityCurrentRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_currentRatingLabel));
}

- (UILabel)accessibilityOutOfRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_outOfRatingLabel));
}

- (UILabel)accessibilityRatingCountLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_ratingCountLabel));
}

- (NSArray)accessibilityStarViews
{
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSArray)accessibilityProgressBarViews
{
  sub_100084CF0(0, &qword_10099FD30);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_currentRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_outOfRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_ratingCountLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_pageGrid, (uint64_t *)&unk_100983860);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore38ProductRatingsLegacyCollectionViewCell_noRatingsView);
}

@end