@interface SBSwitcherSnapshotImageView
- (BOOL)_isUsingExternalClassicLayout;
- (BOOL)allowStatusBarToOverlap;
- (BOOL)allowsEdgeAntialiasing;
- (BOOL)hasOpaqueContents;
- (BOOL)stretchToFillBounds;
- (BOOL)usesNonuniformScaling;
- (CGAffineTransform)scalingTransform;
- (SBSwitcherSnapshotImageView)initWithImage:(id)a3;
- (UIImage)image;
- (double)_transformHorizontalScale;
- (double)_transformScale;
- (double)_transformVerticalScale;
- (double)cornerRadius;
- (int64_t)orientationForClassicLayout;
- (unint64_t)maskedCorners;
- (void)_updateCornerRadius;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAllowStatusBarToOverlap:(BOOL)a3;
- (void)setAllowsEdgeAntialiasing:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHasOpaqueContents:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setOrientationForClassicLayout:(int64_t)a3;
- (void)setStretchToFillBounds:(BOOL)a3;
- (void)setUsesNonuniformScaling:(BOOL)a3;
@end

@implementation SBSwitcherSnapshotImageView

- (void)setHasOpaqueContents:(BOOL)a3
{
  if (self->_hasOpaqueContents != a3)
  {
    BOOL v3 = a3;
    self->_hasOpaqueContents = a3;
    v5 = [(SBSwitcherSnapshotImageView *)self layer];
    [v5 setContentsOpaque:self->_hasOpaqueContents];

    id v6 = [(UIImageView *)self->_imageView layer];
    [v6 setContentsOpaque:v3];
  }
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  if (self->_allowsEdgeAntialiasing != a3)
  {
    BOOL v3 = a3;
    self->_allowsEdgeAntialiasing = a3;
    id v4 = [(UIImageView *)self->_imageView layer];
    [v4 setAllowsEdgeAntialiasing:v3];
  }
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (SBSwitcherSnapshotImageView)initWithImage:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBSwitcherSnapshotImageView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[SBSwitcherSnapshotImageView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    v9->_maskedCorners = 15;
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v6, v7, v8);
    scalingView = v10->_scalingView;
    v10->_scalingView = (UIView *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v4];
    imageView = v10->_imageView;
    v10->_imageView = (UIImageView *)v13;

    [(UIImageView *)v10->_imageView setClipsToBounds:1];
    [(SBSwitcherSnapshotImageView *)v10 addSubview:v10->_scalingView];
    [(UIView *)v10->_scalingView addSubview:v10->_imageView];
    v15 = [(SBSwitcherSnapshotImageView *)v10 layer];
    [v15 setAllowsEdgeAntialiasing:0];

    v16 = [(UIImageView *)v10->_imageView layer];
    [v16 setAllowsEdgeAntialiasing:0];

    [(SBSwitcherSnapshotImageView *)v10 setHasOpaqueContents:1];
    [(SBSwitcherSnapshotImageView *)v10 layoutSubviews];
  }

  return v10;
}

- (void)setImage:(id)a3
{
  [(UIImageView *)self->_imageView setImage:a3];
  [(UIImageView *)self->_imageView sizeToFit];
  [(SBSwitcherSnapshotImageView *)self setNeedsLayout];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(SBSwitcherSnapshotImageView *)self _updateCornerRadius];
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    [(SBSwitcherSnapshotImageView *)self _updateCornerRadius];
  }
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (void)setOrientationForClassicLayout:(int64_t)a3
{
  if (self->_orientationForClassicLayout != a3)
  {
    self->_orientationForClassicLayout = a3;
    [(SBSwitcherSnapshotImageView *)self _updateCornerRadius];
  }
}

