@interface VUILibraryListItemView
- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImage)itemImage;
- (UIImageView)listImageView;
- (VUILabel)titleLabel;
- (void)layoutSubviews;
- (void)setItemImage:(id)a3;
- (void)setListImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation VUILibraryListItemView

- (void)setTitleLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  titleLabel = self->_titleLabel;
  if (titleLabel != v5)
  {
    v7 = v5;
    [(VUILabel *)titleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_titleLabel, a3);
    if (self->_titleLabel) {
      -[VUILibraryListItemView addSubview:](self, "addSubview:");
    }
    [(VUILibraryListItemView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (void)setItemImage:(id)a3
{
  v5 = (UIImage *)a3;
  p_itemImage = &self->_itemImage;
  if (self->_itemImage != v5)
  {
    v9 = v5;
    [(UIImageView *)self->_listImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_itemImage, a3);
    if (*p_itemImage)
    {
      v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_itemImage];
      listImageView = self->_listImageView;
      self->_listImageView = v7;

      [(VUILibraryListItemView *)self addSubview:self->_listImageView];
    }
    [(VUILibraryListItemView *)self setNeedsLayout];
    v5 = v9;
  }
}

- (void)layoutSubviews
{
  [(VUILibraryListItemView *)self bounds];
  double Width = CGRectGetWidth(v6);
  [(VUILibraryListItemView *)self bounds];
  double Height = CGRectGetHeight(v7);
  -[VUILibraryListItemView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, Height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUILibraryListItemView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = [(VUILibraryListItemView *)self traitCollection];
  +[VUIUtilities scaleContentSizeValue:v8 forTraitCollection:56.0];
  double v10 = v9;

  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
  double v12 = v11;
  double v14 = v13;
  [(UIImageView *)self->_listImageView sizeToFit];
  v15 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  v16 = [v15 traitCollection];
  if ([v16 userInterfaceIdiom] == 1)
  {
    [(UIImageView *)self->_listImageView frame];
    double width = v12 + CGRectGetWidth(v25) + 84.0;
  }
  if (!a4)
  {
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", 32.0, v10 * 0.5 - v14 * 0.5, v12, v14);
    listImageView = self->_listImageView;
    [(VUILibraryListItemView *)self bounds];
    double MaxX = CGRectGetMaxX(v26);
    [(UIImageView *)self->_listImageView frame];
    double v19 = MaxX - (CGRectGetWidth(v27) + 32.0);
    [(UIImageView *)self->_listImageView frame];
    double v20 = v10 * 0.5 - CGRectGetHeight(v28) * 0.5;
    [(UIImageView *)self->_listImageView frame];
    double v21 = CGRectGetWidth(v29);
    [(UIImageView *)self->_listImageView frame];
    -[UIImageView setFrame:](listImageView, "setFrame:", v19, v20, v21, CGRectGetHeight(v30));
  }

  double v22 = width;
  double v23 = v10;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImage)itemImage
{
  return self->_itemImage;
}

- (UIImageView)listImageView
{
  return self->_listImageView;
}

- (void)setListImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listImageView, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end