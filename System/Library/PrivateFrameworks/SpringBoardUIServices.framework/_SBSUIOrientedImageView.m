@interface _SBSUIOrientedImageView
- (UIImage)landscapeImage;
- (UIImage)portraitImage;
- (_SBSUIOrientedImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setLandscapeImage:(id)a3;
- (void)setPortraitImage:(id)a3;
@end

@implementation _SBSUIOrientedImageView

- (_SBSUIOrientedImageView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SBSUIOrientedImageView;
  v3 = -[_SBSUIOrientedImageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    [(_SBSUIOrientedImageView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    [(UIImageView *)v3->_imageView setContentMode:4];
    [(_SBSUIOrientedImageView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)_SBSUIOrientedImageView;
  [(_SBSUIOrientedImageView *)&v15 layoutSubviews];
  imageView = self->_imageView;
  [(_SBSUIOrientedImageView *)self bounds];
  -[UIImageView setFrame:](imageView, "setFrame:");
  [(_SBSUIOrientedImageView *)self frame];
  double v5 = v4;
  v6 = [(_SBSUIOrientedImageView *)self portraitImage];
  [v6 size];
  double v8 = v7;

  if (v8 <= v5) {
    [(_SBSUIOrientedImageView *)self portraitImage];
  }
  else {
  v9 = [(_SBSUIOrientedImageView *)self landscapeImage];
  }
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E4F42FF0];
    v12 = self->_imageView;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41___SBSUIOrientedImageView_layoutSubviews__block_invoke;
    v13[3] = &unk_1E5CCC878;
    v13[4] = self;
    id v14 = v9;
    [v11 transitionWithView:v12 duration:5242880 options:v13 animations:0 completion:0.0];
  }
}

- (UIImage)portraitImage
{
  return self->_portraitImage;
}

- (void)setPortraitImage:(id)a3
{
}

- (UIImage)landscapeImage
{
  return self->_landscapeImage;
}

- (void)setLandscapeImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeImage, 0);
  objc_storeStrong((id *)&self->_portraitImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end