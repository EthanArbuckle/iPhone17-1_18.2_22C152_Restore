@interface SUICTickMarkView
+ (void)initialize;
- (CGImage)imageMask:(BOOL)a3;
- (SUICTickMarkView)init;
- (void)didMoveToSuperview;
- (void)drawRect:(CGRect)a3;
- (void)handleSafetyTimer:(id)a3;
- (void)layoutSubviews;
- (void)setHidden:(BOOL)a3;
- (void)setUpDisplayLink;
- (void)startAnimationsForTickMark:(BOOL)a3 fadeInFrames:(int64_t)a4 pauseFrames:(int64_t)a5 fadeOutFrames:(int64_t)a6 completion:(id)a7;
- (void)tearDownDisplayLink;
@end

@implementation SUICTickMarkView

+ (void)initialize
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SUICTickMarkView;
  objc_msgSendSuper2(&v6, sel_initialize);
  uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.96875 green:0.25390625 blue:0.36328125 alpha:1.0];
  v3 = (void *)__redColor;
  __redColor = v2;

  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.15625 green:0.52734375 blue:0.9921875 alpha:1.0];
  v5 = (void *)__blueColor;
  __blueColor = v4;
}

- (SUICTickMarkView)init
{
  v9.receiver = self;
  v9.super_class = (Class)SUICTickMarkView;
  uint64_t v2 = [(SUICTickMarkView *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_shown = 0;
    v2->_currentPreferredFrameRate = 3;
    v2->_animState = 0;
    v2->_currentFrame = 0;
    displayLink = v2->_displayLink;
    v2->_displayLink = 0;

    safetyTimer = v3->_safetyTimer;
    v3->_safetyTimer = 0;

    [(SUICTickMarkView *)v3 setOpaque:0];
    objc_super v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    completionLock = v3->_completionLock;
    v3->_completionLock = v6;

    [(SUICTickMarkView *)v3 setUpDisplayLink];
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.double width = width;
  v29.size.CGFloat height = height;
  CGContextClearRect(CurrentContext, v29);
  int animState = self->_animState;
  switch(animState)
  {
    case 3:
      id v24 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0 - (float)((float)self->_currentFrame / (float)self->_fadeOutFrames)];
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v24 CGColor]);
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.double width = width;
      v33.size.CGFloat height = height;
      CGContextFillRect(CurrentContext, v33);
      int64_t v26 = self->_currentFrame + 1;
      self->_currentFrame = v26;
      if (v26 == self->_fadeOutFrames)
      {
        self->_int animState = 0;
        if (self->_completionBlock)
        {
          [(NSLock *)self->_completionLock lock];
          if (self->_completionCalled)
          {
            [(NSLock *)self->_completionLock unlock];
          }
          else
          {
            self->_completionCalled = 1;
            [(NSLock *)self->_completionLock unlock];
            (*((void (**)(void))self->_completionBlock + 2))();
          }
        }
      }
      break;
    case 2:
      id v24 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v24 CGColor]);
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.double width = width;
      v34.size.CGFloat height = height;
      CGContextFillRect(CurrentContext, v34);
      int64_t v27 = self->_currentFrame + 1;
      self->_currentFrame = v27;
      if (v27 == self->_pauseFrames)
      {
        self->_int animState = 3;
        self->_currentFrame = 0;
      }
      break;
    case 1:
      float v11 = width;
      float v12 = (float)self->_currentFrame / (float)self->_fadeInFrames;
      *(float *)&double v9 = (float)(v12 + -0.4) / 0.8;
      +[SUICSigmoid sigmoid_norm:v9];
      float v14 = v13 * v11;
      *(float *)&double v15 = (float)(v12 + -0.6) / 0.3;
      +[SUICSigmoid sigmoid_norm:v15];
      float v17 = 1.0 - v16;
      *(float *)&double v18 = (float)(v12 + -0.35) / 0.6;
      +[SUICSigmoid sigmoid_norm:v18];
      float v20 = v19 * v11;
      *(float *)&double v21 = (float)(v12 + -0.3) / 0.4;
      +[SUICSigmoid sigmoid_norm:v21];
      float v23 = v22 * v11;
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[(id)__redColor CGColor]);
      v30.size.double width = v23;
      v30.origin.CGFloat x = x;
      v30.origin.CGFloat y = y;
      v30.size.CGFloat height = height;
      CGContextFillRect(CurrentContext, v30);
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[(id)__blueColor CGColor]);
      v31.size.double width = v20;
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat height = height;
      CGContextFillRect(CurrentContext, v31);
      id v24 = [MEMORY[0x1E4FB1618] colorWithRed:(float)(v17 * 0.37891) green:(float)(v17 * 0.98828) blue:(float)(v17 * 0.67578) alpha:1.0];
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v24 CGColor]);
      v32.size.double width = v14;
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat height = height;
      CGContextFillRect(CurrentContext, v32);
      int64_t v25 = self->_currentFrame + 1;
      self->_currentFrame = v25;
      if (v25 == self->_fadeInFrames)
      {
        self->_int animState = 2;
        self->_currentFrame = 0;
      }
      break;
    default:
      goto LABEL_13;
  }

LABEL_13:

  [(SUICTickMarkView *)self setNeedsDisplay];
}

