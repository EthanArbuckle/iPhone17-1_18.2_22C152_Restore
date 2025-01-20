@interface _UIDynamicCaretInput
- (BOOL)hasInk;
- (BOOL)isInking;
- (NSTimer)fadeTimer;
- (TIHandwritingStrokes)accumulatedStrokes;
- (UIDelayedAction)committedAction;
- (_UIDynamicCaretDot)dotView;
- (_UIDynamicCaretInput)initWithFrame:(CGRect)a3;
- (double)inkWidth;
- (void)_fadeInk;
- (void)addInkPoint:(CGPoint)a3 fromLastPoint:(BOOL)a4;
- (void)addTouchAtPoint:(CGPoint)a3;
- (void)cancelTouchAtPoint:(CGPoint)a3;
- (void)clearAndNotify:(BOOL)a3;
- (void)clearFadeTimer;
- (void)committedStrokes;
- (void)dealloc;
- (void)drawPoint:(CGPoint)a3;
- (void)drawRect:(CGRect)a3;
- (void)endTouchAtPoint:(CGPoint)a3;
- (void)log;
- (void)send;
- (void)setAccumulatedStrokes:(id)a3;
- (void)setCommittedAction:(id)a3;
- (void)setDotView:(id)a3;
- (void)setFadeTimer:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)startTouchAtPoint:(CGPoint)a3;
@end

@implementation _UIDynamicCaretInput

- (_UIDynamicCaretInput)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v19[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)_UIDynamicCaretInput;
  v4 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(UIView *)v4 setOpaque:0];
    [(UIView *)v5 setUserInteractionEnabled:0];
    [(UIView *)v5 setAutoresizingMask:18];
    v6 = [[UIDelayedAction alloc] initWithTarget:v5 action:sel_committedStrokes userInfo:0 delay:2.0];
    [(_UIDynamicCaretInput *)v5 setCommittedAction:v6];

    v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v7 setName:@"gaussianBlur"];
    [v7 setValue:&unk_1ED3F26C8 forKey:@"inputRadius"];
    v19[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v9 = [(UIView *)v5 layer];
    [v9 setFilters:v8];

    double v10 = width * 0.3;
    v11 = -[_UIDynamicCaretDot initWithFrame:]([_UIDynamicCaretDot alloc], "initWithFrame:", 0.0, 0.0, v10, v10);
    [(_UIDynamicCaretInput *)v5 setDotView:v11];

    v12 = [(_UIDynamicCaretInput *)v5 dotView];
    v13 = [v12 layer];
    [v13 setCornerRadius:v10 * 0.5];

    v14 = [(_UIDynamicCaretInput *)v5 dotView];
    [v14 setAlpha:0.5];

    v15 = [(_UIDynamicCaretInput *)v5 dotView];
    [v15 setHidden:1];

    v16 = [(_UIDynamicCaretInput *)v5 dotView];
    [(UIView *)v5 addSubview:v16];
  }
  return v5;
}

