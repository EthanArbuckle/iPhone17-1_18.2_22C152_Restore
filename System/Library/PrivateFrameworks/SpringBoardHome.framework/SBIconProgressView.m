@interface SBIconProgressView
+ (id)_pieImageAtFraction:(double)a3;
+ (id)_pieImagesMemoryPool;
- (BOOL)_hasActiveTransitions;
- (BOOL)canAnimate;
- (BOOL)displayingPaused;
- (BOOL)hasOpaqueIconImage;
- (CGRect)circleBoundingRect;
- (SBIconImageInfo)iconImageInfo;
- (SBIconProgressView)initWithFrame:(CGRect)a3;
- (SBIconProgressViewDelegate)delegate;
- (_SBIconProgressFractionTransition)activeFractionTransition;
- (_SBIconProgressPausedTransition)activePausedTransition;
- (_SBIconProgressStateTransition)activeStateTransition;
- (double)_circleScaleFactor;
- (double)backgroundAlpha;
- (double)circleRadiusFraction;
- (double)displayedFraction;
- (double)foregroundAlpha;
- (double)pauseRadiusFraction;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (int64_t)displayedState;
- (void)_clearDisplayLink;
- (void)_drawIncomingCircleWithCenter:(CGPoint)a3;
- (void)_drawOutgoingCircleWithCenter:(CGPoint)a3;
- (void)_drawPauseUIWithCenter:(CGPoint)a3;
- (void)_drawPieWithCenter:(CGPoint)a3;
- (void)_ensureDisplayLink;
- (void)_onDisplayLink:(id)a3;
- (void)_updateFractionTransitionAnimated:(BOOL)a3;
- (void)_updatePausedTransitionAnimated:(BOOL)a3;
- (void)_updateStateTransitionAnimated:(BOOL)a3;
- (void)_updateTransitionsAnimated:(BOOL)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setActiveFractionTransition:(id)a3;
- (void)setActivePausedTransition:(id)a3;
- (void)setActiveStateTransition:(id)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setCanAnimate:(BOOL)a3;
- (void)setCircleRadiusFraction:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedFraction:(double)a3;
- (void)setDisplayedState:(int64_t)a3;
- (void)setDisplayingPaused:(BOOL)a3;
- (void)setForegroundAlpha:(double)a3;
- (void)setHasOpaqueIconImage:(BOOL)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setPauseRadiusFraction:(double)a3;
- (void)setState:(int64_t)a3 paused:(BOOL)a4 fractionLoaded:(double)a5 animated:(BOOL)a6;
@end

@implementation SBIconProgressView

- (SBIconProgressView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconProgressView;
  v3 = -[SBIconProgressView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SBIconProgressView *)v3 setNeedsDisplayOnBoundsChange:1];
    [(SBIconProgressView *)v4 setOpaque:0];
    [(SBIconProgressView *)v4 setWantsDeepColorDrawing:0];
    v4->_canAnimate = 1;
    v4->_hasOpaqueIconImage = 1;
    v5 = [(SBIconProgressView *)v4 layer];
    [v5 setCompositingFilter:*MEMORY[0x1E4F3A308]];
  }
  return v4;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBIconProgressView;
  [(SBIconProgressView *)&v3 dealloc];
}

- (void)setState:(int64_t)a3 paused:(BOOL)a4 fractionLoaded:(double)a5 animated:(BOOL)a6
{
  self->_modelState = a3;
  self->_modelPaused = a4;
  self->_modelFraction = a5;
  [(SBIconProgressView *)self _updateTransitionsAnimated:a6];
}

- (void)setCanAnimate:(BOOL)a3
{
  self->_canAnimate = a3;
  if (!a3)
  {
    [(SBIconProgressView *)self _clearDisplayLink];
    [(SBIconProgressView *)self _updateTransitionsAnimated:0];
  }
}

