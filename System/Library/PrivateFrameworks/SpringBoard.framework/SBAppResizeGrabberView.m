@interface SBAppResizeGrabberView
- (CGRect)_pillViewContainerViewFrame;
- (CGRect)_pointerRegionRect;
- (CGRect)frameInContentRect:(CGRect)a3;
- (SBAppResizeGrabberView)initWithCorner:(unint64_t)a3;
- (SBAppResizeGrabberView)initWithCorner:(unint64_t)a3 cornerRadius:(double)a4;
- (double)_grabberCurve;
- (double)_grabberRotation;
- (double)_pillViewContainerViewOffset;
- (double)cornerRadius;
- (id)_grabberPathForLength:(double)a3 curve:(double)a4 rotation:(double)a5;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_updateGrabberPathAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)lumaDodgePillDidDetectBackgroundLuminanceChange:(id)a3;
- (void)setCornerRadius:(double)a3;
@end

@implementation SBAppResizeGrabberView

- (SBAppResizeGrabberView)initWithCorner:(unint64_t)a3
{
  return [(SBAppResizeGrabberView *)self initWithCorner:a3 cornerRadius:0.0];
}

- (SBAppResizeGrabberView)initWithCorner:(unint64_t)a3 cornerRadius:(double)a4
{
  v32.receiver = self;
  v32.super_class = (Class)SBAppResizeGrabberView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[SBAppResizeGrabberView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  if (v10)
  {
    v11 = [MEMORY[0x1E4F39C88] layer];
    v12 = [MEMORY[0x1E4F428B8] blackColor];
    id v13 = [v12 colorWithAlphaComponent:0.0];
    objc_msgSend(v11, "setFillColor:", objc_msgSend(v13, "CGColor"));

    [v11 setLineCap:*MEMORY[0x1E4F3A458]];
    [v11 setLineJoin:*MEMORY[0x1E4F3A478]];
    [v11 setLineWidth:5.0];
    id v14 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v14, "CGColor"));

    id v15 = objc_alloc(MEMORY[0x1E4F743C0]);
    v16 = [MEMORY[0x1E4F743B8] sharedInstance];
    v17 = objc_msgSend(v15, "initWithFrame:settings:graphicsQuality:", v16, -100, v6, v7, v8, v9);

    [v17 setStyle:1];
    [v17 setBackgroundLumninanceObserver:v10];
    objc_msgSend(v17, "bs_setHitTestingDisabled:", 1);
    v18 = [v17 layer];
    uint64_t v19 = objc_opt_class();
    id v20 = v18;
    if (v19)
    {
      if (objc_opt_isKindOfClass()) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
    id v22 = v21;

    [v22 setScale:1.0];
    id v23 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBAppResizeGrabberView *)v10 _pillViewContainerViewFrame];
    v24 = (UIView *)objc_msgSend(v23, "initWithFrame:");
    [(UIView *)v24 addSubview:v17];
    [(UIView *)v24 bs_setHitTestingDisabled:1];
    v25 = [(UIView *)v24 layer];
    [v25 setMask:v11];

    [(SBAppResizeGrabberView *)v10 addSubview:v24];
    [(SBAppResizeGrabberView *)v10 setAlpha:0.0];
    v26 = [(SBAppResizeGrabberView *)v10 layer];
    [v26 setHitTestsAsOpaque:1];

    v27 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v10];
    [(SBAppResizeGrabberView *)v10 addInteraction:v27];
    v10->_corner = a3;
    v10->_cornerRadius = a4;
    pillViewContainerView = v10->_pillViewContainerView;
    v10->_pillViewContainerView = v24;
    v29 = v24;

    pillView = v10->_pillView;
    v10->_pillView = (MTLumaDodgePillView *)v17;

    [(SBAppResizeGrabberView *)v10 _updateGrabberPathAnimated:0];
    [(SBAppResizeGrabberView *)v10 setAccessibilityIdentifier:@"resize-grabber"];
  }
  return v10;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBAppResizeGrabberView;
  [(SBAppResizeGrabberView *)&v5 layoutSubviews];
  pillViewContainerView = self->_pillViewContainerView;
  [(SBAppResizeGrabberView *)self _pillViewContainerViewFrame];
  -[UIView setFrame:](pillViewContainerView, "setFrame:");
  pillView = self->_pillView;
  [(SBAppResizeGrabberView *)self _pointerRegionRect];
  -[SBAppResizeGrabberView convertRect:toView:](self, "convertRect:toView:", self->_pillViewContainerView);
  -[MTLumaDodgePillView setFrame:](pillView, "setFrame:");
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(SBAppResizeGrabberView *)self _updateGrabberPathAnimated:1];
    [(SBAppResizeGrabberView *)self setNeedsLayout];
  }
}

