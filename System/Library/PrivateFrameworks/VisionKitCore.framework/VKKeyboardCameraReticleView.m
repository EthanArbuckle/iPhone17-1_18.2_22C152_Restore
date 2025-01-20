@interface VKKeyboardCameraReticleView
+ (void)animate:(id)a3;
- (VKKeyboardCameraReticleView)initWithFrame:(CGRect)a3;
- (double)invertedShadowAlpha;
- (double)reticleAlpha;
- (double)spotlightBlurRadius;
- (void)collapseReticleRect;
- (void)layoutSubviews;
- (void)setInvertedShadowAlpha:(double)a3;
- (void)setReticleAlpha:(double)a3;
- (void)setReticleRect:(CGRect)a3 angle:(double)a4;
- (void)setSpotlightBlurRadius:(double)a3;
@end

@implementation VKKeyboardCameraReticleView

- (VKKeyboardCameraReticleView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VKKeyboardCameraReticleView;
  v3 = -[VKKeyboardCameraReticleView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CEKSubjectIndicatorView *)objc_alloc_init(MEMORY[0x1E4F57D70]);
    reticleView = v3->_reticleView;
    v3->_reticleView = v4;

    [(CEKSubjectIndicatorView *)v3->_reticleView setShape:1];
    [(CEKSubjectIndicatorView *)v3->_reticleView setHidden:1];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    spotlightView = v3->_spotlightView;
    v3->_spotlightView = v6;

    [(UIView *)v3->_spotlightView setHidden:1];
    [(VKKeyboardCameraReticleView *)v3 addSubview:v3->_reticleView];
    [(VKKeyboardCameraReticleView *)v3 addSubview:v3->_spotlightView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)VKKeyboardCameraReticleView;
  [(VKKeyboardCameraReticleView *)&v9 layoutSubviews];
  if (!self->_hasSetReticleRect)
  {
    [(VKKeyboardCameraReticleView *)self bounds];
    CGFloat x = v10.origin.x;
    CGFloat y = v10.origin.y;
    CGFloat width = v10.size.width;
    CGFloat height = v10.size.height;
    double MidX = CGRectGetMidX(v10);
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    double v8 = CGRectGetMidX(v11);
    -[CEKSubjectIndicatorView setFrame:](self->_reticleView, "setFrame:", MidX, v8, 0.0, 0.0);
    -[UIView setFrame:](self->_spotlightView, "setFrame:", MidX, v8, 0.0, 0.0);
  }
}

- (double)spotlightBlurRadius
{
  v2 = [(UIView *)self->_spotlightView layer];
  [v2 shadowRadius];
  double v4 = v3;

  return v4;
}

- (void)setSpotlightBlurRadius:(double)a3
{
  id v4 = [(UIView *)self->_spotlightView layer];
  [v4 setShadowRadius:a3];
}

- (double)invertedShadowAlpha
{
  [(UIView *)self->_spotlightView alpha];
  return result;
}

- (void)setInvertedShadowAlpha:(double)a3
{
}

- (void)setReticleRect:(CGRect)a3 angle:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!self->_hasSetReticleRect)
  {
    [(CEKSubjectIndicatorView *)self->_reticleView setHidden:0];
    [(UIView *)self->_spotlightView setHidden:0];
    CGRect v10 = [(UIView *)self->_spotlightView layer];
    [(UIView *)self->_spotlightView _setContinuousCornerRadius:20.0];
    id v11 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v10, "setShadowColor:", objc_msgSend(v11, "CGColor"));

    LODWORD(v12) = 1.0;
    [v10 setShadowOpacity:v12];
    [v10 setShadowPathIsBounds:1];
    [v10 setInvertsShadow:1];
    self->_hasSetReticleRect = 1;
  }
  reticleView = self->_reticleView;
  long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v33[0] = *MEMORY[0x1E4F1DAB8];
  long long v25 = v33[0];
  v33[1] = v27;
  long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *((void *)&v23 + 1) = *((void *)&v34 + 1);
  -[CEKSubjectIndicatorView setTransform:](reticleView, "setTransform:", v33, (void)v34);
  spotlightView = self->_spotlightView;
  v32[0] = v25;
  v32[1] = v27;
  v32[2] = v23;
  [(UIView *)spotlightView setTransform:v32];
  if (width * height <= 0.0)
  {
    double v22 = height;
    double v21 = width;
    double v20 = y;
    double v15 = x;
  }
  else
  {
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    CGRect v36 = CGRectInset(v35, -10.0, -10.0);
    double v15 = v36.origin.x;
    CGFloat v24 = v36.origin.y;
    CGFloat v26 = v36.size.width;
    CGFloat v28 = v36.size.height;
    [(VKKeyboardCameraReticleView *)self spotlightBlurRadius];
    CGFloat v17 = -10.0 - v16;
    [(VKKeyboardCameraReticleView *)self spotlightBlurRadius];
    CGFloat v19 = -10.0 - v18;
    v37.origin.double x = x;
    v37.origin.double y = y;
    v37.size.double width = width;
    v37.size.double height = height;
    CGRect v38 = CGRectInset(v37, v17, v19);
    double x = v38.origin.x;
    double y = v38.origin.y;
    double v20 = v24;
    double width = v38.size.width;
    double v21 = v26;
    double height = v38.size.height;
    double v22 = v28;
  }
  -[CEKSubjectIndicatorView setFrame:](self->_reticleView, "setFrame:", v15, v20, v21, v22);
  -[UIView setFrame:](self->_spotlightView, "setFrame:", x, y, width, height);
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeRotation(&v31, a4);
  CGAffineTransform v30 = v31;
  [(CEKSubjectIndicatorView *)self->_reticleView setTransform:&v30];
  CGAffineTransform v29 = v31;
  [(UIView *)self->_spotlightView setTransform:&v29];
}

- (void)collapseReticleRect
{
  if (self->_hasSetReticleRect && ([(CEKSubjectIndicatorView *)self->_reticleView isHidden] & 1) == 0)
  {
    [(CEKSubjectIndicatorView *)self->_reticleView frame];
    CGFloat y = v9.origin.y;
    CGFloat width = v9.size.width;
    CGFloat height = v9.size.height;
    v10.origin.double x = CGRectGetMidX(v9);
    double x = v10.origin.x;
    v10.origin.CGFloat y = y;
    v10.size.CGFloat width = width;
    v10.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v10);
    -[VKKeyboardCameraReticleView setReticleRect:angle:](self, "setReticleRect:angle:", x, MidY, 0.0, 0.0, 0.0);
  }
}

- (double)reticleAlpha
{
  [(CEKSubjectIndicatorView *)self->_reticleView alpha];
  return result;
}

- (void)setReticleAlpha:(double)a3
{
}

+ (void)animate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightView, 0);
  objc_storeStrong((id *)&self->_reticleView, 0);
}

@end