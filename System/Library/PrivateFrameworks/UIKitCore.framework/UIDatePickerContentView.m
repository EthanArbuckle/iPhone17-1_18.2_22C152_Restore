@interface UIDatePickerContentView
- (BOOL)_canBeReusedInPickerView;
- (BOOL)isAmPm;
- (BOOL)useDigitFont;
- (UIDatePickerContentView)initWithFrame:(CGRect)a3;
- (UIDatePickerContentView)initWithMode:(id)a3;
- (UILabel)titleLabel;
- (_UIDatePickerMode)mode;
- (double)titleLabelMaxX;
- (int64_t)titleAlignment;
- (void)layoutSubviews;
- (void)setIsAmPm:(BOOL)a3;
- (void)setMode:(id)a3;
- (void)setTitleAlignment:(int64_t)a3;
- (void)setTitleLabelMaxX:(double)a3;
- (void)setUseDigitFont:(BOOL)a3;
@end

@implementation UIDatePickerContentView

- (UIDatePickerContentView)initWithMode:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDatePickerContentView;
  v5 = [(UIView *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(UIDatePickerContentView *)v5 setMode:v4];
    v7 = v6;
  }

  return v6;
}

- (UIDatePickerContentView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIDatePickerContentView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];

    v3->_titleLabelMaxX = -1.0;
    v5 = [UILabel alloc];
    uint64_t v6 = -[UILabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v6;

    v8 = +[UIColor whiteColor];
    [(UILabel *)v3->_titleLabel setShadowColor:v8];

    -[UILabel setShadowOffset:](v3->_titleLabel, "setShadowOffset:", 0.0, 1.0);
    objc_super v9 = +[UIColor clearColor];
    [(UIView *)v3->_titleLabel setBackgroundColor:v9];

    [(UIView *)v3 addSubview:v3->_titleLabel];
    v10 = v3;
  }

  return v3;
}

- (BOOL)_canBeReusedInPickerView
{
  return 1;
}

- (BOOL)isAmPm
{
  return *(unsigned char *)&self->_datePickerContentViewFlags & 1;
}

- (void)setIsAmPm:(BOOL)a3
{
  *(unsigned char *)&self->_datePickerContentViewFlags = *(unsigned char *)&self->_datePickerContentViewFlags & 0xFE | a3;
  [(UIView *)self setNeedsLayout];
}

- (BOOL)useDigitFont
{
  return (*(unsigned char *)&self->_datePickerContentViewFlags >> 1) & 1;
}

- (void)setUseDigitFont:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_datePickerContentViewFlags = *(unsigned char *)&self->_datePickerContentViewFlags & 0xFD | v3;
}

- (void)setTitleLabelMaxX:(double)a3
{
  self->_titleLabelMaxX = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)setTitleAlignment:(int64_t)a3
{
  self->_titleAlignment = a3;
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:");
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v35[1] = *MEMORY[0x1E4F143B8];
  [(UIView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_titleLabel, "textRectForBounds:limitedToNumberOfLines:", 1);
  double v12 = v11;
  double v14 = v13;
  int64_t titleAlignment = self->_titleAlignment;
  if (titleAlignment == 2)
  {
    uint64_t v34 = *(void *)off_1E52D2040;
    v18 = [(UILabel *)self->_titleLabel font];
    v35[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    [@"00" sizeWithAttributes:v19];
    double v21 = v20;

    v22 = [(UILabel *)self->_titleLabel text];
    unint64_t v23 = [v22 length];

    if (v21 > v12 && v23 < 3) {
      double v12 = v21;
    }
    double v17 = 0.0;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
    {
      v25 = [(UIDatePickerContentView *)self mode];
      int v26 = [v25 isTimeIntervalMode];

      if (v26) {
        double v17 = v8 - v12 + 0.0;
      }
      else {
        double v17 = 0.0;
      }
    }
  }
  else if (titleAlignment)
  {
    double v17 = round(v4 + (v8 - v11) * 0.5);
  }
  else
  {
    double titleLabelMaxX = self->_titleLabelMaxX;
    if (titleLabelMaxX == -1.0)
    {
      v36.origin.x = v4;
      v36.origin.y = v6;
      v36.size.width = v8;
      v36.size.height = v10;
      double titleLabelMaxX = CGRectGetMaxX(v36);
    }
    double v17 = 9.0;
    if (titleLabelMaxX <= 9.0) {
      double v12 = 0.0;
    }
    else {
      double v12 = titleLabelMaxX + -9.0;
    }
  }
  v27 = [(UILabel *)self->_titleLabel font];
  [v27 capHeight];
  double v29 = v28;

  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  double v30 = v29 * 0.5 + CGRectGetMidY(v37);
  [(UILabel *)self->_titleLabel _baselineOffsetFromBottom];
  double v32 = v30 + v31 - v14;
  [(UIView *)self _currentScreenScale];
  [(UILabel *)self->_titleLabel setFrame:UIRectIntegralWithScale(v17, v32, v12, v14, v33)];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (double)titleLabelMaxX
{
  return self->_titleLabelMaxX;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (_UIDatePickerMode)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end