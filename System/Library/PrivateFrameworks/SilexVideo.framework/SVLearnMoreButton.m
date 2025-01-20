@interface SVLearnMoreButton
- (BOOL)isAccessibilityElement;
- (CGSize)intrinsicContentSize;
- (SVLearnMoreButton)initWithFrame:(CGRect)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SVLearnMoreButton

- (SVLearnMoreButton)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)SVLearnMoreButton;
  v3 = -[SVButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v21 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D280]];
    v4 = [MEMORY[0x263F1C658] systemFontOfSize:13.0 weight:*MEMORY[0x263F1D340]];
    v20 = [v21 scaledFontForFont:v4];

    v5 = SVBundle();
    v6 = [v5 localizedStringForKey:@"Learn More" value:&stru_26D969BC8 table:0];

    v7 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6];
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x263F1C238], v20, 0, objc_msgSend(v6, "length"));
    uint64_t v8 = *MEMORY[0x263F1C240];
    v9 = [MEMORY[0x263F1C550] whiteColor];
    objc_msgSend(v7, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v6, "length"));

    id v10 = objc_alloc_init(MEMORY[0x263F1C370]);
    objc_msgSend(v10, "setBounds:", 0.0, 0.0, 3.0, 0.0);
    v19 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v10];
    [v7 appendAttributedString:v19];
    v11 = [MEMORY[0x263F1C6C8] configurationWithPointSize:6 weight:13.0];
    v12 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.right" withConfiguration:v11];
    v13 = [MEMORY[0x263F1C550] colorWithRed:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.6];
    v14 = [v12 imageWithTintColor:v13];

    id v15 = objc_alloc_init(MEMORY[0x263F1C370]);
    [v15 setImage:v14];
    v16 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v15];
    [v7 appendAttributedString:v16];
    id v17 = objc_alloc_init(MEMORY[0x263F1C350]);
    [v17 setAlignment:1];
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x263F1C268], v17, 0, objc_msgSend(v7, "length"));
    [(SVLearnMoreButton *)v3 setAttributedTitle:v7 forState:0];
    -[SVButton setTouchInsets:](v3, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SVLearnMoreButton;
  -[SVLearnMoreButton setHighlighted:](&v7, sel_setHighlighted_);
  if (v3) {
    double v5 = 0.2;
  }
  else {
    double v5 = 1.0;
  }
  v6 = [(SVLearnMoreButton *)self titleLabel];
  [v6 setAlpha:v5];
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(SVLearnMoreButton *)self titleLabel];
  v4 = [v3 font];
  [v4 capHeight];
  double v6 = round(v5) + 12.0;

  objc_super v7 = [(SVLearnMoreButton *)self titleLabel];
  [v7 intrinsicContentSize];
  double v9 = v8 + 20.0;

  double v10 = v9;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [(SVLearnMoreButton *)self traitCollection];
  id v11 = [v5 preferredContentSizeCategory];

  double v6 = [v4 preferredContentSizeCategory];

  if (!SVContentSizeCategoryIsEqualToContentSizeCategory(v11, v6))
  {
    objc_super v7 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D280]];
    double v8 = [MEMORY[0x263F1C658] systemFontOfSize:13.0 weight:*MEMORY[0x263F1D340]];
    double v9 = [v7 scaledFontForFont:v8];

    double v10 = [(SVLearnMoreButton *)self titleLabel];
    [v10 setFont:v9];

    [(SVLearnMoreButton *)self invalidateIntrinsicContentSize];
  }
}

- (BOOL)isAccessibilityElement
{
  return ![self svax_shouldBeOccluded];
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  v2 = SVBundle();
  BOOL v3 = [v2 localizedStringForKey:@"Learn More" value:&stru_26D969BC8 table:0];

  return v3;
}

@end