@interface TUIPressAndHoldViewCell
+ (id)reuseIdentifier;
- (NSString)accentVariant;
- (TUIPressAndHoldViewCell)initWithFrame:(CGRect)a3;
- (UILabel)accentVariantNumberLabel;
- (UILabel)textLabel;
- (int64_t)alignment;
- (unint64_t)accentVariantNumber;
- (void)layoutSubviews;
- (void)setAccentVariant:(id)a3;
- (void)setAccentVariantNumber:(unint64_t)a3;
- (void)setAccentVariantNumberLabel:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setTextLabel:(id)a3;
- (void)updateColors;
- (void)updateLabels;
@end

@implementation TUIPressAndHoldViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accentVariantNumberLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_accentVariant, 0);
}

- (void)setAccentVariantNumberLabel:(id)a3
{
}

- (UILabel)accentVariantNumberLabel
{
  return self->_accentVariantNumberLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (unint64_t)accentVariantNumber
{
  return self->_accentVariantNumber;
}

- (NSString)accentVariant
{
  return self->_accentVariant;
}

- (void)updateColors
{
  if (([(TUIPressAndHoldViewCell *)self isSelected] & 1) != 0
    || ([(TUIPressAndHoldViewCell *)self isHighlighted] & 1) != 0)
  {
    v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
    char v4 = 1;
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] clearColor];
    char v4 = 0;
  }
  [(TUIPressAndHoldViewCell *)self setBackgroundColor:v3];

  v5 = [(TUIPressAndHoldViewCell *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  if (v6 == 2)
  {
    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_textLabel setTextColor:v7];

    if ((v4 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_10:
    uint64_t v9 = [MEMORY[0x1E4FB1618] whiteColor];
    goto LABEL_13;
  }
  if (v4)
  {
    v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_textLabel setTextColor:v8];

    goto LABEL_10;
  }
  v10 = [MEMORY[0x1E4FB1618] blackColor];
  [(UILabel *)self->_textLabel setTextColor:v10];

LABEL_12:
  uint64_t v9 = [MEMORY[0x1E4FB1618] systemGrayColor];
LABEL_13:
  id v11 = (id)v9;
  [(UILabel *)self->_accentVariantNumberLabel setTextColor:v9];
}

- (void)updateLabels
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v3 = [(TUIPressAndHoldViewCell *)self accentVariant];

  if (v3)
  {
    [(TUIPressAndHoldViewCell *)self bounds];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    CGFloat v6 = v5 + v4;
    CGFloat v8 = *MEMORY[0x1E4FB2848] + v7;
    CGFloat v10 = v9 - (v4 + *(double *)(MEMORY[0x1E4FB2848] + 24));
    CGFloat v12 = v11 - (*MEMORY[0x1E4FB2848] + *(double *)(MEMORY[0x1E4FB2848] + 16));
    uint64_t v25 = *MEMORY[0x1E4FB06F8];
    v13 = [(UILabel *)self->_textLabel font];
    v26[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

    v15 = [(UILabel *)self->_textLabel text];
    [v15 sizeWithAttributes:v14];
    double v17 = v16;

    v18 = [(UILabel *)self->_textLabel text];
    [v18 sizeWithAttributes:v14];
    double v20 = v19;

    v27.origin.x = v6;
    v27.origin.y = v8;
    v27.size.width = v10;
    v27.size.height = v12;
    double v21 = CGRectGetMinY(v27) + 3.0;
    [(TUIPressAndHoldViewCell *)self bounds];
    double Width = CGRectGetWidth(v28);
    [(TUIPressAndHoldViewCell *)self bounds];
    double v23 = CGRectGetWidth(v29);
    double v24 = TUIScreenScaleForView(self);
    [(UILabel *)self->_textLabel setFrame:TUIRectIntegralWithScale(0.0, v21, Width, v17, v24)];
    [(UILabel *)self->_accentVariantNumberLabel setFrame:TUIRectIntegralWithScale(0.0, v17 + 3.0 + 3.0, v23, v20, v24)];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUIPressAndHoldViewCell;
  [(TUIPressAndHoldViewCell *)&v3 layoutSubviews];
  [(TUIPressAndHoldViewCell *)self updateLabels];
  [(TUIPressAndHoldViewCell *)self updateColors];
}

- (void)setAccentVariantNumber:(unint64_t)a3
{
  if (self->_accentVariantNumber != a3)
  {
    self->_accentVariantNumber = a3;
    double v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v6 = [v4 stringValue];

    double v5 = [(TUIPressAndHoldViewCell *)self accentVariantNumberLabel];
    [v5 setText:v6];

    [(TUIPressAndHoldViewCell *)self setNeedsLayout];
  }
}

- (void)setAccentVariant:(id)a3
{
  double v5 = (NSString *)a3;
  accentVariant = self->_accentVariant;
  if (accentVariant != v5)
  {
    CGFloat v8 = v5;
    if ((-[NSString isEqual:](accentVariant, "isEqual:") & 1) == 0)
    {
      objc_storeStrong((id *)&self->_accentVariant, a3);
      if ([(NSString *)v8 length] || self->_textLabel)
      {
        double v7 = [(TUIPressAndHoldViewCell *)self textLabel];
        [v7 setText:v8];
      }
      [(TUIPressAndHoldViewCell *)self setNeedsLayout];
    }
  }
  MEMORY[0x1F4181820]();
}

- (TUIPressAndHoldViewCell)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TUIPressAndHoldViewCell;
  objc_super v3 = -[TUIPressAndHoldViewCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_alignment = 1;
    [(TUIPressAndHoldViewCell *)v3 _setCornerRadius:6.0];
    [(TUIPressAndHoldViewCell *)v4 setClipsToBounds:1];
    id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(TUIPressAndHoldViewCell *)v4 bounds];
    double Width = CGRectGetWidth(v16);
    [(TUIPressAndHoldViewCell *)v4 bounds];
    uint64_t v7 = objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v17));
    textLabel = v4->_textLabel;
    v4->_textLabel = (UILabel *)v7;

    [(UILabel *)v4->_textLabel setAdjustsFontSizeToFitWidth:0];
    [(UILabel *)v4->_textLabel setTextAlignment:1];
    double v9 = [(TUIPressAndHoldViewCell *)v4 contentView];
    [v9 addSubview:v4->_textLabel];

    id v10 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    accentVariantNumberLabel = v4->_accentVariantNumberLabel;
    v4->_accentVariantNumberLabel = (UILabel *)v11;

    [(UILabel *)v4->_accentVariantNumberLabel setTextAlignment:1];
    v13 = [(TUIPressAndHoldViewCell *)v4 contentView];
    [v13 addSubview:v4->_accentVariantNumberLabel];
  }
  return v4;
}

+ (id)reuseIdentifier
{
  return @"TUIPressAndHoldViewCell";
}

@end