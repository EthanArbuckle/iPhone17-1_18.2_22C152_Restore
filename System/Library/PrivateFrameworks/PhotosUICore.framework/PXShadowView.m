@interface PXShadowView
- (CGRect)castingFrame;
- (NSShadow)shadow;
- (PXShadowView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (void)_invalidateResizableShadowImage;
- (void)layoutSubviews;
- (void)setCastingFrame:(CGRect)a3;
- (void)setCornerRadius:(double)a3;
- (void)setShadow:(id)a3;
@end

@implementation PXShadowView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_resizableShadowImage, 0);
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGRect)castingFrame
{
  double x = self->_castingFrame.origin.x;
  double y = self->_castingFrame.origin.y;
  double width = self->_castingFrame.size.width;
  double height = self->_castingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PXShadowView;
  [(PXShadowView *)&v16 layoutSubviews];
  v3 = [(PXShadowView *)self shadow];
  if (self->_resizableShadowImageNeedsUpdate)
  {
    v4 = +[PXShadowImageCache sharedInstance];
    [(PXShadowView *)self cornerRadius];
    double v6 = v5;
    v7 = [(PXShadowView *)self window];
    v8 = [v7 screen];
    [v8 scale];
    v10 = [v4 stretchableShadowImageFor:v3 cornerRadius:v6 screenScale:v9];
    resizableShadowImage = self->_resizableShadowImage;
    self->_resizableShadowImage = v10;

    self->_resizableShadowImageNeedsUpdate = 0;
  }
  [(UIImageView *)self->_imageView setImage:self->_resizableShadowImage];
  if (v3)
  {
    [(PXShadowView *)self castingFrame];
    [(UIImageView *)self->_imageView setFrame:PXGResizableShadowImageFrameForCastingFrame(v3, v12, v13, v14, v15)];
  }
}

- (void)_invalidateResizableShadowImage
{
  self->_resizableShadowImageNeedsUpdate = 1;
  [(PXShadowView *)self setNeedsLayout];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(PXShadowView *)self _invalidateResizableShadowImage];
  }
}

- (void)setShadow:(id)a3
{
  v8 = (NSShadow *)a3;
  v4 = self->_shadow;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSShadow *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSShadow *)[(NSShadow *)v8 copy];
      shadow = self->_shadow;
      self->_shadow = v6;

      [(PXShadowView *)self _invalidateResizableShadowImage];
    }
  }
}

- (void)setCastingFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_castingFrame = &self->_castingFrame;
  if (!CGRectEqualToRect(self->_castingFrame, a3))
  {
    p_castingFrame->origin.CGFloat x = x;
    p_castingFrame->origin.CGFloat y = y;
    p_castingFrame->size.CGFloat width = width;
    p_castingFrame->size.CGFloat height = height;
    [(PXShadowView *)self setNeedsLayout];
  }
}

- (PXShadowView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXShadowView;
  v3 = -[PXShadowView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    [(PXShadowView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

@end