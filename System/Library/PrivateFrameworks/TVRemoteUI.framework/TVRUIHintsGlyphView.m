@interface TVRUIHintsGlyphView
- (CGSize)intrinsicContentSize;
- (TVRUIHintsGlyphView)initWithImage:(id)a3 styleProvider:(id)a4;
- (TVRUIHintsStyleProvider)styleProvider;
- (UIImageView)imageView;
- (UIView)backgroundView;
- (void)layoutSubviews;
@end

@implementation TVRUIHintsGlyphView

- (TVRUIHintsGlyphView)initWithImage:(id)a3 styleProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 size];
  double v9 = v8;
  [v6 size];
  double v11 = v10;
  v28.receiver = self;
  v28.super_class = (Class)TVRUIHintsGlyphView;
  v12 = -[TVRUIHintsGlyphView initWithFrame:](&v28, sel_initWithFrame_, 0.0, 0.0, v9, v10);
  v13 = v12;
  if (v12)
  {
    p_styleProvider = (id *)&v12->_styleProvider;
    objc_storeStrong((id *)&v12->_styleProvider, a4);
    [v6 size];
    double v16 = v15 * 0.5;
    v17 = [MEMORY[0x263F825C8] clearColor];
    [(TVRUIHintsGlyphView *)v13 setBackgroundColor:v17];

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, v9, v11);
    backgroundView = v13->_backgroundView;
    v13->_backgroundView = (UIView *)v18;

    v20 = [(UIView *)v13->_backgroundView layer];
    [v20 setCornerRadius:v16];

    v21 = [*p_styleProvider backgroundColor];
    [(UIView *)v13->_backgroundView setBackgroundColor:v21];

    v22 = [*p_styleProvider backgroundFilters];
    v23 = [(UIView *)v13->_backgroundView layer];
    [v23 setFilters:v22];

    [(TVRUIHintsGlyphView *)v13 addSubview:v13->_backgroundView];
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", 0.0, 0.0, v9, v11);
    imageView = v13->_imageView;
    v13->_imageView = (UIImageView *)v24;

    [(UIImageView *)v13->_imageView setImage:v6];
    [(UIImageView *)v13->_imageView setContentMode:4];
    [(UIImageView *)v13->_imageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    v26 = [*p_styleProvider primaryTintColor];
    [(TVRUIHintsGlyphView *)v13 setTintColor:v26];

    [(TVRUIHintsGlyphView *)v13 addSubview:v13->_imageView];
  }

  return v13;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)TVRUIHintsGlyphView;
  [(TVRUIHintsGlyphView *)&v21 layoutSubviews];
  [(TVRUIHintsGlyphView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(TVRUIHintsGlyphView *)self backgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(TVRUIHintsGlyphView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(TVRUIHintsGlyphView *)self imageView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (CGSize)intrinsicContentSize
{
  v2 = [(TVRUIHintsGlyphView *)self imageView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (TVRUIHintsStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end