@interface PXGAnimation
- (BOOL)isDoubleSided;
- (BOOL)supportsPresentationAdjustment;
- (BOOL)supportsSpriteTransfer;
- (CASpringAnimation)springAnimation;
- (NSDictionary)userData;
- (PXGAnimation)init;
- (PXGAnimation)initWithLayout:(id)a3;
- (PXGAnimationDelegate)delegate;
- (PXGLayout)layout;
- (PXGLayoutSnapshot)fromSnapshot;
- (PXGLayoutSnapshot)toSnapshot;
- (PXGTransition)transition;
- (double)duration;
- (double)effectiveDuration;
- (double)maximumDistance;
- (float)dampingRatio;
- (float)springAnimationInitialProgress;
- (float)springAnimationProgressMultiplier;
- (id)description;
- (int64_t)curve;
- (int64_t)numberOfOscillations;
- (int64_t)scope;
- (unsigned)highFrameRateReason;
- (void)noteDidComplete;
- (void)setCurve:(int64_t)a3;
- (void)setDampingRatio:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setDoubleSided:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setFromSnapshot:(id)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setMaximumDistance:(double)a3;
- (void)setNumberOfOscillations:(int64_t)a3;
- (void)setScope:(int64_t)a3;
- (void)setSpringAnimation:(id)a3;
- (void)setSpringAnimationInitialProgress:(float)a3;
- (void)setSpringAnimationProgressMultiplier:(float)a3;
- (void)setSupportsPresentationAdjustment:(BOOL)a3;
- (void)setSupportsSpriteTransfer:(BOOL)a3;
- (void)setToSnapshot:(id)a3;
- (void)setTransition:(id)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXGAnimation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toSnapshot, 0);
  objc_storeStrong((id *)&self->_fromSnapshot, 0);
  objc_storeStrong((id *)&self->_springAnimation, 0);
  objc_destroyWeak((id *)&self->_transition);
  objc_destroyWeak((id *)&self->_layout);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)setToSnapshot:(id)a3
{
}

- (PXGLayoutSnapshot)toSnapshot
{
  return self->_toSnapshot;
}

- (void)setFromSnapshot:(id)a3
{
}

- (PXGLayoutSnapshot)fromSnapshot
{
  return self->_fromSnapshot;
}

- (void)setSpringAnimationProgressMultiplier:(float)a3
{
  self->_springAnimationProgressMultiplier = a3;
}

- (float)springAnimationProgressMultiplier
{
  return self->_springAnimationProgressMultiplier;
}

- (void)setSpringAnimationInitialProgress:(float)a3
{
  self->_springAnimationInitialProgress = a3;
}

- (float)springAnimationInitialProgress
{
  return self->_springAnimationInitialProgress;
}

- (void)setSpringAnimation:(id)a3
{
}

- (CASpringAnimation)springAnimation
{
  return self->_springAnimation;
}

- (void)setTransition:(id)a3
{
}

- (PXGTransition)transition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transition);
  return (PXGTransition *)WeakRetained;
}

- (PXGLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PXGLayout *)WeakRetained;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_highFrameRateReason = a3;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void)setUserData:(id)a3
{
}

- (NSDictionary)userData
{
  return self->_userData;
}

- (void)setDelegate:(id)a3
{
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setSupportsPresentationAdjustment:(BOOL)a3
{
  self->_supportsPresentationAdjustment = a3;
}

- (BOOL)supportsPresentationAdjustment
{
  return self->_supportsPresentationAdjustment;
}

- (void)setDoubleSided:(BOOL)a3
{
  self->_isDoubleSided = a3;
}

- (BOOL)isDoubleSided
{
  return self->_isDoubleSided;
}

- (void)setSupportsSpriteTransfer:(BOOL)a3
{
  self->_supportsSpriteTransfer = a3;
}

- (BOOL)supportsSpriteTransfer
{
  return self->_supportsSpriteTransfer;
}

- (void)setMaximumDistance:(double)a3
{
  self->_maximumDistance = a3;
}

- (double)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setNumberOfOscillations:(int64_t)a3
{
  self->_numberOfOscillations = a3;
}

- (int64_t)numberOfOscillations
{
  return self->_numberOfOscillations;
}

- (void)setDampingRatio:(float)a3
{
  self->_dampingRatio = a3;
}

- (float)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

- (int64_t)curve
{
  return self->_curve;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)noteDidComplete
{
  id v3 = [(PXGAnimation *)self layout];
  [v3 animationDidComplete:self];
}

- (PXGAnimationDelegate)delegate
{
  delegate = self->_delegate;
  if (!delegate)
  {
    v4 = +[PXGDefaultAnimationDelegate sharedInstance];
    v5 = self->_delegate;
    self->_delegate = v4;

    delegate = self->_delegate;
  }
  return delegate;
}

- (double)effectiveDuration
{
  [(PXGAnimation *)self duration];
  double v4 = v3;
  if ([(PXGAnimation *)self curve] == 2)
  {
    [(PXGAnimation *)self dampingRatio];
    float v6 = v5;
    [(PXGAnimation *)self duration];
    double v8 = v7;
    uint64_t v9 = [(PXGAnimation *)self numberOfOscillations];
    [(PXGAnimation *)self maximumDistance];
    PXGDampedSpringMinimumDuration(v9, v6, v8, v10);
    if (v4 < v11) {
      return v11;
    }
  }
  return v4;
}

- (id)description
{
  v20 = NSString;
  double v3 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v3);
  double duration = self->_duration;
  if (self->_isDoubleSided) {
    float v5 = @"YES";
  }
  else {
    float v5 = @"NO";
  }
  float v6 = v5;
  int64_t scope = self->_scope;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transition);
  id v9 = objc_loadWeakRetained((id *)&self->_layout);
  double v10 = (objc_class *)objc_opt_class();
  double v11 = NSStringFromClass(v10);
  id v12 = objc_loadWeakRetained((id *)&self->_layout);
  v13 = [(PXGAnimation *)self delegate];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = [(PXGAnimation *)self delegate];
  objc_msgSend(v20, "stringWithFormat:", @"<%@: %p; double duration = %.2f; doubleSided = %@; scope = %ld; transition = %@; layout = <%@: %p>; delegate = <%@: %p>>",
    v19,
    self,
    *(void *)&duration,
    v6,
    scope,
    WeakRetained,
    v11,
    v12,
    v15,
  v17 = v16);

  return v17;
}

- (PXGAnimation)initWithLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGAnimation;
  float v5 = [(PXGAnimation *)&v8 init];
  float v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_layout, v4);
    v6->_double duration = 2.0;
    v6->_dampingRatio = 1.0;
    *(_OWORD *)&v6->_curve = xmmword_1AB309EE0;
    v6->_maximumDistance = 1000.0;
    v6->_springAnimationProgressMultiplier = 1.0;
  }

  return v6;
}

- (PXGAnimation)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGAnimation.m", 19, @"%s is not available as initializer", "-[PXGAnimation init]");

  abort();
}

@end