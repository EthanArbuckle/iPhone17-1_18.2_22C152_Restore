@interface VUISBIconProgressView
+ (id)_pieImageAtFraction:(double)a3;
+ (id)_pieImagesMemoryPool;
- (BOOL)_hasActiveTransitions;
- (BOOL)canAnimate;
- (BOOL)displayingPaused;
- (CGRect)circleBoundingRect;
- (UIImage)overlayImage;
- (VUISBIconProgressView)initWithFrame:(CGRect)a3;
- (VUISBIconProgressViewDelegate)delegate;
- (double)backgroundAlpha;
- (double)circleRadiusFraction;
- (double)displayedFraction;
- (double)foregroundAlpha;
- (double)pauseRadiusFraction;
- (id)_maskImage;
- (int64_t)displayedState;
- (void)_clearDisplayLink;
- (void)_clearTransitionIfComplete:(id *)a3;
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
- (void)setBackgroundAlpha:(double)a3;
- (void)setCanAnimate:(BOOL)a3;
- (void)setCircleRadiusFraction:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedFraction:(double)a3;
- (void)setDisplayedState:(int64_t)a3;
- (void)setDisplayingPaused:(BOOL)a3;
- (void)setForegroundAlpha:(double)a3;
- (void)setOverlayImage:(id)a3;
- (void)setPauseRadiusFraction:(double)a3;
- (void)setState:(int64_t)a3 paused:(BOOL)a4 fractionLoaded:(double)a5 animated:(BOOL)a6;
@end

@implementation VUISBIconProgressView

- (VUISBIconProgressView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUISBIconProgressView;
  v3 = -[VUISBIconProgressView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(VUISBIconProgressView *)v3 setNeedsDisplayOnBoundsChange:1];
    [(VUISBIconProgressView *)v4 setOpaque:0];
    v4->_canAnimate = 1;
  }
  return v4;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];

  v3.receiver = self;
  v3.super_class = (Class)VUISBIconProgressView;
  [(VUISBIconProgressView *)&v3 dealloc];
}

- (void)setState:(int64_t)a3 paused:(BOOL)a4 fractionLoaded:(double)a5 animated:(BOOL)a6
{
  self->_modelState = a3;
  self->_modelPaused = a4;
  self->_modelFraction = a5;
  [(VUISBIconProgressView *)self _updateTransitionsAnimated:a6];
}

- (void)setCanAnimate:(BOOL)a3
{
  self->_canAnimate = a3;
  if (!a3)
  {
    [(VUISBIconProgressView *)self _clearDisplayLink];
    [(VUISBIconProgressView *)self _updateTransitionsAnimated:0];
  }
}

- (void)setOverlayImage:(id)a3
{
  if (self->_overlayImage != a3)
  {

    self->_maskImage = 0;
    self->_overlayImage = (UIImage *)a3;
    [(VUISBIconProgressView *)self setNeedsDisplay];
  }
}

- (BOOL)_hasActiveTransitions
{
  return self->_activeStateTransition || self->_activePausedTransition || self->_activeFractionTransition != 0;
}

- (void)_updateTransitionsAnimated:(BOOL)a3
{
  BOOL v4 = self->_canAnimate && a3;
  p_activePausedTransition = (id *)&self->_activePausedTransition;
  [(VUISBIconProgressView *)self _clearTransitionIfComplete:&self->_activePausedTransition];
  p_activeStateTransition = (id *)&self->_activeStateTransition;
  [(VUISBIconProgressView *)self _clearTransitionIfComplete:&self->_activeStateTransition];
  [(VUISBIconProgressView *)self _updatePausedTransitionAnimated:v4];
  [(VUISBIconProgressView *)self _updateStateTransitionAnimated:v4];
  if (!*p_activePausedTransition && !*p_activeStateTransition && !self->_displayedState && !self->_modelState) {
    [(VUISBIconProgressViewDelegate *)self->_delegate progressViewCanBeRemoved:self];
  }
  [(VUISBIconProgressView *)self _clearTransitionIfComplete:&self->_activeFractionTransition];
  [(VUISBIconProgressView *)self _updateFractionTransitionAnimated:v4];
  BOOL v7 = [(VUISBIconProgressView *)self _hasActiveTransitions];
  if (v4 && v7)
  {
    [(VUISBIconProgressView *)self _ensureDisplayLink];
  }
  else
  {
    BOOL v8 = v7;
    [(VUISBIconProgressView *)self _clearDisplayLink];
    if (v8)
    {
      [*p_activeStateTransition completeTransitionAndUpdateView:self];
      [*p_activePausedTransition completeTransitionAndUpdateView:self];
      [(_VUISBIconProgressFractionTransition *)self->_activeFractionTransition completeTransitionAndUpdateView:self];
      [(VUISBIconProgressView *)self _updateTransitionsAnimated:0];
    }
  }
}

