@interface _UIFluidSliderInelasticPanDriver
- (BOOL)enabled;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NSString)name;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIView)view;
- (_UIFluidSliderDirectDrivingDelegate)delegate;
- (_UIFluidSliderDrivable)drivable;
- (_UIFluidSliderInelasticPanDriver)init;
- (double)_previousTranslation;
- (double)_previousValue;
- (double)_trackLength;
- (double)stretchAmount;
- (double)velocityMultiplier;
- (unint64_t)trackAxis;
- (void)_handleGesture:(id)a3;
- (void)_issueUpdateWithValue:(double)a3 isActive:(BOOL)a4;
- (void)cancel;
- (void)setDelegate:(id)a3;
- (void)setDrivable:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setStretchAmount:(double)a3;
- (void)setTrackAxis:(unint64_t)a3;
- (void)setVelocityMultiplier:(double)a3;
- (void)setView:(id)a3;
- (void)set_previousTranslation:(double)a3;
- (void)set_previousValue:(double)a3;
@end

@implementation _UIFluidSliderInelasticPanDriver

- (_UIFluidSliderInelasticPanDriver)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFluidSliderInelasticPanDriver;
  v2 = [(_UIFluidSliderInelasticPanDriver *)&v6 init];
  if (v2)
  {
    v3 = [[UIPanGestureRecognizer alloc] initWithTarget:v2 action:sel__handleGesture_];
    panGestureRecognizer = v2->_panGestureRecognizer;
    v2->_panGestureRecognizer = v3;

    [(UIGestureRecognizer *)v2->_panGestureRecognizer setName:@"com.apple.UIKit.FluidSliderInelasticPan"];
    [(UIGestureRecognizer *)v2->_panGestureRecognizer _setKeepTouchesOnContinuation:1];
    [(UIGestureRecognizer *)v2->_panGestureRecognizer setCancelsTouchesInView:0];
    [(UIPanGestureRecognizer *)v2->_panGestureRecognizer setDelegate:v2];
    [(UIPanGestureRecognizer *)v2->_panGestureRecognizer setAllowedScrollTypesMask:3];
  }
  return v2;
}

- (NSString)name
{
  return (NSString *)@"Inelastic Pan";
}

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_view);
    v7 = [(_UIFluidSliderInelasticPanDriver *)self panGestureRecognizer];
    [v6 removeGestureRecognizer:v7];

    id v8 = objc_storeWeak((id *)&self->_view, obj);
    v5 = obj;
    if (obj)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_view);
      v10 = [(_UIFluidSliderInelasticPanDriver *)self panGestureRecognizer];
      [v9 addGestureRecognizer:v10];

      v5 = obj;
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    id v4 = [(_UIFluidSliderInelasticPanDriver *)self panGestureRecognizer];
    [v4 setEnabled:v3];
  }
}

- (void)cancel
{
  BOOL v3 = [(_UIFluidSliderInelasticPanDriver *)self panGestureRecognizer];
  int v4 = [v3 isEnabled];

  if (v4)
  {
    v5 = [(_UIFluidSliderInelasticPanDriver *)self panGestureRecognizer];
    [v5 setEnabled:0];

    id v6 = [(_UIFluidSliderInelasticPanDriver *)self panGestureRecognizer];
    [v6 setEnabled:1];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_view);
    [v4 locationInView:v6];
    char v7 = objc_msgSend(WeakRetained, "driver:shouldBeginAtPoint:", self);
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)_handleGesture:(id)a3
{
  id v19 = a3;
  if ([v19 state] < 1 || objc_msgSend(v19, "state") > 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    if ([v19 state] == 1)
    {
      id v4 = [(_UIFluidSliderInelasticPanDriver *)self drivable];
      [v4 presentationValue];
      -[_UIFluidSliderInelasticPanDriver set_previousValue:](self, "set_previousValue:");
    }
    uint64_t v5 = 1;
  }
  id v6 = [v19 view];
  [v19 translationInView:v6];
  double v8 = v7;
  double v10 = v9;

  if ([(_UIFluidSliderInelasticPanDriver *)self trackAxis] == 2) {
    double v8 = -v10;
  }
  [(_UIFluidSliderInelasticPanDriver *)self _previousTranslation];
  double v12 = v8 - v11;
  [(_UIFluidSliderInelasticPanDriver *)self set_previousTranslation:v8];
  [(_UIFluidSliderInelasticPanDriver *)self _previousValue];
  double v14 = v13;
  [(_UIFluidSliderInelasticPanDriver *)self _trackLength];
  double v16 = v12 / v15;
  [(_UIFluidSliderInelasticPanDriver *)self velocityMultiplier];
  double v18 = v14 + v16 * v17;
  [(_UIFluidSliderInelasticPanDriver *)self set_previousValue:v18];
  [(_UIFluidSliderInelasticPanDriver *)self _issueUpdateWithValue:v5 isActive:fmax(fmin(v18, 1.0), 0.0)];
}

- (void)_issueUpdateWithValue:(double)a3 isActive:(BOOL)a4
{
  BOOL v6 = a4;
  double v7 = [(_UIFluidSliderInelasticPanDriver *)self drivable];
  *(double *)double v8 = a3;
  v8[1] = 0x3FF0000000000000;
  v8[2] = v6;
  v8[3] = 1;
  v8[4] = 0xBFF0000000000000;
  [v7 fluidSliderDriver:self didGenerateUpdate:v8];
}

- (double)_trackLength
{
  v2 = [(_UIFluidSliderInelasticPanDriver *)self drivable];
  [v2 currentTrackLength];
  double v4 = v3;

  return v4;
}

- (_UIFluidSliderDrivable)drivable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drivable);
  return (_UIFluidSliderDrivable *)WeakRetained;
}

- (void)setDrivable:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (double)stretchAmount
{
  return self->_stretchAmount;
}

- (void)setStretchAmount:(double)a3
{
  self->_stretchAmount = a3;
}

- (double)velocityMultiplier
{
  return self->_velocityMultiplier;
}

- (void)setVelocityMultiplier:(double)a3
{
  self->_velocityMultiplier = a3;
}

- (unint64_t)trackAxis
{
  return self->_trackAxis;
}

- (void)setTrackAxis:(unint64_t)a3
{
  self->_trackAxis = a3;
}

- (_UIFluidSliderDirectDrivingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIFluidSliderDirectDrivingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (double)_previousTranslation
{
  return self->__previousTranslation;
}

- (void)set_previousTranslation:(double)a3
{
  self->__previousTranslation = a3;
}

- (double)_previousValue
{
  return self->__previousValue;
}

- (void)set_previousValue:(double)a3
{
  self->__previousValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_drivable);
}

@end