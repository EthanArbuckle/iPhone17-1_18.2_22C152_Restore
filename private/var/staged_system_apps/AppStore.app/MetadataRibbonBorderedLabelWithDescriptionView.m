@interface MetadataRibbonBorderedLabelWithDescriptionView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityBorderedLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView)initWithCoder:(id)a3;
- (_TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonBorderedLabelWithDescriptionView

- (_TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView *)sub_1000A823C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000A9CCC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000A883C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_1000A8B0C();
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

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityBorderedLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_borderedLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_descriptionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_borderedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_descriptionLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_metrics;
  uint64_t v4 = type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_borderLabelViewPlacement;
  uint64_t v6 = type metadata accessor for MetadataRibbonSecondaryViewPlacement();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_id, &qword_100981560);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_itemType, &qword_100981568);
}

@end