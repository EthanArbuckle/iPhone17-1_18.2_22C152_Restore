@interface BaseLockupView
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOfferLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOrdinalLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTertiaryTitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore11OfferButton)accessibilityOfferButton;
- (_TtC8AppStore14BaseLockupView)initWithCoder:(id)a3;
- (_TtC8AppStore14BaseLockupView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BaseLockupView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10004AE70(a3);
}

- (_TtC8AppStore14BaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore14BaseLockupView *)sub_100088A58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore14BaseLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000B7B1C();
}

- (void)dealloc
{
  v2 = self;
  sub_1000B6E14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore14BaseLockupView_tertiaryTitleLabel));

  sub_100089384((uint64_t)self + OBJC_IVAR____TtC8AppStore14BaseLockupView_offerLabelPresenter);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOrdinalLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore14BaseLockupView_ordinalLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore14BaseLockupView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore14BaseLockupView_subtitleLabel));
}

- (_TtC8AppStore11OfferButton)accessibilityOfferButton
{
  return (_TtC8AppStore11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore14BaseLockupView_offerButton));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTertiaryTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore14BaseLockupView_tertiaryTitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore14BaseLockupView_headingLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOfferLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore14BaseLockupView_offerLabel));
}

@end