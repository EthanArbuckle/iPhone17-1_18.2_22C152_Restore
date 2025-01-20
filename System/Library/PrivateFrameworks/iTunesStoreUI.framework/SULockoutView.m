@interface SULockoutView
- (NSString)body;
- (NSString)title;
- (UIImage)backgroundImage;
- (UIImage)glowImage;
- (UIImage)image;
- (id)_bodyLabel;
- (id)_imageView;
- (id)_newLabel;
- (id)_titleLabel;
- (int64_t)layoutPreset;
- (void)_layoutForSlowNetwork;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundImage:(id)a3;
- (void)setBody:(id)a3;
- (void)setGlowImage:(id)a3;
- (void)setImage:(id)a3;
- (void)setLayoutPreset:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation SULockoutView

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SULockoutView;
  [(SULockoutView *)&v3 dealloc];
}

- (UIImage)backgroundImage
{
  return [(UIImageView *)self->_backgroundImageView image];
}

- (NSString)body
{
  id v2 = [(SULockoutView *)self _bodyLabel];

  return (NSString *)[v2 text];
}

- (UIImage)image
{
  id v2 = [(SULockoutView *)self _imageView];

  return (UIImage *)[v2 image];
}

- (UIImage)glowImage
{
  return [(UIImageView *)self->_glowImageView image];
}

- (void)setBackgroundImage:(id)a3
{
  backgroundImageView = self->_backgroundImageView;
  if (a3)
  {
    if (!backgroundImageView)
    {
      backgroundImageView = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
      self->_backgroundImageView = backgroundImageView;
    }
    [(UIImageView *)backgroundImageView setImage:a3];
    [(SULockoutView *)self insertSubview:self->_backgroundImageView atIndex:0];
    [(SULockoutView *)self setNeedsLayout];
  }
  else
  {
    [(UIImageView *)backgroundImageView removeFromSuperview];

    self->_backgroundImageView = 0;
  }
}

- (void)setBody:(id)a3
{
  objc_msgSend(-[SULockoutView _bodyLabel](self, "_bodyLabel"), "setText:", a3);

  [(SULockoutView *)self setNeedsLayout];
}

- (void)setGlowImage:(id)a3
{
  glowImageView = self->_glowImageView;
  if (a3)
  {
    if (!glowImageView)
    {
      v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
      self->_glowImageView = v6;
      [(UIImageView *)v6 setContentMode:4];
      glowImageView = self->_glowImageView;
    }
    [(UIImageView *)glowImageView setImage:a3];
    v7 = self->_glowImageView;
    if (self->_backgroundImageView) {
      -[SULockoutView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v7);
    }
    else {
      -[SULockoutView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7);
    }
    [(SULockoutView *)self setNeedsLayout];
  }
  else
  {
    [(UIImageView *)glowImageView removeFromSuperview];

    self->_glowImageView = 0;
  }
}

- (void)setImage:(id)a3
{
  id v5 = [(SULockoutView *)self _imageView];
  [v5 setImage:a3];
  [v5 sizeToFit];

  [(SULockoutView *)self setNeedsLayout];
}

