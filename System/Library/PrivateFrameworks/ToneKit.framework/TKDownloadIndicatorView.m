@interface TKDownloadIndicatorView
+ (CGSize)_intrinsicDownloadIndicatorViewSize;
- (CGSize)intrinsicContentSize;
- (TKDownloadIndicatorView)init;
- (TKDownloadIndicatorView)initWithFrame:(CGRect)a3;
- (float)progress;
- (void)_handleDisplayLinkDidFire:(id)a3;
- (void)_stopProgressAnimation;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setProgress:(float)a3;
- (void)setProgress:(float)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation TKDownloadIndicatorView

- (TKDownloadIndicatorView)init
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(id)objc_opt_class() _intrinsicDownloadIndicatorViewSize];

  return -[TKDownloadIndicatorView initWithFrame:](self, "initWithFrame:", v3, v4, v5, v6);
}

- (TKDownloadIndicatorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TKDownloadIndicatorView;
  double v3 = -[TKDownloadIndicatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(TKDownloadIndicatorView *)v3 setOpaque:0];
  }
  return v4;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TKDownloadIndicatorView;
  [(TKDownloadIndicatorView *)&v3 dealloc];
}

+ (CGSize)_intrinsicDownloadIndicatorViewSize
{
  double v2 = 20.0;
  double v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = objc_opt_class();

  [v2 _intrinsicDownloadIndicatorViewSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TKDownloadIndicatorView;
  -[TKDownloadIndicatorView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TKDownloadIndicatorView *)self setNeedsDisplay];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TKDownloadIndicatorView;
  -[TKDownloadIndicatorView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TKDownloadIndicatorView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  id v24 = [MEMORY[0x263F1C550] colorWithRed:0.56640625 green:0.56640625 blue:0.5859375 alpha:1.0];
  [v24 setFill];
  [v24 setStroke];
  double v5 = [(TKDownloadIndicatorView *)self traitCollection];
  [v5 displayScale];
  TKFloatGetSafeScaleForValue(v6);
  double v8 = v7;

  [(TKDownloadIndicatorView *)self bounds];
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  double MidX = CGRectGetMidX(v26);
  double v14 = TKFloatRoundForScale(MidX, v8);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v27);
  double v23 = TKFloatRoundForScale(MidY, v8);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v16 = CGRectGetWidth(v28) * 0.5;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v17 = CGRectGetHeight(v29) * 0.5;
  if (v16 < v17) {
    double v17 = v16;
  }
  double v18 = TKFloatFloorForScale(v17, v8);
  if (self->_isAnimatingProgress) {
    v19 = &OBJC_IVAR___TKDownloadIndicatorView__currentAnimatedProgress;
  }
  else {
    v19 = &OBJC_IVAR___TKDownloadIndicatorView__progress;
  }
  double v20 = *(float *)((char *)&self->super.super.super.isa + *v19) * 6.28318531 + -1.57079633;
  id v21 = objc_alloc_init(MEMORY[0x263F1C478]);
  objc_msgSend(v21, "moveToPoint:", v14, v23);
  objc_msgSend(v21, "addLineToPoint:", v14, 0.0);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v14, v23, v18, -1.57079633, v20);
  [v21 closePath];
  [v21 fill];
  id v22 = objc_alloc_init(MEMORY[0x263F1C478]);
  [v22 setLineWidth:1.0];
  objc_msgSend(v22, "moveToPoint:", v14, 0.0);
  objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v14, v23, v18 + -0.5, -1.57079633, 4.71238898);
  [v22 stroke];
  CGContextRestoreGState(CurrentContext);
}

- (void)setProgress:(float)a3
{
}