- (CGRect)frameInContentRect:(CGRect)a3
{
  unint64_t corner = self->_corner;
  if (corner == 3)
  {
    double v4 = a3.size.width + -20.0;
    double v5 = a3.size.height + -20.0;
  }
  else
  {
    double v4 = -20.0;
    if (corner == 2)
    {
      double v5 = a3.size.height + -20.0;
    }
    else
    {
      double v5 = -20.0;
      if (corner == 1) {
        double v4 = a3.size.width + -20.0;
      }
    }
  }
  double v6 = 40.0;
  double v7 = 40.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)lumaDodgePillDidDetectBackgroundLuminanceChange:(id)a3
{
  id v6 = a3;
  uint64_t v3 = [v6 backgroundLuminance];
  uint64_t v4 = 2;
  if (v3 == 1) {
    uint64_t v4 = 4;
  }
  if (v3 == 2) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = v4;
  }
  [v6 setStyle:v5];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a5;
  if ([a4 _isPencilInitiated])
  {
    double v8 = 0;
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4F42CB0];
    [(SBAppResizeGrabberView *)self _pointerRegionRect];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [v7 identifier];
    double v8 = objc_msgSend(v9, "regionWithRect:identifier:", v18, v11, v13, v15, v17);
  }
  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self->_pillViewContainerView];
  id v6 = [MEMORY[0x1E4F42CA8] effectWithPreview:v5];
  id v7 = (void *)MEMORY[0x1E4F42CC0];
  double v8 = [MEMORY[0x1E4F42CB8] shapeWithPath:self->_grabberPath];
  double v9 = [v7 styleWithEffect:v6 shape:v8];

  return v9;
}

- (id)_grabberPathForLength:(double)a3 curve:(double)a4 rotation:(double)a5
{
  double v8 = a4 * 0.5;
  double v9 = round(a4 * 3.14159265 + a4 * 3.14159265);
  double v10 = a3 / v9 * 3.14159265 + a3 / v9 * 3.14159265;
  double v11 = 1.57079633;
  if (v10 <= 1.57079633)
  {
    double v14 = 0.785398163 - v10 * 0.5;
    double v11 = v10 * 0.5 + 0.785398163;
    double v13 = 0.0;
  }
  else
  {
    double v12 = floor((a3 + v9 * -0.25) * 0.5);
    double v13 = v12 + v12;
    double v14 = 0.0;
  }
  double v15 = -v8;
  id v16 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  double v17 = v16;
  if (v13 <= 0.0)
  {
    __double2 v20 = __sincos_stret(v11);
    double v21 = a4 * v20.__sinval - v8;
    objc_msgSend(v17, "moveToPoint:", a4 * v20.__cosval - v8, v21);
    objc_msgSend(v17, "addLineToPoint:", a4 * v20.__cosval - v8, v21);
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v15, v15, a4, v11, v14);
    __double2 v22 = __sincos_stret(v14);
    double v8 = a4 * v22.__cosval - v8;
    double v19 = v15 + a4 * v22.__sinval;
  }
  else
  {
    double v18 = v13 * 0.5;
    objc_msgSend(v16, "moveToPoint:", v15 - v18, a4 * 0.5);
    objc_msgSend(v17, "addLineToPoint:", -v8, a4 * 0.5);
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, -v8, -v8, a4, v11, v14);
    double v19 = v15 / v18;
  }
  objc_msgSend(v17, "addLineToPoint:", v8, v19);
  CGAffineTransformMakeRotation(&v36, a5);
  [v17 applyTransform:&v36];
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v34.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v34.c = v23;
  *(_OWORD *)&v34.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v33.a = *(_OWORD *)&v34.a;
  *(_OWORD *)&v33.c = v23;
  *(_OWORD *)&v33.tx = *(_OWORD *)&v34.tx;
  CGAffineTransformTranslate(&v34, &v33, 20.0, 20.0);
  [(SBAppResizeGrabberView *)self _pillViewContainerViewOffset];
  double v25 = v24;
  [(SBAppResizeGrabberView *)self _grabberCurve];
  double v27 = v26 * 0.5 + 7.5;
  double v28 = v25 - v27;
  switch(self->_corner)
  {
    case 0uLL:
      double v29 = -v28;
      CGAffineTransform v32 = v34;
      double v30 = -v28;
      goto LABEL_13;
    case 1uLL:
      double v30 = -v28;
      CGAffineTransform v32 = v34;
      double v29 = v25 - v27;
      goto LABEL_13;
    case 2uLL:
      double v29 = -v28;
      CGAffineTransform v32 = v34;
      goto LABEL_12;
    case 3uLL:
      CGAffineTransform v32 = v34;
      double v29 = v25 - v27;
LABEL_12:
      double v30 = v28;
LABEL_13:
      CGAffineTransformTranslate(&v33, &v32, v29, v30);
      CGAffineTransform v34 = v33;
      break;
    default:
      break;
  }
  CGAffineTransform v35 = v34;
  objc_msgSend(v17, "applyTransform:", &v35, *(_OWORD *)&v32.a, *(_OWORD *)&v32.c, *(_OWORD *)&v32.tx);
  return v17;
}

