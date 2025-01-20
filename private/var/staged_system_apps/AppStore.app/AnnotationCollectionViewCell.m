@interface AnnotationCollectionViewCell
- (BOOL)accessibilityCellIsExpanded;
- (BOOL)accessibilityIsSummaryExpandable;
- (NSArray)accessibilityDetailItems;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityLinkLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore28AnnotationCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)accessibilityLinkLabelTapped;
- (void)layoutSubviews;
- (void)linkLabelTapped:(id)a3;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AnnotationCollectionViewCell

- (_TtC8AppStore28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28AnnotationCollectionViewCell *)sub_100126CD8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28AnnotationCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10012C7DC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100127464();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100127864();
}

- (void)linkLabelTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10012CA04();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100128B94((uint64_t)a3);
}

- (NSArray)accessibilityDetailItems
{
  v2 = self;
  sub_100128D00();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_summaryLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityLinkLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkLabel));
}

- (BOOL)accessibilityCellIsExpanded
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_isExpanded);
}

- (BOOL)accessibilityIsSummaryExpandable
{
  v2 = self;
  BOOL v3 = sub_100125334();

  return v3;
}

- (void)accessibilityLinkLabelTapped
{
  v2 = self;
  sub_10012CA04();
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_disclosureView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_summaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkLabel));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_detailViewPool;
  uint64_t v4 = sub_100082C28(&qword_100984D08);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_separatorLineView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkAction, &qword_10098D120);
}

@end