- (void)setProgress:(float)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double v8 = (void (**)(void))a5;
  double v9 = a3;
  if (a3 < 0.0) {
    double v9 = 0.0;
  }
  float v10 = fmin(v9, 1.0);
  float progress = self->_progress;
  CGRect v27 = v8;
  if (llroundf(progress * 8388600.0) == llroundf(v10 * 8388600.0))
  {
    if (!v8) {
      goto LABEL_23;
    }
    ((void (*)(void (**)(void)))v8[2])(v8);
  }
  else
  {
    self->_float progress = v10;
    v12 = [(TKDownloadIndicatorView *)self window];
    v13 = [v12 screen];

    if (v5 && v13)
    {
      double v14 = CACurrentMediaTime();
      self->_progressAnimationStartTime = v14;
      self->_progressAnimationEndTime = v14 + 1.2;
      if (self->_isAnimatingProgress) {
        float progress = self->_currentAnimatedProgress;
      }
      self->_initialAnimatedProgress = progress;
      self->_currentAnimatedProgress = progress;
      v15 = v27;
      if (!self->_displayLink)
      {
        double v16 = [v13 displayLinkWithTarget:self selector:sel__handleDisplayLinkDidFire_];
        displayLink = self->_displayLink;
        self->_displayLink = v16;

        double v18 = self->_displayLink;
        v19 = [MEMORY[0x263EFF9F0] mainRunLoop];
        [(CADisplayLink *)v18 addToRunLoop:v19 forMode:*MEMORY[0x263EFF588]];

        v15 = v27;
      }
      if (!self->_progressAnimationTimingFunction)
      {
        double v20 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
        progressAnimationTimingFunction = self->_progressAnimationTimingFunction;
        self->_progressAnimationTimingFunction = v20;

        v15 = v27;
      }
      if (v15)
      {
        progressAnimationCompletionHandlers = self->_progressAnimationCompletionHandlers;
        double v23 = v27;
        if (!progressAnimationCompletionHandlers)
        {
          id v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
          v25 = self->_progressAnimationCompletionHandlers;
          self->_progressAnimationCompletionHandlers = v24;

          double v23 = v27;
          progressAnimationCompletionHandlers = self->_progressAnimationCompletionHandlers;
        }
        CGRect v26 = (void *)MEMORY[0x223C781A0](v23);
        [(NSMutableArray *)progressAnimationCompletionHandlers addObject:v26];
      }
      self->_isAnimatingProgress = 1;
      [(TKDownloadIndicatorView *)self setNeedsDisplay];
    }
    else
    {
      [(TKDownloadIndicatorView *)self _stopProgressAnimation];
      [(TKDownloadIndicatorView *)self setNeedsDisplay];
      if (v27) {
        v27[2]();
      }
    }
  }
  double v8 = v27;
LABEL_23:
}

- (void)_handleDisplayLinkDidFire:(id)a3
{
  if (llround(self->_progressAnimationStartTime * 8388608.0) != llround(self->_progressAnimationEndTime * 8388608.0))
  {
    [a3 timestamp];
    float v5 = (v4 - self->_progressAnimationStartTime)
       / (self->_progressAnimationEndTime - self->_progressAnimationStartTime);
    if (v5 >= 0.99)
    {
      [(TKDownloadIndicatorView *)self _stopProgressAnimation];
    }
    else
    {
      progressAnimationTimingFunction = self->_progressAnimationTimingFunction;
      if (progressAnimationTimingFunction) {
        -[CAMediaTimingFunction _solveForInput:](progressAnimationTimingFunction, "_solveForInput:");
      }
      self->_currentAnimatedProgress = self->_initialAnimatedProgress
                                     + (float)((float)(self->_progress - self->_initialAnimatedProgress) * v5);
    }
    [(TKDownloadIndicatorView *)self setNeedsDisplay];
  }
}

- (void)_stopProgressAnimation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_isAnimatingProgress = 0;
  self->_currentAnimatedProgress = 0.0;
  self->_initialAnimatedProgress = 0.0;
  self->_progressAnimationStartTime = 0.0;
  self->_progressAnimationEndTime = 0.0;
  progressAnimationTimingFunction = self->_progressAnimationTimingFunction;
  self->_progressAnimationTimingFunction = 0;

  float v5 = (void *)[(NSMutableArray *)self->_progressAnimationCompletionHandlers copy];
  [(NSMutableArray *)self->_progressAnimationCompletionHandlers removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (float)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressAnimationTimingFunction, 0);
  objc_storeStrong((id *)&self->_progressAnimationCompletionHandlers, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end