@interface _UISpringLoadedHysteresisBehavior
- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4;
- (CADisplayLink)displayLink;
- (UISpringLoadedInteractionBehaviorDelegate)delegate;
- (UISpringLoadedInteractionContext)context;
- (_UIVelocityIntegrator)velocityIntegrator;
- (double)beginningVelocityThreshold;
- (double)cancelingVelocityThreshold;
- (void)_tick:(id)a3;
- (void)interactionDidFinish:(id)a3;
- (void)setBeginningVelocityThreshold:(double)a3;
- (void)setCancelingVelocityThreshold:(double)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setVelocityIntegrator:(id)a3;
- (void)setupDisplayLink;
@end

@implementation _UISpringLoadedHysteresisBehavior

- (void)setCancelingVelocityThreshold:(double)a3
{
  self->_cancelingVelocityThreshold = a3;
}

- (void)setBeginningVelocityThreshold:(double)a3
{
  self->_beginningVelocityThreshold = a3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  objc_storeWeak((id *)&self->_context, a4);
  if (!self->_displayLink) {
    [(_UISpringLoadedHysteresisBehavior *)self setupDisplayLink];
  }
  velocityIntegrator = self->_velocityIntegrator;
  if (velocityIntegrator)
  {
    if ((uint64_t)velocityIntegrator->_samples.__size_.__value_ >= 4)
    {
      [(_UIVelocityIntegrator *)velocityIntegrator velocity];
      LOBYTE(velocityIntegrator) = hypot(v6, v7) < self->_beginningVelocityThreshold;
    }
    else
    {
      LOBYTE(velocityIntegrator) = 0;
    }
  }
  return (char)velocityIntegrator;
}

- (void)interactionDidFinish:(id)a3
{
  objc_storeWeak((id *)&self->_context, 0);
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)setupDisplayLink
{
  v3 = (_UIVelocityIntegrator *)objc_opt_new();
  velocityIntegrator = self->_velocityIntegrator;
  self->_velocityIntegrator = v3;

  [(_UIVelocityIntegrator *)self->_velocityIntegrator setMinimumRequiredMovement:0.0];
  v5 = self->_velocityIntegrator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained locationInView:0];
  -[_UIVelocityIntegrator addSample:](v5, "addSample:");

  long double v7 = +[UIScreen mainScreen];
  v8 = [v7 displayLinkWithTarget:self selector:sel__tick_];
  displayLink = self->_displayLink;
  self->_displayLink = v8;

  v10 = self->_displayLink;
  v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v10 addToRunLoop:v11 forMode:*MEMORY[0x1E4F1C4B0]];

  v12 = self->_displayLink;
  id v13 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v12 addToRunLoop:v13 forMode:@"UITrackingRunLoopMode"];
}

- (void)_tick:(id)a3
{
  velocityIntegrator = self->_velocityIntegrator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained locationInView:0];
  -[_UIVelocityIntegrator addSample:](velocityIntegrator, "addSample:");

  long double v6 = self->_velocityIntegrator;
  if (v6 && (uint64_t)v6->_samples.__size_.__value_ >= 4)
  {
    id v7 = [(_UISpringLoadedHysteresisBehavior *)self delegate];
    [v7 _reloadSpringLoadedInteractionBehavior];
  }
}

- (UISpringLoadedInteractionBehaviorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (UISpringLoadedInteractionBehaviorDelegate *)WeakRetained;
}

- (double)beginningVelocityThreshold
{
  return self->_beginningVelocityThreshold;
}

- (double)cancelingVelocityThreshold
{
  return self->_cancelingVelocityThreshold;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (_UIVelocityIntegrator)velocityIntegrator
{
  return self->_velocityIntegrator;
}

- (void)setVelocityIntegrator:(id)a3
{
}

- (UISpringLoadedInteractionContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (UISpringLoadedInteractionContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end