- (void)setHasOpaqueIconImage:(BOOL)a3
{
  if (self->_hasOpaqueIconImage != a3)
  {
    BOOL v3 = a3;
    self->_hasOpaqueIconImage = a3;
    v5 = [(SBIconProgressView *)self layer];
    v6 = v5;
    if (v3) {
      uint64_t v7 = *MEMORY[0x1E4F3A308];
    }
    else {
      uint64_t v7 = 0;
    }
    [v5 setCompositingFilter:v7];

    [(SBIconProgressView *)self setNeedsDisplay];
  }
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  if (v6 != self->_iconImageInfo.continuousCornerRadius)
  {
    self->_iconImageInfo.size.width = v3;
    self->_iconImageInfo.size.height = v4;
    self->_iconImageInfo.scale = v5;
    self->_iconImageInfo.continuousCornerRadius = v6;
    [(SBIconProgressView *)self setNeedsDisplay];
  }
}

- (BOOL)_hasActiveTransitions
{
  return self->_activeStateTransition || self->_activePausedTransition || self->_activeFractionTransition != 0;
}

- (void)_updateTransitionsAnimated:(BOOL)a3
{
  BOOL v4 = self->_canAnimate && a3;
  if ([(_SBIconProgressPausedTransition *)self->_activePausedTransition isCompleteWithView:self])
  {
    [(SBIconProgressView *)self setActivePausedTransition:0];
  }
  if ([(_SBIconProgressStateTransition *)self->_activeStateTransition isCompleteWithView:self]) {
    [(SBIconProgressView *)self setActiveStateTransition:0];
  }
  [(SBIconProgressView *)self _updatePausedTransitionAnimated:v4];
  [(SBIconProgressView *)self _updateStateTransitionAnimated:v4];
  BOOL v5 = !self->_activePausedTransition
    && !self->_activeStateTransition
    && !self->_displayedState
    && self->_modelState == 0;
  if ([(_SBIconProgressFractionTransition *)self->_activeFractionTransition isCompleteWithView:self])
  {
    [(SBIconProgressView *)self setActiveFractionTransition:0];
  }
  [(SBIconProgressView *)self _updateFractionTransitionAnimated:v4];
  BOOL v6 = [(SBIconProgressView *)self _hasActiveTransitions];
  if (v4 && v6)
  {
    [(SBIconProgressView *)self _ensureDisplayLink];
  }
  else
  {
    BOOL v7 = v6;
    [(SBIconProgressView *)self _clearDisplayLink];
    if (v7)
    {
      [(_SBIconProgressStateTransition *)self->_activeStateTransition completeTransitionAndUpdateView:self];
      [(_SBIconProgressPausedTransition *)self->_activePausedTransition completeTransitionAndUpdateView:self];
      [(_SBIconProgressFractionTransition *)self->_activeFractionTransition completeTransitionAndUpdateView:self];
      [(SBIconProgressView *)self _updateTransitionsAnimated:0];
    }
  }
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained progressViewCanBeRemoved:self];
  }
}

- (void)_updatePausedTransitionAnimated:(BOOL)a3
{
  activePausedTransition = self->_activePausedTransition;
  if (activePausedTransition)
  {
    BOOL modelPaused = self->_modelPaused;
    [(_SBIconProgressPausedTransition *)activePausedTransition updateToPaused:modelPaused];
  }
  else
  {
    BOOL v6 = self->_modelPaused;
    if (self->_displayingPaused != v6)
    {
      BOOL v7 = +[_SBIconProgressPausedTransition newTransitionToPaused:v6];
      v8 = self->_activePausedTransition;
      self->_activePausedTransition = v7;
    }
  }
}

- (void)_updateStateTransitionAnimated:(BOOL)a3
{
  if (!self->_activeStateTransition)
  {
    int64_t displayedState = self->_displayedState;
    int64_t modelState = self->_modelState;
    if (displayedState != modelState && (!a3 || !self->_activePausedTransition && !self->_displayingPaused))
    {
      if (displayedState == 2)
      {
        if (modelState)
        {
          int64_t v6 = 2;
        }
        else
        {
          if (!BSFloatEqualToFloat())
          {
            self->_modelFraction = 1.0;
            return;
          }
          int64_t v6 = self->_displayedState;
          int64_t modelState = self->_modelState;
        }
      }
      else if (displayedState == 1)
      {
        int64_t v6 = 1;
      }
      else
      {
        if (displayedState) {
          return;
        }
        int64_t v6 = 0;
        int64_t modelState = 1;
      }
      BOOL v7 = +[_SBIconProgressStateTransition newTransitionFromState:v6 toState:modelState];
      activeStateTransition = self->_activeStateTransition;
      self->_activeStateTransition = v7;
    }
  }
}

