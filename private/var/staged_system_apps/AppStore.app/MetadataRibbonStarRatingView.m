@interface MetadataRibbonStarRatingView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityRatingCountLabel;
- (_TtC8AppStore10RatingView)accessibilityStarRatingView;
- (_TtC8AppStore28MetadataRibbonStarRatingView)initWithCoder:(id)a3;
- (_TtC8AppStore28MetadataRibbonStarRatingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonStarRatingView

- (_TtC8AppStore28MetadataRibbonStarRatingView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28MetadataRibbonStarRatingView *)sub_1006116C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28MetadataRibbonStarRatingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100612FAC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100611CAC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_100611FAC();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (_TtC8AppStore10RatingView)accessibilityStarRatingView
{
  return (_TtC8AppStore10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                              + OBJC_IVAR____TtC8AppStore28MetadataRibbonStarRatingView_starRatingView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityRatingCountLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore28MetadataRibbonStarRatingView_ratingCountLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MetadataRibbonStarRatingView_starRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28MetadataRibbonStarRatingView_ratingCountLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore28MetadataRibbonStarRatingView_metrics;
  uint64_t v4 = type metadata accessor for MetadataRibbonStarRatingViewLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore28MetadataRibbonStarRatingView_id, &qword_100981560);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore28MetadataRibbonStarRatingView_itemType, &qword_100981568);
}

@end