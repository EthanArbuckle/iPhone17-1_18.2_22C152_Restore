@interface PKPeerPaymentMessagesRoundedButton
+ (CGSize)referenceSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPeerPaymentMessagesRoundedButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PKPeerPaymentMessagesRoundedButton

+ (CGSize)referenceSize
{
  double v2 = 164.0;
  double v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKPeerPaymentMessagesRoundedButton)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesRoundedButton;
  double v3 = -[PKPeerPaymentMessagesButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[PKPeerPaymentTheme primaryTextColor];
    [(PKPeerPaymentMessagesRoundedButton *)v3 setTitleColor:v4 forState:0];

    v5 = +[PKPeerPaymentTheme disabledTextColor];
    [(PKPeerPaymentMessagesRoundedButton *)v3 setTitleColor:v5 forState:2];

    v6 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
    v7 = [v6 fontDescriptorWithSymbolicTraits:2];

    v8 = [(PKPeerPaymentMessagesRoundedButton *)v3 titleLabel];
    v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:0.0];
    [v8 setFont:v9];

    [(PKPeerPaymentMessagesButton *)v3 setHighlighted:0];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentMessagesRoundedButton;
  -[PKPeerPaymentMessagesRoundedButton sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, 50.0);
  double v4 = v3 + 32.0;
  if (v4 < 164.0) {
    double v4 = 164.0;
  }
  double v5 = 50.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessagesRoundedButton;
  [(PKPeerPaymentMessagesButton *)&v3 layoutSubviews];
  [(PKPeerPaymentMessagesRoundedButton *)self bounds];
  PKFloatRoundToPixel();
  -[PKPeerPaymentMessagesRoundedButton _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
}

@end