- (void)dealloc
{
  CGContextRelease(self->_bitmapContext);
  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicCaretInput;
  [(UIView *)&v3 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  double width = a3.size.width;
  v10.receiver = self;
  v10.super_class = (Class)_UIDynamicCaretInput;
  -[UIView setFrame:](&v10, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(_UIDynamicCaretInput *)self dotView];
  objc_msgSend(v5, "setBounds:", 0.0, 0.0, width * 0.3, width * 0.3);

  v6 = [(_UIDynamicCaretInput *)self dotView];
  v7 = [v6 layer];
  [v7 setCornerRadius:width * 0.3 * 0.5];

  v8 = [(UIView *)self layer];
  v9 = [NSNumber numberWithDouble:width * 0.05];
  [v8 setValue:v9 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (BOOL)hasInk
{
  v2 = [(_UIDynamicCaretInput *)self accumulatedStrokes];
  BOOL v3 = [v2 numberOfStrokes] != 0;

  return v3;
}

- (BOOL)isInking
{
  v2 = [(_UIDynamicCaretInput *)self dotView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (double)inkWidth
{
  return 5.0;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  [(UIView *)self bounds];
  v4.receiver = self;
  v4.super_class = (Class)_UIDynamicCaretInput;
  -[UIView setNeedsDisplayInRect:](&v4, sel_setNeedsDisplayInRect_);
}

- (void)clearFadeTimer
{
  char v3 = [(_UIDynamicCaretInput *)self fadeTimer];
  [v3 invalidate];

  [(_UIDynamicCaretInput *)self setFadeTimer:0];
}

- (void)_fadeInk
{
  char v3 = [(_UIDynamicCaretInput *)self dotView];
  int v4 = [v3 isHidden];

  if (v4)
  {
    int64_t fadeCount = self->_fadeCount;
    self->_int64_t fadeCount = fadeCount - 1;
    if (fadeCount <= 1) {
      [(_UIDynamicCaretInput *)self clearFadeTimer];
    }
  }
  CGContextSetRGBFillColor(self->_bitmapContext, 0.13, 0.13, 0.13, 0.1);
  CGContextFillRect(self->_bitmapContext, self->_inkedAreaOfBitmapContext);
  [(UIView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  if (self->_bitmapContext)
  {
    [(UIView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v13 = 0;
    }
    else {
      v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSaveGState(v13);
    Image = CGBitmapContextCreateImage(self->_bitmapContext);
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.double width = v9;
    v16.size.height = v11;
    CGContextDrawImage(v13, v16, Image);
    CFRelease(Image);
    CGContextRestoreGState(v13);
  }
}

- (void)drawPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  bitmapContext = self->_bitmapContext;
  if (!bitmapContext)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    [(UIView *)self bounds];
    size_t v9 = (unint64_t)v8;
    [(UIView *)self bounds];
    self->_bitmapContext = CGBitmapContextCreate(0, v9, (unint64_t)v10, 8uLL, 0, DeviceRGB, 0x2002u);
    CFRelease(DeviceRGB);
    CGFloat v11 = self->_bitmapContext;
    [(UIView *)self bounds];
    CGContextClearRect(v11, v16);
    bitmapContext = self->_bitmapContext;
  }
  CGContextSetRGBFillColor(bitmapContext, 1.0, 1.0, 1.0, 1.0);
  [(_UIDynamicCaretInput *)self inkWidth];
  CGFloat v13 = x - v12;
  CGFloat v14 = y - v12;
  CGFloat v15 = v12 + v12;
  v17.origin.double x = v13;
  v17.origin.double y = v14;
  v17.size.double width = v15;
  v17.size.height = v15;
  CGContextFillEllipseInRect(self->_bitmapContext, v17);
  v18.origin.double x = v13;
  v18.origin.double y = v14;
  v18.size.double width = v15;
  v18.size.height = v15;
  self->_inkedAreaOfBitmapContext = NSUnionRect(self->_inkedAreaOfBitmapContext, v18);
}

- (void)log
{
  id v17 = [(_UIDynamicCaretInput *)self accumulatedStrokes];
  if ([v17 numberOfStrokes])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v2 setDateFormat:@"%Y-%m-%d-%H%M%S"];
    char v3 = [MEMORY[0x1E4F1C9C8] date];
    double v4 = [v2 stringFromDate:v3];

    if (geteuid())
    {
      NSHomeDirectory();
      CGFloat v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CGFloat v5 = &stru_1ED0E84C0;
    }
    double v6 = [(__CFString *)v5 stringByAppendingPathComponent:@"/Library/Logs/CrashReporter/HandwritingCapture/"];

    CGFloat v7 = [NSString stringWithFormat:@"Capture_%@.log", v4];
    double v8 = [v6 stringByAppendingPathComponent:v7];

    id v9 = v8;
    double v10 = fopen((const char *)[v9 UTF8String], "w+");
    if (v10
      || *__error() == 2
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          CGFloat v15 = objc_claimAutoreleasedReturnValue(),
          v16 = [v15 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0], v15, v16)&& (double v10 = fopen((const char *)objc_msgSend(v9, "UTF8String"), "w+")) != 0)
    {
      if ([v17 numberOfStrokes])
      {
        unint64_t v11 = 0;
        do
        {
          if ([v17 numberOfPointsInStrokeAtIndex:v11])
          {
            unint64_t v12 = 0;
            do
            {
              [v17 pointAtIndex:v12 inStrokeAtIndex:v11];
              fprintf(v10, "%d %d\n", (int)v13, (int)v14);
              ++v12;
            }
            while (v12 < [v17 numberOfPointsInStrokeAtIndex:v11]);
          }
          fwrite(";\n", 2uLL, 1uLL, v10);
          ++v11;
        }
        while (v11 < [v17 numberOfStrokes]);
      }
      fclose(v10);
    }
  }
}

- (void)committedStrokes
{
  [(_UIDynamicCaretInput *)self send];
  [(_UIDynamicCaretInput *)self clearAndNotify:1];
}

- (void)clearAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FAE2B8]);
  [(_UIDynamicCaretInput *)self setAccumulatedStrokes:v5];

  [(_UIDynamicCaretInput *)self clearFadeTimer];
  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    [(UIView *)self bounds];
    CGContextClearRect(bitmapContext, v10);
    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_inkedAreaOfBitmapContext.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_inkedAreaOfBitmapContext.size = v7;
    [(UIView *)self setNeedsDisplay];
  }
  [(UIView *)self setNeedsDisplay];
  if (v3)
  {
    id v8 = +[UIKeyboardImpl activeInstance];
    [v8 clearInput];
  }
}

- (void)send
{
  BOOL v3 = [(_UIDynamicCaretInput *)self accumulatedStrokes];
  uint64_t v4 = [v3 numberOfStrokes];

  if (v4)
  {
    id v6 = +[UIKeyboardImpl activeInstance];
    id v5 = [(_UIDynamicCaretInput *)self accumulatedStrokes];
    [v6 addInputObject:v5];
  }
}

