@interface PKPeerPaymentMessagesRoundedRectangleButton
+ (CGSize)referenceSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPeerPaymentMessagesRoundedRectangleButton)init;
- (PKPeerPaymentMessagesRoundedRectangleButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PKPeerPaymentMessagesRoundedRectangleButton

+ (CGSize)referenceSize
{
  int v2 = PKIsPad();
  double v3 = 153.0;
  if (v2) {
    double v3 = 163.0;
  }
  double v4 = 50.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKPeerPaymentMessagesRoundedRectangleButton)init
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(id)objc_opt_class() referenceSize];

  return -[PKPeerPaymentMessagesRoundedRectangleButton initWithFrame:](self, "initWithFrame:", v3, v4, v5, v6);
}

- (PKPeerPaymentMessagesRoundedRectangleButton)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesRoundedRectangleButton;
  double v3 = -[PKPeerPaymentMessagesButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = +[PKPeerPaymentTheme primaryTextColor];
    [(PKPeerPaymentMessagesRoundedRectangleButton *)v3 setTitleColor:v4 forState:0];

    double v5 = +[PKPeerPaymentTheme disabledTextColor];
    [(PKPeerPaymentMessagesRoundedRectangleButton *)v3 setTitleColor:v5 forState:2];

    double v6 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
    v7 = [v6 fontDescriptorWithSymbolicTraits:2];

    v8 = [(PKPeerPaymentMessagesRoundedRectangleButton *)v3 titleLabel];
    v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:0.0];
    [v8 setFont:v9];

    [(PKPeerPaymentMessagesButton *)v3 setHighlighted:0];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesRoundedRectangleButton;
  -[PKPeerPaymentMessagesRoundedRectangleButton sizeThatFits:](&v8, sel_sizeThatFits_, a3.width, 50.0);
  double v4 = v3;
  if (PKIsPad()) {
    double v5 = 163.0;
  }
  else {
    double v5 = 153.0;
  }
  double v6 = v4 + 32.0;
  if (v5 > v4 + 32.0)
  {
    if (PKIsPad()) {
      double v6 = 163.0;
    }
    else {
      double v6 = 153.0;
    }
  }
  double v7 = 50.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessagesRoundedRectangleButton;
  [(PKPeerPaymentMessagesButton *)&v3 layoutSubviews];
  [(PKPeerPaymentMessagesRoundedRectangleButton *)self _setContinuousCornerRadius:12.0];
}

@end