@interface SBIconImageCrossfadeView
+ (Class)_containerViewClass;
- (BOOL)masksCorners;
- (BOOL)performsTrueCrossfade;
- (CGPoint)stretchAnchorPoint;
- (SBCrossfadingIconImageSource)iconImageSource;
- (SBIconImageCrossfadeView)initWithSource:(id)a3 crossfadeView:(id)a4;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIView)crossfadeContainerView;
- (UIView)crossfadeView;
- (UIView)iconImageView;
- (double)morphFraction;
- (unint64_t)crossfadeStyle;
- (void)_applyCornerRadius:(double)a3;
- (void)_applyCrossfadeScaleX:(double)a3 scaleY:(double)a4;
- (void)_setCornerRadiusEnabled:(BOOL)a3;
- (void)_updateCornerMask;
- (void)cleanup;
- (void)layoutSubviews;
- (void)prepareGeometry;
- (void)setAppSnapshotCornerRadius:(double)a3;
- (void)setCrossfadeFraction:(double)a3;
- (void)setCrossfadeStyle:(unint64_t)a3;
- (void)setCrossfadeViewFadeFraction:(double)a3;
- (void)setMasksCorners:(BOOL)a3;
- (void)setMorphFraction:(double)a3;
- (void)setPerformsTrueCrossfade:(BOOL)a3;
- (void)setSourceFadeFraction:(double)a3;
- (void)setStretchAnchorPoint:(CGPoint)a3;
@end

@implementation SBIconImageCrossfadeView

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)SBIconImageCrossfadeView;
  [(SBIconImageCrossfadeView *)&v53 layoutSubviews];
  [(SBIconImageCrossfadeView *)self bounds];
  rect.origin.y = v3;
  [(SBCrossfadingIconImageSource *)self->_iconImageSource visibleBounds];
  CGFloat v47 = v5;
  rect.origin.x = v4;
  double v7 = v6;
  double v9 = v8;
  double morphFraction = self->_morphFraction;
  CGFloat v11 = 1.0 - morphFraction * (1.0 - self->_containerScaleX);
  CGFloat v12 = 1.0 - morphFraction * (1.0 - self->_containerScaleY);
  memset(&v52, 0, sizeof(v52));
  CGAffineTransformMakeScale(&v52, v11, v12);
  v13 = [(UIView *)self->_containerView layer];
  [v13 anchorPoint];
  double v15 = v14;
  double v17 = v16;

  UIRectGetCenter();
  double v45 = 1.0 - v11;
  double v46 = v11;
  double v19 = v18 + (1.0 - v11) * (v15 + -0.5) * v7;
  double v21 = v20 + (1.0 - v12) * (v17 + -0.5) * v9;
  double v22 = v7 * v11;
  double v23 = v12;
  double v24 = v9 * v12;
  -[UIView setFrame:](self->_containerView, "setFrame:", v19 + v22 * -0.5, v21 + v9 * v12 * -0.5, v22, v9 * v12);
  backgroundView = self->_backgroundView;
  [(UIView *)self->_containerView bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");
  v54.origin.x = rect.origin.x;
  v54.origin.y = v47;
  v54.size.width = v7;
  v54.size.height = v9;
  if (CGRectGetWidth(v54) <= 0.0) {
    double v26 = 1.0;
  }
  else {
    double v26 = rect.origin.y / v7;
  }
  CGAffineTransformMakeScale(&v51, v26, v26);
  double d = v51.d;
  double b = v51.b;
  double v29 = v24 * v51.c + v51.a * v22;
  iconImageView = self->_iconImageView;
  [(UIView *)self->_containerView bounds];
  UIRectGetCenter();
  -[UIView setCenter:](iconImageView, "setCenter:");
  if (v29 > 0.0 && v24 * d + b * v22 > 0.0) {
    -[UIView setBounds:](self->_iconImageView, "setBounds:", 0.0, 0.0, v29);
  }
  if (objc_opt_respondsToSelector()) {
    [(SBCrossfadingIconImageSource *)self->_iconImageSource alternateContentsLayer];
  }
  else {
  v31 = [(UIView *)self->_iconImageView layer];
  }
  v32 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v32 scale];
  double v34 = v33;

  [v31 setContentsScale:v34];
  unint64_t crossfadeStyle = self->_crossfadeStyle;
  if (crossfadeStyle == 1)
  {
    [(UIView *)self->_iconImageView setContentMode:1];
    v38 = self->_iconImageView;
    v39 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)v38 setBackgroundColor:v39];
  }
  else if (!crossfadeStyle)
  {
    double v36 = v46;
    if (v46 <= v23)
    {
      double v37 = 0.0;
      double v36 = 1.0;
      if (v46 < v23)
      {
        v40 = v31;
        double v41 = v23;
LABEL_18:
        objc_msgSend(v40, "setContentsRect:", v37, 0.0, v36, v41);
        goto LABEL_19;
      }
    }
    else
    {
      double v37 = v45 * 0.5;
    }
    double v41 = 1.0;
    v40 = v31;
    goto LABEL_18;
  }