- (void)_updatePausedTransitionAnimated:(BOOL)a3
{
  activePausedTransition = self->_activePausedTransition;
  if (activePausedTransition)
  {
    BOOL modelPaused = self->_modelPaused;
    [(_VUISBIconProgressPausedTransition *)activePausedTransition updateToPaused:modelPaused];
  }
  else
  {
    BOOL v6 = self->_modelPaused;
    if (self->_displayingPaused != v6) {
      self->_activePausedTransition = (_VUISBIconProgressPausedTransition *)+[_VUISBIconProgressPausedTransition newTransitionToPaused:v6];
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
        if (!modelState && fabs(self->_displayedFraction + -1.0) >= 2.22044605e-16)
        {
          self->_modelFraction = 1.0;
          return;
        }
        uint64_t v5 = 2;
      }
      else if (displayedState == 1)
      {
        uint64_t v5 = 1;
      }
      else
      {
        if (displayedState) {
          return;
        }
        uint64_t v5 = 0;
        int64_t modelState = 1;
      }
      self->_activeStateTransition = (_VUISBInstallProgressStateTransition *)+[_VUISBInstallProgressStateTransition newTransitionFromState:v5 toState:modelState];
    }
  }
}

- (void)_updateFractionTransitionAnimated:(BOOL)a3
{
  if (a3
    && (self->_activePausedTransition
     || self->_activeStateTransition
     || self->_displayedState != 2
     || self->_displayingPaused))
  {

    self->_activeFractionTransition = 0;
  }
  else
  {
    double modelFraction = self->_modelFraction;
    double displayedFraction = self->_displayedFraction;
    if (vabdd_f64(modelFraction, displayedFraction) >= 2.22044605e-16
      && (!a3 || displayedFraction - modelFraction <= 0.00000011920929))
    {
      activeFractionTransition = self->_activeFractionTransition;
      if (activeFractionTransition)
      {
        -[_VUISBIconProgressFractionTransition updateToFraction:](activeFractionTransition, "updateToFraction:");
      }
      else
      {
        self->_activeFractionTransition = (_VUISBIconProgressFractionTransition *)+[_VUISBIconProgressFractionTransition newTransitionToFraction:](_VUISBIconProgressFractionTransition, "newTransitionToFraction:");
      }
    }
  }
}

- (void)_clearTransitionIfComplete:(id *)a3
{
  if ([*a3 isCompleteWithView:self])
  {

    *a3 = 0;
  }
}

- (void)_onDisplayLink:(id)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = Current - self->_lastUpdate;
  self->_lastUpdate = Current;
  BOOL v6 = (void *)MEMORY[0x1E4E6FAE0]();
  [(_VUISBInstallProgressStateTransition *)self->_activeStateTransition updateView:self withElapsedTime:v5];
  BOOL v7 = [(_VUISBInstallProgressStateTransition *)self->_activeStateTransition isCompleteWithView:self];
  [(_VUISBIconProgressPausedTransition *)self->_activePausedTransition updateView:self withElapsedTime:v5];
  BOOL v8 = [(_VUISBIconProgressPausedTransition *)self->_activePausedTransition isCompleteWithView:self];
  [(_VUISBIconProgressFractionTransition *)self->_activeFractionTransition updateView:self withElapsedTime:v5];
  if ([(_VUISBIconProgressFractionTransition *)self->_activeFractionTransition isCompleteWithView:self]|| v8|| v7)
  {
    [(VUISBIconProgressView *)self _updateTransitionsAnimated:1];
  }
}

- (void)_ensureDisplayLink
{
  if (!self->_displayLink)
  {
    self->_lastUpdate = CFAbsoluteTimeGetCurrent();
    objc_super v3 = (CADisplayLink *)(id)[MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__onDisplayLink_];
    self->_displayLink = v3;
    [(CADisplayLink *)v3 setPreferredFramesPerSecond:30];
    displayLink = self->_displayLink;
    uint64_t v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    uint64_t v6 = *MEMORY[0x1E4F1C4B0];
    [(CADisplayLink *)displayLink addToRunLoop:v5 forMode:v6];
  }
}

