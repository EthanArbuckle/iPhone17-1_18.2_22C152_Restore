@interface _UIGrabber
- (BOOL)_isBlurEnabled;
- (BOOL)_lumaTrackingEnabled;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (UIVisualEffectView)_visualEffectView;
- (_UIGrabber)initWithCoder:(id)a3;
- (_UIGrabber)initWithFrame:(CGRect)a3;
- (_UILumaTrackingBackdropView)_lumaTrackingBackdropView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)_backgroundLuminanceLevel;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_setBackgroundLuminanceLevel:(unint64_t)a3;
- (void)_setBlurEnabled:(BOOL)a3;
- (void)_setLumaTrackingEnabled:(BOOL)a3;
- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4;
- (void)layoutSubviews;
@end

@implementation _UIGrabber

- (_UIGrabber)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIGrabber;
  v3 = -[UIControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    _UIGrabberCommonInit(v3);
  }
  return v4;
}

- (void)_setLumaTrackingEnabled:(BOOL)a3
{
  if (self->__lumaTrackingEnabled != a3)
  {
    self->__lumaTrackingEnabled = a3;
    BOOL v3 = !a3;
    id v4 = [(_UIGrabber *)self _lumaTrackingBackdropView];
    [v4 setPaused:v3];
  }
}

- (void)_setBlurEnabled:(BOOL)a3
{
  if (self->__blurEnabled != a3)
  {
    self->__blurEnabled = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v56[2] = *MEMORY[0x1E4F143B8];
  [(UIView *)self bounds];
  CGRect v58 = CGRectInset(v57, 0.0, -5.0);
  double x = v58.origin.x;
  double y = v58.origin.y;
  double width = v58.size.width;
  double height = v58.size.height;
  v7 = [(_UIGrabber *)self _lumaTrackingBackdropView];
  objc_msgSend(v7, "setFrame:", x, y, width, height);

  uint64_t v8 = [(_UIGrabber *)self _isBlurEnabled] ^ 1;
  v9 = [(_UIGrabber *)self _lumaTrackingBackdropView];
  [v9 setHidden:v8];

  [(UIView *)self bounds];
  CGRect v60 = CGRectInset(v59, 0.0, -5.0);
  double v10 = v60.origin.x;
  double v11 = v60.origin.y;
  double v12 = v60.size.width;
  double v13 = v60.size.height;
  v14 = [(_UIGrabber *)self _visualEffectView];
  objc_msgSend(v14, "setFrame:", v10, v11, v12, v13);

  v15 = [(UIView *)self traitCollection];
  unint64_t v16 = [(_UIGrabber *)self _backgroundLuminanceLevel];
  if (v16 - 1 <= 1)
  {
    uint64_t v17 = [v15 _traitCollectionByReplacingNSIntegerValue:v16 forTraitToken:0x1ED3F5A48];

    v15 = (void *)v17;
  }
  v18 = +[UIColor tertiaryLabelColor];
  double v54 = 0.0;
  double v55 = 0.0;
  double v52 = 0.0;
  double v53 = 0.0;
  v19 = [v18 resolvedColorWithTraitCollection:v15];
  [v19 getRed:&v55 green:&v54 blue:&v53 alpha:&v52];

  if ([v15 userInterfaceStyle] == 2)
  {
    double v20 = v55 * v52;
    double v21 = v52 * v54;
    double v22 = v52 * v53;
  }
  else
  {
    double v20 = -((1.0 - v55) * v52);
    double v21 = -((1.0 - v54) * v52);
    double v22 = -((1.0 - v53) * v52);
  }
  uint64_t v38 = 0x3FF0000000000000;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v41 = 0x3FF0000000000000;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v44 = 0x3FF0000000000000;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v47 = 0x3FF0000000000000;
  double v48 = v20;
  double v49 = v21;
  double v50 = v22;
  uint64_t v51 = 0;
  v23 = +[UIColorEffect colorEffectMatrix:&v38];
  v56[0] = v23;
  v24 = +[UIBlurEffect effectWithBlurRadius:30.0];
  v56[1] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  v26 = [(_UIGrabber *)self _visualEffectView];
  [v26 setBackgroundEffects:v25];

  uint64_t v27 = [(_UIGrabber *)self _isBlurEnabled] ^ 1;
  v28 = [(_UIGrabber *)self _visualEffectView];
  [v28 setHidden:v27];

  if ([(_UIGrabber *)self _isBlurEnabled]) {
    v29 = 0;
  }
  else {
    v29 = v18;
  }
  [(UIView *)self setBackgroundColor:v29];
  [(UIView *)self bounds];
  CGFloat v30 = CGRectGetHeight(v61) * 0.5;
  v31 = [(UIView *)self layer];
  [v31 setCornerRadius:v30];

  [(UIView *)self bounds];
  double v34 = v33 + -44.0;
  double v35 = (v33 + -44.0) * 0.5;
  if (v34 <= 0.0) {
    double v36 = v35;
  }
  else {
    double v36 = 0.0;
  }
  if (v32 + -44.0 <= 0.0) {
    double v37 = (v32 + -44.0) * 0.5;
  }
  else {
    double v37 = 0.0;
  }
  -[UIView _setTouchInsets:](self, "_setTouchInsets:", v37, v36, v37, v36);
}

- (UIVisualEffectView)_visualEffectView
{
  return self->__visualEffectView;
}

- (BOOL)_isBlurEnabled
{
  return self->__blurEnabled;
}

- (_UILumaTrackingBackdropView)_lumaTrackingBackdropView
{
  return self->__lumaTrackingBackdropView;
}

- (unint64_t)_backgroundLuminanceLevel
{
  return self->__backgroundLuminanceLevel;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double v3 = 36.0;
  double v4 = 5.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (_UIGrabber)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIGrabber;
  double v3 = [(UIControl *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    _UIGrabberCommonInit(v3);
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))
  {
    if (UIViewIgnoresTouchEvents(self)) {
      v5 = 0;
    }
    else {
      v5 = self;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_setBackgroundLuminanceLevel:(unint64_t)a3
{
  if (self->__backgroundLuminanceLevel != a3)
  {
    self->__backgroundLuminanceLevel = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  [(_UIGrabber *)self _setBackgroundLuminanceLevel:a4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54___UIGrabber_backgroundLumaView_didTransitionToLevel___block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  +[UIView animateWithSpringDuration:0 bounce:v5 initialSpringVelocity:0 delay:0.21 options:0.0 animations:0.0 completion:0.0];
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  [(UIView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(UIView *)self _touchInsets];
  v18 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v7 + v17, v9 + v14, v11 - (v17 + v15), v13 - (v14 + v16));
  [v18 setLatchingAxes:2];
  return v18;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v5 = [[UITargetedPreview alloc] initWithView:self];
  [(UIView *)self center];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(UIView *)self _screen];
  [v10 scale];
  UIRectCenteredAboutPointScale(0.0, 0.0, 48.0, 13.0, v7, v9, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v25.origin.double x = v13;
  v25.origin.double y = v15;
  v25.size.double width = v17;
  v25.size.double height = v19;
  double v20 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v13, v15, v17, v19, CGRectGetHeight(v25) * 0.5);
  double v21 = +[UIPointerEffect effectWithPreview:v5];
  double v22 = +[UIPointerStyle styleWithEffect:v21 shape:v20];

  return v22;
}

- (BOOL)_lumaTrackingEnabled
{
  return self->__lumaTrackingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lumaTrackingBackdropView, 0);
  objc_storeStrong((id *)&self->__visualEffectView, 0);
}

@end