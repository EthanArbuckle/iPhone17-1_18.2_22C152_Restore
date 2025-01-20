@interface SBFluidSwitcherIconImageContainerView
- (SBFluidSwitcherIconImageContainerView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (void)_configureIconImageView:(id)a3;
- (void)_crossfadeToImage:(id)a3;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
@end

@implementation SBFluidSwitcherIconImageContainerView

- (SBFluidSwitcherIconImageContainerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherIconImageContainerView;
  v3 = -[SBFluidSwitcherIconImageContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    [(SBFluidSwitcherIconImageContainerView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    [(SBFluidSwitcherIconImageContainerView *)v3 _configureIconImageView:v3->_imageView];
    [(SBFluidSwitcherIconImageContainerView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherIconImageContainerView;
  [(SBFluidSwitcherIconImageContainerView *)&v5 layoutSubviews];
  v3 = [(UIImageView *)self->_imageView superview];

  if (v3 == self)
  {
    imageView = self->_imageView;
    [(SBFluidSwitcherIconImageContainerView *)self bounds];
    -[UIImageView setFrame:](imageView, "setFrame:");
  }
}

- (void)setImage:(id)a3
{
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (UIImage *)a3;
  if (self->_image != v7)
  {
    objc_super v8 = v7;
    objc_storeStrong((id *)&self->_image, a3);
    if (v4) {
      [(SBFluidSwitcherIconImageContainerView *)self _crossfadeToImage:v8];
    }
    else {
      [(UIImageView *)self->_imageView setImage:v8];
    }
    v7 = v8;
  }
}

- (void)_configureIconImageView:(id)a3
{
  id v3 = a3;
  [v3 setContentMode:1];
  id v4 = [v3 layer];

  [v4 setAllowsEdgeAntialiasing:1];
}

- (void)_crossfadeToImage:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F42AA0];
  id v5 = a3;
  v6 = (UIImageView *)[[v4 alloc] initWithImage:v5];

  [(SBFluidSwitcherIconImageContainerView *)self _configureIconImageView:v6];
  v7 = [MEMORY[0x1E4FA7940] crossfadeViewWithStartView:self->_imageView endView:v6 translucent:0];
  imageView = self->_imageView;
  self->_imageView = v6;
  v9 = v6;

  v10 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.1];
  [v7 setAnimationFactory:v10];

  [(SBFluidSwitcherIconImageContainerView *)self bounds];
  objc_msgSend(v7, "setFrame:");
  [(SBFluidSwitcherIconImageContainerView *)self addSubview:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__SBFluidSwitcherIconImageContainerView__crossfadeToImage___block_invoke;
  v12[3] = &unk_1E6AF5290;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v11 crossfadeWithCompletion:v12];
}

uint64_t __59__SBFluidSwitcherIconImageContainerView__crossfadeToImage___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[51];
  [v2 bounds];
  objc_msgSend(v3, "setFrame:");
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 408)];
  [*(id *)(a1 + 40) removeFromSuperview];
  id v4 = *(void **)(a1 + 32);
  return [v4 setNeedsLayout];
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end