- (void)_clearDisplayLink
{
  [(CADisplayLink *)self->_displayLink invalidate];
  objc_super v3 = self->_displayLink;
  self->_displayLink = 0;
}

- (void)drawRect:(CGRect)a3
{
  if (fabs(self->_backgroundAlpha) >= 2.22044605e-16)
  {
    [(VUISBIconProgressView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    UIRectGetCenter();
    double v13 = v12;
    double v15 = v14;
    overlayImage = self->_overlayImage;
    if (overlayImage)
    {
      -[UIImage drawInRect:blendMode:alpha:](overlayImage, "drawInRect:blendMode:alpha:", 17, v5, v7, v9, v11, self->_backgroundAlpha * 0.7);
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 0.0, self->_backgroundAlpha * 0.7), "set");
      v19.origin.x = v5;
      v19.origin.y = v7;
      v19.size.width = v9;
      v19.size.height = v11;
      UIRectFill(v19);
    }
    double circleRadiusFraction = self->_circleRadiusFraction;
    if (fabs(circleRadiusFraction + -1.0) >= 2.22044605e-16)
    {
      if (circleRadiusFraction <= 1.0)
      {
        if (circleRadiusFraction > 0.0) {
          -[VUISBIconProgressView _drawIncomingCircleWithCenter:](self, "_drawIncomingCircleWithCenter:", v13, v15);
        }
      }
      else
      {
        -[VUISBIconProgressView _drawOutgoingCircleWithCenter:](self, "_drawOutgoingCircleWithCenter:", v13, v15);
      }
    }
    else
    {
      -[VUISBIconProgressView _drawPieWithCenter:](self, "_drawPieWithCenter:", v13, v15);
    }
    if (fabs(self->_pauseRadiusFraction) >= 2.22044605e-16)
    {
      -[VUISBIconProgressView _drawPauseUIWithCenter:](self, "_drawPauseUIWithCenter:", v13, v15);
    }
  }
}

+ (id)_pieImagesMemoryPool
{
  if (_pieImagesMemoryPool_onceToken != -1) {
    dispatch_once(&_pieImagesMemoryPool_onceToken, &__block_literal_global_26);
  }
  return (id)_pieImagesMemoryPool___pool;
}

uint64_t __45__VUISBIconProgressView__pieImagesMemoryPool__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen"), "scale");
  uint64_t v2 = objc_msgSend(v0, "vui_bytesNeededForSize:scale:withContextType:", 0, 78.0, 78.0, v1);
  uint64_t result = [objc_alloc(MEMORY[0x1E4F4BE60]) initWithLabel:"iconProgressPieImages" slotLength:v2];
  _pieImagesMemoryPool___pool = result;
  return result;
}

+ (id)_pieImageAtFraction:(double)a3
{
  if (_pieImageAtFraction__onceToken != -1) {
    dispatch_once(&_pieImageAtFraction__onceToken, &__block_literal_global_20_0);
  }
  LODWORD(v3) = vcvtad_u64_f64(a3 * 100.0);
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v3];
  double v7 = (void *)[(id)_pieImageAtFraction__pieImageCache objectForKey:v6];
  if (!v7)
  {
    uint64_t v8 = [a1 _pieImagesMemoryPool];
    double v9 = (void *)MEMORY[0x1E4FB1818];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen"), "scale");
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__VUISBIconProgressView__pieImageAtFraction___block_invoke_2;
    v12[3] = &__block_descriptor_72_e5_v8__0l;
    int64x2_t v13 = vdupq_n_s64(0x4053800000000000uLL);
    long long v14 = xmmword_1E38FDA50;
    double v15 = a3;
    double v7 = objc_msgSend(v9, "vui_imageFromContextWithSize:scale:type:pool:drawing:", 0, v8, v12, 78.0, 78.0, v10);
    if (v7) {
      [(id)_pieImageAtFraction__pieImageCache setObject:v7 forKey:v6];
    }
  }
  return v7;
}

id __45__VUISBIconProgressView__pieImageAtFraction___block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  _pieImageAtFraction__pieImageCache = (uint64_t)result;
  return result;
}

