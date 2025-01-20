@interface _TVStackBackdropView
- (UIImage)image;
- (_TVStackBackdropView)initWithBlurEffectStyle:(int64_t)a3;
- (int64_t)blurEffectStyle;
- (void)layoutSubviews;
- (void)setBlurEffectStyle:(int64_t)a3;
- (void)setImage:(id)a3;
@end

@implementation _TVStackBackdropView

- (_TVStackBackdropView)initWithBlurEffectStyle:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_TVStackBackdropView;
  v4 = [(_TVStackBackdropView *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_blurEffectStyle = a3;
    id v6 = objc_alloc(MEMORY[0x263F1CB98]);
    v7 = [MEMORY[0x263F1C480] effectWithStyle:a3];
    uint64_t v8 = [v6 initWithEffect:v7];
    visualEffectView = v5->_visualEffectView;
    v5->_visualEffectView = (UIVisualEffectView *)v8;

    [(_TVStackBackdropView *)v5 addSubview:v5->_visualEffectView];
  }
  return v5;
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  if (self->_blurEffectStyle != a3)
  {
    self->_blurEffectStyle = a3;
    visualEffectView = self->_visualEffectView;
    objc_msgSend(MEMORY[0x263F1C480], "effectWithStyle:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UIVisualEffectView *)visualEffectView setEffect:v4];
  }
}

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_image, a3);
    p_image = (UIImage **)[(_TVStackBackdropView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_image, v5);
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_TVStackBackdropView;
  [(_TVStackBackdropView *)&v13 layoutSubviews];
  [(_TVStackBackdropView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(_TVStackBackdropView *)self image];

  imageView = self->_imageView;
  if (v7)
  {
    if (!imageView)
    {
      _TVStackMakeImageView();
      v9 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      v10 = self->_imageView;
      self->_imageView = v9;

      [(_TVStackBackdropView *)self insertSubview:self->_imageView below:self->_visualEffectView];
      imageView = self->_imageView;
    }
    objc_super v11 = [(_TVStackBackdropView *)self image];
    [(UIImageView *)imageView setImage:v11];

    -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, v4, v6);
  }
  else
  {
    [(UIImageView *)self->_imageView removeFromSuperview];
    v12 = self->_imageView;
    self->_imageView = 0;
  }
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", 0.0, 0.0, v4, v6);
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end