- (void)setLayoutPreset:(int64_t)a3
{
  if (self->_layoutPreset != a3)
  {
    self->_layoutPreset = a3;
    [(SULockoutView *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  objc_msgSend(-[SULockoutView _titleLabel](self, "_titleLabel"), "setText:", a3);

  [(SULockoutView *)self setNeedsLayout];
}

- (NSString)title
{
  id v2 = [(SULockoutView *)self _titleLabel];

  return (NSString *)[v2 text];
}

- (void)layoutSubviews
{
  if (![(SULockoutView *)self layoutPreset])
  {
    [(SULockoutView *)self _layoutForSlowNetwork];
  }
}

- (void)_layoutForSlowNetwork
{
  [(SULockoutView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(SULockoutView *)self _imageView];
  id v12 = [(SULockoutView *)self _bodyLabel];
  id v13 = [(SULockoutView *)self _titleLabel];
  backgroundImageView = self->_backgroundImageView;
  if (backgroundImageView) {
    -[UIImageView setFrame:](backgroundImageView, "setFrame:", v4, v6, v8, v10);
  }
  uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
  if (v15 == 1) {
    double v16 = 10.0;
  }
  else {
    double v16 = 5.0;
  }
  double v17 = 20.0;
  if (v15 != 1) {
    double v17 = 10.0;
  }
  double v50 = v17;
  double v51 = v16;
  double v18 = -8.0;
  if (v15 == 1) {
    double v18 = 0.0;
  }
  double v46 = v18;
  [v12 frame];
  [v11 frame];
  double v20 = v19;
  double v22 = v21;
  [v13 frame];
  objc_msgSend(v12, "sizeThatFits:", v8 + -20.0, v10);
  double v48 = v23;
  double v49 = v24;
  double v25 = v24;
  objc_msgSend(v13, "sizeThatFits:", v8 + -20.0, v10);
  double v27 = v26;
  double v29 = v28;
  *(float *)&double v26 = (v10 - (v25 + v51 + v50 + v22 + v28)) * 0.5;
  CGFloat v30 = v46 + floorf(*(float *)&v26);
  *(float *)&double v26 = (v8 - v20) * 0.5;
  double v31 = floorf(*(float *)&v26);
  objc_msgSend(v11, "setFrame:", v31, v30, v20, v22);
  float v32 = (v8 - v27) * 0.5;
  CGFloat v33 = floorf(v32);
  v53.origin.x = v31;
  double v45 = v22;
  double v47 = v30;
  v53.origin.y = v30;
  v53.size.width = v20;
  v53.size.height = v22;
  CGFloat v34 = v50 + CGRectGetMaxY(v53);
  objc_msgSend(v13, "setFrame:", v33, v34, v27, v29);
  float v35 = (v8 - v48) * 0.5;
  double v36 = floorf(v35);
  v54.origin.x = v33;
  v54.origin.y = v34;
  v54.size.width = v27;
  v54.size.height = v29;
  objc_msgSend(v12, "setFrame:", v36, v51 + CGRectGetMaxY(v54), v48, v49);
  glowImageView = self->_glowImageView;
  if (glowImageView)
  {
    [(UIImageView *)glowImageView frame];
    float v39 = (v38 - v20) * 0.5;
    double v40 = v31 - floorf(v39);
    float v42 = (v41 - v45) * 0.5;
    v43 = self->_glowImageView;
    double v44 = v47 - floorf(v42);
    -[UIImageView setFrame:](v43, "setFrame:", v40, v44);
  }
}

- (id)_bodyLabel
{
  id result = self->_bodyLabel;
  if (!result)
  {
    self->_bodyLabel = (UILabel *)[(SULockoutView *)self _newLabel];
    uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
    double v5 = 12.0;
    if (v4 == 1) {
      double v5 = 24.0;
    }
    -[UILabel setFont:](self->_bodyLabel, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:v5]);
    [(SULockoutView *)self addSubview:self->_bodyLabel];
    return self->_bodyLabel;
  }
  return result;
}

- (id)_imageView
{
  id result = self->_imageView;
  if (!result)
  {
    uint64_t v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    self->_imageView = v4;
    [(SULockoutView *)self addSubview:v4];
    return self->_imageView;
  }
  return result;
}

- (id)_newLabel
{
  id v2 = objc_alloc_init(SUInnerShadowLabel);
  -[SUInnerShadowLabel setBackgroundColor:](v2, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
  [(SUInnerShadowLabel *)v2 setNumberOfLines:0];
  [(SUInnerShadowLabel *)v2 setTextAlignment:1];
  -[SUInnerShadowLabel setTextColor:](v2, "setTextColor:", [MEMORY[0x263F1C550] colorWithWhite:0.666666667 alpha:1.0]);
  return v2;
}

- (id)_titleLabel
{
  id result = self->_titleLabel;
  if (!result)
  {
    self->_titleLabel = (UILabel *)[(SULockoutView *)self _newLabel];
    uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
    double v5 = 32.0;
    if (v4 != 1) {
      double v5 = 16.0;
    }
    -[UILabel setFont:](self->_titleLabel, "setFont:", [MEMORY[0x263F1C658] boldSystemFontOfSize:v5]);
    [(SULockoutView *)self addSubview:self->_titleLabel];
    return self->_titleLabel;
  }
  return result;
}

- (int64_t)layoutPreset
{
  return self->_layoutPreset;
}

@end