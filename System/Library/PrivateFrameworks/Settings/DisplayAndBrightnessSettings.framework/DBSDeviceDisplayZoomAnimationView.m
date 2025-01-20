@interface DBSDeviceDisplayZoomAnimationView
- (BOOL)isAnimating;
- (CALayer)packageLayer;
- (CAPackage)package;
- (CAStateController)stateController;
- (CGSize)intrinsicContentSize;
- (CGSize)preferredSize;
- (DBSDeviceDisplayZoomAnimationView)initWithDisplayZoomOption:(unint64_t)a3;
- (double)scale;
- (float)duration;
- (unint64_t)displayZoomOption;
- (unint64_t)state;
- (void)_configureView;
- (void)_setPackage:(id)a3;
- (void)_startAnimationForLayer:(id)a3;
- (void)_stepAnimamtionForLayer:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setDisplayZoomOption:(unint64_t)a3;
- (void)setDuration:(float)a3;
- (void)setPackage:(id)a3;
- (void)setPackageLayer:(id)a3;
- (void)setScale:(double)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateController:(id)a3;
- (void)startAnimation;
- (void)stopAnimation;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBSDeviceDisplayZoomAnimationView

- (DBSDeviceDisplayZoomAnimationView)initWithDisplayZoomOption:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DBSDeviceDisplayZoomAnimationView;
  v4 = -[DBSDeviceDisplayZoomAnimationView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    [(DBSDeviceDisplayZoomAnimationView *)v4 setUserInteractionEnabled:0];
    v6 = [MEMORY[0x263F825C8] clearColor];
    [(DBSDeviceDisplayZoomAnimationView *)v5 setBackgroundColor:v6];

    v5->_displayZoomOption = a3;
    v5->_duration = 3.0;
    if (DBSReverseZoomEnabled())
    {
      v7 = [MEMORY[0x263F82670] currentDevice];
      int v8 = objc_msgSend(v7, "sf_isiPad");
      double v9 = 1.0;
      if (v8) {
        double v9 = 0.5;
      }
      v5->_scale = v9;
    }
    else
    {
      v5->_scale = 1.0;
    }
    [(DBSDeviceDisplayZoomAnimationView *)v5 _configureView];
  }
  return v5;
}

- (void)_configureView
{
  v3 = (void *)MEMORY[0x263F15838];
  uint64_t v4 = [(DBSDeviceDisplayZoomAnimationView *)self displayZoomOption];
  id v9 = [(DBSDeviceDisplayZoomAnimationView *)self traitCollection];
  uint64_t v5 = [v9 userInterfaceStyle];
  v6 = [(DBSDeviceDisplayZoomAnimationView *)self traitCollection];
  v7 = DBSAnimationPackageURLForDisplayZoomOptionAndUserInterfaceStyle(v4, v5, [v6 layoutDirection]);
  int v8 = [v3 packageWithContentsOfURL:v7 type:*MEMORY[0x263F15EE8] options:0 error:0];
  [(DBSDeviceDisplayZoomAnimationView *)self setPackage:v8];
}

- (void)setPackage:(id)a3
{
  uint64_t v5 = (CAPackage *)a3;
  if (self->_package != v5)
  {
    objc_storeStrong((id *)&self->_package, a3);
    [(DBSDeviceDisplayZoomAnimationView *)self _setPackage:v5];
  }
}

- (void)_setPackage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBSDeviceDisplayZoomAnimationView *)self packageLayer];
  [v5 removeFromSuperlayer];

  id v9 = [v4 rootLayer];
  uint64_t v6 = [v4 isGeometryFlipped];

  [v9 setGeometryFlipped:v6];
  [v9 setContentsGravity:*MEMORY[0x263F15E18]];
  [v9 setMasksToBounds:1];
  [v9 setFillMode:*MEMORY[0x263F15AA0]];
  v7 = [(DBSDeviceDisplayZoomAnimationView *)self layer];
  [v7 setShouldRasterize:1];

  int v8 = [(DBSDeviceDisplayZoomAnimationView *)self layer];
  [v8 addSublayer:v9];

  [(DBSDeviceDisplayZoomAnimationView *)self setPackageLayer:v9];
  [(DBSDeviceDisplayZoomAnimationView *)self invalidateIntrinsicContentSize];
}

