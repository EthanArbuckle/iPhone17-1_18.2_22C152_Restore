@interface UIKBStrokeView
- (UIKBStrokeView)initWithFrame:(CGRect)a3;
- (void)addStrokePoint:(CGPoint)a3 withTimestamp:(double)a4;
- (void)drawRect:(CGRect)a3;
- (void)resetStrokePoints;
@end

@implementation UIKBStrokeView

- (UIKBStrokeView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBStrokeView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    points = v3->_points;
    v3->_points = v4;

    [(UIView *)v3 setOpaque:0];
    [(UIView *)v3 setAlpha:0.2];
    [(UIView *)v3 setUserInteractionEnabled:0];
    v6 = v3;
  }

  return v3;
}

- (void)addStrokePoint:(CGPoint)a3 withTimestamp:(double)a4
{
  v5 = -[UIKBStrokeSample initWithPoint:timestamp:]([UIKBStrokeSample alloc], "initWithPoint:timestamp:", a3.x, a3.y, a4);
  [(NSMutableArray *)self->_points addObject:v5];
  [(UIView *)self setNeedsDisplay];
}

- (void)resetStrokePoints
{
  [(NSMutableArray *)self->_points removeAllObjects];
  [(UIView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_points count] >= 2)
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v5 = 0;
    }
    else {
      v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSaveGState(v5);
    CGContextSetGrayFillColor(v5, 0.0, 0.0);
    [(UIView *)self bounds];
    CGContextFillRect(v5, v48);
    CGContextSetLineJoin(v5, kCGLineJoinRound);
    CGContextSetLineCap(v5, kCGLineCapRound);
    uint64_t SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
    double v7 = 7.5;
    uint64_t v43 = 3221225472;
    uint64_t v42 = MEMORY[0x1E4F143A8];
    v44 = __27__UIKBStrokeView_drawRect___block_invoke;
    v45 = &unk_1E52F16C0;
    if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v7 = 10.0;
    }
    v46 = self;
    double v47 = v7;
    objc_super v8 = (double (**)(void *, uint64_t))_Block_copy(&v42);
    uint64_t v9 = [(NSMutableArray *)self->_points count];
    uint64_t v10 = v9 - 1;
    if (v9 != 1)
    {
      double v11 = 0.5;
      do
      {
        v12 = [(NSMutableArray *)self->_points objectAtIndexedSubscript:v10 - 1];
        [v12 point];
        double v14 = v13;
        double v16 = v15;

        v17 = [(NSMutableArray *)self->_points objectAtIndexedSubscript:v10];
        [v17 point];
        double v19 = v18;
        double v21 = v20;

        CGContextSetRGBFillColor(v5, 0.0, 0.0, 1.0, 1.0);
        double v22 = v8[2](v8, v10 - 1);
        double v23 = v8[2](v8, v10);
        CGContextSaveGState(v5);
        double v24 = v22 * v11;
        if (v24 > 0.0)
        {
          v49.origin.x = v14 - v24;
          v49.origin.y = v16 - v24;
          v49.size.width = v24 + v24;
          v49.size.height = v24 + v24;
          CGContextAddEllipseInRect(v5, v49);
          CGContextFillPath(v5);
        }
        double v25 = v23 * 0.5;
        if (v23 * 0.5 > 0.0)
        {
          v50.origin.x = v19 - v25;
          v50.origin.y = v21 - v25;
          v50.size.width = v25 + v25;
          v50.size.height = v25 + v25;
          CGContextAddEllipseInRect(v5, v50);
          CGContextFillPath(v5);
        }
        double v26 = v21 - v16;
        double v27 = hypot(v19 - v14, v21 - v16);
        BOOL v28 = v25 <= 0.0 && v24 <= 0.0;
        if (!v28 && v27 > 0.0)
        {
          double v29 = v26 / v27;
          double v30 = -(v19 - v14) / v27;
          double v31 = v24 * (v26 / v27);
          CGFloat v32 = v14 + v31;
          CGFloat v33 = v16 + v24 * v30;
          CGFloat v34 = v14 - v31;
          CGFloat v35 = v16 - v24 * v30;
          double v36 = v25 * v29;
          CGFloat v37 = v19 + v36;
          double v38 = v25 * v30;
          CGFloat v39 = v21 + v38;
          CGFloat v40 = v19 - v36;
          CGFloat v41 = v21 - v38;
          CGContextMoveToPoint(v5, v32, v33);
          CGContextAddLineToPoint(v5, v34, v35);
          CGContextAddLineToPoint(v5, v40, v41);
          CGContextAddLineToPoint(v5, v37, v39);
          CGContextClosePath(v5);
          CGContextFillPath(v5);
        }
        CGContextRestoreGState(v5);
        --v10;
        double v11 = 0.5;
      }
      while (v10);
    }
    CGContextRestoreGState(v5);
  }
}

void __27__UIKBStrokeView_drawRect___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = a2 + 3;
  if (a2 + 3 >= [*(id *)(*(void *)(a1 + 32) + 408) count]) {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 408) count] - 1;
  }
  if (a2 <= 2) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = a2 - 3;
  }
  v6 = [*(id *)(*(void *)(a1 + 32) + 408) objectAtIndexedSubscript:v5];
  [v6 point];
  double v8 = v7;
  double v10 = v9;

  double v11 = [*(id *)(*(void *)(a1 + 32) + 408) objectAtIndexedSubscript:v4];
  [v11 point];
  double v13 = v12;
  double v15 = v14;

  double v16 = [*(id *)(*(void *)(a1 + 32) + 408) objectAtIndexedSubscript:v5];
  [v16 timestamp];

  v17 = [*(id *)(*(void *)(a1 + 32) + 408) objectAtIndexedSubscript:v4];
  [v17 timestamp];

  hypot(v13 - v8, v15 - v10);
}

- (void).cxx_destruct
{
}

@end