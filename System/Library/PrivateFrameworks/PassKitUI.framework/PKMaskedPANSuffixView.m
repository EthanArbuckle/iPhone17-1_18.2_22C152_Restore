@interface PKMaskedPANSuffixView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKMaskedPANSuffixView)initWithCoder:(id)a3;
- (PKMaskedPANSuffixView)initWithFrame:(CGRect)a3;
- (PKMaskedPANSuffixView)initWithSuffix:(id)a3 foregroundColor:(id)a4;
- (void)layoutSubviews;
@end

@implementation PKMaskedPANSuffixView

- (PKMaskedPANSuffixView)initWithSuffix:(id)a3 foregroundColor:(id)a4
{
  uint64_t v5 = sub_1A03B4988();
  return (PKMaskedPANSuffixView *)MaskedPANSuffixView.init(suffix:foregroundColor:)(v5, v6, a4);
}

- (PKMaskedPANSuffixView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR___PKMaskedPANSuffixView_fontSize;
  id v5 = a3;
  PKPaymentPassPANSuffixFontSize();
  *(Class *)((char *)&self->super.super.super.isa + v4) = v6;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKMaskedPANSuffixView_viewSpacing) = (Class)0x4018000000000000;

  result = (PKMaskedPANSuffixView *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_19FADF688(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MaskedPANSuffixView();
  id v2 = v3.receiver;
  [(PKMaskedPANSuffixView *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  sub_19FADF828(0);
}

- (PKMaskedPANSuffixView)initWithFrame:(CGRect)a3
{
  CGSize result = (PKMaskedPANSuffixView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKMaskedPANSuffixView_suffixLabel);
}

@end