- (void)addInkPoint:(CGPoint)a3 fromLastPoint:(BOOL)a4
{
  BOOL v4 = a4;
  double x = a3.x;
  double y = a3.y;
  id v6 = [(_UIDynamicCaretInput *)self accumulatedStrokes];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FAE2B8]);
    [(_UIDynamicCaretInput *)self setAccumulatedStrokes:v7];
  }
  id v8 = [(_UIDynamicCaretInput *)self accumulatedStrokes];
  objc_msgSend(v8, "addPoint:", x, y);

  if (v4)
  {
    float v9 = sqrt((x - self->_lastViewLoc.x) * (x - self->_lastViewLoc.x)+ (y - self->_lastViewLoc.y) * (y - self->_lastViewLoc.y));
    CGFloat v10 = y;
    *(double *)&long long v11 = x;
    if (v9 <= 0.0) {
      goto LABEL_10;
    }
    *((double *)&v11 + 1) = y;
    float64x2_t v16 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v9), 0);
    *(_OWORD *)id v17 = v11;
    int v12 = 1;
    do
    {
      [(_UIDynamicCaretInput *)self drawPoint:vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64((float64x2_t)self->_lastViewLoc, vdivq_f64(vmulq_n_f64(vsubq_f64(*(float64x2_t *)v17, (float64x2_t)self->_lastViewLoc), (double)(v12 - 1)), v16))))];
      float v13 = (float)v12++;
    }
    while (v13 < v9);
  }
  else
  {
    -[_UIDynamicCaretInput drawPoint:](self, "drawPoint:", x, y);
  }
  *(double *)&long long v11 = x;
  CGFloat v10 = y;
LABEL_10:
  *(void *)&self->_lastViewLoc.double x = v11;
  self->_lastViewLoc.double y = v10;
  NSRect v18 = [(_UIDynamicCaretInput *)self committedAction];
  [v18 touch];
}

- (void)startTouchAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(_UIDynamicCaretInput *)self dotView];
  [v6 setHidden:0];

  id v7 = [(_UIDynamicCaretInput *)self dotView];
  objc_msgSend(v7, "setPosition:", x, y);

  -[_UIDynamicCaretInput addInkPoint:fromLastPoint:](self, "addInkPoint:fromLastPoint:", 0, x, y);
  id v8 = [(_UIDynamicCaretInput *)self fadeTimer];

  if (!v8)
  {
    float v9 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__fadeInk selector:0 userInfo:1 repeats:0.0333333333];
    [(_UIDynamicCaretInput *)self setFadeTimer:v9];

    id v11 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    CGFloat v10 = [(_UIDynamicCaretInput *)self fadeTimer];
    [v11 addTimer:v10 forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

- (void)addTouchAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ((a3.x - self->_lastViewLoc.x) * (a3.x - self->_lastViewLoc.x)
     + (a3.y - self->_lastViewLoc.y) * (a3.y - self->_lastViewLoc.y) > 0.25)
    -[_UIDynamicCaretInput addInkPoint:fromLastPoint:](self, "addInkPoint:fromLastPoint:", 1, a3.x, a3.y);
  id v6 = [(_UIDynamicCaretInput *)self dotView];
  objc_msgSend(v6, "setPosition:", x, y);
}

- (void)endTouchAtPoint:(CGPoint)a3
{
  BOOL v4 = [(_UIDynamicCaretInput *)self dotView];
  char v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    id v6 = [(_UIDynamicCaretInput *)self dotView];
    [v6 setHidden:1];

    self->_int64_t fadeCount = 30;
    [(UIView *)self setNeedsDisplay];
    [(_UIDynamicCaretInput *)self committedStrokes];
    id v7 = [(_UIDynamicCaretInput *)self committedAction];
    [v7 cancel];
  }
}

- (void)cancelTouchAtPoint:(CGPoint)a3
{
  -[_UIDynamicCaretInput endTouchAtPoint:](self, "endTouchAtPoint:", a3.x, a3.y);
  [(_UIDynamicCaretInput *)self clearAndNotify:1];
}

- (NSTimer)fadeTimer
{
  return self->_fadeTimer;
}

- (void)setFadeTimer:(id)a3
{
}

- (TIHandwritingStrokes)accumulatedStrokes
{
  return self->_accumulatedStrokes;
}

- (void)setAccumulatedStrokes:(id)a3
{
}

- (UIDelayedAction)committedAction
{
  return self->_committedAction;
}

- (void)setCommittedAction:(id)a3
{
}

- (_UIDynamicCaretDot)dotView
{
  return self->_dotView;
}

- (void)setDotView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotView, 0);
  objc_storeStrong((id *)&self->_committedAction, 0);
  objc_storeStrong((id *)&self->_accumulatedStrokes, 0);
  objc_storeStrong((id *)&self->_fadeTimer, 0);
}

@end