- (void)setStretchToFillBounds:(BOOL)a3
{
  if (self->_stretchToFillBounds != a3)
  {
    self->_stretchToFillBounds = a3;
    [(SBSwitcherSnapshotImageView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SBSwitcherSnapshotImageView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIView setBounds:](self->_scalingView, "setBounds:");
  scalingView = self->_scalingView;
  UIRectGetCenter();
  -[UIView setCenter:](scalingView, "setCenter:");
  [(UIImageView *)self->_imageView sizeToFit];
  memset(&v16, 0, sizeof(v16));
  [(SBSwitcherSnapshotImageView *)self scalingTransform];
  if (self->_stretchToFillBounds)
  {
    CGAffineTransform v14 = v16;
    memset(&v15, 0, sizeof(v15));
    CGAffineTransformInvert(&v15, &v14);
    CGAffineTransform v14 = v15;
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    CGRect v18 = CGRectApplyAffineTransform(v17, &v14);
    -[UIImageView setBounds:](self->_imageView, "setBounds:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  }
  imageView = self->_imageView;
  [(UIView *)self->_scalingView center];
  -[UIImageView setCenter:](imageView, "setCenter:");
  uint64_t v13 = self->_scalingView;
  CGAffineTransform v15 = v16;
  [(UIView *)v13 setTransform:&v15];
  [(SBSwitcherSnapshotImageView *)self _updateCornerRadius];
}

- (void)prepareForReuse
{
  [(SBSwitcherSnapshotImageView *)self setImage:0];
  [(SBSwitcherSnapshotImageView *)self setAlpha:1.0];
  [(SBSwitcherSnapshotImageView *)self setHidden:0];
  [(SBSwitcherSnapshotImageView *)self setHasOpaqueContents:0];
  [(SBSwitcherSnapshotImageView *)self setAllowsEdgeAntialiasing:0];
  [(SBSwitcherSnapshotImageView *)self setAllowStatusBarToOverlap:0];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  -[UIView setBounds:](self->_scalingView, "setBounds:", *MEMORY[0x1E4F1DB28], v4, v5, v6);
  scalingView = self->_scalingView;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v8;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)scalingView setTransform:v9];
  -[UIImageView setBounds:](self->_imageView, "setBounds:", v3, v4, v5, v6);
  self->_stretchToFillBounds = 0;
  self->_usesNonuniformScaling = 0;
  self->_orientationForClassicLayout = 0;
  self->_maskedCorners = 15;
  [(SBSwitcherSnapshotImageView *)self _updateCornerRadius];
}

- (CGAffineTransform)scalingTransform
{
  if ([(SBSwitcherSnapshotImageView *)self usesNonuniformScaling])
  {
    [(SBSwitcherSnapshotImageView *)self _transformHorizontalScale];
    CGFloat v6 = v5;
    [(SBSwitcherSnapshotImageView *)self _transformVerticalScale];
  }
  else
  {
    [(SBSwitcherSnapshotImageView *)self _transformScale];
    CGFloat v6 = v7;
  }
  return CGAffineTransformMakeScale(retstr, v6, v7);
}

- (double)_transformHorizontalScale
{
  [(UIImageView *)self->_imageView bounds];
  double Width = CGRectGetWidth(v6);
  char IsZero = BSFloatIsZero();
  double result = 1.0;
  if ((IsZero & 1) == 0)
  {
    [(SBSwitcherSnapshotImageView *)self bounds];
    return CGRectGetWidth(v7) / Width;
  }
  return result;
}

- (double)_transformVerticalScale
{
  [(UIImageView *)self->_imageView bounds];
  double Height = CGRectGetHeight(v6);
  char IsZero = BSFloatIsZero();
  double result = 1.0;
  if ((IsZero & 1) == 0)
  {
    [(SBSwitcherSnapshotImageView *)self bounds];
    return CGRectGetHeight(v7) / Height;
  }
  return result;
}

- (double)_transformScale
{
  [(SBSwitcherSnapshotImageView *)self _transformHorizontalScale];
  double v4 = v3;
  [(SBSwitcherSnapshotImageView *)self _transformVerticalScale];
  if (v4 < result) {
    return v4;
  }
  return result;
}

- (BOOL)_isUsingExternalClassicLayout
{
  return self->_orientationForClassicLayout != 0;
}

- (void)_updateCornerRadius
{
  imageView = self->_imageView;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v10[0] = *MEMORY[0x1E4F1DAB8];
  v10[1] = v4;
  v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIImageView *)imageView setTransform:v10];
  [(SBSwitcherSnapshotImageView *)self _transformScale];
  double v6 = 1.0 / v5 * self->_cornerRadius;
  if ([(SBSwitcherSnapshotImageView *)self _isUsingExternalClassicLayout])
  {
    if (SBFEffectiveHomeButtonType() == 2)
    {
      CGRect v7 = self->_imageView;
      int64_t orientationForClassicLayout = self->_orientationForClassicLayout;
      [(SBSwitcherSnapshotImageView *)self _transformScale];
      -[UIImageView sbClassicLayout_applyTransformsForClassicPresentationInLayoutSpaceForInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:](v7, "sbClassicLayout_applyTransformsForClassicPresentationInLayoutSpaceForInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:", orientationForClassicLayout, 1, self->_allowStatusBarToOverlap, self->_cornerRadius > 5.0);
    }
  }
  else
  {
    [(UIImageView *)self->_imageView _setContinuousCornerRadius:v6];
    double v9 = [(UIImageView *)self->_imageView layer];
    [v9 setMaskedCorners:self->_maskedCorners];
  }
}

- (BOOL)usesNonuniformScaling
{
  return self->_usesNonuniformScaling;
}

- (void)setUsesNonuniformScaling:(BOOL)a3
{
  self->_usesNonuniformScaling = a3;
}

- (BOOL)hasOpaqueContents
{
  return self->_hasOpaqueContents;
}

- (BOOL)stretchToFillBounds
{
  return self->_stretchToFillBounds;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (BOOL)allowStatusBarToOverlap
{
  return self->_allowStatusBarToOverlap;
}

- (void)setAllowStatusBarToOverlap:(BOOL)a3
{
  self->_allowStatusBarToOverlap = a3;
}

- (int64_t)orientationForClassicLayout
{
  return self->_orientationForClassicLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalingView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end