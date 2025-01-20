@interface SUUIBrickCollectionViewCell
- (BOOL)isItemImageHidden;
- (NSString)accessibilityLabel;
- (NSString)title;
- (SUUIClientContext)clientContext;
- (SUUICountdown)countdown;
- (UIEdgeInsets)itemImageInsets;
- (UIImage)itemImage;
- (UIView)itemImageView;
- (void)_reloadHighlight;
- (void)_removeOverlay;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setCountdown:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItemImage:(id)a3;
- (void)setItemImageHidden:(BOOL)a3;
- (void)setItemImageInsets:(UIEdgeInsets)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIBrickCollectionViewCell

- (SUUICountdown)countdown
{
  return [(SUUICountdownView *)self->_countdownView countdown];
}

- (UIImage)itemImage
{
  return [(UIImageView *)self->_itemImageView image];
}

- (void)setAccessibilityLabel:(id)a3
{
  if (self->_accessibilityLabel != a3)
  {
    v4 = (NSString *)[a3 copy];
    accessibilityLabel = self->_accessibilityLabel;
    self->_accessibilityLabel = v4;

    itemImageView = self->_itemImageView;
    v7 = self->_accessibilityLabel;
    [(UIImageView *)itemImageView setAccessibilityLabel:v7];
  }
}

- (void)setColoringWithColorScheme:(id)a3
{
  uint64_t v4 = [a3 primaryTextColor];
  p_uint64_t titleColor = &self->_titleColor;
  uint64_t titleColor = (uint64_t)self->_titleColor;
  if (v4 != titleColor)
  {
    id obj = (id)v4;
    uint64_t titleColor = [(id)titleColor isEqual:v4];
    uint64_t v4 = (uint64_t)obj;
    if ((titleColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->_titleColor, obj);
      titleLabel = self->_titleLabel;
      if (*p_titleColor)
      {
        uint64_t titleColor = -[UILabel setTextColor:](titleLabel, "setTextColor:");
      }
      else
      {
        v8 = [MEMORY[0x263F825C8] blackColor];
        [(UILabel *)titleLabel setTextColor:v8];
      }
      uint64_t v4 = (uint64_t)obj;
    }
  }
  MEMORY[0x270F9A758](titleColor, v4);
}