- (void)_updateFractionTransitionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && (self->_activePausedTransition
     || self->_activeStateTransition
     || self->_displayedState != 2
     || self->_displayingPaused))
  {
    activeFractionTransition = self->_activeFractionTransition;
    self->_activeFractionTransition = 0;
  }
  else if ((BSFloatEqualToFloat() & 1) == 0 && (!v3 || (BSFloatGreaterThanFloat() & 1) == 0))
  {
    int64_t v6 = self->_activeFractionTransition;
    if (v6)
    {
      double modelFraction = self->_modelFraction;
      [(_SBIconProgressFractionTransition *)v6 updateToFraction:modelFraction];
    }
    else
    {
      v8 = +[_SBIconProgressFractionTransition newTransitionToFraction:self->_modelFraction];
      v9 = self->_activeFractionTransition;
      self->_activeFractionTransition = v8;
    }
  }
}

- (void)_onDisplayLink:(id)a3
{
  id v9 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = Current - self->_lastUpdate;
  self->_lastUpdate = Current;
  int64_t v6 = (void *)MEMORY[0x1D9484600]();
  [(_SBIconProgressStateTransition *)self->_activeStateTransition updateView:self withElapsedTime:v5];
  BOOL v7 = [(_SBIconProgressStateTransition *)self->_activeStateTransition isCompleteWithView:self];
  [(_SBIconProgressPausedTransition *)self->_activePausedTransition updateView:self withElapsedTime:v5];
  BOOL v8 = [(_SBIconProgressPausedTransition *)self->_activePausedTransition isCompleteWithView:self];
  [(_SBIconProgressFractionTransition *)self->_activeFractionTransition updateView:self withElapsedTime:v5];
  if ([(_SBIconProgressFractionTransition *)self->_activeFractionTransition isCompleteWithView:self]|| v8|| v7)
  {
    [(SBIconProgressView *)self _updateTransitionsAnimated:1];
  }
}

- (void)_ensureDisplayLink
{
  if (!self->_displayLink)
  {
    self->_lastUpdate = CFAbsoluteTimeGetCurrent();
    BOOL v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__onDisplayLink_];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:30];
    double v5 = self->_displayLink;
    id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)_clearDisplayLink
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (double)_circleScaleFactor
{
  if (self->_iconImageInfo.continuousCornerRadius == 0.0) {
    return 1.0;
  }
  else {
    return self->_iconImageInfo.size.width / 60.0;
  }
}

- (void)drawRect:(CGRect)a3
{
  if (fabs(self->_backgroundAlpha) >= 2.22044605e-16)
  {
    [(SBIconProgressView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    UIRectGetCenter();
    double v13 = v12;
    double v15 = v14;
    v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:self->_backgroundAlpha * 0.7];
    [v16 set];

    if (self->_hasOpaqueIconImage)
    {
      v20.origin.x = v5;
      v20.origin.y = v7;
      v20.size.width = v9;
      v20.size.height = v11;
      UIRectFillUsingBlendMode(v20, kCGBlendModeNormal);
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, self->_iconImageInfo.continuousCornerRadius);
      [v17 fill];
    }
    if (BSFloatEqualToFloat())
    {
      -[SBIconProgressView _drawPieWithCenter:](self, "_drawPieWithCenter:", v13, v15);
    }
    else
    {
      double circleRadiusFraction = self->_circleRadiusFraction;
      if (circleRadiusFraction <= 1.0)
      {
        if (circleRadiusFraction > 0.0) {
          -[SBIconProgressView _drawIncomingCircleWithCenter:](self, "_drawIncomingCircleWithCenter:", v13, v15);
        }
      }
      else
      {
        -[SBIconProgressView _drawOutgoingCircleWithCenter:](self, "_drawOutgoingCircleWithCenter:", v13, v15);
      }
    }
    if (fabs(self->_pauseRadiusFraction) >= 2.22044605e-16)
    {
      -[SBIconProgressView _drawPauseUIWithCenter:](self, "_drawPauseUIWithCenter:", v13, v15);
    }
  }
}

