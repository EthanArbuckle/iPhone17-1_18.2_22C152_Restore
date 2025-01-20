@interface AccountActionSectionFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC8AppStore30AccountActionSectionFooterView)initWithCoder:(id)a3;
- (_TtC8AppStore30AccountActionSectionFooterView)initWithFrame:(CGRect)a3;
- (void)buttonTapped;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)tintColorDidChange;
@end

@implementation AccountActionSectionFooterView

- (_TtC8AppStore30AccountActionSectionFooterView)initWithFrame:(CGRect)a3
{
  sub_100751A74();
  return result;
}

- (_TtC8AppStore30AccountActionSectionFooterView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_tapGestureRecognizer) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_isCentered) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_text);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_buttonAction);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC8AppStore30AccountActionSectionFooterView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1007510A4();
}

- (void)buttonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_buttonAction);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1007515C0();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100751854();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_text);
  uint64_t v6 = *(void *)&self->titleLabel[OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_text];
  swift_bridgeObjectRetain();
  v7 = self;
  [(AccountActionSectionFooterView *)v7 layoutMargins];
  double v8 = sub_100751DAC(width, v5, v6);
  double v10 = v9;

  swift_bridgeObjectRelease();
  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_titleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_tapGestureRecognizer));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore30AccountActionSectionFooterView_buttonAction);

  sub_10006012C(v3);
}

@end