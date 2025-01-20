@interface UIKBBackdropView
- (BOOL)_applyCornerMaskToSelf;
- (UIImage)imageForCorners;
- (UIKBBackdropView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (id)_generateCornerContentsImage:(unint64_t)a3;
- (int)textEffectsVisibilityLevel;
- (void)_setRenderConfig:(id)a3;
- (void)setImageForCorners:(id)a3;
- (void)transitionToStyle:(int64_t)a3;
- (void)updateCorners:(unint64_t)a3;
@end

@implementation UIKBBackdropView

- (UIKBBackdropView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = +[UIKBRenderConfig backdropStyleForStyle:quality:](UIKBRenderConfig, "backdropStyleForStyle:quality:", a4, +[UIKBRenderFactory _graphicsQuality]);
  v18.receiver = self;
  v18.super_class = (Class)UIKBBackdropView;
  v10 = -[UIVisualEffectView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(UIVisualEffectView *)v10 _setGroupName:@"UIKBBackdropGroupName"];
    uint64_t v12 = *MEMORY[0x1E4F39DA0];
    v13 = [(UIVisualEffectView *)v11 _captureGroup];
    [v13 setGroupNamespace:v12];

    v14 = _UIKBEffectsForStyle(v9, 0);
    [(UIVisualEffectView *)v11 setBackgroundEffects:v14];

    v15 = +[UIColor systemBackgroundColor];
    v16 = [v15 colorWithAlphaComponent:0.1];
    [(UIView *)v11 setBackgroundColor:v16];
  }
  return v11;
}

- (BOOL)_applyCornerMaskToSelf
{
  return 1;
}

- (void)transitionToStyle:(int64_t)a3
{
  _UIKBEffectsForStyle(a3, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIVisualEffectView *)self setBackgroundEffects:v4];
}

- (id)_generateCornerContentsImage:(unint64_t)a3
{
  double v4 = UIKBCornerRadius();
  long long v10 = *MEMORY[0x1E4F1DAD8];
  v5 = +[UIGraphicsImageRendererFormat preferredFormat];
  [v5 setPreferredRange:0x7FFFLL];
  v6 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v5, v4 + v4, v4 + v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__UIKBBackdropView__generateCornerContentsImage___block_invoke;
  v9[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
  double v11 = v4 + v4;
  double v12 = v4 + v4;
  double v13 = v4;
  unint64_t v14 = a3;
  v7 = [(UIGraphicsImageRenderer *)v6 imageWithActions:v9];

  return v7;
}

void __49__UIKBBackdropView__generateCornerContentsImage___block_invoke(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  CGContextSaveGState(v3);
  UIKBAddRoundedRect(v3, *(void *)(a1 + 72), *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(CGFloat *)(a1 + 64));
  CGContextClosePath(v3);
  id v4 = +[UIColor blackColor];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v4 CGColor]);

  CGContextFillPath(v3);
  CGContextRestoreGState(v3);
}

- (void)updateCorners:(unint64_t)a3
{
  char v3 = a3;
  -[UIKBBackdropView _generateCornerContentsImage:](self, "_generateCornerContentsImage:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = +[_UIVisualEffectViewCornerMask imageCornerMaskWithImage:v7 radius:UIKBCornerRadius()];
  v6 = [v5 cornerMaskAppliedToCorners:v3 & 0xF];
  [(UIVisualEffectView *)self _setCornerMask:v6];
}

- (void)setImageForCorners:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_imageForCorners != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->_imageForCorners, a3);
    imageForCorners = self->_imageForCorners;
    [(UIVisualEffectView *)self _cornerRadius];
    id v7 = +[_UIVisualEffectViewCornerMask imageCornerMaskWithImage:radius:](_UIVisualEffectViewCornerMask, "imageCornerMaskWithImage:radius:", imageForCorners);
    v8 = [v7 cornerMaskEffectingEdges:1];
    [(UIVisualEffectView *)self _setCornerMask:v8];

    v5 = v9;
  }
}

- (int)textEffectsVisibilityLevel
{
  return 9;
}

- (void)_setRenderConfig:(id)a3
{
  uint64_t v4 = [a3 backdropStyle];
  [(UIKBBackdropView *)self transitionToStyle:v4];
}

- (UIImage)imageForCorners
{
  return self->_imageForCorners;
}

- (void).cxx_destruct
{
}

@end