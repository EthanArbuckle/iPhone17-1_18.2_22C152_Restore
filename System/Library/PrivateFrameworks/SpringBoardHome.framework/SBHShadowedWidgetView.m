@interface SBHShadowedWidgetView
+ (Class)layerClass;
- (BOOL)isPerspectiveEnabled;
- (CGAffineTransform)contentTransform;
- (CGAffineTransform)shadowSupplementalTransform;
- (SBHShadowedWidgetView)initWithContentView:(id)a3 shadowView:(id)a4 perspectiveEnabled:(BOOL)a5;
- (UIView)contentView;
- (UIView)shadowView;
- (double)cornerRadius;
- (void)_layoutShadowView;
- (void)_updateShadowView;
- (void)_updateZPositions;
- (void)layoutSubviews;
- (void)setContentTransform:(CGAffineTransform *)a3;
- (void)setContentView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setPerspectiveEnabled:(BOOL)a3;
- (void)setShadowSupplementalTransform:(CGAffineTransform *)a3;
- (void)setShadowView:(id)a3;
@end

@implementation SBHShadowedWidgetView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SBHShadowedWidgetView)initWithContentView:(id)a3 shadowView:(id)a4 perspectiveEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SBHShadowedWidgetView;
  v10 = [(SBHShadowedWidgetView *)&v30 init];
  v11 = v10;
  if (v10)
  {
    v12 = [(SBHShadowedWidgetView *)v10 layer];
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v24 = v13;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    uint64_t v14 = *(void *)(MEMORY[0x1E4F39B10] + 80);
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v21 = *MEMORY[0x1E4F39B10];
    long long v22 = v15;
    uint64_t v26 = v14;
    unint64_t v27 = 0xBF60624DD2F1A9FCLL;
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v29 = v16;
    [v12 setTransform:&v21];

    [(SBHShadowedWidgetView *)v11 setContentView:v8];
    [(SBHShadowedWidgetView *)v11 setShadowView:v9];
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v21 = *MEMORY[0x1E4F1DAB8];
    long long v19 = v21;
    long long v22 = v20;
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v18 = v23;
    [(SBHShadowedWidgetView *)v11 setContentTransform:&v21];
    long long v21 = v19;
    long long v22 = v20;
    long long v23 = v18;
    [(SBHShadowedWidgetView *)v11 setShadowSupplementalTransform:&v21];
    [(SBHShadowedWidgetView *)v11 setPerspectiveEnabled:v5];
  }

  return v11;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SBHShadowedWidgetView;
  [(SBHShadowedWidgetView *)&v6 layoutSubviews];
  [(SBHShadowedWidgetView *)self bounds];
  UIRectGetCenter();
  -[UIView setCenter:](self->_contentView, "setCenter:");
  contentView = self->_contentView;
  long long v4 = *(_OWORD *)&self->_contentTransform.c;
  v5[0] = *(_OWORD *)&self->_contentTransform.a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&self->_contentTransform.tx;
  [(UIView *)contentView setTransform:v5];
  [(SBHShadowedWidgetView *)self _updateShadowView];
  [(SBHShadowedWidgetView *)self _layoutShadowView];
  [(SBHShadowedWidgetView *)self bringSubviewToFront:self->_contentView];
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  p_contentTransform = &self->_contentTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->_contentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_contentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_contentTransform->tx = v9;
    *(_OWORD *)&p_contentTransform->a = v8;
    [(SBHShadowedWidgetView *)self setNeedsLayout];
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled]) {
      [(SBHShadowedWidgetView *)self layoutIfNeeded];
    }
  }
}

- (void)setShadowSupplementalTransform:(CGAffineTransform *)a3
{
  p_shadowSupplementalTransform = &self->_shadowSupplementalTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_shadowSupplementalTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_shadowSupplementalTransform.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->_shadowSupplementalTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_shadowSupplementalTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_shadowSupplementalTransform->tx = v9;
    *(_OWORD *)&p_shadowSupplementalTransform->a = v8;
    [(SBHShadowedWidgetView *)self setNeedsLayout];
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled]) {
      [(SBHShadowedWidgetView *)self layoutIfNeeded];
    }
  }
}

- (void)setContentView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    long long v7 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(SBHShadowedWidgetView *)self addSubview:self->_contentView];
    [(SBHShadowedWidgetView *)self _updateZPositions];
    BOOL v5 = v7;
  }
}

