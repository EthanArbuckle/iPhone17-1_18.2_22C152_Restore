@interface MetadataRibbonBarView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC8AppStore21MetadataRibbonBarView)initWithCoder:(id)a3;
- (_TtC8AppStore21MetadataRibbonBarView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonBarView

- (_TtC8AppStore21MetadataRibbonBarView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore21MetadataRibbonBarView *)sub_10040323C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore21MetadataRibbonBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100404954();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100403680();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  uint64_t v5 = type metadata accessor for MetadataRibbonBarViewLayout.Metrics();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for MetadataRibbonBarViewLayout();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore21MetadataRibbonBarView_dividerLabel);
  v28[4] = type metadata accessor for DynamicTypeLabel();
  v28[5] = &protocol witness table for UILabel;
  v28[1] = v13;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, (char *)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonBarView_metrics, v5);
  swift_unknownObjectRetain();
  v14 = self;
  id v15 = v13;
  MetadataRibbonBarViewLayout.init(descriptionLabelTextView:metrics:)();
  MetadataRibbonBarViewLayout.measurements(fitting:in:)();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_unknownObjectRelease();

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.var3 = v27;
  result.var2 = v26;
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore21MetadataRibbonBarView_dividerLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21MetadataRibbonBarView_dividerLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonBarView_metrics;
  uint64_t v4 = type metadata accessor for MetadataRibbonBarViewLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonBarView_id, &qword_100981560);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonBarView_itemType, &qword_100981568);
}

@end