- (void)startAnimationsForTickMark:(BOOL)a3 fadeInFrames:(int64_t)a4 pauseFrames:(int64_t)a5 fadeOutFrames:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  self->_fadeInFrames = a4;
  self->_pauseFrames = a5;
  self->_fadeOutFrames = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__SUICTickMarkView_startAnimationsForTickMark_fadeInFrames_pauseFrames_fadeOutFrames_completion___block_invoke;
  v14[3] = &unk_1E5C59448;
  BOOL v17 = a3;
  v14[4] = self;
  id v15 = v12;
  int64_t v16 = a4;
  id v13 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __97__SUICTickMarkView_startAnimationsForTickMark_fadeInFrames_pauseFrames_fadeOutFrames_completion___block_invoke(uint64_t a1)
{
  id v14 = [MEMORY[0x1E4F39BE8] layer];
  [*(id *)(a1 + 32) bounds];
  double Width = CGRectGetWidth(v16);
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v17));
  objc_msgSend(v14, "setContents:", objc_msgSend(*(id *)(a1 + 32), "imageMask:", *(unsigned __int8 *)(a1 + 56)));
  v3 = [*(id *)(a1 + 32) layer];
  [v3 setMask:v14];

  uint64_t v4 = v14;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v5 + 440))
  {
    *(unsigned char *)(v5 + 456) = 0;
    uint64_t v6 = MEMORY[0x1AD0BCD30](*(void *)(a1 + 40));
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 464);
    *(void *)(v7 + 464) = v6;

    *(void *)(*(void *)(a1 + 32) + 424) = 30;
    double v9 = *(void **)(a1 + 32);
    v10 = (void *)v9[51];
    if (v10)
    {
      [v10 setPreferredFramesPerSecond:v9[53]];
      double v9 = *(void **)(a1 + 32);
    }
    v9[54] = 0;
    *(_DWORD *)(*(void *)(a1 + 32) + 440) = 1;
    uint64_t v11 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_handleSafetyTimer_ selector:0 userInfo:0 repeats:(double)*(uint64_t *)(a1 + 48) * 60.0];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 448);
    *(void *)(v12 + 448) = v11;

    uint64_t v4 = v14;
  }
}

- (CGImage)imageMask:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4FB1830];
  [(SUICTickMarkView *)self bounds];
  uint64_t v5 = [v4 configurationWithPointSize:CGRectGetHeight(v10)];
  if (v3) {
    uint64_t v6 = @"checkmark";
  }
  else {
    uint64_t v6 = @"xmark";
  }
  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v6 withConfiguration:v5];
  v8 = (CGImage *)[v7 CGImage];

  return v8;
}

- (void)handleSafetyTimer:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SUICTickMarkView_handleSafetyTimer___block_invoke;
  block[3] = &unk_1E5C59470;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  [(NSTimer *)self->_safetyTimer invalidate];
  safetyTimer = self->_safetyTimer;
  self->_safetyTimer = 0;
}

uint64_t __38__SUICTickMarkView_handleSafetyTimer___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 440))
  {
    uint64_t v2 = result;
    *(_DWORD *)(v1 + 440) = 0;
    uint64_t v3 = *(void *)(result + 32);
    if (*(void *)(v3 + 464))
    {
      [*(id *)(v3 + 472) lock];
      uint64_t v4 = *(void *)(v2 + 32);
      if (*(unsigned char *)(v4 + 456))
      {
        [*(id *)(v4 + 472) unlock];
      }
      else
      {
        *(unsigned char *)(v4 + 456) = 1;
        [*(id *)(*(void *)(v2 + 32) + 472) unlock];
        (*(void (**)(void))(*(void *)(*(void *)(v2 + 32) + 464) + 16))();
      }
    }
    uint64_t v5 = *(void **)(v2 + 32);
    return [v5 setNeedsDisplay];
  }
  return result;
}

- (void)setUpDisplayLink
{
  if (!self->_displayLink)
  {
    uint64_t v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_setNeedsDisplay];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:self->_currentPreferredFrameRate];
    uint64_t v5 = self->_displayLink;
    id v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

- (void)tearDownDisplayLink
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  NSLog(&cfstr_TickmarkviewSe.isa, a2, a3);
  v7.receiver = self;
  v7.super_class = (Class)SUICTickMarkView;
  [(SUICTickMarkView *)&v7 setHidden:v3];
  if (v3)
  {
    safetyTimer = self->_safetyTimer;
    if (safetyTimer)
    {
      [(NSTimer *)safetyTimer invalidate];
      id v6 = self->_safetyTimer;
      self->_safetyTimer = 0;
    }
    self->_int animState = 0;
    [(SUICTickMarkView *)self tearDownDisplayLink];
  }
  else
  {
    [(SUICTickMarkView *)self setUpDisplayLink];
  }
}

- (void)didMoveToSuperview
{
  NSLog(&cfstr_TickmarkviewDi.isa, a2);
  BOOL v3 = [(SUICTickMarkView *)self superview];

  if (!v3)
  {
    [(SUICTickMarkView *)self tearDownDisplayLink];
  }
}

- (void)layoutSubviews
{
  NSLog(&cfstr_TickmarkviewLa.isa, a2);

  [(SUICTickMarkView *)self setUpDisplayLink];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionLock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_safetyTimer, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end