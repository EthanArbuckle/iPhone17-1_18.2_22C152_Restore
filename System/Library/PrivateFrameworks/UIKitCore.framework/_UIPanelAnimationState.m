@interface _UIPanelAnimationState
+ (double)defaultDuration;
+ (id)timingCurveProvider;
+ (id)timingCurveProviderWithVelocity:(double)a3;
- (BOOL)animatorShouldCoordinate;
- (BOOL)isFinishingAnimation;
- (BOOL)shouldAssignOffscreenWidthsToStateRequest;
- (UISlidingBarStateRequest)fromRequest;
- (UISlidingBarStateRequest)stateRequest;
- (UISlidingBarStateRequest)toRequest;
- (_UIPanelCoordinatingAnimator)animator;
- (double)progress;
- (id)description;
- (int64_t)affectedSides;
- (void)setAffectedSides:(int64_t)a3;
- (void)setAnimator:(id)a3;
- (void)setAnimatorShouldCoordinate:(BOOL)a3;
- (void)setFinishingAnimation:(BOOL)a3;
- (void)setFromRequest:(id)a3;
- (void)setProgress:(double)a3;
- (void)setShouldAssignOffscreenWidthsToStateRequest:(BOOL)a3;
- (void)setToRequest:(id)a3;
@end

@implementation _UIPanelAnimationState

- (UISlidingBarStateRequest)stateRequest
{
  v4 = [(_UIPanelAnimationState *)self fromRequest];
  v5 = [(_UIPanelAnimationState *)self toRequest];
  [(_UIPanelAnimationState *)self progress];
  double v7 = v6;
  v8 = objc_alloc_init(UISlidingBarStateRequest);
  [v5 leadingWidth];
  double v10 = v9;
  [v4 leadingWidth];
  double v12 = v11;
  [v5 trailingWidth];
  double v14 = v13;
  [v4 trailingWidth];
  double v16 = v15;
  [v5 supplementaryWidth];
  double v18 = v17;
  [v4 supplementaryWidth];
  double v20 = v19;
  double v33 = v10;
  double v34 = v14;
  double v21 = v10 - v12;
  double v22 = v14 - v16;
  double v23 = v18 - v19;
  [(UISlidingBarStateRequest *)v8 setLeadingWidth:v12 + v7 * v21];
  [(UISlidingBarStateRequest *)v8 setTrailingWidth:v16 + v7 * v22];
  [(UISlidingBarStateRequest *)v8 setSupplementaryWidth:v20 + v7 * v23];
  if ([(_UIPanelAnimationState *)self shouldAssignOffscreenWidthsToStateRequest])
  {
    if (v7 != 0.0 && v7 != 1.0)
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2 object:self file:@"UIPanelController.m" lineNumber:283 description:@"Unsupported progress value for animated stateRequest"];
    }
    BOOL v24 = v23 != 0.0 && v18 > 0.0;
    char v25 = v20 > 0.0 && v24;
    if (v21 != 0.0 && (v33 == 0.0 || v12 == 0.0))
    {
      double v26 = v33;
      if (v7 > 0.0) {
        double v26 = v12;
      }
      [(UISlidingBarStateRequest *)v8 setLeadingOffscreenWidth:v26];
    }
    if (v22 != 0.0 && (v34 == 0.0 || v16 == 0.0))
    {
      double v27 = v34;
      if (v7 > 0.0) {
        double v27 = v16;
      }
      [(UISlidingBarStateRequest *)v8 setTrailingOffscreenWidth:v27];
    }
    if (v23 == 0.0) {
      char v28 = 1;
    }
    else {
      char v28 = v25;
    }
    if ((v28 & 1) == 0)
    {
      if (v7 <= 0.0) {
        double v29 = v18;
      }
      else {
        double v29 = v20;
      }
      [(UISlidingBarStateRequest *)v8 setSupplementaryOffscreenWidth:v29];
    }
    if (v7 <= 0.0) {
      v30 = v4;
    }
    else {
      v30 = v5;
    }
    [v30 rubberBandInset];
    -[UISlidingBarStateRequest setRubberBandInset:](v8, "setRubberBandInset:");
  }
  [v5 mainWidth];
  -[UISlidingBarStateRequest setMainWidth:](v8, "setMainWidth:");
  -[UISlidingBarStateRequest setUserInitiated:](v8, "setUserInitiated:", [v5 userInitiated]);

  return v8;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPanelAnimationState;
  v3 = [(_UIPanelAnimationState *)&v6 description];
  v4 = (void *)[v3 mutableCopy];

  if (os_variant_has_internal_diagnostics()) {
    objc_msgSend(v4, "appendFormat:", @" from=%p to=%p", self->_fromRequest, self->_toRequest);
  }
  return v4;
}

+ (id)timingCurveProvider
{
  v2 = objc_alloc_init(UISpringTimingParameters);
  return v2;
}

+ (id)timingCurveProviderWithVelocity:(double)a3
{
  v3 = -[UISpringTimingParameters initWithVelocity:]([UISpringTimingParameters alloc], "initWithVelocity:", a3, a3);
  return v3;
}

+ (double)defaultDuration
{
  v2 = [a1 timingCurveProvider];
  [v2 settlingDuration];
  double v4 = v3;

  return v4;
}

- (UISlidingBarStateRequest)fromRequest
{
  return self->_fromRequest;
}

- (void)setFromRequest:(id)a3
{
}

- (UISlidingBarStateRequest)toRequest
{
  return self->_toRequest;
}

- (void)setToRequest:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (BOOL)isFinishingAnimation
{
  return self->_isFinishingAnimation;
}

- (void)setFinishingAnimation:(BOOL)a3
{
  self->_isFinishingAnimation = a3;
}

- (int64_t)affectedSides
{
  return self->_affectedSides;
}

- (void)setAffectedSides:(int64_t)a3
{
  self->_affectedSides = a3;
}

- (BOOL)shouldAssignOffscreenWidthsToStateRequest
{
  return self->_shouldAssignOffscreenWidthsToStateRequest;
}

- (void)setShouldAssignOffscreenWidthsToStateRequest:(BOOL)a3
{
  self->_shouldAssignOffscreenWidthsToStateRequest = a3;
}

- (_UIPanelCoordinatingAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
}

- (BOOL)animatorShouldCoordinate
{
  return self->_animatorShouldCoordinate;
}

- (void)setAnimatorShouldCoordinate:(BOOL)a3
{
  self->_animatorShouldCoordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_toRequest, 0);
  objc_storeStrong((id *)&self->_fromRequest, 0);
}

@end