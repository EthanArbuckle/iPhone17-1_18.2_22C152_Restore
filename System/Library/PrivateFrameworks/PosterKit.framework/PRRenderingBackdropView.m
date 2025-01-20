@interface PRRenderingBackdropView
- (PRRenderingBackdropView)initWithOwner:(id)a3 scene:(id)a4;
- (double)backlightProgress;
- (double)linearBacklightProgress;
- (double)targetBacklightProgress;
- (void)_displayLinkFired:(id)a3;
- (void)invalidate;
- (void)setTargetBacklightProgress:(double)a3;
- (void)setTargetBacklightProgress:(double)a3 animated:(BOOL)a4;
@end

@implementation PRRenderingBackdropView

- (PRRenderingBackdropView)initWithOwner:(id)a3 scene:(id)a4
{
  v4 = [(PRRenderingView *)self initWithOwner:a3 scene:a4 level:-3000 extensionUserInteractionEnabled:0];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] blackColor];
    [(PRRenderingBackdropView *)v4 setBackgroundColor:v5];

    uint64_t v6 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v4 selector:sel__displayLinkFired_];
    displayLink = v4->_displayLink;
    v4->_displayLink = (CADisplayLink *)v6;

    v8 = v4->_displayLink;
    v9 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

    v10 = +[PRPosterDomain rootSettings];
    v11 = (CASpringAnimation *)objc_alloc_init(MEMORY[0x1E4F39C90]);
    backlightProgressSpringAnimation = v4->_backlightProgressSpringAnimation;
    v4->_backlightProgressSpringAnimation = v11;

    v13 = v4->_backlightProgressSpringAnimation;
    [v10 wakeMass];
    -[CASpringAnimation setMass:](v13, "setMass:");
    v14 = v4->_backlightProgressSpringAnimation;
    [v10 wakeDuration];
    -[CASpringAnimation setDuration:](v14, "setDuration:");
    v15 = v4->_backlightProgressSpringAnimation;
    [v10 wakeStiffness];
    -[CASpringAnimation setStiffness:](v15, "setStiffness:");
    v16 = v4->_backlightProgressSpringAnimation;
    [v10 wakeDamping];
    -[CASpringAnimation setDamping:](v16, "setDamping:");
  }
  return v4;
}

- (void)_displayLinkFired:(id)a3
{
  v4 = +[PRPosterDomain rootSettings];
  [v4 wakeDuration];
  double v6 = v5;

  v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSince1970];
  double v9 = v8 - self->_backlightProgressAnimationStartTimestamp;

  if (v9 / v6 <= 1.0) {
    double v10 = v9 / v6;
  }
  else {
    double v10 = 1.0;
  }
  self->_linearBacklightProgress = v10 * self->_targetBacklightProgress
                                 + (1.0 - v10) * self->_backlightProgressFromValue;
  if (BSFloatEqualToFloat())
  {
    self->_backlightProgress = self->_linearBacklightProgress;
    [(CADisplayLink *)self->_displayLink setPaused:1];
  }
  else
  {
    *(float *)&double v11 = v10;
    [(CASpringAnimation *)self->_backlightProgressSpringAnimation _solveForInput:v11];
    self->_backlightProgress = self->_targetBacklightProgress * v12 + (1.0 - v12) * self->_backlightProgressFromValue;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._owner);
  [WeakRetained updatedValuesForView:self];
}

- (void)setTargetBacklightProgress:(double)a3 animated:(BOOL)a4
{
  if (self->_targetBacklightProgress != a3)
  {
    self->_targetBacklightProgress = a3;
    if (a4)
    {
      self->_backlightProgressFromValue = self->_backlightProgress;
      double v5 = [MEMORY[0x1E4F1C9C8] date];
      [v5 timeIntervalSince1970];
      self->_backlightProgressAnimationStartTimestamp = v6;

      displayLink = self->_displayLink;
      [(CADisplayLink *)displayLink setPaused:0];
    }
    else
    {
      self->_backlightProgress = a3;
      self->_linearBacklightProgress = a3;
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._owner);
      [WeakRetained updatedValuesForView:self];
    }
  }
}

- (void)setTargetBacklightProgress:(double)a3
{
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)PRRenderingBackdropView;
  [(PRRenderingView *)&v4 invalidate];
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (double)targetBacklightProgress
{
  return self->_targetBacklightProgress;
}

- (double)backlightProgress
{
  return self->_backlightProgress;
}

- (double)linearBacklightProgress
{
  return self->_linearBacklightProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightProgressSpringAnimation, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end