- (void)setShadowView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  p_shadowView = &self->_shadowView;
  shadowView = self->_shadowView;
  if (shadowView != v5)
  {
    [(UIView *)shadowView removeFromSuperview];
    long long v8 = *p_shadowView;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v10[0] = *MEMORY[0x1E4F1DAB8];
    v10[1] = v9;
    v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIView *)v8 setTransform:v10];
    self->_supportsShadowViewFrameProviding = objc_opt_respondsToSelector() & 1;
    objc_storeStrong((id *)&self->_shadowView, a3);
    [(SBHShadowedWidgetView *)self addSubview:*p_shadowView];
    [(SBHShadowedWidgetView *)self _updateShadowView];
    [(SBHShadowedWidgetView *)self _updateZPositions];
  }
}

- (void)setPerspectiveEnabled:(BOOL)a3
{
  if (self->_perspectiveEnabled != a3)
  {
    self->_perspectiveEnabled = a3;
    [(SBHShadowedWidgetView *)self _updateZPositions];
  }
  [(SBHShadowedWidgetView *)self _updateShadowView];
}

- (void)setCornerRadius:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerRadius = a3;
    [(SBHShadowedWidgetView *)self _setContinuousCornerRadius:a3];
    shadowView = self->_shadowView;
    [(UIView *)shadowView _setContinuousCornerRadius:a3];
  }
}

- (void)_updateShadowView
{
  if (self->_supportsShadowViewFrameProviding)
  {
    unsigned int v3 = [(id)objc_opt_class() supportsMaterialsBasedShadow];
    uint64_t v4 = self->_perspectiveEnabled ? 0 : v3;
    if ([(UIView *)self->_shadowView useMaterialBasedShadow] != v4)
    {
      [(UIView *)self->_shadowView setUseMaterialBasedShadow:v4];
      [(SBHShadowedWidgetView *)self setNeedsLayout];
      if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled])
      {
        [(SBHShadowedWidgetView *)self layoutIfNeeded];
      }
    }
  }
}

- (void)_layoutShadowView
{
  [(SBHShadowedWidgetView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  UIRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  shadowView = self->_shadowView;
  if (self->_supportsShadowViewFrameProviding)
  {
    int v16 = [(UIView *)shadowView useMaterialBasedShadow];
    v17 = self->_shadowView;
    if (v16)
    {
      [(UIView *)self->_contentView frame];
      -[UIView frameWithContentWithFrame:](v17, "frameWithContentWithFrame:");
      -[UIView setBounds:](self->_shadowView, "setBounds:", 0.0, 0.0);
      long long v18 = self->_shadowView;
      UIRectGetCenter();
      -[UIView setCenter:](v18, "setCenter:");
      [(UIView *)self->_shadowView setNeedsLayout];
      goto LABEL_6;
    }
    shadowView = self->_shadowView;
  }
  -[UIView setBounds:](shadowView, "setBounds:", v4, v6, v8, v10);
  -[UIView setCenter:](self->_shadowView, "setCenter:", v12, v14);
LABEL_6:
  long long v19 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&t1.c = v19;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_contentTransform.tx;
  memset(&v24, 0, sizeof(v24));
  long long v20 = *(_OWORD *)&self->_shadowSupplementalTransform.c;
  *(_OWORD *)&v22.a = *(_OWORD *)&self->_shadowSupplementalTransform.a;
  *(_OWORD *)&v22.c = v20;
  *(_OWORD *)&v22.tx = *(_OWORD *)&self->_shadowSupplementalTransform.tx;
  CGAffineTransformConcat(&v24, &t1, &v22);
  if (self->_perspectiveEnabled)
  {
    CGAffineTransform v22 = v24;
    CGAffineTransformScale(&t1, &v22, 1.2, 1.2);
    CGAffineTransform v24 = t1;
  }
  long long v21 = self->_shadowView;
  CGAffineTransform t1 = v24;
  [(UIView *)v21 setTransform:&t1];
}

- (void)_updateZPositions
{
  BOOL perspectiveEnabled = self->_perspectiveEnabled;
  double v4 = [(UIView *)self->_shadowView layer];
  double v5 = v4;
  if (perspectiveEnabled)
  {
    [v4 setZPosition:-80.0];

    double v6 = [(UIView *)self->_contentView layer];
    double v7 = v6;
    double v8 = 20.0;
  }
  else
  {
    [v4 setZPosition:0.0];

    double v6 = [(UIView *)self->_contentView layer];
    double v7 = v6;
    double v8 = 0.0;
  }
  [v6 setZPosition:v8];

  [(SBHShadowedWidgetView *)self setNeedsLayout];
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isPerspectiveEnabled
{
  return self->_perspectiveEnabled;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGAffineTransform)contentTransform
{
  long long v3 = *(_OWORD *)&self[9].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[9].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[9].ty;
  return self;
}

- (CGAffineTransform)shadowSupplementalTransform
{
  long long v3 = *(_OWORD *)&self[10].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[10].ty;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end