- (void)drawRect:(CGRect)a3
{
  id v4 = [(DBSDeviceDisplayZoomAnimationView *)self packageLayer];
  UIRectGetCenter();
  objc_msgSend(v4, "setPosition:");

  uint64_t v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 scale];
  double v7 = v6;

  double scale = self->_scale;
  id v9 = [(DBSDeviceDisplayZoomAnimationView *)self packageLayer];
  v10 = [(DBSDeviceDisplayZoomAnimationView *)self packageLayer];
  objc_super v11 = v10;
  if (v10) {
    [v10 contentsTransform];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  double v12 = v7 * 1.5;
  if (v7 >= 3.0) {
    double v12 = v7;
  }
  CGAffineTransformScale(&v14, &v13, 1.0 / v12 * scale, 1.0 / v12 * scale);
  [v9 setAffineTransform:&v14];
}

- (CGSize)intrinsicContentSize
{
  v3 = [(DBSDeviceDisplayZoomAnimationView *)self packageLayer];
  [v3 bounds];
  long long v20 = v5;
  long long v21 = v4;

  double v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  double v8 = v7;

  double scale = self->_scale;
  v10 = [(DBSDeviceDisplayZoomAnimationView *)self packageLayer];
  objc_super v11 = v10;
  if (v10) {
    objc_msgSend(v10, "contentsTransform", v20, v21);
  }
  else {
    memset(&v23, 0, sizeof(v23));
  }
  double v12 = v8 * 1.5;
  if (v8 >= 3.0) {
    double v12 = v8;
  }
  CGAffineTransformScale(&v24, &v23, 1.0 / v12 * scale, 1.0 / v12 * scale);
  float64x2_t v22 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v24.c, *(double *)&v20), *(float64x2_t *)&v24.a, *(double *)&v21);

  __asm { FMOV            V0.2D, #2.0 }
  float64x2_t v18 = vaddq_f64(v22, _Q0);
  double v19 = v18.f64[1];
  result.width = v18.f64[0];
  result.height = v19;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)DBSDeviceDisplayZoomAnimationView;
  [(DBSDeviceDisplayZoomAnimationView *)&v12 traitCollectionDidChange:a3];
  BOOL v4 = [(DBSDeviceDisplayZoomAnimationView *)self isAnimating];
  [(DBSDeviceDisplayZoomAnimationView *)self stopAnimation];
  long long v5 = (void *)MEMORY[0x263F15838];
  uint64_t v6 = [(DBSDeviceDisplayZoomAnimationView *)self displayZoomOption];
  double v7 = [(DBSDeviceDisplayZoomAnimationView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];
  id v9 = [(DBSDeviceDisplayZoomAnimationView *)self traitCollection];
  v10 = DBSAnimationPackageURLForDisplayZoomOptionAndUserInterfaceStyle(v6, v8, [v9 layoutDirection]);
  objc_super v11 = [v5 packageWithContentsOfURL:v10 type:*MEMORY[0x263F15EE8] options:0 error:0];
  [(DBSDeviceDisplayZoomAnimationView *)self setPackage:v11];

  [(DBSDeviceDisplayZoomAnimationView *)self setNeedsDisplay];
  if (v4) {
    [(DBSDeviceDisplayZoomAnimationView *)self startAnimation];
  }
}

- (void)startAnimation
{
  v3 = [(DBSDeviceDisplayZoomAnimationView *)self layer];
  [v3 setShouldRasterize:0];

  BOOL v4 = [(DBSDeviceDisplayZoomAnimationView *)self packageLayer];
  [(DBSDeviceDisplayZoomAnimationView *)self _startAnimationForLayer:v4];

  [(DBSDeviceDisplayZoomAnimationView *)self setAnimating:1];
}

