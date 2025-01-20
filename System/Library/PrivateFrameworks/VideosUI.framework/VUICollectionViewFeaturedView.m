@interface VUICollectionViewFeaturedView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (UIView)imageView;
- (UIView)overlayView;
- (VUICollectionViewFeaturedView)initWithFrame:(CGRect)a3;
- (void)setImageView:(id)a3;
- (void)setOverlayView:(id)a3;
@end

@implementation VUICollectionViewFeaturedView

- (VUICollectionViewFeaturedView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUICollectionViewFeaturedView;
  return -[VUICollectionViewFeaturedView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setImageView:(id)a3
{
  v5 = (UIView *)a3;
  [(VUICollectionViewFeaturedView *)self vui_addSubview:v5 oldView:self->_imageView];
  if (self->_imageView != v5) {
    objc_storeStrong((id *)&self->_imageView, a3);
  }
  [(VUICollectionViewFeaturedView *)self vui_setNeedsLayout];
}

- (void)setOverlayView:(id)a3
{
  v5 = (UIView *)a3;
  [(VUICollectionViewFeaturedView *)self vui_addSubview:v5 oldView:self->_overlayView];
  if (self->_overlayView != v5) {
    objc_storeStrong((id *)&self->_overlayView, a3);
  }
  [(VUICollectionViewFeaturedView *)self vui_setNeedsLayout];
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v20.receiver = self;
  v20.super_class = (Class)VUICollectionViewFeaturedView;
  [(VUICollectionViewFeaturedView *)&v20 vui_layoutSubviews:a3.width computationOnly:a3.height];
  double v7 = v6;
  double v9 = v8;
  if (!a4)
  {
    [(VUICollectionViewFeaturedView *)self bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    -[UIView setFrame:](self->_imageView, "setFrame:");
    -[UIView setFrame:](self->_overlayView, "setFrame:", v11, v13, v15, v17);
    if (self->_overlayView) {
      -[VUICollectionViewFeaturedView vui_bringSubviewToFront:](self, "vui_bringSubviewToFront:");
    }
  }
  double v18 = v7;
  double v19 = v9;
  result.height = v19;
  result.width = v18;
  return result;
}

- (UIView)imageView
{
  return self->_imageView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end