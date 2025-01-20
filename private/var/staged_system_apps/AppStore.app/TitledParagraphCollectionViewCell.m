@interface TitledParagraphCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySecondarySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel;
- (_TtC8AppStore18ExpandableTextView)accessibilityExpandableTextView;
- (_TtC8AppStore33TitledParagraphCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TitledParagraphCollectionViewCell

- (_TtC8AppStore33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore33TitledParagraphCollectionViewCell *)sub_100335C40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore33TitledParagraphCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10033784C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100336800();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10033715C((uint64_t)a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_primarySubtitleLabel));
}

- (_TtC8AppStore18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC8AppStore18ExpandableTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                      + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_bodyTextView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySecondarySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_primarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_itemLayoutContext);

  swift_unknownObjectRelease();
}

@end