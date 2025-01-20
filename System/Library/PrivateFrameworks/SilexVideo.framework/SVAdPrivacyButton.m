@interface SVAdPrivacyButton
+ (CGSize)size;
+ (double)height;
+ (id)font;
+ (id)title;
- (BOOL)isAccessibilityElement;
- (CGSize)intrinsicContentSize;
- (SVAdPrivacyButton)initWithFrame:(CGRect)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel;
@end

@implementation SVAdPrivacyButton

+ (id)title
{
  v2 = SVBundle();
  v3 = [v2 localizedStringForKey:@"Ad" value:&stru_26D969BC8 table:0];

  return v3;
}

+ (id)font
{
  v2 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D280]];
  v3 = [MEMORY[0x263F1C658] systemFontOfSize:13.0 weight:*MEMORY[0x263F1D340]];
  v4 = [v2 scaledFontForFont:v3];

  return v4;
}

+ (double)height
{
  v2 = [a1 font];
  [v2 capHeight];
  double v4 = round(v3) + 12.0;

  return v4;
}

+ (CGSize)size
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = +[SVAdPrivacyButton title];
  uint64_t v10 = *MEMORY[0x263F1C238];
  double v3 = +[SVAdPrivacyButton font];
  v11[0] = v3;
  double v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v2 sizeWithAttributes:v4];
  double v6 = v5;

  +[SVAdPrivacyButton height];
  double v8 = v7;
  double v9 = v6 + 12.0;
  result.height = v8;
  result.width = v9;
  return result;
}

- (SVAdPrivacyButton)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SVAdPrivacyButton;
  double v3 = -[SVButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    double v5 = [(SVAdPrivacyButton *)v3 titleLabel];
    [v5 setAdjustsFontForContentSizeCategory:1];

    double v6 = +[SVAdPrivacyButton title];
    [(SVAdPrivacyButton *)v4 setTitle:v6 forState:0];

    double v7 = +[SVAdPrivacyButton font];
    double v8 = [(SVAdPrivacyButton *)v4 titleLabel];
    [v8 setFont:v7];

    double v9 = [(SVAdPrivacyButton *)v4 titleLabel];
    [v9 setTextAlignment:1];

    uint64_t v10 = [MEMORY[0x263F1C550] whiteColor];
    [(SVAdPrivacyButton *)v4 setTitleColor:v10 forState:0];

    v11 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.2];
    [(SVAdPrivacyButton *)v4 setTitleColor:v11 forState:1];

    v12 = [MEMORY[0x263F1C550] systemTealColor];
    [(SVAdPrivacyButton *)v4 setBackgroundColor:v12];

    [(SVAdPrivacyButton *)v4 _setContinuousCornerRadius:6.0];
    -[SVButton setTouchInsets:](v4, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  +[SVAdPrivacyButton height];
  double v4 = v3;
  double v5 = [(SVAdPrivacyButton *)self titleLabel];
  [v5 intrinsicContentSize];
  double v7 = v6 + 14.0;

  double v8 = v7;
  double v9 = v4;
  result.height = v9;
  result.width = v8;
  return result;
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
  v2 = [(SVAdPrivacyButton *)self titleLabel];
  double v3 = [v2 text];

  return v3;
}

@end