+ (id)_pieImagesMemoryPool
{
  if (_pieImagesMemoryPool_onceToken != -1) {
    dispatch_once(&_pieImagesMemoryPool_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_pieImagesMemoryPool___pool;
  return v2;
}

void __42__SBIconProgressView__pieImagesMemoryPool__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v1 scale];
  uint64_t v3 = objc_msgSend(v0, "sbf_bytesNeededForSize:scale:withContextType:", 4, 42.0, 42.0, v2);

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F4BE60]) initWithLabel:"iconProgressPieImages" slotLength:v3];
  double v5 = (void *)_pieImagesMemoryPool___pool;
  _pieImagesMemoryPool___pool = v4;
}

+ (id)_pieImageAtFraction:(double)a3
{
  if (_pieImageAtFraction__onceToken != -1) {
    dispatch_once(&_pieImageAtFraction__onceToken, &__block_literal_global_16);
  }
  LODWORD(v3) = vcvtad_u64_f64(a3 * 100.0);
  double v6 = [NSNumber numberWithUnsignedInt:v3];
  double v7 = [(id)_pieImageAtFraction__pieImageCache objectForKey:v6];
  if (!v7)
  {
    double v8 = [a1 _pieImagesMemoryPool];
    double v9 = (void *)MEMORY[0x1E4FB1818];
    double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__SBIconProgressView__pieImageAtFraction___block_invoke_2;
    v13[3] = &__block_descriptor_56_e5_v8__0l;
    long long v14 = xmmword_1D81E4E20;
    double v15 = a3;
    double v7 = objc_msgSend(v9, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 4, v8, v13, 42.0, 42.0, v11);

    if (v7) {
      [(id)_pieImageAtFraction__pieImageCache setObject:v7 forKey:v6];
    }
  }
  return v7;
}

void __42__SBIconProgressView__pieImageAtFraction___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_pieImageAtFraction__pieImageCache;
  _pieImageAtFraction__pieImageCache = (uint64_t)v0;
}

void __42__SBIconProgressView__pieImageAtFraction___block_invoke_2(double *a1)
{
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a1[4], a1[5], 18.0, 0.0, 6.28318531);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setLineWidth:3.0];
  [v5 strokeWithBlendMode:17 alpha:1.0];
  double v2 = a1[6];
  if (fabs(v2) >= 2.22044605e-16)
  {
    double v3 = v2 * 6.28318531 + -1.57079633;
    uint64_t v4 = [MEMORY[0x1E4FB14C0] bezierPath];
    objc_msgSend(v4, "moveToPoint:", a1[4], a1[5]);
    objc_msgSend(v4, "addLineToPoint:", a1[4], a1[5] + -18.0);
    objc_msgSend(v4, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, a1[4], a1[5], 18.0, -1.57079633, v3);
    objc_msgSend(v4, "addLineToPoint:", a1[4], a1[5]);
    [v4 fillWithBlendMode:17 alpha:1.0];
  }
}

- (void)_drawPieWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v11 = [(id)objc_opt_class() _pieImageAtFraction:self->_displayedFraction];
  [v11 size];
  double v7 = v6;
  double v9 = v8;
  [(SBIconProgressView *)self _circleScaleFactor];
  objc_msgSend(v11, "drawInRect:blendMode:alpha:", 16, ceil(x - v7 * v10 * 0.5), ceil(y - v9 * v10 * 0.5), v7 * v10, v9 * v10, 1.0);
}

