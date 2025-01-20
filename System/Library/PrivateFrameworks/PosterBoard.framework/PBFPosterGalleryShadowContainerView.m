@interface PBFPosterGalleryShadowContainerView
+ (Class)layerClass;
- (BOOL)isPerspectiveEnabled;
- (CGAffineTransform)contentTransform;
- (CGAffineTransform)shadowSupplementalTransform;
- (PBFPosterGalleryShadowContainerView)initWithContentView:(id)a3 shadowView:(id)a4 perspectiveEnabled:(BOOL)a5;
- (PBFShadowMetricsProviding)shadowView;
- (UIView)contentView;
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

@implementation PBFPosterGalleryShadowContainerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (PBFPosterGalleryShadowContainerView)initWithContentView:(id)a3 shadowView:(id)a4 perspectiveEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PBFPosterGalleryShadowContainerView;
  v10 = [(PBFPosterGalleryShadowContainerView *)&v19 init];
  v11 = v10;
  if (v10)
  {
    [(PBFPosterGalleryShadowContainerView *)v10 setContentView:v8];
    [(PBFPosterGalleryShadowContainerView *)v11 setShadowView:v9];
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v16 = *MEMORY[0x1E4F1DAB8];
    long long v14 = v16;
    long long v17 = v15;
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v13 = v18;
    [(PBFPosterGalleryShadowContainerView *)v11 setContentTransform:&v16];
    long long v16 = v14;
    long long v17 = v15;
    long long v18 = v13;
    [(PBFPosterGalleryShadowContainerView *)v11 setShadowSupplementalTransform:&v16];
    [(PBFPosterGalleryShadowContainerView *)v11 setPerspectiveEnabled:v5];
  }

  return v11;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PBFPosterGalleryShadowContainerView;
  [(PBFPosterGalleryShadowContainerView *)&v18 layoutSubviews];
  [(PBFPosterGalleryShadowContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  UIRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  -[UIView setBounds:](self->_contentView, "setBounds:", v4, v6, v8, v10);
  -[UIView setCenter:](self->_contentView, "setCenter:", v12, v14);
  contentView = self->_contentView;
  long long v16 = *(_OWORD *)&self->_contentTransform.c;
  v17[0] = *(_OWORD *)&self->_contentTransform.a;
  v17[1] = v16;
  v17[2] = *(_OWORD *)&self->_contentTransform.tx;
  [(UIView *)contentView setTransform:v17];
  [(PBFPosterGalleryShadowContainerView *)self _layoutShadowView];
  [(PBFPosterGalleryShadowContainerView *)self bringSubviewToFront:self->_contentView];
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
    [(PBFPosterGalleryShadowContainerView *)self setNeedsLayout];
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock]) {
      [(PBFPosterGalleryShadowContainerView *)self layoutIfNeeded];
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
    [(PBFPosterGalleryShadowContainerView *)self setNeedsLayout];
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock]) {
      [(PBFPosterGalleryShadowContainerView *)self layoutIfNeeded];
    }
  }
}

- (void)setContentView:(id)a3
{
  double v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    long long v7 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(PBFPosterGalleryShadowContainerView *)self addSubview:self->_contentView];
    [(PBFPosterGalleryShadowContainerView *)self _updateZPositions];
    double v5 = v7;
  }
}

- (void)setShadowView:(id)a3
{
  double v5 = (PBFShadowMetricsProviding *)a3;
  p_shadowView = &self->_shadowView;
  shadowView = self->_shadowView;
  if (shadowView != v5)
  {
    [(PBFShadowMetricsProviding *)shadowView removeFromSuperview];
    long long v8 = *p_shadowView;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v10[0] = *MEMORY[0x1E4F1DAB8];
    v10[1] = v9;
    v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(PBFShadowMetricsProviding *)v8 setTransform:v10];
    objc_storeStrong((id *)&self->_shadowView, a3);
    [(PBFPosterGalleryShadowContainerView *)self addSubview:*p_shadowView];
    [(PBFPosterGalleryShadowContainerView *)self _updateShadowView];
    [(PBFPosterGalleryShadowContainerView *)self _updateZPositions];
  }
}

- (void)setPerspectiveEnabled:(BOOL)a3
{
  if (self->_perspectiveEnabled != a3)
  {
    self->_perspectiveEnabled = a3;
    [(PBFPosterGalleryShadowContainerView *)self _updateZPositions];
  }
  [(PBFPosterGalleryShadowContainerView *)self _updateShadowView];
}

- (void)_updateShadowView
{
  [(PBFPosterGalleryShadowContainerView *)self setNeedsLayout];
  if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
  {
    [(PBFPosterGalleryShadowContainerView *)self layoutIfNeeded];
  }
}

- (void)_layoutShadowView
{
  shadowView = self->_shadowView;
  [(UIView *)self->_contentView frame];
  -[PBFShadowMetricsProviding frameWithContentWithFrame:](shadowView, "frameWithContentWithFrame:");
  -[PBFShadowMetricsProviding setBounds:](self->_shadowView, "setBounds:", 0.0, 0.0);
  double v4 = self->_shadowView;
  UIRectGetCenter();
  -[PBFShadowMetricsProviding setCenter:](v4, "setCenter:");
  [(PBFShadowMetricsProviding *)self->_shadowView setNeedsLayout];
  long long v5 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_contentTransform.tx;
  memset(&v10, 0, sizeof(v10));
  long long v6 = *(_OWORD *)&self->_shadowSupplementalTransform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->_shadowSupplementalTransform.a;
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->_shadowSupplementalTransform.tx;
  CGAffineTransformConcat(&v10, &t1, &v8);
  if (self->_perspectiveEnabled)
  {
    CGAffineTransform v8 = v10;
    CGAffineTransformScale(&t1, &v8, 1.2, 1.2);
    CGAffineTransform v10 = t1;
  }
  long long v7 = self->_shadowView;
  CGAffineTransform t1 = v10;
  [(PBFShadowMetricsProviding *)v7 setTransform:&t1];
}

- (void)_updateZPositions
{
  uint64_t v3 = MEMORY[0x1E4F39B10];
  BOOL perspectiveEnabled = self->_perspectiveEnabled;
  long long v5 = [(PBFShadowMetricsProviding *)self->_shadowView layer];
  long long v6 = v5;
  if (perspectiveEnabled)
  {
    [v5 setZPosition:-80.0];

    long long v7 = [(UIView *)self->_contentView layer];
    [v7 setZPosition:20.0];
    unint64_t v8 = 0xBF60624DD2F1A9FCLL;
  }
  else
  {
    unint64_t v8 = *(void *)(v3 + 88);
    [v5 setZPosition:0.0];

    long long v7 = [(UIView *)self->_contentView layer];
    [v7 setZPosition:0.0];
  }

  long long v9 = [(PBFPosterGalleryShadowContainerView *)self layer];
  long long v10 = *(_OWORD *)(v3 + 48);
  v13[2] = *(_OWORD *)(v3 + 32);
  v13[3] = v10;
  v13[4] = *(_OWORD *)(v3 + 64);
  uint64_t v14 = *(void *)(v3 + 80);
  long long v11 = *(_OWORD *)(v3 + 16);
  v13[0] = *(_OWORD *)v3;
  v13[1] = v11;
  unint64_t v15 = v8;
  long long v12 = *(_OWORD *)(v3 + 112);
  long long v16 = *(_OWORD *)(v3 + 96);
  long long v17 = v12;
  [v9 setTransform:v13];

  [(PBFPosterGalleryShadowContainerView *)self setNeedsLayout];
}

- (PBFShadowMetricsProviding)shadowView
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

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
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