@interface MTCountInfoButton
- (CGSize)buttonSize;
- (CGSize)labelSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTCountInfoButton)initWithFrame:(CGRect)a3;
- (MTTouchInsetsButton)button;
- (UIColor)textColor;
- (UIFont)font;
- (UILabel)label;
- (id)_createLabelTextForCurrentState;
- (unint64_t)count;
- (unint64_t)index;
- (void)_updateLabelText;
- (void)buttonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setFont:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setIndex:(unint64_t)a3 forCount:(unint64_t)a4;
- (void)setLabel:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation MTCountInfoButton

- (MTCountInfoButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTCountInfoButton;
  v3 = -[MTCountInfoButton initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MTCountInfoButton *)v3 button];
    [(MTCountInfoButton *)v4 addSubview:v5];

    v6 = [(MTCountInfoButton *)v4 label];
    [(MTCountInfoButton *)v4 addSubview:v6];
  }
  return v4;
}

- (void)setIndex:(unint64_t)a3 forCount:(unint64_t)a4
{
  if (self->_index != a3)
  {
    self->_index = a3;
    p_count = &self->_count;
    if (self->_count == a4)
    {
_objc_msgSend$_updateLabelText:
      [(MTCountInfoButton *)self _updateLabelText];
      return;
    }
LABEL_5:
    unint64_t *p_count = a4;
    goto _objc_msgSend$_updateLabelText;
  }
  p_count = &self->_count;
  if (self->_count != a4) {
    goto LABEL_5;
  }
}

- (void)setIndex:(unint64_t)a3
{
  if (self->_index != a3)
  {
    self->_index = a3;
    [(MTCountInfoButton *)self _updateLabelText];
  }
}

- (void)setCount:(unint64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    [(MTCountInfoButton *)self _updateLabelText];
  }
}

- (UIFont)font
{
  v2 = [(MTCountInfoButton *)self label];
  v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  v5 = [(MTCountInfoButton *)self label];
  [v5 setFont:v4];

  v6 = [(MTCountInfoButton *)self label];
  [v6 sizeToFit];

  [(MTCountInfoButton *)self setNeedsLayout];
}

- (UIColor)textColor
{
  v2 = [(MTCountInfoButton *)self label];
  v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(MTCountInfoButton *)self label];
  [v5 setTextColor:v4];
}

- (void)_updateLabelText
{
  v3 = [(MTCountInfoButton *)self _createLabelTextForCurrentState];
  id v4 = [(MTCountInfoButton *)self label];
  [v4 setText:v3];

  id v5 = [(MTCountInfoButton *)self label];
  [v5 sizeToFit];

  [(MTCountInfoButton *)self setNeedsLayout];
}

- (id)_createLabelTextForCurrentState
{
  if ([(MTCountInfoButton *)self index] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"%@ of %@" value:&stru_10056A8A0 table:0];
    v6 = +[NSNumber numberWithUnsignedInteger:(char *)[(MTCountInfoButton *)self index] + 1];
    v7 = IMAccessibilityLocalizedNumber();
    unint64_t v8 = [(MTCountInfoButton *)self count];
    if (v8 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    v10 = +[NSNumber numberWithUnsignedInteger:v9];
    v11 = IMAccessibilityLocalizedNumber();
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7, v11);
  }

  return v3;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)MTCountInfoButton;
  [(MTCountInfoButton *)&v18 layoutSubviews];
  [(MTCountInfoButton *)self bounds];
  [(MTCountInfoButton *)self buttonSize];
  double v4 = v3;
  double v6 = v5;
  IMRoundToPixel();
  double v8 = v7;
  uint64_t v9 = [(MTCountInfoButton *)self button];
  [v9 setFrame:v8, 0.0, v4, v6];

  [(MTCountInfoButton *)self labelSize];
  double v11 = v10;
  double v13 = v12;
  IMRoundToPixel();
  double v15 = v14;
  v19.origin.y = 0.0;
  v19.origin.x = v8;
  v19.size.width = v4;
  v19.size.height = v6;
  CGFloat v16 = CGRectGetMaxY(v19) + 5.0;
  v17 = [(MTCountInfoButton *)self label];
  [v17 setFrame:v15, v16, v11, v13];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(MTCountInfoButton *)self buttonSize];
  double v5 = v4;
  double v7 = v6;
  [(MTCountInfoButton *)self labelSize];
  if (v5 >= v8) {
    double v8 = v5;
  }
  double v10 = v7 + 5.0 + v9;
  result.height = v10;
  result.width = v8;
  return result;
}

- (CGSize)buttonSize
{
  v2 = [(MTCountInfoButton *)self button];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)labelSize
{
  v2 = [(MTCountInfoButton *)self label];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)buttonTapped:(id)a3
{
}

- (MTTouchInsetsButton)button
{
  button = self->_button;
  if (!button)
  {
    double v4 = +[MTTouchInsetsButton buttonWithType:1];
    double v5 = self->_button;
    self->_button = v4;

    double v6 = self->_button;
    double v7 = +[UIImage infoIcon];
    [(MTTouchInsetsButton *)v6 setImage:v7 forState:0];

    -[MTTouchInsetsButton setTouchInsets:](self->_button, "setTouchInsets:", -15.0, -8.0, -15.0, -15.0);
    [(MTTouchInsetsButton *)self->_button addTarget:self action:"buttonTapped:" forControlEvents:64];
    [(MTTouchInsetsButton *)self->_button sizeToFit];
    button = self->_button;
  }

  return button;
}

- (UILabel)label
{
  label = self->_label;
  if (!label)
  {
    double v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    double v5 = self->_label;
    self->_label = v4;

    double v6 = [(MTCountInfoButton *)self font];
    [(UILabel *)self->_label setFont:v6];

    double v7 = [(MTCountInfoButton *)self textColor];
    [(UILabel *)self->_label setTextColor:v7];

    label = self->_label;
  }

  return label;
}

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setButton:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end