LABEL_19:
  crossfadeContainerView = self->_crossfadeContainerView;
  [(UIView *)self->_containerView bounds];
  UIRectGetCenter();
  -[UIView setCenter:](crossfadeContainerView, "setCenter:");
  v43 = self->_crossfadeContainerView;
  rect.size = *(CGSize *)&v52.a;
  long long v49 = *(_OWORD *)&v52.c;
  long long v50 = *(_OWORD *)&v52.tx;
  [(UIView *)v43 setTransform:&rect.size];
  crossfadeView = self->_crossfadeView;
  [(UIView *)self->_crossfadeContainerView bounds];
  UIRectGetCenter();
  -[UIView setCenter:](crossfadeView, "setCenter:");
}

- (void)setAppSnapshotCornerRadius:(double)a3
{
  if ([(SBIconImageCrossfadeView *)self masksCorners])
  {
    [(SBIconImageCrossfadeView *)self _applyCornerRadius:a3];
  }
}

- (BOOL)masksCorners
{
  return self->_masksCorners;
}

- (void)setMorphFraction:(double)a3
{
  if (self->_morphFraction != a3)
  {
    self->_double morphFraction = a3;
    [(SBIconImageCrossfadeView *)self setNeedsLayout];
    [(SBIconImageCrossfadeView *)self layoutIfNeeded];
  }
}

- (void)setStretchAnchorPoint:(CGPoint)a3
{
  p_stretchAnchorPoint = &self->_stretchAnchorPoint;
  self->_stretchAnchorPoint = a3;
  id v13 = [(SBIconImageCrossfadeView *)self containerView];
  [v13 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CGFloat v12 = [v13 layer];
  objc_msgSend(v12, "setAnchorPoint:", p_stretchAnchorPoint->x, p_stretchAnchorPoint->y);

  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)setPerformsTrueCrossfade:(BOOL)a3
{
  self->_performsTrueCrossfade = a3;
}

- (void)setMasksCorners:(BOOL)a3
{
  if (self->_masksCorners != a3)
  {
    if (a3)
    {
      [(SBCrossfadingIconImageSource *)self->_iconImageSource continuousCornerRadius];
      int v4 = BSFloatIsZero() ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
    self->_masksCorners = v4;
    [(SBIconImageCrossfadeView *)self _updateCornerMask];
  }
}

- (void)setCrossfadeStyle:(unint64_t)a3
{
  if (self->_crossfadeStyle != a3)
  {
    self->_unint64_t crossfadeStyle = a3;
    [(SBIconImageCrossfadeView *)self setNeedsLayout];
    [(SBIconImageCrossfadeView *)self layoutIfNeeded];
  }
}

- (void)prepareGeometry
{
  backgroundView = self->_backgroundView;
  [(UIView *)self->_iconImageView bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");
  [(SBCrossfadingIconImageSource *)self->_iconImageSource visibleBounds];
  double v5 = v4;
  double v7 = v6;
  [(UIView *)self->_crossfadeView bounds];
  if (v8 == 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = v5 / v8;
  }
  if (v9 == 0.0) {
    double v11 = 0.0;
  }
  else {
    double v11 = v7 / v9;
  }
  [(SBIconImageCrossfadeView *)self _applyCrossfadeScaleX:v10 scaleY:v11];
  self->_containerScaleY = 1.0;
  self->_containerScaleX = 1.0;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    if (v10 >= v11)
    {
      double v13 = v10 / v11;
      if (v11 == 0.0) {
        double v13 = 0.0;
      }
      self->_containerScaleY = v13;
    }
    else
    {
      double v12 = v11 / v10;
      if (v10 == 0.0) {
        double v12 = 0.0;
      }
      self->_containerScaleX = v12;
    }
  }
}

- (SBIconImageCrossfadeView)initWithSource:(id)a3 crossfadeView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBIconImageCrossfadeView;
  double v9 = -[SBIconImageCrossfadeView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v9)
  {
    double v10 = (objc_class *)[(id)objc_opt_class() _containerViewClass];
    double v11 = (UIView *)objc_alloc_init(v10);
    containerView = v9->_containerView;
    v9->_containerView = v11;

    [(SBIconImageCrossfadeView *)v9 addSubview:v9->_containerView];
    objc_storeStrong((id *)&v9->_iconImageSource, a3);
    uint64_t v13 = [(SBCrossfadingIconImageSource *)v9->_iconImageSource sourceView];
    iconImageView = v9->_iconImageView;
    v9->_iconImageView = (UIView *)v13;

    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [(SBCrossfadingIconImageSource *)v9->_iconImageSource sourceBackgroundView:v9->_iconImageView];
      backgroundView = v9->_backgroundView;
      v9->_backgroundView = (UIView *)v15;

      if (v9->_backgroundView) {
        -[UIView addSubview:](v9->_containerView, "addSubview:");
      }
    }
    [(UIView *)v9->_containerView addSubview:v9->_iconImageView];
    id v17 = [v10 alloc];
    [v8 bounds];
    uint64_t v18 = objc_msgSend(v17, "initWithFrame:");
    crossfadeContainerView = v9->_crossfadeContainerView;
    v9->_crossfadeContainerView = (UIView *)v18;

    [(UIView *)v9->_containerView addSubview:v9->_crossfadeContainerView];
    objc_storeStrong((id *)&v9->_crossfadeView, a4);
    [(UIView *)v9->_crossfadeContainerView addSubview:v9->_crossfadeView];
  }

  return v9;
}