uint64_t __45__VUISBIconProgressView__pieImageAtFraction___block_invoke_2(CGFloat *a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 0.0, 0.7), "set");
  v8.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v8.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  v8.size.width = a1[4];
  v8.size.height = a1[5];
  UIRectFill(v8);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 1.0, 0.2), "set");
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a1[6], a1[7], 36.0, 0.0, 6.28318531);
  [v2 setLineWidth:3.0];
  uint64_t result = [v2 strokeWithBlendMode:17 alpha:1.0];
  double v4 = a1[8];
  if (fabs(v4) >= 2.22044605e-16)
  {
    double v5 = v4 * 6.28318531 + -1.57079633;
    uint64_t v6 = (void *)[MEMORY[0x1E4FB14C0] bezierPath];
    objc_msgSend(v6, "moveToPoint:", a1[6], a1[7]);
    objc_msgSend(v6, "addLineToPoint:", a1[6], a1[7] + -36.0);
    objc_msgSend(v6, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, a1[6], a1[7], 36.0, -1.57079633, v5);
    objc_msgSend(v6, "addLineToPoint:", a1[6], a1[7]);
    return [v6 fillWithBlendMode:17 alpha:1.0];
  }
  return result;
}

- (void)_drawPieWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = (void *)[(id)objc_opt_class() _pieImageAtFraction:self->_displayedFraction];
  [v5 size];
  double v7 = v6;
  double v9 = v8;
  double v10 = ceil(x - v6 * 0.5);
  double v11 = ceil(y - v8 * 0.5);
  objc_msgSend(v5, "drawInRect:blendMode:alpha:", 17, v10, v11, v7, v9, 1.0);
}

- (void)_drawOutgoingCircleWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if (self->_overlayImage)
  {
    [(VUISBIconProgressView *)self bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;
    maskImage = self->_maskImage;
    if (!maskImage
      || (([(UIImage *)maskImage size],
           double v18 = vabdd_f64(v17, v14),
           maskImage = self->_maskImage,
           vabdd_f64(v16, v12) < 2.22044605e-16)
        ? (BOOL v19 = v18 < 2.22044605e-16)
        : (BOOL v19 = 0),
          !v19))
    {

      maskImage = (UIImage *)[(VUISBIconProgressView *)self _maskImage];
      self->_maskImage = maskImage;
    }
    v20 = [(UIImage *)maskImage CGImage];
    v22.origin.double x = v8;
    v22.origin.double y = v10;
    v22.size.width = v12;
    v22.size.height = v14;
    CGContextClipToMask(CurrentContext, v22, v20);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 1.0, self->_foregroundAlpha * 0.2), "set");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, fmax(self->_circleRadiusFraction * 36.0, 37.5), 0.0, 6.28318531), "fillWithBlendMode:alpha:", 17, 1.0);
  CGContextRestoreGState(CurrentContext);
}

- (void)_drawIncomingCircleWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 1.0, 0.2), "set");
  double v6 = self->_circleRadiusFraction * 36.0;
  double v7 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, v6, 0.0, 6.28318531);
  CGFloat v8 = v7;
  double v9 = 3.0;
  if (v6 <= 3.0) {
    double v9 = v6;
  }
  [v7 setLineWidth:v9];
  [v8 strokeWithBlendMode:17 alpha:1.0];
}

- (void)_drawPauseUIWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a3.x, a3.y, self->_pauseRadiusFraction * 13.0, 0.0, 6.28318531);
  [v5 addClip];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 0.0, 0.7), "set");
  [v5 fillWithBlendMode:17 alpha:1.0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 1.0, 0.2), "set");
  double v6 = y + -6.0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", x + -5.5, v6, 4.0, 12.0), "fillWithBlendMode:alpha:", 17, 1.0);
  double v7 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", x + 1.5, v6, 4.0, 12.0);
  [v7 fillWithBlendMode:17 alpha:1.0];
}

- (id)_maskImage
{
  [(VUISBIconProgressView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen"), "scale");
  CGFloat v12 = v11;
  v15.width = v8;
  v15.height = v10;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v12);
  -[UIImage drawInRect:blendMode:alpha:](self->_overlayImage, "drawInRect:blendMode:alpha:", 17, v4, v6, v8, v10, 1.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

- (CGRect)circleBoundingRect
{
  [(VUISBIconProgressView *)self bounds];
  UIRectGetCenter();
  double v3 = v2 + -39.0;
  double v5 = v4 + -39.0;
  double v6 = 78.0;
  double v7 = 78.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v3;
  return result;
}

- (VUISBIconProgressViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (VUISBIconProgressViewDelegate *)a3;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (BOOL)canAnimate
{
  return self->_canAnimate;
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
  self->_double displayedFraction = a3;
}

@end