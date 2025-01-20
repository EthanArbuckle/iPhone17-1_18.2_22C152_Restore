@interface MTCountChevronView
- (CGRect)_chevronFrameForViewSize:(CGSize)a3;
- (CGRect)_countFrameForViewSize:(CGSize)a3;
- (CGSize)_chevronSize;
- (CGSize)_countSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTChevronView)chevronView;
- (MTCountChevronView)initWithFrame:(CGRect)a3;
- (NSNumber)count;
- (UIColor)textColor;
- (UIFont)font;
- (UILabel)countLabel;
- (void)_updateCurrentTextColor;
- (void)layoutSubviews;
- (void)setChevronView:(id)a3;
- (void)setCount:(id)a3;
- (void)setCountLabel:(id)a3;
- (void)setFont:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation MTCountChevronView

- (MTCountChevronView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTCountChevronView;
  v3 = -[MTCountChevronView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MTCountChevronView *)v3 countLabel];
    [(MTCountChevronView *)v4 addSubview:v5];

    v6 = [(MTCountChevronView *)v4 chevronView];
    [(MTCountChevronView *)v4 addSubview:v6];
  }
  return v4;
}

- (void)setCount:(id)a3
{
  v5 = (NSNumber *)a3;
  count = self->_count;
  if (count != v5)
  {
    v9 = v5;
    if (!v5
      || (count = (NSNumber *)[(NSNumber *)count isEqualToNumber:v5],
          v5 = v9,
          (count & 1) == 0))
    {
      objc_storeStrong((id *)&self->_count, a3);
      if ([(NSNumber *)v9 longLongValue] < 0)
      {
        v7 = @"!";
      }
      else if ([(NSNumber *)v9 unsignedLongLongValue])
      {
        v7 = +[NSString localizedStringWithFormat:@"%lu", [(NSNumber *)v9 unsignedIntegerValue]];
      }
      else
      {
        v7 = 0;
      }
      objc_super v8 = [(MTCountChevronView *)self countLabel];
      [v8 setText:v7];

      [(MTCountChevronView *)self _updateCurrentTextColor];
      [(MTCountChevronView *)self setNeedsLayout];

      v5 = v9;
    }
  }

  _objc_release_x1(count, v5);
}

- (UIFont)font
{
  v2 = [(MTCountChevronView *)self countLabel];
  v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  v5 = [(MTCountChevronView *)self countLabel];
  [v5 setFont:v4];

  [(MTCountChevronView *)self setNeedsLayout];
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);

  [(MTCountChevronView *)self _updateCurrentTextColor];
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)MTCountChevronView;
  [(MTCountChevronView *)&v25 layoutSubviews];
  [(MTCountChevronView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[MTCountChevronView _countFrameForViewSize:](self, "_countFrameForViewSize:", v3, v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(MTCountChevronView *)self countLabel];
  [v15 setFrame:v8, v10, v12, v14];

  -[MTCountChevronView _chevronFrameForViewSize:](self, "_chevronFrameForViewSize:", v4, v6);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(MTCountChevronView *)self chevronView];
  [v24 setFrame:v17, v19, v21, v23];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(MTCountChevronView *)self _countSize];
  double v5 = v4;
  double v7 = v6;
  [(MTCountChevronView *)self _chevronSize];
  double v10 = v5 + 14.0 + v9;
  if (v7 >= v8) {
    double v8 = v7;
  }
  result.height = v8;
  result.width = v10;
  return result;
}

- (void)_updateCurrentTextColor
{
  id v5 = [(MTCountChevronView *)self count];
  if (((unint64_t)[v5 longLongValue] & 0x8000000000000000) != 0) {
    [(MTCountChevronView *)self tintColor];
  }
  else {
  double v3 = [(MTCountChevronView *)self textColor];
  }
  double v4 = [(MTCountChevronView *)self countLabel];
  [v4 setTextColor:v3];
}

- (CGRect)_chevronFrameForViewSize:(CGSize)a3
{
  double width = a3.width;
  [(MTCountChevronView *)self _chevronSize];
  double v6 = v5;
  double v8 = v7;
  IMRoundToPixel();
  double v10 = v9;
  unsigned int v11 = [(MTCountChevronView *)self mt_isRTL];
  double v12 = width - v6;
  if (v11) {
    double v12 = 0.0;
  }
  double v13 = v10;
  double v14 = v6;
  double v15 = v8;
  result.size.height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)_chevronSize
{
  v2 = [(MTCountChevronView *)self chevronView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)_countSize
{
  v2 = [(MTCountChevronView *)self countLabel];
  [v2 sizeThatFits:1.79769313e308, 1.79769313e308];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.double width = v7;
  return result;
}

- (CGRect)_countFrameForViewSize:(CGSize)a3
{
  double width = a3.width;
  [(MTCountChevronView *)self _countSize];
  double v6 = v5;
  double v8 = v7;
  IMRoundToPixel();
  double v10 = v9;
  unsigned int v11 = [(MTCountChevronView *)self mt_isRTL];
  double v12 = width - v6;
  if (!v11) {
    double v12 = 0.0;
  }
  double v13 = v10;
  double v14 = v6;
  double v15 = v8;
  result.size.height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UILabel)countLabel
{
  countLabel = self->_countLabel;
  if (!countLabel)
  {
    double v4 = (UILabel *)objc_opt_new();
    double v5 = self->_countLabel;
    self->_countLabel = v4;

    double v6 = [(MTCountChevronView *)self font];
    [(UILabel *)self->_countLabel setFont:v6];

    double v7 = [(MTCountChevronView *)self textColor];
    [(UILabel *)self->_countLabel setTextColor:v7];

    countLabel = self->_countLabel;
  }

  return countLabel;
}

- (MTChevronView)chevronView
{
  chevronView = self->_chevronView;
  if (!chevronView)
  {
    double v4 = (MTChevronView *)objc_opt_new();
    double v5 = self->_chevronView;
    self->_chevronView = v4;

    [(MTChevronView *)self->_chevronView sizeToFit];
    chevronView = self->_chevronView;
  }

  return chevronView;
}

- (NSNumber)count
{
  return self->_count;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setCountLabel:(id)a3
{
}

- (void)setChevronView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_count, 0);
}

@end