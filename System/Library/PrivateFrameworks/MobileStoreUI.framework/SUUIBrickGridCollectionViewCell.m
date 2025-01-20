@interface SUUIBrickGridCollectionViewCell
- (NSString)accessibilityLabel;
- (UIEdgeInsets)contentInsets;
- (UIImage)brickImage;
- (void)applyEditorialLayout:(id)a3 orientation:(int64_t)a4;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBrickImage:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
@end

@implementation SUUIBrickGridCollectionViewCell

- (void)applyEditorialLayout:(id)a3 orientation:(int64_t)a4
{
  id v6 = a3;
  editorialContainerView = self->_editorialContainerView;
  id v15 = v6;
  if (v6)
  {
    if (!editorialContainerView)
    {
      v8 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      v9 = self->_editorialContainerView;
      self->_editorialContainerView = v8;

      v10 = self->_editorialContainerView;
      v11 = [(SUUIBrickGridCollectionViewCell *)self backgroundColor];
      [(UIView *)v10 setBackgroundColor:v11];

      v12 = [(SUUIBrickGridCollectionViewCell *)self contentView];
      [v12 addSubview:self->_editorialContainerView];

      [(SUUIBrickGridCollectionViewCell *)self setNeedsLayout];
    }
    if (!self->_editorialCellLayout)
    {
      v13 = [[SUUIEditorialCellLayout alloc] initWithParentView:self->_editorialContainerView];
      editorialCellLayout = self->_editorialCellLayout;
      self->_editorialCellLayout = v13;

      -[SUUIEditorialCellLayout setContentInset:](self->_editorialCellLayout, "setContentInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    }
    [(UIView *)self->_editorialContainerView setHidden:0];
  }
  else
  {
    [(UIView *)editorialContainerView setHidden:1];
  }
  [(SUUIEditorialCellLayout *)self->_editorialCellLayout applyEditorialLayout:v15 withOrientation:a4 expanded:1];
}

- (UIImage)brickImage
{
  return [(UIImageView *)self->_brickImageView image];
}

- (void)setAccessibilityLabel:(id)a3
{
  if (self->_accessibilityLabel != a3)
  {
    id v6 = a3;
    v4 = (NSString *)[v6 copy];
    accessibilityLabel = self->_accessibilityLabel;
    self->_accessibilityLabel = v4;

    [(UIImageView *)self->_brickImageView setAccessibilityLabel:v6];
  }
}

- (void)setBrickImage:(id)a3
{
  id v14 = a3;
  id v4 = [(SUUIBrickGridCollectionViewCell *)self brickImage];

  id v6 = v14;
  if (v4 != v14)
  {
    brickImageView = self->_brickImageView;
    if (v14)
    {
      if (!brickImageView)
      {
        v8 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        v9 = self->_brickImageView;
        self->_brickImageView = v8;

        [(UIImageView *)self->_brickImageView setAccessibilityLabel:self->_accessibilityLabel];
        v10 = self->_brickImageView;
        v11 = [(SUUIBrickGridCollectionViewCell *)self backgroundColor];
        [(UIImageView *)v10 setBackgroundColor:v11];

        v12 = [(SUUIBrickGridCollectionViewCell *)self contentView];
        [v12 addSubview:self->_brickImageView];

        [(SUUIBrickGridCollectionViewCell *)self setNeedsLayout];
        brickImageView = self->_brickImageView;
      }
      [(UIImageView *)brickImageView setImage:v14];
      uint64_t v5 = [(UIImageView *)self->_brickImageView sizeToFit];
    }
    else
    {
      [(UIImageView *)brickImageView removeFromSuperview];
      v13 = self->_brickImageView;
      self->_brickImageView = 0;
    }
    id v6 = v14;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)setColoringWithColorScheme:(id)a3
{
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(SUUIBrickGridCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)SUUIBrickGridCollectionViewCell;
  [(SUUIBrickGridCollectionViewCell *)&v16 layoutSubviews];
  v3 = [(SUUIBrickGridCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double top = self->_contentInsets.top;
  brickImageView = self->_brickImageView;
  if (brickImageView)
  {
    [(UIImageView *)brickImageView frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double left = self->_contentInsets.left;
    -[UIImageView setFrame:](self->_brickImageView, "setFrame:", left, top);
    v17.origin.x = left;
    v17.origin.y = top;
    v17.size.width = v11;
    v17.size.height = v13;
    double top = CGRectGetMaxY(v17);
  }
  editorialContainerView = self->_editorialContainerView;
  if (editorialContainerView)
  {
    [(UIView *)editorialContainerView frame];
    -[UIView setFrame:](self->_editorialContainerView, "setFrame:", self->_contentInsets.left, top + 10.0, v5 - self->_contentInsets.right - self->_contentInsets.left, v7 - self->_contentInsets.bottom - (top + 10.0));
    [(SUUIEditorialCellLayout *)self->_editorialCellLayout layoutSubviews];
  }
}

- (void)setBackgroundColor:(id)a3
{
  brickImageView = self->_brickImageView;
  id v5 = a3;
  [(UIImageView *)brickImageView setBackgroundColor:v5];
  [(SUUIEditorialCellLayout *)self->_editorialCellLayout setBackgroundColor:v5];
  [(UIView *)self->_editorialContainerView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIBrickGridCollectionViewCell;
  [(SUUIBrickGridCollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialContainerView, 0);
  objc_storeStrong((id *)&self->_editorialCellLayout, 0);
  objc_storeStrong((id *)&self->_brickImageView, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end