- (void)stopAnimation
{
  v3 = [(DBSDeviceDisplayZoomAnimationView *)self layer];
  [v3 setShouldRasterize:1];

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  BOOL v4 = [(DBSDeviceDisplayZoomAnimationView *)self stateController];

  if (v4)
  {
    long long v5 = [(DBSDeviceDisplayZoomAnimationView *)self stateController];
    [v5 cancelTimers];

    uint64_t v6 = [(DBSDeviceDisplayZoomAnimationView *)self stateController];
    id v7 = (id)[v6 removeAllStateChanges];

    [(DBSDeviceDisplayZoomAnimationView *)self setStateController:0];
  }
  [(DBSDeviceDisplayZoomAnimationView *)self setAnimating:0];
}

- (CGSize)preferredSize
{
  v3 = [(DBSDeviceDisplayZoomAnimationView *)self packageLayer];
  [v3 bounds];
  long long v19 = v5;
  long long v20 = v4;

  uint64_t v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  double v8 = v7;

  id v9 = [(DBSDeviceDisplayZoomAnimationView *)self packageLayer];
  v10 = v9;
  if (v9) {
    objc_msgSend(v9, "contentsTransform", v19, v20);
  }
  else {
    memset(&v22, 0, sizeof(v22));
  }
  double v11 = v8 * 1.5;
  if (v8 >= 3.0) {
    double v11 = v8;
  }
  CGAffineTransformScale(&v23, &v22, 1.0 / v11, 1.0 / v11);
  float64x2_t v21 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v23.c, *(double *)&v19), *(float64x2_t *)&v23.a, *(double *)&v20);

  __asm { FMOV            V0.2D, #2.0 }
  float64x2_t v17 = vaddq_f64(v21, _Q0);
  double v18 = v17.f64[1];
  result.width = v17.f64[0];
  result.height = v18;
  return result;
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_double scale = a3;
    [(DBSDeviceDisplayZoomAnimationView *)self setNeedsLayout];
  }
}

- (void)_startAnimationForLayer:(id)a3
{
  long long v4 = (objc_class *)MEMORY[0x263F158B0];
  id v8 = a3;
  long long v5 = (void *)[[v4 alloc] initWithLayer:v8];
  [(DBSDeviceDisplayZoomAnimationView *)self setStateController:v5];

  [(DBSDeviceDisplayZoomAnimationView *)self setState:0];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  uint64_t v6 = [(DBSDeviceDisplayZoomAnimationView *)self stateController];
  LODWORD(v7) = 1.0;
  [v6 setInitialStatesOfLayer:v8 transitionSpeed:v7];

  [(DBSDeviceDisplayZoomAnimationView *)self _stepAnimamtionForLayer:v8];
}

- (void)_stepAnimamtionForLayer:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [(DBSDeviceDisplayZoomAnimationView *)self state];
  if (v4 <= 3
    && (long long v5 = off_264C7AA68[v4],
        [(DBSDeviceDisplayZoomAnimationView *)self setState:qword_235DA5C00[v4]],
        [v12 stateWithName:v5],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v7 = (void *)v6;
    id v8 = [(DBSDeviceDisplayZoomAnimationView *)self stateController];
    LODWORD(v9) = 1.0;
    [v8 setState:v7 ofLayer:v12 transitionSpeed:v9];

    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
    [(DBSDeviceDisplayZoomAnimationView *)self duration];
    [(DBSDeviceDisplayZoomAnimationView *)self performSelector:sel__stepAnimamtionForLayer_ withObject:v12 afterDelay:v10];
  }
  else
  {
    double v11 = [(DBSDeviceDisplayZoomAnimationView *)self stateController];
    [v11 setInitialStatesOfLayer:v12];

    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
    [(DBSDeviceDisplayZoomAnimationView *)self performSelector:sel__stepAnimamtionForLayer_ withObject:v12 afterDelay:0.5];
  }
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)displayZoomOption
{
  return self->_displayZoomOption;
}

- (void)setDisplayZoomOption:(unint64_t)a3
{
  self->_displayZoomOption = a3;
}

- (CALayer)packageLayer
{
  return self->_packageLayer;
}

- (void)setPackageLayer:(id)a3
{
}

- (CAPackage)package
{
  return self->_package;
}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (void)setStateController:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  self->_duration = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_packageLayer, 0);
}

@end