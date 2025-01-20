@interface StandardLinkView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC8AppStore16StandardLinkView)initWithCoder:(id)a3;
- (_TtC8AppStore16StandardLinkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation StandardLinkView

- (_TtC8AppStore16StandardLinkView)initWithFrame:(CGRect)a3
{
  sub_10032092C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC8AppStore16StandardLinkView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore16StandardLinkView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_100320F30(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100321084();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1003214F4(a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore16StandardLinkView_descriptionLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore16StandardLinkView_summaryLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16StandardLinkView_descriptionLabel));

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore16StandardLinkView_disclosureIndicator);
}

@end