- (void)_drawOutgoingCircleWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  double v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:self->_foregroundAlpha * 0.2];
  [v7 set];

  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, fmax(self->_circleRadiusFraction * 18.0, 19.5), 0.0, 6.28318531);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 fillWithBlendMode:17 alpha:1.0];
  CGContextRestoreGState(CurrentContext);
}

- (void)_drawIncomingCircleWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.2];
  [v6 set];

  double v7 = self->_circleRadiusFraction * 18.0;
  id v8 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, v7, 0.0, 6.28318531);
  id v10 = v8;
  double v9 = 3.0;
  if (v7 <= 3.0) {
    double v9 = v7;
  }
  [v8 setLineWidth:v9];
  [v10 strokeWithBlendMode:17 alpha:1.0];
}

- (void)_drawPauseUIWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a3.x, a3.y, self->_pauseRadiusFraction * 13.0, 0.0, 6.28318531);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 addClip];
  id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.7];
  [v5 set];

  [v10 fillWithBlendMode:17 alpha:1.0];
  double v6 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.2];
  [v6 set];

  double v7 = y + -6.0;
  id v8 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", x + -5.5, v7, 4.0, 12.0);
  [v8 fillWithBlendMode:17 alpha:1.0];

  double v9 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", x + 1.5, v7, 4.0, 12.0);
  [v9 fillWithBlendMode:17 alpha:1.0];
}

- (CGRect)circleBoundingRect
{
  [(SBIconProgressView *)self bounds];
  UIRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  [(SBIconProgressView *)self _circleScaleFactor];
  double v8 = v7 * 21.0;
  double v9 = v4 - v7 * 21.0;
  double v10 = v6 - v8;
  double v11 = v8 + v8;
  double v12 = v11;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (id)description
{
  return [(SBIconProgressView *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(SBIconProgressView *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(SBIconProgressView *)self frame];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"frame");
  id v6 = (id)[v4 appendInteger:self->_modelState withName:@"state"];
  id v7 = (id)[v4 appendBool:self->_modelPaused withName:@"paused"];
  id v8 = (id)[v4 appendFloat:@"fraction" withName:self->_modelFraction];
  id v9 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconProgressView canAnimate](self, "canAnimate"), @"canAnimate");
  return v4;
}

- (SBIconProgressViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIconProgressViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canAnimate
{
  return self->_canAnimate;
}

- (BOOL)hasOpaqueIconImage
{
  return self->_hasOpaqueIconImage;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (void)setBackgroundAlpha:(double)a3
{
  self->_backgroundAlpha = a3;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
}

- (double)circleRadiusFraction
{
  return self->_circleRadiusFraction;
}

- (void)setCircleRadiusFraction:(double)a3
{
  self->_double circleRadiusFraction = a3;
}

- (double)pauseRadiusFraction
{
  return self->_pauseRadiusFraction;
}

- (void)setPauseRadiusFraction:(double)a3
{
  self->_pauseRadiusFraction = a3;
}

- (int64_t)displayedState
{
  return self->_displayedState;
}

- (void)setDisplayedState:(int64_t)a3
{
  self->_int64_t displayedState = a3;
}

- (BOOL)displayingPaused
{
  return self->_displayingPaused;
}

- (void)setDisplayingPaused:(BOOL)a3
{
  self->_displayingPaused = a3;
}

- (double)displayedFraction
{
  return self->_displayedFraction;
}

- (void)setDisplayedFraction:(double)a3
{
  self->_displayedFraction = a3;
}

- (_SBIconProgressStateTransition)activeStateTransition
{
  return self->_activeStateTransition;
}

- (void)setActiveStateTransition:(id)a3
{
}

- (_SBIconProgressPausedTransition)activePausedTransition
{
  return self->_activePausedTransition;
}

- (void)setActivePausedTransition:(id)a3
{
}

- (_SBIconProgressFractionTransition)activeFractionTransition
{
  return self->_activeFractionTransition;
}

- (void)setActiveFractionTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_activeFractionTransition, 0);
  objc_storeStrong((id *)&self->_activePausedTransition, 0);
  objc_storeStrong((id *)&self->_activeStateTransition, 0);
}

@end