@interface _UIViewControllerTransitionCoordinatorContextDescription
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForTransitionCoordinatorContext:(id)a3;
- (BOOL)isAnimated;
- (BOOL)isCancelled;
- (BOOL)isInteractive;
- (CGAffineTransform)targetTransform;
- (_UIViewControllerTransitionCoordinatorContextDescription)initWithCoder:(id)a3;
- (double)completionVelocity;
- (double)percentComplete;
- (double)transitionDuration;
- (int64_t)completionCurve;
- (int64_t)fromOrientation;
- (int64_t)toOrientation;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionCurve:(int64_t)a3;
- (void)setCompletionVelocity:(double)a3;
- (void)setFromOrientation:(int64_t)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setPercentComplete:(double)a3;
- (void)setTargetTransform:(CGAffineTransform *)a3;
- (void)setToOrientation:(int64_t)a3;
- (void)setTransitionDuration:(double)a3;
@end

@implementation _UIViewControllerTransitionCoordinatorContextDescription

+ (id)descriptionForTransitionCoordinatorContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setAnimated:", objc_msgSend(v4, "isAnimated"));
  objc_msgSend(v5, "setInteractive:", objc_msgSend(v4, "isInteractive"));
  objc_msgSend(v5, "setCancelled:", objc_msgSend(v4, "isCancelled"));
  [v4 transitionDuration];
  objc_msgSend(v5, "setTransitionDuration:");
  [v4 percentComplete];
  objc_msgSend(v5, "setPercentComplete:");
  [v4 completionVelocity];
  objc_msgSend(v5, "setCompletionVelocity:");
  objc_msgSend(v5, "setCompletionCurve:", objc_msgSend(v4, "completionCurve"));
  if (v4)
  {
    [v4 targetTransform];
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
  }
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  [v5 setTargetTransform:v7];
  [v5 setToOrientation:0];
  [v5 setFromOrientation:0];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription isAnimated](self, "isAnimated"), @"_UIViewControllerTransitionCoordinatorDescriptionIsAnimatedKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription isInteractive](self, "isInteractive"), @"_UIViewControllerTransitionCoordinatorDescriptionIsInteractiveKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription isCancelled](self, "isCancelled"), @"_UIViewControllerTransitionCoordinatorDescriptionIsCancelledKey");
  [(_UIViewControllerTransitionCoordinatorContextDescription *)self transitionDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_UIViewControllerTransitionCoordinatorDescriptionTransitionDurationKey");
  [(_UIViewControllerTransitionCoordinatorContextDescription *)self percentComplete];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_UIViewControllerTransitionCoordinatorDescriptionPercentCompleteKey");
  [(_UIViewControllerTransitionCoordinatorContextDescription *)self completionVelocity];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_UIViewControllerTransitionCoordinatorDescriptionCompletionVelocityKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription completionCurve](self, "completionCurve"), @"_UIViewControllerTransitionCoordinatorDescriptionCompletionCurveKey");
  [(_UIViewControllerTransitionCoordinatorContextDescription *)self targetTransform];
  id v5 = NSStringFromCGAffineTransform(&v6);
  [v4 encodeObject:v5 forKey:@"_UIViewControllerTransitionCoordinatorDescriptionTargetTransformKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription toOrientation](self, "toOrientation"), @"_UIViewControllerTransitionCoordinatorDescriptionToOrientationKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription fromOrientation](self, "fromOrientation"), @"_UIViewControllerTransitionCoordinatorDescriptionFromOrientationKey");
}

- (_UIViewControllerTransitionCoordinatorContextDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIViewControllerTransitionCoordinatorContextDescription;
  id v5 = [(_UIViewControllerTransitionCoordinatorContextDescription *)&v10 init];
  if (v5)
  {
    -[_UIViewControllerTransitionCoordinatorContextDescription setAnimated:](v5, "setAnimated:", [v4 decodeBoolForKey:@"_UIViewControllerTransitionCoordinatorDescriptionIsAnimatedKey"]);
    -[_UIViewControllerTransitionCoordinatorContextDescription setInteractive:](v5, "setInteractive:", [v4 decodeBoolForKey:@"_UIViewControllerTransitionCoordinatorDescriptionIsInteractiveKey"]);
    -[_UIViewControllerTransitionCoordinatorContextDescription setCancelled:](v5, "setCancelled:", [v4 decodeBoolForKey:@"_UIViewControllerTransitionCoordinatorDescriptionIsCancelledKey"]);
    [v4 decodeDoubleForKey:@"_UIViewControllerTransitionCoordinatorDescriptionTransitionDurationKey"];
    -[_UIViewControllerTransitionCoordinatorContextDescription setTransitionDuration:](v5, "setTransitionDuration:");
    [v4 decodeDoubleForKey:@"_UIViewControllerTransitionCoordinatorDescriptionPercentCompleteKey"];
    -[_UIViewControllerTransitionCoordinatorContextDescription setPercentComplete:](v5, "setPercentComplete:");
    [v4 decodeDoubleForKey:@"_UIViewControllerTransitionCoordinatorDescriptionCompletionVelocityKey"];
    -[_UIViewControllerTransitionCoordinatorContextDescription setCompletionVelocity:](v5, "setCompletionVelocity:");
    -[_UIViewControllerTransitionCoordinatorContextDescription setCompletionCurve:](v5, "setCompletionCurve:", [v4 decodeIntegerForKey:@"_UIViewControllerTransitionCoordinatorDescriptionCompletionCurveKey"]);
    CGAffineTransform v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UIViewControllerTransitionCoordinatorDescriptionTargetTransformKey"];
    CGAffineTransformFromString(&v9, v6);
    [(_UIViewControllerTransitionCoordinatorContextDescription *)v5 setTargetTransform:&v9];

    -[_UIViewControllerTransitionCoordinatorContextDescription setToOrientation:](v5, "setToOrientation:", [v4 decodeIntegerForKey:@"_UIViewControllerTransitionCoordinatorDescriptionToOrientationKey"]);
    -[_UIViewControllerTransitionCoordinatorContextDescription setFromOrientation:](v5, "setFromOrientation:", [v4 decodeIntegerForKey:@"_UIViewControllerTransitionCoordinatorDescriptionFromOrientationKey"]);
    v7 = v5;
  }

  return v5;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (double)completionVelocity
{
  return self->_completionVelocity;
}

- (void)setCompletionVelocity:(double)a3
{
  self->_completionVelocity = a3;
}

- (int64_t)completionCurve
{
  return self->_completionCurve;
}

- (void)setCompletionCurve:(int64_t)a3
{
  self->_completionCurve = a3;
}

- (CGAffineTransform)targetTransform
{
  long long v3 = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].a;
  return self;
}

- (void)setTargetTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_targetTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_targetTransform.tx = v4;
  *(_OWORD *)&self->_targetTransform.a = v3;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (void)setToOrientation:(int64_t)a3
{
  self->_toOrientation = a3;
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (void)setFromOrientation:(int64_t)a3
{
  self->_fromOrientation = a3;
}

@end