- (void)_updateCornerMask
{
  [(SBIconImageCrossfadeView *)self _setCornerRadiusEnabled:self->_masksCorners];
  if (!self->_masksCorners)
  {
    [(SBIconImageCrossfadeView *)self _applyCornerRadius:0.0];
  }
}

- (void)_setCornerRadiusEnabled:(BOOL)a3
{
  iconImageSource = self->_iconImageSource;
  if (a3)
  {
    [(SBCrossfadingIconImageSource *)iconImageSource setShowsSquareCorners:1];
    id v8 = [(SBIconImageCrossfadeView *)self containerView];
    double v5 = [v8 layer];
    double v6 = v5;
    uint64_t v7 = 1;
  }
  else
  {
    -[SBCrossfadingIconImageSource setShowsSquareCorners:](iconImageSource, "setShowsSquareCorners:");
    id v8 = [(SBIconImageCrossfadeView *)self containerView];
    double v5 = [v8 layer];
    double v6 = v5;
    uint64_t v7 = 0;
  }
  [v5 setMasksToBounds:v7];
}

- (void)_applyCornerRadius:(double)a3
{
  id v4 = [(SBIconImageCrossfadeView *)self containerView];
  [v4 _setContinuousCornerRadius:a3];
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)_applyCrossfadeScaleX:(double)a3 scaleY:(double)a4
{
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeScale(&v7, a3, a4);
  crossfadeView = self->_crossfadeView;
  CGAffineTransform v6 = v7;
  [(UIView *)crossfadeView setTransform:&v6];
}

+ (Class)_containerViewClass
{
  return (Class)self;
}

- (void)setCrossfadeFraction:(double)a3
{
  -[SBIconImageCrossfadeView setSourceFadeFraction:](self, "setSourceFadeFraction:");
  [(SBIconImageCrossfadeView *)self setCrossfadeViewFadeFraction:a3];
}

- (void)setSourceFadeFraction:(double)a3
{
  if (self->_performsTrueCrossfade)
  {
    double v4 = 1.0 - a3;
    [(UIView *)self->_iconImageView setAlpha:1.0 - a3];
    backgroundView = self->_backgroundView;
    [(UIView *)backgroundView setAlpha:v4];
  }
}

- (void)cleanup
{
  [(UIView *)self->_iconImageView setAlpha:1.0];
  [(SBCrossfadingIconImageSource *)self->_iconImageSource setShowsSquareCorners:0];
  [(UIView *)self->_crossfadeView setAlpha:1.0];
  crossfadeView = self->_crossfadeView;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)crossfadeView setTransform:v5];
}

- (void)setCrossfadeViewFadeFraction:(double)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_crossfadeView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconImageSource, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (BOOL)performsTrueCrossfade
{
  return self->_performsTrueCrossfade;
}

- (CGPoint)stretchAnchorPoint
{
  double x = self->_stretchAnchorPoint.x;
  double y = self->_stretchAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)crossfadeStyle
{
  return self->_crossfadeStyle;
}

- (SBCrossfadingIconImageSource)iconImageSource
{
  return self->_iconImageSource;
}

- (UIView)iconImageView
{
  return self->_iconImageView;
}

- (UIView)crossfadeView
{
  return self->_crossfadeView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)crossfadeContainerView
{
  return self->_crossfadeContainerView;
}

- (double)morphFraction
{
  return self->_morphFraction;
}

@end