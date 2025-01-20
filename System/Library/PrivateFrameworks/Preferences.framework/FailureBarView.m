@interface FailureBarView
- (CGSize)sizeThatFits:(CGSize)a3;
- (FailureBarView)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (void)layoutSubviews;
- (void)setFailureCount:(int64_t)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation FailureBarView

- (FailureBarView)initWithFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)FailureBarView;
  v5 = -[FailureBarView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F42A80];
    v7 = [MEMORY[0x1E4F428B8] systemRedColor];
    v8 = [v6 circleImageWithDiameter:v7 color:27.0];

    if (!v8)
    {
      v9 = (void *)MEMORY[0x1E4F42A80];
      v10 = PSPreferencesFrameworkBundle();
      v8 = [v9 imageNamed:@"PasscodeFailure" inBundle:v10];
    }
    v11 = [v8 stretchableImageWithLeftCapWidth:13 topCapHeight:13];
    [(FailureBarView *)v5 setImage:v11];
    [v11 size];
    double v13 = v12;
    double v15 = v14;
    -[FailureBarView setFrame:](v5, "setFrame:", x, y, v12, v14);
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", x, y, v13, v15);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v16;

    v18 = v5->_titleLabel;
    v19 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v18 setFont:v19];

    v20 = v5->_titleLabel;
    v21 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UILabel *)v20 setTextColor:v21];

    v22 = v5->_titleLabel;
    v23 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v22 setBackgroundColor:v23];

    [(UILabel *)v5->_titleLabel setTextAlignment:1];
    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    [(UILabel *)v5->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(FailureBarView *)v5 addSubview:v5->_titleLabel];
  }
  return v5;
}

- (void)setFailureCount:(int64_t)a3
{
  id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = @"FAILURES";
  if (a3 == 1) {
    v5 = @"FAILURE";
  }
  v6 = v5;
  v7 = [v14 localizedStringForKey:v6 value:&stru_1EFB51FD0 table:@"PIN Entry"];
  if (v7 == v6)
  {
    PS_LocalizedStringForPINEntry(v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  titleLabel = self->_titleLabel;
  v9 = NSString;
  v10 = (void *)MEMORY[0x1E4F28EE0];
  v11 = [MEMORY[0x1E4F28ED0] numberWithLong:a3];
  double v12 = [v10 localizedStringFromNumber:v11 numberStyle:1];
  double v13 = objc_msgSend(v9, "stringWithFormat:", v7, v12);
  [(UILabel *)titleLabel setText:v13];

  [(FailureBarView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)FailureBarView;
  [(FailureBarView *)&v12 layoutSubviews];
  v3 = [(FailureBarView *)self image];
  double v4 = (double)[v3 leftCapWidth] + 5.0;

  [(FailureBarView *)self bounds];
  double v6 = v5 + v4 * -2.0;
  double v8 = v7 + -2.0;
  double v9 = (v5 - v6) * 0.5;
  double v10 = (v7 - (v7 + -2.0)) * 0.5;
  v11 = [(FailureBarView *)self titleLabel];
  objc_msgSend(v11, "setFrame:", v9, v10, v6, v8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, a3.height);
  double v6 = v5 + 26.0;
  if (v6 >= width) {
    double v6 = width;
  }
  double v7 = v4 + 4.0;
  result.height = v7;
  result.double width = v6;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end