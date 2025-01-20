@interface _UIBadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDictionary)textAttributes;
- (NSString)text;
- (UIColor)badgeColor;
- (UIOffset)textOffset;
- (_UIBadgeView)initWithText:(id)a3;
- (_UIBadgeVisualStyle)style;
- (void)_applyTextToLabel;
- (void)_setUpLabelIfNecessary;
- (void)layoutSubviews;
- (void)setBadgeColor:(id)a3;
- (void)setStyle:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAttributes:(id)a3;
- (void)setTextOffset:(UIOffset)a3;
@end

@implementation _UIBadgeView

- (void)setTextAttributes:(id)a3
{
  v4 = (NSDictionary *)a3;
  textAttributes = self->_textAttributes;
  if (textAttributes != v4)
  {
    v10 = v4;
    char v6 = [(NSDictionary *)textAttributes isEqual:v4];
    v4 = v10;
    if ((v6 & 1) == 0)
    {
      v7 = (NSDictionary *)[(NSDictionary *)v10 copy];
      v8 = self->_textAttributes;
      self->_textAttributes = v7;

      mergedTextAttributes = self->_mergedTextAttributes;
      self->_mergedTextAttributes = 0;

      [(UIView *)self setNeedsLayout];
      v4 = v10;
    }
  }
}

- (void)setBadgeColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_badgeColor != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_badgeColor, a3);
    [(UIView *)self setNeedsLayout];
    v5 = v6;
  }
}

- (_UIBadgeVisualStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  v5 = (_UIBadgeVisualStyle *)a3;
  if (self->_style != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_style, a3);
    mergedTextAttributes = self->_mergedTextAttributes;
    self->_mergedTextAttributes = 0;

    [(UIView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (_UIBadgeView)initWithText:(id)a3
{
  id v4 = a3;
  v5 = -[UIView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 24.0, 22.0);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    [(_UIBadgeView *)v5 _setUpLabelIfNecessary];
    [(_UIBadgeView *)v5 _applyTextToLabel];
    [(UIView *)v5 setUserInteractionEnabled:0];
  }

  return v5;
}

- (void)_setUpLabelIfNecessary
{
  NSUInteger v3 = [(NSString *)self->_text length];
  label = self->_label;
  if (v3)
  {
    if (!label)
    {
      uint64_t v6 = objc_alloc_init(UILabel);
      v7 = self->_label;
      self->_label = v6;

      v8 = +[UIColor clearColor];
      [(UIView *)self->_label setBackgroundColor:v8];

      [(UIView *)self->_label setOpaque:0];
      v9 = self->_label;
      [(UIView *)self addSubview:v9];
    }
  }
  else
  {
    [(UIView *)label removeFromSuperview];
    v5 = self->_label;
    self->_label = 0;
  }
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(_UIBadgeVisualStyle *)self->_style cornerRadius];
  -[UIView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  if (self->_badgeColor)
  {
    -[UIView setBackgroundColor:](self, "setBackgroundColor:");
  }
  else
  {
    v7 = [(_UIBadgeVisualStyle *)self->_style defaultBadgeColor];
    [(UIView *)self setBackgroundColor:v7];
  }
  [(_UIBadgeView *)self _applyTextToLabel];
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v4, v6);
  double v9 = v8;
  double v11 = v10;
  UIFloorToViewScale(self);
  double v13 = v12 + self->_textOffset.horizontal;
  UIFloorToViewScale(self);
  label = self->_label;
  double v16 = v15 + self->_textOffset.vertical;
  -[UILabel setFrame:](label, "setFrame:", v13, v16, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(_UIBadgeVisualStyle *)self->_style cornerRadius];
  double v5 = v4 + v4;
  NSUInteger v6 = [(NSString *)self->_text length];
  double v7 = v5;
  if (v6 >= 2)
  {
    [(_UIBadgeView *)self _setUpLabelIfNecessary];
    [(_UIBadgeView *)self _applyTextToLabel];
    [(_UIBadgeVisualStyle *)self->_style maxWidth];
    double v9 = v8;
    [(_UIBadgeVisualStyle *)self->_style minWidth];
    double v11 = v10;
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v13 = v12;
    [(_UIBadgeVisualStyle *)self->_style edgePadding];
    double v7 = v13 + v14 + v14;
    if (v11 >= v7) {
      double v7 = v11;
    }
    if (v9 <= v7) {
      double v7 = v9;
    }
  }
  double v15 = v5;
  result.height = v15;
  result.width = v7;
  return result;
}

- (void)_applyTextToLabel
{
  if ([(NSString *)self->_text length])
  {
    if (qword_1EB25BCA0 != -1) {
      dispatch_once(&qword_1EB25BCA0, &__block_literal_global_78);
    }
    if (!self->_mergedTextAttributes)
    {
      double v3 = (NSMutableDictionary *)[(id)qword_1EB25BC98 mutableCopy];
      mergedTextAttributes = self->_mergedTextAttributes;
      self->_mergedTextAttributes = v3;

      double v5 = [(_UIBadgeVisualStyle *)self->_style font];
      [(NSMutableDictionary *)self->_mergedTextAttributes setObject:v5 forKeyedSubscript:*(void *)off_1E52D2040];

      if ([(NSDictionary *)self->_textAttributes count]) {
        [(NSMutableDictionary *)self->_mergedTextAttributes addEntriesFromDictionary:self->_textAttributes];
      }
      [(NSMutableDictionary *)self->_mergedTextAttributes removeObjectForKey:*(void *)off_1E52D1F58];
    }
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (self->_mergedTextAttributes) {
      double v7 = self->_mergedTextAttributes;
    }
    else {
      double v7 = (NSMutableDictionary *)qword_1EB25BC98;
    }
    uint64_t v8 = [v6 initWithString:self->_text attributes:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = (id)v8;
  [(UILabel *)self->_label setAttributedText:v8];
}

- (void)setTextOffset:(UIOffset)a3
{
  if (self->_textOffset.horizontal != a3.horizontal || self->_textOffset.vertical != a3.vertical)
  {
    self->_textOffset = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_textAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_mergedTextAttributes, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setText:(id)a3
{
  double v4 = (NSString *)a3;
  text = self->_text;
  if (text != v4)
  {
    id v9 = v4;
    char v6 = [(NSString *)text isEqual:v4];
    double v4 = v9;
    if ((v6 & 1) == 0)
    {
      double v7 = (NSString *)[(NSString *)v9 copy];
      uint64_t v8 = self->_text;
      self->_text = v7;

      [(_UIBadgeView *)self _setUpLabelIfNecessary];
      [(_UIBadgeView *)self _applyTextToLabel];
      [(UIView *)self sizeToFit];
      [(UIView *)self setNeedsLayout];
      double v4 = v9;
    }
  }
}

- (NSString)text
{
  return self->_text;
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (UIColor)badgeColor
{
  return self->_badgeColor;
}

- (UIOffset)textOffset
{
  double horizontal = self->_textOffset.horizontal;
  double vertical = self->_textOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

@end