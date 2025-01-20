@interface InAppPurchaseLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore11OfferButton)accessibilityOfferButton;
- (_TtC8AppStore23InAppPurchaseLockupView)initWithCoder:(id)a3;
- (_TtC8AppStore23InAppPurchaseLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation InAppPurchaseLockupView

- (_TtC8AppStore23InAppPurchaseLockupView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_theme;
  uint64_t v6 = enum case for InAppPurchaseTheme.infer(_:);
  uint64_t v7 = type metadata accessor for InAppPurchaseTheme();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_isHeightConstrained) = 0;
  id v8 = a3;

  result = (_TtC8AppStore23InAppPurchaseLockupView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1004C7620();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004C7980();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_10097FA20;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for InAppPurchaseLockupViewLayout.Metrics();
  sub_100087728(v5, (uint64_t)qword_1009E57B8);
  type metadata accessor for InAppPurchaseLockupViewLayout();
  sub_1004C85AC(&qword_100999110, (void (*)(uint64_t))&type metadata accessor for InAppPurchaseLockupViewLayout);
  dispatch thunk of static EstimatedMeasurable.estimatedMeasurements(fitting:using:in:)();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_subtitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_descriptionLabel));
}

- (_TtC8AppStore11OfferButton)accessibilityOfferButton
{
  return (_TtC8AppStore11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_offerButton));
}

- (_TtC8AppStore23InAppPurchaseLockupView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8AppStore23InAppPurchaseLockupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_theme;
  uint64_t v4 = type metadata accessor for InAppPurchaseTheme();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_descriptionLabel));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23InAppPurchaseLockupView_offerButton);
}

@end