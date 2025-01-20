@interface SUUITableViewCell
- (SUUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)bottomBorderColor;
- (UIColor)topBorderColor;
- (UIEdgeInsets)textLabelInsets;
- (double)borderPaddingLeft;
- (void)_reloadBorderVisibility;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBorderPaddingLeft:(double)a3;
- (void)setBottomBorderColor:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setTextLabelInsets:(UIEdgeInsets)a3;
- (void)setTopBorderColor:(id)a3;
@end

@implementation SUUITableViewCell

- (SUUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SUUITableViewCell;
  result = [(SUUITableViewCell *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  if (result)
  {
    result->_borderPaddingLeft = 15.0;
    long long v5 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&result->_textLabelInsets.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&result->_textLabelInsets.bottom = v5;
  }
  return result;
}

- (UIColor)bottomBorderColor
{
  return (UIColor *)[(SUUIBorderView *)self->_bottomBorderView backgroundColor];
}

- (void)setBottomBorderColor:(id)a3
{
  id v4 = a3;
  bottomBorderView = self->_bottomBorderView;
  id v9 = v4;
  if (v4)
  {
    if (!bottomBorderView)
    {
      objc_super v6 = objc_alloc_init(SUUIBorderView);
      v7 = self->_bottomBorderView;
      self->_bottomBorderView = v6;

      [(SUUITableViewCell *)self addSubview:self->_bottomBorderView];
      bottomBorderView = self->_bottomBorderView;
    }
    [(SUUIBorderView *)bottomBorderView setColor:v9];
  }
  else
  {
    [(SUUIBorderView *)bottomBorderView removeFromSuperview];
    v8 = self->_bottomBorderView;
    self->_bottomBorderView = 0;
  }
}

- (void)setTopBorderColor:(id)a3
{
  id v4 = a3;
  topBorderView = self->_topBorderView;
  id v9 = v4;
  if (v4)
  {
    if (!topBorderView)
    {
      objc_super v6 = objc_alloc_init(SUUIBorderView);
      v7 = self->_topBorderView;
      self->_topBorderView = v6;

      [(SUUITableViewCell *)self addSubview:self->_topBorderView];
      topBorderView = self->_topBorderView;
    }
    [(SUUIBorderView *)topBorderView setColor:v9];
  }
  else
  {
    [(SUUIBorderView *)topBorderView removeFromSuperview];
    v8 = self->_topBorderView;
    self->_topBorderView = 0;
  }
}

- (UIColor)topBorderColor
{
  return (UIColor *)[(SUUIBorderView *)self->_topBorderView backgroundColor];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SUUITableViewCell;
  [(SUUITableViewCell *)&v3 prepareForReuse];
  self->_borderPaddingLeft = 15.0;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUUITableViewCell;
  [(SUUITableViewCell *)&v5 setHighlighted:a3 animated:a4];
  [(SUUITableViewCell *)self _reloadBorderVisibility];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUUITableViewCell;
  [(SUUITableViewCell *)&v5 setSelected:a3 animated:a4];
  [(SUUITableViewCell *)self _reloadBorderVisibility];
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)SUUITableViewCell;
  [(SUUITableViewCell *)&v37 layoutSubviews];
  [(SUUITableViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  bottomBorderView = self->_bottomBorderView;
  double borderPaddingLeft = self->_borderPaddingLeft;
  id v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  double v11 = v6 - 1.0 / v10;
  double v12 = v4 - self->_borderPaddingLeft;
  v13 = [MEMORY[0x263F82B60] mainScreen];
  [v13 scale];
  -[SUUIBorderView setFrame:](bottomBorderView, "setFrame:", borderPaddingLeft, v11, v12, 1.0 / v14);

  topBorderView = self->_topBorderView;
  double v16 = self->_borderPaddingLeft;
  v17 = [MEMORY[0x263F82B60] mainScreen];
  [v17 scale];
  -[SUUIBorderView setFrame:](topBorderView, "setFrame:", v16, 0.0, v4 - v16, 1.0 / v18);

  v19 = [(SUUITableViewCell *)self textLabel];
  [v19 frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double top = self->_textLabelInsets.top;
  double left = self->_textLabelInsets.left;
  double v30 = v21 + left;
  double v31 = v23 + top;
  double v32 = v25 - (left + self->_textLabelInsets.right);
  double v33 = v27 - (top + self->_textLabelInsets.bottom);
  v34 = [(SUUITableViewCell *)self textLabel];
  objc_msgSend(v34, "setFrame:", v30, v31, v32, v33);

  v35 = [(SUUITableViewCell *)self textLabel];
  if (storeShouldReverseLayoutDirection()) {
    uint64_t v36 = 2;
  }
  else {
    uint64_t v36 = 0;
  }
  [v35 setTextAlignment:v36];
}

- (void)_reloadBorderVisibility
{
  if (([(SUUITableViewCell *)self isEditing] & 1) != 0
    || ![(SUUITableViewCell *)self selectionStyle])
  {
    uint64_t v3 = 0;
  }
  else if ([(SUUITableViewCell *)self isHighlighted])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [(SUUITableViewCell *)self isSelected];
  }
  [(SUUIBorderView *)self->_bottomBorderView setHidden:v3];
  topBorderView = self->_topBorderView;
  [(SUUIBorderView *)topBorderView setHidden:v3];
}

- (double)borderPaddingLeft
{
  return self->_borderPaddingLeft;
}

- (void)setBorderPaddingLeft:(double)a3
{
  self->_double borderPaddingLeft = a3;
}

- (UIEdgeInsets)textLabelInsets
{
  double top = self->_textLabelInsets.top;
  double left = self->_textLabelInsets.left;
  double bottom = self->_textLabelInsets.bottom;
  double right = self->_textLabelInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextLabelInsets:(UIEdgeInsets)a3
{
  self->_textLabelInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

@end