- (void)setCountdown:(id)a3
{
  id v8 = a3;
  id v4 = [(SUUICountdownView *)self->_countdownView countdown];

  if (v4 != v8)
  {
    [(SUUICountdownView *)self->_countdownView removeFromSuperview];
    countdownView = self->_countdownView;
    self->_countdownView = 0;

    if (v8)
    {
      v6 = [[SUUICountdownView alloc] initWithCountdown:v8 clientContext:self->_clientContext];
      v7 = self->_countdownView;
      self->_countdownView = v6;

      [(SUUICountdownView *)self->_countdownView sizeToFit];
      [(SUUIBrickCollectionViewCell *)self addSubview:self->_countdownView];
      [(SUUIBrickCollectionViewCell *)self setNeedsLayout];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIBrickCollectionViewCell;
  [(SUUIBrickCollectionViewCell *)&v4 setHighlighted:a3];
  [(SUUIBrickCollectionViewCell *)self _reloadHighlight];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIBrickCollectionViewCell;
  [(SUUIBrickCollectionViewCell *)&v4 setSelected:a3];
  [(SUUIBrickCollectionViewCell *)self _reloadHighlight];
}

- (void)setItemImage:(id)a3
{
  id v13 = a3;
  id v4 = [(UIImageView *)self->_itemImageView image];

  if (v4 != v13)
  {
    itemImageView = self->_itemImageView;
    if (v13)
    {
      if (!itemImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        id v8 = self->_itemImageView;
        self->_itemImageView = v7;

        [(UIImageView *)self->_itemImageView setAccessibilityLabel:self->_accessibilityLabel];
        v9 = self->_itemImageView;
        v10 = [(SUUIBrickCollectionViewCell *)self backgroundColor];
        [(UIImageView *)v9 setBackgroundColor:v10];

        [(UIImageView *)self->_itemImageView setHidden:[(SUUIBrickCollectionViewCell *)self isItemImageHidden]];
        v11 = [(SUUIBrickCollectionViewCell *)self contentView];
        [v11 addSubview:self->_itemImageView];

        itemImageView = self->_itemImageView;
      }
      -[UIImageView setImage:](itemImageView, "setImage:");
      [(UIImageView *)self->_itemImageView sizeToFit];
    }
    else
    {
      [(UIImageView *)itemImageView removeFromSuperview];
      v12 = self->_itemImageView;
      self->_itemImageView = 0;
    }
    uint64_t v5 = [(SUUIBrickCollectionViewCell *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v5);
}

- (void)setItemImageHidden:(BOOL)a3
{
  if (self->_itemImageHidden != a3)
  {
    self->_itemImageHidden = a3;
    -[UIImageView setHidden:](self->_itemImageView, "setHidden:");
  }
}

- (void)setItemImageInsets:(UIEdgeInsets)a3
{
  if (self->_itemImageInsets.left != a3.left
    || self->_itemImageInsets.top != a3.top
    || self->_itemImageInsets.right != a3.right
    || self->_itemImageInsets.bottom != a3.bottom)
  {
    self->_itemImageInsets = a3;
    [(SUUIBrickCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIBrickCollectionViewCell *)self title];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        id v8 = self->_titleLabel;
        v9 = [(SUUIBrickCollectionViewCell *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          v14 = [MEMORY[0x263F825C8] blackColor];
          [(UILabel *)v12 setTextColor:v14];
        }
        [(SUUIBrickCollectionViewCell *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
      [(UILabel *)self->_titleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      id v13 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SUUIBrickCollectionViewCell *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setBackgroundColor:(id)a3
{
  itemImageView = self->_itemImageView;
  id v5 = a3;
  [(UIImageView *)itemImageView setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIBrickCollectionViewCell;
  [(SUUIBrickCollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void)layoutSubviews
{
  [(UIImageView *)self->_itemImageView frame];
  double v4 = v3;
  double v6 = v5;
  double top = self->_itemImageInsets.top;
  double left = self->_itemImageInsets.left;
  -[UIImageView setFrame:](self->_itemImageView, "setFrame:", left, top);
  -[UIImageView setFrame:](self->_overlayImageView, "setFrame:", left, top, v4, v6);
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    double v11 = v10;
    v14.origin.x = left;
    v14.origin.y = top;
    v14.size.width = v4;
    v14.size.height = v6;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", left, CGRectGetMaxY(v14) + 6.0, v4, v11);
  }
  countdownView = self->_countdownView;
  if (countdownView)
  {
    -[SUUICountdownView setFrame:](countdownView, "setFrame:", left, top, v4, v6);
  }
}

- (void)_reloadHighlight
{
  if (([(SUUIBrickCollectionViewCell *)self isHighlighted] & 1) != 0
    || [(SUUIBrickCollectionViewCell *)self isSelected])
  {
    if (!self->_overlayImageView)
    {
      double v3 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      overlayImageView = self->_overlayImageView;
      self->_overlayImageView = v3;

      double v5 = self->_overlayImageView;
      double v6 = [(SUUIBrickCollectionViewCell *)self backgroundColor];
      [(UIImageView *)v5 setBackgroundColor:v6];

      v7 = [(SUUIBrickCollectionViewCell *)self contentView];
      [v7 addSubview:self->_overlayImageView];

      [(SUUIBrickCollectionViewCell *)self setNeedsLayout];
    }
    id v8 = [(SUUICountdownView *)self->_countdownView backgroundImage];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(UIImageView *)self->_itemImageView image];
    }
    id v14 = v10;

    double v11 = self->_overlayImageView;
    v12 = [MEMORY[0x263F825C8] blackColor];
    id v13 = [v14 _flatImageWithColor:v12];
    [(UIImageView *)v11 setImage:v13];

    [(UIImageView *)self->_overlayImageView setAlpha:0.3];
  }
  else
  {
    [MEMORY[0x263F158F8] begin];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__SUUIBrickCollectionViewCell__reloadHighlight__block_invoke;
    v15[3] = &unk_265400980;
    v15[4] = self;
    [MEMORY[0x263F158F8] setCompletionBlock:v15];
    [(UIImageView *)self->_overlayImageView setAlpha:0.0];
    [MEMORY[0x263F158F8] commit];
  }
}

uint64_t __47__SUUIBrickCollectionViewCell__reloadHighlight__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeOverlay];
}

- (void)_removeOverlay
{
  [(UIImageView *)self->_overlayImageView alpha];
  if (v3 == 0.0)
  {
    [(UIImageView *)self->_overlayImageView removeFromSuperview];
    overlayImageView = self->_overlayImageView;
    self->_overlayImageView = 0;
  }
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (BOOL)isItemImageHidden
{
  return self->_itemImageHidden;
}

- (UIEdgeInsets)itemImageInsets
{
  double top = self->_itemImageInsets.top;
  double left = self->_itemImageInsets.left;
  double bottom = self->_itemImageInsets.bottom;
  double right = self->_itemImageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)itemImageView
{
  return &self->_itemImageView->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end