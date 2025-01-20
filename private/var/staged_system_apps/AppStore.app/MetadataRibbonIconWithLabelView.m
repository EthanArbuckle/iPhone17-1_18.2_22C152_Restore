@interface MetadataRibbonIconWithLabelView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityUILabel;
- (_TtC8AppStore31MetadataRibbonIconWithLabelView)initWithCoder:(id)a3;
- (_TtC8AppStore31MetadataRibbonIconWithLabelView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonIconWithLabelView

- (_TtC8AppStore31MetadataRibbonIconWithLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31MetadataRibbonIconWithLabelView *)sub_100196654(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31MetadataRibbonIconWithLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001995D8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100197134();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_100197430();
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

- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                           + OBJC_IVAR____TtC8AppStore31MetadataRibbonIconWithLabelView_artworkView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityUILabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31MetadataRibbonIconWithLabelView_label));
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore31MetadataRibbonIconWithLabelView_metrics;
  uint64_t v4 = type metadata accessor for MetadataRibbonIconWithLabelViewLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31MetadataRibbonIconWithLabelView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31MetadataRibbonIconWithLabelView_artworkView));
  swift_release();
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31MetadataRibbonIconWithLabelView_id, &qword_100981560);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31MetadataRibbonIconWithLabelView_itemType, &qword_100981568);
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore31MetadataRibbonIconWithLabelView_configuration;

  sub_100199490((uint64_t)v5);
}

@end