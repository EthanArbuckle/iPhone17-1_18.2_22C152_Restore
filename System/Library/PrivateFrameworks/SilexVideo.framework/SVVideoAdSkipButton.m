@interface SVVideoAdSkipButton
- (CGSize)intrinsicContentSize;
- (SVVideoAdSkipButton)initWithFrame:(CGRect)a3;
- (id)titleForDuration:(unint64_t)a3;
- (unint64_t)skipDuration;
- (void)setSkipDuration:(unint64_t)a3;
@end

@implementation SVVideoAdSkipButton

- (SVVideoAdSkipButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SVVideoAdSkipButton;
  v3 = -[SVButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SVVideoAdSkipButton *)v3 titleForDuration:0];
    [(SVVideoAdSkipButton *)v4 setAttributedTitle:v5 forState:0];
    [(SVVideoAdSkipButton *)v4 setEnabled:0];
    -[SVButton setTouchInsets:](v4, "setTouchInsets:", 10.0, 10.0, 10.0, 10.0);
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(SVVideoAdSkipButton *)self titleLabel];
  v4 = [v3 font];
  [v4 capHeight];
  double v6 = round(v5) + 12.0;

  objc_super v7 = [(SVVideoAdSkipButton *)self titleLabel];
  [v7 intrinsicContentSize];
  double v9 = v8 + 6.0;

  double v10 = v9;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setSkipDuration:(unint64_t)a3
{
  self->_skipDuration = a3;
  [(SVVideoAdSkipButton *)self setEnabled:a3 == 0];
  id v5 = [(SVVideoAdSkipButton *)self titleForDuration:a3];
  [(SVVideoAdSkipButton *)self setAttributedTitle:v5 forState:0];
}

- (id)titleForDuration:(unint64_t)a3
{
  unint64_t v4 = a3 + 1;
  id v5 = SVBundle();
  double v6 = v5;
  if (v4 > 1)
  {
    double v9 = [v5 localizedStringForKey:@"Skip in %lu" value:&stru_26D969BC8 table:0];

    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", v9, a3);
    double v8 = [MEMORY[0x263F1C550] colorWithRed:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.6];
  }
  else
  {
    uint64_t v7 = [v5 localizedStringForKey:@"Skip" value:&stru_26D969BC8 table:0];

    double v8 = [MEMORY[0x263F1C550] whiteColor];
  }
  v21 = (void *)v7;
  double v10 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v7];
  v23 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D280]];
  double v11 = [MEMORY[0x263F1C658] systemFontOfSize:13.0 weight:*MEMORY[0x263F1D340]];
  v22 = [v23 scaledFontForFont:v11];

  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x263F1C238], v22, 0, objc_msgSend(v10, "length"));
  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x263F1C240], v8, 0, objc_msgSend(v10, "length"));
  id v12 = objc_alloc_init(MEMORY[0x263F1C370]);
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, 3.0, 0.0);
  v13 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v12];
  [v10 appendAttributedString:v13];
  v14 = [MEMORY[0x263F1C6C8] configurationWithPointSize:6 weight:13.0];
  v15 = [MEMORY[0x263F1C6B0] systemImageNamed:@"forward.end.fill" withConfiguration:v14];
  v16 = [v15 imageWithTintColor:v8];

  id v17 = objc_alloc_init(MEMORY[0x263F1C370]);
  [v17 setImage:v16];
  v18 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v17];
  [v10 appendAttributedString:v18];
  id v19 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v19 setAlignment:1];
  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x263F1C268], v19, 0, objc_msgSend(v10, "length"));

  return v10;
}

- (unint64_t)skipDuration
{
  return self->_skipDuration;
}

@end