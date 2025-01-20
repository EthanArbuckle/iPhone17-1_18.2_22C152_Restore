@interface UIPickerContentView
+ (double)_checkmarkOffset;
- (BOOL)_isSelectable;
- (BOOL)isChecked;
- (BOOL)isHighlighted;
- (UILabel)titleLabel;
- (double)labelWidthForBounds:(CGRect)a3;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation UIPickerContentView

+ (double)_checkmarkOffset
{
  return 15.0;
}

- (BOOL)isChecked
{
  return *(unsigned char *)&self->_pickerContentViewFlags & 1;
}

- (void)setChecked:(BOOL)a3
{
  *(unsigned char *)&self->_pickerContentViewFlags = *(unsigned char *)&self->_pickerContentViewFlags & 0xFE | a3;
  checkView = self->_checkView;
  if (a3)
  {
    if (!checkView)
    {
      v5 = [UIImageView alloc];
      v6 = -[UIImageView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v7 = self->_checkView;
      self->_checkView = v6;

      v8 = _UIImageWithName(@"UIPreferencesBlueCheck.png");
      v9 = [(UIView *)self tintColor];
      v10 = [v8 _flatImageWithColor:v9];

      [(UIImageView *)self->_checkView setImage:v10];
      v11 = +[UIColor clearColor];
      [(UIImageView *)self->_checkView setBackgroundColor:v11];

      [(UIView *)self addSubview:self->_checkView];
      [(UIView *)self setNeedsLayout];

      checkView = self->_checkView;
    }
    [(UIImageView *)checkView setHidden:0];
    uint64_t v12 = [(UIPickerContentView *)self checkedColor];
  }
  else
  {
    [(UIImageView *)checkView setHidden:1];
    uint64_t v12 = +[UIColor labelColor];
  }
  id v14 = (id)v12;
  v13 = [(UIPickerContentView *)self titleLabel];
  [v13 setTextColor:v14];
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = [(UIView *)self traitCollection];
    v5 = +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", [v4 userInterfaceIdiom]);

    [(UIView *)self bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    id v14 = [UILabel alloc];
    v25.origin.x = v7;
    v25.origin.y = v9;
    v25.size.width = v11;
    v25.size.height = v13;
    CGFloat v15 = CGRectGetMaxX(v25) + -43.0;
    v26.origin.x = v7;
    v26.origin.y = v9;
    v26.size.width = v11;
    v26.size.height = v13;
    v16 = -[UILabel initWithFrame:](v14, "initWithFrame:", 43.0, 0.0, v15, CGRectGetHeight(v26));
    v17 = self->_titleLabel;
    self->_titleLabel = v16;

    if (*(unsigned char *)&self->_pickerContentViewFlags) {
      [(UIPickerContentView *)self checkedColor];
    }
    else {
    v18 = +[UIColor labelColor];
    }
    [(UILabel *)self->_titleLabel setTextColor:v18];

    v19 = +[UIColor clearColor];
    [(UIView *)self->_titleLabel setBackgroundColor:v19];

    v20 = [(UIView *)self traitCollection];
    v21 = [v5 nonCenterCellFontWithTraitCollection:v20];
    [(UILabel *)self->_titleLabel setFont:v21];

    [(UILabel *)self->_titleLabel setHighlighted:(*(unsigned char *)&self->_pickerContentViewFlags >> 1) & 1];
    v22 = +[UIColor clearColor];
    [(UIView *)self->_titleLabel setBackgroundColor:v22];

    [(UILabel *)self->_titleLabel setBaselineAdjustment:1];
    [(UIView *)self addSubview:self->_titleLabel];
    [(UIView *)self setNeedsLayout];

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (void)layoutSubviews
{
  checkView = self->_checkView;
  if (checkView)
  {
    v4 = [(UIImageView *)checkView image];
    [v4 size];
    double v6 = v5;
    double v8 = v7;

    [(UIView *)self bounds];
    -[UIImageView setFrame:](self->_checkView, "setFrame:", 15.0, round(v10 + (v9 - v8) * 0.5), v6, v8);
  }
  if (self->_titleLabel)
  {
    [(UIView *)self bounds];
    CGFloat x = v19.origin.x;
    CGFloat y = v19.origin.y;
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
    double v15 = CGRectGetMaxX(v19) + -43.0;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    double v16 = CGRectGetHeight(v20);
    titleLabel = self->_titleLabel;
    -[UILabel setFrame:](titleLabel, "setFrame:", 43.0, 0.0, v15, v16);
  }
}

- (BOOL)isHighlighted
{
  return (*(unsigned char *)&self->_pickerContentViewFlags >> 1) & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_pickerContentViewFlags = *(unsigned char *)&self->_pickerContentViewFlags & 0xFD | v3;
}

- (double)labelWidthForBounds:(CGRect)a3
{
  return CGRectGetWidth(a3) + -43.0;
}

- (BOOL)_isSelectable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end