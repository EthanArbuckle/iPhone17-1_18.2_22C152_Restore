@interface _UIVerticalEdgeShadowView
- (_UIVerticalEdgeShadowView)initWithWidth:(double)a3 edge:(unint64_t)a4;
- (double)width;
- (unint64_t)edge;
- (void)_loadImageIfNecessary;
- (void)layoutSubviews;
@end

@implementation _UIVerticalEdgeShadowView

- (_UIVerticalEdgeShadowView)initWithWidth:(double)a3 edge:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIVerticalEdgeShadowView;
  v6 = -[UIImageView initWithFrame:](&v9, sel_initWithFrame_, 0.0, 0.0, a3, 1.0);
  v7 = v6;
  if (v6)
  {
    [(UIImageView *)v6 setContentMode:0];
    v7->_width = a3;
    v7->_edge = a4;
  }
  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIVerticalEdgeShadowView;
  [(UIImageView *)&v3 layoutSubviews];
  [(_UIVerticalEdgeShadowView *)self _loadImageIfNecessary];
}

- (void)_loadImageIfNecessary
{
  objc_super v3 = [(UIImageView *)self image];

  if (!v3)
  {
    double width = self->_width;
    id v20 = [(UIView *)self _screen];
    [v20 scale];
    double v6 = v5;
    unint64_t edge = self->_edge;
    if (qword_1EB25D348 != -1) {
      dispatch_once(&qword_1EB25D348, &__block_literal_global_301);
    }
    v8 = [[_UIShadowViewImageCacheKey alloc] initWithSize:2 * (edge != 2) scale:width options:v6];
    objc_super v9 = [(id)_MergedGlobals_11_7 objectForKey:v8];
    if (!v9)
    {
      _UIGraphicsBeginImageContextWithOptions(0, 1, width, 1.0, v6);
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1) {
        v11 = 0;
      }
      else {
        v11 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      id v12 = +[UIColor blackColor];
      CGContextSetFillColorWithColor(v11, (CGColorRef)[v12 CGColor]);

      id v13 = +[UIColor blackColor];
      v14 = (CGColor *)[v13 CGColor];
      CGContextSetShadowWithColor(v11, *MEMORY[0x1E4F1DB30], width * v6, v14);

      double v15 = -width;
      if (edge == 2) {
        double v15 = width;
      }
      double v16 = width * -0.5;
      double v17 = width;
      double v18 = width;
      CGContextFillRect(v11, *(CGRect *)&v15);
      v19 = _UIGraphicsGetImageFromCurrentImageContext(0);
      objc_super v9 = [v19 imageFlippedForRightToLeftLayoutDirection];

      UIGraphicsEndImageContext();
      if (v9) {
        [(id)_MergedGlobals_11_7 setObject:v9 forKey:v8];
      }
    }

    [(UIImageView *)self setImage:v9];
  }
}

- (double)width
{
  return self->_width;
}

- (unint64_t)edge
{
  return self->_edge;
}

@end