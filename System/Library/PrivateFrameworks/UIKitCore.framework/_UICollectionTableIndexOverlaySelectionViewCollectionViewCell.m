@interface _UICollectionTableIndexOverlaySelectionViewCollectionViewCell
- (NSString)text;
- (UIButton)button;
- (UILabel)label;
- (_UICollectionTableIndexOverlaySelectionViewCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)rightMargin;
- (int64_t)textAlignment;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setRightMargin:(double)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)tintColorDidChange;
@end

@implementation _UICollectionTableIndexOverlaySelectionViewCollectionViewCell

- (_UICollectionTableIndexOverlaySelectionViewCollectionViewCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionTableIndexOverlaySelectionViewCollectionViewCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIButton buttonWithType:0];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    v6 = v3->_button;
    [(UIView *)v3 bounds];
    -[UIButton setFrame:](v6, "setFrame:");
    v7 = [(UIButton *)v3->_button titleLabel];
    v8 = [off_1E52D39B8 systemFontOfSize:16.0];
    [v7 setFont:v8];

    v9 = [(UIButton *)v3->_button titleLabel];
    [v9 setTextAlignment:1];

    [(UIView *)v3 addSubview:v3->_button];
    v3->_rightMarginAdjusted = 0;
  }
  return v3;
}

- (void)tintColorDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionTableIndexOverlaySelectionViewCollectionViewCell;
  [(UIView *)&v8 tintColorDidChange];
  v3 = [(_UICollectionTableIndexOverlaySelectionViewCollectionViewCell *)self button];
  uint64_t v4 = [(UIView *)self tintColor];
  [v3 setTitleColor:v4 forState:0];

  v5 = [(_UICollectionTableIndexOverlaySelectionViewCollectionViewCell *)self button];
  v6 = [(UIView *)self tintColor];
  v7 = [v6 colorWithAlphaComponent:0.5];
  [v5 setTitleColor:v7 forState:1];
}

- (void)layoutSubviews
{
  button = self->_button;
  if (self->_rightMarginAdjusted)
  {
    [(UIView *)self->_button sizeToFit];
    [(UIView *)self->_button bounds];
    double v5 = v4;
    double v7 = v6;
    [(UIView *)self bounds];
    double v10 = v9 + (v8 - v7) * 0.5;
    [(UIView *)self bounds];
    double v12 = v11 - v5;
    if (![(UIView *)self _shouldReverseLayoutDirection]) {
      double v12 = v12 - self->_rightMargin;
    }
    double v13 = round(v10);
    button = self->_button;
  }
  else
  {
    [(UIView *)self bounds];
    double v12 = v14;
    double v5 = v15;
    double v7 = v16;
  }
  -[UIButton setFrame:](button, "setFrame:", v12, v13, v5, v7);
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionTableIndexOverlaySelectionViewCollectionViewCell;
  id v4 = a3;
  [(UICollectionReusableView *)&v7 applyLayoutAttributes:v4];
  objc_msgSend(v4, "rightMargin", v7.receiver, v7.super_class);
  double v6 = v5;

  [(_UICollectionTableIndexOverlaySelectionViewCollectionViewCell *)self setRightMargin:v6];
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return [(UIButton *)self->_button currentTitle];
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4 = [(UIButton *)self->_button titleLabel];
  [v4 setTextAlignment:a3];
}

- (int64_t)textAlignment
{
  v2 = [(UIButton *)self->_button titleLabel];
  int64_t v3 = [v2 textAlignment];

  return v3;
}

- (void)setRightMargin:(double)a3
{
  if (a3 != 0.0)
  {
    self->_rightMarginAdjusted = 1;
    self->_rightMargin = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (UILabel)label
{
  return [(UIButton *)self->_button titleLabel];
}

- (UIButton)button
{
  return (UIButton *)objc_getProperty(self, a2, 640, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapTarget, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end