- (void)_updateGrabberPathAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBAppResizeGrabberView *)self _grabberCurve];
  double v6 = v5;
  [(SBAppResizeGrabberView *)self _grabberRotation];
  double v8 = [(SBAppResizeGrabberView *)self _grabberPathForLength:20.0 curve:v6 rotation:v7];
  double v9 = [(UIView *)self->_pillViewContainerView layer];
  double v10 = [v9 mask];

  id v14 = v8;
  if (!CGPathEqualToPath((CGPathRef)[v14 CGPath], (CGPathRef)objc_msgSend(v10, "path")))
  {
    if (v3)
    {
      double v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"path"];
      double v12 = [v10 presentationLayer];
      objc_msgSend(v11, "setFromValue:", objc_msgSend(v12, "path"));

      objc_msgSend(v11, "setToValue:", objc_msgSend(v14, "CGPath"));
      [v10 removeAnimationForKey:@"path"];
      [v10 addAnimation:v11 forKey:@"path"];
    }
    id v13 = v14;
    objc_msgSend(v10, "setPath:", objc_msgSend(v13, "CGPath"));
    objc_storeStrong((id *)&self->_grabberPath, v13);
  }
}

- (double)_grabberCurve
{
  return self->_cornerRadius + -7.5;
}

- (double)_grabberRotation
{
  unint64_t corner = self->_corner;
  double result = 0.0;
  if (corner <= 2) {
    return dbl_1D8FD0C50[corner];
  }
  return result;
}

- (CGRect)_pillViewContainerViewFrame
{
  [(SBAppResizeGrabberView *)self _pillViewContainerViewOffset];
  double v4 = v3;
  switch(self->_corner)
  {
    case 0uLL:
      [(SBAppResizeGrabberView *)self bounds];
      double v9 = v4;
      goto LABEL_5;
    case 1uLL:
      [(SBAppResizeGrabberView *)self bounds];
      double v9 = -v4;
LABEL_5:
      double v14 = v4;
      goto LABEL_8;
    case 2uLL:
      [(SBAppResizeGrabberView *)self bounds];
      double v14 = -v4;
      double v9 = v4;
      goto LABEL_8;
    case 3uLL:
      [(SBAppResizeGrabberView *)self bounds];
      double v9 = -v4;
      double v14 = -v4;
LABEL_8:
      *(CGRect *)&CGFloat v13 = CGRectOffset(*(CGRect *)&v5, v9, v14);
      break;
    default:
      double v10 = 0.0;
      double v11 = 0.0;
      double v12 = 0.0;
      CGFloat v13 = 0.0;
      break;
  }
  result.size.height = v10;
  result.size.width = v11;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (double)_pillViewContainerViewOffset
{
  return round(self->_cornerRadius + self->_cornerRadius * -0.707106781);
}

- (CGRect)_pointerRegionRect
{
  [(SBAppResizeGrabberView *)self _pillViewContainerViewOffset];
  double v4 = 20.0;
  double v5 = v3 + 20.0;
  switch(self->_corner)
  {
    case 0uLL:
      goto LABEL_5;
    case 1uLL:
      double v6 = -v3;
      break;
    case 2uLL:
      double v4 = -v3;
LABEL_5:
      double v6 = 20.0;
      break;
    case 3uLL:
      double v4 = -v3;
      double v6 = -v3;
      break;
    default:
      double v5 = 0.0;
      double v4 = 0.0;
      double v6 = 0.0;
      break;
  }
  double v7 = v5;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberPath, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_pillViewContainerView, 0);
}

@end