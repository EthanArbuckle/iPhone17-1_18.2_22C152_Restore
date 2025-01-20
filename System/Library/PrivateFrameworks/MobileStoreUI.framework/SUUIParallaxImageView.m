@interface SUUIParallaxImageView
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
- (CGSize)imageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIParallaxImageView)initWithFrame:(CGRect)a3;
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

@implementation SUUIParallaxImageView

- (SUUIParallaxImageView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIParallaxImageView;
  v3 = -[SUUIParallaxImageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUIImageView alloc];
    [(SUUIParallaxImageView *)v3 bounds];
    uint64_t v5 = -[SUUIImageView initWithFrame:](v4, "initWithFrame:");
    innerImageView = v3->_innerImageView;
    v3->_innerImageView = (SUUIImageView *)v5;

    [(SUUIParallaxImageView *)v3 addSubview:v3->_innerImageView];
    [(SUUIParallaxImageView *)v3 setClipsToBounds:1];
  }
  return v3;
}

- (void)setImagePadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_imagePadding.left
    || a3.top != self->_imagePadding.top
    || a3.right != self->_imagePadding.right
    || a3.bottom != self->_imagePadding.bottom)
  {
    self->_imagePadding = a3;
    [(SUUIParallaxImageView *)self _updateInnerImageView];
    [(SUUIParallaxImageView *)self setNeedsLayout];
  }
}

- (id)image
{
  return (id)[(SUUIImageView *)self->_innerImageView image];
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
  return [(SUUIImageView *)self->_innerImageView placeholder];
}

- (void)setPlaceholder:(id)a3
{
}

- (void)setImageSize:(CGSize)a3
{
  if (a3.width != self->_imageSize.width || a3.height != self->_imageSize.height)
  {
    self->_imageSize = a3;
    [(SUUIParallaxImageView *)self _updateInnerImageView];
    [(SUUIParallaxImageView *)self setNeedsLayout];
  }
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  return 0.0;
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  [(SUUIParallaxImageView *)self frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [(SUUIParallaxImageView *)self window];
  -[SUUIParallaxImageView convertPoint:toView:](self, "convertPoint:toView:", v7, v4, v6);
  double v9 = v8;
  double v11 = v10;

  v12 = [(SUUIParallaxImageView *)self window];
  [v12 frame];
  double v13 = v9 / CGRectGetWidth(v30);

  v14 = [(SUUIParallaxImageView *)self window];
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
    [(SUUIImageView *)innerImageView transform];
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
  [(SUUIImageView *)v25 setTransform:v26];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUUIParallaxImageView *)self frame];
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
    v12.super_class = (Class)SUUIParallaxImageView;
    -[SUUIParallaxImageView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    [(SUUIParallaxImageView *)self _updateInnerImageView];
    [(SUUIParallaxImageView *)self setNeedsLayout];
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
  [(SUUIParallaxImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  CGFloat v7 = self->_imagePadding.left + self->_imagePadding.right;
  double v9 = v8 + v7;
  CGFloat v10 = self->_imagePadding.top + self->_imagePadding.bottom;
  double v12 = v11 + v10;
  -[SUUIImageView setImageSize:](self->_innerImageView, "setImageSize:", v7 + self->_imageSize.width, v10 + self->_imageSize.height);
  innerImageView = self->_innerImageView;
  -[SUUIImageView setFrame:](innerImageView, "setFrame:", v4, v6, v9, v12);
}

- (void).cxx_destruct
{
}

@end