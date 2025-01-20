@interface STSSuggestionFooter
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImage)searchProviderImage;
- (void)layoutSubviews;
- (void)setSearchProviderImage:(id)a3;
@end

@implementation STSSuggestionFooter

- (void)layoutSubviews
{
  if (self->_imageView)
  {
    [(STSSuggestionFooter *)self bounds];
    double v4 = v3 + 0.0;
    double v6 = v5 + 4.0;
    imageView = self->_imageView;
    -[UIImageView setFrame:](imageView, "setFrame:", v4, v6);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIImageView *)self->_imageView bounds];
  double v4 = v3 + 0.0;
  double v6 = v5 + 18.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setSearchProviderImage:(id)a3
{
  double v5 = (UIImage *)a3;
  p_searchProviderImage = &self->_searchProviderImage;
  if (self->_searchProviderImage != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_searchProviderImage, a3);
    imageView = self->_imageView;
    if (imageView)
    {
      [(UIImageView *)imageView setImage:*p_searchProviderImage];
    }
    else
    {
      v8 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:*p_searchProviderImage];
      v9 = self->_imageView;
      self->_imageView = v8;

      v10 = self->_imageView;
      v11 = objc_msgSend(MEMORY[0x263F825C8], "sts_providerImageColor");
      [(UIImageView *)v10 setTintColor:v11];

      [(STSSuggestionFooter *)self addSubview:self->_imageView];
    }
    [(UIImageView *)self->_imageView bounds];
    -[STSSuggestionFooter setBounds:](self, "setBounds:", 0.0, 0.0, v12 + 0.0, v13 + 18.0);
    [(STSSuggestionFooter *)self setNeedsLayout];
    double v5 = v14;
  }
}

- (UIImage)searchProviderImage
{
  return self->_searchProviderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchProviderImage, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end