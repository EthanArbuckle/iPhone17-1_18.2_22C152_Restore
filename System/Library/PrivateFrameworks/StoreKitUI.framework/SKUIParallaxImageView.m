@interface SKUIParallaxImageView
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
- (CGSize)imageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIParallaxImageView)initWithFrame:(CGRect)a3;
- (id)image;
- (id)placeholder;
- (void)_updateInnerImageView;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setImagePadding:(UIEdgeInsets)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setPlaceholder:(id)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SKUIParallaxImageView

- (SKUIParallaxImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIParallaxImageView initWithFrame:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIParallaxImageView;
  v8 = -[SKUIParallaxImageView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [SKUIImageView alloc];
    [(SKUIParallaxImageView *)v8 bounds];
    uint64_t v10 = -[SKUIImageView initWithFrame:](v9, "initWithFrame:");
    innerImageView = v8->_innerImageView;
    v8->_innerImageView = (SKUIImageView *)v10;

    [(SKUIParallaxImageView *)v8 addSubview:v8->_innerImageView];
    [(SKUIParallaxImageView *)v8 setClipsToBounds:1];
  }
  return v8;
}

- (void)setImagePadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_imagePadding.left
    || a3.top != self->_imagePadding.top
    || a3.right != self->_imagePadding.right
    || a3.bottom != self->_imagePadding.bottom)
  {
    self->_imagePadding = a3;
    [(SKUIParallaxImageView *)self _updateInnerImageView];
    [(SKUIParallaxImageView *)self setNeedsLayout];
  }
}

- (id)image
{
  return (id)[(SKUIImageView *)self->_innerImageView image];
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImage:(id)a3
{
}

- (id)placeholder
{
  return [(SKUIImageView *)self->_innerImageView placeholder];
}

- (void)setPlaceholder:(id)a3
{
}

- (void)setImageSize:(CGSize)a3
{
  if (a3.width != self->_imageSize.width || a3.height != self->_imageSize.height)
  {
    self->_imageSize = a3;
    [(SKUIParallaxImageView *)self _updateInnerImageView];
    [(SKUIParallaxImageView *)self setNeedsLayout];
  }
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  return 0.0;
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  [(SKUIParallaxImageView *)self frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [(SKUIParallaxImageView *)self window];
  -[SKUIParallaxImageView convertPoint:toView:](self, "convertPoint:toView:", v7, v4, v6);
  double v9 = v8;
  double v11 = v10;

  v12 = [(SKUIParallaxImageView *)self window];
  [v12 frame];
  double v13 = v9 / CGRectGetWidth(v30);

  v14 = [(SKUIParallaxImageView *)self window];
  [v14 frame];
  double v15 = (v11 + -64.0) / (CGRectGetHeight(v31) + -128.0);

  double v16 = 1.0;
  if (v13 <= 1.0) {
    double v17 = v13;
  }
  else {
    double v17 = 1.0;
  }
  double v18 = fmax(v17, 0.0);
  if (v15 <= 1.0) {
    double v16 = v15;
  }
  double v19 = fmax(v16, 0.0);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  innerImageView = self->_innerImageView;
  if (innerImageView)
  {
    [(SKUIImageView *)innerImageView transform];
  }
  else
  {
    long long v27 = 0uLL;
    long long v28 = 0uLL;
  }
  double top = self->_imagePadding.top;
  double left = self->_imagePadding.left;
  double bottom = self->_imagePadding.bottom;
  double right = self->_imagePadding.right;
  *(double *)&long long v29 = v18 * (left + right);
  *((double *)&v29 + 1) = v19 * (top + bottom);
  if (right > 0.00000011920929 && left < 0.00000011920929) {
    *(double *)&long long v29 = -(v18 * (left + right));
  }
  if (bottom > 0.00000011920929 && top < 0.00000011920929) {
    *((double *)&v29 + 1) = -(v19 * (top + bottom));
  }
  v25 = self->_innerImageView;
  v26[0] = v27;
  v26[1] = v28;
  v26[2] = v29;
  [(SKUIImageView *)v25 setTransform:v26];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SKUIParallaxImageView *)self frame];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)SKUIParallaxImageView;
    -[SKUIParallaxImageView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    [(SKUIParallaxImageView *)self _updateInnerImageView];
    [(SKUIParallaxImageView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_updateInnerImageView
{
  [(SKUIParallaxImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  CGFloat v7 = self->_imagePadding.left + self->_imagePadding.right;
  double v9 = v8 + v7;
  CGFloat v10 = self->_imagePadding.top + self->_imagePadding.bottom;
  double v12 = v11 + v10;
  -[SKUIImageView setImageSize:](self->_innerImageView, "setImageSize:", v7 + self->_imageSize.width, v10 + self->_imageSize.height);
  innerImageView = self->_innerImageView;

  -[SKUIImageView setFrame:](innerImageView, "setFrame:", v4, v6, v9, v12);
}

- (void).cxx_destruct
{
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIParallaxImageView initWithFrame:]";
}

@end